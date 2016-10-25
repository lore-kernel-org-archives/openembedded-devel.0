Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A3CA671A47
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:32:12 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id h8so1160855wmi.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 06:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ntY2QxjnaLfVpY5FdCP+6Iu1zVO4NSgbDtCNDWkKxv0=;
	b=DHn1b9xwGBDj2I7CswxoyaSMcIYljfyg0uxALwh/t0dg16zSW6lVThd+4b98g5jVLy
	IdrQunuAu9xdKvCdXWS2BRXMwUP3mnmcuQQjm8m9myyZIvWHIWG9R3E85iyw9oPmubZC
	uzVzah/HPv3ogpbht3TS/ZO15Nh3dCkInC1NswhQ0g44cDCBb2o8erFIjMzF1AvnqmwS
	9AA0xJ7WodeTbwS+avXW4lP30zLaKckr1YiMtQxy3pru7QbcpzbKUmAOtzz8lNnrmmhh
	31ulcNDpPZUwEuzpYs/FzNskjh0YQ1cpZMDFX/JAfkp9RU2etBjj5Zkl4vEbxYY9Fq29
	JhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ntY2QxjnaLfVpY5FdCP+6Iu1zVO4NSgbDtCNDWkKxv0=;
	b=NuwJYwCU39pydqTmCn+UGM+nkf78xLmZLBfWH2P0+yvW6S+t1jl7FbR9SafrYr2HpN
	p4Fym42Z329b4BoCU1LawW7bdVyGtcwmRR2QFPrKTgNLxHo67aNdRernxPG+u8edoNTG
	eONU5ffSRjdJUZjooqu3i7oSzScUfp5wyX96CLUB8IazCsYlNuQWTKLXFr0lWWSqjq2X
	2rHwEq/dpiywMyei8jGoTtUU6BP0iJU8/riBeF59IdVZGcl5t1Lw4vBjewlDUbod0jJ2
	teKILh8ihcZXDOxcru3Q7Hg59qFxEH46RWIJYwITezfRclVYr2PG0XNY4i4kab9gE7qR
	Ypjw==
X-Gm-Message-State: ABUngvd5lq6DLm33NfwWS90E75AYNS88y5zPfaDkpaUR7+wdJPGhbnHKJ4Ey5G1EmabfjA==
X-Received: by 10.28.148.22 with SMTP id w22mr3563384wmd.42.1477402332801;
	Tue, 25 Oct 2016 06:32:12 -0700 (PDT)
Received: from localhost (ip-89-176-50-133.net.upcbroadband.cz.
	[89.176.50.133]) by smtp.gmail.com with ESMTPSA id
	im3sm25115862wjb.13.2016.10.25.06.32.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 25 Oct 2016 06:32:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 25 Oct 2016 15:32:11 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161025133211.GD2911@jama>
References: <20161019053834.11523-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161019053834.11523-1-raj.khem@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [meta-oe][PATCH 01/16] boinc: Add recipe for boinc-client
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
X-List-Received-Date: Tue, 25 Oct 2016 13:32:15 -0000
X-Groupsio-MsgNum: 63597
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UoPmpPX/dBe4BELn"
Content-Disposition: inline

--UoPmpPX/dBe4BELn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2016 at 10:38:19PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

boinc-client-7.6.33: boinc-client rdepends on libxscrnsaver, but it
isn't a build dependency, missing libxscrnsaver in DEPENDS or
PACKAGECONFIG? [build-deps]

> ---
>  .../boinc/boinc-client/boinc-AM_CONDITIONAL.patch  | 19 +++++
>  .../boinc/boinc-client/cross-compile.patch         | 92 ++++++++++++++++=
++++++
>  .../boinc/boinc-client/opengl_m4_check.patch       | 13 +++
>  .../recipes-extended/boinc/boinc-client_7.6.33.bb  | 60 ++++++++++++++
>  4 files changed, 184 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_=
CONDITIONAL.patch
>  create mode 100644 meta-oe/recipes-extended/boinc/boinc-client/cross-com=
pile.patch
>  create mode 100644 meta-oe/recipes-extended/boinc/boinc-client/opengl_m4=
_check.patch
>  create mode 100644 meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb
>=20
> diff --git a/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITI=
ONAL.patch b/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITION=
AL.patch
> new file mode 100644
> index 0000000..3ebf7c8
> --- /dev/null
> +++ b/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.pa=
tch
> @@ -0,0 +1,19 @@
> +--- A/configure.ac
> ++++ B/configure.ac
> +@@ -39,6 +39,7 @@ AC_PROG_CC
> + AC_PROG_CXX
> + AC_PROG_F77
> + AC_PROG_CPP
> ++AC_PROG_OBJCXX
> + AC_PROG_MAKE_SET
> + SAH_LINKS
> + AC_LANG_PUSH(C)
> +@@ -744,6 +745,8 @@ AM_CONDITIONAL(ENABLE_LIBRARIES, [test "
> + AM_CONDITIONAL(INSTALL_HEADERS, [test "${enable_install_headers}" =3D y=
es])
> + AM_CONDITIONAL(HAVE_CUDA_LIB, [test "${enable_client}" =3D yes -a -f ./=
coprocs/CUDA/posix/${boinc_platform}/libcudart.so])
> +=20
> ++PKG_CHECK_MODULES([GTK2], [gtk+-2.0])
> ++
> + dnl =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> + dnl some more vodoo required for building portable client-binary (clien=
t, clientgui)
> + dnl =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/meta-oe/recipes-extended/boinc/boinc-client/cross-compile.pa=
tch b/meta-oe/recipes-extended/boinc/boinc-client/cross-compile.patch
> new file mode 100644
> index 0000000..3d29558
> --- /dev/null
> +++ b/meta-oe/recipes-extended/boinc/boinc-client/cross-compile.patch
> @@ -0,0 +1,92 @@
> +Index: boinc-client_release-7.6-7.6.33/api/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- boinc-client_release-7.6-7.6.33.orig/api/Makefile.am
> ++++ boinc-client_release-7.6-7.6.33/api/Makefile.am
> +@@ -43,18 +43,18 @@ endif
> +=20
> + lib_LTLIBRARIES =3D libboinc_api.la
> + libboinc_api_la_SOURCES =3D $(api_files)
> +-libboinc_api_la_LDFLAGS =3D -L$(libdir) -rpath $(libdir) -version-numbe=
r $(LIBBOINC_VERSION)
> ++libboinc_api_la_LDFLAGS =3D -version-number $(LIBBOINC_VERSION)
> +=20
> + if BUILD_GRAPHICS_API
> + lib_LTLIBRARIES +=3D libboinc_graphics2.la
> + libboinc_graphics2_la_SOURCES =3D $(graphics2_files)
> + libboinc_graphics2_la_CPPFLAGS =3D -I$(top_srcdir) -I$(top_srcdir)/lib =
-I$(top_srcdir)/samples/image_libs
> +-libboinc_graphics2_la_LDFLAGS =3D -L$(libdir) -rpath $(libdir) -version=
-number $(LIBBOINC_VERSION) -ljpeg
> ++libboinc_graphics2_la_LDFLAGS =3D -version-number $(LIBBOINC_VERSION) -=
ljpeg
> + endif #BUILD_GRAPHICS_API
> +=20
> + lib_LTLIBRARIES +=3D libboinc_opencl.la
> + libboinc_opencl_la_SOURCES =3D $(opencl_files)
> +-libboinc_opencl_la_LDFLAGS =3D -L$(libdir) -rpath $(libdir) -version-nu=
mber $(LIBBOINC_VERSION)
> ++libboinc_opencl_la_LDFLAGS =3D -version-number $(LIBBOINC_VERSION)
> +=20
> + if INSTALL_HEADERS
> + ## install only headers that are meant for exporting the API !!
> +Index: boinc-client_release-7.6-7.6.33/lib/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- boinc-client_release-7.6-7.6.33.orig/lib/Makefile.am
> ++++ boinc-client_release-7.6-7.6.33/lib/Makefile.am
> +@@ -173,7 +173,7 @@ lib_LTLIBRARIES =3D libboinc.la
> + libboinc_la_SOURCES =3D $(generic_sources) $(mac_sources) $(win_sources)
> + libboinc_la_CFLAGS =3D $(AM_CFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS)
> + libboinc_la_CXXFLAGS =3D $(AM_CXXFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS)
> +-libboinc_la_LDFLAGS =3D -L$(libdir) -rpath $(libdir) -static -version-n=
umber $(LIBBOINC_VERSION)
> ++libboinc_la_LDFLAGS =3D -static -version-number $(LIBBOINC_VERSION)
> + libboinc_la_LIBADD =3D
> +=20
> + if ENABLE_BOINCCRYPT
> +@@ -181,7 +181,7 @@ lib_LTLIBRARIES +=3D libboinc_crypt.la
> + libboinc_crypt_la_SOURCES =3D crypt.cpp
> + libboinc_crypt_la_CFLAGS =3D $(AM_CFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS)=
 $(SSL_CFLAGS)
> + libboinc_crypt_la_CXXFLAGS =3D $(AM_CXXFLAGS) $(PICFLAGS) $(PTHREAD_CFL=
AGS) $(SSL_CXXFLAGS)
> +-libboinc_crypt_la_LDFLAGS =3D -L$(libdir) -rpath $(libdir) -static -ver=
sion-number $(LIBBOINC_VERSION)
> ++libboinc_crypt_la_LDFLAGS =3D -static -version-number $(LIBBOINC_VERSIO=
N)
> + libboinc_crypt_la_LIBADD =3D
> + endif
> +=20
> +@@ -190,7 +190,7 @@ lib_LTLIBRARIES +=3D libboinc_fcgi.la
> + libboinc_fcgi_la_SOURCES =3D $(libfcgi_sources) $(mac_sources) $(win_so=
urces)
> + libboinc_fcgi_la_CFLAGS =3D -D_USING_FCGI_ $(AM_CFLAGS) $(PICFLAGS) $(P=
THREAD_CFLAGS)
> + libboinc_fcgi_la_CXXFLAGS =3D -D_USING_FCGI_ $(AM_CXXFLAGS) $(PICFLAGS)=
 $(PTHREAD_CFLAGS)
> +-libboinc_fcgi_la_LDFLAGS =3D -L$(libdir) -rpath $(libdir) -version-numb=
er $(LIBBOINC_VERSION)
> ++libboinc_fcgi_la_LDFLAGS =3D -version-number $(LIBBOINC_VERSION)
> + libboinc_fcgi_la_LIBADD =3D
> + endif=20
> + # end of "if ENABLE_FCGI"
> +Index: boinc-client_release-7.6-7.6.33/sched/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- boinc-client_release-7.6-7.6.33.orig/sched/Makefile.am
> ++++ boinc-client_release-7.6-7.6.33/sched/Makefile.am
> +@@ -26,7 +26,7 @@ lib_LTLIBRARIES =3D libsched.la
> + libsched_la_SOURCES =3D $(libsched_sources)
> + libsched_la_CFLAGS =3D $(AM_CPPFLAGS)
> + libsched_la_CXXFLAGS =3D $(AM_CPPFLAGS)
> +-libsched_la_LDFLAGS=3D -L$(libdir) -rpath $(libdir) -version-number $(L=
IBBOINC_VERSION)
> ++libsched_la_LDFLAGS=3D -version-number $(LIBBOINC_VERSION)
> + libsched_la_LIBADD=3D $(SSL_LIBS)
> +=20
> + ## install only headers that are meant for exporting the API !!
> +@@ -48,7 +48,7 @@ lib_LTLIBRARIES +=3D libsched_fcgi.la
> + libsched_fcgi_la_SOURCES =3D $(libsched_sources)
> + libsched_fcgi_la_CFLAGS =3D -D_USING_FCGI_ $(AM_CPPFLAGS)
> + libsched_fcgi_la_CXXFLAGS =3D -D_USING_FCGI_ $(AM_CPPFLAGS)
> +-libsched_fcgi_la_LDFLAGS=3D -L$(libdir) -rpath $(libdir) -version-numbe=
r $(LIBBOINC_VERSION)
> ++libsched_fcgi_la_LDFLAGS=3D -version-number $(LIBBOINC_VERSION)
> + libsched_fcgi_la_LIBADD=3D
> +=20
> + endif
> +Index: boinc-client_release-7.6-7.6.33/zip/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- boinc-client_release-7.6-7.6.33.orig/zip/Makefile.am
> ++++ boinc-client_release-7.6-7.6.33/zip/Makefile.am
> +@@ -61,7 +61,7 @@ endif
> +=20
> + lib_LTLIBRARIES =3D libboinc_zip.la
> + libboinc_zip_la_SOURCES =3D $(libboinc_zip_sources)
> +-libboinc_zip_la_LDFLAGS =3D -L$(libdir) -rpath $(libdir) -version-numbe=
r $(LIBBOINC_VERSION)
> ++libboinc_zip_la_LDFLAGS =3D -version-number $(LIBBOINC_VERSION)
> + libboinc_zip_la_LIBADD =3D
> +=20
> + # Some OSs may not prefix libraries with lib.
> diff --git a/meta-oe/recipes-extended/boinc/boinc-client/opengl_m4_check.=
patch b/meta-oe/recipes-extended/boinc/boinc-client/opengl_m4_check.patch
> new file mode 100644
> index 0000000..f7295c1
> --- /dev/null
> +++ b/meta-oe/recipes-extended/boinc/boinc-client/opengl_m4_check.patch
> @@ -0,0 +1,13 @@
> +Index: boinc-client_release-7.6-7.6.33/m4/ax_check_gl.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- boinc-client_release-7.6-7.6.33.orig/m4/ax_check_gl.m4
> ++++ boinc-client_release-7.6-7.6.33/m4/ax_check_gl.m4
> +@@ -58,7 +58,7 @@ else
> +     else
> +       ax_try_lib=3D"${ax_lib}"
> +     fi
> +-    LIBS=3D"-L${prefix}/lib ${ax_try_lib} ${GL_LIBS} ${ax_save_LIBS}"
> ++    LIBS=3D"${ax_try_lib} ${GL_LIBS} ${ax_save_LIBS}"
> +     AC_LINK_IFELSE(
> +     [AC_LANG_PROGRAM([[
> + # if HAVE_WINDOWS_H && defined(_WIN32)
> diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb b/meta=
-oe/recipes-extended/boinc/boinc-client_7.6.33.bb
> new file mode 100644
> index 0000000..34472e0
> --- /dev/null
> +++ b/meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb
> @@ -0,0 +1,60 @@
> +# Copyright (C) 2016 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY =3D "Open-source software for volunteer computing"
> +DESCRIPTION =3D "The Berkeley Open Infrastructure for Network Computing =
(BOINC) is an open- \
> +source software platform which supports distributed computing, primarily=
 in \
> +the form of volunteer computing and desktop Grid computing.  It is well \
> +suited for problems which are often described as trivially parallel.  BO=
INC \
> +is the underlying software used by projects such as SETI@home, Einstein@=
Home, \
> +ClimatePrediciton.net, the World Community Grid, and many other distribu=
ted \
> +computing projects. \
> +This package installs the BOINC client software, which will allow your \
> +computer to participate in one or more BOINC projects, using your spare \
> +computer time to search for cures for diseases, model protein folding, s=
tudy \
> +global warming, discover sources of gravitational waves, and many other =
types \
> +of scientific and mathematical research."
> +
> +HOMEPAGE =3D "http://boinc.berkeley.edu/"
> +LICENSE =3D "LGPLv2+ & GPLv3"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504 \
> +                    file://COPYING.LESSER;md5=3D6a6a8e020838b23406c81b19=
c1d46df6"
> +SECTION =3D "applications"
> +DEPENDS =3D "curl jpeg openssl xcb-util sqlite3 virtual/libgl libnotify =
gtk+ nettle"
> +
> +SRC_URI =3D "https://github.com/BOINC/boinc/archive/client_release/7.6/$=
{PV}.tar.gz \
> +           file://boinc-AM_CONDITIONAL.patch \
> +           file://opengl_m4_check.patch \
> +           file://cross-compile.patch \
> +"
> +SRC_URI[md5sum] =3D "437b4b98e384b4bda4ef7056e68166ac"
> +SRC_URI[sha256sum] =3D "c4b1c29b9655013e0ac61dddf47ad7f30f38c46159f02a9d=
9dc8ab854e99aa6d"
> +
> +inherit gettext autotools-brokensep pkgconfig
> +
> +S =3D "${WORKDIR}/${BPN}_release-7.6-${PV}"
> +
> +EXTRA_OECONF +=3D "\
> +    --enable-libraries \
> +    --enable-unicode \
> +    --enable-shared \
> +    --enable-dynamic-client-linkage \
> +    --enable-client \
> +    --disable-server \
> +    --disable-static \
> +    --disable-manager \
> +    --with-ssl=3D${STAGING_EXECPREFIXDIR} \
> +    --without-wxdir \
> +    --without-x \
> +    --with-boinc-platform=3D${TARGET_SYS} \
> +"
> +export PKG_CONFIG =3D "${STAGING_BINDIR_NATIVE}/pkg-config"
> +
> +do_compile_prepend () {
> +	# Disable rpaths
> +	sed -i -e 's|^hardcode_libdir_flag_spec=3D.*|hardcode_libdir_flag_spec=
=3D""|g' ${B}/${TARGET_SYS}-libtool
> +	sed -i -e 's|^sys_lib_dlsearch_path_spec=3D.*|sys_lib_dlsearch_path_spe=
c=3D""|g' ${B}/${TARGET_SYS}-libtool
> +	sed -i -e 's|^runpath_var=3DLD_RUN_PATH|runpath_var=3DDIE_RPATH_DIE|g' =
${B}/${TARGET_SYS}-libtool
> +}
> +
> +SECURITY_CFLAGS =3D "${SECURITY_NO_PIE_CFLAGS}"
> --=20
> 2.10.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UoPmpPX/dBe4BELn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlgPXtsACgkQN1Ujt2V2gBzeIgCfbiqXTrL8hTY5kOpvYouigB7K
mDkAmwSnWCqmfcS+oOFyw4OH10xHd2PL
=qqcX
-----END PGP SIGNATURE-----

--UoPmpPX/dBe4BELn--
