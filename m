Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360EDF589BB
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:49:15 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18662.1776948554235133730
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gXM0Fsjd;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2aaf43014d0so40881105ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 05:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948553; x=1777553353; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBD9IdsgYyHPzCXaQWn2ffgyB68AQMZgTAwTCERjmNE=;
        b=gXM0FsjdFhYVtYDJaB5kWdWzMSnattssmx8Gb3zgmQyn+EZPSyqBf0vpYvlV3uhzKq
         sw7gMY66AfLWG5O1n2LuLkn0Ej0FjyPiZGoQKJQOqLqHSQxmy5LRgBa7bHfTqQHfRClv
         C65MoA/bD/OaCo/T3DldKAeWZV1GbrFKe3l2QvP7ZZYaoLSgzgnTHrtkj9I5ZmAyDncF
         8quYx8znqHt4GjPOvVAuaYVV5qHM12BMHCgVS7l+koSB7nk05j+mS21v/jyZX75fHPjQ
         tm/l+aNpYfYcs9rHnzw7CYwIMqH6zYkZv0mzNBLE4L+IERITNDCPXA7hF53fgffXyczP
         eO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948553; x=1777553353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HBD9IdsgYyHPzCXaQWn2ffgyB68AQMZgTAwTCERjmNE=;
        b=crEr2pv0zUGliGMQidB1CKP0mrUAKk2X3sKpSvxUm65EIL2cJVFuSOW9ZQHvjn3QCB
         /1Yj+o85hZrt4O18CEvrLZIIpa5C9gJwI6FvXz6wn8HYOn/kQzPxCCJeIdEBHnlQJpKw
         VFk9bFU2PYCljgEQZ27eYkK8ekgXbhrYNH5VrfHJ6Bci1zkctMhGg9LS61WqH3bu00BE
         ju4t3mmnZOL9Et/xRgZMCmFwmVBuiYTrbarQfpzNg345Fi6f8I70XfC6NxYB9BpzZuaH
         WPgMMVENN7pZaJP1Za4pLS956tGgVkSXzizzfVWbdIiGDOjDT2Hk025ykm+fUUga5ZP+
         mHWA==
X-Gm-Message-State: AOJu0YyUY1YZIT0DUxLWwFOBVMKZUl+Rkck9IO/hmVGUPucVezb//Afz
	8Z4mEv8yoME/FBThrMZt5BE2pinpNxYGMnLT4xl4zzNLpIAB+akFIedxN/XbUGXj
X-Gm-Gg: AeBDiesLnqfhoil4lNFbkLZWt5xLGH6IX5/+SEGgoxwWmdgPDaqhOp1b7OsWyb6HKyX
	1EW62OtctQpZnNq+kHYoVeQyBpbCK+ag2cJgpbQ5Xs3fTP5lzyIkrGRE4vy6ZJVd/Q6ZFxgkfV+
	aXBDbMiLysHi9GhgnZmuXH2o0hBD3xSU9esTFNGPgFCN/jQOb1+EYj+Q+9rIYweESokRokvIRDm
	Zmq7/seIM2FvZwBDtJBTUBolJRPmm0Q116wh2bgjrzXllaRs5mpo6Hb95fVWv3R/O2je09jxd4g
	fwrnq2OdVUus6KNWMOS77RjZBeubeI0P51zD5wMAYDAt+G3MniTd8EE7uyZfN6YnnhkOC4ipDbH
	u+ezGrcnrr+LfxD38YsINIK62fLdHLUhWImClSUtvVJZVdUqfB/oObjpQfKxcUu60dSJCaWrazA
	+sZ9pr4zjKWdHAoemqF2ajTzIE/fNnYb+xEFutQYe/KAhmPEw=
X-Received: by 2002:a17:902:b493:b0:2b0:c451:ae8a with SMTP id d9443c01a7336-2b5f9eaf437mr183377475ad.13.1776948553440;
        Thu, 23 Apr 2026 05:49:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa14487sm204043415ad.18.2026.04.23.05.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:49:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 6/19] lcms: patch CVE-2026-41254
Date: Fri, 24 Apr 2026 00:48:04 +1200
Message-ID: <20260423124823.1983261-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
References: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 12:49:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126582

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-41254

Backport the patches referenced by the NVD advisory.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../lcms/lcms/CVE-2026-41254_1.patch          | 30 ++++++++++++++++
 .../lcms/lcms/CVE-2026-41254_2.patch          | 36 +++++++++++++++++++
 meta-oe/recipes-support/lcms/lcms_2.16.bb     |  5 ++-
 3 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_1.patch
 create mode 100644 meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_2.patch

diff --git a/meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_1.patch b/meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_1.patch
new file mode 100644
index 0000000000..7bf46706e5
--- /dev/null
+++ b/meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_1.patch
@@ -0,0 +1,30 @@
+From 524f3df7511b49543a65a7de2a08640777c1b29c Mon Sep 17 00:00:00 2001
+From: Marti Maria <marti.maria@littlecms.com>
+Date: Thu, 19 Feb 2026 09:07:20 +0100
+Subject: [PATCH] Fix integer overflow in CubeSize()
+
+Thanks to @zerojackyi for reporting
+
+(cherry picked from commit da6110b1d14abc394633a388209abd5ebedd7ab0)
+
+CVE: CVE-2026-41254
+Upstream-Status: Backport [https://github.com/mm2/Little-CMS/commit/da6110b1d14abc394633a388209abd5ebedd7ab0]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/cmslut.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/cmslut.c b/src/cmslut.c
+index 1ea61a8..3488d0c 100644
+--- a/src/cmslut.c
++++ b/src/cmslut.c
+@@ -460,7 +460,8 @@ void EvaluateCLUTfloatIn16(const cmsFloat32Number In[], cmsFloat32Number Out[],
+ static
+ cmsUInt32Number CubeSize(const cmsUInt32Number Dims[], cmsUInt32Number b)
+ {
+-    cmsUInt32Number rv, dim;
++    cmsUInt32Number dim;
++    cmsUInt64Number rv;
+ 
+     _cmsAssert(Dims != NULL);
+ 
diff --git a/meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_2.patch b/meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_2.patch
new file mode 100644
index 0000000000..0602258ef5
--- /dev/null
+++ b/meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_2.patch
@@ -0,0 +1,36 @@
+From 73ffd45705d368c159bb819ab0b1a033638c3ffe Mon Sep 17 00:00:00 2001
+From: Marti Maria <marti.maria@littlecms.com>
+Date: Thu, 12 Mar 2026 22:57:35 +0100
+Subject: [PATCH] check for overflow
+
+Thanks to Guanni Qu for detecting & reporting the issue
+
+(cherry picked from commit e0641b1828d0a1af5ecb1b11fe22f24fceefd4bc)
+
+CVE: CVE-2026-41254
+Upstream-Status: Backport [https://github.com/mm2/Little-CMS/commit/e0641b1828d0a1af5ecb1b11fe22f24fceefd4bc]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/cmslut.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/cmslut.c b/src/cmslut.c
+index 3488d0c..f2d0ec4 100644
+--- a/src/cmslut.c
++++ b/src/cmslut.c
+@@ -468,12 +468,12 @@ cmsUInt32Number CubeSize(const cmsUInt32Number Dims[], cmsUInt32Number b)
+     for (rv = 1; b > 0; b--) {
+ 
+         dim = Dims[b-1];
+-        if (dim <= 1) return 0;  // Error
+-
+-        rv *= dim;
++        if (dim <= 1) return 0;  
+ 
+         // Check for overflow
+         if (rv > UINT_MAX / dim) return 0;
++
++        rv *= dim;
+     }
+ 
+     // Again, prevent overflow
diff --git a/meta-oe/recipes-support/lcms/lcms_2.16.bb b/meta-oe/recipes-support/lcms/lcms_2.16.bb
index 9422c7330b..c67653757f 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.16.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.16.bb
@@ -3,7 +3,10 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e9ce323c4b71c943a785db90142b228a"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz \
+        file://CVE-2026-41254_1.patch \
+        file://CVE-2026-41254_2.patch \
+"
 SRC_URI[sha256sum] = "d873d34ad8b9b4cea010631f1a6228d2087475e4dc5e763eb81acc23d9d45a51"
 
 DEPENDS = "tiff"

