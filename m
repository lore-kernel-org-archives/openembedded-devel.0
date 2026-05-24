Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B1ECD4F54
	for <webhook@archiver.kernel.org>; Sun, 24 May 2026 06:54:18 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4013.1779605655863149166
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 May 2026 23:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=D5Qu+xHs;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82f8b60e54dso7049077b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 23:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779605655; x=1780210455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFDKfIyK9kTdGU3H+sesMP0U5KKPwR4V/Z/qz6E9EJU=;
        b=D5Qu+xHsEkZ86fT9LgLQHsGs0ORKfcNma5c24VQFqnfndZ3JttiGA+S9gedrKmzn9r
         /0Orhpo6F00KqW79UOG/YYF0eQC2DGoBwt5W3sxy1L/dcfpicbEhdlAyamVcwDNW57cj
         TRyy7ucukPTDxWXgQSzBcFwa8jYOlmiDbSw01khCyDQqbIjv4T7yVHhVnDDfdF3fzFRv
         4NjzJz4v10oVoL+uZAR1U6QCnt3cyx8ke6AFuWFV+wbqeg5HBmA6R6XR7yntLrfwIux+
         moQiTiOGIKQN0Wss0CxyCy7rTSoI7EbNt4YR5NLoq1CxvxxRTpjb85c8A6RaR/yp8yxN
         p3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779605655; x=1780210455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PFDKfIyK9kTdGU3H+sesMP0U5KKPwR4V/Z/qz6E9EJU=;
        b=EGy4CgL+3EdzO35XoEDOUbNu6rV83H8KxwATtIsAGe10xV9893OS7f9gy6wacMIlnB
         TzhSULCLXcHFBP96sC2njSCK9+tH9c3aeRAKwyL3LnTYHxda2MtxoBsIdvYQ1uoaJGXR
         CpC6PqKAcoNFSly8yTIgG85jmrcgn3Bo92nIrDPElf/Ffgwr+mOeiH6AaqutSZM7q9Hc
         3h2a8hmlO+8B+e+XVRrZ1o/sDE8ialctP46cHYpSFKRHaD+4Xl7CT7skoVC5fCDHJqJd
         LKfwDbAILIdb/SDluYRmXaSMgYO7G47+JAU9zIo1JwNHhpLmur+ob7sOjY7IfyWba7OI
         H/Cg==
X-Gm-Message-State: AOJu0YzNoxsJUVO+gtwzKl+cTOeHlIfYiA0SHO/YtS912HOkVIofDNje
	/Ls4EmYbvtvhXsq1mQfmmCTKg/jr+uBL3eJJyn7yIIUtzGULTlX8HBfkQWiu9A==
X-Gm-Gg: Acq92OGNe5pU4BzoN/OtHOJP2QTmztMy0besTyzG8oIUEBSi1zEqP6RHfPLBZOtO+QY
	UvbTcEAwUT4Fqf3WsIDLaG/fsuQTmQ+a2mgq5uVS4g9cJCosKQg/mPeXshYB4FegBWdbwKagiTp
	wf9iLEx9clg77D6sKXVn9ITGvjG5nHn2KpeDZvswOh0rCm1fBcfHyOkpKFAA2aIM2Geus8EVyMq
	R3plNhHM+/2PtpHVF+rxt4skb/43aB4bIF2WIKM3R4ZabhsynaA9VN5hkx+S5+LJ1Uh+bopBryB
	2cZiNo0x7acjLtcpBCqVT3EWi4jKxzGztCXfhNPPOD1L911tGSwwilHAHyIm2yPA4zg/QA1Wnr9
	AGI4oJQ9FCh1i/2XKWvfByQBAJWUuRHWrmzzLT2qP/lsvIf2au/SZDnocqTYSHBFGo3rlAYnbKx
	l1
X-Received: by 2002:a05:6a00:3d42:b0:827:447f:7dbd with SMTP id d2e1a72fcca58-8415f3abbb7mr10167308b3a.46.1779605655020;
        Sat, 23 May 2026 23:54:15 -0700 (PDT)
Received: from ashishkumar.. ([2406:7400:94:3c8a:db68:70f9:93df:9353])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165010d60sm7053411b3a.61.2026.05.23.23.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 23:54:14 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
X-Google-Original-From: AshishKumar Mishra
To: openembedded-devel@lists.openembedded.org
Cc: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH v4 2/4] android-tools: move android-tools v29.x from dynamic-layers/selinux to meta-oe
Date: Sun, 24 May 2026 12:23:38 +0530
Message-ID: <20260524065341.82660-3-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524065341.82660-1-emailaddress.ashish@gmail.com>
References: <20260524065341.82660-1-emailaddress.ashish@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 06:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127181

From: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>

Relocate the recipe from dynamic-layers/selinux/ to the main
meta-oe/recipes-devtools/ directory.

The android-tools recipe (version 29.0.6.r14) was previously restricted
to the selinux dynamic-layer.
Investigation shows that version 29.0.6.r14 does not have a hard dependency
on libselinux for core tool functionality.
(adb, fastboot, and sparse image tools).
- Basic runable test was done for binaries in android-tools-native
- Checked for selinux absense by looking for selinx using $ ldd binary-name

Changes:
- Relocate recipe from dynamic-layers/selinux/ to recipes-devtools/

Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../android-tools/android-tools-conf/android-gadget-setup         | 0
 .../android-tools/android-tools-conf_1.0.bb                       | 0
 .../android-tools/android-tools/0001-Fixes-for-yocto-build.patch  | 0
 .../android-tools/0001-liblp-fix-building-with-GCC-14.patch       | 0
 ...002-android-tools-modifications-to-make-it-build-in-yoct.patch | 0
 ...003-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch | 0
 .../android-tools/0004-adb-Fix-build-on-big-endian-systems.patch  | 0
 .../android-tools/0005-adb-Allow-adbd-to-be-run-as-root.patch     | 0
 .../android-tools/android-tools/adbd.mk                           | 0
 .../android-tools/android-tools/android-tools-adbd.service        | 0
 .../android-tools/android-tools/debian/Add-riscv64-support.patch  | 0
 .../android-tools/debian/Added-missing-headers.patch              | 0
 .../android-tools/android-tools/debian/Nonnull.patch              | 0
 .../android-tools/android-tools/debian/Vector-cast.patch          | 0
 .../android-tools/android-tools/debian/add-missing-headers.patch  | 0
 .../external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch     | 0
 .../external/libunwind/legacy_built-in_sync_functions.patch       | 0
 .../libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch   | 0
 .../libunwind-guard-unreachable-macro-to-avoid-redefinit.patch    | 0
 .../android-tools/debian/external/libunwind/user_pt_regs.patch    | 0
 .../android-tools/debian/fix-attribute-issue-with-gcc.patch       | 0
 .../android-tools/android-tools/debian/fix-build-on-non-x86.patch | 0
 .../android-tools/debian/fix-gettid-exception-declaration.patch   | 0
 .../android-tools/debian/fix-standard-namespace-errors.patch      | 0
 .../android-tools/debian/hard-code-build-number.patch             | 0
 .../android-tools/android-tools/debian/libusb-header-path.patch   | 0
 .../android-tools/debian/move-log-file-to-proper-dir.patch        | 0
 .../android-tools/android-tools/debian/simg_dump-python3.patch    | 0
 .../android-tools/android-tools/debian/stdatomic.patch            | 0
 .../android-tools/android-tools/debian/stub-out-fastdeploy.patch  | 0
 .../android-tools/debian/system/core/Add-riscv64-support.patch    | 0
 .../android-tools/debian/system/core/Added-missing-headers.patch  | 0
 .../android-tools/android-tools/debian/system/core/Nonnull.patch  | 0
 .../android-tools/debian/system/core/Vector-cast.patch            | 0
 .../android-tools/debian/system/core/add-missing-headers.patch    | 0
 .../android-tools-scope-write-macro-to-prevent-conflict-.patch    | 0
 .../debian/system/core/fix-attribute-issue-with-gcc.patch         | 0
 .../android-tools/debian/system/core/fix-build-on-non-x86.patch   | 0
 .../debian/system/core/fix-gettid-exception-declaration.patch     | 0
 .../debian/system/core/fix-standard-namespace-errors.patch        | 0
 .../android-tools/debian/system/core/hard-code-build-number.patch | 0
 .../android-tools/debian/system/core/libusb-header-path.patch     | 0
 .../libziparchive-fix-missing-fixed-width-integer-types-.patch    | 0
 .../debian/system/core/move-log-file-to-proper-dir.patch          | 0
 .../android-tools/debian/system/core/simg_dump-python3.patch      | 0
 .../android-tools/debian/system/core/stdatomic.patch              | 0
 .../android-tools/debian/system/core/stub-out-fastdeploy.patch    | 0
 .../debian/system/core/throw-exception-on-unknown-os.patch        | 0
 .../android-tools/debian/throw-exception-on-unknown-os.patch      | 0
 .../android-tools/android-tools/remount                           | 0
 .../android-tools/android-tools/rules_yocto.mk                    | 0
 .../android-tools/android-tools_29.0.6.r14.bb                     | 0
 52 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools-conf/android-gadget-setup (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools-conf_1.0.bb (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/0001-Fixes-for-yocto-build.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/0001-liblp-fix-building-with-GCC-14.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/0003-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/0004-adb-Fix-build-on-big-endian-systems.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/0005-adb-Allow-adbd-to-be-run-as-root.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/adbd.mk (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/android-tools-adbd.service (100%)
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
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/remount (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools/rules_yocto.mk (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool => recipes-devtools}/android-tools/android-tools_29.0.6.r14.bb (100%)

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf/android-gadget-setup b/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf/android-gadget-setup
rename to meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf_1.0.bb b/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf_1.0.bb
rename to meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0001-Fixes-for-yocto-build.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0001-Fixes-for-yocto-build.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0001-Fixes-for-yocto-build.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/0001-Fixes-for-yocto-build.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0001-liblp-fix-building-with-GCC-14.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0001-liblp-fix-building-with-GCC-14.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0001-liblp-fix-building-with-GCC-14.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/0001-liblp-fix-building-with-GCC-14.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0003-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0003-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0003-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/0003-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0004-adb-Fix-build-on-big-endian-systems.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0004-adb-Fix-build-on-big-endian-systems.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0004-adb-Fix-build-on-big-endian-systems.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/0004-adb-Fix-build-on-big-endian-systems.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0005-adb-Allow-adbd-to-be-run-as-root.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0005-adb-Allow-adbd-to-be-run-as-root.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0005-adb-Allow-adbd-to-be-run-as-root.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/0005-adb-Allow-adbd-to-be-run-as-root.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/adbd.mk b/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/adbd.mk
rename to meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/android-tools-adbd.service b/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/android-tools-adbd.service
rename to meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Add-riscv64-support.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/Add-riscv64-support.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Add-riscv64-support.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/Add-riscv64-support.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Added-missing-headers.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/Added-missing-headers.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Added-missing-headers.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/Added-missing-headers.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Nonnull.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/Nonnull.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Nonnull.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/Nonnull.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Vector-cast.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/Vector-cast.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/Vector-cast.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/Vector-cast.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/add-missing-headers.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/add-missing-headers.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/add-missing-headers.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/add-missing-headers.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/legacy_built-in_sync_functions.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/legacy_built-in_sync_functions.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/legacy_built-in_sync_functions.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/legacy_built-in_sync_functions.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/libunwind-guard-unreachable-macro-to-avoid-redefinit.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/libunwind-guard-unreachable-macro-to-avoid-redefinit.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/libunwind-guard-unreachable-macro-to-avoid-redefinit.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/libunwind-guard-unreachable-macro-to-avoid-redefinit.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/user_pt_regs.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/user_pt_regs.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/user_pt_regs.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/external/libunwind/user_pt_regs.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-attribute-issue-with-gcc.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-attribute-issue-with-gcc.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-attribute-issue-with-gcc.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-attribute-issue-with-gcc.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-build-on-non-x86.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-build-on-non-x86.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-build-on-non-x86.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-build-on-non-x86.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-gettid-exception-declaration.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-gettid-exception-declaration.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-gettid-exception-declaration.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-gettid-exception-declaration.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-standard-namespace-errors.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-standard-namespace-errors.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/fix-standard-namespace-errors.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/fix-standard-namespace-errors.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/hard-code-build-number.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/hard-code-build-number.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/hard-code-build-number.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/hard-code-build-number.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/libusb-header-path.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/libusb-header-path.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/libusb-header-path.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/libusb-header-path.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/move-log-file-to-proper-dir.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/move-log-file-to-proper-dir.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/move-log-file-to-proper-dir.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/move-log-file-to-proper-dir.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/simg_dump-python3.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/simg_dump-python3.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/simg_dump-python3.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/simg_dump-python3.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/stdatomic.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/stdatomic.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/stdatomic.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/stdatomic.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/stub-out-fastdeploy.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/stub-out-fastdeploy.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/stub-out-fastdeploy.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/stub-out-fastdeploy.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Add-riscv64-support.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Add-riscv64-support.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Add-riscv64-support.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Add-riscv64-support.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Added-missing-headers.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Added-missing-headers.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Added-missing-headers.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Added-missing-headers.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Nonnull.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Nonnull.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Nonnull.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Nonnull.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Vector-cast.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Vector-cast.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/Vector-cast.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/Vector-cast.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/add-missing-headers.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/add-missing-headers.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/add-missing-headers.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/add-missing-headers.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/android-tools-scope-write-macro-to-prevent-conflict-.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/android-tools-scope-write-macro-to-prevent-conflict-.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/android-tools-scope-write-macro-to-prevent-conflict-.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/android-tools-scope-write-macro-to-prevent-conflict-.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-attribute-issue-with-gcc.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-attribute-issue-with-gcc.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-attribute-issue-with-gcc.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-attribute-issue-with-gcc.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-build-on-non-x86.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-build-on-non-x86.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-build-on-non-x86.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-build-on-non-x86.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-gettid-exception-declaration.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-gettid-exception-declaration.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-gettid-exception-declaration.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-gettid-exception-declaration.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-standard-namespace-errors.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-standard-namespace-errors.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/fix-standard-namespace-errors.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/fix-standard-namespace-errors.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/hard-code-build-number.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/hard-code-build-number.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/hard-code-build-number.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/hard-code-build-number.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/libusb-header-path.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/libusb-header-path.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/libusb-header-path.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/libusb-header-path.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/libziparchive-fix-missing-fixed-width-integer-types-.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/libziparchive-fix-missing-fixed-width-integer-types-.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/libziparchive-fix-missing-fixed-width-integer-types-.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/libziparchive-fix-missing-fixed-width-integer-types-.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/move-log-file-to-proper-dir.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/move-log-file-to-proper-dir.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/move-log-file-to-proper-dir.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/move-log-file-to-proper-dir.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/simg_dump-python3.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/simg_dump-python3.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/simg_dump-python3.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/simg_dump-python3.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/stdatomic.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/stdatomic.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/stdatomic.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/stdatomic.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/stub-out-fastdeploy.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/stub-out-fastdeploy.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/stub-out-fastdeploy.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/stub-out-fastdeploy.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/throw-exception-on-unknown-os.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/throw-exception-on-unknown-os.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/throw-exception-on-unknown-os.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/system/core/throw-exception-on-unknown-os.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/throw-exception-on-unknown-os.patch b/meta-oe/recipes-devtools/android-tools/android-tools/debian/throw-exception-on-unknown-os.patch
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/throw-exception-on-unknown-os.patch
rename to meta-oe/recipes-devtools/android-tools/android-tools/debian/throw-exception-on-unknown-os.patch
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/remount b/meta-oe/recipes-devtools/android-tools/android-tools/remount
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/remount
rename to meta-oe/recipes-devtools/android-tools/android-tools/remount
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/rules_yocto.mk b/meta-oe/recipes-devtools/android-tools/android-tools/rules_yocto.mk
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/rules_yocto.mk
rename to meta-oe/recipes-devtools/android-tools/android-tools/rules_yocto.mk
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb
similarity index 100%
rename from meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
rename to meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb
-- 
2.43.0


