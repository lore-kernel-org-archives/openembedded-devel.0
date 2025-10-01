Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE3DCCA476
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:42:37 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.17150.1759323941260773695
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SIi0tqr+;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: joao.raul.434@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e37d10f3eso56844125e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759323939; x=1759928739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GnR/9GLFCMdQv1cUqzM4QFVhxyHwZKCQZ7byKLM7E90=;
        b=SIi0tqr+V+0fuSUuE+3dJM0UbqFSLrzFpaczEwukdg8rWNfsHV4zeIfjNS8W4Kx/WK
         /E6dSLaym6oM+nkkPVJdMdY1arHJeHgcfZ5vIgHmhmtPM91g55zOSU5/9vGSOvpr5tsU
         LPAoGOEWXh3kAWA0bFlr1P0tCivh6IEwFHupau8dRZaLgSF5xVBeXNpW64SvEC0dnTVE
         9VStNM5aPgac8wYXU5OYOECiP7VgjmBEikdqi38ZwgJJV6nDplmCNkwM6mzvOONUleno
         9QVgfyBYjqXZgXnnK7dFdYWyw7xHkFzmAdclUlnEsT8JFADO8No/T4IZ2WKQOV/M+niE
         lA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759323939; x=1759928739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GnR/9GLFCMdQv1cUqzM4QFVhxyHwZKCQZ7byKLM7E90=;
        b=TZ6gfzPiu29OHYPvsKVdiGLSHnhjtKv8UpCtwVFyjDFPRY0RM4GNHfgWTRI5odyNku
         dZPvFP32T1tpFRiEuynyIbm93EqTw3ynSUCiNWcFA0kIFU3HkUdywlqu99lUE7gS20+W
         pW20/1zWaxjmeKnSUEYufVEuDndZHrqaskyGsYsIrvySqAOvJ5Rs/PjkpUrvJSWyalZv
         Jcsuiqo7RdoX4hLemgZtI5OUnLwccf2nWc2aGUE9DlqZmbqg74R4PD4bK/1K7YBVcX6N
         QRQzCfUi/HNM9TMR5Ui38CvzwW9UE3qoFjaYjcbiUUcthBiQOQ22yo+QdUF3VZO+Yokf
         JRgA==
X-Gm-Message-State: AOJu0YyNsXFqjBQ1aVcI3X5UFhtcyZOg/BS8l4IeXNNa2NPj9tfLltL+
	e0s1oNB5d4157rat35vcbIGGywJo8GPVOMFLIdok34V0l+mU9/n78Qj9T7D1ZS81
X-Gm-Gg: ASbGncsCoWYebo23zFvezA6QFZDtkfRh8bfxvkvXekxY0n4edcXD4BWqlmHOwzgXo+M
	nD6lzSOFjN5N+cLpBGLzcp8TYLgo5AHs5D6agecTq/j18NGZrU0Xmru81m1pi6nXqqdXmgqD2QY
	7uGo24At2tVydhNoAd0/7q9CHXITRByyL1NoNap+2NVlck2GqoYPKVn9kJVwFAIH+k5Np6eur6k
	47ALosSkeDq5IlIjvRqw96HdHtgiFzoCG/mE6CrVzUv27sIeoJ8sG1o5pXed9PF9Q3I8jXi0wn0
	+9KuKDXz32HNSDg0QeDvp+s+rU8gBM34dPA7CvQxNJSc4yH6m+Ito+Ir3mZnYbiMnGzvf46+V7e
	AAe0Pbj3FYiq8it7SXS3fy7l6t+Nb/l59hZY4wDh+mJUpUR5oAoId4WlyNjhv46p6FKDVV7rmrx
	PAJ02mNMxXCgNEP6EMshP/gstsCSzECyHFWiShMd8gNgd+lg==
X-Google-Smtp-Source: AGHT+IEMBIMA+Zh79SO7tdhpoTuu9mVci862juR4eK+Dd7pkLjGpamsdFhjcp9TuT9euP3xpWQjzEA==
X-Received: by 2002:a05:600c:4e04:b0:46e:4be1:a423 with SMTP id 5b1f17b1804b1-46e612053c8mr29181675e9.1.1759323939174;
        Wed, 01 Oct 2025 06:05:39 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e619a8ae2sm37333365e9.15.2025.10.01.06.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:05:38 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com,
	joao.lima@hbkworld.com
Subject: [meta-oe][PATCH 2/3] openocd: add dmem support to am64xx and j784s4 platforms
Date: Wed,  1 Oct 2025 14:05:35 +0100
Message-ID: <20251001130535.1724-1-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120111

From: Joao Lima <joao.lima@hbkworld.com>

Platform support patches:
   - Add SWD native configuration files for AM64x and J784s4 boards
   - Configure DMEM access parameters in ti_k3.cfg for direct memory operations
   - Set up DAPBUS debugger and emulated AP descriptions

Signed-off-by: Joao Lima <joao.lima@hbkworld.com>
---
 ...wd_native.cfg-Add-support-for-direct.patch | 77 +++++++++++++++++++
 ....cfg-Add-support-for-direct-memory-a.patch | 65 ++++++++++++++++
 .../recipes-devtools/openocd/openocd_git.bb   |  2 +
 3 files changed, 144 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-tcl-board-ti_-_swd_native.cfg-Add-support-for-direct.patch
 create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0002-tcl-target-ti_k3.cfg-Add-support-for-direct-memory-a.patch

diff --git a/meta-oe/recipes-devtools/openocd/openocd/0001-tcl-board-ti_-_swd_native.cfg-Add-support-for-direct.patch b/meta-oe/recipes-devtools/openocd/openocd/0001-tcl-board-ti_-_swd_native.cfg-Add-support-for-direct.patch
new file mode 100644
index 0000000000..8a3b72321f
--- /dev/null
+++ b/meta-oe/recipes-devtools/openocd/openocd/0001-tcl-board-ti_-_swd_native.cfg-Add-support-for-direct.patch
@@ -0,0 +1,77 @@
+From 5c55d79ecfecc4a1b5a5ebcf649227ca1e1bf38e Mon Sep 17 00:00:00 2001
+From: Joao Lima <joao.lima@hbkworld.com>
+Date: Tue, 30 Sep 2025 12:13:04 +0000
+Subject: [PATCH 1/2] tcl/board/ti_*_swd_native.cfg: Add support for direct
+ memory access via SW
+
+Add support for SWD emulation as a transport method for
+direct memory operations of boards TI AM64x and TI J784s4
+
+Upstream-Status: Submitted [http://openocd.zylin.com/#/c/9020/]
+
+Change-Id: I17fe9b2bef5c58886625bfdb88d92645ba4d7da7
+Signed-off-by: Joao Lima <joao.lima@hbkworld.com>
+---
+ tcl/board/ti_am64xx_swd_native.cfg | 23 +++++++++++++++++++++++
+ tcl/board/ti_j784s4_swd_native.cfg | 22 ++++++++++++++++++++++
+ 2 files changed, 45 insertions(+)
+ create mode 100644 tcl/board/ti_am64xx_swd_native.cfg
+ create mode 100644 tcl/board/ti_j784s4_swd_native.cfg
+
+diff --git a/tcl/board/ti_am64xx_swd_native.cfg b/tcl/board/ti_am64xx_swd_native.cfg
+new file mode 100644
+index 000000000..d3727149e
+--- /dev/null
++++ b/tcl/board/ti_am64xx_swd_native.cfg
+@@ -0,0 +1,23 @@
++# SPDX-License-Identifier: GPL-2.0-or-later
++# Copyright (C) 2022-2023 Texas Instruments Incorporated - http://www.ti.com/
++#
++# Texas Instruments am642
++# Link: https://www.ti.com/product/AM642
++#
++# This configuration file is used as a self hosted debug configuration that
++# works on every AM642 platform based on firewall configuration permitted
++# in the system.
++#
++# In this system openOCD runs on one of the CPUs inside AM625 and provides
++# network ports that can then be used to debug the microcontrollers on the
++# SoC - either self hosted IDE OR remotely.
++
++# We are using dmem, which uses dapdirect_swd transport
++adapter driver dmem
++transport select swd
++
++if { ![info exists SOC] } {
++	set SOC am642
++}
++
++source [find target/ti_k3.cfg]
+diff --git a/tcl/board/ti_j784s4_swd_native.cfg b/tcl/board/ti_j784s4_swd_native.cfg
+new file mode 100644
+index 000000000..13b2ac3b8
+--- /dev/null
++++ b/tcl/board/ti_j784s4_swd_native.cfg
+@@ -0,0 +1,22 @@
++# SPDX-License-Identifier: GPL-2.0-or-later
++# Copyright (C) 2022-2023 Texas Instruments Incorporated - http://www.ti.com/
++#
++# Texas Instruments TDA4VM/J721E
++# Link: https://www.ti.com/product/TDA4VM
++#
++# This configuration file is used as a self hosted debug configuration that
++# works on every TDA4VM platform based on firewall configuration permitted
++# in the system.
++#
++# In this system openOCD runs on one of the CPUs inside TDA4VM and provides
++# network ports that can then be used to debug the microcontrollers on the
++# SoC - either self hosted IDE OR remotely.
++
++# We are using dmem, which uses dapdirect_swd transport
++adapter driver dmem
++transport select swd
++
++if { ![info exists SOC] } {
++        set SOC j784s4
++}
++source [find target/ti_k3.cfg]
diff --git a/meta-oe/recipes-devtools/openocd/openocd/0002-tcl-target-ti_k3.cfg-Add-support-for-direct-memory-a.patch b/meta-oe/recipes-devtools/openocd/openocd/0002-tcl-target-ti_k3.cfg-Add-support-for-direct-memory-a.patch
new file mode 100644
index 0000000000..c879696ef5
--- /dev/null
+++ b/meta-oe/recipes-devtools/openocd/openocd/0002-tcl-target-ti_k3.cfg-Add-support-for-direct-memory-a.patch
@@ -0,0 +1,65 @@
+From 39bc4461642eaaf993d0a6cf772d51cdde8c0ae8 Mon Sep 17 00:00:00 2001
+From: Joao Lima <joao.lima@hbkworld.com>
+Date: Tue, 30 Sep 2025 12:13:30 +0000
+Subject: [PATCH 2/2] tcl/target/ti_k3.cfg: Add support for direct memory
+ access via SWD
+
+Adds support for direct memory access via SWD emulation for AM64x and
+J784s4 boards, configuring addresses and parameters required for
+direct memory operations.
+
+Upstream-Status: Submitted [http://openocd.zylin.com/#/c/9021/]
+
+Change-Id: Iebc16612b3990b2ef19ddc4143b66ab1bcbfe0f3
+Signed-off-by: Joao Lima <joao.lima@hbkworld.com>
+---
+ tcl/target/ti_k3.cfg | 22 +++++++++++++++++++++-
+ 1 file changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/tcl/target/ti_k3.cfg b/tcl/target/ti_k3.cfg
+index 0dee74e5e..6b0ac2e52 100644
+--- a/tcl/target/ti_k3.cfg
++++ b/tcl/target/ti_k3.cfg
+@@ -176,6 +176,16 @@ switch $_soc {
+ 			# Uses the same JTAG ID
+ 			set _armv8_cores 0
+ 		}
++
++		# Setup DMEM access descriptions
++		# DAPBUS (Debugger) description
++		set _dmem_base_address 0x740002000
++		set _dmem_ap_address_offset 0x100
++		set _dmem_max_aps 10
++		# Emulated AP description
++		set _dmem_emu_base_address 0x760000000
++		set _dmem_emu_base_address_map_to 0x1d500000
++		set _dmem_emu_ap_list 1
+ 	}
+ 	am625 {
+ 		set _K3_DAP_TAPID 0x0bb7e02f
+@@ -333,7 +343,7 @@ switch $_soc {
+ 		set ARMV8_CTIBASE {0x90420000 0x90520000 0x90620000 0x90720000
+                            0x90820000 0x90920000 0x90a20000 0x90b20000}
+ 
+-		# J721s2 has 4 clusters of 2 R5 cores each.
++		# J784s4 has 4 clusters of 2 R5 cores each.
+ 		set _r5_cores 8
+ 		set R5_DBGBASE {0x9d010000 0x9d012000
+                         0x9d410000 0x9d412000
+@@ -348,6 +358,16 @@ switch $_soc {
+                       main1_r5.0 main1_r5.1
+                       main2_r5.0 main2_r5.1}
+ 
++		# Setup DMEM access descriptions
++		# DAPBUS (Debugger) description
++		set _dmem_base_address 0x4c40002000
++		set _dmem_ap_address_offset 0x100
++		set _dmem_max_aps 8
++		# Emulated AP description
++		set _dmem_emu_base_address 0x4c60000000
++		set _dmem_emu_base_address_map_to 0x1d600000
++		set _dmem_emu_ap_list 1
++
+ 		# sysctrl CTI base
+ 		set CM3_CTIBASE {0x20001000}
+ 		# Sysctrl power-ap unlock offsets
diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 2c07273940..846d2f62c5 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -9,6 +9,8 @@ SRC_URI = " \
     git://repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl;branch=master \
     git://github.com/msteveb/jimtcl.git;protocol=https;destsuffix=git/jimtcl;name=jimtcl;branch=master \
     git://repo.or.cz/r/libjaylink.git;protocol=http;destsuffix=git/src/jtag/drivers/libjaylink;name=libjaylink;branch=master \
+    file://0001-tcl-board-ti_-_swd_native.cfg-Add-support-for-direct.patch \
+    file://0002-tcl-target-ti_k3.cfg-Add-support-for-direct-memory-a.patch \
 "
 
 SRCREV_FORMAT = "openocd"

