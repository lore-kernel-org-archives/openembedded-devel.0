Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DAFDC7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 11:53:59 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.17795.1750679631546922123
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 04:53:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LToVtCdx;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b561a861fso33494061fa.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 04:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750679629; x=1751284429; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jEyztxf7q3X9bpzm5e6yqnRYPyukufwbovXXgJDI5mo=;
        b=LToVtCdx8hbNTLneKZ3R7wG6AgBzAKME8TkQ14HYQyK96LWfVa2EwoA3GwcgDeZybD
         0OA2aSPUA3j0Q9ANFMKqtEHebxX9RuCIFJ00f0x/DU8sIsN7AsdA8HjwFh5yOrU/e30r
         VeGfHMq2LOT/tSy/QJj4PwlPdxuaUU+z5bzMj+SZ78JYU1ffkAT71dJh0ogO60mprpSw
         Rk8moafrEgyoGELe6dgzdpCarVCgynYj2Mtgq8ip9KQbL6PeKDQYQwMVRoL9ZYzDorjB
         mTtV618oWx2iDlsDE+Aj+9eVZ3fP1SzM/lNp5Ov3Pk0MUfUXIn/oZzM1MeOHHwIc/E4N
         Bx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750679629; x=1751284429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jEyztxf7q3X9bpzm5e6yqnRYPyukufwbovXXgJDI5mo=;
        b=SOx0w2DlZKyLylA7CzK2WkNfMATtExrr20cZSINgqWdShtGLpsHfbn533A45TPe7Qj
         pzJ3Yhp4L9hy5SlDwVHb1FEytVtixNzYNGzucMxJH0kC3H8J46LOQWERCuimDeyaX5DA
         lKhBs2oNGGLpysqvu4pot8OEMZWsacsjzFnw0cw6WwbhHAT94aFN+breVewcQcd6Xh2R
         JzXMdTDk47HQRy8vIHyzil1IAoKcTz7QmX4inUxTfRVD7ir1bfDJ5Ghrne2XvlixGDIg
         amZDCblqzERvV8zXjL6oD3UBlMOtO2ZvnZruHBn0YwliKqvfS4h7CABUzydu2xjeJR74
         ohZw==
X-Gm-Message-State: AOJu0YxaWq/G3hh+4A4GPr6rEx7l25nA552P0t/rRsO0paGYxYtmZUJZ
	afxS/NoM8xqQehVtQl1mzUTR0XpmSWw20rS1LLwmYsXEVPLrDy6VT2XFvjwgiw==
X-Gm-Gg: ASbGncuTNpRbzzczUDXQGvVCpGE710Qmkrl9hvRQYtfeZYNu18+ahJOQGk/FRY1ZEY0
	P+yDMu6Ey3YTf9o8cK2u2nqlBpgplzwgKBxSXI8sl4kfg7tWkTX+O1NV5OATItuaGTGT0T3oQaV
	8EnA/FaJyC3gzYXecxF5q85TzP2RYciv+VW0oVEHF7TNKQ+MuWDl718et/7BkMt1fp6xzHBFoC8
	iUfo6THJZyuq2oYysmFDTe7VWr3UBcv6Lmbx5P30WxODxG7xmhSydeAe4Pf2yg7Xr8bAO0uqykp
	ik89iwz5gHZ3/8x/2LUPZdx2BgePVFlcIXPh8dVgXrqheBu2pQu2KSmk5u4+GnkpNnYfMBmSH+2
	7/uM=
X-Google-Smtp-Source: AGHT+IGhPNEcLXU5+IezZ/Y2y2vpwOQoryv3U/+yUAkoX1ptoK8CjzBDSE5caG5VbJqYIyQAPwxfqw==
X-Received: by 2002:a2e:8eca:0:b0:32b:5415:f63f with SMTP id 38308e7fff4ca-32b994213ffmr25699371fa.26.1750679628888;
        Mon, 23 Jun 2025 04:53:48 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.153])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b97fc9446sm12972461fa.47.2025.06.23.04.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 04:53:48 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] wifi-test-suite: Fix compile issue
Date: Mon, 23 Jun 2025 14:53:40 +0300
Message-ID: <20250623115340.124825-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 11:53:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118076

- Variables such as CC, CXX and related variables are usually assigned in core class like gcc.bbclass. For example, CC is assigned this specific value:

CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"

If you use the += operator to add flags to the CC variable early in your recipe, your changes will be overwritten and lost because BitBake applies class assignments to CC at a later stage, which replaces any previous modifications.

We should use :append operation to ensures that additions are applied to the final value, after all assignments from core classes have been processed. As a result, when you want to extend variables that may be set in core classes (like CC in gcc.bbclass), you should use the :append syntax to guarantee your changes are preserved in the final build environment.

- Using CFLAGS is the standard way to pass compiler flag for C projects.

- The Makefile of the project doesn't respect to append to CFLAGS so added 0006-make-CFLAGS-appendable.patch to make CFLAGS appendable.

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 ...oc-Store-return-value-into-location.patch} |  0
 .../files/0006-make-CFLAGS-appendable.patch   | 60 +++++++++++++++++++
 .../wifi-test-suite_10.10.1.bb                |  7 ++-
 3 files changed, 65 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/wifi-test-suite/files/{0001-wfa_cmdproc-Store-return-value-into-location.patch => 0005-wfa_cmdproc-Store-return-value-into-location.patch} (100%)
 create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/files/0006-make-CFLAGS-appendable.patch

diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/files/0001-wfa_cmdproc-Store-return-value-into-location.patch b/meta-oe/recipes-connectivity/wifi-test-suite/files/0005-wfa_cmdproc-Store-return-value-into-location.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/wifi-test-suite/files/0001-wfa_cmdproc-Store-return-value-into-location.patch
rename to meta-oe/recipes-connectivity/wifi-test-suite/files/0005-wfa_cmdproc-Store-return-value-into-location.patch
diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/files/0006-make-CFLAGS-appendable.patch b/meta-oe/recipes-connectivity/wifi-test-suite/files/0006-make-CFLAGS-appendable.patch
new file mode 100644
index 0000000000..ae8d524676
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wifi-test-suite/files/0006-make-CFLAGS-appendable.patch
@@ -0,0 +1,60 @@
+From 8bd7daada85d0a8520b915febe9845432bb35c14 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Mon, 23 Jun 2025 14:20:45 +0300
+Subject: [PATCH] Allow extra CFLAGS via EXTRA_CFLAGS variable
+
+This patch introduces an EXTRA_CFLAGS variable to the Makefile, which is
+appended to CFLAGS. This allows users or external build systems to pass
+their additional compiler flags.
+
+Upstream-Status: Submitted [https://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT/pull/61]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ Makefile.inc | 15 ++++++++-------
+ 1 file changed, 8 insertions(+), 7 deletions(-)
+
+diff --git a/Makefile.inc b/Makefile.inc
+index 0094bdf..76729b9 100644
+--- a/Makefile.inc
++++ b/Makefile.inc
+@@ -22,28 +22,29 @@ UCC=ucc
+ CON=console_src
+ WTG=WTGService
+ MAKE?=make
++EXTRA_CFLAGS ?=
+
+ # This is for WMM-PS
+ #for Ext TG
+-#CFLAGS = -g -O2 -D_REENTRANT -DWFA_WMM_PS_EXT -Wall -I../inc
++#CFLAGS = -g -O2 -D_REENTRANT -DWFA_WMM_PS_EXT -Wall -I../inc ${EXTRA_CFLAGS}
+
+ ## for WMM-AC, WMM-PS, Voice, PMF, TDLS Test-Bed
+-#CFLAGS = -g -O2 -D_REENTRANT  -DWFA_WMM_PS_EXT -DWFA_WMM_AC -DWFA_VOICE_EXT -DWFA_STA_TB -Wall -I../inc
++#CFLAGS = -g -O2 -D_REENTRANT  -DWFA_WMM_PS_EXT -DWFA_WMM_AC -DWFA_VOICE_EXT -DWFA_STA_TB -Wall -I../inc ${EXTRA_CFLAGS}
+
+ ## for WMM-AC, WMM-PS Test-Bed
+-#CFLAGS = -g -O2 -D_REENTRANT  -DWFA_WMM_PS_EXT -DWFA_WMM_AC -DWFA_STA_TB -Wall -I../inc
++#CFLAGS = -g -O2 -D_REENTRANT  -DWFA_WMM_PS_EXT -DWFA_WMM_AC -DWFA_STA_TB -Wall -I../inc ${EXTRA_CFLAGS}
+
+ ## for non-Test-Bed WMM-AC, WMM-PS and Voice
+-#CFLAGS = -g -O2 -D_REENTRANT  -DWFA_WMM_PS_EXT -DWFA_WMM_AC -DWFA_VOICE_EXT -Wall -I../inc
++#CFLAGS = -g -O2 -D_REENTRANT  -DWFA_WMM_PS_EXT -DWFA_WMM_AC -DWFA_VOICE_EXT -Wall -I../inc ${EXTRA_CFLAGS}
+
+ ## for PC-ENDPOINT
+-#CFLAGS = -g -O2 -D_REENTRANT  -DWFA_WMM_PS_EXT -DWFA_WMM_AC -DWFA_VOICE_EXT -DWFA_PC_CONSOLE -Wall -I../inc
++#CFLAGS = -g -O2 -D_REENTRANT  -DWFA_WMM_PS_EXT -DWFA_WMM_AC -DWFA_VOICE_EXT -DWFA_PC_CONSOLE -Wall -I../inc ${EXTRA_CFLAGS}
+
+ ## for PC-ENDPOINT No Voice
+-#CFLAGS = -g -O2 -D_REENTRANT  -DWFA_WMM_PS_EXT -DWFA_WMM_AC -DWFA_PC_CONSOLE -DWFA_STA_TB -Wall -I../inc
++#CFLAGS = -g -O2 -D_REENTRANT  -DWFA_WMM_PS_EXT -DWFA_WMM_AC -DWFA_PC_CONSOLE -DWFA_STA_TB -Wall -I../inc ${EXTRA_CFLAGS}
+
+ # This is for WPA2 as default
+-CFLAGS = -g -O2 -D_REENTRANT -Wall -I../inc
++CFLAGS = -g -O2 -D_REENTRANT -Wall -I../inc ${EXTRA_CFLAGS}
+
+ DUTLIBS = ../lib/libwfa_dut.a -lpthread
+ CALIBS = ../lib/libwfa_ca.a -lpthread
+--
+2.43.0
+
diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.1.bb b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.1.bb
index 9703c10452..357789ad88 100644
--- a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.1.bb
+++ b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.1.bb
@@ -14,7 +14,8 @@ SRC_URI = "git://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT.git;branch=m
 	file://0003-fix-path-to-usr-sbin-for-script-and-make-script-for-.patch \
 	file://0004-run-ranlib-per-library-and-use-AR.patch \
         file://fno-common.patch \
-        file://0001-wfa_cmdproc-Store-return-value-into-location.patch \
+        file://0005-wfa_cmdproc-Store-return-value-into-location.patch \
+        file://0006-make-CFLAGS-appendable.patch \
 "
 
 # to avoid host path QA error
@@ -41,4 +42,6 @@ RDEPENDS:${PN} = "wpa-supplicant"
 # http://errors.yoctoproject.org/Errors/Details/766893/
 # wfa_cmdproc.c:467:68: error: passing argument 3 of 'strtok_r' from incompatible pointer type [-Wincompatible-pointer-types]
 # wfa_cs.c:4175:57: error: initialization of 'caStaGetEventDetails_t *' {aka 'struct ca_sta_get_event_details *'} from incompatible pointer type 'caStaMngServ_t *' {aka 'struct ca_sta_manage_service *'} [-Wincompatible-pointer-types]
-CC += "-Wno-error=incompatible-pointer-types"
+CFLAGS += "-Wno-error=incompatible-pointer-types"
+
+export EXTRA_CFLAGS = "${CFLAGS}"
-- 
2.43.0


