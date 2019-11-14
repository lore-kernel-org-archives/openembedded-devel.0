Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 67B946C106
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 22:10:29 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id g50so8602176qtb.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 14:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=E2i7LBLvFG8/mnB0lOaVCqwGq2RUa3XoHTO/GPUMcKA=;
	b=irOTcK/78QcYVMiCXi5WT9ppEC6I+JGeYV6+dVWs77IomPEjy+zwnGD7qsn69iBHCs
	87D71icVTE7a1PSsMn9Y8x+Q1NBrUgEEd1LclTdQeCd9JtZny/0VYxXZpUDNzMYtjoeQ
	XzI2JTdCGv2RA8Kun2AdTEHJgwqLJUq3MttQU2NYEfRzCvYtZjQTHeOf1eBTnFyaRJ/b
	N5F21dsdlY2TtBPzQQ8LSzx2PbDzx16EuF0sF+n1Q1gNYgi6U3DTUX197DDg7VgA5k9h
	8P/G7WciLN0Vk9Ox2c/MLmcsTkHdNVIuZzCSpZb8Q8iqd+2nma+JxZnjyVCQXmij6cf9
	eTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=E2i7LBLvFG8/mnB0lOaVCqwGq2RUa3XoHTO/GPUMcKA=;
	b=lm4AIRVPZtKoSdcvZBHKxNAbGjNrx+dB1MfY5+nG9j0/T1McnbadtS70EvkQ7jjuoS
	7EDMTrJZ+8C5EINK3gBbJfWlqZFF0QFVDX6c8oIJ7jBqW1rsBzdLObDtKu6MNdgnKlAT
	ciYT0IUcS2Kj8yh0vIzEhDIf0Xi9D1EPIWnA2XtHU8B5vSR2VbvyAC6kBMhhLdzwHqt+
	R6mixRg5NGNunxqGCmjZbsb2lejpy1JT2sBxckeDzNmjoMLINSOtBOmgaKOg+kYYrmBt
	j9CjBpFIVrJPplopQQpI5mlSrYXQQJSI8bdHQyuLZcQ4vN121gKqb+PPtG8pwuVYZWdz
	LRKw==
X-Gm-Message-State: APjAAAWcIKYweP3N8wh0i9JRiZxtrVbnLDwALT2huMNiDXYzJIa+3iOM
	mFYjQavgr7QpPbT2od5UQC2AU09edyoP+Q2OsZY=
X-Google-Smtp-Source: APXvYqzYMqapjnyf+SCICk/m1PejU3tUpWJOq84uSRVQk2EqyxZeUbFcBVNHdW8/b33Z/9o4asXe3+poXaILhdqttug=
X-Received: by 2002:aed:2724:: with SMTP id n33mr10732770qtd.194.1573769429177;
	Thu, 14 Nov 2019 14:10:29 -0800 (PST)
MIME-Version: 1.0
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
	<20191114194930.2786-5-schnitzeltony@gmail.com>
In-Reply-To: <20191114194930.2786-5-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Nov 2019 14:10:03 -0800
Message-ID: <CAMKF1sqekHs4t7b6pa=uN6_kCvS0eOJCaDupYXz5SjrnZvACbg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 04/16] evolution-data-server: upgrade 3.26.6 -> 3.34.1 and rework
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Nov 2019 22:10:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2019 at 11:50 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> * a native variant had to be introduced for code-generator tools
> * gobject-introspection builds theoretically :) Unfortunataelly qemu runs
>   with 100% CPU load and never returns -> disable introspection for now
> * add PACKAGECONFIGs for new dependencies - disabled by default
> * give up fine grained packaging: It was broken over the years completely
>   and nobody seemed to take care.
> * ICU-patch does not apply anymore and it seems upstream has fixed issues
>   with ICU
> * add upstream-version-is-even to inherit
> * rename folder containing recipe
> * get rid of gconf dependency
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...for-address-localization-when-LC_ADD.patch |  33 -----
>  ...-to-LDFLAGS-when-linking-libphonenum.patch |  36 ------
>  ...ntrispection-support-to-work-with-OE.patch |  75 ------------
>  .../eds/evolution-data-server_3.32.4.bb       | 113 ------------------
>  .../evolution-data-server-native.bb           |  23 ++++
>  .../evolution-data-server.bb                  |  70 +++++++++++
>  .../evolution-data-server.inc                 |  15 +++
>  ...keLists.txt-Remove-TRY_RUN-for-iconv.patch |  28 +++--
>  ...txt-remove-CHECK_C_SOURCE_RUNS-check.patch |   0
>  ...the-Novell-sample-contact-with-somet.patch |   0
>  .../0004-call-native-helpers.patch}           |  33 +++--
>  .../evolution-data-server/iconv-detect.h      |   0
>  12 files changed, 137 insertions(+), 289 deletions(-)
>  delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/00=
05-Use-LC_MESSAGES-for-address-localization-when-LC_ADD.patch

this patch was needed for musl build, and it was marked not upstream
worthy, so I wonder
if we drop it then will it fail musl build.

>  delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/00=
06-Dont-add-usr-lib-to-LDFLAGS-when-linking-libphonenum.patch
>  delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/00=
07-Modify-gobject-intrispection-support-to-work-with-OE.patch
>  delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server_3.=
32.4.bb
>  create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolut=
ion-data-server-native.bb
>  create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolut=
ion-data-server.bb
>  create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolut=
ion-data-server.inc
>  rename meta-gnome/recipes-gnome/{eds =3D> evolution-data-server}/evoluti=
on-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch (60%)
>  rename meta-gnome/recipes-gnome/{eds =3D> evolution-data-server}/evoluti=
on-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch (=
100%)
>  rename meta-gnome/recipes-gnome/{eds =3D> evolution-data-server}/evoluti=
on-data-server/0003-contact-Replace-the-Novell-sample-contact-with-somet.pa=
tch (100%)
>  rename meta-gnome/recipes-gnome/{eds/evolution-data-server/0004-Add-nati=
ve-suffix-to-exacutables-produced-and-run-du.patch =3D> evolution-data-serv=
er/evolution-data-server/0004-call-native-helpers.patch} (52%)
>  rename meta-gnome/recipes-gnome/{eds =3D> evolution-data-server}/evoluti=
on-data-server/iconv-detect.h (100%)
>
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0005-Use-=
LC_MESSAGES-for-address-localization-when-LC_ADD.patch b/meta-gnome/recipes=
-gnome/eds/evolution-data-server/0005-Use-LC_MESSAGES-for-address-localizat=
ion-when-LC_ADD.patch
> deleted file mode 100644
> index 55ab5a7fc..000000000
> --- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0005-Use-LC_MESS=
AGES-for-address-localization-when-LC_ADD.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 95425206e7317e59b7ca06d7f838ad357cdd200c Mon Sep 17 00:00:00 2001
> -From: Piotr Tworek <tworaz@tworaz.net>
> -Date: Wed, 14 Aug 2019 00:31:54 +0200
> -Subject: [PATCH 5/7] Use LC_MESSAGES for address localization when LC_AD=
DRESS
> - is not available.
> -
> -Musl does not define LC_ADDRESS unfortunately.
> -
> -Upstream-Status: Inappropriate [musl specific]
> -
> -Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
> ----
> - src/addressbook/libebook-contacts/e-phone-number-private.cpp | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/src/addressbook/libebook-contacts/e-phone-number-private.cp=
p b/src/addressbook/libebook-contacts/e-phone-number-private.cpp
> -index 4c5aebb..9abcebd 100644
> ---- a/src/addressbook/libebook-contacts/e-phone-number-private.cpp
> -+++ b/src/addressbook/libebook-contacts/e-phone-number-private.cpp
> -@@ -36,6 +36,10 @@
> - #include <phonenumbers/logger.h>
> - #include <phonenumbers/phonenumberutil.h>
> -
> -+#ifndef LC_ADDRESS
> -+#define LC_ADDRESS LC_MESSAGES
> -+#endif
> -+
> - using i18n::phonenumbers::PhoneNumber;
> - using i18n::phonenumbers::PhoneNumberUtil;
> -
> ---
> -2.21.0
> -
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0006-Dont=
-add-usr-lib-to-LDFLAGS-when-linking-libphonenum.patch b/meta-gnome/recipes=
-gnome/eds/evolution-data-server/0006-Dont-add-usr-lib-to-LDFLAGS-when-link=
ing-libphonenum.patch
> deleted file mode 100644
> index c0c1427fd..000000000
> --- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0006-Dont-add-us=
r-lib-to-LDFLAGS-when-linking-libphonenum.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From fb9164bbca5b425f1cf1bb3cac51d06afe81938a Mon Sep 17 00:00:00 2001
> -From: Piotr Tworek <tworaz@tworaz.net>
> -Date: Wed, 14 Aug 2019 00:47:59 +0200
> -Subject: [PATCH 6/7] Dont add /usr/lib to LDFLAGS when linking libphonen=
umber.
> -
> -This will refer to host lib dir which is not what we want.
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
> ----
> - cmake/modules/FindPhonenumber.cmake | 6 ++----
> - 1 file changed, 2 insertions(+), 4 deletions(-)
> -
> -diff --git a/cmake/modules/FindPhonenumber.cmake b/cmake/modules/FindPho=
nenumber.cmake
> -index 04d1056..70c0c41 100644
> ---- a/cmake/modules/FindPhonenumber.cmake
> -+++ b/cmake/modules/FindPhonenumber.cmake
> -@@ -37,12 +37,10 @@ string(TOUPPER "${WITH_PHONENUMBER}" optupper)
> - if(("${optupper}" STREQUAL "ON") OR ("${substr}" STREQUAL "${CMAKE_BINA=
RY_DIR}"))
> -       set(WITH_PHONENUMBER "ON")
> -       set(PHONENUMBER_INCLUDE_DIRS "${INCLUDE_INSTALL_DIR}")
> --      set(PHONENUMBER_LIB_DIRS ${LIB_INSTALL_DIR})
> --      set(PHONENUMBER_LDFLAGS -L${PHONENUMBER_LIB_DIRS} ${PHONENUMBER_L=
DFLAGS})
> -+      set(PHONENUMBER_LDFLAGS  ${PHONENUMBER_LDFLAGS})
> - else(("${optupper}" STREQUAL "ON") OR ("${substr}" STREQUAL "${CMAKE_BI=
NARY_DIR}"))
> -       set(PHONENUMBER_INCLUDE_DIRS "${WITH_PHONENUMBER}/include")
> --      set(PHONENUMBER_LIB_DIRS ${WITH_PHONENUMBER}/lib${LIB_SUFFIX})
> --      set(PHONENUMBER_LDFLAGS -L${PHONENUMBER_LIB_DIRS} ${PHONENUMBER_L=
DFLAGS})
> -+      set(PHONENUMBER_LDFLAGS ${PHONENUMBER_LDFLAGS})
> - endif(("${optupper}" STREQUAL "ON") OR ("${substr}" STREQUAL "${CMAKE_B=
INARY_DIR}"))
> -
> - unset(bindirlen)
> ---
> -2.21.0
> -
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0007-Modi=
fy-gobject-intrispection-support-to-work-with-OE.patch b/meta-gnome/recipes=
-gnome/eds/evolution-data-server/0007-Modify-gobject-intrispection-support-=
to-work-with-OE.patch
> deleted file mode 100644
> index c00082a2c..000000000
> --- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0007-Modify-gobj=
ect-intrispection-support-to-work-with-OE.patch
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -From d84f4fd68441e934b37be2a6917abad52c5d1bda Mon Sep 17 00:00:00 2001
> -From: Piotr Tworek <tworaz@tworaz.net>
> -Date: Fri, 16 Aug 2019 21:22:16 +0200
> -Subject: [PATCH 7/7] Modify gobject-intrispection support to work with O=
E.
> -
> -1. Use tools provided by the recipe sysroot instread of host ones.
> -2. Make sure all the required dirs make it into g-ir-scanner via
> -   LDFLAGS.
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
> ----
> - cmake/modules/GObjectIntrospection.cmake | 12 ++++++++++--
> - 1 file changed, 10 insertions(+), 2 deletions(-)
> -
> -diff --git a/cmake/modules/GObjectIntrospection.cmake b/cmake/modules/GO=
bjectIntrospection.cmake
> -index 5be5042..67c035a 100644
> ---- a/cmake/modules/GObjectIntrospection.cmake
> -+++ b/cmake/modules/GObjectIntrospection.cmake
> -@@ -20,6 +20,9 @@ if(ENABLE_INTROSPECTION)
> -       pkg_check_variable(G_IR_SCANNER gobject-introspection-1.0 g_ir_sc=
anner)
> -       pkg_check_variable(G_IR_COMPILER gobject-introspection-1.0 g_ir_c=
ompiler)
> -
> -+      string(CONCAT G_IR_SCANNER $ENV{PKG_CONFIG_SYSROOT_DIR} "${G_IR_S=
CANNER}")
> -+      string(CONCAT G_IR_COMPILER $ENV{PKG_CONFIG_SYSROOT_DIR} "${G_IR_=
COMPILER}")
> -+
> -       if(NOT G_IR_SCANNER)
> -               message(FATAL_ERROR "g-ir-scanner not provided by gobject=
-introspection-1.0, you can disable GObject introspection by -DENABLE_INTRO=
SPECTION=3DOFF")
> -       endif(NOT G_IR_SCANNER)
> -@@ -116,7 +119,7 @@ macro(gir_add_introspection gir)
> -               file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/${_gir_name}_files=
 "${_gir_files}")
> -
> -               add_custom_command(
> --                      COMMAND ${CMAKE_COMMAND} -E env "CC=3D'${CMAKE_C_=
COMPILER}'" LDFLAGS=3D
> -+                      COMMAND ${CMAKE_COMMAND} -E env "CC=3D'${CMAKE_C_=
COMPILER}'" LDFLAGS=3D${INTROSPECTION_SCANNER_LDFLAGS}
> -                               ${INTROSPECTION_SCANNER_ENV}
> -                               ${G_IR_SCANNER}
> -                               ${INTROSPECTION_SCANNER_ARGS}
> -@@ -186,6 +189,7 @@ macro(gir_add_introspection_simple gir_library pkg_e=
xport_prefix gir_library_ver
> -       unset(INTROSPECTION_SCANNER_ARGS)
> -       unset(INTROSPECTION_SCANNER_ENV)
> -       unset(INTROSPECTION_COMPILER_ARGS)
> -+      unset(INTROSPECTION_SCANNER_LDFLAGS)
> -
> -       set(${gir_vars_prefix} ${gir_library})
> -       set(${gir_vars_prefix}_SCANNERFLAGS "--warn-all")
> -@@ -223,12 +227,12 @@ macro(gir_add_introspection_simple gir_library pkg=
_export_prefix gir_library_ver
> -               --add-include-path=3D${CMAKE_CURRENT_SOURCE_DIR}
> -               --library-path=3D${CMAKE_BINARY_DIR}
> -               --library-path=3D${CMAKE_BINARY_DIR}/src
> -+              --library-path=3D${CMAKE_BINARY_DIR}/src/private
> -               --library-path=3D${CMAKE_CURRENT_BINARY_DIR}
> -               ${_gir_extra_libdirs}
> -               ${_gir_identifies_prefixes}
> -               ${_gir_deps}
> -               --add-include-path=3D${SHARE_INSTALL_PREFIX}/gir-1.0
> --              --library-path=3D${LIB_INSTALL_DIR}
> -               ${_extra_library_path}
> -               --pkg-export ${pkg_export_prefix}-${gir_library_version}
> -               --c-include=3D${c_include}
> -@@ -279,6 +283,10 @@ macro(gir_add_introspection_simple gir_library pkg_=
export_prefix gir_library_ver
> -               )
> -       endif(UNIX)
> -
> -+      _gir_list_prefix(_gir_scanner_ldflags ${gir_extra_libdirs_var} "-=
Wl,-rpath-link=3D")
> -+      string(REPLACE ";" " " _gir_scanner_ldflags "${_gir_scanner_ldfla=
gs}")
> -+      set(INTROSPECTION_SCANNER_LDFLAGS "${_gir_scanner_ldflags}")
> -+
> -       set(INTROSPECTION_SCANNER_ENV
> -               ${_loader_library_path_var}=3D"${_extra_loader_library_pa=
th_native}"
> -       )
> ---
> -2.21.0
> -
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb=
 b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
> deleted file mode 100644
> index b4174cbb0..000000000
> --- a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
> +++ /dev/null
> @@ -1,113 +0,0 @@
> -SUMMARY =3D "Evolution database backend server"
> -HOMEPAGE =3D "http://www.gnome.org/projects/evolution/"
> -BUGTRACKER =3D "https://bugzilla.gnome.org/"
> -
> -LICENSE =3D "LGPLv2 & LGPLv2+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6a6e689d19255cf0557f3fe7d7068=
212 \
> -                    file://src/camel/camel.h;endline=3D24;md5=3D342fc5e9=
357254bc30c24e43ae47d9a1 \
> -                    file://src/libedataserver/e-data-server-util.h;endli=
ne=3D20;md5=3D8f21a9c80ea82a4fb80b5f959f672543 \
> -                    file://src/calendar/libecal/e-cal.h;endline=3D24;md5=
=3De699ec3866f73f129f7a4ffffdcfc196"
> -
> -DEPENDS =3D " \
> -    intltool-native gperf-native glib-2.0-native \
> -    glib-2.0 gtk+3 libgnome-keyring libgdata libcanberra icu \
> -    dbus db virtual/libiconv zlib libsoup-2.4 libical nss libsecret \
> -"
> -
> -inherit gnomebase cmake gtk-doc gettext gobject-introspection perlnative=
 upstream-version-is-even vala
> -
> -SRC_URI +=3D "file://0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch =
\
> -            file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.=
patch \
> -            file://0003-contact-Replace-the-Novell-sample-contact-with-s=
omet.patch \
> -            file://0004-Add-native-suffix-to-exacutables-produced-and-ru=
n-du.patch \
> -            file://0005-Use-LC_MESSAGES-for-address-localization-when-LC=
_ADD.patch \
> -            file://0006-Dont-add-usr-lib-to-LDFLAGS-when-linking-libphon=
enum.patch \
> -            file://0007-Modify-gobject-intrispection-support-to-work-wit=
h-OE.patch \
> -            file://iconv-detect.h \
> -           "
> -SRC_URI[archive.md5sum] =3D "57820f3f88fc554e1a58665a52e12c05"
> -SRC_URI[archive.sha256sum] =3D "83f67cb4b680e892b22b51bcde64c788b7ac63e9=
2a99de401fb347e3794f4c7f"
> -
> -LKSTRFTIME =3D "HAVE_LKSTRFTIME=3DON"
> -LKSTRFTIME_libc-musl =3D "HAVE_LKSTRFTIME=3DOFF"
> -
> -EXTRA_OECMAKE =3D " \
> -    -D${LKSTRFTIME} \
> -    -DSYSCONF_INSTALL_DIR=3D${sysconfdir} \
> -    -DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', '')} \
> -"
> -
> -PACKAGECONFIG ??=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'in=
trospection', '', d)}"
> -PACKAGECONFIG[openldap] =3D "-DWITH_OPENLDAP=3DON,-DWITH_OPENLDAP=3DOFF,=
openldap"
> -PACKAGECONFIG[oauth2] =3D "-DENABLE_OAUTH2=3DON,-DENABLE_OAUTH2=3DOFF,js=
on-glib webkitgtk"
> -PACKAGECONFIG[mitkrb5] =3D "-DWITH_KRB5=3DON,-DWITH_KRB5=3DOFF,krb5"
> -PACKAGECONFIG[goa] =3D "-DENABLE_GOA=3DON,-DENABLE_GOA=3DOFF,gnome-onlin=
e-accounts"
> -PACKAGECONFIG[weather] =3D "-DENABLE_WEATHER=3DON,-DENABLE_WEATHER=3DOFF=
,libgweather"
> -PACKAGECONFIG[phonenumber] =3D "-DWITH_PHONENUMBER=3DON,-DWITH_PHONENUMB=
ER=3DOFF,libphonenumber"
> -PACKAGECONFIG[introspection] =3D "-DENABLE_INTROSPECTION=3DON,-DENABLE_I=
NTROSPECTION=3DOFF"
> -PACKAGECONFIG[vala] =3D "-DENABLE_VALA_BINDINGS=3DON -DVAPIGEN=3D${STAGI=
NG_BINDIR_NATIVE}/vapigen,-DENABLE_VALA_BINDINGS=3DOFF"
> -
> -# -ldb needs this on some platforms
> -LDFLAGS +=3D "-lpthread -lgmodule-2.0 -lgthread-2.0"
> -
> -do_configure_append () {
> -    cp ${WORKDIR}/iconv-detect.h ${S}/src
> -
> -    # fix native perl shebang
> -    sed -i 's:${STAGING_BINDIR_NATIVE}/perl-native:${bindir}:' ${B}/src/=
tools/addressbook-export/csv2vcard
> -}
> -
> -do_compile_prepend() {
> -    # CMake does not support building native binaries when cross compili=
ng. As result
> -    # it always cross compiles them for the target and then aborts when =
they fail to run.
> -    # To work around this manually build required tools and patch cmake =
targets to use
> -    # those native binaries we built here.
> -    ${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} -I${B} ${S}/src/camel/c=
amel-gen-tables.c \
> -        -o ${B}/src/camel/camel-gen-tables-native
> -    ${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} -I${B} $(pkg-config-nat=
ive --cflags glib-2.0) \
> -        ${S}/src/addressbook/libebook-contacts/gen-western-table.c \
> -        -o ${B}/src/addressbook/libebook-contacts/gen-western-table-nati=
ve \
> -        $(pkg-config-native --libs glib-2.0)
> -}
> -
> -
> -PACKAGES =3D+ "libebook-contacts libebook-contacts-dev \
> -             libcamel libcamel-dev libebook libebook-dev libecal libecal=
-dev \
> -             libedata-book libedata-book-dev libedata-cal libedata-cal-d=
ev \
> -             libedataserver libedataserver-dev \
> -             libedataserverui libedataserverui-dev"
> -
> -FILES_${PN} =3D+ "${systemd_user_unitdir} \
> -                ${datadir}/dbus-1 \
> -                ${datadir}/evolution-data-server-*/ui/"
> -RDEPENDS_${PN} +=3D "perl"
> -
> -FILES_libcamel =3D "${libdir}/libcamel-*.so.* \
> -                  ${libdir}/libcamel-provider-*.so.* \
> -                  ${libdir}/girepository-*/Camel-*.typelib \
> -                  ${libdir}/evolution-data-server*/camel-providers/*.so =
\
> -                  ${libdir}/evolution-data-server*/camel-providers/*.url=
s"
> -FILES_libebook =3D "${libdir}/libebook-*.so.* \
> -                  ${libdir}/girepository-*/EBook-*.typelib"
> -RRECOMMENDS_libebook =3D "libedata-book"
> -
> -FILES_libebook-contacts =3D "${libdir}/libebook-contacts-*.so.* \
> -                           ${libdir}/girepository-*/EBookContacts-*.type=
lib"
> -
> -FILES_libecal =3D "${libdir}/libecal-*.so.*"
> -RRECOMMENDS_libecal =3D "libedata-cal tzdata"
> -
> -FILES_libedata-book =3D "${libexecdir}/e-addressbook-factory \
> -                       ${datadir}/dbus-1/services/*.AddressBook.service =
\
> -                       ${libdir}/libedata-book-*.so.* \
> -                       ${libdir}/evolution-data-server-*/extensions/libe=
book*.so"
> -
> -FILES_libedata-cal =3D "${libexecdir}/e-calendar-factory \
> -                      ${datadir}/dbus-1/services/*.Calendar.service \
> -                      ${libdir}/libedata-cal-*.so.* \
> -                      ${libdir}/evolution-data-server-*/extensions/libec=
al*.so"
> -
> -FILES_libedataserver =3D "${libdir}/libedataserver-*.so.* \
> -                        ${libdir}/girepository-*/EDataServer-*.typelib"
> -
> -FILES_libedataserverui =3D "${libdir}/libedataserverui-*.so.*"
> diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server-native.bb b/meta-gnome/recipes-gnome/evolution-data-server/evoluti=
on-data-server-native.bb
> new file mode 100644
> index 000000000..681a61c33
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r-native.bb
> @@ -0,0 +1,23 @@
> +require ${BPN}.inc
> +
> +inherit native
> +
> +DEPENDS =3D "glib-2.0-native"
> +
> +# build native helpers
> +do_compile() {
> +    cd ${S}/src/camel
> +    sed -i 's:#include "evolution-data-server-config.h"::g' camel-gen-ta=
bles.c
> +    ${CC} -o ${B}/camel-gen-tables camel-gen-tables.c ${CFLAGS} ${LDFLAG=
S}
> +
> +    LDFLAGS_glib=3D`pkg-config glib-2.0 --libs`
> +    CFLAGS_glib=3D`pkg-config glib-2.0 --cflags`
> +    cd ${S}/src/addressbook/libebook-contacts
> +    sed -i 's:#include "evolution-data-server-config.h"::g' gen-western-=
table.c
> +    ${CC} -o ${B}/gen-western-table gen-western-table.c ${CFLAGS} ${CFLA=
GS_glib} ${LDFLAGS} ${LDFLAGS_glib}
> +}
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 755 ${B}/* ${D}${bindir}
> +}
> diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data=
-server.bb
> new file mode 100644
> index 000000000..a8bb69f00
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
> @@ -0,0 +1,70 @@
> +require ${BPN}.inc
> +
> +DEPENDS =3D " \
> +    ${BPN}-native intltool-native gperf-native \
> +    glib-2.0 gtk+3 libgdata \
> +    dbus db virtual/libiconv zlib libsoup-2.4 libical nss libsecret \
> +"
> +
> +inherit distro_features_check cmake gtk-doc gettext gobject-introspectio=
n perlnative pythonnative
> +
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> +
> +SRC_URI +=3D " \
> +    file://0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch \
> +    file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch \
> +    file://0003-contact-Replace-the-Novell-sample-contact-with-somet.pat=
ch \
> +    file://0004-call-native-helpers.patch \
> +    file://iconv-detect.h \
> +"
> +
> +LKSTRFTIME =3D "HAVE_LKSTRFTIME=3DON"
> +LKSTRFTIME_libc-musl =3D "HAVE_LKSTRFTIME=3DOFF"
> +
> +# For arm qemu-arm runs at 100% CPU load and never returns - so disable =
introspection for now
> +GI_DATA_ENABLED=3D"False"
> +
> +EXTRA_OECMAKE =3D " \
> +    -DSYSCONF_INSTALL_DIR=3D${sysconfdir} \
> +    -DWITH_KRB5=3DOFF \
> +    -DENABLE_GOA=3DOFF \
> +    -DENABLE_UOA=3DOFF \
> +    -DENABLE_GOOGLE_AUTH=3DOFF \
> +    -DENABLE_WEATHER=3DOFF \
> +    -DENABLE_INTROSPECTION=3D${@bb.utils.contains('GI_DATA_ENABLED', 'Tr=
ue', 'ON', 'OFF', d)} \
> +    -D${LKSTRFTIME} \
> +    -DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', '')} \
> +"
> +
> +PACKAGECONFIG[canberra] =3D "-DENABLE_CANBERRA=3DON,-DENABLE_CANBERRA=3D=
OFF,libcanberra"
> +PACKAGECONFIG[oauth]    =3D "-DENABLE_OAUTH2=3DON,-DENABLE_OAUTH2=3DOFF,=
webkitgtk json-glib"
> +
> +# BROKEN: due missing pkg-config in openldap eds' cmake finds host-libs =
when
> +# searching for openldap-libs
> +PACKAGECONFIG[openldap] =3D "-DWITH_OPENLDAP=3DON,-DWITH_OPENLDAP=3DOFF,=
openldap"
> +
> +# -ldb needs this on some platforms
> +LDFLAGS +=3D "-lpthread -lgmodule-2.0 -lgthread-2.0"
> +
> +do_configure_append () {
> +    cp ${WORKDIR}/iconv-detect.h ${S}/src
> +
> +    # fix native perl shebang
> +    sed -i 's:${STAGING_BINDIR_NATIVE}/perl-native:${bindir}:' ${B}/src/=
tools/addressbook-export/csv2vcard
> +
> +    # fix abs path for g-ir-scanner-wrapper
> +    sed  -i ${B}/build.ninja \
> +        -e 's: ${bindir}/g-ir-scanner-wrapper: ${STAGING_BINDIR}/g-ir-sc=
anner-wrapper:g'
> +}
> +
> +do_compile_prepend() {
> +    export GIR_EXTRA_LIBS_PATH=3D"${B}/camel/.libs:${B}/libedataserver/.=
libs"
> +}
> +
> +FILES_${PN} =3D+ " \
> +    ${datadir}/dbus-1 \
> +    ${datadir}/evolution-data-server-*/ui/ \
> +    ${systemd_user_unitdir} \
> +"
> +
> +RDEPENDS_${PN} +=3D "perl"
> diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.inc
> new file mode 100644
> index 000000000..2e5176ce7
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "Evolution database backend server"
> +HOMEPAGE =3D "http://www.gnome.org/projects/evolution/"
> +BUGTRACKER =3D "https://bugzilla.gnome.org/"
> +
> +LICENSE =3D "LGPLv2 & LGPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6a6e689d19255cf0557f3fe7d7068=
212 \
> +                    file://src/camel/camel.h;endline=3D24;md5=3D342fc5e9=
357254bc30c24e43ae47d9a1 \
> +                    file://src/libedataserver/e-data-server-util.h;endli=
ne=3D20;md5=3D8f21a9c80ea82a4fb80b5f959f672543"
> +
> +inherit gnomebase
> +
> +SRC_URI[archive.md5sum] =3D "d1701875bbac80d6d62e9acfc6c43bea"
> +SRC_URI[archive.sha256sum] =3D "6ff56ba04cb639e627fe9d6e0ada106a10cadd68=
a0d53b8ec72b4e285df53abe"
> +PV =3D "3.34.1"
> +
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-CMak=
eLists.txt-Remove-TRY_RUN-for-iconv.patch b/meta-gnome/recipes-gnome/evolut=
ion-data-server/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-fo=
r-iconv.patch
> similarity index 60%
> rename from meta-gnome/recipes-gnome/eds/evolution-data-server/0001-CMake=
Lists.txt-Remove-TRY_RUN-for-iconv.patch
> rename to meta-gnome/recipes-gnome/evolution-data-server/evolution-data-s=
erver/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch
> index cc9dca4ea..e8c6d6a76 100644
> --- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-CMakeLists.=
txt-Remove-TRY_RUN-for-iconv.patch
> +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch
> @@ -1,7 +1,7 @@
> -From e32075119803f9fffbba01a31083e416cb213011 Mon Sep 17 00:00:00 2001
> +From 131b88a81aba3d72d566bc8a9d968941a98e0007 Mon Sep 17 00:00:00 2001
>  From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> -Date: Tue, 19 Dec 2017 16:37:20 +0100
> -Subject: [PATCH 1/7] CMakeLists.txt: Remove TRY_RUN for iconv
> +Date: Sun, 31 Mar 2019 18:11:55 +0200
> +Subject: [PATCH] CMakeLists.txt: Remove TRY_RUN for iconv
>  MIME-Version: 1.0
>  Content-Type: text/plain; charset=3DUTF-8
>  Content-Transfer-Encoding: 8bit
> @@ -13,22 +13,24 @@ Upstream-Status: Inappropriate [OE specific]
>
>  Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>  ---
> - CMakeLists.txt | 6 ------
> - 1 file changed, 6 deletions(-)
> + CMakeLists.txt | 11 -----------
> + 1 file changed, 11 deletions(-)
>
>  diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index f9d72db..ed99904 100644
> +index 1672daf..0b3e4e0 100644
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
> -@@ -526,15 +526,9 @@ endif(NOT HAVE_ICONV)
> +@@ -524,17 +524,6 @@ if(NOT HAVE_ICONV)
> +       message(FATAL_ERROR "You need to install a working iconv implemen=
tation, such as ftp://ftp.gnu.org/pub/gnu/libiconv")
> + endif(NOT HAVE_ICONV)
>
> - set(CMAKE_REQUIRED_LIBRARIES ${ICONV_LIBS})
> - file(TO_NATIVE_PATH "${CMAKE_BINARY_DIR}/" _binary_dir_with_separator)
> +-set(CMAKE_REQUIRED_LIBRARIES ${ICONV_LIBS})
> +-file(TO_NATIVE_PATH "${CMAKE_BINARY_DIR}/" _binary_dir_with_separator)
>  -CHECK_C_SOURCE_RUNS("#define ICONV_DETECT_BUILD_DIR \"${_binary_dir_wit=
h_separator}\"
>  -                   #include \"${CMAKE_SOURCE_DIR}/iconv-detect.c\"" _co=
rrect_iconv)
> - unset(_binary_dir_with_separator)
> - unset(CMAKE_REQUIRED_LIBRARIES)
> -
> +-unset(_binary_dir_with_separator)
> +-unset(CMAKE_REQUIRED_LIBRARIES)
> +-
>  -if(NOT _correct_iconv)
>  -      message(FATAL_ERROR "You need to install a working iconv implemen=
tation, such as ftp://ftp.gnu.org/pub/gnu/libiconv")
>  -endif(NOT _correct_iconv)
> @@ -37,5 +39,5 @@ index f9d72db..ed99904 100644
>   # Backtraces for debugging
>   # ******************************
>  --
> -2.21.0
> +2.20.1
>
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0002-CMak=
eLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch b/meta-gnome/recipes-gnom=
e/evolution-data-server/evolution-data-server/0002-CMakeLists.txt-remove-CH=
ECK_C_SOURCE_RUNS-check.patch
> similarity index 100%
> rename from meta-gnome/recipes-gnome/eds/evolution-data-server/0002-CMake=
Lists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch
> rename to meta-gnome/recipes-gnome/evolution-data-server/evolution-data-s=
erver/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0003-cont=
act-Replace-the-Novell-sample-contact-with-somet.patch b/meta-gnome/recipes=
-gnome/evolution-data-server/evolution-data-server/0003-contact-Replace-the=
-Novell-sample-contact-with-somet.patch
> similarity index 100%
> rename from meta-gnome/recipes-gnome/eds/evolution-data-server/0003-conta=
ct-Replace-the-Novell-sample-contact-with-somet.patch
> rename to meta-gnome/recipes-gnome/evolution-data-server/evolution-data-s=
erver/0003-contact-Replace-the-Novell-sample-contact-with-somet.patch
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Add-=
native-suffix-to-exacutables-produced-and-run-du.patch b/meta-gnome/recipes=
-gnome/evolution-data-server/evolution-data-server/0004-call-native-helpers=
.patch
> similarity index 52%
> rename from meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Add-n=
ative-suffix-to-exacutables-produced-and-run-du.patch
> rename to meta-gnome/recipes-gnome/evolution-data-server/evolution-data-s=
erver/0004-call-native-helpers.patch
> index 67023df2c..e320f6342 100644
> --- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Add-native-=
suffix-to-exacutables-produced-and-run-du.patch
> +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r/0004-call-native-helpers.patch
> @@ -1,26 +1,21 @@
> -From 30bd4ae3badb152c9f81c6d34014c586fa0cc825 Mon Sep 17 00:00:00 2001
> -From: Piotr Tworek <tworaz@tworaz.net>
> -Date: Mon, 12 Aug 2019 14:13:52 +0200
> -Subject: [PATCH 4/7] Add native suffix to exacutables produced and run d=
uring
> - build process.
> +From 9c375e3fcf8ff778a5010a07a7da4b6a58adec7c Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> +Date: Sun, 31 Mar 2019 19:11:31 +0200
> +Subject: [PATCH] call native helpers
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
>
> -CMake can't build tools for the host system when cross compiling. As
> -result eds currently fails to build in OE due to some programs being
> -cross compiled for the target and run on the host. To work around this
> -limitation modify existing targets using build time generated binaries
> -to invoke binaries suffixed with -native. We can inject such binaries
> -into expected locations prior to invoking ninja in do_compile.
> +Upstream-Status: Inappropriate[oe-specific]
>
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>  ---
>   src/addressbook/libebook-contacts/CMakeLists.txt | 2 +-
>   src/camel/CMakeLists.txt                         | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/src/addressbook/libebook-contacts/CMakeLists.txt b/src/addr=
essbook/libebook-contacts/CMakeLists.txt
> -index e9e3259..2ae72a8 100644
> +index e9e3259..e749d1b 100644
>  --- a/src/addressbook/libebook-contacts/CMakeLists.txt
>  +++ b/src/addressbook/libebook-contacts/CMakeLists.txt
>  @@ -25,7 +25,7 @@ target_link_libraries(gen-western-table
> @@ -28,12 +23,12 @@ index e9e3259..2ae72a8 100644
>   add_custom_command(
>         OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/e-name-western-tables.h
>  -      COMMAND ${CMAKE_CURRENT_BINARY_DIR}/gen-western-table "${CMAKE_CU=
RRENT_SOURCE_DIR}/e-name-western-tables.h.in" >${CMAKE_CURRENT_BINARY_DIR}/=
e-name-western-tables.h
> -+      COMMAND ${CMAKE_CURRENT_BINARY_DIR}/gen-western-table-native "${C=
MAKE_CURRENT_SOURCE_DIR}/e-name-western-tables.h.in" >${CMAKE_CURRENT_BINAR=
Y_DIR}/e-name-western-tables.h
> ++      COMMAND gen-western-table "${CMAKE_CURRENT_SOURCE_DIR}/e-name-wes=
tern-tables.h.in" >${CMAKE_CURRENT_BINARY_DIR}/e-name-western-tables.h
>         DEPENDS gen-western-table e-name-western-tables.h.in
>   )
>
>  diff --git a/src/camel/CMakeLists.txt b/src/camel/CMakeLists.txt
> -index be626a8..9226b2b 100644
> +index be626a8..14ac8b8 100644
>  --- a/src/camel/CMakeLists.txt
>  +++ b/src/camel/CMakeLists.txt
>  @@ -10,7 +10,7 @@ target_include_directories(camel-gen-tables PUBLIC
> @@ -41,10 +36,10 @@ index be626a8..9226b2b 100644
>   add_custom_command(
>         OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/camel-mime-tables.c
>  -      COMMAND ${CMAKE_CURRENT_BINARY_DIR}/camel-gen-tables >${CMAKE_CUR=
RENT_BINARY_DIR}/camel-mime-tables.c
> -+      COMMAND ${CMAKE_CURRENT_BINARY_DIR}/camel-gen-tables-native >${CM=
AKE_CURRENT_BINARY_DIR}/camel-mime-tables.c
> ++      COMMAND camel-gen-tables >${CMAKE_CURRENT_BINARY_DIR}/camel-mime-=
tables.c
>         DEPENDS camel-gen-tables
>   )
>
>  --
> -2.21.0
> +2.20.1
>
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/iconv-det=
ect.h b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r/iconv-detect.h
> similarity index 100%
> rename from meta-gnome/recipes-gnome/eds/evolution-data-server/iconv-dete=
ct.h
> rename to meta-gnome/recipes-gnome/evolution-data-server/evolution-data-s=
erver/iconv-detect.h
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

