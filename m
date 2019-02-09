Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9283C7C5C8
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Feb 2019 19:04:54 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id c123so3240974pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Feb 2019 11:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UEqjaERqb9tzCDbshmLIXq7oosahGqo5ZMk45lW7SW0=;
	b=E+lxWpzK1XtLYhJC0BMij6a2QpYZZ5Y8AFya6h7SK1u35fLbx34AgoBIKpgFqOLRI3
	/pxaa/Rto1gtN1VX/5+4/Q5INF9LCdQL8J3gohFP8uTYMStQ8Q6udvmMSJ4adXdESu9C
	3P+8BDp9FgUyUS2jHx62HMslJzurq8WcXETHMng6zzjUkSVrb80xQCx1EIU1AogRH+fQ
	QeoVGChtKVcvDBivHmu4JKVsJ3ljlRTOOdhPmO8NTB8mGgo7IczvOw0mZpcEY68IPSXC
	8K+QMFVIBwCFtoY8QwauNESG35iHxcChw/OWOBCPnkWMkb7zK+m0geGGrWJFj/0cyp2d
	mhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UEqjaERqb9tzCDbshmLIXq7oosahGqo5ZMk45lW7SW0=;
	b=d8o3hExIPAnyp/6IHbLzylEst+jhzRsTfssvpfQsVEnQeiZfB5XQ/FhfYhS/ynTxFZ
	1+DvgKc9YNJkrQ8ilDVAQNSm8FaCXibS9lU1QNdm3+wsjNd+UxOK8T6JcsL/Ay7eD/lm
	5dnWxewEr+JbsRXNiRdtV70dle6jhVPPUCQ94E1reHl/diVaoNvd2F7Ag+WQroTonN4T
	cVpiAPqYGkwALv9DqdsboBlasvr2Crrp4hnoQGO2xBwYurN0U6arD+zrFI4KuLofOFLV
	83C48yB0/5KCJmgMsa5Ybkdc+1lrIyNxglnwmxGAHxUr6FPQEJFvkYU0EW16uIROmtNe
	lUMw==
X-Gm-Message-State: AHQUAuZIpGywlo13+JpEgirexmCo1Fw01f8byr19P/yOdUuKU9uGPTgT
	LNmaLW3EexMPCf1xWy6rMpQ8/tBe
X-Google-Smtp-Source: AHgI3IaeWC0MrKfGIqfcieAc0o+tMaG8uTpfRLzk3yEplcWpVE73OO9oTmLZfho8zXYVLtybwFapsQ==
X-Received: by 2002:a62:62c5:: with SMTP id
	w188mr29100803pfb.160.1549739095090; 
	Sat, 09 Feb 2019 11:04:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dc44])
	by smtp.gmail.com with ESMTPSA id
	e21sm27709493pfh.45.2019.02.09.11.04.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Feb 2019 11:04:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Feb 2019 11:04:46 -0800
Message-Id: <20190209190447.23092-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] wifi-test-suite: Fix build with LTO
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Feb 2019 19:04:54 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...04-run-ranlib-per-library-and-use-AR.patch | 38 +++++++++++++++++++
 .../wifi-test-suite/wifi-test-suite_git.bb    |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/files/0004-run-ranlib-per-library-and-use-AR.patch

diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/files/0004-run-ranlib-per-library-and-use-AR.patch b/meta-oe/recipes-connectivity/wifi-test-suite/files/0004-run-ranlib-per-library-and-use-AR.patch
new file mode 100644
index 0000000000..40af48970f
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wifi-test-suite/files/0004-run-ranlib-per-library-and-use-AR.patch
@@ -0,0 +1,38 @@
+From cca2f9901fb4fdcdd49066fe434eae512964143f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 9 Feb 2019 07:59:47 -0800
+Subject: [PATCH 4/4] run ranlib per library and use AR
+
+Use AR variable to invoke archiver instead of hardcoding, helps cross
+compile
+
+compiler ranlib e.g. llvm-ranlib fails to operate on multiple archives
+on single invocation
+
+fixes errors like
+arm-yoe-linux-musleabi-llvm-ranlib: error: Exactly one archive should be specified.
+
+Upstream-Status: Submitted [https://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT/pull/47]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/Makefile | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/Makefile b/lib/Makefile
+index 299b8d6..5fca322 100644
+--- a/lib/Makefile
++++ b/lib/Makefile
+@@ -20,7 +20,9 @@ all:    ${LIB_OBJS}
+ 		$(AR) crv ${LIBWFA_NAME} $?
+ 		$(AR) crv ${LIBWFA_NAME_DUT} ${LIB_OBJS_DUT}
+ 		$(AR) crv ${LIBWFA_NAME_CA} ${LIB_OBJS_CA}
+-		${RANLIB} ${LIBWFA_NAME} ${LIBWFA_NAME_DUT} ${LIBWFA_NAME_CA}
++		${RANLIB} ${LIBWFA_NAME}
++		${RANLIB} ${LIBWFA_NAME_DUT}
++		${RANLIB} ${LIBWFA_NAME_CA}
+ 
+ wfa_tg.o: wfa_tg.c ../inc/wfa_agt.h ../inc/wfa_types.h ../inc/wfa_rsp.h ../inc/wfa_tlv.h  ../inc/wfa_tg.h
+ 
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
index b866c55b36..99cfb32051 100644
--- a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
+++ b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT.git \
 	file://0001-Use-toolchain-from-environment-variables.patch \
 	file://0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch \
 	file://0003-fix-path-to-usr-sbin-for-script-and-make-script-for-.patch \
+	file://0004-run-ranlib-per-library-and-use-AR.patch \
 "
 
 # to avoid host path QA error
-- 
2.20.1


