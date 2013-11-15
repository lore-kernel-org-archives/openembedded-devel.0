Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id F03796D72F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 14:22:27 +0000 (UTC)
Received: (qmail 2040 invoked by uid 1003); 15 Nov 2013 14:22:29 -0000
Received: from unknown (HELO ?192.168.1.113?)
	(philip@opensdr.com@108.44.82.190)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	15 Nov 2013 14:22:29 -0000
Message-ID: <52862E23.1@balister.org>
Date: Fri, 15 Nov 2013 09:22:27 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1384474452-14955-1-git-send-email-philip@balister.org>
	<1384474452-14955-2-git-send-email-philip@balister.org>
	<20131115142008.GB31430@jama>
In-Reply-To: <20131115142008.GB31430@jama>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH 2/2] gnuradio : Remove recipes. Now lives in meta-sdr.
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
X-List-Received-Date: Fri, 15 Nov 2013 14:22:29 -0000
X-Groupsio-MsgNum: 47144
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="U2Du8DtWu4D1gUHV54pw8FsnCaQcphltR"

--U2Du8DtWu4D1gUHV54pw8FsnCaQcphltR
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 11/15/2013 09:20 AM, Martin Jansa wrote:
> On Thu, Nov 14, 2013 at 07:14:12PM -0500, Philip Balister wrote:
>> https://github.com/balister/meta-sdr
>>
>> Signed-off-by: Philip Balister <philip@balister.org>
>> ---
>>  ...n-t-add-usr-include-and-usr-lib-to-config.patch |  58 ------------=

>>  .../gnuradio/0001-gr-trellis-Kill-docs-hard.patch  |  38 --------
>>  .../recipes-connectivity/gnuradio/gnuradio_git.bb  | 100 ------------=
---------
>>  3 files changed, 196 deletions(-)
>>  delete mode 100644 meta-oe/recipes-connectivity/gnuradio/gnuradio/000=
1-buildsys-don-t-add-usr-include-and-usr-lib-to-config.patch
>>  delete mode 100644 meta-oe/recipes-connectivity/gnuradio/gnuradio/000=
1-gr-trellis-Kill-docs-hard.patch
>>  delete mode 100644 meta-oe/recipes-connectivity/gnuradio/gnuradio_git=
=2Ebb
>=20
> Applying: gnuradio : Remove recipes. Now lives in meta-sdr.
> error:
> meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-buildsys-don-t-add-=
usr-include-and-usr-lib-to-config.patch:
> does not exist in index
> error: patch failed:
> meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb:1
> error: meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb: patch doe=
s
> not apply
> Patch failed at 0001 gnuradio : Remove recipes. Now lives in meta-sdr.
>=20
> But will apply it manually.

Bah, I bet I made the patch against a branch, not master.

Do you need me to resend?

Philip

>=20
>>
>> diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-build=
sys-don-t-add-usr-include-and-usr-lib-to-config.patch b/meta-oe/recipes-c=
onnectivity/gnuradio/gnuradio/0001-buildsys-don-t-add-usr-include-and-usr=
-lib-to-config.patch
>> deleted file mode 100644
>> index 7caaf51..0000000
>> --- a/meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-buildsys-don=
-t-add-usr-include-and-usr-lib-to-config.patch
>> +++ /dev/null
>> @@ -1,58 +0,0 @@
>> -From a130153ae84d8bb5914879cef94df09f06825c10 Mon Sep 17 00:00:00 200=
1
>> -From: Koen Kooi <koen@dominion.thruhere.net>
>> -Date: Sat, 18 Jun 2011 11:25:36 +0200
>> -Subject: [PATCH] buildsys: don't add /usr/include and /usr/lib to con=
figure tests for libusb
>> -
>> -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ----
>> - config/usrp_libusb.m4 |   13 -------------
>> - 1 files changed, 0 insertions(+), 13 deletions(-)
>> -
>> -diff --git a/config/usrp_libusb.m4 b/config/usrp_libusb.m4
>> -index cc3410f..b421820 100644
>> ---- a/config/usrp_libusb.m4
>> -+++ b/config/usrp_libusb.m4
>> -@@ -117,10 +117,6 @@ AC_DEFUN([USRP_LIBUSB], [
>> -       dnl configured to find this header.
>> -       AC_LANG_PUSH(C)
>> -       save_CPPFLAGS=3D"$CPPFLAGS"
>> --      if test x$USB_INCLUDEDIR !=3D x; then
>> --        USB_INCLUDES=3D"-I$USB_INCLUDEDIR"
>> --        CPPFLAGS=3D"$USB_INCLUDES"
>> --      fi
>> -       AC_MSG_CHECKING([$libusb_name for header $usb_header])
>> -       AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
>> -         #include "$usb_header"
>> -@@ -172,9 +168,6 @@ AC_DEFUN([USRP_LIBUSB], [
>> -             *)
>> -               AC_LANG_PUSH(C)
>> -               save_CPPFLAGS=3D"$CPPFLAGS"
>> --              if test x$USB_INCLUDEDIR !=3D x; then
>> --                CPPFLAGS=3D"$USB_INCLUDES"
>> --              fi
>> -               save_LIBS=3D"$LIBS"
>> -               LIBS=3D"$USB_LIBS"
>> -               AC_MSG_CHECKING([$libusb_name for symbol usb_debug in =
library $usb_lib_name])
>> -@@ -217,9 +210,6 @@ AC_DEFUN([USRP_LIBUSB], [
>> -     dnl final error checking, mostly to create #define's
>> -     AC_LANG_PUSH(C)
>> -     save_CPPFLAGS=3D"$CPPFLAGS"
>> --    if test x$USB_INCLUDEDIR !=3D x; then
>> --      CPPFLAGS=3D"$USB_INCLUDES"
>> --    fi
>> -     dnl Check for the header.
>> -     AC_CHECK_HEADERS([$usb_header], [], [libusbok=3Dno])
>> -     CPPFLAGS=3D"$save_CPPFLAGS"
>> -@@ -231,9 +221,6 @@ AC_DEFUN([USRP_LIBUSB], [
>> -       dnl check for the library (again)
>> -       AC_LANG_PUSH(C)
>> -       save_CPPFLAGS=3D"$CPPFLAGS"
>> --      if test x$USB_INCLUDEDIR !=3D x; then
>> --        CPPFLAGS=3D"$USB_INCLUDES"
>> --      fi
>> -       save_LIBS=3D"$LIBS"
>> -       LIBS=3D"$USB_LIBS"
>> -       AC_CHECK_LIB([$usb_lib_name], [$usb_lib_func], [], [
>> ---=20
>> -1.6.6.1
>> -
>> diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-gr-tr=
ellis-Kill-docs-hard.patch b/meta-oe/recipes-connectivity/gnuradio/gnurad=
io/0001-gr-trellis-Kill-docs-hard.patch
>> deleted file mode 100644
>> index 38c3a10..0000000
>> --- a/meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-gr-trellis-K=
ill-docs-hard.patch
>> +++ /dev/null
>> @@ -1,38 +0,0 @@
>> -From 473342055e423384e2b17cc0957613299382fb79 Mon Sep 17 00:00:00 200=
1
>> -From: Philip Balister <philip@balister.org>
>> -Date: Mon, 17 Jun 2013 10:58:29 -0400
>> -Subject: [PATCH] gr-trellis : Kill docs hard.
>> -
>> -Signed-off-by: Philip Balister <philip@balister.org>
>> ----
>> - gr-trellis/CMakeLists.txt | 7 -------
>> - 1 file changed, 7 deletions(-)
>> -
>> -diff --git a/gr-trellis/CMakeLists.txt b/gr-trellis/CMakeLists.txt
>> -index 16a3e7c..95e1420 100644
>> ---- a/gr-trellis/CMakeLists.txt
>> -+++ b/gr-trellis/CMakeLists.txt
>> -@@ -50,12 +50,6 @@ if(ENABLE_GR_TRELLIS)
>> - include(GrPackage)
>> - CPACK_SET(CPACK_COMPONENT_GROUP_TRELLIS_DESCRIPTION "GNU Radio Trell=
is Blocks")
>> -=20
>> --CPACK_COMPONENT("trellis_docs"
>> --    GROUP        "Trellis"
>> --    DISPLAY_NAME "Documentation"
>> --    DESCRIPTION  "Doxygen HTML and XML"
>> --)
>> --
>> - CPACK_COMPONENT("trellis_runtime"
>> -     GROUP        "Trellis"
>> -     DISPLAY_NAME "Runtime"
>> -@@ -95,7 +89,6 @@ CPACK_COMPONENT("trellis_swig"
>> - # Add subdirectories
>> - ####################################################################=
####
>> - add_subdirectory(src/lib)
>> --add_subdirectory(doc)
>> - if(ENABLE_PYTHON)
>> -     add_subdirectory(grc)
>> -     add_subdirectory(src/python)
>> ---=20
>> -1.7.11.7
>> -
>> diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb b/m=
eta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
>> deleted file mode 100644
>> index 1a78575..0000000
>> --- a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
>> +++ /dev/null
>> @@ -1,100 +0,0 @@
>> -DESCRIPTION =3D "GNU Radio"
>> -URL =3D "http://gnuradio.org"
>> -SECTION =3D  "apps"
>> -LICENSE =3D "GPLv3"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47=
fae504"
>> -
>> -DEPENDS =3D "gsl fftwf python alsa-lib boost cppunit \
>> -           swig-native python-numpy python-cheetah-native orc"
>> -
>> -#Available PACKAGECONFIG options are qt grc uhd
>> -PACKAGECONFIG ??=3D "qtgui grc uhd"
>> -
>> -PACKAGECONFIG[uhd] =3D "-DENABLE_GR_UHD=3DON,-DENABLE_GR_UHD=3DOFF,uh=
d,"
>> -PACKAGECONFIG[grc] =3D "-DENABLE_GRC=3DON,-DENABLE_GRC=3DOFF,python-p=
ygtk python-cheetah, "
>> -
>> -PACKAGECONFIG[qtgui] =3D "-DENABLE_GR_QTGUI=3DON,-DENABLE_GR_QTGUI=3D=
OFF,qt4-x11-free qwt, "
>> -
>> -
>> -inherit distutils-base cmake pkgconfig
>> -
>> -export BUILD_SYS
>> -export HOST_SYS=3D"${MULTIMACH_TARGET_SYS}"
>> -
>> -RDEPENDS_${PN} =3D "python-core python-audio python-threading python-=
codecs \
>> -                  python-lang python-textutils python-shell python-pi=
ckle \
>> -                  python-compiler python-pkgutil python-pydoc python-=
mmap \
>> -                  python-netclient python-difflib \
>> -                  python-pprint python-numpy  \
>> -"
>> -RDEPENDS_${PN}-grc =3D "python-pygtk python-lxml python-cheetah pytho=
n-netserver"
>> -
>> -C_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fa=
e504"
>> -
>> -do_configure_prepend() {
>> -    ${BUILD_CC} ${S}/gr-vocoder/lib/codec2/generate_codebook.c -o ${S=
}/gr-vocoder/lib/generate_codebook -lm
>> -    echo "ADD_EXECUTABLE(generate_codebook IMPORTED)" >${S}/gr-vocode=
r/lib/generate_codebook.txt
>> -    echo "SET_PROPERTY(TARGET generate_codebook APPEND PROPERTY IMPOR=
TED_CONFIGURATIONS RELEASE)" >>${S}/gr-vocoder/lib/generate_codebook.txt
>> -    echo 'SET_TARGET_PROPERTIES(generate_codebook PROPERTIES IMPORTED=
_LOCATION_RELEASE "${S}/gr-vocoder/lib/generate_codebook")' >>${S}/gr-voc=
oder/lib/generate_codebook.txt
>> -}
>> -
>> -do_compile_prepend() {
>> -    cp ${S}/gr-vocoder/lib/codec2/defines.h ${OECMAKE_BUILDPATH}/gr-v=
ocoder/lib/codec2
>> -}
>> -
>> -PACKAGES +=3D " \
>> -    ${PN}-grc \
>> -    ${PN}-examples \
>> -"
>> -
>> -FILES_${PN}-grc =3D "${datadir}/gnuradio/grc"
>> -FILES_${PN}-examples =3D "${datadir}/gnuradio/examples"
>> -
>> -FILES_${PN} +=3D "${PYTHON_SITEPACKAGES_DIR}/gnuradio"
>> -FILES_${PN} +=3D "${datadir}/gnuradio/modtool"
>> -# The following needs fixing upstream
>> -FILES_${PN} +=3D "${prefix}/etc/gnuradio"
>> -
>> -FILES_${PN}-dbg +=3D "${PYTHON_SITEPACKAGES_DIR}/gnuradio/.debug \
>> -                    ${PYTHON_SITEPACKAGES_DIR}/gnuradio/*/.debug \
>> -                    ${datadir}/gnuradio/examples/*/.debug \
>> -"
>> -
>> -PV =3D "3.6.5"
>> -
>> -FILESPATHPKG_prepend =3D "gnuradio-git:"
>> -
>> -SRCREV =3D "a7b3a9339106aaba72195b693dfeaa98f194e0d5"
>> -
>> -# Make it easy to test against developer repos and branches
>> -GIT_REPO =3D "gnuradio.git"
>> -GIT_BRANCH =3D "master"
>> -
>> -SRC_URI =3D "git://git.gnuradio.org/${GIT_REPO};branch=3D${GIT_BRANCH=
} \
>> -           file://0001-gr-trellis-Kill-docs-hard.patch \
>> -"
>> -
>> -S=3D"${WORKDIR}/git"
>> -
>> -OECMAKE_BUILDPATH =3D "${S}/build"
>> -OECMAKE_SOURCEPATH =3D "${S}"
>> -
>> -EXTRA_OECMAKE =3D "-DENABLE_GR_ATSC=3DFALSE \
>> -                 -DENABLE_GR_FCD=3DOFF \
>> -                 -DENABLE_GR_WXGUI=3DOFF \
>> -                 -DENABLE_GR_VIDEO_SDL=3DOFF \
>> -                 -DENABLE_SPHINX=3DOFF -DENABLE_DOXYGEN=3DOFF \
>> -                 -DIMPORT_EXECUTABLES=3D${S}/gr-vocoder/lib/generate_=
codebook.txt \
>> -                 -DQT_HEADERS_DIR=3D${STAGING_INCDIR}/qt4 \
>> -                 -DQT_QTCORE_INCLUDE_DIR=3D${STAGING_INCDIR}/qt4/QtCo=
re \
>> -                 -DQT_LIBRARY_DIR=3D${STAGING_LIBDIR} \
>> -                 -DQT_QTCORE_LIBRARY_RELEASE=3D${STAGING_LIBDIR}/libQ=
tCore.so \
>> -                 -DQT_QTGUI_LIBRARY_RELEASE=3D${STAGING_LIBDIR}/libQt=
Gui.so \
>> -                 ${@base_contains('TUNE_FEATURES', 'neon', \
>> -                     '-Dhave_mfpu_neon=3D1', '-Dhave_mfpu_neon=3D0', =
d)} \
>> -"
>> -
>> -inherit distutils-base cmake pkgconfig
>> -
>> -EXTRA_OEMAKE =3D "-C ${OECMAKE_BUILDPATH}"
>> -
>> --=20
>> 1.8.3.1
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20


--U2Du8DtWu4D1gUHV54pw8FsnCaQcphltR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJShi4jAAoJEMDJd4rr0mer7LMH/1p40RgW4GlXZL9W+ToYb4wk
DQhQgWnHvjNDuqKFSkFjXZkfIJiOpSAQXmcu0z1NF5kMRJN4U31/jrdWPeshwjSp
1PI/C0uapZCFFFNjgZHNrcaHdI6pnrf9BhmapsDYvb7HMYEKXRyJwfwrAgly8iw8
TAtgs4u69ocekcomvSYNKlFsc7YccN9/qDvFoTfuxrsdCvt8kYdyFij6hwybUD05
bg1t6iieY+dkRrG/DWciJ6QrLja0MDs2xS17IR1na8OYJPXn0AjF4S9BzFfidWou
QW6PiU5VwD/uMMmVWiIBe53A49mQnO1Ds04IVRnVs4phAVxov7iPfGlVfIpJcNA=
=o/IA
-----END PGP SIGNATURE-----

--U2Du8DtWu4D1gUHV54pw8FsnCaQcphltR--
