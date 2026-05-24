Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D9FCD5BAB
	for <webhook@archiver.kernel.org>; Sun, 24 May 2026 06:54:08 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3998.1779605646503027091
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 May 2026 23:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZtuINA7b;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso4242718b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 23:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779605646; x=1780210446; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RVMYATXvtaibiIVxWswWuuoUsQ6xKuhYePajLfjTVc0=;
        b=ZtuINA7bEJ+3uTq5EAasPlh6IDLzKiaDXJVEuf8fVnk6yELPhH3ORb32h2FE8A5Xzr
         uyb4Ccf0tE2FJbzPUc+LXP5ZcUJXds0hlWs8tmaoNQZjpP28TZK3jg0fRVk2Wqx8SO/K
         qW+KGqRAH8jxqpB5hRZQFkj3bNckHZSU9B+Mfy7s3FI3P1TpCvAG2rGx2mSP3MH/i4in
         uWa4mblAnPPT91uCMNJrxBxsby3oUGWARNd3XrOG/yx6MpJe4hhmyGiqYxcoWQ+LyO5x
         XOlxa8VHcOhotfyaBSDQsj/hDYHlu1oZWuANQ+Q4l0xVGSwGntwTCfdXNqP5EY5lkjKq
         2CoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779605646; x=1780210446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVMYATXvtaibiIVxWswWuuoUsQ6xKuhYePajLfjTVc0=;
        b=ZiVB3/TqjCqYuZ/Mu8yp6vfG9yuC41qS52uOrcIr8iq1moegXzgsSXKEnTy7Xko2Go
         CiXi/dp7aKfH+pUM2vHxc8CjCJpN4gyPnsjangCf6/SFviDtG/x/8CQty7SwB275E5+q
         bhqTSGK7EOyhffOLjUhh8p2RSB9H+nwBwkfPcqZEPqM5Lxz0f6nGaEmewPLOGUWd91f+
         U83+TCvXcb93vKV3CZ8Dki8RbAKjFPLYYKcJ9SHilKgOPxwFqu4HqBc/e1tYN+9PVkPS
         s/p28YzpTG8eXyM+x7TyQZ/4dV4KrMf9UwCcO48HwdxZlZFFYAXwMq0IhacEzfhcTXqe
         7bsg==
X-Gm-Message-State: AOJu0Yxw9tTNRLQDz1HoQiBPtovRXzV1qkHWqb/ADmwlOUIf1d8ZTzhC
	3BMoqnQiRxSmf7xaK1bNNnTMXvvWeFNqA9GvXEMZIWmxjebVeBQZeT50zdyIOQ==
X-Gm-Gg: Acq92OHkb7X7LIyln89pUovoM1AU6tSaCHb1Iv2kd0qbpaZbwgMq/R8cCCqG53PbrOF
	gy1CfJcEAt5rTqLP5hU6Ou4KxcHjqgJl6zey2ip0TMI7C0K4Ar6ng4/aHtOQfuRwCdoAq/MUU/2
	82+kTq/GwYGu8UlYavQeEqtguzZGwwYyHGubqCYJ8fJISRmzD2mXkJSwZjSnNd9PaQ/n5fWj0o3
	lYKqdAxGuXy7jokIaMLDrgjzaBZvAV7VmmW0pJCHwygDwfj1NlTZ6TJyRtHa8QCaZqybLNltDON
	mIFeJILkhO3HYkTXjr2Wn8aFaEdLYj4Uu6bCHs5xorL9Q9fTO2XNv1yzg3XSdFvOxWo/A/PnDcT
	07GpYz6PDemiHBdfOxDcT7W3L5ElAn5KksCNuIZxRBXUbbqiS1rEDP7BVsJwOO3WTtwQJg9I6c9
	Ku
X-Received: by 2002:a05:6a00:8f0a:b0:827:2792:e401 with SMTP id d2e1a72fcca58-8414b43c999mr10208093b3a.15.1779605645656;
        Sat, 23 May 2026 23:54:05 -0700 (PDT)
Received: from ashishkumar.. ([2406:7400:94:3c8a:db68:70f9:93df:9353])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165010d60sm7053411b3a.61.2026.05.23.23.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 23:54:05 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
X-Google-Original-From: AshishKumar Mishra
To: openembedded-devel@lists.openembedded.org
Cc: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Subject: [meta-oe][PATCH v4 0/4] android-tools: migration and cleanup
Date: Sun, 24 May 2026 12:23:36 +0530
Message-ID: <20260524065341.82660-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 06:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127179

From: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>

Following the feedback on the initial RFC, the logic has been split into two
distinct commits to improve clarity and maintainability:
1. Removal of the legacy android-tools 5.x version from meta-oe/recipes-devtools.
2. Migration of android-tools v29.x from dynamic-layers/selinux to meta-oe.
3. Removes selinux dependency
4. Fixes aarch64-yoe-linux-clang++: warning: treating 'c-header' input as 
   'c++-header' when in C++ mode, this behavior is deprecated [-Wdeprecated]

- This ensures the newer version is correctly positioned in meta-oe while
  cleaning up the deprecated 5.x recipe.

AshishKumar Mishra (4):
  android-tools: remove android-tools 5.x from meta-oe/recipes-devtools
  android-tools: move android-tools v29.x from dynamic-layers/selinux to
    meta-oe
  android-tools: removes selinux dependency from
    android-tools_29.0.6.r14.bb
  android-tools: fix deprecated header warning from clang

 .../android-tools-conf/android-gadget-setup   |  37 --
 .../android-tools/android-tools-conf_1.0.bb   |  20 -
 .../android-tools/android-tools/adbd.mk       |  87 -----
 .../android-tools/android-tools-adbd.service  |  13 -
 .../10-adbd-configfs.conf                     |   4 -
 .../android-gadget-cleanup                    |  24 --
 .../android-gadget-setup                      |  38 --
 .../android-gadget-start                      |   9 -
 .../android-tools-conf-configfs_1.0.bb        |  38 --
 .../android-tools/android-tools-conf_1.0.bb   |   4 +-
 .../0001-Fixes-for-yocto-build.patch          |   0
 .../0001-liblp-fix-building-with-GCC-14.patch |   0
 ...difications-to-make-it-build-in-yoct.patch |   0
 ...usbdevfs_urb-to-match-new-kernel-UAP.patch |   0
 ...-adb-Fix-build-on-big-endian-systems.patch |   0
 ...005-adb-Allow-adbd-to-be-run-as-root.patch |   0
 .../android-tools/android-tools/adb.mk        |  72 ----
 .../android-tools/android-tools/adbd.mk       | 250 +++++-------
 ...scv-Add-risc-v-Android-config-header.patch | 361 ------------------
 .../0001-adb-remove-selinux-extensions.patch  |  44 ---
 ...define-strlcpy-for-glibc-based-syste.patch |  35 --
 ...-Use-local-sockets-where-appropriate.patch |  70 ----
 .../core/0003-adb-define-shell-command.patch  |  29 --
 ...-adb-Fix-build-on-big-endian-systems.patch |  47 ---
 .../0005-adb-add-base64-implementation.patch  | 350 -----------------
 .../core/0006-adb-Musl-fixes.patch            | 130 -------
 ...sb_linux.c-fix-build-with-glibc-2.28.patch |  26 --
 ...008-adb-Allow-adbd-to-be-ran-as-root.patch |  23 --
 ...Add-dt-parameter-to-specify-DT-image.patch | 110 ------
 ...ux-capability.h-on-linux-systems-too.patch |  23 --
 .../0011-Remove-bionic-specific-calls.patch   |  64 ----
 ...laration-of-stlcat-strlcopy-function.patch |  50 ---
 .../core/0013-adb-Support-riscv64.patch       | 191 ---------
 ...add-u3-ss-descriptor-support-for-adb.patch | 344 -----------------
 ...off-most-of-sparse_file_read_normal-.patch |  60 ---
 ...se-Add-hole-mode-to-sparse_file_read.patch | 188 ---------
 ...port-for-converting-holes-to-don-t-c.patch | 114 ------
 .../android-tools/core/adb_libssl_11.diff     |  48 ---
 .../core/b64_pton_function_decl.patch         |  14 -
 .../debian/Add-riscv64-support.patch          |   0
 .../debian/Added-missing-headers.patch        |   0
 .../android-tools/debian/Nonnull.patch        |   0
 .../android-tools/debian/Vector-cast.patch    |   0
 .../debian/add-missing-headers.patch          |   0
 .../20150704-CVE-2015-3239_dwarf_i.h.patch    |   0
 .../legacy_built-in_sync_functions.patch      |   0
 ...nd-fix-strchr-conformance-to-ISO-C23.patch |   0
 ...unreachable-macro-to-avoid-redefinit.patch |   0
 .../external/libunwind/user_pt_regs.patch     |   0
 .../debian/fix-attribute-issue-with-gcc.patch |   0
 .../debian/fix-build-on-non-x86.patch         |   0
 .../fix-gettid-exception-declaration.patch    |   0
 .../fix-standard-namespace-errors.patch       |   0
 .../debian/hard-code-build-number.patch       |   0
 .../debian/libusb-header-path.patch           |   0
 .../debian/move-log-file-to-proper-dir.patch  |   0
 .../debian/simg_dump-python3.patch            |   0
 .../android-tools/debian/stdatomic.patch      |   0
 .../debian/stub-out-fastdeploy.patch          |   0
 .../system/core/Add-riscv64-support.patch     |   0
 .../system/core/Added-missing-headers.patch   |   0
 .../debian/system/core/Nonnull.patch          |   0
 .../debian/system/core/Vector-cast.patch      |   0
 .../system/core/add-missing-headers.patch     |   0
 ...ope-write-macro-to-prevent-conflict-.patch |   0
 .../core/fix-attribute-issue-with-gcc.patch   |   0
 .../system/core/fix-build-on-non-x86.patch    |   0
 .../fix-gettid-exception-declaration.patch    |   0
 .../core/fix-standard-namespace-errors.patch  |   0
 .../system/core/hard-code-build-number.patch  |   0
 .../system/core/libusb-header-path.patch      |   0
 ...x-missing-fixed-width-integer-types-.patch |   0
 .../core/move-log-file-to-proper-dir.patch    |   0
 .../system/core/simg_dump-python3.patch       |   0
 .../debian/system/core/stdatomic.patch        |   0
 .../system/core/stub-out-fastdeploy.patch     |   0
 .../core/throw-exception-on-unknown-os.patch  |   0
 .../throw-exception-on-unknown-os.patch       |   0
 .../android-tools/android-tools/ext4_utils.mk | 103 -----
 ...ext4_utils-remove-selinux-extensions.patch |  39 --
 ...add-o-argument-to-preserve-ownership.patch |  78 ----
 ...unused-parameter-from-allocate_inode.patch |  69 ----
 .../android-tools/android-tools/fastboot.mk   |  89 -----
 .../android-tools/android-tools/gitignore     |  59 ---
 .../0001-Remove-bionic-specific-calls.patch   |  25 --
 ...t-define-gettid-if-glibc-2.30-is-use.patch |  51 ---
 .../android-tools/android-tools/mkbootimg.mk  |  29 --
 .../android-tools/android-tools/remount       |   0
 .../android-tools/rules_yocto.mk              |   0
 .../android-tools/android-tools_29.0.6.r14.bb |   5 +-
 .../android-tools/android-tools_5.1.1.r37.bb  | 189 ---------
 91 files changed, 93 insertions(+), 3560 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf/android-gadget-setup
 delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf_1.0.bb
 delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/adbd.mk
 delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/android-tools-adbd.service
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-cleanup
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/0001-Fixes-for-yocto-build.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/0001-liblp-fix-building-with-GCC-14.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/0003-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/0004-adb-Fix-build-on-big-endian-systems.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/0005-adb-Allow-adbd-to-be-run-as-root.patch (100%)
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/adb.mk
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/build/0001-Riscv-Add-risc-v-Android-config-header.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0001-adb-remove-selinux-extensions.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0001-memory.h-Always-define-strlcpy-for-glibc-based-syste.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0002-adb-Use-local-sockets-where-appropriate.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0003-adb-define-shell-command.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fix-build-on-big-endian-systems.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-add-base64-implementation.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl-fixes.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Allow-adbd-to-be-ran-as-root.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0010-Use-linux-capability.h-on-linux-systems-too.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0011-Remove-bionic-specific-calls.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0013-adb-Support-riscv64.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0014-add-u3-ss-descriptor-support-for-adb.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0015-libsparse-Split-off-most-of-sparse_file_read_normal-.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0016-libsparse-Add-hole-mode-to-sparse_file_read.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0017-img2simg-Add-support-for-converting-holes-to-don-t-c.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.diff
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/b64_pton_function_decl.patch
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/Add-riscv64-support.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/Added-missing-headers.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/Nonnull.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/Vector-cast.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/add-missing-headers.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/external/libunwind/legacy_built-in_sync_functions.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/external/libunwind/libunwind-guard-unreachable-macro-to-avoid-redefinit.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/external/libunwind/user_pt_regs.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/fix-attribute-issue-with-gcc.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/fix-build-on-non-x86.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/fix-gettid-exception-declaration.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/fix-standard-namespace-errors.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/hard-code-build-number.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/libusb-header-path.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/move-log-file-to-proper-dir.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/simg_dump-python3.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/stdatomic.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/stub-out-fastdeploy.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/Add-riscv64-support.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/Added-missing-headers.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/Nonnull.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/Vector-cast.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/add-missing-headers.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/android-tools-scope-write-macro-to-prevent-conflict-.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/fix-attribute-issue-with-gcc.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/fix-build-on-non-x86.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/fix-gettid-exception-declaration.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/fix-standard-namespace-errors.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/hard-code-build-number.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/libusb-header-path.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/libziparchive-fix-missing-fixed-width-integer-types-.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/move-log-file-to-proper-dir.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/simg_dump-python3.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/stdatomic.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/stub-out-fastdeploy.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/system/core/throw-exception-on-unknown-os.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/debian/throw-exception-on-unknown-os.patch (100%)
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/ext4_utils.mk
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/extras/0001-ext4_utils-remove-selinux-extensions.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/extras/0003-ext4_utils-drop-unused-parameter-from-allocate_inode.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/fastboot.mk
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/gitignore
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-Remove-bionic-specific-calls.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg.mk
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/remount (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/rules_yocto.mk (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools_29.0.6.r14.bb (97%)
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb

-- 
2.43.0


