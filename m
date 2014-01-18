Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 950A66CBA5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2014 13:30:57 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c41so2584032eek.30
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2014 05:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yjah5fzxANE99JxQtup9O29UubiRAiM7/pDhSh1C9C0=;
	b=VMpizTJ3iAf/cPCRDl4VAEnbhy9k8GWuuRYNTEIkWaW1M/hOjvvcIbzpcc0vcafePG
	SQ1hargh/ZwnejWG37UFSO56fWWOEXOdP1TMDeJDRpSZSabrUP1eYvPRg2Gn5dQVapJm
	jcRrdAhSiKAg3rHPqoB9ON9x2MM/qPA0alBzBgqxD9zsMuFJ15w65/7eFGanAkR/CmRg
	yWgjemOKN2hgt73IW8m2WhfK21Oi5g4siG0r1rRtb/hbQJSJ5ghmihx9vtuWXl2D6KpG
	38GeBeBHiO5HVR7nQ4DAIbImGIrWMTcVcYiFAYjagHJKzXjidtjTl4eDi0wFeZgrGN8J
	o8HQ==
X-Received: by 10.15.31.196 with SMTP id y44mr77060eeu.96.1390051858095;
	Sat, 18 Jan 2014 05:30:58 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o13sm35303678eex.19.2014.01.18.05.30.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jan 2014 05:30:57 -0800 (PST)
Date: Sat, 18 Jan 2014 14:31:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <20140118133122.GV3742@jama>
References: <CAPbeDCnrC84D8tqjT-A29YLO_hn2K1wQ5a_cK85uMVfGEzbrhQ@mail.gmail.com>
	<20140113101147.GI16995@jama>
	<alpine.LFD.2.11.1401140055500.20049@localhost.localdomain>
	<CAPbeDCkCM3U=qXv-sUKDNxH1zGyC76m2_fsz_DZLouJovCCceA@mail.gmail.com>
	<20140118113814.GR3742@jama>
	<alpine.LFD.2.11.1401181305380.13045@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.11.1401181305380.13045@localhost.localdomain>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][jansa/qt5-5.2.0] libQt5*.la references OE build directories
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Jan 2014 13:30:58 -0000
X-Groupsio-MsgNum: 47816
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Zqkt5x/gGOIVPcL0"
Content-Disposition: inline

--Zqkt5x/gGOIVPcL0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 18, 2014 at 01:13:48PM +0100, Jacob Kroon wrote:
>=20
> On Sat, 18 Jan 2014, Martin Jansa wrote:
>=20
> > On Sat, Jan 18, 2014 at 11:03:09AM +0100, Jacob Kroon wrote:
> >> Hi Andreas and Martin,
> >>
> >> On Tue, Jan 14, 2014 at 1:03 AM, Jacob Kroon <jacob.kroon@gmail.com> w=
rote:
> >>
> >>>
> >>> On Mon, 13 Jan 2014, Martin Jansa wrote:
> >>>
> >>>  On Mon, Jan 13, 2014 at 01:58:25AM +0100, Jacob Kroon wrote:
> >>>>
> >>>>> Hi,
> >>>>>
> >>>>> I'm seeing what I believe is a problem with the *.la files in the Q=
t5
> >>>>> dev-packages.
> >>>>> The files references paths in my OE build environment, like so:
> >>>>>
> >>>>> ...
> >>>>> # Libraries that this one depends upon.
> >>>>> dependency_libs=3D'-lQt5Gui
> >>>>> -L/home/jkroon/Projects/oe-devel/build/tmp-eglibc/
> >>>>> sysroots/wandboard-solo/usr/lib
> >>>>> -lQt5Core -lpthread '
> >>>>> ...
> >>>>> # Directory that this library needs to be installed in:
> >>>>> libdir=3D'/home/jkroon/Projects/oe-devel/build/tmp-eglibc/
> >>>>> sysroots/wandboard-solo/usr'
> >>>>> ...
> >>>>>
> >>>>> I noticed this since my Qt5 autotools project wouldn't link properl=
y when
> >>>>> using the SDK, unless I first removed all libQt5*.la files.
> >>>>>
> >>>>> I'm not quite sure where to look for the problem so any pointers wo=
uld be
> >>>>> appreciated.
> >>>>>
> >>>>
> >>>> Probably bad rebase on my side, please compare
> >>>>
> >>>> mkspecs/features/qt_module.prf in 5.1.1 and 5.2.0
> >>>>
> >>>> changed in:
> >>>> https://github.com/meta-qt5/meta-qt5/blob/master/recipes-
> >>>> qt/qt5/qtbase-5.1.1/0008-qt_module-Fix-pkgconfig-replacement.patch
> >>>> and
> >>>> https://github.com/meta-qt5/meta-qt5/blob/jansa/qt5-5.2.0/
> >>>> recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch
> >>>>
> >>>> Or better in meta-qt5's qtbase repo:
> >>>> https://github.com/meta-qt5/qtbase/blob/b5.1.1/mkspecs/
> >>>> features/qt_module.prf
> >>>> https://github.com/meta-qt5/qtbase/blob/b5.2.0/mkspecs/
> >>>> features/qt_module.prf
> >>>>
> >>>>
> >>> I tried building Qt 5.1.1 from master again, the .la-files do look be=
tter,
> >>> "libdir" looks correct (taken from libQt5Svg.la):
> >>>
> >>> <snip>
> >>>
> >>> # Directory that this library needs to be installed in:
> >>> libdir=3D'/usr/lib'
> >>> </snip>
> >>>
> >>> however
> >>>
> >>> <snip>
> >>>
> >>> dependency_libs=3D'-lQt5Gui -L/home/jkroon/Projects/oe-
> >>> devel/build/tmp-eglibc/sysroots/wandboard-solo/usr/lib -lQt5Core
> >>> -lpthread '
> >>> </snip>
> >>>
> >>> Dunno wether this is a problem or not, I never tried building the pro=
ject
> >>> with 5.1.1 using the SDK.
> >>>
> >>> Will hopefully have some time tomorrow to look at the links you sent.
> >>>
> >>> Thanks,
> >>>
> >>> Jacob
> >>>
> >>
> >> I'm trying to get the .la-files for Qt5 dev-packages correct.
> >>
> >> What I've come up with so far is attached in the patch (to be applied =
in
> >> top of "jansa-qt5-5.2.0", b8a236df79c25802c1f2eb2525e8a534e73e608e)
> >>
> >> With the patch applied I can still build both an image and an SDK, and=
 also
> >> the resulting SDK can be used to build my QT5 autotools projects. But =
I get
> >> these warnings when building for instance "qtxmlpatterns":
> >>
> >> WARNING: QA Issue: qtxmlpatterns: The compile log indicates that host
> >> include and/or library paths were used.
> >
> > This warning is the reason why I've originally created this patch, so
> > something is definitely wrong in new version.
>=20
> I got rid of this warning by adding the "-L/usr/lib" -> "" substitution=
=20
> for the .prl file aswell. But it's an ugly hack I guess..
>=20
> > I know it's very confusing .prf (and last upstream changes didn't make
> > it any easier), I'll try to look at it this weekend.
> >
> > It would be great to prepare some nice reproducer which we can use in
> > upstream gerrit to show that this really doesn't work well in more
> > complicated case (like our cross-compile with "sstate-relocateable"
> > .prl,.la,.pc files, where we really don't want to include host paths).
> >
> > Do you have something like smaller test case or were you testing it on
> > "big" qtbase build?
> >
>=20
> Unfortunately no, I did all testing on the big=20
> qtbase-native/qtbase/nativesdk-qtbase packages (pats my poor laptop=20
> harddrive). Do you have an idea of where to start for creating such a tes=
t=20
> case ? Something like a recipe that uses qtbase but only builds qmake + a=
=20
> minimal Qt module ?

Not really, back then I was also using whole qtbase build (regenerating
Makefile with qmake and .prf edited manually, checking the replacements
in Makefile until they looked sane and then rebuilding qtbase-native/qtbase
=66rom scratch for final test).

> >> With my patch applied,
> >> recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch l=
ooks
> >> like this:
> >>
> >> --- qtbase-opensource-src-5.2.0.orig/mkspecs/features/qt_module.prf
> >> +++ qtbase-opensource-src-5.2.0/mkspecs/features/qt_module.prf
> >> @@ -135,30 +135,36 @@ load(qt_installs)
> >>      rplbase =3D $$dirname(_QMAKE_SUPER_CACHE_)/[^/][^/]*
> >>  else: \
> >>      rplbase =3D $$MODULE_BASE_OUTDIR
> >> -include_replace.match =3D $$rplbase/include
> >> -include_replace.replace =3D $$[QT_INSTALL_HEADERS/raw]
> >> -include_replace.CONFIG =3D path
> >> +pkgconfig_include_replace.match =3D $$rplbase/include
> >> +pkgconfig_include_replace.replace =3D "\$$\\{includedir}"
> >> +pkgconfig_include_replace.CONFIG =3D path
> >> +pkgconfig_lib_replace.match =3D $$rplbase/lib
> >> +pkgconfig_lib_replace.replace =3D "\$$\\{libdir}"
> >> +pkgconfig_lib_replace.CONFIG =3D path
> >>  lib_replace.match =3D $$rplbase/lib
> >>  host_build: \
> >>      lib_replace.replace =3D $$[QT_HOST_LIBS]
> >>  else: \
> >>      lib_replace.replace =3D $$[QT_INSTALL_LIBS/raw]
> >>  lib_replace.CONFIG =3D path
> >> -QMAKE_PRL_INSTALL_REPLACE +=3D include_replace lib_replace
> >> +QMAKE_PRL_INSTALL_REPLACE +=3D lib_replace
> >>
> >>  unix|win32-g++* {
> >>     CONFIG +=3D create_pc
> >>     QMAKE_PKGCONFIG_LIBDIR =3D $$lib_replace.replace
> >> -   QMAKE_PKGCONFIG_INCDIR =3D $$include_replace.replace
> >> +   QMAKE_PKGCONFIG_INCDIR =3D $$[QT_INSTALL_HEADERS/raw]
> >>     QMAKE_PKGCONFIG_CFLAGS =3D -I${includedir}/$$MODULE_INCNAME
> >>     QMAKE_PKGCONFIG_DESTDIR =3D pkgconfig
> >> -   QMAKE_PKGCONFIG_INSTALL_REPLACE +=3D include_replace lib_replace
> >> +   QMAKE_PKGCONFIG_INSTALL_REPLACE +=3D pkgconfig_include_replace
> >> pkgconfig_lib_replace
> >>  }
> >>
> >>  unix {
> >> +   lafile_replace.match =3D "-L$$[QT_INSTALL_LIBS/raw]"
> >> +   lafile_replace.replace =3D ""
> >> +   lafile_replace.CONFIG =3D path
> >>     CONFIG +=3D create_libtool explicitlib
> >>     QMAKE_LIBTOOL_LIBDIR =3D $$lib_replace.replace
> >> -   QMAKE_LIBTOOL_INSTALL_REPLACE +=3D include_replace lib_replace
> >> +   QMAKE_LIBTOOL_INSTALL_REPLACE +=3D lib_replace lafile_replace
> >>  }
> >>
> >> The lafile_replace does the substitution "-L/usr/lib" -> "". Maybe thi=
s is
> >> needed for the .prl-files aswell ? Is the QMAKE_PRL_BUILD_DIR needed a=
t all
> >> ? With all the sed:ing going on, that path looks phony to me...
> >>
> >> From native "sysroots/x86_64-linux/usr/lib/libQt5Xml.prl":
> >> QMAKE_PRL_BUILD_DIR =3D
> >> /home/jkroon/Projects/oe-devel/build/tmp-eglibc/work/x86_64-linux/qtba=
se-native/5.2.0-r0/build/src/xml
> >> QMAKE_PRL_LIBS =3D
> >> -L/home/jkroon/Projects/oe-devel/build/tmp-eglibc/sysroots/x86_64-linu=
x/usr/lib
> >> -lQt5Core -lpthread
> >>
> >> From native "sysroots/x86_64-linux/usr/lib/libQt5Xml.la":
> >> dependency_libs=3D' -lQt5Core -lpthread '
> >> libdir=3D'/home/jkroon/Projects/oe-devel/build/tmp-eglibc/sysroots/x86=
_64-linux/usr/lib'
> >>
> >> From target "sysroots/wandboard-solo/usr/lib/libQt5Xml.prl":
> >> QMAKE_PRL_BUILD_DIR =3D
> >> /home/jkroon/Projects/oe-devel/build/tmp-eglibc/work/cortexa9hf-vfp-ne=
on-mx6-oe-linux-gnueabi/qtbase/5.2.0-r0/build/src/xml
> >> QMAKE_PRL_LIBS =3D -L/usr/lib -lQt5Core -lpthread
> >>
> >> From target "sysroots/wandboard-solo/usr/lib/libQt5Xml.la":
> >> dependency_libs=3D' -lQt5Core -lpthread '
> >> libdir=3D'/usr/lib'
> >>
> >>   -- Jacob (very confused)
> >
> >> diff --git a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replac=
ement.patch b/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacemen=
t.patch
> >> index f85fb33..5503e1a 100644
> >> --- a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.p=
atch
> >> +++ b/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.p=
atch
> >> @@ -46,57 +46,36 @@ Signed-off-by: Andreas M=FCller <schnitzeltony@goo=
glemail.com>
> >>   mkspecs/features/qt_module.prf | 43 ++++++++++++++++++++++++++++++--=
----------
> >>   1 file changed, 31 insertions(+), 12 deletions(-)
> >>
> >> -diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_mod=
ule.prf
> >> -index 11509ee..2f95684 100644
> >> ---- a/mkspecs/features/qt_module.prf
> >> -+++ b/mkspecs/features/qt_module.prf
> >> -@@ -135,30 +135,49 @@ load(qt_installs)
> >> +Index: qtbase-opensource-src-5.2.0/mkspecs/features/qt_module.prf
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +--- qtbase-opensource-src-5.2.0.orig/mkspecs/features/qt_module.prf
> >> ++++ qtbase-opensource-src-5.2.0/mkspecs/features/qt_module.prf
> >> +@@ -135,30 +135,36 @@ load(qt_installs)
> >>       rplbase =3D $$dirname(_QMAKE_SUPER_CACHE_)/[^/][^/]*
> >>   else: \
> >>       rplbase =3D $$MODULE_BASE_OUTDIR
> >>  -include_replace.match =3D $$rplbase/include
> >>  -include_replace.replace =3D $$[QT_INSTALL_HEADERS/raw]
> >>  -include_replace.CONFIG =3D path
> >> --lib_replace.match =3D $$rplbase/lib
> >> --host_build: \
> >> --    lib_replace.replace =3D $$[QT_HOST_LIBS]
> >> --else: \
> >>  +pkgconfig_include_replace.match =3D $$rplbase/include
> >>  +pkgconfig_include_replace.replace =3D "\$$\\{includedir}"
> >> ++pkgconfig_include_replace.CONFIG =3D path
> >>  +pkgconfig_lib_replace.match =3D $$rplbase/lib
> >>  +pkgconfig_lib_replace.replace =3D "\$$\\{libdir}"
> >> -+!exists($$[QT_SYSROOT]) {
> >> -+    include_replace.match =3D $$rplbase/include
> >> -+    include_replace.replace =3D $$[QT_INSTALL_HEADERS/raw]
> >> -+    include_replace.CONFIG =3D path
> >> -+    lib_replace.match =3D $$rplbase/lib
> >> ++pkgconfig_lib_replace.CONFIG =3D path
> >> + lib_replace.match =3D $$rplbase/lib
> >> + host_build: \
> >> +     lib_replace.replace =3D $$[QT_HOST_LIBS]
> >> + else: \
> >>       lib_replace.replace =3D $$[QT_INSTALL_LIBS/raw]
> >> --lib_replace.CONFIG =3D path
> >> -+    lib_replace.CONFIG =3D path
> >> -+    lafile_replace.match =3D $$rplbase
> >> -+    lafile_replace.replace =3D "$$[QT_INSTALL_PREFIX/raw]"
> >> -+} else {
> >> -+    # include_replace and lib_replace are duplicate, but we don't wa=
nt to
> >> -+    # make QMAKE_PKGCONFIG_INSTALL_REPLACE, QMAKE_PRL_INSTALL_REPLAC=
E conditional
> >> -+    include_replace.match =3D $$rplbase
> >> -+    include_replace.replace =3D $$[QT_SYSROOT]$$[QT_INSTALL_PREFIX/r=
aw]
> >> -+    include_replace.CONFIG =3D path
> >> -+    lib_replace.match =3D $$rplbase
> >> -+    lib_replace.replace =3D $$[QT_SYSROOT]$$[QT_INSTALL_PREFIX/raw]
> >> -+    lib_replace.CONFIG =3D path
> >> -+    lafile_replace.match =3D $$rplbase
> >> -+    lafile_replace.replace =3D "=3D$$[QT_INSTALL_PREFIX/raw]"
> >> -+}
> >> - QMAKE_PRL_INSTALL_REPLACE +=3D include_replace lib_replace
> >> + lib_replace.CONFIG =3D path
> >> +-QMAKE_PRL_INSTALL_REPLACE +=3D include_replace lib_replace
> >> ++QMAKE_PRL_INSTALL_REPLACE +=3D lib_replace
> >>
> >>   unix|win32-g++* {
> >>      CONFIG +=3D create_pc
> >> --   QMAKE_PKGCONFIG_LIBDIR =3D $$lib_replace.replace
> >> +    QMAKE_PKGCONFIG_LIBDIR =3D $$lib_replace.replace
> >>  -   QMAKE_PKGCONFIG_INCDIR =3D $$include_replace.replace
> >> -+   host_build: \
> >> -+       QMAKE_PKGCONFIG_LIBDIR =3D $$[QT_HOST_LIBS]
> >> -+   else: \
> >> -+       QMAKE_PKGCONFIG_LIBDIR =3D $$[QT_INSTALL_LIBS/raw]
> >>  +   QMAKE_PKGCONFIG_INCDIR =3D $$[QT_INSTALL_HEADERS/raw]
> >>      QMAKE_PKGCONFIG_CFLAGS =3D -I${includedir}/$$MODULE_INCNAME
> >>      QMAKE_PKGCONFIG_DESTDIR =3D pkgconfig
> >> @@ -105,13 +84,13 @@ index 11509ee..2f95684 100644
> >>   }
> >>
> >>   unix {
> >> ++   lafile_replace.match =3D "-L$$[QT_INSTALL_LIBS/raw]"
> >> ++   lafile_replace.replace =3D ""
> >> ++   lafile_replace.CONFIG =3D path
> >>      CONFIG +=3D create_libtool explicitlib
> >>      QMAKE_LIBTOOL_LIBDIR =3D $$lib_replace.replace
> >>  -   QMAKE_LIBTOOL_INSTALL_REPLACE +=3D include_replace lib_replace
> >> -+   QMAKE_LIBTOOL_INSTALL_REPLACE +=3D include_replace lib_replace la=
file_replace
> >> ++   QMAKE_LIBTOOL_INSTALL_REPLACE +=3D lib_replace lafile_replace
> >>   }
> >>
> >>   unix|win32-g++* {
> >> ---
> >> -1.8.5.2
> >> -
> >
> >
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Zqkt5x/gGOIVPcL0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLagioACgkQN1Ujt2V2gBxpIACeNA5wHE4EYYgChqDniIIL5e9z
fokAoI/fFyt0dNuga4BFxk0lcwyNUlg9
=ErpH
-----END PGP SIGNATURE-----

--Zqkt5x/gGOIVPcL0--
