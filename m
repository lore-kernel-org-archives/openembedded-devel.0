Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8AFE71D3E
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 14:02:29 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.18150.1695996142537424484
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 07:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K3AYJpC8;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9936b3d0286so1907500866b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 07:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695996141; x=1696600941; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sFLdByRpRUDlsSV1H8X7iWo45jtnfWkjiMJiaftRBGI=;
        b=K3AYJpC82KBhEQNSi8IUwTDQSrCnQawyKvvx6APNSIMS0ZF/N2vgIFK19c3yoPT5+a
         lnUdQMrR8faif52jFHabNPNox3L2/+XczDBOz7WaW5L5ddmNaKWF6VvLnoclZrMhA8Tk
         WssNhJdLl90hbaLH88XCkj492xsUAxqu7TZ3vmWStO7arWza7oGhdcTrtg25jGnXilGr
         hfPIc8Wk+JoeAPnIcnhdaDe/N0rkeSVOt7KLmJx+uVb+gUURLgODh23nZZJiK4rKYery
         97lD8jNWCNB5CxIZrhEhAAk/SpayJq2507rxZ7c4koMbvnxtNzLAd+pNQwP01N0samg9
         q2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695996141; x=1696600941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFLdByRpRUDlsSV1H8X7iWo45jtnfWkjiMJiaftRBGI=;
        b=l9uFKdg9E9VnR6nuQguI+K8uqr3pUWSnmlsa9czCYw0XumhOo57F9wHrMMsfSbYXOC
         I7VyeaWB8N0zyRgoSs2WC9YO3X2X/DOTSxWlI8QZXagHGjMgcx6HwcciNhE4WDMny2TO
         s67AZo/DtmyK5Fwo8kK6hUsteCvUQywp6DU43F8r8o3IynKGUI7N68DtxC+JGv/O8/8N
         VRVQTbupEeHdanrKkbrkOniq9YuKcgIPU+dFr+eUDJvtnezSGBLilZEyj/BdOvJJBy0I
         G2uffP9enMsqdeofQL0TTVSXx2dA8DLQ9ka60clq4ZOlBdLfQ7pbj2t+Tb2ONtWn+j9X
         pNOQ==
X-Gm-Message-State: AOJu0Yw72xVkmu70oKC/6DegjiuVwtpg3W247e7Ez1LPkViXnZl2Mzqp
	zs7pROseUgvQ6SnWYjYs8F1BnZcMrx4=
X-Google-Smtp-Source: AGHT+IFeJftw4nqAihX9Wtf8hezEdiJfXPecT8QgTiMr4qxiLBdr/bSQoH0vAhacXxPvodLPMGKorg==
X-Received: by 2002:a17:907:774d:b0:9ae:2f33:4ad0 with SMTP id kx13-20020a170907774d00b009ae2f334ad0mr3729295ejc.71.1695996140331;
        Fri, 29 Sep 2023 07:02:20 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j26-20020a170906831a00b00997d7aa59fasm12781735ejx.14.2023.09.29.07.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 07:02:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] meta-oe/dynamic-layers: add Upstream-Status where missing
Date: Fri, 29 Sep 2023 16:02:14 +0200
Message-ID: <20230929140215.522222-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 14:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105247

* I was using openembedded-core/scripts/contrib/patchreview.py to find
  missing Upstream-Status, but that doesn't find .patch files in dynamic-layers

* now with openembedded-core/scripts/yocto-check-layer it reported couple more missing:

INFO: test_patches_upstream_status (common.CommonCheckLayer.test_patches_upstream_status)
INFO:  ... expected failure
INFO: Traceback (most recent call last):
  File "/OE/build/oe-core/openembedded-core/scripts/lib/checklayer/cases/common.py", line 87, in test_patches_upstream_status
    self.assertEqual(len(patches), 0 , \
AssertionError: 47 != 0 : Found following patches with malformed or missing upstream status:
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu/fix-menu-generation.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu/port-gnome-menus3.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/fix_build_errors.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Unbolt-ubuntu-hack.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0003-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0005-adb-Allow-adbd-to-be-run-as-root.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0001-Fixes-for-yocto-build.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0004-adb-Fix-build-on-big-endian-systems.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Added-missing-headers.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/libusb-header-path.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/stub-out-fastdeploy.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Vector-cast.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/throw-exception-on-unknown-os.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/hard-code-build-number.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/move-log-file-to-proper-dir.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Add-riscv64-support.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/simg_dump-python3.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/add-missing-headers.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-build-on-non-x86.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/stdatomic.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-attribute-issue-with-gcc.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-standard-namespace-errors.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Nonnull.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-gettid-exception-declaration.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/user_pt_regs.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/legacy_built-in_sync_functions.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Added-missing-headers.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/libusb-header-path.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/stub-out-fastdeploy.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Vector-cast.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/throw-exception-on-unknown-os.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/hard-code-build-number.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/move-log-file-to-proper-dir.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Add-riscv64-support.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/simg_dump-python3.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/add-missing-headers.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-build-on-non-x86.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/stdatomic.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-attribute-issue-with-gcc.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-standard-namespace-errors.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Nonnull.patch
/OE/build/oe-core/meta-openembedded/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-gettid-exception-declaration.patch

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../openbox/openbox-xdgmenu/fix-menu-generation.patch           | 2 ++
 .../openbox/openbox-xdgmenu/port-gnome-menus3.patch             | 2 ++
 .../lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch | 2 ++
 ...1-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch | 2 ++
 .../recipes-connectivity/lirc/lirc/fix_build_errors.patch       | 2 ++
 .../netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch  | 2 ++
 .../android-tools/0001-Fixes-for-yocto-build.patch              | 2 ++
 ...2-android-tools-modifications-to-make-it-build-in-yoct.patch | 2 ++
 ...3-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch | 2 ++
 .../0004-adb-Fix-build-on-big-endian-systems.patch              | 2 ++
 .../android-tools/0005-adb-Allow-adbd-to-be-run-as-root.patch   | 2 ++
 .../android-tools/debian/Add-riscv64-support.patch              | 2 ++
 .../android-tools/debian/Added-missing-headers.patch            | 2 ++
 .../android-tools/android-tools/debian/Nonnull.patch            | 2 ++
 .../android-tools/android-tools/debian/Vector-cast.patch        | 2 ++
 .../android-tools/debian/add-missing-headers.patch              | 2 ++
 .../external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch   | 2 ++
 .../external/libunwind/legacy_built-in_sync_functions.patch     | 2 ++
 .../android-tools/debian/external/libunwind/user_pt_regs.patch  | 2 ++
 .../android-tools/debian/fix-attribute-issue-with-gcc.patch     | 2 ++
 .../android-tools/debian/fix-build-on-non-x86.patch             | 2 ++
 .../android-tools/debian/fix-gettid-exception-declaration.patch | 2 ++
 .../android-tools/debian/fix-standard-namespace-errors.patch    | 2 ++
 .../android-tools/debian/hard-code-build-number.patch           | 2 ++
 .../android-tools/android-tools/debian/libusb-header-path.patch | 2 ++
 .../android-tools/debian/move-log-file-to-proper-dir.patch      | 2 ++
 .../android-tools/android-tools/debian/simg_dump-python3.patch  | 2 ++
 .../android-tools/android-tools/debian/stdatomic.patch          | 2 ++
 .../android-tools/debian/stub-out-fastdeploy.patch              | 2 ++
 .../android-tools/debian/system/core/Add-riscv64-support.patch  | 2 ++
 .../debian/system/core/Added-missing-headers.patch              | 2 ++
 .../android-tools/debian/system/core/Nonnull.patch              | 2 ++
 .../android-tools/debian/system/core/Vector-cast.patch          | 2 ++
 .../android-tools/debian/system/core/add-missing-headers.patch  | 2 ++
 .../debian/system/core/fix-attribute-issue-with-gcc.patch       | 2 ++
 .../android-tools/debian/system/core/fix-build-on-non-x86.patch | 2 ++
 .../debian/system/core/fix-gettid-exception-declaration.patch   | 2 ++
 .../debian/system/core/fix-standard-namespace-errors.patch      | 2 ++
 .../debian/system/core/hard-code-build-number.patch             | 2 ++
 .../android-tools/debian/system/core/libusb-header-path.patch   | 2 ++
 .../debian/system/core/move-log-file-to-proper-dir.patch        | 2 ++
 .../android-tools/debian/system/core/simg_dump-python3.patch    | 2 ++
 .../android-tools/debian/system/core/stdatomic.patch            | 2 ++
 .../android-tools/debian/system/core/stub-out-fastdeploy.patch  | 2 ++
 .../debian/system/core/throw-exception-on-unknown-os.patch      | 2 ++
 .../android-tools/debian/throw-exception-on-unknown-os.patch    | 2 ++
 46 files changed, 92 insertions(+)

diff --git a/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu/fix-menu-generation.patch b/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu/fix-menu-generation.patch
index 03b357263f..3def090eb1 100644
--- a/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu/fix-menu-generation.patch
+++ b/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu/fix-menu-generation.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: openbox-xdgmenu-0.3/openbox-xdgmenu.c
 ===================================================================
 --- openbox-xdgmenu-0.3.orig/openbox-xdgmenu.c
diff --git a/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu/port-gnome-menus3.patch b/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu/port-gnome-menus3.patch
index 3fcc319164..6d123482e8 100644
--- a/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu/port-gnome-menus3.patch
+++ b/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu/port-gnome-menus3.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: openbox-xdgmenu-0.3/openbox-xdgmenu.c
 ===================================================================
 --- openbox-xdgmenu-0.3.orig/openbox-xdgmenu.c
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
index 0e38f7d8ec..d4c8a3d7fc 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
@@ -10,6 +10,8 @@ input.h [1]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  plugins/devinput.c | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
index 089ed23c73..11f6485b27 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
@@ -8,6 +8,8 @@ and so lirc's variable has to be named something else.
 
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
+Upstream-Status: Pending
+
  Makefile.am       | 2 +-
  pylint.mak        | 2 +-
  tools/Makefile.am | 2 +-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/fix_build_errors.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/fix_build_errors.patch
index 41353dbbdc..ed840cd098 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/fix_build_errors.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/fix_build_errors.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff --git a/configure.ac b/configure.ac
 index 58347d8..8c7fca2 100644
 --- a/configure.ac
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
index 8779c251a5..0bd7f80c26 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] don't fail if GLOB_BRACE is not defined
 
 Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  src/util.c | 6 ++++++
  1 file changed, 6 insertions(+)
 
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0001-Fixes-for-yocto-build.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0001-Fixes-for-yocto-build.patch
index dcf27d805e..1d18d47ec3 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0001-Fixes-for-yocto-build.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0001-Fixes-for-yocto-build.patch
@@ -8,6 +8,8 @@ Signed-off-by: JJ Robertson <jrobertson@snapchat.com>
 Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
 
 ---
+Upstream-Status: Pending
+
  system/core/adb/daemon/file_sync_service.cpp | 4 ++--
  system/core/adb/daemon/framebuffer_service.h | 2 --
  system/core/adb/daemon/main.cpp              | 5 +++--
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch
index 2b95ad2b0a..e749366bb6 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch
@@ -13,6 +13,8 @@ Subject: [PATCH] android-tools: modifications to make it build in yocto
 Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
 
 ---
+Upstream-Status: Pending
+
  debian/external/boringssl/libcrypto.mk         |  1 +
  debian/system/core/append2simg.mk              |  2 +-
  debian/system/core/fastboot.mk                 |  2 +-
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0003-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0003-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch
index 7ea040c68a..ea934f44d8 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0003-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0003-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch
@@ -37,6 +37,8 @@ Signed-off-by: Anatol Pomozov <anatol.pomozov@gmail.com>
 Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
 
 ---
+Upstream-Status: Pending
+
  system/core/adb/client/usb_linux.cpp | 24 ++++++++++++++----------
  1 file changed, 14 insertions(+), 10 deletions(-)
 
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0004-adb-Fix-build-on-big-endian-systems.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0004-adb-Fix-build-on-big-endian-systems.patch
index 83fe4475c3..c82423908f 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0004-adb-Fix-build-on-big-endian-systems.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0004-adb-Fix-build-on-big-endian-systems.patch
@@ -21,6 +21,8 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
 
 ---
+Upstream-Status: Pending
+
  system/core/adb/daemon/usb_ffs.cpp | 11 +++++++++--
  1 file changed, 9 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0005-adb-Allow-adbd-to-be-run-as-root.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0005-adb-Allow-adbd-to-be-run-as-root.patch
index 3fbdcd4bac..dfbdc2af66 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0005-adb-Allow-adbd-to-be-run-as-root.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0005-adb-Allow-adbd-to-be-run-as-root.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] adb: Allow adbd to be run as root
 Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
 
 ---
+Upstream-Status: Pending
+
  system/core/adb/daemon/main.cpp | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Add-riscv64-support.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Add-riscv64-support.patch
index 4669f89d07..9fd0fa792c 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Add-riscv64-support.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Add-riscv64-support.patch
@@ -24,6 +24,8 @@ Signed-off-by: Lifang Xia <lifang_xia@linux.alibaba.com>
 Signed-off-by: Mao Han <han_mao@linux.alibaba.com>
 Change-Id: Ib21ddf23cc83f332af202df7bffcaceec16063e0
 ---
+Upstream-Status: Pending
+
  system/core/libunwindstack/Android.bp              |   1 +
  system/core/libunwindstack/Elf.cpp                 |   2 +
  system/core/libunwindstack/Regs.cpp                |  10 ++
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Added-missing-headers.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Added-missing-headers.patch
index c07e93660f..d827d7d3c2 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Added-missing-headers.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Added-missing-headers.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Added missing headers causing compile errors
 Author: Umang Parmar <umangjparmar@gmail.com>
 Forwarded: not-needed
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Nonnull.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Nonnull.patch
index 8d1408a48e..54bd52c61a 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Nonnull.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Nonnull.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Bring Clang's _Nonnull keyword to GCC
 Author: Kai-Chung Yan
 Forwarded: not-needed
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Vector-cast.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Vector-cast.patch
index b32d5f6f54..b2881e0213 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Vector-cast.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Vector-cast.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Fix the weird error by GCC7 that fails to match the correct parent method.
 Author: Kai-Chung Yan
 Forwarded: not-needed
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/add-missing-headers.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/add-missing-headers.patch
index 49d3ecefbb..681d2c6553 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/add-missing-headers.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/add-missing-headers.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Forwarded: not-needed
 --- a/system/core/fs_mgr/liblp/reader.cpp
 +++ b/system/core/fs_mgr/liblp/reader.cpp
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch
index b926eddcdf..e8e216161e 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Off-by-one error in the dwarf_to_unw_regnum function in include/dwarf_i.h in
 libunwind 1.1 allows local users to have unspecified impact via invalid dwarf opcodes.
 --- a/external/libunwind/include/dwarf_i.h
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/legacy_built-in_sync_functions.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/legacy_built-in_sync_functions.patch
index ce1d4e52eb..a04a887c68 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/legacy_built-in_sync_functions.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/legacy_built-in_sync_functions.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Replace the legacy __sync built-in functions with __atomic ones
  libunwind uses the built-in __sync_* functions which are deprecated by GCC and
  should be replaced by __atomic_* ones. See the official manuals [1].
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/user_pt_regs.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/user_pt_regs.patch
index 600471f126..35df944d1c 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/user_pt_regs.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/user_pt_regs.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Author: Kai-Chung Yan <seamlikok@gmail.com>
 Last-Update: 2016-08-24
 Description: Manual definition of struct user_pt_regs
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-attribute-issue-with-gcc.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-attribute-issue-with-gcc.patch
index e0b4275579..441031f536 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-attribute-issue-with-gcc.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-attribute-issue-with-gcc.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: remove clang-ism
 Forwarded: not-needed
 
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-build-on-non-x86.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-build-on-non-x86.patch
index 98a5078244..b1caa60c4a 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-build-on-non-x86.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-build-on-non-x86.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: non-x86 arches do not have PAGE_SIZE
 Forwarded: not-needed
 --- a/system/core/base/cmsg.cpp
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-gettid-exception-declaration.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-gettid-exception-declaration.patch
index 7fd228bff6..5f24d0b4a0 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-gettid-exception-declaration.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-gettid-exception-declaration.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: get libcutils building
 Forwarded: not-needed
 --- a/system/core/libcutils/include/cutils/threads.h
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-standard-namespace-errors.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-standard-namespace-errors.patch
index e41a3576ae..4380308f13 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-standard-namespace-errors.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-standard-namespace-errors.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Add missing 'std::' scope identifiers.
 Forwarded: not-needed
 --- a/system/core/libunwindstack/include/unwindstack/DwarfMemory.h
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/hard-code-build-number.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/hard-code-build-number.patch
index 2a332eb689..4d7323bd2f 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/hard-code-build-number.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/hard-code-build-number.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: just hard code rather than deal with circular deps
 Forwarded: not-needed
 --- a/system/core/adb/adb.cpp
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/libusb-header-path.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/libusb-header-path.patch
index 1663aae465..122bd70e7d 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/libusb-header-path.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/libusb-header-path.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: libusb.h comes from different location
 Author: Umang Parmar <umangjparmar@gmail.com>
 Forwarded: not-needed
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/move-log-file-to-proper-dir.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/move-log-file-to-proper-dir.patch
index 006564b024..e8494ab433 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/move-log-file-to-proper-dir.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/move-log-file-to-proper-dir.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Update log file directory.
 Author: Umang Parmar <umangjparmar@gmail.com>
 Last Updated: 2018-05-17
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/simg_dump-python3.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/simg_dump-python3.patch
index e6933ef145..6664dc2aa5 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/simg_dump-python3.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/simg_dump-python3.patch
@@ -5,6 +5,8 @@ Last-Update: 2019-01-05
 Origin: https://bugs.debian.org/945646
 
 ---
+Upstream-Status: Pending
+
 Index: android-platform-tools/system/core/libsparse/simg_dump.py
 ===================================================================
 --- android-platform-tools.orig/system/core/libsparse/simg_dump.py
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/stdatomic.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/stdatomic.patch
index ea3711dfa2..e11f3cc783 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/stdatomic.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/stdatomic.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Fix incompatibility between <stdatomic.h> and <atomic>
  This 2 headers combined will cause errors for both GCC and Clang. This patch
  makes sure only one of them is present at any time.
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/stub-out-fastdeploy.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/stub-out-fastdeploy.patch
index d2426a781d..d86ef230f7 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/stub-out-fastdeploy.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/stub-out-fastdeploy.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Defer packaging fastdeploy with adb for 29.x.x tags.
 Forwarded: not-needed
 --- a/system/core/adb/client/commandline.cpp
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Add-riscv64-support.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Add-riscv64-support.patch
index 4669f89d07..9fd0fa792c 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Add-riscv64-support.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Add-riscv64-support.patch
@@ -24,6 +24,8 @@ Signed-off-by: Lifang Xia <lifang_xia@linux.alibaba.com>
 Signed-off-by: Mao Han <han_mao@linux.alibaba.com>
 Change-Id: Ib21ddf23cc83f332af202df7bffcaceec16063e0
 ---
+Upstream-Status: Pending
+
  system/core/libunwindstack/Android.bp              |   1 +
  system/core/libunwindstack/Elf.cpp                 |   2 +
  system/core/libunwindstack/Regs.cpp                |  10 ++
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Added-missing-headers.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Added-missing-headers.patch
index c07e93660f..d827d7d3c2 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Added-missing-headers.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Added-missing-headers.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Added missing headers causing compile errors
 Author: Umang Parmar <umangjparmar@gmail.com>
 Forwarded: not-needed
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Nonnull.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Nonnull.patch
index 8d1408a48e..54bd52c61a 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Nonnull.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Nonnull.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Bring Clang's _Nonnull keyword to GCC
 Author: Kai-Chung Yan
 Forwarded: not-needed
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Vector-cast.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Vector-cast.patch
index b32d5f6f54..b2881e0213 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Vector-cast.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Vector-cast.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Fix the weird error by GCC7 that fails to match the correct parent method.
 Author: Kai-Chung Yan
 Forwarded: not-needed
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/add-missing-headers.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/add-missing-headers.patch
index 49d3ecefbb..681d2c6553 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/add-missing-headers.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/add-missing-headers.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Forwarded: not-needed
 --- a/system/core/fs_mgr/liblp/reader.cpp
 +++ b/system/core/fs_mgr/liblp/reader.cpp
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-attribute-issue-with-gcc.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-attribute-issue-with-gcc.patch
index e0b4275579..441031f536 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-attribute-issue-with-gcc.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-attribute-issue-with-gcc.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: remove clang-ism
 Forwarded: not-needed
 
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-build-on-non-x86.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-build-on-non-x86.patch
index 98a5078244..b1caa60c4a 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-build-on-non-x86.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-build-on-non-x86.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: non-x86 arches do not have PAGE_SIZE
 Forwarded: not-needed
 --- a/system/core/base/cmsg.cpp
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-gettid-exception-declaration.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-gettid-exception-declaration.patch
index 7fd228bff6..5f24d0b4a0 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-gettid-exception-declaration.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-gettid-exception-declaration.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: get libcutils building
 Forwarded: not-needed
 --- a/system/core/libcutils/include/cutils/threads.h
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-standard-namespace-errors.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-standard-namespace-errors.patch
index e41a3576ae..4380308f13 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-standard-namespace-errors.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-standard-namespace-errors.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Add missing 'std::' scope identifiers.
 Forwarded: not-needed
 --- a/system/core/libunwindstack/include/unwindstack/DwarfMemory.h
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/hard-code-build-number.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/hard-code-build-number.patch
index 2a332eb689..4d7323bd2f 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/hard-code-build-number.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/hard-code-build-number.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: just hard code rather than deal with circular deps
 Forwarded: not-needed
 --- a/system/core/adb/adb.cpp
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/libusb-header-path.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/libusb-header-path.patch
index 1663aae465..122bd70e7d 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/libusb-header-path.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/libusb-header-path.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: libusb.h comes from different location
 Author: Umang Parmar <umangjparmar@gmail.com>
 Forwarded: not-needed
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/move-log-file-to-proper-dir.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/move-log-file-to-proper-dir.patch
index 006564b024..e8494ab433 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/move-log-file-to-proper-dir.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/move-log-file-to-proper-dir.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Update log file directory.
 Author: Umang Parmar <umangjparmar@gmail.com>
 Last Updated: 2018-05-17
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/simg_dump-python3.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/simg_dump-python3.patch
index e6933ef145..6664dc2aa5 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/simg_dump-python3.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/simg_dump-python3.patch
@@ -5,6 +5,8 @@ Last-Update: 2019-01-05
 Origin: https://bugs.debian.org/945646
 
 ---
+Upstream-Status: Pending
+
 Index: android-platform-tools/system/core/libsparse/simg_dump.py
 ===================================================================
 --- android-platform-tools.orig/system/core/libsparse/simg_dump.py
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/stdatomic.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/stdatomic.patch
index ea3711dfa2..e11f3cc783 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/stdatomic.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/stdatomic.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Fix incompatibility between <stdatomic.h> and <atomic>
  This 2 headers combined will cause errors for both GCC and Clang. This patch
  makes sure only one of them is present at any time.
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/stub-out-fastdeploy.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/stub-out-fastdeploy.patch
index d2426a781d..d86ef230f7 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/stub-out-fastdeploy.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/stub-out-fastdeploy.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Defer packaging fastdeploy with adb for 29.x.x tags.
 Forwarded: not-needed
 --- a/system/core/adb/client/commandline.cpp
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/throw-exception-on-unknown-os.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/throw-exception-on-unknown-os.patch
index 6b07f17bfc..70e732131f 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/throw-exception-on-unknown-os.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/throw-exception-on-unknown-os.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Turn #error into exceptions
  So the library can be built on non-Linux platforms too, although can't
  guarauntee its functionality regarding that piece of code.
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/throw-exception-on-unknown-os.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/throw-exception-on-unknown-os.patch
index 6b07f17bfc..70e732131f 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/throw-exception-on-unknown-os.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/throw-exception-on-unknown-os.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Turn #error into exceptions
  So the library can be built on non-Linux platforms too, although can't
  guarauntee its functionality regarding that piece of code.
-- 
2.42.0


