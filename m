Return-Path: <pramanik.souravkumar@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7CEC71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 12:31:03 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.46505.1693830663054688231
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Sep 2023 05:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QaFTV7Pw;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: pramanik.souravkumar@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-68a3e271491so595581b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 05:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693830662; x=1694435462; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pazrX8rt4GpeP10Mq+B/T2JVVrbaBAnULQmaBqZyRec=;
        b=QaFTV7Pwn93YzJ9isgSDSFI/zm+XefOs973kIbVYok03itJ+rvYX5lJupjx4Kuwo6m
         TtPUEJLSsTuB0j+AMw6tCNMAwc0SoroYlR4+wTcgrK0vD8Q+vPubA0cI5k4TSs1hAv24
         kjPL49Ny6PySdAgECICUfqz79fjKiLM6qcpqqz8TyTMDtb2nwBVTuauq1E+D6OFcXS/x
         msr5KzUTuXlhco/7Z5v5vAeiYghoAsuavzcLLJx7MdWvIxE3rMs8cgHnes6mZqTJ4vAb
         WLvn1Qhb/eJ0hthfhMjQ9O7fA/I1TgFl682RyI42SvfkuzlU6eKPxI17TfzCWAndEmun
         3a0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693830662; x=1694435462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pazrX8rt4GpeP10Mq+B/T2JVVrbaBAnULQmaBqZyRec=;
        b=br/5Xrcn1c3kzYCh70UMFugaJuqLTBLe//PrVT4sU81ieWs7uwDvmClG+2cpMTeI1b
         TnNj0D5SCOjtemEjLQXLAoqQCofWVjLfjkhIReTR2iOfNoi9VK7WGlRNt2UMeGh8TVXv
         l7He5a/FRWcOSCcyDatM779S6EQtDPNAya6WnojVO88s9EaoZuBSrUW1dmBP7iYtCK+H
         o+PhGULksXltrOPRqYtvEhL1m2Jkf8FMQEP85JOyaKJPeV5qx+FneF8jRgiSYvwbmHi0
         ZRe/ESaSpFhxTCQRTkRN7rIiUycYRbvM4HbB0HjJBQU2/J97xjlRvJ19fENJlWi2UJ77
         unLA==
X-Gm-Message-State: AOJu0YzG5dQ578k/B1gHESmUtZKBdM6bgpDDi22zehsFhkDTExkOF9Eh
	qJLtbwNxHq5yhdV0kZ4oBBNoxGINKiMItQ==
X-Google-Smtp-Source: AGHT+IG0NGZq7wj7mPYktoGVVJpcJXyBHhwjB35Iz3HxNZOWBd6CfikJWQihIVTV3mKZWNj4x9LxEA==
X-Received: by 2002:a05:6a00:21c4:b0:68b:dbbc:dcea with SMTP id t4-20020a056a0021c400b0068bdbbcdceamr8910578pfj.9.1693830662129;
        Mon, 04 Sep 2023 05:31:02 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c3f:18be:6e26:cebe:deeb:ef24])
        by smtp.gmail.com with ESMTPSA id a17-20020a62e211000000b006887b69f034sm7281879pfi.102.2023.09.04.05.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 05:31:01 -0700 (PDT)
From: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	pramanik.souravkumar@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [meta-oe][master][PATCH] meta-oe-components: Avoid usage of nobranch=1
Date: Mon,  4 Sep 2023 17:58:54 +0530
Message-Id: <20230904122854.74649-1-pramanik.souravkumar@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 12:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104711

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


