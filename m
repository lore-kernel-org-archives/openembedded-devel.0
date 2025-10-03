Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADBBCCD183
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 10:19:09 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.4029.1759485730968651163
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Oct 2025 03:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PNiJ4AeH;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: joao.raul.434@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e47cca387so21840105e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 03:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759485729; x=1760090529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8U0aQ15vLgPkSwqXeS1zGBEbhREg29oNvbIZxzJXAo=;
        b=PNiJ4AeHmas7aKqzfNId6t0u2pkalAV5CtKgYKQei6Wze+4+KstNCpTdprzd2+XShf
         kA1dOD0LmKtCTKvEMh2YrHCqnYkrW7rz7U60tOHiukjYVFm82OCR5NnwLGgXZn7LHPPR
         vsZyN5M2AZdRZrEQFNUaGWfH08b7Kul0DSX9g+U/1qlx2udOa3p9zkyDbP/mcBVgI+WH
         o06KIfkoU6rvj4u0pUNHvlGN1SxRrYwxRL36PJrCs4lFlHZIoWlyxlC+1qpWpm4xvvW7
         GOCzX2m9dPGf6xKKNnXx2uf4iZlFom+uzFkduiIRmtpn4+ikMHEZHS6FNsVwN2yeXScd
         vWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759485729; x=1760090529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8U0aQ15vLgPkSwqXeS1zGBEbhREg29oNvbIZxzJXAo=;
        b=a3vB23iHBw9zfTA8pekkacrKv8GljtRu41GIkPplXqHUif4Ul4myLL7nWwkcg/XzbI
         9gh4Nbw+gsFOCwFAsd3jjMeFj+CBn4qtZy8CCQJjuQgMif4qiAyIsEjd2PDSLWlkj34C
         ulA7+0j08XBdjJZi3MffMbhBRUDnAuRv9LMyqF9U14kfxGg11FxhZ0V6BnQsZMdWduSI
         LPCrnhJHu9dzgnlHvjgkmQS3DMOOEik+sxBlaIjRk/QOKdqZcnVfcTL0ghKYbgZTV/vI
         4QVpAjpTUfU25EHa1wJth4IIYA4RcHi97RjOsS+Wb4IKURgO9XbfusiS1plFvzrIdJgb
         p1dw==
X-Gm-Message-State: AOJu0Yw3e1VItAjoafG0UueR8W+bfUeJILqLv3UXjsOLCi33OxFJ5NBe
	mRGhHQJaoaSWFmGSSAIOV9qRJ9MbVMOKpRNm5MWEp95o9EmoXs9PGNCkugTMeGwM
X-Gm-Gg: ASbGncvSC4s6+Etqmgv/VOCKWLbhTkYcUTZdxZnXXrEtjY/9cLLVzxdFxke19eOfGxc
	H4tS4nGSVfWCzAjNLxROjJKhw5LFP6LQEdVoKQE3kl2szYkddrXg1yXmCYzpzF0evz4AZdQr0XA
	cpHDA9fPCUR/Oj03nDvP36JjLQSy9D7Df/nMp/WQL+JM6Tyi0abWlXW0iMmYme0T2oUc4g4rqCu
	MXyDqd7cy6O0oLYWZUrUf5/1sRmOuxodj8PFcHNVtm7FPkX20LXUtFAxikpwgRqSXFBLEiyzYUN
	WMIVQjCYf6dqF7e8oKZAlgMNWHWdGpOgEtn3hwOFPMlZWkbZN+ph4agtALnkmxCXm+NR+7r4j4j
	jnDR087ZGiadO8/K+rjrm48fPhckfLysAT4tvbqpAIY7bD3b1jurhGkBvU6l6Rkz/Rc9CQl/JFp
	I6j0hgYAGJmCWN8sq1SXCgwAtXHnYfsYfl60Mseag+8GNktA==
X-Google-Smtp-Source: AGHT+IF9MsCYvsqeEx1fsKPwTEPa4R04VCK9FHeC/SaMOK0w0IiD3XWXmg1a8dUYCRebNpWJKprBFQ==
X-Received: by 2002:a05:600c:3f08:b0:45f:2cb5:ecff with SMTP id 5b1f17b1804b1-46e711536b9mr15024935e9.31.1759485728834;
        Fri, 03 Oct 2025 03:02:08 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e723624b3sm23352645e9.17.2025.10.03.03.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 03:02:08 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: joao.lima@hbkworld.com
Subject: [meta-oe][PATCH 2/2] openocd: add dmem support to am64xx and j784s4 platforms
Date: Fri,  3 Oct 2025 11:00:48 +0100
Message-ID: <20251003100049.1695-3-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20251003100049.1695-1-joao.lima@hbkworld.com>
References: <20251003100049.1695-1-joao.lima@hbkworld.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 10:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120216

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
index 3b7705c41d..ce1389b060 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -10,6 +10,8 @@ SRC_URI = " \
     git://github.com/msteveb/jimtcl.git;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/jimtcl;name=jimtcl;branch=master \
     git://repo.or.cz/r/libjaylink.git;protocol=http;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/src/jtag/drivers/libjaylink;name=libjaylink;branch=master \
     file://0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch \
+    file://0001-tcl-board-ti_-_swd_native.cfg-Add-support-for-direct.patch \
+    file://0002-tcl-target-ti_k3.cfg-Add-support-for-direct-memory-a.patch \
 "
 
 SRCREV_FORMAT = "openocd"

