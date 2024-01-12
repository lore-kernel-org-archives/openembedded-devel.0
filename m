Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5F0C4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 12:56:03 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.6241.1705064160933387173
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 04:56:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yufk1Psm;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: festevam@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6d9ab48faeaso1085848b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 04:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705064160; x=1705668960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OZU9GXmSEb2SBUsG5MRDJ/NshvWQEskWj+csW3Qwva8=;
        b=Yufk1PsmxCemt6MlJ9ZujWpHzTTrU5ettpi/TFdVjMw+40xsQG4QD+ShBN4CRx+t+J
         diI5X6PaV0vmyzAe3lViQjSxNAHyHsT6PIQKrrfWYKLThlSQQQJY0Ns43yXz/jRW0bXE
         BUODYwXsoiFVS3mm6j3mn017Ui5fob0WShF6hvNQyiDVifNdvTjqq+XKPSylRY3fZmYW
         FK+qpP5WhcEeFSNECIAx0L6QFZKB9uV2MrYYoIyWyNFWEIuCtk2fNBRq3PEejAIzRabw
         JBOKwmU40+kA/qkdBODpN61G0PzbkSPQ0zfZyZP8uMbgQpp3XCuF7brb0Jk0Hndpxa6J
         h5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705064160; x=1705668960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZU9GXmSEb2SBUsG5MRDJ/NshvWQEskWj+csW3Qwva8=;
        b=At76tS3hXSpTAz7j7eWjzjZ4Y21AVmK8nVPkWVMUoQYl6NLOY8ratINGjHbaU3GCzm
         vRBbtPKI633nMcVkBVpO5bjdYKCmcZcVkSzDoWLhzAKn11Yt/rqCoKWFs0m3GWwXo7R5
         TAFCTTNoIkIXOK5CZjhVT7FgU/pUMqjqGZpCZ9Z5yju+yu3MhuTuGwR4d86iukiOJrD+
         qhwY4yq+UuG9FcmSz9W8oPl6aTwuMPDtpaFkWmjMoXENZ+/W+540bvbhJU0PkTSovCNt
         9Z+2gY8C8DrDbiRzjL8DxfJ0WPtIsbgByWX71WrgQp/pXpkv5ASeXiUc1VD6BRHAQrq+
         d8qg==
X-Gm-Message-State: AOJu0Yx4IaA4ze7k8fcbvUOPLVccLKXtUjw0raCSkhw9xmb3+Nk/z0GB
	Wjp7tTZYjuFBS14U36VSGtA4f79Lb2g=
X-Google-Smtp-Source: AGHT+IFHIcUKRSpT+I44fpgg3zuaKSdYnxu1OdMOLXK6n4IUYWScwIMCHav6yMbnWyWjFT8JyPt+5A==
X-Received: by 2002:a05:6a21:3982:b0:19a:999c:6653 with SMTP id ad2-20020a056a21398200b0019a999c6653mr382692pzc.2.1705064159751;
        Fri, 12 Jan 2024 04:55:59 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8f42:bda2:95c8:2bf2])
        by smtp.gmail.com with ESMTPSA id h3-20020a170902f70300b001d5a5a5e649sm1316560plo.273.2024.01.12.04.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 04:55:59 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] v4l-utils: Update to 1.26.1
Date: Fri, 12 Jan 2024 09:55:53 -0300
Message-Id: <20240112125553.263105-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 12:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108240

From: Fabio Estevam <festevam@denx.de>

Update to 1.26.1.

Remove the Makefile.am patches as they no longer apply due to
the switch to Meson.

Backport a fix that prevents installing 50-rc_keymap.conf in systems
without systemd.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Adjust SRCREV to point to the v4l-utils-1.26.1 tag insted of stable-1.26.
- Keep udevdir v4l2-compliance-32 and v4l2-ctl-32 options.
- Apply a backport fix.

 ...-Don-t-install-libmediactl-and-libv4.patch | 46 ------------------
 ...estrict-the-installation-of-50-rc_ke.patch | 47 +++++++++++++++++++
 ...02-original-patch-mediactl-pkgconfig.patch | 23 ---------
 ...iginal-patch-export-mediactl-headers.patch | 26 ----------
 ...4l-utils_1.24.1.bb => v4l-utils_1.26.1.bb} | 28 +++++------
 5 files changed, 59 insertions(+), 111 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch
 delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-original-patch-mediactl-pkgconfig.patch
 delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-original-patch-export-mediactl-headers.patch
 rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.24.1.bb => v4l-utils_1.26.1.bb} (77%)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
deleted file mode 100644
index 52f0cd338..000000000
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
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch
new file mode 100644
index 000000000..6d06d826b
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch
@@ -0,0 +1,46 @@
+From 502c0302827cec3d2b2a69fb25189646685ef2ff Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <festevam@denx.de>
+Date: Fri, 12 Jan 2024 00:17:14 -0300
+Subject: [PATCH] keytable: meson: Restrict the installation of
+ 50-rc_keymap.conf
+
+Currently, meson tries to install 50-rc_keymap.conf even if systemd
+is not used.
+
+Commit 01f2c6c58e6f ("keytable: restrict installation of 50-rc_keymap.conf"),
+only allowed 50-rc_keymap.conf to be installed when both BPF and systemd
+were used.
+
+Apply the same logic in meson to fix the problem.
+
+Signed-off-by: Fabio Estevam <festevam@denx.de>
+Signed-off-by: Sean Young <sean@mess.org>
+Upstream-Status: Backport [https://git.linuxtv.org/v4l-utils.git/commit/?id=a21924ec424c4744af6f2a794e0677eba35dd168]
+---
+ utils/keytable/meson.build | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/utils/keytable/meson.build b/utils/keytable/meson.build
+index 4130a4bea514..76ce329eae8e 100644
+--- a/utils/keytable/meson.build
++++ b/utils/keytable/meson.build
+@@ -69,6 +69,8 @@ ir_keytable_udev_rules = files(
+ install_data(ir_keytable_udev_rules,
+              install_dir : ir_keytable_system_dir / 'rules.d')
+
++if ir_bpf_enabled
++if dep_systemd.found()
+ if have_udevdsyscallfilter
+     ir_keytable_systemd_files = files(
+         '50-rc_keymap.conf',
+@@ -76,6 +78,8 @@ if have_udevdsyscallfilter
+     install_data(ir_keytable_systemd_files,
+                  install_dir : systemd_systemdir / 'systemd-udevd.service.d')
+ endif
++endif
++endif
+
+ # Install non-existing directory to create empty directory structure
+ # See: https://github.com/mesonbuild/meson/issues/2904
+--
+2.34.1
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-original-patch-mediactl-pkgconfig.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-original-patch-mediactl-pkgconfig.patch
deleted file mode 100644
index d52475974..000000000
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
index f6fcee92e..000000000
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
similarity index 77%
rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.24.1.bb
rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
index f314d9b6a..4ae1a18c9 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.24.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
@@ -18,34 +18,30 @@ LDFLAGS:append = " -pthread"
 # Needs further investigation
 GLIBC_64BIT_TIME_FLAGS = ""
 
-inherit autotools gettext pkgconfig
+inherit meson gettext pkgconfig
 
-PACKAGECONFIG ??= "media-ctl"
-PACKAGECONFIG[media-ctl] = "--enable-v4l-utils,--disable-v4l-utils,,"
-PACKAGECONFIG[qv4l2] = ",--disable-qv4l2"
-PACKAGECONFIG[qvidcap] = ",--disable-qvidcap"
-PACKAGECONFIG[v4l2-tracer] = ",--disable-v4l2-tracer,json-c"
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[qv4l2] = ",-Dqv4l2=disabled"
+PACKAGECONFIG[qvidcap] = ",-Dqvidcap=disabled"
+PACKAGECONFIG[v4l2-tracer] = ",-Dv4l2-tracer=disabled,json-c"
 
 SRC_URI = "\
-    git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=stable-1.24 \
-    file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch \
-    file://0002-original-patch-mediactl-pkgconfig.patch \
-    file://0003-original-patch-export-mediactl-headers.patch \
+    git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=stable-1.26 \
+    file://0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch \
     file://0004-Do-not-use-getsubopt.patch \
 "
 
-SRCREV = "8799081b143627c9c09dea0c60ad3d1cc17cc848"
+SRCREV = "4aee01a027923cab1e40969f56f8ba58d3e6c0d1"
 
 PV .= "+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-do_configure:prepend() {
-    cd ${S}; ./bootstrap.sh; cd -
-}
+EXTRA_OEMESON = "-Dudevdir=${base_libdir}/udev -Dv4l2-compliance-32=false -Dv4l2-ctl-32=false"
 
-EXTRA_OECONF = "--enable-shared --with-udevdir=${base_libdir}/udev \
-                --disable-v4l2-compliance-32 --disable-v4l2-ctl-32"
+# Disable the erroneous installation of gconv-modules that would break glib
+# like it is done in Debian and ArchLinux.
+EXTRA_OEMESON += "-Dgconv=disabled"
 
 VIRTUAL-RUNTIME_ir-keytable-keymaps ?= "rc-keymaps"
 
-- 
2.37.3


