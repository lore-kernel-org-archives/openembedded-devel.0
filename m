Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 202C4755CF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2015 22:41:06 +0000 (UTC)
Received: by iebgx4 with SMTP id gx4so41077745ieb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2015 15:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=yY/fzavVtn1+xJjTSDG/uX6OxG570AQjh3g2VPqe92U=;
	b=ghqNZUCoud0zW2M3XOTTTkpTRQlJjb2T1efTPfrmHvECRcnJAEvAI+pv0amqZ6x+7N
	uHDqdoA+eC3D2hF3iZQrGJpXyyOaeoYFW6kIsMzCHDOP5fOmkEUYtvUZsVJ/Yp9JMpPm
	i8P+i/OWaiVu0IN5q3iiNga8Z6W+yVIgSKe1Dc52NUy3ZQxavVmFHa0ElS3YNXkvykk9
	lOA6dXL/oHD8Dsgdwhf885jFSRoyVmxaxsJBIBvFbZ6gOIHgsFY2OJoJnl9pAX2ey+Sz
	DmiBr0H6E7bj8W7VyYJbcV/haqZyTHHJ42hn+5Yk92iiSkJoKghvv3zAFzrsQrrhLnc5
	eNcA==
X-Received: by 10.50.43.137 with SMTP id w9mr489036igl.30.1432334467511; Fri,
	22 May 2015 15:41:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.112.34 with HTTP; Fri, 22 May 2015 15:40:37 -0700 (PDT)
In-Reply-To: <1431408883-7222-3-git-send-email-raj.khem@gmail.com>
References: <1431408883-7222-1-git-send-email-raj.khem@gmail.com>
	<1431408883-7222-3-git-send-email-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 May 2015 15:40:37 -0700
Message-ID: <CAMKF1sq=yuf3eMKcU3xaqR6c0TZjXCEvt8zO7a35=KWpDuS2GA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH 9/9 V2] gnome-panel: Fix build with gcc-5
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
X-List-Received-Date: Fri, 22 May 2015 22:41:09 -0000
Content-Type: text/plain; charset=UTF-8

ping

On Mon, May 11, 2015 at 10:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../gnome-panel/0001-Fix-build-with-gcc-5.patch    | 35 ++++++++++++++++++++++
>  .../gnome-panel/gnome-panel_2.32.1.bb              | 13 +++++---
>  2 files changed, 44 insertions(+), 4 deletions(-)
>  create mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Fix-build-with-gcc-5.patch
>
> diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Fix-build-with-gcc-5.patch b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Fix-build-with-gcc-5.patch
> new file mode 100644
> index 0000000..6b7fc5b
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Fix-build-with-gcc-5.patch
> @@ -0,0 +1,35 @@
> +From 20810fcf329c6e0b48b8e7602565ccc70c7ce62b Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 10 May 2015 02:10:59 -0700
> +Subject: [PATCH] Fix build with gcc 5
> +
> +cc1: error: ../../gnome-panel/libpanel-applets-private: No such file or
> +directory [-Werror=missing-include-dirs]
> +cc1: error: ../../gnome-panel/libpanel-applets-private: No such file or
> +directory [-Werror=missing-include-dirs]
> +cc1: error: ../../gnome-panel/libpanel-applets-private: No such file or
> +directory [-Werror=missing-include-dirs]
> +cc1: some warnings being treated as errors
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Pending
> +
> + gnome-panel/libpanel-applet-private/Makefile.am | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/gnome-panel/libpanel-applet-private/Makefile.am b/gnome-panel/libpanel-applet-private/Makefile.am
> +index f12dee8..d556f12 100644
> +--- a/gnome-panel/libpanel-applet-private/Makefile.am
> ++++ b/gnome-panel/libpanel-applet-private/Makefile.am
> +@@ -8,7 +8,6 @@ AM_CPPFLAGS =                                                  \
> +       -I$(srcdir)                                             \
> +       -I$(top_srcdir)/gnome-panel                             \
> +       -I$(top_builddir)/gnome-panel                           \
> +-      -I$(top_builddir)/gnome-panel/libpanel-applets-private  \
> +       -I$(top_builddir)/gnome-panel/libpanel-util             \
> +       -DDATADIR=\""$(datadir)"\"                              \
> +       -DPANEL_APPLETS_DIR=\"$(appletsdir)\"                   \
> +--
> +2.1.4
> +
> diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
> index 4957a99..3a413bd 100644
> --- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
> @@ -1,5 +1,5 @@
>  SUMMARY = "GNOME panel"
> -LICENSE = "GPLv2 & LGPLv2 & GFDLv1.1"
> +LICENSE = "GPL-2.0 & LGPL-2.0 & GFDL-1.1"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://COPYING-DOCS;md5=c9211dab3ae61e580f48432020784324 \
> @@ -9,12 +9,17 @@ SECTION = "x11/gnome"
>
>  PR = "r7"
>
> -DEPENDS = "gnome-doc-utils-native gconf glib-2.0 gnome-desktop gtk+ pango libwnck gnome-menus cairo libgweather dbus-glib librsvg libcanberra"
> +DEPENDS = "gnome-doc-utils-native gconf glib-2.0 gnome-desktop gtk+ \
> +           pango libwnck gnome-menus cairo libgweather dbus-glib \
> +          librsvg libcanberra"
> +RDEPENDS_${PN} = "python"
>
>  inherit gtk-doc gnome autotools-brokensep gettext pkgconfig gconf
>
> -SRCREV = "6a364b6a4a9beed3da9ca6f5b0dac81eb99dea2a"
> -SRC_URI = "git://git.gnome.org/gnome-panel;branch=gnome-2-32"
> +SRCREV = "8292bd2b8a36df7eed3c760899400790cde68590"
> +SRC_URI = "git://git.gnome.org/gnome-panel;branch=gnome-2-32 \
> +           file://0001-Fix-build-with-gcc-5.patch \
> +         "
>
>  S = "${WORKDIR}/git"
>
> --
> 2.1.4
>

