Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 142EA6013D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 20:06:17 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id r16so3278121pfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 13:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=1O5DFn3+/1uM6HTDNsNnkwdh5CDymoJ3JA1RLIa73zY=;
	b=MRfezFQ7FL4RaDwgoHLo3JoiTIqf1IGUXzyMZfZPQnrsB/+dKSmR+OR3qYMRaBQhyM
	NR4Jjyu2HdjpBo52rXjGYlBQoOIuMtAPtfzxG5dqnUKwyDCsrtsDQD6QcbHV4sAzkJgE
	0J9qbFkU9lx3iICFJoii0FtXe8cJFGgaItjEIjKzWvllNIDQxmORloYdz5BzVDhceTjD
	LA+uuGGq0icFaaKpF2guMTVfVtRZje2JmPqyTF1JA5TQigmqMrJil2tjzwrYsnzmgkvr
	oRWEoeGv3uJ4ENUZq4ihOZyWmRWRym6rKAvevFyVUZrtzInvthfJeiB2QTiwDhIqWlDH
	G88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=1O5DFn3+/1uM6HTDNsNnkwdh5CDymoJ3JA1RLIa73zY=;
	b=X1GKsMrOh59ow7NrIjm7isNSTwaLBLNjb7l+ALoBh3O+p07YTZAggG+vPSD39fFb5L
	+SHXybKogYiCLYEiQIUcNvs0U52prNVtj6wcdD852gSwloYIQ/DyedV7uHmPiSLXojZ4
	wbNVHsn0Z4Q7+kWj6uhoaXowAJEq95tLrldwzJGMqcXbgZsxcwRmnOVLPOG68X/HH6+v
	dXCKNMUhPGmgdYx9dO7A/vsE2YR2zmjjojTM3o1oRPpKghTWQQrf3oyDZJW6QF0n20zG
	HvNUfJhO+gAjSJonoo4M1RZrRGwXyn8YPRxsfGCOfnZuYxEnGdv8GCslmaOwrwopjiJG
	rt8w==
X-Gm-Message-State: AA6/9RklPgFpb6k/fcoBKr87Kr5kUw08l45Pyp2vScWflA7kydxiRsIe9MToUl+Gm247Pg==
X-Received: by 10.99.157.75 with SMTP id i72mr11880611pgd.147.1476907578130;
	Wed, 19 Oct 2016 13:06:18 -0700 (PDT)
Received: from [10.22.11.1] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	xs10sm66032392pac.24.2016.10.19.13.06.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Oct 2016 13:06:17 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <20161019053834.11523-1-raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <52903f18-3de9-5d3e-89c2-d723b2da998a@gmail.com>
Date: Wed, 19 Oct 2016 13:06:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20161019053834.11523-1-raj.khem@gmail.com>
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
X-List-Received-Date: Wed, 19 Oct 2016 20:06:18 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 10/18/2016 10:38 PM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Looks like the patches are missing OE patch format. No Upstream-Status 
or Signoff, etc

- armin
> ---
>   .../boinc/boinc-client/boinc-AM_CONDITIONAL.patch  | 19 +++++
>   .../boinc/boinc-client/cross-compile.patch         | 92 ++++++++++++++++++++++
>   .../boinc/boinc-client/opengl_m4_check.patch       | 13 +++
>   .../recipes-extended/boinc/boinc-client_7.6.33.bb  | 60 ++++++++++++++
>   4 files changed, 184 insertions(+)
>   create mode 100644 meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch
>   create mode 100644 meta-oe/recipes-extended/boinc/boinc-client/cross-compile.patch
>   create mode 100644 meta-oe/recipes-extended/boinc/boinc-client/opengl_m4_check.patch
>   create mode 100644 meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb
>
> diff --git a/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch b/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch
> new file mode 100644
> index 0000000..3ebf7c8
> --- /dev/null
> +++ b/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch
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
> + AM_CONDITIONAL(INSTALL_HEADERS, [test "${enable_install_headers}" = yes])
> + AM_CONDITIONAL(HAVE_CUDA_LIB, [test "${enable_client}" = yes -a -f ./coprocs/CUDA/posix/${boinc_platform}/libcudart.so])
> +
> ++PKG_CHECK_MODULES([GTK2], [gtk+-2.0])
> ++
> + dnl ======================================================================
> + dnl some more vodoo required for building portable client-binary (client, clientgui)
> + dnl ======================================================================
> diff --git a/meta-oe/recipes-extended/boinc/boinc-client/cross-compile.patch b/meta-oe/recipes-extended/boinc/boinc-client/cross-compile.patch
> new file mode 100644
> index 0000000..3d29558
> --- /dev/null
> +++ b/meta-oe/recipes-extended/boinc/boinc-client/cross-compile.patch
> @@ -0,0 +1,92 @@
> +Index: boinc-client_release-7.6-7.6.33/api/Makefile.am
> +===================================================================
> +--- boinc-client_release-7.6-7.6.33.orig/api/Makefile.am
> ++++ boinc-client_release-7.6-7.6.33/api/Makefile.am
> +@@ -43,18 +43,18 @@ endif
> +
> + lib_LTLIBRARIES = libboinc_api.la
> + libboinc_api_la_SOURCES = $(api_files)
> +-libboinc_api_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
> ++libboinc_api_la_LDFLAGS = -version-number $(LIBBOINC_VERSION)
> +
> + if BUILD_GRAPHICS_API
> + lib_LTLIBRARIES += libboinc_graphics2.la
> + libboinc_graphics2_la_SOURCES = $(graphics2_files)
> + libboinc_graphics2_la_CPPFLAGS = -I$(top_srcdir) -I$(top_srcdir)/lib -I$(top_srcdir)/samples/image_libs
> +-libboinc_graphics2_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION) -ljpeg
> ++libboinc_graphics2_la_LDFLAGS = -version-number $(LIBBOINC_VERSION) -ljpeg
> + endif #BUILD_GRAPHICS_API
> +
> + lib_LTLIBRARIES += libboinc_opencl.la
> + libboinc_opencl_la_SOURCES = $(opencl_files)
> +-libboinc_opencl_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
> ++libboinc_opencl_la_LDFLAGS = -version-number $(LIBBOINC_VERSION)
> +
> + if INSTALL_HEADERS
> + ## install only headers that are meant for exporting the API !!
> +Index: boinc-client_release-7.6-7.6.33/lib/Makefile.am
> +===================================================================
> +--- boinc-client_release-7.6-7.6.33.orig/lib/Makefile.am
> ++++ boinc-client_release-7.6-7.6.33/lib/Makefile.am
> +@@ -173,7 +173,7 @@ lib_LTLIBRARIES = libboinc.la
> + libboinc_la_SOURCES = $(generic_sources) $(mac_sources) $(win_sources)
> + libboinc_la_CFLAGS = $(AM_CFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS)
> + libboinc_la_CXXFLAGS = $(AM_CXXFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS)
> +-libboinc_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -static -version-number $(LIBBOINC_VERSION)
> ++libboinc_la_LDFLAGS = -static -version-number $(LIBBOINC_VERSION)
> + libboinc_la_LIBADD =
> +
> + if ENABLE_BOINCCRYPT
> +@@ -181,7 +181,7 @@ lib_LTLIBRARIES += libboinc_crypt.la
> + libboinc_crypt_la_SOURCES = crypt.cpp
> + libboinc_crypt_la_CFLAGS = $(AM_CFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS) $(SSL_CFLAGS)
> + libboinc_crypt_la_CXXFLAGS = $(AM_CXXFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS) $(SSL_CXXFLAGS)
> +-libboinc_crypt_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -static -version-number $(LIBBOINC_VERSION)
> ++libboinc_crypt_la_LDFLAGS = -static -version-number $(LIBBOINC_VERSION)
> + libboinc_crypt_la_LIBADD =
> + endif
> +
> +@@ -190,7 +190,7 @@ lib_LTLIBRARIES += libboinc_fcgi.la
> + libboinc_fcgi_la_SOURCES = $(libfcgi_sources) $(mac_sources) $(win_sources)
> + libboinc_fcgi_la_CFLAGS = -D_USING_FCGI_ $(AM_CFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS)
> + libboinc_fcgi_la_CXXFLAGS = -D_USING_FCGI_ $(AM_CXXFLAGS) $(PICFLAGS) $(PTHREAD_CFLAGS)
> +-libboinc_fcgi_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
> ++libboinc_fcgi_la_LDFLAGS = -version-number $(LIBBOINC_VERSION)
> + libboinc_fcgi_la_LIBADD =
> + endif
> + # end of "if ENABLE_FCGI"
> +Index: boinc-client_release-7.6-7.6.33/sched/Makefile.am
> +===================================================================
> +--- boinc-client_release-7.6-7.6.33.orig/sched/Makefile.am
> ++++ boinc-client_release-7.6-7.6.33/sched/Makefile.am
> +@@ -26,7 +26,7 @@ lib_LTLIBRARIES = libsched.la
> + libsched_la_SOURCES = $(libsched_sources)
> + libsched_la_CFLAGS = $(AM_CPPFLAGS)
> + libsched_la_CXXFLAGS = $(AM_CPPFLAGS)
> +-libsched_la_LDFLAGS= -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
> ++libsched_la_LDFLAGS= -version-number $(LIBBOINC_VERSION)
> + libsched_la_LIBADD= $(SSL_LIBS)
> +
> + ## install only headers that are meant for exporting the API !!
> +@@ -48,7 +48,7 @@ lib_LTLIBRARIES += libsched_fcgi.la
> + libsched_fcgi_la_SOURCES = $(libsched_sources)
> + libsched_fcgi_la_CFLAGS = -D_USING_FCGI_ $(AM_CPPFLAGS)
> + libsched_fcgi_la_CXXFLAGS = -D_USING_FCGI_ $(AM_CPPFLAGS)
> +-libsched_fcgi_la_LDFLAGS= -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
> ++libsched_fcgi_la_LDFLAGS= -version-number $(LIBBOINC_VERSION)
> + libsched_fcgi_la_LIBADD=
> +
> + endif
> +Index: boinc-client_release-7.6-7.6.33/zip/Makefile.am
> +===================================================================
> +--- boinc-client_release-7.6-7.6.33.orig/zip/Makefile.am
> ++++ boinc-client_release-7.6-7.6.33/zip/Makefile.am
> +@@ -61,7 +61,7 @@ endif
> +
> + lib_LTLIBRARIES = libboinc_zip.la
> + libboinc_zip_la_SOURCES = $(libboinc_zip_sources)
> +-libboinc_zip_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
> ++libboinc_zip_la_LDFLAGS = -version-number $(LIBBOINC_VERSION)
> + libboinc_zip_la_LIBADD =
> +
> + # Some OSs may not prefix libraries with lib.
> diff --git a/meta-oe/recipes-extended/boinc/boinc-client/opengl_m4_check.patch b/meta-oe/recipes-extended/boinc/boinc-client/opengl_m4_check.patch
> new file mode 100644
> index 0000000..f7295c1
> --- /dev/null
> +++ b/meta-oe/recipes-extended/boinc/boinc-client/opengl_m4_check.patch
> @@ -0,0 +1,13 @@
> +Index: boinc-client_release-7.6-7.6.33/m4/ax_check_gl.m4
> +===================================================================
> +--- boinc-client_release-7.6-7.6.33.orig/m4/ax_check_gl.m4
> ++++ boinc-client_release-7.6-7.6.33/m4/ax_check_gl.m4
> +@@ -58,7 +58,7 @@ else
> +     else
> +       ax_try_lib="${ax_lib}"
> +     fi
> +-    LIBS="-L${prefix}/lib ${ax_try_lib} ${GL_LIBS} ${ax_save_LIBS}"
> ++    LIBS="${ax_try_lib} ${GL_LIBS} ${ax_save_LIBS}"
> +     AC_LINK_IFELSE(
> +     [AC_LANG_PROGRAM([[
> + # if HAVE_WINDOWS_H && defined(_WIN32)
> diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb
> new file mode 100644
> index 0000000..34472e0
> --- /dev/null
> +++ b/meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb
> @@ -0,0 +1,60 @@
> +# Copyright (C) 2016 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY = "Open-source software for volunteer computing"
> +DESCRIPTION = "The Berkeley Open Infrastructure for Network Computing (BOINC) is an open- \
> +source software platform which supports distributed computing, primarily in \
> +the form of volunteer computing and desktop Grid computing.  It is well \
> +suited for problems which are often described as trivially parallel.  BOINC \
> +is the underlying software used by projects such as SETI@home, Einstein@Home, \
> +ClimatePrediciton.net, the World Community Grid, and many other distributed \
> +computing projects. \
> +This package installs the BOINC client software, which will allow your \
> +computer to participate in one or more BOINC projects, using your spare \
> +computer time to search for cures for diseases, model protein folding, study \
> +global warming, discover sources of gravitational waves, and many other types \
> +of scientific and mathematical research."
> +
> +HOMEPAGE = "http://boinc.berkeley.edu/"
> +LICENSE = "LGPLv2+ & GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> +                    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6"
> +SECTION = "applications"
> +DEPENDS = "curl jpeg openssl xcb-util sqlite3 virtual/libgl libnotify gtk+ nettle"
> +
> +SRC_URI = "https://github.com/BOINC/boinc/archive/client_release/7.6/${PV}.tar.gz \
> +           file://boinc-AM_CONDITIONAL.patch \
> +           file://opengl_m4_check.patch \
> +           file://cross-compile.patch \
> +"
> +SRC_URI[md5sum] = "437b4b98e384b4bda4ef7056e68166ac"
> +SRC_URI[sha256sum] = "c4b1c29b9655013e0ac61dddf47ad7f30f38c46159f02a9d9dc8ab854e99aa6d"
> +
> +inherit gettext autotools-brokensep pkgconfig
> +
> +S = "${WORKDIR}/${BPN}_release-7.6-${PV}"
> +
> +EXTRA_OECONF += "\
> +    --enable-libraries \
> +    --enable-unicode \
> +    --enable-shared \
> +    --enable-dynamic-client-linkage \
> +    --enable-client \
> +    --disable-server \
> +    --disable-static \
> +    --disable-manager \
> +    --with-ssl=${STAGING_EXECPREFIXDIR} \
> +    --without-wxdir \
> +    --without-x \
> +    --with-boinc-platform=${TARGET_SYS} \
> +"
> +export PKG_CONFIG = "${STAGING_BINDIR_NATIVE}/pkg-config"
> +
> +do_compile_prepend () {
> +	# Disable rpaths
> +	sed -i -e 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' ${B}/${TARGET_SYS}-libtool
> +	sed -i -e 's|^sys_lib_dlsearch_path_spec=.*|sys_lib_dlsearch_path_spec=""|g' ${B}/${TARGET_SYS}-libtool
> +	sed -i -e 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' ${B}/${TARGET_SYS}-libtool
> +}
> +
> +SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"


