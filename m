Return-Path: <ticotimo@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 16D9C71A6F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Nov 2016 02:23:14 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id p9so2693909vkd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 19:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=b3BOUCdRCiV7+SO3O5OPimkJrkBZfT5sR3cavKvpX40=;
	b=JUgknf9XEk8Kc47nySp90C2pRSngBmL5Cr0DH0OMcFyPY5Ehoj4QcZFsZGLV9al//O
	QEruorYmRUJ+/9VwHkoYoVmzLFWz+KwfPz57m4Qr4om2mnHDGNOepNqlZPSFRwkFGSsO
	rySuhUBCLHqOfxPxywRYVsPk9AxHnp8myPyoA+g6YCuMj3q4voSWQ7zHcewM8M52rXL3
	pxtEf5VT+OABNo70p/fCNwSmw4dYTJezyzMCXwTXL+RqSR7UROjevisBwkRkl4tpfzra
	3AXqaQLyZNlepUVBp34wpLSxhYMWtSexZeHwCtlWN+s8klJa9LxqsO7StZqI4zPxVqI4
	1VAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=b3BOUCdRCiV7+SO3O5OPimkJrkBZfT5sR3cavKvpX40=;
	b=bulKzlJhRnRJlrDUz3iKf1V+EaUUthZe29Zze6e8ubDzHwa13+YNfdp//r6C8NRVXq
	1LJ75JGoIavjE6xWYRtyh6tA7fhATx2swsRVmwQ2vcYHnCNam5W8W+EX5SvXyBs0b8w3
	o8OuIeucJXevRZtfdRtCxlB0rHtH2cgnCrQM7VCOIHakYCpBHRD8lXy25k18n6rtF28q
	2xl9JZx7OpIxD7309H6A5m9uk4hXiEHfyxOJJ/FRBZ05SAW8Bg1GhCfk7hFXbejJJN8A
	4hLsF+eJMJ0yTw9W2aGcoPXau2TWNn+2GfJH9D2zthD3rBe2Bauj8qBkSSpmNSawbEkl
	bwQA==
X-Gm-Message-State: ABUngvc6JZ5Sy4zFAmo9qIzZdUu0s5X0p+oq1MVSPXFQc1MFwhqTTzy+JXAYtXHm/z5ATUtnVsxnBkdF07KVHQ==
X-Received: by 10.31.80.132 with SMTP id e126mr9905618vkb.109.1478226195877;
	Thu, 03 Nov 2016 19:23:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.107.142 with HTTP; Thu, 3 Nov 2016 19:23:15 -0700 (PDT)
In-Reply-To: <20161102063040.23598-1-Qi.Chen@windriver.com>
References: <20161102063040.23598-1-Qi.Chen@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 3 Nov 2016 19:23:15 -0700
Message-ID: <CANx9H-D_PU1LkZqzY-zrnzu2O=DwVQrrQ0YPtEOB-ocv2F-y_Q@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH V2] gnuplot: upgrade to 5.0.5
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
X-List-Received-Date: Fri, 04 Nov 2016 02:23:15 -0000
Content-Type: text/plain; charset=UTF-8

I would rather see a PACKAGECONFIG for qt5

On Tue, Nov 1, 2016 at 11:30 PM, Chen Qi <Qi.Chen@windriver.com> wrote:

> Add '--disable-qt' to EXTRA_OECONF to fix do_compile failure.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../gnuplot-4.6.5/lua-loadlibs-configure-in-fix.patch    | 16
> ----------------
>  .../recipes-extended/gnuplot/gnuplot-4.6.5/subdirs.patch | 11 -----------
>  meta-oe/recipes-extended/gnuplot/gnuplot.inc             |  2 +-
>  .../gnuplot/gnuplot/lua-loadlibs-configure-in-fix.patch  | 16
> ++++++++++++++++
>  meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch   | 11 +++++++++++
>  meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb        | 14
> --------------
>  meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb        | 14
> ++++++++++++++
>  7 files changed, 42 insertions(+), 42 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua-
> loadlibs-configure-in-fix.patch
>  delete mode 100644 meta-oe/recipes-extended/
> gnuplot/gnuplot-4.6.5/subdirs.patch
>  create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/lua-loadlibs-
> configure-in-fix.patch
>  create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch
>  delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb
>  create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb
>
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua-
> loadlibs-configure-in-fix.patch b/meta-oe/recipes-extended/
> gnuplot/gnuplot-4.6.5/lua-loadlibs-configure-in-fix.patch
> deleted file mode 100644
> index 23f2cd2..0000000
> --- a/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua-
> loadlibs-configure-in-fix.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Index: gnuplot-4.6.5/configure.in
> -===================================================================
> ---- gnuplot-4.6.5.orig/configure.in
> -+++ gnuplot-4.6.5/configure.in
> -@@ -690,6 +690,11 @@ if test "${with_lua}" = yes ; then
> -   fi
> -
> -   if test "$with_lua" != no; then
> -+    dnl check for dlopen/dl to fix loadlibs link failure
> -+    AC_CHECK_FUNC([dlopen], [],
> -+      AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS="-ldl"))
> -+    AC_SUBST(DLOPEN_LIBS)
> -+    LUA_LIBS="$LUA_LIBS $DLOPEN_LIBS"
> -     TERMLIBS="$TERMLIBS $LUA_LIBS"
> -     CPPFLAGS="$CPPFLAGS $LUA_CFLAGS"
> -   else
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/subdirs.patch
> b/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/subdirs.patch
> deleted file mode 100644
> index 8c7d1f0..0000000
> --- a/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/subdirs.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> ---- /tmp/Makefile.am   2007-08-23 13:10:15.560659023 +0200
> -+++ gnuplot-4.2.0/Makefile.am  2007-08-23 13:10:34.961764629 +0200
> -@@ -1,7 +1,7 @@
> - ## Process this file with automake to produce Makefile.in -*-Makefile-*-
> - AUTOMAKE_OPTIONS = foreign 1.2h
> -
> --SUBDIRS = config m4 term src docs $(LISPDIR) man demo tutorial share
> -+SUBDIRS = config m4 term src  $(LISPDIR) man share
> -
> - EXTRA_DIST = BUGS CodeStyle Copyright FAQ GNUmakefile INSTALL
> INSTALL.gnu \
> - Makefile.maint PATCHLEVEL PGPKEYS PORTING README README.1ST README.exp \
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot.inc
> b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
> index 69bc74b..d8d9a5f 100644
> --- a/meta-oe/recipes-extended/gnuplot/gnuplot.inc
> +++ b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
> @@ -17,7 +17,7 @@ PACKAGECONFIG[cairo] = "--with-cairo,--without-cairo,cairo
> pango"
>  PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua"
>
>  EXTRA_OECONF = "--with-readline=${STAGING_LIBDIR}/.. \
> -                --without-lisp-files \
> +                --without-qt \
>

This would be more universal in a PACKAGECONFIG
e.g. PACKAGECONFIG[qt4] = "--with-qt,--without-qt,qt4-x11-free"


>                  --without-tutorial \
>                  --disable-wxwidgets"
>
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/lua-loadlibs-configure-in-fix.patch
> b/meta-oe/recipes-extended/gnuplot/gnuplot/lua-loadlibs-
> configure-in-fix.patch
> new file mode 100644
> index 0000000..23f2cd2
> --- /dev/null
> +++ b/meta-oe/recipes-extended/gnuplot/gnuplot/lua-loadlibs-
> configure-in-fix.patch
> @@ -0,0 +1,16 @@
> +Index: gnuplot-4.6.5/configure.in
> +===================================================================
> +--- gnuplot-4.6.5.orig/configure.in
> ++++ gnuplot-4.6.5/configure.in
> +@@ -690,6 +690,11 @@ if test "${with_lua}" = yes ; then
> +   fi
> +
> +   if test "$with_lua" != no; then
> ++    dnl check for dlopen/dl to fix loadlibs link failure
> ++    AC_CHECK_FUNC([dlopen], [],
> ++      AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS="-ldl"))
> ++    AC_SUBST(DLOPEN_LIBS)
> ++    LUA_LIBS="$LUA_LIBS $DLOPEN_LIBS"
> +     TERMLIBS="$TERMLIBS $LUA_LIBS"
> +     CPPFLAGS="$CPPFLAGS $LUA_CFLAGS"
> +   else
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch
> b/meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch
> new file mode 100644
> index 0000000..8c7d1f0
> --- /dev/null
> +++ b/meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch
> @@ -0,0 +1,11 @@
> +--- /tmp/Makefile.am   2007-08-23 13:10:15.560659023 +0200
> ++++ gnuplot-4.2.0/Makefile.am  2007-08-23 13:10:34.961764629 +0200
> +@@ -1,7 +1,7 @@
> + ## Process this file with automake to produce Makefile.in -*-Makefile-*-
> + AUTOMAKE_OPTIONS = foreign 1.2h
> +
> +-SUBDIRS = config m4 term src docs $(LISPDIR) man demo tutorial share
> ++SUBDIRS = config m4 term src  $(LISPDIR) man share
> +
> + EXTRA_DIST = BUGS CodeStyle Copyright FAQ GNUmakefile INSTALL
> INSTALL.gnu \
> + Makefile.maint PATCHLEVEL PGPKEYS PORTING README README.1ST README.exp \
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb
> b/meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb
> deleted file mode 100644
> index 3f694a0..0000000
> --- a/meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -require gnuplot.inc
> -
> -SRC_URI = "${SOURCEFORGE_MIRROR}/gnuplot/${BP}.tar.gz;name=archive \
> -    http://www.mneuroth.de/privat/zaurus/qtplot-0.2.tar.gz;name=qtplot \
> -    file://subdirs.patch \
> -    file://lua-loadlibs-configure-in-fix.patch \
> -    file://gnuplot.desktop \
> -    file://gnuplot.png \
> -"
> -
> -SRC_URI[archive.md5sum] = "9a476b21f74bd99c876f1509d731a0f9"
> -SRC_URI[archive.sha256sum] = "e550f030c7d04570e89c3d4e3f6e82
> 296816508419c86ab46c4dd73156519a2d"
> -SRC_URI[qtplot.md5sum] = "0a481885a496092c77eb4017540b5cf6"
> -SRC_URI[qtplot.sha256sum] = "6df317183ff62cc82f3dcf88207a26
> 7cd6478cb5147f55d7530c94f1ad5f4132"
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb
> b/meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb
> new file mode 100644
> index 0000000..42308ba
> --- /dev/null
> +++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb
> @@ -0,0 +1,14 @@
> +require gnuplot.inc
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/gnuplot/${BP}.tar.gz;name=archive \
> +    http://www.mneuroth.de/privat/zaurus/qtplot-0.2.tar.gz;name=qtplot \
> +    file://subdirs.patch \
> +    file://lua-loadlibs-configure-in-fix.patch \
> +    file://gnuplot.desktop \
> +    file://gnuplot.png \
> +"
> +
> +SRC_URI[archive.md5sum] = "c5e96fca73afbee4f57cbc1bfce6b3b8"
> +SRC_URI[archive.sha256sum] = "25f3e0bf192e01115c580f278c3725
> d7a569eb848786e12b455a3fda70312053"
> +SRC_URI[qtplot.md5sum] = "0a481885a496092c77eb4017540b5cf6"
> +SRC_URI[qtplot.sha256sum] = "6df317183ff62cc82f3dcf88207a26
> 7cd6478cb5147f55d7530c94f1ad5f4132"
> --
> 2.8.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

