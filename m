Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8BC3F73617
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 19:07:42 +0000 (UTC)
Received: by yhab6 with SMTP id b6so1110028yha.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 11:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=1RYz3hVj6Oy14/MATbKFQMNBlfS1ojxYQcyEpLydBcs=;
	b=kypMiKG2TXAAZ0gah+UkRl9y8fNIsbVzVI4EjdGE8leBqUNg/thbYEg1bxEAXmSJr8
	TXsao2MW54elUoUqKe9P3WzYuug5dPGtk5qeWt3VKhc/xdSrA9B1ZCKNMjOWXwlHGQKd
	MWP89wdBANN9a3mAU1WnZGlDoBwmR8tPdOt+r1LEtiJKoFPc3bFoe7qSm2D0ZyTNXP4D
	Br6MIfkBiL8GOfNev5Q70s2NlEDHUsnChsUDRc4GygPFf1qrH8sFNf7T8wv9tqpi350z
	cFk++OnXv9g0i+5t8h6jOqWaTQNhVkTdNk/6CfnzEwXTcQLttgHGcoj2NVG+OUByS4Oz
	wnug==
MIME-Version: 1.0
X-Received: by 10.236.229.200 with SMTP id h68mr4282873yhq.90.1424372863482;
	Thu, 19 Feb 2015 11:07:43 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Thu, 19 Feb 2015 11:07:43 -0800 (PST)
In-Reply-To: <1424293077-4542-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1424293077-4542-1-git-send-email-alexandre.belloni@free-electrons.com>
Date: Thu, 19 Feb 2015 17:07:43 -0200
X-Google-Sender-Auth: -75cl1n5JQ4GK1G65rIPxhgERvs
Message-ID: <CAP9ODKpDUaOjV=qMHzDUgZ4aiCgV2iPs0rWYzSGFTdQ1Jj1gOA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][dizzy][PATCH] qmake5: don't always look in directories recursively
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
X-List-Received-Date: Thu, 19 Feb 2015 19:07:44 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 18, 2015 at 6:57 PM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> QT needs to be compiled without the -r parameter from the qmake command
> line. This is necessary to avoid those errors when building
> qtdeclarative or qt3d without opengl for example:
> Project ERROR: Unknown module(s) in QT: quick-private
> or
> Project ERROR: Unknown module(s) in QT: quick
>
> Also update comments regarding the dependencies.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  classes/qmake5_base.bbclass | 7 +++++--
>  recipes-qt/qt5/qt5.inc      | 2 ++
>  recipes-qt/qt5/qtbase.inc   | 5 +----
>  3 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
> index f1a09450efca..f58d291ab12a 100644
> --- a/classes/qmake5_base.bbclass
> +++ b/classes/qmake5_base.bbclass
> @@ -13,6 +13,9 @@ OE_QMAKE_PLATFORM = "linux-oe-g++"
>  # Add -d to show debug output from every qmake call, but it prints *a lot*, better to add it only to debugged recipe
>  OE_QMAKE_DEBUG_OUTPUT ?= ""
>
> +# Look through supplied directories recursively by default
> +OE_QMAKE_RECURSIVE ?= "-r"
> +
>  # Paths in .prl files contain SYSROOT value
>  SSTATE_SCAN_FILES += "*.pri *.prl"
>
> @@ -159,8 +162,8 @@ qmake5_base_do_configure () {
>      # for config.tests to read this
>      export QMAKE_MAKE_ARGS="${EXTRA_OEMAKE}"
>
> -    CMD="${OE_QMAKE_QMAKE} -makefile -o Makefile ${OE_QMAKE_DEBUG_OUTPUT} -r $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST"
> -    ${OE_QMAKE_QMAKE} -makefile -o Makefile ${OE_QMAKE_DEBUG_OUTPUT} -r $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST || die "Error calling $CMD"
> +    CMD="${OE_QMAKE_QMAKE} -makefile -o Makefile ${OE_QMAKE_DEBUG_OUTPUT} ${OE_QMAKE_RECURSIVE} $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST"
> +    ${OE_QMAKE_QMAKE} -makefile -o Makefile ${OE_QMAKE_DEBUG_OUTPUT} ${OE_QMAKE_RECURSIVE} $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST || die "Error calling $CMD"
>  }
>
>  qmake5_base_do_install() {
> diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
> index bb0bcdcac0af..22f0d30e0298 100644
> --- a/recipes-qt/qt5/qt5.inc
> +++ b/recipes-qt/qt5/qt5.inc
> @@ -18,6 +18,8 @@ OE_QMAKE_PATH_SETTINGS = "${OE_QMAKE_PATH_QT_SETTINGS}"
>  OE_QMAKE_PATH_EXAMPLES = "${OE_QMAKE_PATH_QT_EXAMPLES}"
>  OE_QMAKE_PATH_TESTS = "${OE_QMAKE_PATH_QT_TESTS}"
>
> +OE_QMAKE_RECURSIVE = ""

Shouldn't this to be done for qtbase only?

>  # If Qt5 (qtbase) is machine specific, then everything will be,
>  # because the (initial) qtbase configuration becomes part of Qt5/qmake
>  python __anonymous() {
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index 1d2efa020b3b..2d2bc07c6148 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -30,8 +30,6 @@ RDEPENDS_${PN}-tools += "perl"
>  # PACKAGECONFIG is kept rather minimal for people who don't need
>  # stuff like webkit (and it's easier to add options than remove)
>
> -# gl or gles needs to be enabled in order to build qtdeclarative
> -# http://qt.gitorious.org/qt/qtdeclarative/commit/e988998a08b1420ed10bd02d9d4b3b8ed2289df9
>  PACKAGECONFIG_GL ?= "${@base_contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)}"
>  PACKAGECONFIG_FB ?= "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
>  PACKAGECONFIG_X11 ?= "${@base_contains('DISTRO_FEATURES', 'x11', 'xcb xvideo xsync xshape xrender xrandr xfixes xinput2 xinput xinerama xcursor gtkstyle xkb', '', d)}"
> @@ -77,7 +75,6 @@ PACKAGECONFIG[jpeg] = "-system-libjpeg,-no-libjpeg,jpeg"
>  PACKAGECONFIG[libpng] = "-system-libpng,-no-libpng,libpng"
>  PACKAGECONFIG[zlib] = "-system-zlib,-qt-zlib,zlib"
>  PACKAGECONFIG[pcre] = "-system-pcre,-qt-pcre,pcre"
> -# gl or gles2 is needed in order to build qtdeclarative (qtdeclarative.do_configure fails to find quick module without)
>  PACKAGECONFIG[gl] = "-opengl desktop -no-eglfs,,virtual/libgl"
>  PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl"
>  PACKAGECONFIG[tslib] = "-tslib,-no-tslib,tslib"
> @@ -115,7 +112,7 @@ PACKAGECONFIG[directfb] = "-directfb,-no-directfb,directfb"
>  PACKAGECONFIG[linuxfb] = "-linuxfb,-no-linuxfb"
>  PACKAGECONFIG[mitshm] = "-mitshm,-no-mitshm,mitshm"
>  PACKAGECONFIG[kms] = "-kms,-no-kms,virtual/mesa virtual/egl"
> -# needed for qtdeclarative (qtdeclarative.do_configure fails to find quick module without)
> +# needed for qtwebkit
>  PACKAGECONFIG[icu] = "-icu,-no-icu,icu"
>  PACKAGECONFIG[udev] = "-libudev,-no-libudev,udev"
>  # use -openssl-linked here to ensure that RDEPENDS for libcrypto and libssl are detected
> --
> 2.1.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

