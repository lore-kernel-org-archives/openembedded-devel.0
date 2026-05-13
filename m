Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E39ECD484C
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 05:06:09 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.733.1778648707490720291
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 22:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bmeLuV//;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so3891938a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 22:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778648707; x=1779253507; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqpEK3IDu8ExxcMIK6EkbBP8K8GG72sBYfUfxTPCGnU=;
        b=bmeLuV//KPooxr645wB8g32XCqoYbUyNMzK4MaNBwYprLXwhs7L+827zVVv7H0f3eB
         FC80uLe1WrPO9JfSdzJvt0xMS4hmAV+cMNEdsg23I2T+yZa7YNcDUt9qFTgr3thdHcRs
         zBgDiSkEbY2tn1aN9nohFqdnXzVXvnFwpBlTBS8oS5BseYsOj+0kkP1bRVkRZjCUYhcU
         jVnkrNXW/Se7FuUlJ8t/rM66J7WB9yfxrJSddGjw08Mp6FAF7LfIwZaBS42ZM8C69n9c
         nFh6pP9NPZ5BjIKQpkQtHFpKbmt7s8WwBTluX477V8mkVqidQmIWL8vzKeYESbtNdveF
         JqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778648707; x=1779253507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LqpEK3IDu8ExxcMIK6EkbBP8K8GG72sBYfUfxTPCGnU=;
        b=HxVd2c6ywcdC9hZXKyfgeEl/5hahhN2UR0jI+LYiwaJKFC+ADVCAqViq9dxEUzqsOF
         EK/HYb8ydPuxDhSeT00B9Hi0KPzon0JXHoo5A1Guxq6AOdXNqyIsFctLHH4vtYAQVLN2
         jqms1X2rOCuWVr+IdkoZ41HIjtdEPq4DVGDzE5/llY4NFc4PkgHsCo1zIoBli3sfGjHm
         O5rBOAg2dfSYxQovU6iE7Mqt5jFteAQ/alUhBux+gvf/5bUa4f4pZFAJv8kVzHJhY2h3
         JoMZWIsLtlz5+MffW/1jMiqBTyINJ3tLUpCqEQnp7DyW5ovllhRYdvYW/un/1XzyEpvZ
         TPFw==
X-Gm-Message-State: AOJu0Yy23yZ9Iy0mu+monMu0lalajMUNN+6cX5gXEuha6U4BKGtYZJPN
	cy67Fd3sFm7fAVFSGq4UFhqplrjzehxGFaxPT1Ydzj2opyhXGmVVEomR++nO6Ma/
X-Gm-Gg: Acq92OFcpSCVp2IOLsq2wDzgy1RKY5CvoPHGOwpSQNN6AGbZ9JuoHGk/ccR+y+JQCHq
	xWCJGnfQqM8YVQ18HFFN5ekpYErkexp0/DZxPwWsVCt5ALGhJmP/Nz7U3qNf1H2NLJ7d/FbQVME
	4DD6RdCu5oQfAJ/RM2gzQh20Zg1c8dngXWuLxVBzZLdhWBrDDr+Dy0fM0ASUqOgdV6aiGHdEfs6
	4I/XKSM/Qih5CrO9YzmScl4noFkwcJzYQZkBrV2/HrL9sZFFEht5qy4e9vo3Bk7WJn3PeJkBPu1
	gpoeSv6rjF8VDS7bPAphIBIpxQvj9nxFimeKF0EEjAd4VdRNdYoSqwff6GLJRMKDwhXz9n2Q/Ip
	Z3/rZYM08NORYOl/R6JaFoNIxbbPs5ZRT/Hcfga3hPqZiQ1KIiLzQNieT+hVEUo+JXURXBn8WnE
	g7STCy1VTGWrOFH774wQNgEtEQopJFoNfMSa7a
X-Received: by 2002:a17:90b:1b0d:b0:35f:b5df:453 with SMTP id 98e67ed59e1d1-368f79cd1dfmr1258351a91.22.1778648706749;
        Tue, 12 May 2026 22:05:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368eddf5c58sm1696900a91.1.2026.05.12.22.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:05:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 5/8] lcms: patch CVE-2026-41254
Date: Wed, 13 May 2026 17:04:46 +1200
Message-ID: <20260513050450.3515182-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513050450.3515182-1-ankur.tyagi85@gmail.com>
References: <20260513050450.3515182-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 05:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126948

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
index 8135f83a05..8a70572907 100644
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

