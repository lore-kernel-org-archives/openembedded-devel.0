Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id A93A57F69F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2019 19:22:18 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id 201so8374949qkd.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2019 12:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kP5w9qtkllfF630QO8QfuYqSya3J3YKive6Hhch9New=;
	b=uMsMJpd3fDXKX0+gWIUEWJxToFz4rqN9FHxwkfZU+GvPhymQCvz4Bpr5+XLFuEaEMI
	Y2crXuzLKYGGgq8l5aesO/0K1Xyb3hnGfP5JX6fWoExvtYO1CLbVp5IdWGyqboms2EoI
	W8XcUvwGvTRfCMrUoyxZHxFmSU/ZEpZuqY/OkCuW96lgRSPAhZuKOCXaJkA5x0AJBfRr
	6bgT41Kn7guLgLSuQF+sr4YGbcxM+OqtAt1v9jaXDDI7WlH1vlefJkfLisCY1icvoul+
	z4gAYJLAIkedkHTkU06a4iJkRW4xZSVG5FF7dC/ah57kHLKyNPyCVAVW+gXLX9wD1Sei
	VE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kP5w9qtkllfF630QO8QfuYqSya3J3YKive6Hhch9New=;
	b=CQdSDWQjRmP8yxA3VhMj2DTQGtq7+D6bZ1+Y/cTErydpoWR3hJZEAVzZU2W/iC59zQ
	aJeEyEDwyA6WR35GLCyqJfDGbXk3+S582n+F1kJOt9QcfB1yhcZmsZxwvIpsPuKeEVGQ
	YYM2qOhTysny4nprs8xxw+8RCzAYvnloKQMsNWz9HO/nxhQEF8Pe0wmFrYBnSkJdIJ2F
	qvJnubjUK42gDWdeQpUjOBQvof2keTnY9IgydyWHaXq3S7mOKgcI8EgtvyzIz87IZQ29
	GHno+aC7KtdJb631RARPqZThF7qIhMMmpTazmGyu8CLgF55HJ5uS8p+qiq8lZYZS5DJF
	j3pQ==
X-Gm-Message-State: APjAAAUf7wmMhQV+xhPfvZFXcat3g3l9/+RTvTor2SBI97yciCimciaF
	OOzYWjY/xiabje9pGN0BZkr3DFtxu3i5GOkgLQU=
X-Google-Smtp-Source: APXvYqwOlMSj1rALZAfOl/6iB+Wh252BnQA+RHw1ndAjIVUgJQ2teOTfGRSAemxqgMXfGOEL88xZkMk1Kr6kHLygJy4=
X-Received: by 2002:ae9:edd8:: with SMTP id c207mr5476952qkg.337.1569007339116;
	Fri, 20 Sep 2019 12:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190919181618.102575-1-alex.kiernan@gmail.com>
	<CAO5Uq5RMEv4OzV_dXGo4frqm==mBobLvsCo4G9rfbv+_Fm77TA@mail.gmail.com>
In-Reply-To: <CAO5Uq5RMEv4OzV_dXGo4frqm==mBobLvsCo4G9rfbv+_Fm77TA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Sep 2019 12:21:53 -0700
Message-ID: <CAMKF1somsr7R6oghQq01+P18Pmmwt=pUZyNuF=aKUqNQRQ4nPQ@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ostree: Add recipe
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
X-List-Received-Date: Fri, 20 Sep 2019 19:22:19 -0000
Content-Type: text/plain; charset="UTF-8"

Also fails on all builders

https://errors.yoctoproject.org/Errors/Details/271527/

On Thu, Sep 19, 2019 at 11:47 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On Thu, Sep 19, 2019 at 7:16 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> >  ...lways-enable-trivial-httpd-for-tests.patch |  59 +++++++
> >  ...cros-Add-TEMP_FAILURE_RETRY-for-musl.patch |  40 +++++
> >  ...vial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch |  51 ++++++
> >  .../recipes-extended/ostree/ostree_2019.3.bb  | 151 ++++++++++++++++++
> >  4 files changed, 301 insertions(+)
> >  create mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-Always-enable-trivial-httpd-for-tests.patch
> >  create mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-macros-Add-TEMP_FAILURE_RETRY-for-musl.patch
> >  create mode 100644 meta-oe/recipes-extended/ostree/ostree/0002-Gate-ostree-trivial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch
> >  create mode 100644 meta-oe/recipes-extended/ostree/ostree_2019.3.bb
> >
> > diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-Always-enable-trivial-httpd-for-tests.patch b/meta-oe/recipes-extended/ostree/ostree/0001-Always-enable-trivial-httpd-for-tests.patch
> > new file mode 100644
> > index 000000000000..c9e1306afde0
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/ostree/ostree/0001-Always-enable-trivial-httpd-for-tests.patch
> > @@ -0,0 +1,59 @@
> > +From 44e0647230b22cd136ae2fb252ce90eed4751970 Mon Sep 17 00:00:00 2001
> > +From: Alex Kiernan <alex.kiernan@gmail.com>
> > +Date: Wed, 4 Sep 2019 17:29:15 +0100
> > +Subject: [PATCH 1/2] Always enable trivial-httpd for tests
> > +
> > +When running tests we always need ostree-trivial-httpd, so enable it
> > +unconditionally
> > +
> > +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > +Upstream-Status: Submitted [https://github.com/ostreedev/ostree/pull/1912]
> > +---
> > + Makefile.am        | 1 +
> > + ci/build.sh        | 5 +++++
> > + ci/travis-build.sh | 1 +
> > + 3 files changed, 7 insertions(+)
> > +
> > +diff --git a/Makefile.am b/Makefile.am
> > +index cd04a055045a..673dbf88de55 100644
> > +--- a/Makefile.am
> > ++++ b/Makefile.am
> > +@@ -39,6 +39,7 @@ AM_DISTCHECK_CONFIGURE_FLAGS += \
> > +       --enable-gtk-doc \
> > +       --enable-man \
> > +       --disable-maintainer-mode \
> > ++      --enable-trivial-httpd-cmdline \
> > +       $(NULL)
> > +
> > + GITIGNOREFILES = aclocal.m4 build-aux/ buildutil/*.m4 config.h.in gtk-doc.make
> > +diff --git a/ci/build.sh b/ci/build.sh
> > +index 0901507498f2..806af050b780 100755
> > +--- a/ci/build.sh
> > ++++ b/ci/build.sh
> > +@@ -22,6 +22,11 @@ case "${CONFIGOPTS:-}" in
> > +         fi
> > +         ;;
> > + esac
> > ++# unless libsoup is disabled, enable trivial-httpd for the tests
> > ++case "${CONFIGOPTS:-}" in
> > ++    *--without-soup*) ;;
> > ++    *) CONFIGOPTS="${CONFIGOPTS:-} --enable-trivial-httpd-cmdline" ;;
> > ++esac
> > +
> > + # always fail on warnings; https://github.com/ostreedev/ostree/pull/971
> > + # NB: this disables the default set of flags from configure.ac
> > +diff --git a/ci/travis-build.sh b/ci/travis-build.sh
> > +index 3fd969bdced6..7c85313a2d32 100755
> > +--- a/ci/travis-build.sh
> > ++++ b/ci/travis-build.sh
> > +@@ -85,6 +85,7 @@ make="make -j${ci_parallel} V=1 VERBOSE=1"
> > +
> > + ../configure \
> > +     --enable-always-build-tests \
> > ++    --enable-trivial-httpd-cmdline \
> > +     ${ci_configopts}
> > +     "$@"
> > +
> > +--
> > +2.17.1
> > +
> > diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-macros-Add-TEMP_FAILURE_RETRY-for-musl.patch b/meta-oe/recipes-extended/ostree/ostree/0001-macros-Add-TEMP_FAILURE_RETRY-for-musl.patch
> > new file mode 100644
> > index 000000000000..d8c044cb9224
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/ostree/ostree/0001-macros-Add-TEMP_FAILURE_RETRY-for-musl.patch
> > @@ -0,0 +1,40 @@
> > +From 5a4f2ddb0a6c656b425a3caa41f5af766ed5f44b Mon Sep 17 00:00:00 2001
> > +From: Alex Kiernan <alex.kiernan@gmail.com>
> > +Date: Mon, 9 Sep 2019 14:19:18 +0100
> > +Subject: [PATCH] macros: Add TEMP_FAILURE_RETRY for musl
> > +
> > +TEMP_FAILURE_RETRY is glibc specific, add a definition for musl.
> > +
> > +See https://github.com/ostreedev/ostree/issues/731
> > +
> > +Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
> > +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > +Upstream-Status: Accepted [https://gitlab.gnome.org/GNOME/libglnx/commit/15c06468804014fc49f6f340132930703f919b19]
> > +---
> > + glnx-macros.h | 10 ++++++++++
> > + 1 file changed, 10 insertions(+)
> > +
> > +diff --git a/libglnx.glnx-macros.h b/libglnx/glnx-macros.h
> > +index 6d8aca93f8a3..700fc75ceed0 100644
> > +--- a/libglnx.glnx-macros.h
> > ++++ b/libglnx/glnx-macros.h
> > +@@ -31,6 +31,16 @@ G_BEGIN_DECLS
> > + /* All of these are for C only. */
> > + #ifndef __GI_SCANNER__
> > +
> > ++/* fixes builds against musl, taken from glibc unistd.h */
> > ++#ifndef TEMP_FAILURE_RETRY
> > ++#define TEMP_FAILURE_RETRY(expression) \
> > ++  (__extension__                                                              \
> > ++    ({ long int __result;                                                     \
> > ++       do __result = (long int) (expression);                                 \
> > ++       while (__result == -1L && errno == EINTR);                             \
> > ++       __result; }))
> > ++#endif
> > ++
> > + /* Taken from https://github.com/systemd/systemd/src/basic/string-util.h
> > +  * at revision v228-666-gcf6c8c4
> > +  */
> > +--
> > +2.17.1
> > +
> > diff --git a/meta-oe/recipes-extended/ostree/ostree/0002-Gate-ostree-trivial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch b/meta-oe/recipes-extended/ostree/ostree/0002-Gate-ostree-trivial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch
> > new file mode 100644
> > index 000000000000..362b2f36ab51
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/ostree/ostree/0002-Gate-ostree-trivial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch
> > @@ -0,0 +1,51 @@
> > +From 2629328b39ae117876f4854409c2231220a30b9c Mon Sep 17 00:00:00 2001
> > +From: Alex Kiernan <alex.kiernan@gmail.com>
> > +Date: Thu, 5 Sep 2019 13:22:15 +0100
> > +Subject: [PATCH 2/2] Gate ostree-trivial-httpd on BUILDOPT_TRIVIAL_HTTPD
> > +
> > +When building without --enable-trivial-httpd-cmdline, don't build or install
> > +the ostree-trivial-httpd binary.
> > +
> > +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > +Upstream-Status: Submitted [https://github.com/ostreedev/ostree/pull/1912]
> > +---
> > + Makefile-ostree.am | 3 ++-
> > + configure.ac       | 3 +++
> > + 2 files changed, 5 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/Makefile-ostree.am b/Makefile-ostree.am
> > +index 76f39cad4b74..7b53cb148960 100644
> > +--- a/Makefile-ostree.am
> > ++++ b/Makefile-ostree.am
> > +@@ -143,12 +143,13 @@ ostree_SOURCES += src/ostree/ot-builtin-pull.c
> > + endif
> > +
> > + if USE_LIBSOUP
> > +-# Eventually once we stop things from using this, we should support disabling this
> > ++if BUILDOPT_TRIVIAL_HTTPD
> > + ostree_SOURCES += src/ostree/ot-builtin-trivial-httpd.c
> > + pkglibexec_PROGRAMS += ostree-trivial-httpd
> > + ostree_trivial_httpd_SOURCES = src/ostree/ostree-trivial-httpd.c
> > + ostree_trivial_httpd_CFLAGS = $(ostree_bin_shared_cflags) $(OT_INTERNAL_SOUP_CFLAGS)
> > + ostree_trivial_httpd_LDADD = $(ostree_bin_shared_ldadd) $(OT_INTERNAL_SOUP_LIBS)
> > ++endif
> > +
> > + if !USE_CURL
> > + # This is necessary for the cookie jar bits
> > +diff --git a/configure.ac b/configure.ac
> > +index 069bab01752e..ffc67980d507 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -192,6 +192,9 @@ AC_ARG_ENABLE(trivial-httpd-cmdline,
> > +   [Continue to support "ostree trivial-httpd" [default=no]])],,
> > +   enable_trivial_httpd_cmdline=no)
> > + AM_CONDITIONAL(BUILDOPT_TRIVIAL_HTTPD, test x$enable_trivial_httpd_cmdline = xyes)
> > ++AS_IF([test x$with_soup = xno && test x$enable_trivial_httpd_cmdline = xyes], [
> > ++  AC_MSG_ERROR([trivial-httpd enabled, but libsoup is not; libsoup is needed for trivial-httpd])
> > ++])
> > + AM_COND_IF(BUILDOPT_TRIVIAL_HTTPD,
> > +   [AC_DEFINE([BUILDOPT_ENABLE_TRIVIAL_HTTPD_CMDLINE], 1, [Define if we are enabling ostree trivial-httpd entrypoint])]
> > + )
> > +--
> > +2.17.1
> > +
> > diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.3.bb b/meta-oe/recipes-extended/ostree/ostree_2019.3.bb
> > new file mode 100644
> > index 000000000000..6e2cd7267eb4
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/ostree/ostree_2019.3.bb
> > @@ -0,0 +1,151 @@
> > +SUMMARY = "Versioned Operating System Repository."
> > +DESCRIPTION = "libostree is both a shared library and suite of command line \
> > +tools that combines a \"git-like\" model for committing and downloading \
> > +bootable filesystem trees, along with a layer for deploying them and managing \
> > +the bootloader configuration."
> > +HOMEPAGE = "https://ostree.readthedocs.io"
> > +LICENSE = "LGPLv2.1"
> > +
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
> > +
> > +DEPENDS = " \
> > +    glib-2.0 \
> > +    gpgme \
> > +    e2fsprogs \
> > +    libcap \
> > +    zlib \
> > +    xz \
> > +    bison-native \
> > +"
> > +
> > +# The Yocto mirror has an old export of ostree:
> > +# http://downloads.yoctoproject.org/mirror/sources/git2_github.com.ostreedev.ostree.tar.gz
> > +PREMIRRORS = ""
> > +
>
> I should've added a cover note to this - clearly this hack needs to go away.
>
> --
> Alex Kiernan
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

