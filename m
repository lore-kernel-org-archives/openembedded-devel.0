Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0915EC77B7F
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 12:56:30 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.18921.1750683380858832529
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 05:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mN1Eb/EE;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32b7113ed6bso41282261fa.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 05:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750683379; x=1751288179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wnFiH63AO1KMoBHkvxKiSQACGct0q40L9yVm7nE+L9Q=;
        b=mN1Eb/EEi84fJh5VsWM+gej9Gytm3HY2R7okmLaqr9UsKy39MXnXP/FZZ1Cyg7KkRT
         yO6DQs3KcAcCmsOD1pouOMh3bDgQOLqdNgxV8q5joeB1HcwIiyJQ5i5suH86EVFV59ro
         YxgmH6OFd2elyczslvnQzMh51mWTieGtsnS6VvZjCgOa89Kt7mzT8fsswR/ObHNqwNsJ
         GMbQ1rB4qvGZfj7fiKGIFc+nhCqt/zFG/4N8CyV98KZopwyz39z9OAqD+q7KOxg/s2tP
         RgmkA/tb5Sl7hx+YJH5jleMYEuQJNqU2OBwU9o8Q5sFwgDc7f7gmYimepa/I2SoNKooB
         GPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750683379; x=1751288179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wnFiH63AO1KMoBHkvxKiSQACGct0q40L9yVm7nE+L9Q=;
        b=CYErDPV7ZiHHLCDscYQvsarLGBoWxijE9kKTR62RLHpbYaQADrEYb7rRY6qG040W8a
         pxpTgdc48MFD99b9AWM8NOPLqeeH82/BWUxaH7WfbxR1gtSE+ZzvmYD/N7ayUfmRn3d5
         U4JlKyl0SkKt/VbjN0kmjZxVmi36S7CUguMX7Lxiq27o8D2usd4Ol93DbDZQ1G8vvl4p
         mTUhl/TiJ7Z6Nf65mc2+kSXr2NQTJ4HdvU4gTMk5EKDGNbetZWBVh44cDql1EWgQ7xSa
         jmM+o155s+C33Fi5guO8AEAF1hgV2hdQ5fV89eUmpP/y93LQG1ruzQp1RXFBN278j2B7
         yMEg==
X-Gm-Message-State: AOJu0Yx7rENLyHvXxgMrkCawzroC95O9TO9QOyvP/uqXt+FEa//Zkd42
	98r5QZMjzHZ5hSxSZMVGZeQnKqW2OBYHjCA69Tj3OvwoXU4yi9RefpB1bEU5tw==
X-Gm-Gg: ASbGncsJFZkfNMsJTS5lIuiW1jHGWzLVAvnVAx3PCbpoV+owjWZhRxGvIqWSf5TQigl
	sd1jNckt41lxuUnj4AULSmQ58cYKW0pOuJ70wiadu9DCBPmHYzZV/ctmwYfqpN9eEDwJOKWnnC1
	QxVt0/4inm+GInR2Qhk8bEvG6M4aOYoLvS+FRhYqkfUh703J+NoASDraYd3PGtIBZrZ1kTi0pH2
	g9122/zf5dlCKod0S+4YEa44WzBDKsu9WzFFnIYjQh8ygrVAK2xtEJqMnOwiP/N4DoCZOulkmBu
	YBUzNaSFTpXEWs53/Y8fSsxKQbNBGQFfSzFeEYu7sP8fXch60YYT7/HeCMyEHHyStCyKEiu4Fkw
	ZUY2mbzQiFuRr9Q==
X-Google-Smtp-Source: AGHT+IG0ovDMsIHTj2QhFss2JPwTQsnhj6bbSWFkFvSKqenxunQKuB+C9JJ4Gv5E2PDA1r4Um6Vqgg==
X-Received: by 2002:a05:651c:400d:b0:32b:50d8:f122 with SMTP id 38308e7fff4ca-32b9906980fmr22685581fa.40.1750683378169;
        Mon, 23 Jun 2025 05:56:18 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.153])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980dc32bsm12569721fa.94.2025.06.23.05.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 05:56:17 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCHv2] wifi-test-suite: Fix compile issue
Date: Mon, 23 Jun 2025 15:56:08 +0300
Message-ID: <20250623125608.152348-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 12:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118078

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
index 0000000000..9d20403866
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wifi-test-suite/files/0006-make-CFLAGS-appendable.patch
@@ -0,0 +1,60 @@
+From ef4ead927f69452c95b80e5bf042f67897f67e9d Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Mon, 23 Jun 2025 15:46:37 +0300
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


