Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB20CCD195
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 14:06:03 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.9518.1760623558988760543
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 07:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=clYhS2LU;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42701f2ad61so336137f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 07:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760623557; x=1761228357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LP7bLtwskefM85DhGr1pfS4M28nGPrudjoH2PDYn370=;
        b=clYhS2LUwM61xKAO1D7G7iP6JC7LxTSPOdB/CFel4Ns5rLDlvhXcd5DCTucRNiLAay
         W/bV6bKOj0D1GAn1S8b0k/VxrEGkQhne9FPSzhQMVxnM9jQykPs+P8TeZ2JNBW6MA5VY
         Z1AJxTMVTUFbZ2/q/Gkmw+9uuF/98xIEFUbXWPZ+wuVukDScxDVdeitcw8rMklAtl+VK
         n+kt35hUvWLngkSaY1Zp0ywBu7CH1dtmPR2wTwOxxAAvPhoZYevcgzsqMCZvPCfafEW7
         BfBqSN2ODuQkMb0zda48TjsUpwOGLNMfuzK0qkRSFSH6MaUHuMjqJvXwwzD2IBJouL5m
         K+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760623557; x=1761228357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LP7bLtwskefM85DhGr1pfS4M28nGPrudjoH2PDYn370=;
        b=IycTxM7RQxgI/m56EHGDmdrGKUaO1viE1o3mUeeUNIPDub5dHMVwQHoSHQYAZ8yG5c
         KO942sAz0F7Ue5gC7cisVm6di7DZ/OE8RrAURrf3u7CI56hw9OCv0evu414A400HFlYh
         62A9VMqy9vqkrNgBdqUjOkUr31rJyoFteybUmrYBCKF0WV+98upffwrIdiuv4LbcHF9m
         T/JuEqus41ICvOdIzYEPvS0AnF0OMVApeVszCbwbTRIYXD2j2OO6frs5ZTK2I80sps6H
         CnxFzbvVXF6+ofoqefwhEn1u7CR6J0rPTuFtEwlrT1mHNwedkos59R3dorzpjBk7ZFqc
         TCKA==
X-Gm-Message-State: AOJu0YyDZ6Vm6eDu/S75mH/4rCAJA/7dZ//v9yrXlhmSmrGcTtZ/P3fj
	9Zuw0aPdsQ1tC7k39hKgbO3QdmlX5K2rKy2ql48BA31B0fmbG+T6WBLkoL3cJQ==
X-Gm-Gg: ASbGncv/62xoTqDPtWh++XYTmyoJBDGcnSo5zbfWyRQ3rbt6tG+/a8DY806QY9F/Hrq
	hPC1z0Cd7uksYmCp5eyzEKz9KZ2GjgGbQ1ZQkU8Bnf9PWikZWTeZKkAzqszyD94jDp84Dj1LAv8
	tK8LMEOFDhzohRaGIBXXYoy52H0JmTBOjgmo0rYh2B5FHjJTRHgPbEa23Y6C5Np0REN7Q9fj0eH
	CTu3qlacnH75sdlo3w2umsQlhqcRiIOtjSImsUhhG/KigeNEGFyPXab7LTRdsuojaV1BML1pMtl
	kVEAlvuawWCnChK90/dYWZ8rPQ+FPB/2vclM/rc4mKZMsU6pqLL+TDmlE48I1Af0Vox1hZTqJvg
	dKJfdhFPhmtHKJ6eyiB8mZUWkk6kfr9+7GEg9fs9bPmAd3f4D+HTJao3mXic7bJoiK/Ok8v0v41
	VeTV+lLvWq
X-Google-Smtp-Source: AGHT+IF3aHU5shSiAr6n/ukZb6wjwE4B/lO0E5/Bhb635aS+oT7Chf1epH94UNpyHBGX2Qn5/0eCAQ==
X-Received: by 2002:a05:6000:2dc9:b0:427:279:e1b1 with SMTP id ffacd0b85a97d-42704d9e9c7mr201450f8f.46.1760623557125;
        Thu, 16 Oct 2025 07:05:57 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427013f9b58sm3272038f8f.51.2025.10.16.07.05.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 07:05:56 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] fwupd: upgrade 2.0.12 -> 2.0.16
Date: Thu, 16 Oct 2025 16:05:55 +0200
Message-ID: <20251016140555.2602335-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 14:06:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120738

Dropped two patches which got incorporated in this version.

Changelogs:
2.0.16:
Add a 'search' feature to fwupdtool and fwupdmgr
Fix missing release locations when loading from artifact
Fix remaining issues to make updates on FreeBSD work

2.0.15:
Allow child devices to use the parent name as a prefix
Add newer commands and options for Fish completion
Allow installing archives named as .CAB rather than .cab
Erase Firehose modem devices correctly
Fix Goodix enumeration issues
Fix sending firmware reports without --force
Fix the FreeBSD build
Fix version number of BnR MTD devices
Require additional requirements for the default PS5512 devboard
Require a full system shutdown for all Micron NVMe updates
Use a better name for Elan touchpad and Intel PCH SPI devices

New supported hw:
Foxconn SDX61 Modem
Jabra Evolve2 child devices
NVIDIA ConnectX-6, ConnectX-7 and ConnectX-8 NICs

2.0.14:
Add support for ignoring the network connectivity requirement
Allow building on RHEL-9 and RHEL-10
Allow plugins to know the firmware version during update
Allow UEFI capsule devices to opt-out of Capsule-on-Disk
Allow unsetting HwID plugin context flags
Allow upgrading from a zero "empty" UEFI dbx
Add an automatic firehose counterpart to the QCDM modem device
Disable signature time checks when verifying firmware
Do not add a vendor ID of UNKNOWN when the signature has no vendor
Do not discover ThunderBolt retimer devices when run in single-shot mode
Do not use deprecated libflashrom API
Enhance firmware metadata generation in firmware_packager
Ensure Lexar NVMe drives use a proper version number
Fix parsing and writing UF2 extension sections
Fix Synaptics RMI initialization for new devices
Fix updating DFOTA and MBIM modem devices
Move some vendor name fixups to the quirk file
Remove CapsuleOnDisk HwID match for Dell
Return a sensible error when using build-cabinet wrong
Set the firehose loader filename in a more permissive way
Update the mapping for TPM vendor names
Verify the checksum of the serialized data in tests
Work around a libmbim bug when detaching

New supported hw:
Egis MoC devices
Framework QMK devices
ILITEK touch controllers
SteelSeries Arctis Nova 3P

2.0.13:
Add a daemon config option to ignore efivars free space
Add support for glob-aware version comparison requirements
Allow targeting specific regions in FMAP when using flashrom
Detect static variables and magic numbers during code review
Remove the unused hailuck and rts54hid plugins
Align MTD erase up to the erasesize as necessary
Allow parsing IGSC OptionROM when using fwupdtool
Allow removing private flags from UEFI capsule devices in quirks
Do not copy the vendor for Intel reference ME firmware
Do not use an interactive console if stdout is redirected
Fix the UEFI self-test when the capsule splash is disabled
Get better device information when using PCI-backed MTD devices
Get the Intel GPU SKU and SVN when using BMG hardware
Make MBIM modem devices emulatable
Make sure fwupdtool.exe is available in the Windows PATH
Only show the 'Full Disk Encryption Detected' warning when required
Set all QCDM modem devices to raw mode when updating
Show all devices for fwupdtool get-devices --show-all --force
Show correct dbx version if non-Microsoft entries are present
Show KEK device attributes in fwupdmgr
Use an alternate GUID when the Intel GPU is in recovery mode
Use the kernel netlink hotplug socket when there is no Udev
Various small changes to speed up startup by 60% and lower RSS by 40%

New supported hw:
HP USB-C 100W G6 Dock
Logitech Bulk Controller pheripherals
More MediaTek scaler devices

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...certs.py-use-usr-bin-env-for-python3.patch | 28 -----------
 ...-reduce-lzma-compression-level-from-.patch | 47 -------------------
 .../{fwupd_2.0.12.bb => fwupd_2.0.16.bb}      |  4 +-
 3 files changed, 1 insertion(+), 78 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/0001-build-certs.py-use-usr-bin-env-for-python3.patch
 delete mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/0001-fu-lzma-common.c-reduce-lzma-compression-level-from-.patch
 rename meta-oe/recipes-bsp/fwupd/{fwupd_2.0.12.bb => fwupd_2.0.16.bb} (93%)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd/0001-build-certs.py-use-usr-bin-env-for-python3.patch b/meta-oe/recipes-bsp/fwupd/fwupd/0001-build-certs.py-use-usr-bin-env-for-python3.patch
deleted file mode 100644
index 3a4ecb1f29..0000000000
--- a/meta-oe/recipes-bsp/fwupd/fwupd/0001-build-certs.py-use-usr-bin-env-for-python3.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 2c3896878ba8118b48c55528c6bac98f05f223f3 Mon Sep 17 00:00:00 2001
-From: Mikko Rapeli <mikko.rapeli@linaro.org>
-Date: Thu, 3 Jul 2025 13:34:21 +0000
-Subject: [PATCH] build-certs.py: use /usr/bin/env for python3
-
-Avoids errors if python3 install path is not
-in /usr/bin.
-
-Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
----
- data/tests/build-certs.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Upstream-Status: Submitted [https://github.com/fwupd/fwupd/pull/8998]
-
-diff --git a/data/tests/build-certs.py b/data/tests/build-certs.py
-index 3b8503b72bcf..222e8a4a0f8b 100755
---- a/data/tests/build-certs.py
-+++ b/data/tests/build-certs.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python3
-+#!/usr/bin/env python3
- # SPDX-License-Identifier: LGPL-2.1+
- 
- import os
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd/0001-fu-lzma-common.c-reduce-lzma-compression-level-from-.patch b/meta-oe/recipes-bsp/fwupd/fwupd/0001-fu-lzma-common.c-reduce-lzma-compression-level-from-.patch
deleted file mode 100644
index b0d3863eaa..0000000000
--- a/meta-oe/recipes-bsp/fwupd/fwupd/0001-fu-lzma-common.c-reduce-lzma-compression-level-from-.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From c96668ab830d016eeff977d5ca4f99d288cf38c0 Mon Sep 17 00:00:00 2001
-From: Mikko Rapeli <mikko.rapeli@linaro.org>
-Date: Tue, 8 Jul 2025 07:05:02 +0000
-Subject: [PATCH] fu-lzma-common.c: reduce lzma compression level from 9 to
- default 6
-
-xz manual page says default is 6 and levels higher than that can cause
-huge CPU and memory usage. On yocto qemu target, the fwupd tests
-fail to run with compression level 9:
-
-FuSelfTest:ERROR:../sources/fwupd-2.0.12/libfwupdplugin/fu-self-test.c:6342:fu_lzma_func: assertion failed (error == NULL): failed to set up LZMA encoder rc=5 (FwupdError, 10)
-not ok /fwupd/lzma - FuSelfTest:ERROR:../sources/fwupd-2.0.12/libfwupdplugin/fu-self-test.c:6342:fu_lzma_func: assertion failed (error == NULL): failed to set up LZMA encoder rc=5 (FwupdError, 10)
-
-With default compression level 6 the tests pass.
-
-https://linux.die.net/man/1/xz
-
- -6 ... -9
-    Excellent compression with medium to high memory usage.
-    These are also slower than the lower preset levels.
-    The default is -6. Unless you want to maximize the compression ratio,
-    you probably don't want a higher preset level than -7 due to
-    speed and memory usage.
-
-Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
----
- libfwupdplugin/fu-lzma-common.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Upstream-Status: Submitted [https://github.com/fwupd/fwupd/pull/9019]
-
-diff --git a/libfwupdplugin/fu-lzma-common.c b/libfwupdplugin/fu-lzma-common.c
-index a64ec773da91..d381ed52e135 100644
---- a/libfwupdplugin/fu-lzma-common.c
-+++ b/libfwupdplugin/fu-lzma-common.c
-@@ -89,7 +89,7 @@ fu_lzma_compress_bytes(GBytes *blob, GError **error)
- 	strm.next_in = g_bytes_get_data(blob, NULL);
- 	strm.avail_in = g_bytes_get_size(blob);
- 
--	rc = lzma_easy_encoder(&strm, 9, LZMA_CHECK_CRC64);
-+	rc = lzma_easy_encoder(&strm, 6, LZMA_CHECK_CRC64);
- 	if (rc != LZMA_OK) {
- 		lzma_end(&strm);
- 		g_set_error(error,
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb b/meta-oe/recipes-bsp/fwupd/fwupd_2.0.16.bb
similarity index 93%
rename from meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
rename to meta-oe/recipes-bsp/fwupd/fwupd_2.0.16.bb
index eb43c3d865..895ebab838 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_2.0.16.bb
@@ -17,11 +17,9 @@ DEPENDS = "\
 
 SRC_URI = "\
     https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
-    file://0001-build-certs.py-use-usr-bin-env-for-python3.patch \
-    file://0001-fu-lzma-common.c-reduce-lzma-compression-level-from-.patch \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "83eab17ef2e65249491aef5e99419827b43ac56d40c5b0747b59ee94b147215e"
+SRC_URI[sha256sum] = "79cce6b61d9ea531de0ef3b13e7f2682c699901b11f410b2ed91192618e1620e"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"

