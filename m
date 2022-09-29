Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D5EC433FE
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 16:14:47 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.12571.1664468085767122914
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 09:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=do0twCpK;
 spf=pass (domain: qtec.com, ip: 209.85.208.54, mailfrom: daniel@qtec.com)
Received: by mail-ed1-f54.google.com with SMTP id a41so2647799edf.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 09:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=hlSSSWavt6GGRqqEQ8D69ztPie8Wxhw3LYO6aV5GE9Y=;
        b=do0twCpKr6apFEUY0bXrbKuIzpfxzAkKbeyiFY5sMrBwat+K/k7iuLt9T24FT+nf7E
         1S9Guom0wuI362ViE09R0aP8DzIw5ggxJSB6pVtJIXyZbkmuicJ0xjF5Pcmq3tfaK8ZS
         /EkTmygaIaGKD8jZkUwzAuIdBejvRNVLZL39JPHm+H7eiwJx9tpYqKxVkpK9qkVwfIez
         1vEruaioTS2YOhoGpap6+T+L9MRLslrZBFsy47tiAGIzeSTXe1/rLKEYrgyJG5s90VpB
         HNougvduqZWHbB6KZKGv8MDvJrfaytzY/3Y35Nyo9rJOCcz5sdiJxjJLAagguAOlEiKn
         S/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=hlSSSWavt6GGRqqEQ8D69ztPie8Wxhw3LYO6aV5GE9Y=;
        b=FrShnIQTY32uAEZ2Go/r38c54a0JLyz6dx9YyAVwK6eSDxhlzusNvG+iOw7aklnm3U
         hN5ulTXYyGp3rzCXtsiJUO/ZalNtUMO9LRstx0Jro7XJhXCeSHkTO6e1Fofj021FGFx6
         jG7fcz3Y1dxq4LKF/jkpJPrGJS0MU6aEv1Iudx9gz6kfV4hCW9ouc09nCKI+SwdH1PWB
         evznaAH1yGcApJcFzxQrws6Xk+KrujYpiWypZYI/0SiqJanrGD9jEUbrWVHWwgHHDeNS
         SM0HZ/5KC/C2LzNoAqzxt0FBBcajVIoiK1XBh+3NM3pnpYvNpljpNR/gEa7Y4sytutNk
         l0fg==
X-Gm-Message-State: ACrzQf2yRZxJ5rtB9Xtko0RI+W3K8EUfV1tjwz3AgenWLJv1ee6KDO9z
	a0JyBGNsmA79f6FUr4izWcbUqhD2p2Xy06Yf4O9fyrHfonulWYi9xuNTmISwMLMoDd0xj8MBQ0l
	v8n0f59ySQixLFgCzKdpYFJt8f+erGDx71aKoL4lVi5KNtmlIZ/BaYb5dylYtUQktQi0ArsvAj/
	lmbhlinPHTT0wcGP0S
X-Google-Smtp-Source: 
 AMsMyM5uscwyAZu4YvckhNgIbvba/tESLNYtlCvOAbRftyoAT90KUbOgaJIZNnPrCK/OVnMaZSzsng==
X-Received: by 2002:aa7:c58a:0:b0:457:463d:c19d with SMTP id
 g10-20020aa7c58a000000b00457463dc19dmr4005069edq.323.1664468083972;
        Thu, 29 Sep 2022 09:14:43 -0700 (PDT)
Received: from datops.qtec.com (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net.
 [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id
 17-20020a170906311100b00780f6071b5dsm4158382ejx.188.2022.09.29.09.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 09:14:43 -0700 (PDT)
From: Daniel Gomez <daniel@qtec.com>
To: openembedded-devel@lists.openembedded.org
Cc: dagmcr@gmail.com,
	Daniel Gomez <daniel@qtec.com>
Subject: [meta-oe][PATCH 2/3] v4l-utils: Update 1.22.1 -> 1.23.0+fd544473
Date: Thu, 29 Sep 2022 18:14:35 +0200
Message-Id: <20220929161436.64661-2-daniel@qtec.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220929161436.64661-1-daniel@qtec.com>
References: <20220929161436.64661-1-daniel@qtec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Sep 2022 16:14:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99010

Use git instead of release tarball to close the gap between the latest
1.22.1 and master.

Add 'bootstrap.sh' call to fix configuration issues:

Error:
config.status: error: cannot find input file:
`v4l-utils-po/Makefile.in.in

Adapt patch '0007-Do-not-use-getsubopt.patch': Upstream has replaced
the use of getsubopt with v4l_subopt which detects if getsubopt is
provided via glibc or not. Otherwise it uses a static
v4l_getsubopt copied from glibc.

(From v4l-utils: 6e19bb895a16a9a247524ac526ab47f576cc36f6)

Also rename patch number to '0004-Do-not-use-getsubopt.patch'.

Add qv4l2 and qvidcap packages support but keep them disabled as
they require meta-qt5.

Enable alsa support if alsa is part of the DISTRO_FEATURES.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 ....patch => 0004-Do-not-use-getsubopt.patch} | 19 +++++--
 ...4l-utils_1.22.1.bb => v4l-utils_1.23.0.bb} | 50 +++++++++++++++----
 2 files changed, 56 insertions(+), 13 deletions(-)
 rename meta-oe/recipes-multimedia/v4l2apps/v4l-utils/{0007-Do-not-use-getsubopt.patch => 0004-Do-not-use-getsubopt.patch} (73%)
 rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.22.1.bb => v4l-utils_1.23.0.bb} (57%)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0007-Do-not-use-getsubopt.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0004-Do-not-use-getsubopt.patch
similarity index 73%
rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0007-Do-not-use-getsubopt.patch
rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0004-Do-not-use-getsubopt.patch
index d8d1b8d18..fb844acbe 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0007-Do-not-use-getsubopt.patch
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0004-Do-not-use-getsubopt.patch
@@ -1,4 +1,4 @@
-From e4582c11f76b9390a3e172dcf0741dca90a9dc8d Mon Sep 17 00:00:00 2001
+From 6e7e52de7afe29597016952a7317faf9c3ea3268 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Nov 2019 18:50:34 -0800
 Subject: [PATCH] Do not use getsubopt
@@ -11,24 +11,32 @@ Simply avoid getsubopt, since we cannot rely on it.
 Imported from Alpine Linux
 
 Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
+Adapt patch to 1.23.0.
+
+(v4l-utils rev fd544473800d02e90bc289434cc44e5aa8fadd0f).
+
+%% original patch: 0007-Do-not-use-getsubopt.patch
+
+Signed-off-by: Daniel Gomez <daniel@qtec.com>
 ---
  utils/v4l2-ctl/v4l2-ctl-common.cpp | 18 ++++++++++--------
  1 file changed, 10 insertions(+), 8 deletions(-)
 
 diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
-index c940171..49c0f39 100644
+index d77f7104..838c297d 100644
 --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
 +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
-@@ -956,15 +956,17 @@ static bool parse_subset(char *optarg)
+@@ -994,15 +994,17 @@ static bool parse_subset(char *optarg)
  
  static bool parse_next_subopt(char **subs, char **value)
  {
 -	static char *const subopts[] = {
 -	    nullptr
 -	};
--	int opt = getsubopt(subs, subopts, value);
+-	int opt = v4l_getsubopt(subs, subopts, value);
 +	char *p = *subs;
 +	*value = *subs;
  
@@ -47,3 +55,6 @@ index c940171..49c0f39 100644
  }
  
  void common_cmd(const std::string &media_bus_info, int ch, char *optarg)
+-- 
+2.35.1
+
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.22.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
similarity index 57%
rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.22.1.bb
rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
index 741e1030c..fcc491b78 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.22.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
@@ -6,39 +6,71 @@ PROVIDES = "libv4l media-ctl"
 
 DEPENDS = "jpeg \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)} \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa-lib', '', d)}"
+
 DEPENDS:append:libc-musl = " argp-standalone"
 DEPENDS:append:class-target = " udev"
+DEPENDS:append:qv4l2 = " qtbase qtbase-native"
+DEPENDS:append:qvidcap = " qtbase qtbase-native"
 LDFLAGS:append = " -pthread"
 
 inherit autotools gettext pkgconfig
 
 PACKAGECONFIG ??= "media-ctl"
 PACKAGECONFIG[media-ctl] = "--enable-v4l-utils,--disable-v4l-utils,,"
+PACKAGECONFIG[qv4l2] = ",--disable-qv4l2"
+PACKAGECONFIG[qvidcap] = ",--disable-qvidcap"
+
+PACKAGECONFIG += " qv4l2"
+PACKAGECONFIG += " qvidcap"
+PACKAGECONFIG += " media-ctl"
+
+SRC_URI = "\
+    git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=master \
+    file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch \
+    file://0002-original-patch-mediactl-pkgconfig.patch \
+    file://0003-original-patch-export-mediactl-headers.patch \
+    file://0004-Do-not-use-getsubopt.patch \
+"
+
+SRCREV = "fd544473800d02e90bc289434cc44e5aa8fadd0f"
+
+S = "${WORKDIR}/git"
+B = "${S}"
 
-SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2 \
-           file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch \
-           file://0002-original-patch-mediactl-pkgconfig.patch \
-           file://0003-original-patch-export-mediactl-headers.patch \
-           file://0007-Do-not-use-getsubopt.patch \
-           "
+do_configure:prepend() {
+    ${S}/bootstrap.sh
+}
 
 SRC_URI[md5sum] = "8aa73287320a49e9170a8255d7b2c7e6"
 SRC_URI[sha256sum] = "65c6fbe830a44ca105c443b027182c1b2c9053a91d1e72ad849dfab388b94e31"
 
-EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/udev \
+EXTRA_OECONF = "--enable-shared --with-udevdir=${base_libdir}/udev \
                 --disable-v4l2-compliance-32 --disable-v4l2-ctl-32"
 
 VIRTUAL-RUNTIME_ir-keytable-keymaps ?= "rc-keymaps"
 
-PACKAGES =+ "media-ctl ir-keytable rc-keymaps libv4l libv4l-dev"
+PACKAGES =+ "media-ctl ir-keytable rc-keymaps libv4l libv4l-dev qv4l2 qvidcap"
 
 RPROVIDES:${PN}-dbg += "libv4l-dbg"
 
 FILES:media-ctl = "${bindir}/media-ctl ${libdir}/libmediactl.so.*"
+FILES:qv4l2 = "\
+    ${bindir}/qv4l2 \
+    ${datadir}/applications/qv4l2.desktop \
+    ${datadir}/icons/hicolor/*/apps/qv4l2.* \
+"
+FILES:qvidcap = "\
+    ${bindir}/qvidcap \
+    ${datadir}/applications/qvidcap.desktop \
+    ${datadir}/icons/hicolor/*/apps/qvidcap.* \
+"
 
 FILES:ir-keytable = "${bindir}/ir-keytable ${base_libdir}/udev/rules.d/*-infrared.rules"
 RDEPENDS:ir-keytable += "${VIRTUAL-RUNTIME_ir-keytable-keymaps}"
+RDEPENDS:qv4l2 += "qtbase"
+RDEPENDS:qvidcap += "qtbase"
 
 FILES:rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
 
-- 
2.35.1


