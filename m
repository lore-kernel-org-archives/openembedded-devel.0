Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Kp8ZY-0004O5-U8
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Oct 2008 23:33:56 +0200
Received: from e179002109.adsl.alicedsl.de ([85.179.2.109] helo=tamarin.local)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Kp8Um-0006Sp-1B
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Oct 2008 23:29:00 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Oct 2008 14:47:56 +0200
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200810111447.57212.zecke@selfish.org>
Subject: Final call for updating the name mapping script
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 12 Oct 2008 21:33:57 -0000
X-Groupsio-MsgNum: 6170
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_9BK8IAnz54iC0fi"

--Boundary-00=_9BK8IAnz54iC0fi
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey,

thanks to the work of Jan we have a fixed conversion script. Thanks to 
Laibsch, Richard and others we have a rather complete mapping from keyname 
and --author to realname and mail address.

However many of the OE and NSLu2 keynames have no proper mapping to any mail 
address. For OE I have mapped that keyname@unknown.openembedded.org and for 
nslu2 to keyname@nslu2-linux.org.

There are also some author names without realname or mail address, and some 
real names without mail address, they got mapped to 
name.unknown@unknown.openembedded.org.

Patches welcome. Please send the output as diff -U 0... Otherwise this will be 
the list of mappings we use for the conversion.

z.


--Boundary-00=_9BK8IAnz54iC0fi
Content-Type: application/x-python;
  name="email.py"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="email.py"

#!/usr/bin/python
# -*- coding: UTF-8 -*-
# Simple map from realname to...
# realname : ([keynames], "email address")

all_names =3D {
    "Alan Carvalho de Assis"  : (["acassis@gmail.com"], "acassis@gmail.com"=
),
    "Alessandro Gardich" : (["gremlin@gremlin.it"], "gremlin@gremlin.it"),
    "Alessandro Iurlano" : (["Alessandro Iurlano alessandro.iurlano@gmail.c=
om", "alessandro.iurlano@gmail.com"], "alessandro.iurlano@gmail.com"),
    "Alexander Hanff"    : (["core.ldf@gmail.com"], "core.ldf@gmail.com"),
    "Alexis Maldonado "  : (["Alexis Maldonado <maldonad@cs.tum.edu>"], "ma=
ldonad@cs.tum.edu"),
    "Alex Lange"         : (["Alex Lange"], "chicken@handhelds.org"),
    "Alex Osborne"       : (["Alex Osborne"], "alex.osborne.unknown@unknown=
.openembedded.org"),
    "Andrea Adami"       : (["andrea.adami@gmail.com"], "andrea.adami@gmail=
.com"),
    "Andrew Paulsen"     : (["andrew.paulsen@gmail.com"], "andrew.paulsen@g=
mail.com"),
    "Andrew Wilcox"      : (["awilcox@openembedded.org"], "awilcox@unknown.=
openembedded.org"),
    "Angus Ainslie"      : (["angus@handheldshell.com"], "angus@handheldshe=
ll.com"),
    "Antonio ospite"     : (["ospite@studenti.unina.it"], "ospite@studenti.=
unina.it"),
    "Antti Andreimann"   : (["antti.andreimann@mail.ee", "mailto:antti.andr=
eimann@mail.ee"], "antti.andreimann@mail.ee"),
    "Bastian Ballmann"   : (["balle@chaostal.de", "Bastian Ballmann <balle@=
chaostal.de>"], "balle@chaostal.de"),
    "Bernhard Guillon"   : (["Bernhard.Guillon@opensimpad.org", "Bernhard G=
uillon <Bernhard.Guillon@opensimpad.org>", "Bernhard Guillon <Bernhard.Guil=
lon@opensimpad.org> - close #1874"], "Bernhard.Guillon@opensimpad.org"),
    "Bernhard Rosenkraenzer" : (["bero@arklinux.org"], "bero@arklinux.org")=
,
    "Bignaux Ronan"      : (["ronan@aimao.org"], "ronan@aimao.org"),
    "Carsten Schneider"  : (["Carsten Schneider <zcarsten@gmx.net>"], "zcar=
sten@gmx.net"),
    "Chia-I Wu"          : (["olvaffe@gmail.com"], "olvaffe@gmail.com"),
    "Chris Larson"       : (["clarson@kergoth.com"], "clarson@kergoth.com")=
,
    "Chris Lord"         : (["Cwiiis"], "chris@openedhand.com"),
    "Clement Hermann"    : (["clement.hermann@free.fr"], "clement.hermann@f=
ree.fr"),
    "Cliff Brake"        : (["cbrake@openembedded.org"], "cbrake@bec-system=
s.com"),
    "Craig Hughes"       : (["craig@gumstix.com"], "craig@gumstix.com"),
    "Cyril Romain"       : (["c.romain@laposte.net", "CyrilRomain", "Cyril =
Romain", "cyril Romain <c.romain@laposte.net>", "Cyril Romain <c.romain@lap=
oste.net>", "cyril.romain@gmail.com", "cyril.romain@laposte.net"], "cyril.r=
omain@laposte.net"),
    "Dan Williams"       : (["Dan Williams <dan.j.williams@gmail.com>"], "d=
an.j.williams@gmail.com"),
    "David Karlstrom"    : (["daka@nslu2-linux.org", "daka@thg.se"], "daka@=
thg.se"),
    "Derek Young"        : (["dyoung@nslu2-linux.org"], "dyoung@nslu2-linux=
.org"),
    "Dirk Opfer"         : (["dirk@openembedded.org"], "dirk@unknown.openem=
bedded.org"),
    "Dmitry Artamonow"   : (["DmitryArtamonow", "mad_soft@inbox.ru"], "mad_=
soft@inbox.ru"),
    "Dmitry Baryshkov"   : (["Dmitry Baryshkov <dbaryshkov@gmail.com>", "db=
aryshkov@gmail.com"], "dbaryshkov@gmail.com"),
    "Dojii Seketeli"     : (["dodji@openedhand.com"], "dodji@openedhand.com=
"),
    "Erik Hovland"       : (["erik@openembedded.org", "erik@hovland.org"], =
"erik@hovland.org"),
    "Esben Haabendal"    : (["eha@doredevelopment.dk"], "eha@doredevelopmen=
t.dk"),
    "Fabrice Aeschbacher": (["Fabrice.Aeschbacher@siemens.com"], "Fabrice.A=
eschbacher@siemens.com"),
    "Felix Domke"        : (["tmbinc@openembedded.org"], "tmbinc@unknown.op=
enembedded.org"),
    "Florian Boor"       : (["florian@openembedded.org"], "florian.boor@ker=
nelconcepts.de"),
    "Geoffrey Wossum"    : (["gwossum", "gwossum@acm.org", "geoffrey.wossum=
"], "gwossum@acm.org"),
    "Graeme Gregory"     : (["dp@xora.org.uk", "xora@openembedded.org"], "d=
p@xora.org.uk"),
    "Grzegorz Ratajczak" : (["McGregor <mcgregor@blackmesaeast.com.pl>"], "=
mcgregor@blackmesaeast.com.pl"),
    "Harald Welte"       : (["laforge@openmoko.org"], "laforge@openmoko.org=
"),
    "Henning Heinold"    : (["woglinde", "woglinde@openembedded.org", "wogl=
inde2@openembedded.org"], "heinold@inf.fu-berlin.de"),
    "Henryk Ploetz"      : (["henryk@openembedded.org", "henryk@openmoko.or=
g", "henryk.ploetz"], "henryk@openmoko.org"),
    "Henry von Tresckow" : (["hvontres@gmail.com", "hvontres"], "hvontres@g=
mail.com"),
    "Holger Freyther"    : (["freyther@openembedded.org", "zecke@selfish.or=
g"], "zecke@selfish.org"),
    "Holger Schurig"     : (["schurig@openembedded.org", "hs4233@mail.mn-so=
lutions.de"], "schurig@mn-solutions.de"),
    "Jake Morrison"      : (["Jake MORRISON", "Jake Morrison <jake@cogini.c=
om>", "Jake MORRISON <jake@cogini.com>"], "jake@cogini.com"),
    "Jamie Lenehan"      : (["lenehan@openembedded.org", "lenehan@twibble.o=
rg"], "lenehan@twibble.org"),
    "Jan L=C3=BCbbe"          : (["jluebbe@lasnet.de", "jluebbe@openembedde=
d.org"], "jluebbe@debian.org"),
    "Jeremy Laine"       : (["jemery_laine", "Jereme_Laine", "Jeremy_Laine"=
, "jeremy.laine@m4x.org", "jeremy_laine@openembedded.org", "jeremy_laine"],=
 "jeremy.laine@m4x.org"),
    "Jeroen Hoek"        : (["Jeroen Hoek"], "Jeroen.Hoek.unknown@unknown.o=
penembedded.org"),
    "Joaquim Duran"      : (["Joaquim Duran <joaquinduran@adtelecom.es>", "=
joaquinduran@adtelecom.es"], "joaquinduran@adtelecom.es"),
    "John Bowler"        : (["jbowler@nslu2-linux.org"], "jbowler@nslu2-lin=
ux.org"),
    "John Lee"           : (["john_lee@openembedded.org", "john_lee@openmok=
o.com"], "john_lee@openmoko.org"),
    "Jonathan McDowell"  : (["noodles@openembedded.org"], "noodles@earth.li=
"),
    "Jos=C3=A9 Bernardo de Bandos Rodrigues da Silva" : (["jbs@bandos.homel=
inux.com"], "jbs.bandos.homelinux.com"),
    "Junqian Gordon Xu"  : (["xjqian@gmail.com", "xjqian@openembedded.org"]=
, "xjqian@gmail.com"),
    "Justin Patrin"      : (["justinp@openembedded.org"], "justinp@unknown.=
openembedded.org"),
    "Kalev Lember"       : (["kalev@smartlink.ee"], "kalev@smartlink.ee"),
    "Karol Sokolowski"   : (["Karol Sokolowski <sokoowpwr@o2.pl>"], "sokoow=
pwr@o2.pl"),
    "Khem Raj"           : (["khem@openembedded.org", "KhemRaj", "raj.khem@=
gmail.com"], "raj.khem@gmail.com"),
    "Koen Kooi"          : (["koen@openembedded.org"], "koen@openembedded.o=
rg"),
    "Kristoffer Ericson" : (["kristoffer@openembedded.org"], "kristoffer@un=
known.openembedded.org"),
    "Leon Woestenberg"   : (["likewise@gmx.net", "likewise@openembedded.org=
"], "likewise@gmx.net"),
    "Leon Zhang"         : (["Leon Zhang"], "Leon.Zhang.unknown@unknown.ope=
nembedded.org"),
    "Liam Girdwood"      : (["lrg@openembedded.org"], "liam.girdwood@wolfso=
nmicro.com"),
    "Lukas Gorris"       : (["Lukas Gorris", "lukas.gorris@gmx.de"], "lukas=
.gorris@gmx.de"),
    "Manuel Teira"       : (["Manuel Teira <manuel.teira@telefonica.net>", =
"manuel.teira@telefonica.net", "sirfred@openembedded.org"], "manuel.teira@t=
elefonica.net"),
    "Marcin Juszkiewicz" : (["Marcin", "Marcin Juszkiewicz <openembedded@hr=
w.one.pl>", "Marcin Juzkiewicz <hrw@openembedded.org>", "hrw@openedhand.com=
", "hrw@openembedded.org"], "openembedded@hrw.one.pl"),
    "Marek Vasut"        : (["MarekVasut", "marek.vasut@gmail.com", "Marek =
Vasut <marek.vasut@gmail.com>", "Marek Va=C5=A1ut <marek.vasut@gmail.com>"]=
, "marek.vasut@gmail.com"),
    "Martin Dietze"      : (["MartinDietze@openembedded.org"], "martin.diet=
ze@unknown.openembedded.org"),
    "Matthias Hentges"   : (["coredump2@openembedded.org", "coredump@openem=
bedded.org"], "coredump@unknown.openembedded.org"),
    "Matt Reimer"        : (["mreimer@openembedded.org"], "mreimer@unknown.=
openembedded.org"),
    "Michael-Luke Jones" : (["blaster8@nslu2-linux.org"], "mlj28@cam.ac.uk"=
),
    "Michael Krelin"     : (["polyonymous", "polyonymous@klever.net", "poly=
onymous@openembedded.org"], "hacker@klever.net"),
    "Michael Lauer"      : (["mickeyl", "mickeyl@openembedded.org"], "micke=
yl@unknown.openembedded.org"),
    "Michal Panczyk"     : (["mpanczyk@gmail.com"], "mpanczyk@gmail.com"),
    "Mike Montour"       : (["mail@mmontour.net"], "mail@mmontour.net"),
    "Mike Westerhof"     : (["mwester@openembedded.org", "mwester@wraith"],=
 "mwester@dls.net"),
    "Mustafa Yuecel"     : (["yuecelm@nslu2-linux.org", "yuecelm@openembedd=
ed.org"], "yuecelm@ee.ethz.ch"),
    "Nicholas Ferre"     : (["nicolas.ferre@atmel.com", "nicolas.ferre@rfo.=
atmel.com", "nicolasfr@gmail.com"], "nicolasfr@gmail.com"),
    "Oliver Fels"        : (["oliver.fels@gmx.net", "Oliver Fels <oliver.fe=
ls@gmx.net>"], "oliver.fels@gmx.net"),
    "Ondrej Sokol"       : (["Ondrej Sokol <o.sokol@seznam.cz>"], "o.sokol@=
seznam.cz"),
    "Otavio Salvador"    : (["otavio@ossystems.com.br", "Otavio Salvador <o=
tavio@debian.org>", "Otavio Salvador <otavio@ossystems.com.br>"], "otavio@o=
ssystems.com.br"),
    "Ovidiu Sas"         : (["osas@nslu2-linux.org"], "sip.nslu@gmail.com")=
,
    "Oyvind Repvik"      : (["nail@nslu2-linux.org", "oyvind@repvik.org"], =
"nail@nslu2-linux.org"),
    "Patrik Gfeller"     : (["Patrik Gfeller <gfellerpatrik@gmx.net>", "gfe=
llerpatrik@gmx.net"], "gfellerpatrik@gmx.net"),
    "Patrick Ohly"       : (["pohly@openembedded.org"], "pohly@unknown.open=
embedded.org"),
    "Patrick Steiner"    : (["law@a1.net", "law@openembedded.org", "Patrick=
 Steiner <law@a1.net>", "Patrick Steiner <patrick.steiner@a1.net>"], "law@a=
1.net"),
    "Paul Eggleton"      : (["bluelightning", "bluelightning@bluelightning.=
org", "bluelightning@openembedded.org", "Paul Eggleton"], "bluelightning@bl=
uelightning.org"),
    "Paul Sokolovsky"    : (["pfalcon@openembedded.org", "pmiscml@gmail.com=
"], "pmiscml@gmail.com"),
    "Petr Stetiar"       : (["ynezz@true.cz", "Petr=C5=A0tetiar"], "ynezz@t=
rue.cz"),
    "Philippe De Swert"  : (["philippe@openembedded.org"], "philippe@unknow=
n.openembedded.org"),
    "Philipp Zabel"      : (["ph5@openembedded.org", "pH5@openembedded.org"=
], "philipp.zabel@gmail.com"),
    "Philip Balister"    : (["crofton@openembedded.org"], "crofton@unknown.=
openembedded.org"),
    "Phil Blundell"      : (["pb@openembedded.org"], "pb@unknown.openembedd=
ed.org"),
    "Raymond Danks"      : (["raymond@edanks.com"], "raymond@edanks.com"),
    "Rene Wagner"        : (["rw@openembedded.org"], "rw@unknown.openembedd=
ed.org"),
    "Richard Purdie"     : (["rpurdie@openembedded.org", "rpurdie@rpsys.net=
"], "rpurdie@rpsys.net"),
    "Rick Farina"        : (["Zero_Chaos", "Zero_Chaos <sidhayn@hotmail.com=
>"], "sidhayn@hotmail.com"),
    "Robert Demski"      : (["Robert Demski <Robert.Demski@wp.pl>"], "Rober=
t.Demski@wp.pl"),
    "Robert Schuster"    : (["thebohemian@openembedded.org", "thebohemian2@=
openembedded.org", "thebohemian@gmx.net", "theBohemian@gmx.net"], "thebohem=
ian@gmx.net"),
    "Rodrigo Vivi"       : (["rodrigo.vivi@gmail.com", "rodrigo.vivi@openem=
bedded.org"], "rodrigo.vivi@gmail.com"),
    "Rod Whitby"         : (["rwhitby@nslu2-linux.org", "nslu2-linux@nslu2-=
linux.org"], "rod@whitby.id.au"),
    "Rolf Leggewie"      : (["Rolf Leggewie <bugs.openembedded.org@rolf.leg=
gewie.biz>", "bugs.openembedded.org@rolf.leggewie.biz", "Laibsch@openembedd=
ed.org"], "oe-devel@rolf.leggewie.biz"),
    "Roman Moravcik"     : (["roman.moravcik@gmail.com"], "roman.moravcik@g=
mail.com"),
    "Russ Ferriday"      : (["russf@topia.com"], "russf@topia.com"),
    "Sergey Lapin"       : (["Sergey Lapin <slapinid@gmail.com>", "slapin",=
 "slapinid@gmail.com", "slapin@openembedded.org"], "slapinid@gmail.com"),
    "Shane Volpe"        : (["Shane Volpe", "shanevolpe@gmail.com", "Shane =
Volpe <shanevolpe@gmail.com>", "svolpe@openembedded.org"], "shanevolpe@gmai=
l.com"),
    "Simon Vogl"         : (["simon.vogl@researchstudio.at", "vogl@soft.uni=
-linz.ac.at"], "vogl@soft.uni-linz.ac.at"),
    "S=C3=B6ren Apel"         : (["abraxa_", "abraxa@dar-clan.de"], "abraxa=
@dar-clan.de"),
    "Stanislav Brabec"   : (["utx@openembedded.org", "utx@penguin.cz", "Sta=
nislav Brabec <utx@penguin.cz>"], "utx@penguin.cz"),
    "Stefan Schmidt"     : (["stefan@openembedded.org", "Stefan Schmidt"], =
"stefan@openmoko.org"),
    "Stelios Koroneos"   : (["ifaistos@openembedded.org"], "skoroneos@digit=
al-opsis.com"),
    "Stepan Backshaev"   : (["Stepan Backshaev <step2back@gmail.com>"], "st=
ep2back@gmail.com"),
    "Steve Sakoman"      : (["sakoman@gmail.com", "steve@sakoman.com"], "st=
eve@sakoman.com"),
    "Thomas Kunze"       : (["thesing", "thesing@openembedded.org", "Thomas=
 Kunze <thesing>", "Thomas Kunze <thommycheck@gmx.de>", "Thomas Kunze <thom=
my@tabao.de>", "thommy@tabao.de"], "thommycheck@gmx.de"),
    "Thomas Wood"        : (["thomas@openedhand.com"],"thomas@openedhand.co=
m"),
    "Tim Ellis"          : (["tim.ellis@mac.com"], "tim.ellis@mac.com"),
    "Todd Blumer"        : (["todd@openembedded.org", "todd@sdgsystems.com"=
], "todd@sdgsystems.com"),
    "Tom Kirkpatrick"    : (["Tom Kirkpatrck", "stv@kirkconsulting.co.uk", =
"Tom Kirkpatrick <stv@kirkconsulting.co.uk>"], "stv@kirkconsulting.co.uk"),
    "Tom Rini"           : (["TomRini", "Tom Rini", "trini@embeddedalley.co=
m"], "trini@embeddedalley.com"),
    "Tom Walsh"          : (["Tom Walsh <tom@openhardware.net>"], "tom@open=
hardware.net"),
    "Valentin Longchamp" : (["valentin.longchamp@epfl.ch"], "valentin.longc=
hamp@epfl.ch"),
    "Yin Kangkai"        : (["arfankai@gmail.com"], "arfankai@gmail.com"),
    "Giorgio Padrin"     : (["Giorgio Padrin <giorgio@mandarinlogiq.org>"],=
 "giorgio@mandarinlogiq.org"),
    "Jorik Jonker"       : (["jorik@kippendief.biz"], "jorik@kippendief.biz=
"),
    "Sergey Bostandzhyan": (["jin@mediatomb.cc", "jin@mediatomb.org"], "jin=
@mediatomb.org"),
    "Tim Sander"         : (["oe@iss.tu-darmstadt.de"], "oe@iss.tu-darmstad=
t.de"),
    "Adrian Davey"       : (["ade@openembedded.org"], "ade@unknown.openembe=
dded.org"),
    "Arjan Schrijver"    : (["arjan@openembedded.org"], "arjan@unknown.open=
embedded.org"),
    "Bruno Randolf"      : (["br1@openembedded.org"], "br1@unknown.openembe=
dded.org"),
    "Mark Brown"         : (["broonie@sirena.org.uk", "broonie"], "broonie@=
sirena.org.uk"),
    "Clark Wixon"        : (["cwixon@usa.net"], "cwixon@usa.net"),
    "Daniel Willmann"    : (["daniel@openembedded.org", "daniel@totalueberw=
achung.de"], "daniel@totalueberwachung.de"),
    "Helge Deller"       : (["deller@gmx.de"], "deller@gmx.de"),
    "Frans Meulenbroeks" : (["eFfeM@openembedded.org"], "effem@unknown.open=
embedded.org"),
    "Nicolas Ferre"      : (["Enodr <nicolasfr@gmail.com>"], "nicolasfr@gma=
il.com"),
    "Frederic Bompart"   : (["frederic@openembedded.org"], "frederic@unknow=
n.openembedded.org"),
    "Joseph Cole"        : (["jnc@openembedded.org"], "jnc@unknown.openembe=
dded.org"),
    "Tom King"           : (["ka6sox@nslu2-linux.org"], "ka6sox@nslu2-linux=
.org"),
    "MIka Laitio"        : (["lamikr@openembedded.org"], "lamikr@unknown.op=
enembedded.org"),
    "Matthias Goebl"     : (["mgoebl@openembedded.org"], "mgoebl@unknown.op=
enembedded.org"),
    "OpenEmbedded Project"     : (["oe@openembedded.org"], "openembedded-de=
vel@openembedded.org"),
    "OpenMoko anonymizer key"  : (["openmoko@openembedded.org"], "devel@ope=
nmoko.org"),
    "Peter Urbanec"      : (["peteru@openembedded.org"], "peteru@unknown.op=
enembedded.org"),
    "araimondi"          : (["araimondi@gmx.net"], "araimondi@gmx.net"),=20
    "ccsmart"            : (["ccsmart@openembedded.org", "ccsmart@smartpal.=
de"], "ccsmart@smartpal.de"),
    "Cesar Eduardo Barros"     : (["cesarb@cesarb.net"], "cesarb@cesarb.net=
"),
    "Christiano P."      : (["Cristiano P. <cris69@solnet.ch>"], "cris69@so=
lnet.ch"),
    "Eblis"              : (["eblis102@gmail.com"], "eblis102@gmail.com"),
    "giel"               : (["giel"], "giel.unknown@unknown.openembedded.or=
g"),
    "gilligan"           : (["gilligan@openembedded.org"], "gilligan@unknow=
n.openembedded.org"),
    "GoxboxLive"         : (["GoxboxLive <goxboxlive@gmail.com>"], "goxboxl=
ive@gmail.com"),
    "hillct-oe"          : (["hillct-oe@pinnacledigital.com"], "hillct-oe@p=
innacledigital.com"),
    "ja4mail"            : (["jay4mail@gmail.com"], "jay4mail@gmail.com"),
    "jp30"               : (["jp30@nslu2-linux.org"], "jp30@nslu2-linux.org=
"),
    "kolla"              : (["kolla@uninett.no"], "kolla@uninett.no"),
    "Dominik Kuhlen"     : (["kuhlen@openembedded.org"], "kuhlen@gmit-gmbh.=
de"),
    "mas"                : (["mas@ecs.soton.ac.uk"], "mas@ecs.soton.ac.uk")=
,
    "mattaw"             : (["mattaw"], "mattaw.unknown@unknown.openembedde=
d.org"),
    "musti"              : (["musti@openembedded.org"], "musti@unknown.open=
embedded.org"),
    "Pieter G"           : (["pieterg@gmx.com"], "pieterg@gmx.com"),
    "Purdyd"             : (["purdyd_at_wisheights@yahoo.com"], "purdyd_at_=
wisheights@yahoo.com"),
    "Sleep Walker"       : (["Sleep.Walker <froser@gmail.com>"], "froser@gm=
ail.com"),
    "T Kemp"             : (["tkemp@klc.net.nz"], "tkemp@klc.net.nz"),
    "Wolfson Key"        : (["wolfson@openembedded.org"], "linux@wolfsonmic=
ro.com"),
    "ant"                : (["ant", "ant, Jay"], "ant.unknown@unknown.opene=
mbedded.org"),
    "denis"              : (["denis@denix.org"], "denis@denix.org"),
}

reverse =3D {}

for name, (ids, email) in all_names.items():
    for id in ids:
        assert not id in reverse
        print "name: %s id: %s" % (repr(name), repr(id))
        reverse[id] =3D ("%s <%s>" % (name, email)).strip()

authors =3D [x.strip().strip('"') for x in file('authors.list').readlines()=
]
committers =3D [x.strip().strip('"') for x in file('committers.list').readl=
ines()]

print "Authors:"
for x in authors:
    print "  %s -> %s" % (repr(x), repr(reverse.get(x, None)))
print
print "Committers:"
for x in committers:
    print "  %s -> %s" % (repr(x), repr(reverse.get(x, None)))


--Boundary-00=_9BK8IAnz54iC0fi--
