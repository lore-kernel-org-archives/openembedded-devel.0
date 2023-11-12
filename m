Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275CFC4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 13:37:32 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.14849.1699796249509686613
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 05:37:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SQ+xbEld;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9e28724ac88so555508866b.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 05:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699796247; x=1700401047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TWDJHpMO0nFg0S/2hfGeKaTSp7M8UUiAT60kwIazPrY=;
        b=SQ+xbEldY+XKJEem1CuIdv8GLxpgBWq+nXY22OVlF4bxcBFxVTjbpTSUNjr3wd6jX7
         24WjmC67JTjUZdgZo/VfBZcG8PhYJfPfII1WZAVf3J7nJMqhnKtxqCN/jdjqaKx73lou
         CvdModuEkGt2r9cfozQOWiVlb7afhZDGS6oGtVTZrymo3kngtcVIltfAJTl0BkD3MWIk
         2oPDu+yiwQ7oyBX+pVOKzUA7M5Jkb8efGjRfW/4awyvpJ1mCIBtZbY+5XFbhCJiIw0l7
         UZ0Wwuq2BbuIVu0Chw2l8jvscL1divYWBcGwDf5WWEhVt8yL4sg9IuCfYCPFhhp4GPa9
         dzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699796247; x=1700401047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWDJHpMO0nFg0S/2hfGeKaTSp7M8UUiAT60kwIazPrY=;
        b=BJHYOYRvmKMBa4IByF1TG0uXh5VnDNu3fgzNuRWA6QcxiMCK6dJjS6fG9YbIF+1Nq1
         shdDMzZJiKK0Cr9/7xak+PnwIo9jaJdOuK4PJICfuYgfThM/zRV793f6TB9/EuQg0QnZ
         S40k5V9njVl452YALJvhFGfi1Znj95blNiGwbIRMh/VBHaRbecV/l/blS0lfqjyMecf/
         3HNvmbFbz/Mf3wFjHTC3zkgvpbRJD5S1rHlALvPTU0ddbOp/sjfr2m5bVANFdD3++C/5
         xnxfgtaMjGWoEY7bv9L3843O5dP1V8Wo3jvLKijFXgEaupFAn+hhuTYzOgkqOpngwomF
         jPRQ==
X-Gm-Message-State: AOJu0Yym2MSpKWduZ82ps3yvVMyKcCZyVOVz/cJ74twhRiLKoUR1IXP1
	kKIkqLBFken0jSK5HGh4ylku0uP308qDCQ==
X-Google-Smtp-Source: AGHT+IG00OlMYCOKUp9y+4i63fksZYqIlKY+M0u+scqbhfKLK7lrNj9K2ZlmkfP1J00PbCcfTwmfcw==
X-Received: by 2002:a17:906:7fda:b0:9dc:2215:1593 with SMTP id r26-20020a1709067fda00b009dc22151593mr3453478ejs.25.1699796247067;
        Sun, 12 Nov 2023 05:37:27 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id dx15-20020a170906a84f00b009adcb6c0f0esm2566873ejb.193.2023.11.12.05.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 05:37:26 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-multimedia][PATCH] libmatroska: upgrade 1.4.1 -> 1.7.1
Date: Sun, 12 Nov 2023 16:37:06 +0300
Message-Id: <20231112133706.195444-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 13:37:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106588

Changelog:

https://github.com/Matroska-Org/libmatroska/blob/v1.x/NEWS.md

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...efile-Use-LINKFLAGS-during-link-step.patch | 29 ---------------
 .../libmatroska/libmatroska_1.4.1.bb          | 37 -------------------
 .../libmatroska/libmatroska_1.7.1.bb          | 16 ++++++++
 3 files changed, 16 insertions(+), 66 deletions(-)
 delete mode 100644 meta-multimedia/recipes-mkv/libmatroska/libmatroska/0001-Makefile-Use-LINKFLAGS-during-link-step.patch
 delete mode 100644 meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
 create mode 100644 meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb

diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska/0001-Makefile-Use-LINKFLAGS-during-link-step.patch b/meta-multimedia/recipes-mkv/libmatroska/libmatroska/0001-Makefile-Use-LINKFLAGS-during-link-step.patch
deleted file mode 100644
index f7656913b..000000000
--- a/meta-multimedia/recipes-mkv/libmatroska/libmatroska/0001-Makefile-Use-LINKFLAGS-during-link-step.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From f0c879097c331d1dabe6ee92b583a8badb62ea6d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 18 Mar 2017 08:26:35 -0700
-Subject: [PATCH] Makefile: Use LINKFLAGS during link step
-
-Adds much needed GNU_HASH section into the .so
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- make/linux/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/make/linux/Makefile b/make/linux/Makefile
-index 3ca7b0f..b5c9645 100644
---- a/make/linux/Makefile
-+++ b/make/linux/Makefile
-@@ -104,7 +104,7 @@ $(LIBRARY): $(objects)
- 	$(RANLIB) $@
- 
- $(LIBRARY_SO): $(objects_so)
--	$(CXX) -shared -Wl,-soname,$(LIBRARY_SO_VER) -o $(LIBRARY_SO_VER) $(objects_so) -lebml
-+	$(CXX) $(LINKFLAGS) -shared -Wl,-soname,$(LIBRARY_SO_VER) -o $(LIBRARY_SO_VER) $(objects_so) -lebml
- 	rm -f $(LIBRARY_SO)
- 	ln -s $(LIBRARY_SO_VER) $(LIBRARY_SO)
- 
--- 
-2.12.0
-
diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
deleted file mode 100644
index 890be6926..000000000
--- a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-SUMMARY = "libmatroska is a C++ libary to parse Matroska files (.mkv and .mka)"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4fbd65380cdd255951079008b364516c"
-
-DEPENDS = "libebml"
-
-SRC_URI = "http://dl.matroska.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://0001-Makefile-Use-LINKFLAGS-during-link-step.patch \
-           "
-SRC_URI[md5sum] = "f61b2e5086f4bb9d24a43cc8af43a719"
-SRC_URI[sha256sum] = "086f21873e925679babdabf793c3bb85c353d0cd79423543a3355e08e8a4efb7"
-
-EXTRA_OEMAKE = "-e MAKEFLAGS="
-
-do_compile() {
-    cd ${S}/make/linux
-    oe_runmake CROSS="${TARGET_PREFIX}"
-}
-
-do_install() {
-    cd ${S}/make/linux
-
-    install -d ${D}${libdir}
-    install -m 0644 libmatroska.a ${D}${libdir}
-    install -m 0755 libmatroska.so.* ${D}${libdir}
-    cp -R --no-dereference --preserve=mode,links -v libmatroska.so ${D}${libdir}
-
-    install -d ${D}${includedir}/matroska
-    for i in ../../matroska/*.h; do
-        install -m 0644 $i ${D}${includedir}/matroska
-    done
-
-    install -d ${D}${includedir}/matroska/c
-    for i in ../../matroska/c/*.h; do
-        install -m 0644 $i ${D}${includedir}/matroska/c
-    done
-}
diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb
new file mode 100644
index 000000000..16862e690
--- /dev/null
+++ b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "C++ library to parse and create Matroska files(.mkv and .mka)"
+HOMEPAGE = "https://github.com/Matroska-Org/libmatroska"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = "libebml"
+
+SRC_URI = "git://github.com/Matroska-Org/libmatroska.git;branch=v1.x;protocol=https"
+SRCREV = "f5315fddda2d434e47035c038549a808d8b8eac7"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig cmake
+
+#Static library enabled by default. It has been added in case you want to use it dynamically.
+#EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON"
-- 
2.25.1


