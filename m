Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FEFCE8D6B
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 00:27:46 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.353.1763425659896189984
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 16:27:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gB+BzeQx;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29844c68068so49083385ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 16:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763425659; x=1764030459; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nTxBwnap5goyvDFmIU80rkfxAJ6fbnyKMYHjVl4Gds=;
        b=gB+BzeQxTIyMAyFCtzUSquLau4ttSQCSquNAuE6SZM2sYkYnHkxxypOFGNbwtuAM7g
         dvuO50rwpmnrQbzv3ra33jOc0bAr5o7uzePsKBb+j6hoBjPjKfMX175zaHOS++zLKI2c
         YPGTuZcEfdMtFf4CzFgyUdoITpLgrbN1kZDrteZ5dnvBEeDKXv7k22b6WMO1KUlnfwZo
         1y/WdqH8CU+UWv9pRzqLLncY5EWuMpGLCXW0hn/QReeuSNkmKN3VeS/9K6U9Qlophtln
         uC+szOrOsENsBOL7FknU7GaRypPlM882XD7Uc8cKQ5tXTy0XhbUo6rKea+XiN5/oClv9
         l1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763425659; x=1764030459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2nTxBwnap5goyvDFmIU80rkfxAJ6fbnyKMYHjVl4Gds=;
        b=gIiZ/BHRsXWSQLhHeAUxLdl3sW7Y1vwbMQd5kTd69UKvcdeESi9W3hrizWs4P09i8j
         xxWG81lXitXf9nfJCFicMK9ZhwUxId4zO8wlwlv3fjviC7D72dWPHQ8u3w2VzkF8KG9j
         JjVq+z5m+zqJo0K2uEF/RoEGlOqSTYNMAkmNpHNBRROo+sKyJVsCwZEJmuLTc5haCoU/
         947U0C+zY17eVXA307wACbZ6bwfBvwVUJ7oHT2R+yuYkscdN5QMVobW5q+RGk1jtN8zs
         wtXlU7Z+XonL5ZR+p642TQtTWlnWqKxAmP37PgdQ6i84PLAKSdMFUnJKqke4eY3ikxPj
         2S+Q==
X-Gm-Message-State: AOJu0YxXMq0K4fZsPg2q4gwBXySLI5I0n8A75e+tJgobMenfNfOJXMUL
	RxbHiQp8dYtirCyV4KtJxdcyaOKvf+AqfuHRTRUBbzS46XZ/dFB58p7/gRXhzg==
X-Gm-Gg: ASbGnctK/u2M2KPAfz1bhDtZF5g6Tql8hCe42q8g191FiYD2L2g0omItrxdlMRma86I
	Mv8iDcM/BU0Nr40iXa8942e4Pi8HekdoIF2mn3S+ifd+d7ov7fV+f6nHmPO1794PxEQdAOz9xBi
	KbfNuO26SHCmqLeuii8AoXIQ9WJtTvOJJ38aAxUCzAU0QHxKN1SF+hsBGyxa0SkzfEBcycgt+eo
	LVqjFuUQiQw4znMYSYrDySGqWk3uf1RLB4WdL0fm6a47vHcBPzR/ARXIgSrAOuTJvW6fXOwAJ5G
	30zBzqITV5oYumIb8d+1zguzabwlH7jKeCi7/C2Imykndu1Kg/UI0JSVDvhTjA3j8N4v+u/iaYR
	Bcl69Rmq6KAO70eFLYzvbhzd5My5Y4ZmktbJdNO2dh+GQrczRknAyHxVnNVEpr0uHPPsn+rwbQ2
	CieQ9lHtswOGN3ynh/GlUyDj4IfcZhWDTgrg==
X-Google-Smtp-Source: AGHT+IFrUAy1dTu8AXYQ2RBDZSVyUzpsZn57Xa4JSwl8g4NSzAmJTT2cXzulNbiafLbu0VoK0yMk4w==
X-Received: by 2002:a17:903:234a:b0:297:dad8:f25b with SMTP id d9443c01a7336-2986a5fd92fmr172085835ad.0.1763425658825;
        Mon, 17 Nov 2025 16:27:38 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm153866565ad.36.2025.11.17.16.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 16:27:38 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 5/6] multipath-tools: upgrade 0.11.1 -> 0.11.3
Date: Tue, 18 Nov 2025 13:27:22 +1300
Message-ID: <20251118002723.829508-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118002723.829508-1-ankur.tyagi85@gmail.com>
References: <20251118002723.829508-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 00:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121791

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped 0001-libmpathutils-uxsock.c-Include-string.h-for-memcpy.patch and
0013-libdmmp-Makefile-Fix-KBUILD_BUILD_TIMESTAMP-usage.patch which are now
merged in the upstream.

Refreshed other patches for the new version.

Release Note:
https://github.com/opensvc/multipath-tools/blob/0.11.3/NEWS.md

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-RH-fixup-udev-rules-for-redhat.patch |  7 ++---
 ...uxsock.c-Include-string.h-for-memcpy.patch | 28 ------------------
 ...property-blacklist-exception-builtin.patch |  5 +---
 ...RH-don-t-start-without-a-config-file.patch |  6 ++--
 .../0004-RH-use-rpm-optflags-if-present.patch | 11 +++----
 .../files/0005-RH-add-mpathconf.patch         |  2 +-
 ...om-kernel-cmdline-mpath.wwids-with-A.patch |  5 +---
 ...-on-invalid-regex-instead-of-failing.patch |  5 +---
 ...-default-find_mutipaths-value-to-off.patch |  5 +---
 ...modify-create-config.mk-for-cross-co.patch |  7 ++---
 .../files/0010-Always-use-devmapper.patch     |  7 ++---
 ...fix-bug-of-do_compile-and-do_install.patch |  5 +---
 ...add-explicit-dependency-on-libraries.patch |  5 +---
 ...Add-target-docs-man-dmmp_strerror.3.patch} |  4 +--
 ...ile-Fix-KBUILD_BUILD_TIMESTAMP-usage.patch | 29 -------------------
 ...ls_0.11.1.bb => multipath-tools_0.11.3.bb} |  6 ++--
 16 files changed, 24 insertions(+), 113 deletions(-)
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-libmpathutils-uxsock.c-Include-string.h-for-memcpy.patch
 rename meta-oe/recipes-support/multipath-tools/files/{0014-libdmmp-Makefile-Add-target-docs-man-dmmp_strerror.3.patch => 0013-libdmmp-Makefile-Add-target-docs-man-dmmp_strerror.3.patch} (95%)
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0013-libdmmp-Makefile-Fix-KBUILD_BUILD_TIMESTAMP-usage.patch
 rename meta-oe/recipes-support/multipath-tools/{multipath-tools_0.11.1.bb => multipath-tools_0.11.3.bb} (94%)

diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-RH-fixup-udev-rules-for-redhat.patch b/meta-oe/recipes-support/multipath-tools/files/0001-RH-fixup-udev-rules-for-redhat.patch
index 909fd77ba2..e7a36af622 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0001-RH-fixup-udev-rules-for-redhat.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-RH-fixup-udev-rules-for-redhat.patch
@@ -1,4 +1,4 @@
-From 68160e86472b197107c60bf6e5a3d126040e85b6 Mon Sep 17 00:00:00 2001
+From 9fb89db1bb09efc5b31a140c26d540072083c5e5 Mon Sep 17 00:00:00 2001
 From: Benjamin Marzinski <bmarzins@redhat.com>
 Date: Thu, 13 Apr 2017 07:22:23 -0500
 Subject: [PATCH] RH: fixup udev rules for redhat
@@ -28,7 +28,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.inc b/Makefile.inc
-index 729618bd..69521882 100644
+index 65f6efc8..596e68c0 100644
 --- a/Makefile.inc
 +++ b/Makefile.inc
 @@ -62,7 +62,7 @@ tmpfilesdir	:= $(systemd_prefix)lib/tmpfiles.d
@@ -74,6 +74,3 @@ index 67fb5e62..2ea9e528 100644
  	$(Q)$(RM) $(DESTDIR)$(mandir)/man8/$(EXEC).8
  	$(Q)$(RM) $(DESTDIR)$(mandir)/man5/$(EXEC).conf.5
  	$(Q)$(RM) $(DESTDIR)$(tmpfilesdir)/multipath.conf
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-libmpathutils-uxsock.c-Include-string.h-for-memcpy.patch b/meta-oe/recipes-support/multipath-tools/files/0001-libmpathutils-uxsock.c-Include-string.h-for-memcpy.patch
deleted file mode 100644
index 128a0c4d8d..0000000000
--- a/meta-oe/recipes-support/multipath-tools/files/0001-libmpathutils-uxsock.c-Include-string.h-for-memcpy.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 1d444772db14f4acb8d47b874462b0cc171ab672 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 17 Feb 2025 12:01:59 -0800
-Subject: [PATCH] libmpathutils/uxsock.c: Include string.h for memcpy
-
-Fixes
-uxsock.c:72:2: error: call to undeclared library function 'memcpy' with type 'void *(void *, const void *, unsigned long)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-
-Upstream-Status: Submitted [https://lore.kernel.org/dm-devel/20250217200503.4166910-1-raj.khem@gmail.com/T/#u]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Benjamin Marzinski <bmarzins@redhat.com>
-Cc: Martin Wilck <mwilck@suse.com>
----
- libmpathutil/uxsock.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libmpathutil/uxsock.c b/libmpathutil/uxsock.c
-index 2135476d..a474874e 100644
---- a/libmpathutil/uxsock.c
-+++ b/libmpathutil/uxsock.c
-@@ -8,6 +8,7 @@
- #include <stdlib.h>
- #include <unistd.h>
- #include <stdarg.h>
-+#include <string.h>
- #include <fcntl.h>
- #include <sys/ioctl.h>
- #include <sys/types.h>
diff --git a/meta-oe/recipes-support/multipath-tools/files/0002-RH-Remove-the-property-blacklist-exception-builtin.patch b/meta-oe/recipes-support/multipath-tools/files/0002-RH-Remove-the-property-blacklist-exception-builtin.patch
index a578280491..3ed340c2cf 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0002-RH-Remove-the-property-blacklist-exception-builtin.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0002-RH-Remove-the-property-blacklist-exception-builtin.patch
@@ -1,4 +1,4 @@
-From e3449e163d7fe9bf1e188f0e28962f0659e9652d Mon Sep 17 00:00:00 2001
+From 14716a10c22206722ee48b44b88f0eec5203f228 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Fri, 1 Mar 2024 10:34:06 +0800
 Subject: [PATCH] RH: Remove the property blacklist exception builtin
@@ -58,6 +58,3 @@ index 17e1b54a..2cfb18b8 100644
  }
  
  static void free_ble(struct blentry *ble)
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0003-RH-don-t-start-without-a-config-file.patch b/meta-oe/recipes-support/multipath-tools/files/0003-RH-don-t-start-without-a-config-file.patch
index 649f1fa778..6ff738cdec 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0003-RH-don-t-start-without-a-config-file.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0003-RH-don-t-start-without-a-config-file.patch
@@ -1,4 +1,4 @@
-From 2fe1037b8198bd00961d8df48e684296758127d1 Mon Sep 17 00:00:00 2001
+From 2cb4657779cbb6ba2309f158366df4cb32f32785 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Fri, 23 Nov 2018 17:25:15 +0800
 Subject: [PATCH] RH: don't start without a config file
@@ -101,11 +101,11 @@ index 7bc8806e..315884eb 100644
  .
  .\" ----------------------------------------------------------------------------
 diff --git a/multipathd/multipathd.service.in b/multipathd/multipathd.service.in
-index b6a25b31..f78bb91b 100644
+index eb58943c..553e27f9 100644
 --- a/multipathd/multipathd.service.in
 +++ b/multipathd/multipathd.service.in
 @@ -5,6 +5,7 @@ Before=local-fs-pre.target blk-availability.service shutdown.target
- Wants=systemd-udevd-kernel.socket @MODPROBE_UNIT@
+ Wants=systemd-udevd-kernel.socket multipathd-queueing.service @MODPROBE_UNIT@
  After=systemd-udevd-kernel.socket @MODPROBE_UNIT@
  After=multipathd.socket systemd-remount-fs.service
 +ConditionPathExists=/etc/multipath.conf
diff --git a/meta-oe/recipes-support/multipath-tools/files/0004-RH-use-rpm-optflags-if-present.patch b/meta-oe/recipes-support/multipath-tools/files/0004-RH-use-rpm-optflags-if-present.patch
index 6556d4af85..5f65ceaa29 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0004-RH-use-rpm-optflags-if-present.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0004-RH-use-rpm-optflags-if-present.patch
@@ -1,4 +1,4 @@
-From dd4f005ab3b38cee2776dcb0a0661c5a01befd00 Mon Sep 17 00:00:00 2001
+From c34eca043178e60ff04dc88953a71b36ce9dc1b0 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 26 Nov 2018 09:19:17 +0800
 Subject: [PATCH] RH: use rpm optflags if present
@@ -24,7 +24,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.inc b/Makefile.inc
-index 69521882..2127f208 100644
+index 596e68c0..42766867 100644
 --- a/Makefile.inc
 +++ b/Makefile.inc
 @@ -99,7 +99,15 @@ SYSTEMD_LIBDEPS := $(if $(SYSTEMD),$(if $(shell test $(SYSTEMD) -gt 209 && echo
@@ -48,11 +48,8 @@ index 69521882..2127f208 100644
  		   -DRUNTIME_DIR=\"$(runtimedir)\" -DCONFIG_DIR=\"$(TGTDIR)$(configdir)\" \
  		   -DDEFAULT_CONFIGFILE=\"$(TGTDIR)$(configfile)\" -DSTATE_DIR=\"$(TGTDIR)$(statedir)\" \
  		   -DEXTRAVERSION=\"$(EXTRAVERSION)\" -MMD -MP
--CFLAGS		:= -std=gnu99 $(CFLAGS) $(OPTFLAGS) $(WARNFLAGS) -pipe \
-+CFLAGS		:= -std=gnu99 $(CFLAGS) $(OPTFLAGS) -pipe \
+-CFLAGS		:= -std=$(C_STD) $(CFLAGS) $(OPTFLAGS) $(WARNFLAGS) -pipe \
++CFLAGS		:= -std=$(C_STD) $(CFLAGS) $(OPTFLAGS) -pipe \
  		   -fexceptions
  BIN_CFLAGS	:= -fPIE -DPIE
  LIB_CFLAGS	:= -fPIC
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0005-RH-add-mpathconf.patch b/meta-oe/recipes-support/multipath-tools/files/0005-RH-add-mpathconf.patch
index e7ea374cd1..26fcbd918d 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0005-RH-add-mpathconf.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0005-RH-add-mpathconf.patch
@@ -1,4 +1,4 @@
-From 4035b48b512b5010b1c33aeba8c58cf2705bca83 Mon Sep 17 00:00:00 2001
+From 4ce6abf6f30fc6cadc9c9fc50b66363078a0162e Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 26 Nov 2018 09:55:12 +0800
 Subject: [PATCH] RH: add mpathconf
diff --git a/meta-oe/recipes-support/multipath-tools/files/0006-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch b/meta-oe/recipes-support/multipath-tools/files/0006-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
index 04160eaac5..7ce5f8b08d 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0006-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0006-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
@@ -1,4 +1,4 @@
-From bd65cdc704666dd4153779c74cdbb2cac6efea71 Mon Sep 17 00:00:00 2001
+From 95f4611621ed7cc5144c68c51adc58409210ad1d Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 26 Sep 2019 16:29:48 +0800
 Subject: [PATCH] RH: add wwids from kernel cmdline mpath.wwids with -A
@@ -90,6 +90,3 @@ index ee47ad9f..1ed0d85e 100644
  
  enum {
  	WWID_IS_NOT_FAILED = 0,
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0007-RH-warn-on-invalid-regex-instead-of-failing.patch b/meta-oe/recipes-support/multipath-tools/files/0007-RH-warn-on-invalid-regex-instead-of-failing.patch
index b435e6d677..a174aa44c6 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0007-RH-warn-on-invalid-regex-instead-of-failing.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0007-RH-warn-on-invalid-regex-instead-of-failing.patch
@@ -1,4 +1,4 @@
-From 9f1075f82ecd39a9960f868eef890baf2ba36d4e Mon Sep 17 00:00:00 2001
+From 74051f361ce0b9b4405afc789c62a277aa37cc05 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Fri, 1 Mar 2024 11:45:10 +0800
 Subject: [PATCH] RH: warn on invalid regex instead of failing
@@ -100,6 +100,3 @@ index a06a6138..a734ba9b 100644
  declare_hw_snprint(bl_product, print_str)
  
  declare_hw_arg_str_handler(hwhandler, 0)
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0008-RH-reset-default-find_mutipaths-value-to-off.patch b/meta-oe/recipes-support/multipath-tools/files/0008-RH-reset-default-find_mutipaths-value-to-off.patch
index 9ea255cbcb..cf528447ac 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0008-RH-reset-default-find_mutipaths-value-to-off.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0008-RH-reset-default-find_mutipaths-value-to-off.patch
@@ -1,4 +1,4 @@
-From 87e19d273c46fe78933627fc4e8046e3a76da47a Mon Sep 17 00:00:00 2001
+From 261ef06a4fb24f533c240a0a747a165eec0ee0dd Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 26 Nov 2018 11:12:01 +0800
 Subject: [PATCH] RH: reset default find_mutipaths value to off
@@ -29,6 +29,3 @@ index 02f7e57c..98dd66f7 100644
  #define DEFAULT_FAST_IO_FAIL	5
  #define DEFAULT_DEV_LOSS_TMO	600
  #define DEFAULT_RETAIN_HWHANDLER RETAIN_HWHANDLER_ON
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0009-multipath-tools-modify-create-config.mk-for-cross-co.patch b/meta-oe/recipes-support/multipath-tools/files/0009-multipath-tools-modify-create-config.mk-for-cross-co.patch
index 661e38f684..c85d1411a9 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0009-multipath-tools-modify-create-config.mk-for-cross-co.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0009-multipath-tools-modify-create-config.mk-for-cross-co.patch
@@ -1,4 +1,4 @@
-From c22c897e7c55fc0b8c5bdd113a0357654ee895ae Mon Sep 17 00:00:00 2001
+From 3491d5ed1633a42d1f46d50ebce324d28e02ed32 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 4 Jun 2019 11:39:39 +0800
 Subject: [PATCH] multipath-tools: modify create-config.mk for
@@ -21,7 +21,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/create-config.mk b/create-config.mk
-index 8bd2c20c..40d2446a 100644
+index e8fa391c..f620da5a 100644
 --- a/create-config.mk
 +++ b/create-config.mk
 @@ -127,10 +127,6 @@ ifeq ($(ENABLE_DMEVENTS_POLL),0)
@@ -35,6 +35,3 @@ index 8bd2c20c..40d2446a 100644
  # $(call TEST_CC_OPTION,option,fallback)
  # Test if the C compiler supports the option.
  # Evaluates to "option" if yes, and "fallback" otherwise.
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0010-Always-use-devmapper.patch b/meta-oe/recipes-support/multipath-tools/files/0010-Always-use-devmapper.patch
index cf053680f6..61f06e633e 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0010-Always-use-devmapper.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0010-Always-use-devmapper.patch
@@ -1,4 +1,4 @@
-From c34c65a3f5ddec22cb417872f90c2c9540a1847b Mon Sep 17 00:00:00 2001
+From 4d68ea4a75c63cf92469be95579542c434561871 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 26 Nov 2018 11:17:41 +0800
 Subject: [PATCH] Always use devmapper
@@ -21,7 +21,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 8 insertions(+), 28 deletions(-)
 
 diff --git a/create-config.mk b/create-config.mk
-index 40d2446a..f5eb2803 100644
+index f620da5a..8ffcde02 100644
 --- a/create-config.mk
 +++ b/create-config.mk
 @@ -79,34 +79,14 @@ URCU_VERSION = $(shell \
@@ -67,6 +67,3 @@ index 40d2446a..f5eb2803 100644
  
  libmount_h := $(shell $(PKG_CONFIG) --variable=includedir mount)/libmount/libmount.h
  ifneq ($(call check_func,mnt_unref_cache,$(libmount_h)),0)
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0011-fix-bug-of-do_compile-and-do_install.patch b/meta-oe/recipes-support/multipath-tools/files/0011-fix-bug-of-do_compile-and-do_install.patch
index 0c5015142c..6910146c70 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0011-fix-bug-of-do_compile-and-do_install.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0011-fix-bug-of-do_compile-and-do_install.patch
@@ -1,4 +1,4 @@
-From 698361847e6fae321bc277a5fc518b2bd55751b8 Mon Sep 17 00:00:00 2001
+From 85c4bdd939b7f77a773d24fcc5330fc35542d7d3 Mon Sep 17 00:00:00 2001
 From: Wang Mingyu <wangmy@cn.fujitsu.com>
 Date: Sun, 10 May 2020 21:22:53 +0800
 Subject: [PATCH] fix bug of do_compile and do_install
@@ -38,6 +38,3 @@ index f06f7faa..690dc050 100644
  libmultipath/checkers.install \
  	libmultipath/prioritizers.install \
  	libmultipath/foreign.install: libmultipath.install
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0012-add-explicit-dependency-on-libraries.patch b/meta-oe/recipes-support/multipath-tools/files/0012-add-explicit-dependency-on-libraries.patch
index f47d8afe4b..bb411e3499 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0012-add-explicit-dependency-on-libraries.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0012-add-explicit-dependency-on-libraries.patch
@@ -1,4 +1,4 @@
-From 69ee17207574ca032c3cb46a3db99736de3eedf8 Mon Sep 17 00:00:00 2001
+From edb01d9a3c29d31493a0435ab35e9d438f391267 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 25 May 2020 23:22:55 -0700
 Subject: [PATCH] add explicit dependency on libraries
@@ -35,6 +35,3 @@ index 690dc050..b775f949 100644
  
  DEPS_ON_MULTIPATH := \
  	multipath \
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0014-libdmmp-Makefile-Add-target-docs-man-dmmp_strerror.3.patch b/meta-oe/recipes-support/multipath-tools/files/0013-libdmmp-Makefile-Add-target-docs-man-dmmp_strerror.3.patch
similarity index 95%
rename from meta-oe/recipes-support/multipath-tools/files/0014-libdmmp-Makefile-Add-target-docs-man-dmmp_strerror.3.patch
rename to meta-oe/recipes-support/multipath-tools/files/0013-libdmmp-Makefile-Add-target-docs-man-dmmp_strerror.3.patch
index aad46c229b..ca71a68ac4 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0014-libdmmp-Makefile-Add-target-docs-man-dmmp_strerror.3.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0013-libdmmp-Makefile-Add-target-docs-man-dmmp_strerror.3.patch
@@ -1,4 +1,4 @@
-From 6e231d887c20b2139db75e6dc6c20107273aaacd Mon Sep 17 00:00:00 2001
+From 83734bbf19bb9e256da6f92a3bda26aa0f63245d Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?K=C3=A9l=C3=A9fa=20San=C3=A9?= <kelefa.sane@smile.fr>
 Date: Thu, 3 Apr 2025 10:25:30 +0200
 Subject: [PATCH] libdmmp/Makefile: Add target docs/man/dmmp_strerror.3 to
@@ -12,7 +12,7 @@ Sometimes, the timestamps are updated in the man pages, sometimes not.
 Upstream-Status: Denied
 
 https://lore.kernel.org/dm-devel/72355f1d0984647e91f8c50f1c2295071af49e33.camel@suse.com/
-The patch has been rejected by upstream, who will update the timestamps of the 
+The patch has been rejected by upstream, who will update the timestamps of the
 manpages with a new commit.
 In order to be reproducible without having a random result, forcing the target
 rebuild by adding it to .PHONY is the more acceptable solution, the alternative
diff --git a/meta-oe/recipes-support/multipath-tools/files/0013-libdmmp-Makefile-Fix-KBUILD_BUILD_TIMESTAMP-usage.patch b/meta-oe/recipes-support/multipath-tools/files/0013-libdmmp-Makefile-Fix-KBUILD_BUILD_TIMESTAMP-usage.patch
deleted file mode 100644
index 4cca7decb8..0000000000
--- a/meta-oe/recipes-support/multipath-tools/files/0013-libdmmp-Makefile-Fix-KBUILD_BUILD_TIMESTAMP-usage.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From bcb052a8dadbd0a837986b1e15924b469fc59edc Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?K=C3=A9l=C3=A9fa=20San=C3=A9?= <kelefa.sane@smile.fr>
-Date: Thu, 3 Apr 2025 10:08:49 +0200
-Subject: [PATCH] libdmmp/Makefile: Fix KBUILD_BUILD_TIMESTAMP usage
-
-Add missing $ (Makefile need to escape '$' as '$$')
-
-Upstream-Status: Submitted [https://lore.kernel.org/dm-devel/20250404122902.2750036-1-sofiane.hamam@smile.fr/]
-
-Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
-Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
-Signed-off-by: Kelefa Sane <kelefa.sane@smile.fr>
----
- libdmmp/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libdmmp/Makefile b/libdmmp/Makefile
-index 172ba045..7e0e2509 100644
---- a/libdmmp/Makefile
-+++ b/libdmmp/Makefile
-@@ -74,7 +74,7 @@ doc: docs/man/dmmp_strerror.3
- docs/man/dmmp_strerror.3:	$(HEADERS)
- 	$(Q)TEMPFILE=$(shell mktemp); \
- 	cat $^ | perl docs/doc-preclean.pl >$$TEMPFILE; \
--	[ "$KBUILD_BUILD_TIMESTAMP" ] || \
-+	[ "$$KBUILD_BUILD_TIMESTAMP" ] || \
- 	    KBUILD_BUILD_TIMESTAMP=`git log -n1 --pretty=%cd --date=iso -- $^`; \
- 	export KBUILD_BUILD_TIMESTAMP; \
- 	LC_ALL=C \
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.3.bb
similarity index 94%
rename from meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb
rename to meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.3.bb
index 07bc84ce8b..8e26d4c2a8 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.3.bb
@@ -44,14 +44,12 @@ SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=https;branch=st
            file://0010-Always-use-devmapper.patch \
            file://0011-fix-bug-of-do_compile-and-do_install.patch \
            file://0012-add-explicit-dependency-on-libraries.patch \
-           file://0001-libmpathutils-uxsock.c-Include-string.h-for-memcpy.patch \
-           file://0013-libdmmp-Makefile-Fix-KBUILD_BUILD_TIMESTAMP-usage.patch \
-           file://0014-libdmmp-Makefile-Add-target-docs-man-dmmp_strerror.3.patch \
+           file://0013-libdmmp-Makefile-Add-target-docs-man-dmmp_strerror.3.patch \
            "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ec28527f3d544b51ceb0e1907d0bf3f"
 
-SRCREV = "cb8de98b2cc3b62fd1a578ba479c0820778e9c02"
+SRCREV = "7a84cc602ea0884ae0c767e6c89592059012db04"
 
 
 inherit systemd pkgconfig

