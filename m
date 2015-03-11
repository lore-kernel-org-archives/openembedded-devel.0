Return-Path: <Nicolas.FERRE@atmel.com>
X-Greylist: delayed 318 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 11 Mar 2015 13:42:34 UTC
Received: from eusmtp01.atmel.com (eusmtp01.atmel.com [212.144.249.243])
	by mail.openembedded.org (Postfix) with ESMTP id 8F31273B02
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2015 13:42:34 +0000 (UTC)
Received: from HNOCHT01.corp.atmel.com (10.161.30.161) by eusmtp01.atmel.com
	(10.161.101.31) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Wed, 11 Mar 2015 14:37:11 +0100
Received: from [10.159.245.112] (10.161.30.18) by HNOCHT01.corp.atmel.com
	(10.161.30.161) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 11 Mar 2015 14:37:16 +0100
Message-ID: <55004509.7060600@atmel.com>
Date: Wed, 11 Mar 2015 14:37:13 +0100
From: Nicolas Ferre <nicolas.ferre@atmel.com>
Organization: atmel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	<openembedded-devel@lists.openembedded.org>
References: <1424293077-4542-1-git-send-email-alexandre.belloni@free-electrons.com>
In-Reply-To: <1424293077-4542-1-git-send-email-alexandre.belloni@free-electrons.com>
X-Originating-IP: [10.161.30.18]
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
X-List-Received-Date: Wed, 11 Mar 2015 13:42:35 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

Le 18/02/2015 21:57, Alexandre Belloni a écrit :
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

Tested-by: Nicolas Ferre <nicolas.ferre@atmel.com>

While building for dizzy, I used the master branch (commit ID:
7a65ba6089560efdd840a9590684c24fbcdb7818) to benefit from these patches:
can you please update the dizzy branch of meta-qt5 to integrate them?

Thanks, bye,


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
> +
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
> 


-- 
Nicolas Ferre

