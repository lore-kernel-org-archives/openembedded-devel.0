Return-Path: <pramanik.souravkumar@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4F6C71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 12:33:03 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.47013.1693830775448257473
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Sep 2023 05:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hKhs7LdW;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: pramanik.souravkumar@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c336f5b1ffso7449515ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 05:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693830775; x=1694435575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pazrX8rt4GpeP10Mq+B/T2JVVrbaBAnULQmaBqZyRec=;
        b=hKhs7LdWmXLkMPOjyrX42Mh6b1OU3N62IIV9/mb+hflmHFXDcvopnu4Q2sen3UC90T
         BTaTmxXggmmOQcjq6dbtLRmk2Dde15f7k8t2fKmVfecrhDUKCbmpE9U1JW7YWkXMlNbj
         wn3NxUCts7u3J5yUSwktNNGkBqE64P0qhSLeyEgeNlcLfp10yEqOYLBEFqH3+IXbHQo5
         2J07QI74kXvUip8MA85vsqMHakCHWTGphkdj4dHqpCWchf5EjNzU4l0aCOvNOTwVV+8/
         B38XwZuViAeiw6j7NY24h6nm9P0xRQCRJNAyF/9U14nQKqhfdG+ofO8s20kkc3CX3r1Q
         a9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693830775; x=1694435575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pazrX8rt4GpeP10Mq+B/T2JVVrbaBAnULQmaBqZyRec=;
        b=co1LPnoYAVttHj70VbtvkcSGpNKbIULGbPNNbZ3cD62N3PnSL9Uf3KZ6DgNyQQk1/P
         qJnjPdwnK7sVKRi4YSHwEYa9O/F2tM3nHYXZoUqNi6hdfbHRUD4+ss08z46cdixb5yBS
         MCcVIlHFWSRVSbTPdnFk23Du9K35g96q5xfM7HzXTyMhQIj7NQ0MBq67fx9jT+j1nPW9
         WWxwvy4NMvWgK3c/O9vIYs2SGXxHPEkptIPNPjlsq/FO0H8d+7Trp0Zl8o18O0sdkg7D
         pX34K/WN/T1d5Q7u19BlJif6vxSdnwQJtbsvn4Psii+NMD8fELz6x/A4Enoe0438tclL
         pIvw==
X-Gm-Message-State: AOJu0YxGU0AH5WXiimKqO6S6WCU0dj/bgvB7QjkRRjgiQtTojpIwCdtx
	z/1fOZLhKp+etXtm+g9pFzsM0v6iA810dQ==
X-Google-Smtp-Source: AGHT+IETqsa5fmbwVGjvwPEnsdPqJRAYtjTh9ObwpbYfnHjEzWmUlhUQKfOM7l5cztGxd1dt14yAiw==
X-Received: by 2002:a17:903:2345:b0:1bf:11ce:c6ae with SMTP id c5-20020a170903234500b001bf11cec6aemr12720611plh.18.1693830774673;
        Mon, 04 Sep 2023 05:32:54 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c3f:18be:6e26:cebe:deeb:ef24])
        by smtp.gmail.com with ESMTPSA id jd4-20020a170903260400b001c0774d9327sm7501424plb.91.2023.09.04.05.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 05:32:54 -0700 (PDT)
From: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	pramanik.souravkumar@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [meta-oe][kirkstone][PATCH] meta-oe-components: Avoid usage of nobranch=1
Date: Mon,  4 Sep 2023 18:02:19 +0530
Message-Id: <20230904123219.75230-1-pramanik.souravkumar@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 12:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104712

The usage of nobranch=1 in SRC_URI allows using unprotected branches.

This change updates the real branch name in place of nobranch=1 for these components.

Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
---
 meta-gnome/recipes-connectivity/geary/geary_40.0.bb             | 2 +-
 meta-networking/recipes-connectivity/libdnet/libdnet_1.14.bb    | 2 +-
 .../dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb   | 2 +-
 meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb              | 2 +-
 meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb               | 2 +-
 meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb                     | 2 +-
 meta-oe/recipes-support/glog/glog_0.5.0.bb                      | 2 +-
 meta-oe/recipes-support/libmxml/libmxml_3.3.bb                  | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb b/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
index 501b27a54..7faa69c55 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
@@ -33,7 +33,7 @@ RDEPENDS:${PN} = "gnome-keyring"
 inherit meson pkgconfig mime-xdg gtk-icon-cache gobject-introspection vala features_check
 
 SRC_URI = " \
-	git://github.com/GNOME/geary.git;nobranch=1;protocol=https \
+	git://github.com/GNOME/geary.git;branch=main;protocol=https \
         file://0001-Util.Cache.Lru-Workaround-missing-generic-type-argum.patch \
         file://0002-Fix-accessibility-issues-with-initializer-of-constan.patch \
 "
diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.14.bb b/meta-networking/recipes-connectivity/libdnet/libdnet_1.14.bb
index 9f2ff5157..c7cd21b6b 100644
--- a/meta-networking/recipes-connectivity/libdnet/libdnet_1.14.bb
+++ b/meta-networking/recipes-connectivity/libdnet/libdnet_1.14.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0036c1b155f4e999f3e0a373490b5db9"
 
-SRC_URI = "git://github.com/dugsong/libdnet.git;nobranch=1;protocol=https"
+SRC_URI = "git://github.com/dugsong/libdnet.git;branch=master;protocol=https"
 SRCREV = "3e782472d2a58d5e1b94d04eda4a364c2d257600"
 
 UPSTREAM_CHECK_GITTAGREGEX = "libdnet-(?P<pver>\d+(\.\d+)+)"
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
index 7bca24cc0..b59fc1bc9 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
@@ -22,7 +22,7 @@ SRCREV_FORMAT = "rwmem_inih"
 
 SRC_URI = " \
     git://github.com/tomba/rwmem.git;protocol=https;name=rwmem;branch=master \
-    git://github.com/benhoyt/inih.git;protocol=https;name=inih;nobranch=1;destsuffix=git/ext/inih \
+    git://github.com/benhoyt/inih.git;protocol=https;name=inih;branch=master;destsuffix=git/ext/inih \
 "
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb b/meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb
index cf33c6904..7f93f704e 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d6fc0df890c5270ef045981b516bb8f2"
 
 # TODO: Pin upstream release (current v7.11.0-80-g419a757)
-SRC_URI = "git://github.com/lvgl/lv_drivers;protocol=https;nobranch=1"
+SRC_URI = "git://github.com/lvgl/lv_drivers;protocol=https;branch=master"
 SRCREV = "419a757c23aaa67c676fe3a2196d64808fcf2254"
 
 DEPENDS = "libxkbcommon lvgl wayland"
diff --git a/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb b/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
index 22b482640..0049bbe23 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
+++ b/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
@@ -8,7 +8,7 @@ DESCRIPTION = "Allow the use of PNG images in LVGL. This implementation uses lod
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d6fc0df890c5270ef045981b516bb8f2"
 
-SRC_URI = "git://github.com/lvgl/lv_lib_png;;protocol=https;nobranch=1"
+SRC_URI = "git://github.com/lvgl/lv_lib_png;;protocol=https;branch=master"
 SRCREV = "bf1531afe07c9f861107559e29ab8a2d83e4715a"
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb
index ea74c5918..0021da01f 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb
@@ -8,7 +8,7 @@ SUMMARY = "Light and Versatile Graphics Library"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.txt;md5=bf1198c89ae87f043108cea62460b03a"
 
-SRC_URI = "gitsm://github.com/lvgl/lvgl;protocol=https;nobranch=1"
+SRC_URI = "gitsm://github.com/lvgl/lvgl;protocol=https;branch=master"
 SRCREV = "d38eb1e689fa5a64c25e677275172d9c8a4ab2f0"
 
 REQUIRED_DISTRO_FEATURES = "wayland"
diff --git a/meta-oe/recipes-support/glog/glog_0.5.0.bb b/meta-oe/recipes-support/glog/glog_0.5.0.bb
index 61581d96d..f0b129396 100644
--- a/meta-oe/recipes-support/glog/glog_0.5.0.bb
+++ b/meta-oe/recipes-support/glog/glog_0.5.0.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
 
 SRC_URI = " \
-    git://github.com/google/glog.git;nobranch=1;protocol=https \
+    git://github.com/google/glog.git;branch=master;protocol=https \
     file://libexecinfo.patch \
 "
 
diff --git a/meta-oe/recipes-support/libmxml/libmxml_3.3.bb b/meta-oe/recipes-support/libmxml/libmxml_3.3.bb
index c8e216779..5169337f5 100644
--- a/meta-oe/recipes-support/libmxml/libmxml_3.3.bb
+++ b/meta-oe/recipes-support/libmxml/libmxml_3.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 HOMEPAGE = "https://www.msweet.org/mxml/"
 BUGTRACKER = "https://github.com/michaelrsweet/mxml/issues"
 
-SRC_URI = "git://github.com/michaelrsweet/mxml.git;nobranch=1;protocol=https"
+SRC_URI = "git://github.com/michaelrsweet/mxml.git;branch=master;protocol=https"
 SRCREV = "0237559fdbcecae34157b547aa2b99e12de305a2"
 S = "${WORKDIR}/git"
 
-- 
2.25.1


