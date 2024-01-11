Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A78DC47077
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 04:07:48 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.4686.1704946065697268536
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jan 2024 20:07:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aDHybVXf;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: festevam@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-28b93b04446so1076297a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 20:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704946065; x=1705550865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vO/LelEnFAyWdd3xvAdu8WVuc3y0tLVOErw6EpFNnT8=;
        b=aDHybVXfy30pt0J4531/dNq+7y6fZ297TygtgoCGNYKlGhBnpOYjg4LeFqA2IF6+K6
         naW04LvXCY0UKPvn0qCQwEINEyms0F6cN1E98nvgyP/V1jLuWwZ2CnDItMi/k/pK8YLZ
         4DfvU/NX1sZJecRfbCGbfKmswMERVjJQ278aB6fqqfsbR0Trn0H+xR6wG/WbQYfyD5Hg
         7R94UTRkOnVYPxQRfhm06JE0irkezsNgHynkUvjhI9NFrpayV5sOzVmpiOA14g6twXL4
         PHPwUqWsQjslExkfwkAFAFXd0OvBOMqNsPksxNKOZWEeKSEe3SzePohWdafsoYmwSHdb
         YivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704946065; x=1705550865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vO/LelEnFAyWdd3xvAdu8WVuc3y0tLVOErw6EpFNnT8=;
        b=koTmcWilBpULdqGUlsAPTB1/bVswljOIJATm+3qesmjPtatL+z5dT/q9feQPA35OR5
         QU2v+///GY08WN579S4CCHtANx6zIIid7HdlJpRzmalnaUZVBDZTzta4mz49H8W3LPVS
         Os8Sa+GNujiVFx9hpB0Nw4M6NiwfVncyKQVVuH5rlpTA6h6QgSOYo5Aboy822RIeHkTq
         u36lSCNzpMXT30qPYVhJ/zb0boBZFgwsAMVux5cKGXW3IFSW6Rmn9xvfXjAxv1ZLrVSm
         3hyhZhKo006rWI45dVvXYyLxHfvObTOHR+Z7k1pssWk/mwxGhIMTKYcG5aRUJgBau4oU
         79hw==
X-Gm-Message-State: AOJu0YxgPQQ8HV9qCgoBv1S7wjQkjDjkUIW19QjCUiEit/LN4rv5Uo1K
	LAtOkFSOISioGKHhMjhjZsQ3FtdQuoU=
X-Google-Smtp-Source: AGHT+IExrOTuMRsTiITx8LRJOs04/KmcQ6ROyqf3Ye+TvWo9yXFxWgKHROdtBWEgQ39gs4jhC82itg==
X-Received: by 2002:a17:90b:4c0b:b0:28d:2804:5499 with SMTP id na11-20020a17090b4c0b00b0028d28045499mr1095640pjb.0.1704946064663;
        Wed, 10 Jan 2024 20:07:44 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:bbab:4bf4:6379:2d05])
        by smtp.gmail.com with ESMTPSA id qc12-20020a17090b288c00b0028c2de909e4sm184841pjb.50.2024.01.10.20.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 20:07:44 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] v4l-utils: Update to 1.26.1
Date: Thu, 11 Jan 2024 01:07:34 -0300
Message-Id: <20240111040734.112703-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jan 2024 04:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108221

From: Fabio Estevam <festevam@denx.de>

Update to 1.26.1.

Also remove the Makefile.am patches as they no longer apply due to
the swith to Meson.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 ...-Don-t-install-libmediactl-and-libv4.patch | 46 -------------------
 ...02-original-patch-mediactl-pkgconfig.patch | 23 ----------
 ...iginal-patch-export-mediactl-headers.patch | 26 -----------
 ...4l-utils_1.24.1.bb => v4l-utils_1.26.1.bb} | 29 +++++-------
 4 files changed, 11 insertions(+), 113 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
 delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-original-patch-mediactl-pkgconfig.patch
 delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-original-patch-export-mediactl-headers.patch
 rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.24.1.bb => v4l-utils_1.26.1.bb} (75%)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
deleted file mode 100644
index 52f0cd3388a6..000000000000
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 0d5c0e9a75eca43667b0e29155b635e50622b66a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 27 Feb 2015 21:55:36 +0000
-Subject: [PATCH] Revert "media-ctl: Don't install libmediactl and
-
- libv4l2subdev"
-
-This reverts commit 0911dce53b08b0df3066be2c75f67e8a314d8729.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Conflicts:
-	utils/media-ctl/Makefile.am
-
----
-Upstream-Status: Pending
-
- utils/media-ctl/Makefile.am | 10 +++-------
- 1 file changed, 3 insertions(+), 7 deletions(-)
-
-diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
-index c48c8d6..e255e16 100644
---- a/utils/media-ctl/Makefile.am
-+++ b/utils/media-ctl/Makefile.am
-@@ -1,8 +1,7 @@
--noinst_LTLIBRARIES = libmediactl.la libv4l2subdev.la
--
-+lib_LTLIBRARIES = libmediactl.la libv4l2subdev.la
- libmediactl_la_SOURCES = libmediactl.c mediactl-priv.h
--libmediactl_la_CFLAGS = -static $(LIBUDEV_CFLAGS)
--libmediactl_la_LDFLAGS = -static $(LIBUDEV_LIBS)
-+libmediactl_la_CFLAGS = $(LIBUDEV_CFLAGS)
-+libmediactl_la_LDFLAGS = $(LIBUDEV_LIBS)
- 
- media-bus-format-names.h: ../../include/linux/media-bus-format.h
- 	$(AM_V_GEN) sed -e '/#define MEDIA_BUS_FMT/ ! d; s/.*FMT_//; /FIXED/ d; s/\t.*//; s/.*/{ \"&\", MEDIA_BUS_FMT_& },/;' \
-@@ -18,9 +17,6 @@ CLEANFILES = $(BUILT_SOURCES)
- nodist_libv4l2subdev_la_SOURCES = $(BUILT_SOURCES)
- libv4l2subdev_la_SOURCES = libv4l2subdev.c
- libv4l2subdev_la_LIBADD = libmediactl.la
--libv4l2subdev_la_CFLAGS = -static
--libv4l2subdev_la_LDFLAGS = -static
--
- mediactl_includedir=$(includedir)/mediactl
- noinst_HEADERS = mediactl.h v4l2subdev.h
- 
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-original-patch-mediactl-pkgconfig.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-original-patch-mediactl-pkgconfig.patch
deleted file mode 100644
index d52475974f0a..000000000000
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-original-patch-mediactl-pkgconfig.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 320b8378ee30eb5e0fe83a8b397f822f2f88a4c1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 1 Mar 2015 22:25:07 +0000
-Subject: [PATCH] %% original patch: mediactl-pkgconfig.patch
-
----
-Upstream-Status: Pending
-
- utils/media-ctl/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
-index e255e16..ff7b417 100644
---- a/utils/media-ctl/Makefile.am
-+++ b/utils/media-ctl/Makefile.am
-@@ -20,6 +20,7 @@ libv4l2subdev_la_LIBADD = libmediactl.la
- mediactl_includedir=$(includedir)/mediactl
- noinst_HEADERS = mediactl.h v4l2subdev.h
- 
-+pkgconfig_DATA = libmediactl.pc
- bin_PROGRAMS = media-ctl
- media_ctl_SOURCES = media-ctl.c options.c options.h tools.h
- media_ctl_LDADD = libmediactl.la libv4l2subdev.la
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-original-patch-export-mediactl-headers.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-original-patch-export-mediactl-headers.patch
deleted file mode 100644
index f6fcee92eab1..000000000000
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-original-patch-export-mediactl-headers.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From f7109d6b2fcb291824d795071c04a492d9fbc45b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 1 Mar 2015 22:25:07 +0000
-Subject: [PATCH] %% original patch: export-mediactl-headers.patch
-
----
-Upstream-Status: Pending
-
- utils/media-ctl/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
-index ff7b417..6ce656f 100644
---- a/utils/media-ctl/Makefile.am
-+++ b/utils/media-ctl/Makefile.am
-@@ -17,8 +17,8 @@ CLEANFILES = $(BUILT_SOURCES)
- nodist_libv4l2subdev_la_SOURCES = $(BUILT_SOURCES)
- libv4l2subdev_la_SOURCES = libv4l2subdev.c
- libv4l2subdev_la_LIBADD = libmediactl.la
--mediactl_includedir=$(includedir)/mediactl
--noinst_HEADERS = mediactl.h v4l2subdev.h
-+otherincludedir = $(includedir)/mediactl
-+otherinclude_HEADERS = mediactl.h v4l2subdev.h
- 
- pkgconfig_DATA = libmediactl.pc
- bin_PROGRAMS = media-ctl
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.24.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
similarity index 75%
rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.24.1.bb
rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
index f314d9b6aed5..a801368c1082 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.24.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
@@ -18,34 +18,27 @@ LDFLAGS:append = " -pthread"
 # Needs further investigation
 GLIBC_64BIT_TIME_FLAGS = ""
 
-inherit autotools gettext pkgconfig
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[qv4l2] = ",-Dqv4l2=disabled"
+PACKAGECONFIG[qvidcap] = ",-Dqvidcap=disabled"
+PACKAGECONFIG[v4l2-tracer] = ",-Dv4l2-tracer=disabled,json-c"
 
-PACKAGECONFIG ??= "media-ctl"
-PACKAGECONFIG[media-ctl] = "--enable-v4l-utils,--disable-v4l-utils,,"
-PACKAGECONFIG[qv4l2] = ",--disable-qv4l2"
-PACKAGECONFIG[qvidcap] = ",--disable-qvidcap"
-PACKAGECONFIG[v4l2-tracer] = ",--disable-v4l2-tracer,json-c"
+inherit meson gettext pkgconfig
 
 SRC_URI = "\
-    git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=stable-1.24 \
-    file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch \
-    file://0002-original-patch-mediactl-pkgconfig.patch \
-    file://0003-original-patch-export-mediactl-headers.patch \
+    git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=stable-1.26 \
     file://0004-Do-not-use-getsubopt.patch \
 "
 
-SRCREV = "8799081b143627c9c09dea0c60ad3d1cc17cc848"
+SRCREV = "5fa4eb45ee2fd447c102b35da61c0b8920398b20"
 
 PV .= "+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-do_configure:prepend() {
-    cd ${S}; ./bootstrap.sh; cd -
-}
-
-EXTRA_OECONF = "--enable-shared --with-udevdir=${base_libdir}/udev \
-                --disable-v4l2-compliance-32 --disable-v4l2-ctl-32"
+# Disable the erroneous installation of gconv-modules that would break glib
+# like it is done in Debian and ArchLinux.
+EXTRA_OEMESON = "-Dgconv=disabled"
 
 VIRTUAL-RUNTIME_ir-keytable-keymaps ?= "rc-keymaps"
 
@@ -72,7 +65,7 @@ RDEPENDS:qv4l2 += "\
 RDEPENDS:qvidcap += "\
     ${@bb.utils.contains('PACKAGECONFIG', 'qvidcap', 'qtbase', '', d)}"
 
-FILES:rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
+FILES:rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc* ${systemd_unitdir}/system/*"
 
 FILES:${PN} = "${bindir} ${sbindir}"
 
-- 
2.34.1


