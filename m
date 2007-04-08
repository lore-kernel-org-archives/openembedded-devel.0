Received: from [217.72.192.227] (helo=fmmailgate02.web.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <martin.runge@web.de>) id 1HaXYA-0006Zm-FF
	for openembedded-devel@openembedded.org; Sun, 08 Apr 2007 15:35:22 +0200
Received: from smtp06.web.de (fmsmtp06.dlan.cinetic.de [172.20.5.172])
	by fmmailgate02.web.de (Postfix) with ESMTP id 046F6713DB2C
	for <openembedded-devel@openembedded.org>;
	Sun,  8 Apr 2007 15:35:22 +0200 (CEST)
Received: from [77.176.16.141] (helo=navarra.weinkeller.de)
	by smtp06.web.de with asmtp (TLSv1:AES256-SHA:256)
	(WEB.DE 4.107 #114) id 1HaXY9-0002pS-00
	for openembedded-devel@openembedded.org; Sun, 08 Apr 2007 15:35:21 +0200
From: Martin Runge <martin.runge@web.de>
To: openembedded-devel@openembedded.org
Date: Sun, 8 Apr 2007 15:34:54 +0200
User-Agent: KMail/1.9.6
MIME-Version: 1.0
Message-Id: <200704081535.03156.martin.runge@web.de>
Sender: martin.runge@web.de
X-Sender: martin.runge@web.de
Subject: alsa-utils fail to compile - patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Apr 2007 13:35:23 -0000
X-Groupsio-MsgNum: 1764
Content-Type: multipart/signed; boundary="nextPart1360440.OQ5aqJdrJb";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1360440.OQ5aqJdrJb
Content-Type: multipart/mixed;
  boundary="Boundary-01=_/9OGGknTZQ1SG6b"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--Boundary-01=_/9OGGknTZQ1SG6b
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi .*

I have had problems compiling alsa-utils_1.0.13.bb package for my target=20
(EP93xx based). The aseqnet utility did not link, I got unresolved symbols=
=20
because libintl was not linked to aseqnet.=20

I created a patch that solves this issue for me (attached). Does this probl=
em=20
occour on other targets, too?

best rgards,
Martin


p.s.

I use revision 56da424b67313c359d08cc04b5320ed7c34d6a61 from=20
org.openembedded.dev. The link error was reproducable with earlier versions=
,=20
too.



--Boundary-01=_/9OGGknTZQ1SG6b
Content-Type: text/x-diff;
  charset="utf-8";
  name="alsa-utils-bb.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="alsa-utils-bb.patch"

--- alsa-utils_1.0.13.bb~	2007-04-08 15:04:25.000000000 +0200
+++ alsa-utils_1.0.13.bb	2007-04-08 15:25:24.750688167 +0200
@@ -3,7 +3,7 @@
 SECTION =3D "console/utils"
 LICENSE =3D "GPL"
 DEPENDS =3D "alsa-lib ncurses"
-PR =3D "r0"
+PR =3D "r1"
=20
 SRC_URI =3D "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2=
\
            file://link_lintl_to_aseqnet.patch;patch=3D1"

--Boundary-01=_/9OGGknTZQ1SG6b
Content-Type: text/x-diff;
  charset="utf-8";
  name="link_lintl_to_aseqnet.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="link_lintl_to_aseqnet.patch"

--- alsa-utils-1.0.13/seq/aseqnet/Makefile.am.orig	2007-04-08 14:54:30.7911=
50057 +0200
+++ alsa-utils-1.0.13/seq/aseqnet/Makefile.am	2007-04-08 14:54:59.087712622=
 +0200
@@ -1,4 +1,5 @@
 INCLUDES =3D -I$(top_srcdir)/include
+LDADD =3D $(LIBINTL)
 EXTRA_DIST =3D README.aseqnet aseqnet.1
=20
 bin_PROGRAMS =3D aseqnet

--Boundary-01=_/9OGGknTZQ1SG6b--

--nextPart1360440.OQ5aqJdrJb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iQIVAwUARhjvhmA0kvpfv12hAQLd2Q//QvqtIhp8tLBR5j0xIDp9GIal2mmndFLu
TO8oX/AvcY4auTZw83L6S/4uJPGD+j0u6egUsj11S8jEoQh8+6sSJ2y5giIqbzDy
RMfBIFmwqjxViD+H4U2DjrTbk7metcL2PfDm48gi7l0utbVWMb6Zf/FoIqs8411c
PwmLMX4oycLs9CsuEGitKf6qOdNrqY8fOlwsxFZibU018KpP+VBd/Noh8rmTmURC
SCQHzl9y704MckV5WLNlurNzmmeIg8ToFqtn0i8oKOXodnbJkxNORhd1DGrltB+P
sfmOTCr9k4bx6bC+mpQQY1ZgAXcb90/LFm4Fv9ru98pajgGODkPuQofyO84PHY4d
Za/4RVUi9lF5+gmjWCcAkAMZmbnHjHIuZoEmnzlsik9v+BS52sJcAwRPtD4UyadO
VD+II0NWahwdBwsFH/5XbwVBc+plgdt6UX5UiH1d1xC04c0cHndA5dkJujQ+2dOF
AkpC7Iy/mhu1UEaguoxs2k4yLOWDj0L+ggcHucYEbSm7PF8H3xPHAXXSCUYo9iWE
jckC3Dn4pZFnWZOSLfgNBINsCRM4AMWMcY54iVdAOhlZiPwoKVeLqNt/0IG5ZqsN
vVwKAzFeXLN4rD1NRhdTjs5o1gSXMF8lie/MTmMbEKPH87afuLYhsQb7NSf8EDS1
G1kUPBqjfSY=
=VRqJ
-----END PGP SIGNATURE-----

--nextPart1360440.OQ5aqJdrJb--
