Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABFB7C433F5
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 06:13:56 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.3490.1664604832743945915
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Sep 2022 23:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=XsNsWg51;
 spf=pass (domain: qtec.com, ip: 209.85.167.52, mailfrom: daniel@qtec.com)
Received: by mail-lf1-f52.google.com with SMTP id d42so9871676lfv.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Sep 2022 23:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=0SiJe0ig6+ciOW5eMLRxbhHzxZ4op+/UhuwT3gnKcRw=;
        b=XsNsWg51sBC36R8LxgF+v/Zzxlu8Y67ZRdXlTHqRQsFmBzugY+JG9jSHvUKF8YVD0R
         zeCpXV1PhHXTsI3BgLaBM5gSF3KQhit5zglqNxU6p14yAeHGtxI5s1exiDOMk76ZVKlc
         Dw2k4E3k1Fe58GFCPWb2OO+FLBCapD/i7RLok1GMC+c5FhQNqPs+bs1UlyRXkpXLbeKF
         TaGFtcmmNMKZpBK7X38N6Q3w1uToLKWJbXOa7MPqxZkJ0InCsZU5THUiKqaBsY2NvFDK
         SrRutFUD5ulKGPt8kbkW547suRWgu9vO0kGhY+D50EVhthCAzrY/7aW3dqZnR32TDzyC
         VnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=0SiJe0ig6+ciOW5eMLRxbhHzxZ4op+/UhuwT3gnKcRw=;
        b=4rjL2K4qL0w5SE22sydNx7cpBe3rPOcpXWYRjTjU+Z+eLOR7V+9yWsYBdV2o+eZWPw
         IjmlMM96jRQ3kXr6FQAKK+qsIWzTmDoQcIwMVK2V7DKd1VUUKm5HubtXRZ151S0hKZYT
         gkA6rBvxgREJ0ChJou/WIkOHh/k6H9pLvTqVJVIzOv5oa3TutbopB6wHnxz0foJmu67s
         F3Rn1po7ky7D/c0OB2G6a6W7i/nnnNfbwwZoB3YiETex4rVDhsm7JmaegHkU2/PnCvd9
         dTKCuK19CUAxpjBW3Hh9aPoFRE/SOG5+7CVlg9Jsff98zAv2Ve9yTW1hr6jjYsG++zG7
         lmfQ==
X-Gm-Message-State: ACrzQf117xhrZlXp+0kSd4CbzAho5eQK2tcz89ScxJyuILofSMUACh1l
	VbKTvOOjAaQv2xwBfk5NJitw2LTu3vaDSxwQ5yF5/fHd9tucNG0vm/PNqtPyRydLY92+C5Mol8q
	XxjxOqADg5vLRmo8Ad2HjMygkFlh7CY/zGgZJI7nuRm59c2+l69bOCeFISBhxRA86VpQcGm2t2Y
	9AmxVi13fZuu2O2Q==
X-Google-Smtp-Source: 
 AMsMyM4XqZ/O3wqqa5MOMxpH3o3rdP8GbZdLk3eMtUsbQ1B3IlqXRwh2rk1R/A7PDVAtlnCyQphqVQ==
X-Received: by 2002:a05:6512:689:b0:496:ff8e:9fdc with SMTP id
 t9-20020a056512068900b00496ff8e9fdcmr4240043lfe.177.1664604829935;
        Fri, 30 Sep 2022 23:13:49 -0700 (PDT)
Received: from localhost.localdomain (188-177-43-54-cable.dk.customer.tdc.net.
 [188.177.43.54])
        by smtp.gmail.com with ESMTPSA id
 p14-20020a056512234e00b00496997176f9sm634435lfu.46.2022.09.30.23.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 23:13:49 -0700 (PDT)
From: Daniel Gomez <daniel@qtec.com>
To: openembedded-devel@lists.openembedded.org
Cc: dagmcr@gmail.com,
	Daniel Gomez <daniel@qtec.com>
Subject: [meta-oe][PATCH v4] v4l-utils: Update 1.22.1 -> 1.23.0+fd544473
Date: Sat,  1 Oct 2022 08:13:36 +0200
Message-Id: <20221001061336.89869-1-daniel@qtec.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: 
 <CAMKF1sqk-K0TZHejNKfzG=9C5k+s0RGPG9otOr_OiUenFYv1fA@mail.gmail.com>
References: 
 <CAMKF1sqk-K0TZHejNKfzG=9C5k+s0RGPG9otOr_OiUenFYv1fA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Oct 2022 06:13:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99031

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
v4
- Rebase on top of master-next.

v3
- Fix RDEPENDS:qv4l2 and RDEPENDS:qvidcap using conditional
'bb.utils.contains' to prevent missing runtime dependency when
the meta-qt5 layer is not present.

v2
- Remove PACKAGECONFIG new defaults (remove qv4l2 and qvidcap).
- Fix DEPENDS for qv4l2 and qvidcap using bb.utilscontains_any.

 ....patch => 0004-Do-not-use-getsubopt.patch} | 19 ++++++--
 ...4l-utils_1.22.1.bb => v4l-utils_1.23.0.bb} | 47 +++++++++++++++----
 2 files changed, 53 insertions(+), 13 deletions(-)
 rename meta-oe/recipes-multimedia/v4l2apps/v4l-utils/{0007-Do-not-use-getsubopt.patch => 0004-Do-not-use-getsubopt.patch} (73%)
 rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.22.1.bb => v4l-utils_1.23.0.bb} (56%)

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
similarity index 56%
rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.22.1.bb
rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
index 741e1030c..2f5ae3586 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.22.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
@@ -6,7 +6,10 @@ PROVIDES = "libv4l media-ctl"

 DEPENDS = "jpeg \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)} \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa-lib', '', d)} \
+           ${@bb.utils.contains_any('PACKAGECONFIG', 'qv4l2 qvidcap', 'qtbase qtbase-native', '', d)}"
+
 DEPENDS:append:libc-musl = " argp-standalone"
 DEPENDS:append:class-target = " udev"
 LDFLAGS:append = " -pthread"
@@ -15,30 +18,56 @@ inherit autotools gettext pkgconfig

 PACKAGECONFIG ??= "media-ctl"
 PACKAGECONFIG[media-ctl] = "--enable-v4l-utils,--disable-v4l-utils,,"
+PACKAGECONFIG[qv4l2] = ",--disable-qv4l2"
+PACKAGECONFIG[qvidcap] = ",--disable-qvidcap"
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
+RDEPENDS:qv4l2 += "\
+    ${@bb.utils.contains('PACKAGECONFIG', 'qv4l2', 'qtbase', '', d)}"
+RDEPENDS:qvidcap += "\
+    ${@bb.utils.contains('PACKAGECONFIG', 'qvidcap', 'qtbase', '', d)}"

 FILES:rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc*"

--
2.35.1


