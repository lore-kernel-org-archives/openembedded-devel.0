Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B91097D25F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2019 09:33:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xBD9Xn6w007579
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2019 01:33:49 -0800 (PST)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 13 Dec 2019 01:33:49 -0800
To: <changqing.li@windriver.com>, <openembedded-devel@lists.openembedded.org>
References: <1576226743-346140-1-git-send-email-changqing.li@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <88d3c6d3-90ab-31d7-d4d7-94dc75c7fad2@windriver.com>
Date: Fri, 13 Dec 2019 17:32:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1576226743-346140-1-git-send-email-changqing.li@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-xfce][PATCH] gtk-xfce-engine: remove this recipe
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
X-List-Received-Date: Fri, 13 Dec 2019 09:33:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2019/12/13 下午4:45, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> * Part of xfce 4.14 changelog
>    Theme Engine (gtk-xfce-engine)
>        The gtk-xfce-engine has been deprecated and archived.

According to https://xfce.org/about/news, xfce4-kbdleds-plugin is also 
abandoned. Would you like to remove it too?

Acked for this one.

Acked-by: Kai Kang <kai.kang@windriver.com>

Regards,
Kai


>
> * repo have been remove from upstream
>    https://archive.xfce.org/src/xfce/
>    no gtk-xfce-engine now
>
> so remove this recipe
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   .../gtk-xfce-engine/glib-2.54-ftbfs.patch          | 23 -----------------
>   .../gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb       | 30 ----------------------
>   .../packagegroups/packagegroup-xfce-base.bb        |  1 -
>   3 files changed, 54 deletions(-)
>   delete mode 100644 meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine/glib-2.54-ftbfs.patch
>   delete mode 100644 meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
>
> diff --git a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine/glib-2.54-ftbfs.patch b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine/glib-2.54-ftbfs.patch
> deleted file mode 100644
> index fb89102..0000000
> --- a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine/glib-2.54-ftbfs.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -Description: Fix FTBFS with glib 2.54
> - glib-mkenums now expects input files to be UTF-8,
> - fix the encoding of libgnomeui/gnome-scores.h
> -Author: Adrian Bunk <bunk@debian.org>
> -
> -ported from: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=870738
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Index: gtk-xfce-engine-3.2.0/gtk-3.0/xfce_style_types.h
> -===================================================================
> ---- gtk-xfce-engine-3.2.0.orig/gtk-3.0/xfce_style_types.h
> -+++ gtk-xfce-engine-3.2.0/gtk-3.0/xfce_style_types.h
> -@@ -19,7 +19,7 @@
> -  *
> -  *  Portions based Thinice port by
> -  *                       Tim Gerla <timg@rrv.net>,
> -- *                       Tomas �gren <stric@ing.umu.se,
> -+ *                       Tomas Ögren <stric@ing.umu.se>,
> -  *                       Richard Hult <rhult@codefactory.se>
> -  *  Portions based on Smooth theme by
> -  *                       Andrew Johnson <ajgenius@ajgenius.us>
> diff --git a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
> deleted file mode 100644
> index 0dd4a4c..0000000
> --- a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -SUMMARY = "XFCE theme for GTK"
> -SECTION = "x11/libs"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -DEPENDS = "gtk+ xfce4-dev-tools-native"
> -
> -inherit xfce features_check
> -
> -REQUIRED_DISTRO_FEATURES = "x11"
> -
> -SRC_URI += "file://glib-2.54-ftbfs.patch"
> -
> -SRC_URI[md5sum] = "363d6c16a48a00e26d45c45c2e1fd739"
> -SRC_URI[sha256sum] = "875c9c3bda96faf050a2224649cc42129ffb662c4de33add8c0fd1fb860b47ed"
> -
> -PACKAGECONFIG ??= "gtk3"
> -PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3, gtk+3, gtk3-xfce-engine"
> -
> -PACKAGES += "${PN}-themes gtk3-xfce-engine"
> -FILES_${PN} += "${libdir}/gtk-2.0/*/engines/*.so"
> -FILES_gtk3-xfce-engine += "${libdir}/gtk-3.0/*/theming-engines/*.so"
> -FILES_${PN}-themes += "${datadir}/themes"
> -
> -FILES_${PN}-dev += " \
> -    ${libdir}/gtk-2.0/*/engines/*.la \
> -    ${libdir}/gtk-3.0/*/theming-engines/*.la \
> -"
> -
> -RDEPENDS_${PN} += "${PN}-themes"
> -RDEPENDS_gtk3-xfce-engine += "${PN}-themes"
> diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
> index 412c6ae..70ef909 100644
> --- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
> +++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
> @@ -13,7 +13,6 @@ RDEPENDS_${PN} = " \
>       xfdesktop \
>       xfce4-panel \
>       \
> -    gtk-xfce-engine \
>       librsvg-gtk \
>       \
>       xfce4-panel-plugin-actions \
>

-- 
Kai Kang


