Return-Path: <sgw@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6295678442
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jul 2017 22:49:51 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 27 Jul 2017 15:49:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,422,1496127600"; d="scan'208";a="292425406"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.63.188])
	by fmsmga004.fm.intel.com with ESMTP; 27 Jul 2017 15:49:51 -0700
Message-ID: <1501195791.27323.399.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: jackie.huang@windriver.com, openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jul 2017 15:49:51 -0700
In-Reply-To: <611cb040503a0616ea4127228c9237b1d5f7a834.1495522368.git.jackie.huang@windriver.com>
References: <cover.1495522368.git.jackie.huang@windriver.com>
	<611cb040503a0616ea4127228c9237b1d5f7a834.1495522368.git.jackie.huang@windriver.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH 1/2] xf86-video-mga: add new recipe
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
X-List-Received-Date: Thu, 27 Jul 2017 22:49:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-05-23 at 15:01 +0800, jackie.huang@windriver.com wrote:
> 
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> mga is an Xorg driver for Matrox video cards
> 
I missed the inclusion of this driver into meta-oe, we have been
maintaining this driver in meta-intel and have been for a while (it's
listed in layers.openembedded.org.

If there are multiple layers using this Xorg driver, we should consider
moving into oe-core proper. 

There are multiple x86* HW platforms that use the Matrox hardware
still.  I would prefer not to have meta-intel depending on meta-oe for
one Xorg driver.

Thoughts of moving it?

Sau!


> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../xorg-driver/xf86-video-mga/checkfile.patch     | 68
> ++++++++++++++++++++++
>  .../xorg-driver/xf86-video-mga_1.6.5.bb            | 21 +++++++
>  2 files changed, 89 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-
> mga/checkfile.patch
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-
> mga_1.6.5.bb
> 
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-
> mga/checkfile.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-
> video-mga/checkfile.patch
> new file mode 100644
> index 000000000..ceae6dfba
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-
> mga/checkfile.patch
> @@ -0,0 +1,68 @@
> +Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cg
> i?id=57606]
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From c9014a8f3c9b691b5aa7b1f3ec66cf7c84b8211b Mon Sep 17 00:00:00
> 2001
> +From: Ross Burton <ross.burton@intel.com>
> +Date: Thu, 29 Nov 2012 11:00:43 +0000
> +Subject: [PATCH] build: dont use AC_CHECK_FILE when enabling DRI
> +
> +Automatically enabling or disabling a feature based on installed
> files isn't
> +deterministic, and AC_CHECK_FILE returns an error when cross-
> compiling.
> +
> +Fix this by enabling DRI by default, and removing the explicit file
> checks as
> +pkg-config is good enough.
> +
> +(#57606)
> +
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +---
> + configure.ac |   25 ++-----------------------
> + 1 file changed, 2 insertions(+), 23 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index fca1a9c..d2aa2ed 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -55,9 +55,9 @@ AC_ARG_WITH(xorg-module-dir,
> +             [moduledir="$libdir/xorg/modules"])
> + 
> + AC_ARG_ENABLE(dri, AS_HELP_STRING([--disable-dri],
> +-                                  [Disable DRI support
> [[default=auto]]]),
> ++                                  [Disable DRI support
> [[default=enabled]]]),
> +               [DRI="$enableval"],
> +-              [DRI=auto])
> ++              [DRI=yes])
> + AC_ARG_ENABLE(exa,
> +               AS_HELP_STRING([--disable-exa],
> +                              [Disable EXA support
> [[default=enabled]]]),
> +@@ -76,27 +76,6 @@ sdkdir=`$PKG_CONFIG --variable=sdkdir xorg-
> server`
> + 
> + # Checks for libraries.
> + 
> +-if test "x$DRI" != xno; then
> +-        AC_CHECK_FILE([${sdkdir}/dri.h],
> +-                      [have_dri_h="yes"], [have_dri_h="no"])
> +-        AC_CHECK_FILE([${sdkdir}/sarea.h],
> +-                      [have_sarea_h="yes"], [have_sarea_h="no"])
> +-        AC_CHECK_FILE([${sdkdir}/dristruct.h],
> +-                      [have_dristruct_h="yes"],
> [have_dristruct_h="no"])
> +-fi
> +-
> +-AC_MSG_CHECKING([whether to include DRI support])
> +-if test "x$DRI" = xauto; then
> +-        if test "x$have_dri_h" = xyes && \
> +-           test "x$have_sarea_h" = xyes && \
> +-           test "x$have_dristruct_h" = xyes; then
> +-                DRI="yes"
> +-        else
> +-                DRI="no"
> +-        fi
> +-fi
> +-AC_MSG_RESULT([$DRI])
> +-
> + AM_CONDITIONAL(DRI, test "x$DRI" = xyes)
> + if test "x$DRI" = xyes; then
> +         PKG_CHECK_MODULES(DRI, [libdrm >= 2.0 xf86driproto])
> +-- 
> +1.7.10.4
> +
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-
> mga_1.6.5.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-
> mga_1.6.5.bb
> new file mode 100644
> index 000000000..cd680597c
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_1.6.5.bb
> @@ -0,0 +1,21 @@
> +require recipes-graphics/xorg-driver/xorg-driver-video.inc
> +
> +SUMMARY = "X.Org X server -- Matrox MGA display driver"
> +
> +DESCRIPTION = "mga is an Xorg driver for Matrox video cards"
> +
> +LIC_FILES_CHKSUM =
> "file://COPYING;md5=bc1395d2cd32dfc5d6c57d2d8f83d3fc"
> +
> +SRC_URI += "file://checkfile.patch"
> +
> +DEPENDS += "virtual/libx11 libpciaccess"
> +
> +COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
> +
> +SRC_URI[md5sum] = "3ee2549247e01de3e7bce52c27483118"
> +SRC_URI[sha256sum] =
> "b663cd8e6364f7c4e2637b9fcab9861d0e3971518c73b00d213f6545a1289422"
> +
> +PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'dri', '', d)}"
> +PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,drm
> xf86driproto,xserver-xorg-extension-dri"
> +
> +RDEPENDS_${PN} = "xserver-xorg-module-exa"
> -- 
> 2.11.0

