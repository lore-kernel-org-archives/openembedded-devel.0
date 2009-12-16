Received: from wam.ukma.de ([188.40.105.250])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mattheis@ukma.de>) id 1NKyid-0002WX-FK
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Dec 2009 19:35:30 +0100
Received: from wam.ukma.de (localhost [127.0.0.1])
	by wam.ukma.de (Postfix) with ESMTP id E058049E5F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2009 19:34:12 +0100 (CET)
Received: from ws.ukma.de (ws.ukma.local [172.16.20.10])
	by wam.ukma.de (Postfix) with ESMTP id C722F49E52
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2009 19:34:12 +0100 (CET)
Received: from ws.ukma.de ([172.16.20.10]) by ws ([172.16.20.10]) with mapi;
	Wed, 16 Dec 2009 19:34:35 +0100
From: Konrad Mattheis <mattheis@ukma.de>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Dec 2009 19:33:40 +0100
Thread-Topic: [oe] recipe for libgdiplus
Thread-Index: Acp+dC1IUufT9vJOSa+o/7Lt1WgmhgAB+r9A
Message-ID: <F32E8C2599F37641BB4E3F3AC4A3C412016E0369E5A2@ws>
References: <F32E8C2599F37641BB4E3F3AC4A3C412016E0369E56F@ws>
	<1260983899.3448.6.camel@gnutoo-desktop>
In-Reply-To: <1260983899.3448.6.camel@gnutoo-desktop>
Accept-Language: de-DE, de-LU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE, de-LU
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 188.40.105.250
X-SA-Exim-Mail-From: mattheis@ukma.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: recipe for libgdiplus
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
X-List-Received-Date: Wed, 16 Dec 2009 18:35:30 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I already found the missing entry. I added:

EXTRA_OECONF =3D " --with-glib=3D${STAGING_LIBDIR}/.. \"

or do you prefer a different way?

now it is working. I attached the complete bb-file and the
needed patch.

I will try in the next week to make a patch that could applied
to the main line. Before it is ready I have to add some RDEPENDS.


Do you have any comments on my file. Things, that is not okay,..?

bye
Konrad

Attachment:

//////////////////////////////////////////////////
// libgdiplus-svn.bb
DESCRIPTION =3D "libgdiplus for WinForms in Mono"
LICENSE =3D "GPL"
SECTION =3D "devel/mono"

DEPENDS =3D "virtual/libx11 pixman libsm libpng libtiff fontconfig libxrend=
er glib-2.0"

PRIORITY =3D "optional"

SRCREV =3D "140293"
PV =3D "2.4.2.3+svnr${SRCREV}"

PR =3D "r6"

SRC_URI =3D "\
 svn://anonsvn.mono-project.com/source/trunk/;module=3Dlibgdiplus;proto=3Ds=
vn;rev=3D${SRCREV};name=3Dlibgdiplus \
 file://patches/configure_fix_cairo.patch;patch=3D1 \
"

S =3D "${WORKDIR}/libgdiplus"

# PACKAGE_ARCH =3D "${MACHINE}"

TARGET_LDFLAGS =3D ""

inherit autotools pkgconfig


EXTRA_OECONF =3D " --with-glib=3D${STAGING_LIBDIR}/.. \"

do_compile () {
    oe_runmake clean
    oe_runmake all
}

/////////////////////////////////////////////////////
// configure_fix_cairo.patch

diff -crB libgdiplus/cairo/boilerplate/Makefile.am libgdiplus/cairo_patch/b=
oilerplate/Makefile.am
*** libgdiplus/cairo/boilerplate/Makefile.am	2009-12-12 20:18:53.000000000 =
+0100
--- libgdiplus/cairo_patch/boilerplate/Makefile.am	2009-12-13 11:17:24.0000=
00000 +0100
***************
*** 13,19 ****
  libcairoboilerplate_la_LIBADD =3D $(top_builddir)/src/libcairo.la $(CAIRO=
_LDADD)
 =20
  if CAIRO_HAS_BEOS_SURFACE
- libcairoboilerplate_la_SOURCES +=3D cairo-boilerplate-beos.cpp
  libcairoboilerplate_la_SOURCES +=3D cairo-boilerplate-beos-private.h
  # BeOS system headers trigger this warning
  libcairoboilerplate_la_CXXFLAGS =3D -Wno-multichar
--- 13,18 ----
diff -crB libgdiplus/cairo/configure.in libgdiplus/cairo_patch/configure.in
*** libgdiplus/cairo/configure.in	2009-12-12 20:18:57.000000000 +0100
--- libgdiplus/cairo_patch/configure.in	2009-12-13 11:20:25.000000000 +0100
***************
*** 27,41 ****
--- 27,44 ----
 =20
  # Increment if the interface has additions, changes, removals.
  LT_CURRENT=3D19
+ AC_SUBST(LT_CURRENT)
 =20
  # Increment any time the source changes; set to
  # 0 if you increment CURRENT
  LT_REVISION=3D5
+ AC_SUBST(LT_REVISION)
 =20
  # Increment if any interfaces have been added; set to 0
  # if any interfaces have been removed. removal has
  # precedence over adding, so set to 0 if both happened.
  LT_AGE=3D17
+ AC_SUBST(LT_AGE)
 =20
  dnl =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
 =20
***************
*** 461,467 ****
 =20
  # Uncomment the if, since with it in place compilation breaks on OpenSuSE=
 11.1b4
  #if test "x$use_beos" =3D "xyes"; then
!   AC_PROG_CXX
  #fi
 =20
  dnl =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
--- 464,470 ----
 =20
  # Uncomment the if, since with it in place compilation breaks on OpenSuSE=
 11.1b4
  #if test "x$use_beos" =3D "xyes"; then
! #  AC_PROG_CXX
  #fi
 =20
  dnl =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
Nur in cairo_patch: patch.

-----Urspr=FCngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded=
-devel-bounces@lists.openembedded.org] Im Auftrag von GNUtoo
Gesendet: Mittwoch, 16. Dezember 2009 18:18
An: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] recipe for libgdiplus

On Sat, 2009-12-12 at 22:55 +0100, Konrad Mattheis wrote:
> Hi,
>=20
> try to build a recipe for libgdiplus. This is a library which you need
> if you want to get Winforms with mono working.
>=20
> A lot of stuff is already working but it always stops because it=20
> don't find the "glib.h"
>=20
> In this headerfiles basic types of the glib are described.
> see:
> http://library.gnome.org/devel/glib/unstable/glib-Basic-Types.html
>=20
> I already wrote in my recipe:
>=20
> DEPENDS =3D "... glib-2.0 ..." but I don't solve the problem.
>=20
> Any ideas??
>=20
> bye
> Konrad
could you post your recipe somewhere, and give more infos on the
failure?
by the way is glib already bitbaken?
can you specify the include dir path for glib(if it uses the autotools
in ./configure)?
The file you are talking about should be somewhere like
${STAGING_INCDIR}/glib-2.0/glib.h
so it's directory should be:
${STAGING_INCDIR}/glib-2.0

Denis.



_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


