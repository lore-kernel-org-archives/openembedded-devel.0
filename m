Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7F68C7FCC0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jan 2020 09:00:34 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b6so2525817wrq.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jan 2020 01:00:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=CQEevO1vPjLIPXcyDlGKB1N7nDzVy+fzalbZxNC6mL4=;
	b=OWOZrZXLdzRTUmxGtLI3SxnS4kni7tl2QVQq0IHyU/ZF7sZ53/Rh1CA7pRIY9MKs54
	JBTyC93b/xcKkon+rz6Bwx0EjABPWP2hZXupsLIJN8SErc8tYWaVMpK91TLXXfBYYfmz
	GgqJZ4/hawDz1EkHo7B74Wlc+FJ81gCJcYNi9NPnTu0qBTzsE+FoRL+0BXgZ0GIy1fZ6
	BrbUdtxgYuJzGpo7aFANuEBaB7t2NtmkLZPomlXogf4l12DnopX1n8Tm3jw+Pn6kozTP
	kK2Vga9jmmdcE/CwL7bHLDkQIgBW9rz6WzQ5PS+nlvab3V1eYmdeFKHZe4AHSyY7G/iX
	9O4g==
X-Gm-Message-State: APjAAAWVSljnKznkEfN82v02sS2mmxpaq6f4Aig7q5QvoTOvDMWFoWIK
	Z3QIS+Dpmqbdljxt37leJbE=
X-Google-Smtp-Source: APXvYqzI1rR8ErA7Cp5q5uYnALxrb3LfXcg8l9eT9FXWkHowZXH3jblzbUMRkrWO8J9w9O+Px0SgyQ==
X-Received: by 2002:a5d:65c5:: with SMTP id e5mr3193624wrw.311.1578474035094; 
	Wed, 08 Jan 2020 01:00:35 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	u22sm3378650wru.30.2020.01.08.01.00.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 01:00:34 -0800 (PST)
Message-ID: <dc7f3c13cbde5cc4130f5d3912f1ad8a199a8725.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 08 Jan 2020 09:00:34 +0000
In-Reply-To: <20200108085522.2258-1-git@andred.net>
References: <20200107154659.34711-1-git@andred.net>
	<20200108085522.2258-1-git@andred.net>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/2 v2] oniguruma: update to v6.9.4
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
X-List-Received-Date: Wed, 08 Jan 2020 09:00:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Khem,

I got the subject line wrong originally - not sure if it's too late already...


Cheers,
Andre'

On Wed, 2020-01-08 at 08:55 +0000, André Draszik wrote:
> The version meta-oe is carrying is more than 4 years old,
> from 2015, with numerous CVEs fixed and more than 2000
> commits since.
> 
> The license checksum changed because it contains the
> year (which is at 2019 now).
> 
> Onigurama can now also be built using CMake, but for
> now this recipe stays with using autotools as only
> autotools builds support testing (which the next
> patch adds support for).
> 
> Signed-off-by: André Draszik <git@andred.net>
> 
> ---
> v2:
> * fix typo in subject line
> * fix SUMMARY
> ---
>  .../onig/files/configure.patch                | 13 ------
>  .../files/do-not-use-system-headers.patch     | 44 -------------------
>  ...t-link-against-host-system-libraries.patch | 42 ++++++++++++++++++
>  meta-oe/recipes-support/onig/onig_5.9.6.bb    | 19 --------
>  meta-oe/recipes-support/onig/onig_6.9.4.bb    | 22 ++++++++++
>  5 files changed, 64 insertions(+), 76 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/onig/files/configure.patch
>  delete mode 100644 meta-oe/recipes-support/onig/files/do-not-use-system-headers.patch
>  create mode 100644 meta-oe/recipes-support/onig/onig/0001-build-don-t-link-against-host-system-libraries.patch
>  delete mode 100644 meta-oe/recipes-support/onig/onig_5.9.6.bb
>  create mode 100644 meta-oe/recipes-support/onig/onig_6.9.4.bb
> 
> diff --git a/meta-oe/recipes-support/onig/files/configure.patch b/meta-oe/recipes-support/onig/files/configure.patch
> deleted file mode 100644
> index 5fa700f19..000000000
> --- a/meta-oe/recipes-support/onig/files/configure.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -Index: onig-5.9.3/configure.in
> -===================================================================
> ---- onig-5.9.3.orig/configure.in	2012-10-26 07:06:14.000000000 +0000
> -+++ onig-5.9.3/configure.in	2014-07-18 08:02:52.701574484 +0000
> -@@ -3,7 +3,7 @@
> - 
> - AC_CONFIG_MACRO_DIR([m4])
> - 
> --AM_INIT_AUTOMAKE
> -+AM_INIT_AUTOMAKE([foreign])
> - AC_CONFIG_HEADER(config.h)
> - 
> - 
> diff --git a/meta-oe/recipes-support/onig/files/do-not-use-system-headers.patch b/meta-oe/recipes-
> support/onig/files/do-not-use-system-headers.patch
> deleted file mode 100644
> index b93602a26..000000000
> --- a/meta-oe/recipes-support/onig/files/do-not-use-system-headers.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> -
> -When build on host with older eglibc (Ubuntu 12.04) build fails with:
> -
> -/tmp/OE/build/tmp-eglibc/sysroots/genericarmv8/usr/include/bits/predefs.h:23:3: error: #error "Never use
> <bits/predefs.h> directly; include <stdc-predef.h> instead."
> -
> -Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> ----
> - Makefile.am        |    2 +-
> - sample/Makefile.am |    2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> ---- onig-5.9.3.orig/Makefile.am
> -+++ onig-5.9.3/Makefile.am
> -@@ -4,11 +4,11 @@ sampledir = $(top_srcdir)/sample
> - libname = libonig.la
> -
> - ACLOCAL_AMFLAGS = -I m4
> - #AM_CFLAGS = -DNOT_RUBY
> - AM_CFLAGS =
> --INCLUDES  = -I$(top_srcdir) -I$(includedir)
> -+INCLUDES  = -I$(top_srcdir)
> -
> - SUBDIRS = . sample
> -
> - include_HEADERS = oniguruma.h oniggnu.h onigposix.h
> - lib_LTLIBRARIES = $(libname)
> ---- onig-5.9.3.orig/sample/Makefile.am
> -+++ onig-5.9.3/sample/Makefile.am
> -@@ -1,10 +1,10 @@
> - noinst_PROGRAMS = encode listcap names posix simple sql syntax crnl
> -
> - libname = $(top_builddir)/libonig.la
> - LDADD   = $(libname)
> --INCLUDES  = -I$(top_srcdir) -I$(includedir)
> -+INCLUDES  = -I$(top_srcdir)
> -
> - encode_SOURCES  = encode.c
> - listcap_SOURCES = listcap.c
> - names_SOURCES   = names.c
> - posix_SOURCES   = posix.c
> diff --git a/meta-oe/recipes-support/onig/onig/0001-build-don-t-link-against-host-system-libraries.patch b/meta-
> oe/recipes-support/onig/onig/0001-build-don-t-link-against-host-system-libraries.patch
> new file mode 100644
> index 000000000..891592650
> --- /dev/null
> +++ b/meta-oe/recipes-support/onig/onig/0001-build-don-t-link-against-host-system-libraries.patch
> @@ -0,0 +1,42 @@
> +From 78103ecd18efcd0966531d8718f6e94dcb7a5abf Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
> +Date: Mon, 6 Jan 2020 16:56:31 +0000
> +Subject: [PATCH] build: don't link against (host) system libraries
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Inappropriate [OE specific]
> +Signed-off-by: André Draszik <git@andred.net>
> +---
> + sample/Makefile.am | 1 -
> + test/Makefile.am   | 1 -
> + 2 files changed, 2 deletions(-)
> +
> +diff --git a/sample/Makefile.am b/sample/Makefile.am
> +index 22a4989..e935bf0 100644
> +--- a/sample/Makefile.am
> ++++ b/sample/Makefile.am
> +@@ -3,7 +3,6 @@
> + lib_onig = ../src/libonig.la
> + LDADD  = $(lib_onig)
> + 
> +-AM_LDFLAGS  = -L$(prefix)/lib
> + AM_CPPFLAGS = -I$(top_srcdir)/src
> + 
> + if ENABLE_POSIX_API
> +diff --git a/test/Makefile.am b/test/Makefile.am
> +index 4d62568..b7a2105 100644
> +--- a/test/Makefile.am
> ++++ b/test/Makefile.am
> +@@ -1,7 +1,6 @@
> + ## Makefile.am for Oniguruma
> + lib_onig = ../src/libonig.la
> + 
> +-AM_LDFLAGS  = -L$(prefix)/lib
> + AM_CFLAGS = -Wall -Wno-invalid-source-encoding
> + AM_CPPFLAGS = -I$(top_srcdir)/src
> + 
> +-- 
> +2.23.0.rc1
> +
> diff --git a/meta-oe/recipes-support/onig/onig_5.9.6.bb b/meta-oe/recipes-support/onig/onig_5.9.6.bb
> deleted file mode 100644
> index 20a71c6c9..000000000
> --- a/meta-oe/recipes-support/onig/onig_5.9.6.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -DESCRIPTION = "Regular expressions library. The characteristics of this \
> -library is that different character encoding for every regular expression \
> -object can be specified."
> -HOMEPAGE = "https://web.archive.org/web/20150807014439/http://www.geocities.jp/kosako3/oniguruma/"
> -LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=0d4861b5bc0c392a5aa90d9d76ebd86f"
> -
> -SRC_URI = "https://web.archive.org/web/20150807014439/http://www.geocities.jp/kosako3/oniguruma/archive/${BP}.tar.gz
> \
> -           file://do-not-use-system-headers.patch \
> -           file://configure.patch"
> -
> -SRC_URI[md5sum] = "d08f10ea5c94919780e6b7bed1ef9830"
> -SRC_URI[sha256sum] = "d5642010336a6f68b7f2e34b1f1cb14be333e4d95c2ac02b38c162caf44e47a7"
> -
> -BINCONFIG = "${bindir}/onig-config"
> -
> -inherit autotools binconfig-disabled
> -
> -BBCLASSEXTEND = "native"
> diff --git a/meta-oe/recipes-support/onig/onig_6.9.4.bb b/meta-oe/recipes-support/onig/onig_6.9.4.bb
> new file mode 100644
> index 000000000..d873088fe
> --- /dev/null
> +++ b/meta-oe/recipes-support/onig/onig_6.9.4.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Regular expressions library"
> +DESCRIPTION = "Oniguruma is a modern and flexible regular expressions library. \
> +It encompasses features from different regular expression \
> +implementations that traditionally exist in different languages. \
> +Character encoding can be specified per regular expression object."
> +HOMEPAGE = "https://github.com/kkos/oniguruma"
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1ee043784bdce7503e619b2d1a85798b"
> +
> +SRC_URI = "\
> +    https://github.com/kkos/oniguruma/releases/download/v${PV}/${BP}.tar.gz \
> +    file://0001-build-don-t-link-against-host-system-libraries.patch \
> +"
> +
> +SRC_URI[md5sum] = "a12d2fe997b789bd87cf63799c091879"
> +SRC_URI[sha256sum] = "4669d22ff7e0992a7e93e116161cac9c0949cd8960d1c562982026726f0e6d53"
> +
> +BINCONFIG = "${bindir}/onig-config"
> +
> +inherit autotools binconfig-disabled
> +
> +BBCLASSEXTEND = "native"


