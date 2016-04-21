Return-Path: <koen.kooi@linaro.org>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id BC58465CC3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Apr 2016 13:12:07 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id u206so131887796wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Apr 2016 06:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=BrMFGrPgH2OHws1CS5xevkOn3QvovZhkjC0Qx0I5MBs=;
	b=djb/p0xCZbrwHq/DkTHBAp1FHwBXekhzq8c478P7ZIbNd/nQEwPOKnblSi3i+ytrDN
	1rz5m1qgzkEkttFkWwrzsPnDSt+DBCLnD36yIVKLHq9/CIWdYzWu/VH6tKPNkMrv7kSh
	jp+9J5GGBWEFL+RIctoDPB0e5mzWP5aZaC4qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BrMFGrPgH2OHws1CS5xevkOn3QvovZhkjC0Qx0I5MBs=;
	b=JtyxO5s7JeFQjWNt7WEPxQR2lDm3LJUVK1O2tPUSzczIJfMRbYgjG1etJVKiMDjQ1U
	nOFlxFhOu36Blj/+JdYChTjv/GinTMciSjwUBZgFNVe5LT1JKLRu6lOYqQj2A+30/q5K
	NaLs79DDlieVdPElFS9XgGZypcAZW+QTcIwDPZ+vjWQeBr8TGnRZqrT9QnCV19aE02QG
	DGqbYg/jz8oS4xhqVFvVeHEq1PtBJQ8YN/z5k+CbU6alWI44NJD6gXMlrIZjtTAE9TsP
	AMckoO1sJ2HyRa7DwNGUMZNQF4/Ca/bC9T6Ym2G+OzzKfuKaFD4ntF8OkQ9C4Iwtkh1I
	WICg==
X-Gm-Message-State: AOPr4FUdVf7KZZMLO8VudDTwj80sWj+1B0PFln5T8/W04aQwCw891kZeJ9j5WRb7V8iQkQwJ
X-Received: by 10.194.175.36 with SMTP id bx4mr2388986wjc.35.1461244327732;
	Thu, 21 Apr 2016 06:12:07 -0700 (PDT)
Received: from thinkpad.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174]) by smtp.gmail.com with ESMTPSA id
	jp2sm2819008wjc.16.2016.04.21.06.12.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Apr 2016 06:12:06 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Apr 2016 15:12:00 +0200
Message-Id: <1461244320-4304-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.4.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] mozjs: fix armeb builds
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
X-List-Received-Date: Thu, 21 Apr 2016 13:12:09 -0000

The mozjs builds fails on armeb, so add a define to make it work.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 ...0001-add-support-for-big-endian-32bit-ARM.patch | 26 ++++++++++++++++++++++
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0001-add-support-for-big-endian-32bit-ARM.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-add-support-for-big-endian-32bit-ARM.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-add-support-for-big-endian-32bit-ARM.patch
new file mode 100644
index 0000000..7b7038f
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-add-support-for-big-endian-32bit-ARM.patch
@@ -0,0 +1,26 @@
+From 07830cbc409f8e998fa839275470031fc83d6eb6 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen.kooi@linaro.org>
+Date: Thu, 21 Apr 2016 14:10:54 +0200
+Subject: [PATCH] add support for big endian 32bit ARM
+
+Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
+---
+ mfbt/double-conversion/utils.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mfbt/double-conversion/utils.h b/mfbt/double-conversion/utils.h
+index fe26dab..78a19cb 100644
+--- a/mfbt/double-conversion/utils.h
++++ b/mfbt/double-conversion/utils.h
+@@ -58,7 +58,7 @@
+     defined(__mips__) || defined(__powerpc__) || \
+     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
+     defined(__SH4__) || defined(__alpha__) || \
+-    defined(__aarch64__) || \
++    defined(__aarch64__) || defined(__ARMEB__) || \
+     defined(_MIPS_ARCH_MIPS32R2)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
+-- 
+2.4.3
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index be4b50b..cab6dd5 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -14,6 +14,7 @@ SRC_URI = " \
     file://fix-the-compile-error-of-powerpc64.patch;patchdir=../../ \
     file://fix_milestone_compile_issue.patch \
     file://0010-fix-cross-compilation-on-i586-targets.patch;patchdir=../../ \
+    file://0001-add-support-for-big-endian-32bit-ARM.patch;patchdir=../../ \
   "
 
 SRC_URI[md5sum] = "20b6f8f1140ef6e47daa3b16965c9202"
-- 
2.4.3


