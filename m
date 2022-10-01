Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B80C433F5
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:44:02 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.391.1664642633155142856
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jf/Bvral;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-1322d768ba7so1591264fac.5
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=2Dfwt2qM0n9giNU8ysQW0kY8yG21mvrWpnx0UewMuaE=;
        b=jf/BvralGShtUQtefJO6K2HIGyzZS3BsldKMmE7fJDUm8QIFVdiQHnYtsKOOYMVWID
         w3gqhqAv98XCIylfZYYYFSozhAIaBXzTe1f6bITAHjYgTsbrrVdSUZ9D2xerPZR9QbmJ
         cuu0djjI+3bCJTDatGsDtN0OdCQcrN3F/Z7g3S5bavzj5pZYkkzAkO+3VPJPi42S1r1v
         bVhCUtuomVeOFAjKS5hjVDNy3rPnDWNItvxGf5TXZvtTgvfGrZJofFin2bmkIVKzZJp1
         4qQJ5FlM2EreImY8b8hmlnU3r5Nf37k6dpe2mRi3I+zxtn9UZ9bzoWfjVJMUNNtulJ6V
         GnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=2Dfwt2qM0n9giNU8ysQW0kY8yG21mvrWpnx0UewMuaE=;
        b=2wmxTtaQK728K8yoojWw2f/0MwVXSrKQIfCUJf83qHMOqlxbyHPBMfiqZaEJXo/L1I
         XB6iinv3zR6xtsAXRr0+GNJqESBrgQQ9gBQCY5F3UZOVzTTHVu2RzMunJ9ev1CcXb+qo
         6JvHSe0/HULpq2elNg0iaXlRy1iwGhIM/1z6N2PkPekcp9js0Z03Gg+sWVAIEgbaCDMS
         W5HuNUPmzP5mFiqH/NCIiOIvIFcX212dVO7lknkJfD4wYd30/W8cVugk+ECN2aZgg5lf
         ftxH+o77dfu3FB2n9/KqiWKSvaR1R6tkgRqoiyN6917dTWgMtkAHDwIcSpQHQpyPP3nF
         lbVQ==
X-Gm-Message-State: ACrzQf2KDOh7A2Du2y4MDyuFAvEQ5sAb1any1bzVhyADsCA9RZp5euwe
	0XZjhnNO8UPzruJlLmiCSF3R5p+bRaYu955YKBY=
X-Google-Smtp-Source: 
 AMsMyM794gM4sbjnKmNJQ/Q/5I1xLj0pEWWp59xRXuB+Zco1WsaMp7nRLzUaDQfMfDULZxVJVD1ar6/CNlGb0wPAfXY=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr1636131oae.262.1664642632257; Sat, 01
 Oct 2022 09:43:52 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAMKF1sqk-K0TZHejNKfzG=9C5k+s0RGPG9otOr_OiUenFYv1fA@mail.gmail.com>
 <20221001061336.89869-1-daniel@qtec.com>
In-Reply-To: <20221001061336.89869-1-daniel@qtec.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 1 Oct 2022 09:43:26 -0700
Message-ID: 
 <CAMKF1spS87zLKbq2WQ2VW8wDcueskvOVZYTV=4GkDDReBujbLQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v4] v4l-utils: Update 1.22.1 ->
 1.23.0+fd544473
To: Daniel Gomez <daniel@qtec.com>
Cc: openembedded-devel@lists.openembedded.org, dagmcr@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Oct 2022 16:44:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99032

v4 still fails to apply

patching file meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0004-Do-not-use-getsubopt.patch
(renamed from meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0007-Do-not-use-getsubopt.patch)
Hunk #2 FAILED at 11.
Hunk #3 succeeded at 47 with fuzz 2.
1 out of 3 hunks FAILED -- saving rejects to file
meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0004-Do-not-use-getsubopt.patch.rej
patching file meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
(renamed from meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.22.1.bb)

On Fri, Sep 30, 2022 at 11:13 PM Daniel Gomez <daniel@qtec.com> wrote:
>
> Use git instead of release tarball to close the gap between the latest
> 1.22.1 and master.
>
> Add 'bootstrap.sh' call to fix configuration issues:
>
> Error:
> config.status: error: cannot find input file:
> `v4l-utils-po/Makefile.in.in
>
> Adapt patch '0007-Do-not-use-getsubopt.patch': Upstream has replaced
> the use of getsubopt with v4l_subopt which detects if getsubopt is
> provided via glibc or not. Otherwise it uses a static
> v4l_getsubopt copied from glibc.
>
> (From v4l-utils: 6e19bb895a16a9a247524ac526ab47f576cc36f6)
>
> Also rename patch number to '0004-Do-not-use-getsubopt.patch'.
>
> Add qv4l2 and qvidcap packages support but keep them disabled as
> they require meta-qt5.
>
> Enable alsa support if alsa is part of the DISTRO_FEATURES.
>
> Signed-off-by: Daniel Gomez <daniel@qtec.com>
> ---
> v4
> - Rebase on top of master-next.
>
> v3
> - Fix RDEPENDS:qv4l2 and RDEPENDS:qvidcap using conditional
> 'bb.utils.contains' to prevent missing runtime dependency when
> the meta-qt5 layer is not present.
>
> v2
> - Remove PACKAGECONFIG new defaults (remove qv4l2 and qvidcap).
> - Fix DEPENDS for qv4l2 and qvidcap using bb.utilscontains_any.
>
>  ....patch => 0004-Do-not-use-getsubopt.patch} | 19 ++++++--
>  ...4l-utils_1.22.1.bb => v4l-utils_1.23.0.bb} | 47 +++++++++++++++----
>  2 files changed, 53 insertions(+), 13 deletions(-)
>  rename meta-oe/recipes-multimedia/v4l2apps/v4l-utils/{0007-Do-not-use-getsubopt.patch => 0004-Do-not-use-getsubopt.patch} (73%)
>  rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.22.1.bb => v4l-utils_1.23.0.bb} (56%)
>
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0007-Do-not-use-getsubopt.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0004-Do-not-use-getsubopt.patch
> similarity index 73%
> rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0007-Do-not-use-getsubopt.patch
> rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0004-Do-not-use-getsubopt.patch
> index d8d1b8d18..fb844acbe 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0007-Do-not-use-getsubopt.patch
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0004-Do-not-use-getsubopt.patch
> @@ -1,4 +1,4 @@
> -From e4582c11f76b9390a3e172dcf0741dca90a9dc8d Mon Sep 17 00:00:00 2001
> +From 6e7e52de7afe29597016952a7317faf9c3ea3268 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sat, 30 Nov 2019 18:50:34 -0800
>  Subject: [PATCH] Do not use getsubopt
> @@ -11,24 +11,32 @@ Simply avoid getsubopt, since we cannot rely on it.
>  Imported from Alpine Linux
>
>  Upstream-Status: Pending
> +
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> +Adapt patch to 1.23.0.
> +
> +(v4l-utils rev fd544473800d02e90bc289434cc44e5aa8fadd0f).
> +
> +%% original patch: 0007-Do-not-use-getsubopt.patch
> +
> +Signed-off-by: Daniel Gomez <daniel@qtec.com>
>  ---
>   utils/v4l2-ctl/v4l2-ctl-common.cpp | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)
>
>  diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> -index c940171..49c0f39 100644
> +index d77f7104..838c297d 100644
>  --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
>  +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> -@@ -956,15 +956,17 @@ static bool parse_subset(char *optarg)
> +@@ -994,15 +994,17 @@ static bool parse_subset(char *optarg)
>
>   static bool parse_next_subopt(char **subs, char **value)
>   {
>  -      static char *const subopts[] = {
>  -          nullptr
>  -      };
> --      int opt = getsubopt(subs, subopts, value);
> +-      int opt = v4l_getsubopt(subs, subopts, value);
>  +      char *p = *subs;
>  +      *value = *subs;
>
> @@ -47,3 +55,6 @@ index c940171..49c0f39 100644
>   }
>
>   void common_cmd(const std::string &media_bus_info, int ch, char *optarg)
> +--
> +2.35.1
> +
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.22.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
> similarity index 56%
> rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.22.1.bb
> rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
> index 741e1030c..2f5ae3586 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.22.1.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
> @@ -6,7 +6,10 @@ PROVIDES = "libv4l media-ctl"
>
>  DEPENDS = "jpeg \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)} \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
> +           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
> +           ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa-lib', '', d)} \
> +           ${@bb.utils.contains_any('PACKAGECONFIG', 'qv4l2 qvidcap', 'qtbase qtbase-native', '', d)}"
> +
>  DEPENDS:append:libc-musl = " argp-standalone"
>  DEPENDS:append:class-target = " udev"
>  LDFLAGS:append = " -pthread"
> @@ -15,30 +18,56 @@ inherit autotools gettext pkgconfig
>
>  PACKAGECONFIG ??= "media-ctl"
>  PACKAGECONFIG[media-ctl] = "--enable-v4l-utils,--disable-v4l-utils,,"
> +PACKAGECONFIG[qv4l2] = ",--disable-qv4l2"
> +PACKAGECONFIG[qvidcap] = ",--disable-qvidcap"
> +
> +SRC_URI = "\
> +    git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=master \
> +    file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch \
> +    file://0002-original-patch-mediactl-pkgconfig.patch \
> +    file://0003-original-patch-export-mediactl-headers.patch \
> +    file://0004-Do-not-use-getsubopt.patch \
> +"
> +
> +SRCREV = "fd544473800d02e90bc289434cc44e5aa8fadd0f"
> +
> +S = "${WORKDIR}/git"
> +B = "${S}"
>
> -SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2 \
> -           file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch \
> -           file://0002-original-patch-mediactl-pkgconfig.patch \
> -           file://0003-original-patch-export-mediactl-headers.patch \
> -           file://0007-Do-not-use-getsubopt.patch \
> -           "
> +do_configure:prepend() {
> +    ${S}/bootstrap.sh
> +}
>
>  SRC_URI[md5sum] = "8aa73287320a49e9170a8255d7b2c7e6"
>  SRC_URI[sha256sum] = "65c6fbe830a44ca105c443b027182c1b2c9053a91d1e72ad849dfab388b94e31"
>
> -EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/udev \
> +EXTRA_OECONF = "--enable-shared --with-udevdir=${base_libdir}/udev \
>                  --disable-v4l2-compliance-32 --disable-v4l2-ctl-32"
>
>  VIRTUAL-RUNTIME_ir-keytable-keymaps ?= "rc-keymaps"
>
> -PACKAGES =+ "media-ctl ir-keytable rc-keymaps libv4l libv4l-dev"
> +PACKAGES =+ "media-ctl ir-keytable rc-keymaps libv4l libv4l-dev qv4l2 qvidcap"
>
>  RPROVIDES:${PN}-dbg += "libv4l-dbg"
>
>  FILES:media-ctl = "${bindir}/media-ctl ${libdir}/libmediactl.so.*"
> +FILES:qv4l2 = "\
> +    ${bindir}/qv4l2 \
> +    ${datadir}/applications/qv4l2.desktop \
> +    ${datadir}/icons/hicolor/*/apps/qv4l2.* \
> +"
> +FILES:qvidcap = "\
> +    ${bindir}/qvidcap \
> +    ${datadir}/applications/qvidcap.desktop \
> +    ${datadir}/icons/hicolor/*/apps/qvidcap.* \
> +"
>
>  FILES:ir-keytable = "${bindir}/ir-keytable ${base_libdir}/udev/rules.d/*-infrared.rules"
>  RDEPENDS:ir-keytable += "${VIRTUAL-RUNTIME_ir-keytable-keymaps}"
> +RDEPENDS:qv4l2 += "\
> +    ${@bb.utils.contains('PACKAGECONFIG', 'qv4l2', 'qtbase', '', d)}"
> +RDEPENDS:qvidcap += "\
> +    ${@bb.utils.contains('PACKAGECONFIG', 'qvidcap', 'qtbase', '', d)}"
>
>  FILES:rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
>
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99031): https://lists.openembedded.org/g/openembedded-devel/message/99031
> Mute This Topic: https://lists.openembedded.org/mt/94047443/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

