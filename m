Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05998CCA471
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 09:36:11 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.12424.1759309000013964971
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 01:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rywg+dWO;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: joao.raul.434@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3fa528f127fso615549f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 01:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759308998; x=1759913798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GnR/9GLFCMdQv1cUqzM4QFVhxyHwZKCQZ7byKLM7E90=;
        b=Rywg+dWOyD6uTP9mlTXuVRfzbyc2UOeSmE4ZPWnfl0f/+E0Qk2XCR/v1oI79NUgjdq
         s7+3etKKcX32I8CSjwnlq6mk7WwTvlj8KEdEXr6lCptvjbehsJi7PycQmVjCrWyt8ztV
         B3cjDlGZT2+wXNAl0OUm+OBFFPWYCUgoYclAXtntJ9fMIro2fw/xRP6r6ASyDdVl2x/D
         K4Qm+RNY4zC8VtdfTOgktvVgRDp6k45rgRjIhMF8ol/iRXvfPAfpO998e18jGR//gQSM
         miWITO4EotyTfMVvhz8PU6kfSiFbqRSnFI6bDYXX5rpRCpOp61bnZNS+qsf6bq2XTOPq
         oiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759308998; x=1759913798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GnR/9GLFCMdQv1cUqzM4QFVhxyHwZKCQZ7byKLM7E90=;
        b=TyI9q/fCDmk5lmNGHN2mqMIAlQhnE+v7gVumvgiRZOFIYqlsizxalLr//6Q4A2pQun
         Awss4h085hFwfZMv1r1xi8gtoc28olC7kE/v+p4q2TYnml4qx/WnyRTiYbjwZa0B7BCM
         HFXsUOUc5qWejBhLaAF0mSWADzsroffsW2TUI3311mivO+9v1YC1frkjCusNPYy7hIlb
         HVrXbiAfbKuI/VHkxHGU67+v5mCXXHaQtr8iHJEBrRHfxaOtc2ODbO+O3mBEgtmn6fAx
         XiYFHSqq+QNtGvtNGfzC4k2Sfh+YNHDy/uy3lAonRMAVokypmx99EvISg1QwO5D83a8O
         MBcg==
X-Forwarded-Encrypted: i=1; AJvYcCUhLRDYKLSiXhnG7jVQNhvpV4bogSpRuNXajeAJV/oVaWKviV3FUCx9LrECCnl4nAFrbGhRAVPihZnnX6mSQUONC3c=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx/A7n+wr8BZvKlJPaIVpu09v8oC3srBENQkpeetCBxOg6KeAjD
	iDFCT/sgjijfgMoxHHIjuUez2zQAruR3P62LciPvzoQrOd1yY4tVUIYV
X-Gm-Gg: ASbGnctF5nQYoS8S1j9XfcCp3ZutSgDZvcrPt+kpKr1xWY9GVRQmSeX45XRw0pW4pPc
	GkHPxO4b8h+cbRUxGtRuZY1XoX0yv0lL2nRr3g7HRetTh85PEiGm+SqmpaOEWH9hp7WI2voZHnu
	+OgXiU12hoRi+EkOTP3OKUcqYVR0Ul0ytVvbYkKjBqSR5Q7Yzr4DLXM9Iq9QK/AYss0HEdfK37I
	dRFhKTZU7eGlkOyQ5gDJdNn8SCPp9XVfPzRBGl1GzOQO8CYzXH3Zk9QV9JoA5oypKFWCyKTsTjT
	/XiPhaQRhH1yw5JqNrvT9+GpmJp9S1A0QN/hvFQEOPz5QEZBZK1Q7idi7qN804hYsZBCbdMQuOk
	njej4Sk6a5o+l3+OBYYZOGvqtqfR5HTYN9e6uSlxoXNPFfLCDl1otDyhlK3y4Ydy8ezxKlGjSd+
	iI3pio8sl0cNXDfLBpDB8bjbl40/wk4ZJ1Luml297mcNaqpA==
X-Google-Smtp-Source: AGHT+IFs/iBRzov09L7Zf3fpCWSrfTX6kGLFAAOS2RUmSInQOjRbESa2A05aoW6x6Iif+EIvFzkL5Q==
X-Received: by 2002:a05:6000:2203:b0:414:fb6c:e36f with SMTP id ffacd0b85a97d-4240c451990mr6221023f8f.0.1759308998225;
        Wed, 01 Oct 2025 01:56:38 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5b63b407sm33091645e9.2.2025.10.01.01.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 01:56:37 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: ivitro@gmail.com,
	openembedded-devel@lists.openembedded.org
Cc: Joao Lima <joao.lima@hbkworld.com>,
	raj.khem@gmail.com
Subject: [meta-oe][PATCH 2/3] openocd: add dmem support to am64xx and j784s4 platforms
Date: Wed,  1 Oct 2025 09:56:33 +0100
Message-ID: <20251001085634.1806-1-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 09:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120095

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

