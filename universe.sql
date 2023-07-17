--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_light_years integer,
    distance_light_years integer,
    type_of_galaxy character varying(60)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    year_discovered integer,
    diameter_in_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_billion numeric(4,3),
    planet_description text,
    has_life boolean,
    has_moon boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    star_types_id integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: star_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_types (
    star_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.star_types OWNER TO freecodecamp;

--
-- Name: star_types_star_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_types_star_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_types_star_types_id_seq OWNER TO freecodecamp;

--
-- Name: star_types_star_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_types_star_types_id_seq OWNED BY public.star_types.star_types_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_types star_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types ALTER COLUMN star_types_id SET DEFAULT nextval('public.star_types_star_types_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 0, 'spiral');
INSERT INTO public.galaxy VALUES (2, 'LMC', 14000, 158000, 'magellanic spiral');
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 220000, 2500000, 'spiral');
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', 37000, 11500000, 'starburst');
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 170000, 20870000, 'face-on spiral');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 60000, 30000000, 'spiral');
INSERT INTO public.galaxy VALUES (7, 'NGC 1300', 110000, 61000000, 'barred spiral');
INSERT INTO public.galaxy VALUES (8, 'Hoags Object', 100000, 600000000, 'ring');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth Moon', 3, 1609, 1740);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 1877, 27);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1877, 15);
INSERT INTO public.moon VALUES (4, 'Callisto', 5, 1610, 15144);
INSERT INTO public.moon VALUES (5, 'Dia', 5, 2000, 2);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 1996, 2631);
INSERT INTO public.moon VALUES (7, 'Europa', 5, 1610, 3100);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 1892, 83);
INSERT INTO public.moon VALUES (9, 'Carme', 5, 1938, 23);
INSERT INTO public.moon VALUES (10, 'Eupheme', 5, 2003, 1);
INSERT INTO public.moon VALUES (11, 'Calypso', 6, 1980, 10);
INSERT INTO public.moon VALUES (12, 'Pandora', 6, 1980, 80);
INSERT INTO public.moon VALUES (13, 'Atlas', 6, 1980, 30);
INSERT INTO public.moon VALUES (14, 'Narvi', 6, 2003, 7);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 1851, 1160);
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 1787, 1523);
INSERT INTO public.moon VALUES (17, 'Ophelia', 7, 1986, 42);
INSERT INTO public.moon VALUES (18, 'Rosalind', 7, 1986, 72);
INSERT INTO public.moon VALUES (19, 'Triton', 8, 1846, 2700);
INSERT INTO public.moon VALUES (20, 'Proteus', 8, 1989, 420);
INSERT INTO public.moon VALUES (21, 'Charon', 9, 1978, 1212);
INSERT INTO public.moon VALUES (22, 'Nix', 9, 2005, 49);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4.503, 'second densest planet', false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4.503, 'second planet from the sun', false, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 4.503, 'rocky, terrestrial planet', true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4.503, 'dry, rocky and bitter cold', false, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4.565, 'covered in swirling cloud stripes', false, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 4.543, 'one of two ice giants in the outer solar system', false, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4.543, 'one of two ice giants', false, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 4.543, 'massive ball made mostly of helium and hydrogen', false, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 4.600, 'dwarf planet', false, true, 1);
INSERT INTO public.planet VALUES (10, '14 Andromedae b', NULL, 'a giant planet composed mainly of gas', false, NULL, 8);
INSERT INTO public.planet VALUES (11, 'WASP-103 b', 4.000, 'giant planet composed mainly of gas', false, NULL, 7);
INSERT INTO public.planet VALUES (12, '14 Herculis b', 3.600, 'it is a giant planet composed mainly of gas', false, NULL, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'brightest star in the night sky', 1, 1);
INSERT INTO public.star VALUES (2, 'Arcturus', 'brightest star in the northern constellation of Bootes', 2, 1);
INSERT INTO public.star VALUES (3, 'LP 145-141', 'solitary white dwarf', 3, 1);
INSERT INTO public.star VALUES (4, 'RX J1856.5-3754', 'neutron star in the constellation Corona Australis', 4, 1);
INSERT INTO public.star VALUES (5, 'Beta Andromedae', 'prominent star in the northern constellation of Andromeda', 2, 3);
INSERT INTO public.star VALUES (6, 'Lacaille 8760', 'one of the nearest stars to the sun', 5, 1);
INSERT INTO public.star VALUES (7, 'WASP-103', 'F-type main sequence star', 1, 1);
INSERT INTO public.star VALUES (8, '14 Andromedae', 'located in the northen constellation of Andromeda', 2, 3);
INSERT INTO public.star VALUES (9, '14 Herculis', 'g-type star', 5, 1);


--
-- Data for Name: star_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_types VALUES (1, 'Main Sequence Stars', 'They range in luminosity, color, and size. They make up around 90% of the universe stellar population');
INSERT INTO public.star_types VALUES (2, 'Red Giants', 'It appears more orange than red');
INSERT INTO public.star_types VALUES (3, 'White Dwarfs', 'They can emit visible light that ranges from blue white to red');
INSERT INTO public.star_types VALUES (4, 'Neutron Stars', 'A neutron star forms when a main sequence star with between eight and 20 times the mass of the sun runs out of hydrogen in its core');
INSERT INTO public.star_types VALUES (5, 'Red Dwarfs', 'Smallest main sequence stars');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 47, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: star_types_star_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_types_star_types_id_seq', 5, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_description_key UNIQUE (planet_description);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_types star_type_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types
    ADD CONSTRAINT star_type_name UNIQUE (name);


--
-- Name: star_types star_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types
    ADD CONSTRAINT star_types_name_key UNIQUE (name);


--
-- Name: star_types star_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types
    ADD CONSTRAINT star_types_pkey PRIMARY KEY (star_types_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_star_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_types_id_fkey FOREIGN KEY (star_types_id) REFERENCES public.star_types(star_types_id);


--
-- PostgreSQL database dump complete
--

