Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.12569.1597383433325220691
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 22:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n8Adynzu;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id x25so4021083pff.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 22:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kpUkZ0usTTuWq4R+D7yCknDTYGyZr19ZbfESNiA20mc=;
        b=n8AdynzuSdQIOZKuvvBspEYXuHhLQKZnh3p8kt62MIVX+zc6gA35rs5Nw8U+sHurFb
         EkZbVwyzMYxKEGuNCj/oTczPWbBLuce+XtLz073jpCVcN4k8lccGTCGrUnPOocJbXW67
         IlnyTHJ7Z2hhuB0eihGG+sIII81W2DPFFJWR9VGnsXuG7QDnjfJsbZN1LTzcucCnazIJ
         5kuUIqFS8auUxbSHVghl9o7sv86KJHrbsNmOZwpEPyvh5Ks4n5GGj51aKr4cfLXHYQh6
         69luoSjWY5yaeo+Om+V7P8szsURs0f/m8zSNZ7R4Oh1ihjc2n4uCqFrBqzyi6lEyBxYb
         pNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kpUkZ0usTTuWq4R+D7yCknDTYGyZr19ZbfESNiA20mc=;
        b=fT9ps/s3H2Recx41PrDMyo6eV0F8XknVo2HZol8lCirUJGwVB6gkszizyJUIIo8cJV
         KuSEZauC5C5wSQvZSwadP78fuNHf1dBhYfY6bfCxs4IW+prWJxJJNH+qgBvgnR7NMgnE
         8cedhKdl8F/bCqsb4mX8uqpRBp0fMatIDAIqJidDZcij93VImlbY8fSHQMPYchUjtTiX
         9w1Yaq+TNl9jqgxYjFqOob5ETHXxSZV5h/cNBO97oHB1H7vmQ+ZpdvCTmt7tAAs3dytv
         kI0PbcjJzsTiwfJylTv23QeFLKOu2hftCOiEoL1GNNSSU5Xo4a/iOyHtO6oJZ/4wlhhQ
         +tPw==
X-Gm-Message-State: AOAM5333wgXoBwP5YHtLvWRtxhT8U0kro/cFCs5d4gfuNWQfw2KiRi5P
	WyrRBYJLkkud+EUHU385Z8R2YaCEELFc1w==
X-Google-Smtp-Source: ABdhPJxRpJhW14I1h/cdbij23w+jITEmkZ//FFzqsSBMzRKb3gRYqydZL8M3Ehta8wCHBxBSVa9mpw==
X-Received: by 2002:a65:6650:: with SMTP id z16mr762347pgv.161.1597383432432;
        Thu, 13 Aug 2020 22:37:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id k21sm7013974pgl.0.2020.08.13.22.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 22:37:11 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 13/21] wifi-test-suite: Update to latest tip
Date: Thu, 13 Aug 2020 22:36:49 -0700
Message-Id: <20200814053657.1701247-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814053657.1701247-1-raj.khem@gmail.com>
References: <20200814053657.1701247-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix build with gcc10/-fno-common

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../wifi-test-suite/files/fno-common.patch    | 29 +++++++++++++++++++
 .../wifi-test-suite/wifi-test-suite_git.bb    |  3 +-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/files/fno-common.patch

diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/files/fno-common.patch b/meta-oe/recipes-connectivity/wifi-test-suite/files/fno-common.patch
new file mode 100644
index 0000000000..fc5e2e99c5
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wifi-test-suite/files/fno-common.patch
@@ -0,0 +1,29 @@
+Mark extern variables with 'extern' keyword
+
+This ensures that compilers with -fno-common does not generate multiple definitions
+
+Upstream-Status: Pending
+Signedd-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/lib/wfa_cs.c
++++ b/lib/wfa_cs.c
+@@ -71,7 +71,7 @@ int wfaExecuteCLI(char *CLI);
+ 
+ /* Since the two definitions are used all over the CA function */
+ char gCmdStr[WFA_CMD_STR_SZ];
+-dutCmdResponse_t gGenericResp;
++extern dutCmdResponse_t gGenericResp;
+ int wfaTGSetPrio(int sockfd, int tgClass);
+ void create_apts_msg(int msg, unsigned int txbuf[],int id);
+ 
+--- a/lib/wfa_thr.c
++++ b/lib/wfa_thr.c
+@@ -41,7 +41,7 @@
+ /*
+  * external global thread sync variables
+  */
+-tgWMM_t wmm_thr[WFA_THREADS_NUM];
++extern tgWMM_t wmm_thr[WFA_THREADS_NUM];
+ extern int resetsnd;
+ extern int resetrcv;
+ extern int newCmdOn;
diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
index 99cfb32051..cb39f5a0e1 100644
--- a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
+++ b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
@@ -8,12 +8,13 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0542427ed5c315ca34aa09ae7a85ed32"
 SECTION = "test"
 
 S = "${WORKDIR}/git"
-SRCREV = "f7a8d7ef7d1a831c1bb47de21fa083536ea2f3a9"
+SRCREV = "2da947374c8324f88a0e2155aeba4cf75464b0d8"
 SRC_URI = "git://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT.git \
 	file://0001-Use-toolchain-from-environment-variables.patch \
 	file://0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch \
 	file://0003-fix-path-to-usr-sbin-for-script-and-make-script-for-.patch \
 	file://0004-run-ranlib-per-library-and-use-AR.patch \
+        file://fno-common.patch \
 "
 
 # to avoid host path QA error
-- 
2.28.0

