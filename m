Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 502B874525
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2018 02:53:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w3D2rxmf010838
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Apr 2018 19:53:59 -0700 (PDT)
Received: from [128.224.163.159] (128.224.163.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 12 Apr 2018 19:53:58 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
	<20180330133151.25882-22-schnitzeltony@gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <720f4b6d-e60e-9085-23ef-ef8edbcb0e80@windriver.com>
Date: Fri, 13 Apr 2018 10:53:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180330133151.25882-22-schnitzeltony@gmail.com>
Subject: Re: [PATCH 21/39] metacity: remove
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
X-List-Received-Date: Fri, 13 Apr 2018 02:53:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年03月30日 21:31, Andreas Müller wrote:
> * as far as I can see nothing uses it - please stand up if I am wrong

On github, it is still alive and maintained

https://github.com/GNOME/metacity/blob/master/NEWS

I think we should keep it.

The 2.*.* is based on gtk2, and the latest version
3.28.0 is based on gtk3.

V2 which change the upstream incoming

//Hongxu

> * this version was released in 2012
>
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>   .../metacity/0001-ui-Define-_GNU_SOURCE.patch      | 27 -----------------
>   .../metacity/remove-yelp-help-rules-var.patch      | 28 -----------------
>   .../recipes-gnome/metacity/metacity_2.34.13.bb     | 35 ----------------------
>   3 files changed, 90 deletions(-)
>   delete mode 100644 meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch
>   delete mode 100644 meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch
>   delete mode 100644 meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
>
> diff --git a/meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch b/meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch
> deleted file mode 100644
> index 539d756b3..000000000
> --- a/meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From e7fd072f0df968f342878b77098e97ff07ed28d7 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 14 Jul 2017 10:26:31 -0700
> -Subject: [PATCH] ui: Define _GNU_SOURCE
> -
> -it becomes portable across musl and glibc
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/ui/theme.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/ui/theme.c b/src/ui/theme.c
> -index 84b57a0..c7eafc8 100644
> ---- a/src/ui/theme.c
> -+++ b/src/ui/theme.c
> -@@ -60,6 +60,7 @@
> - #include <gtk/gtk.h>
> - #include <string.h>
> - #include <stdlib.h>
> -+#define _GNU_SOURCE
> - #define __USE_XOPEN
> - #include <math.h>
> -
> ---
> -2.13.3
> -
> diff --git a/meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch b/meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch
> deleted file mode 100644
> index 1970e9afb..000000000
> --- a/meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Remove unused variable (YELP_HELP_RULES)
> -
> -Upstream-Status: Pending
> -Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> -
> -Index: metacity-2.34.13/doc/creating_themes/Makefile.am
> -===================================================================
> ---- metacity-2.34.13.orig/doc/creating_themes/Makefile.am
> -+++ metacity-2.34.13/doc/creating_themes/Makefile.am
> -@@ -1,6 +1,5 @@
> - ### This part of Makefile.am can be customized by you.
> -
> --@YELP_HELP_RULES@
> -
> - # The name of the directory in /usr/share/gnome/help/,
> - # and the name of the main .xml file:
> -Index: metacity-2.34.13/doc/creating_themes/Makefile.in
> -===================================================================
> ---- metacity-2.34.13.orig/doc/creating_themes/Makefile.in
> -+++ metacity-2.34.13/doc/creating_themes/Makefile.in
> -@@ -455,7 +455,6 @@ uninstall-am:
> - 	mostlyclean-libtool pdf pdf-am ps ps-am uninstall uninstall-am
> -
> -
> --@YELP_HELP_RULES@
> -
> - # Tell versions [3.59,3.63) of GNU make to not export all variables.
> - # Otherwise a system limit (for SysV at least) may be exceeded.
> diff --git a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
> deleted file mode 100644
> index 370de7000..000000000
> --- a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -SECTION = "x11/wm"
> -SUMMARY = "Metacity is the boring window manager for the adult in you"
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> -                    file://src/include/main.h;endline=24;md5=c2242df552c880280315989bab626b90"
> -
> -DEPENDS = "gsettings-desktop-schemas startup-notification gtk+ gconf gdk-pixbuf-native libcanberra gnome-doc-utils libgtop intltool-native"
> -PR = "r1"
> -
> -inherit gnomebase update-alternatives distro_features_check
> -# depends on startup-notification which depends on virtual/libx11
> -REQUIRED_DISTRO_FEATURES = "x11"
> -
> -GNOME_COMPRESS_TYPE = "xz"
> -
> -SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
> -           file://remove-yelp-help-rules-var.patch \
> -           file://0001-ui-Define-_GNU_SOURCE.patch \
> -           "
> -SRC_URI[archive.md5sum] = "6d89b71672d4fa49fc87f83d610d0ef6"
> -SRC_URI[archive.sha256sum] = "8cf4dbf0da0a6f36357ce7db7f829ec685908a7792453c662fb8184572b91075"
> -
> -ALTERNATIVE_${PN} = "x-window-manager"
> -ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/metacity"
> -ALTERNATIVE_PRIORITY = "10"
> -
> -EXTRA_OECONF += "--disable-xinerama"
> -
> -do_configure_prepend() {
> -    sed -i -e 's:$ZENITY:$NOZENITY:g' -e 's:-Werror::g' ${S}/configure.in
> -}
> -
> -FILES_${PN} += "${datadir}/themes ${datadir}/gnome-control-center ${datadir}/gnome"
> -RDEPENDS_${PN} += "gsettings-desktop-schemas"
> -



