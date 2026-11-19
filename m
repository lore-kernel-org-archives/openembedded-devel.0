Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1901.1795113394940779394
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:36:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=nbCf26Ds;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8c5ebbc5150so85376b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113394; x=1795718194; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QGVcId33t5eJZuJaKQ2SCEhOJlmexKzUz6k2mZ/kLGw=;
        b=nbCf26Dssty4nNWqtNkDBPTNPEsE4Tfn5cNMjSBDY5BagasM3dwIVW/FnAQt5WVNY9
         IfHIQ8FK6bEfIw8iX/ygM27623ykWX2Aw5mzCPqmPfT0oRNuddCLZlHd9m0uFy1niOH3
         hmVfQRUvnBf8OrYIN9+C2oybty0TDERM/vo4Q7oHdAw7rtwPyehRuxcdSbJ+/wN7Qszw
         sIss1Jwlq9348Sf0yEuwNgP6bIaVjCdzWDUToBW6K8Kn9W90JGJEXTi7r5oInLT43Rcg
         9AZIhNYrRpP1H5FGG3qKYgFucPapLbJ/0ggRsZ8RZx36QTITDvoeNEYX9P+8K9Wvsqez
         QRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113394; x=1795718194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QGVcId33t5eJZuJaKQ2SCEhOJlmexKzUz6k2mZ/kLGw=;
        b=EmefBkPeC0EOGi56DKzFSoCZalvh/XXZyvZrb/u5LXzKIsZDXo6GlaYSNjPdHy4ub0
         WigKLsxxatR44gQHMtdLU04SgsBf3TlCaAAHCj2vfG4tzOTjaOEn8BPvngpq63CqHW1L
         bmXCmecNawjIqrPXKF5CAW5QhLdbgwQKnq8UBIH0dX/n5k7Ehggtj9Mb0E50Em4c21KQ
         jK4gt6U8kPqy6MbEIjCzT0AeWmCv9FSHcgFs+M3bg3LSn/LSTzL8smg4TaXrJRDwsDGi
         K08Pz/m3h0vSlrk1QyIPuudMZ5yKwuExCl0MvaYXlS5M/Q02Cs3X8zAbkkzs8HrXWHDb
         WvVQ==
X-Gm-Message-State: APuU4Z8o55sfBEmbfpoSHXwaOtUs8GcgUX0RbeQ6UhOryGouJdJhQ7g1
	cFFL8J0GUpwptPB3k93qkhWLGtcmWPkD8hZPUaekwqZCojdKUJqrdHcBFoFvlg==
X-Gm-Gg: AYBFou0o3NIe4RFzJJ51NkxRjwc2BfaAWrtMlqyjewzPBXJlGvYUZOlR2FakvSyKOP1
	WDsqPM04QsB0+I/A+A4H+AeYFgH9M3jDcHjG6t6OV1TKaWKvs7Zr2gR1FezZHcVFiHbWMQGnSMm
	G66MzliOLPl1tfWJPKTamCyIAl6jWeBJzEDRszyCuLY3r1BtB+7itcg9Cf9sOufFIexhijYt96R
	Lk8qJbKYG221qeKROiNWrUYWeuQ+4mQK8gjwO9rEhYf0CKV77ShUWu3GWE+Wk/ymAzbni06rQiB
	RQ5o/OpyFQyjVHFGVoF8x3FKpCVLvqHuHOFaAe+Xnbj0g69uhcqPFA9uxz6JXADwONOdVxLlq+g
	FkfWqGetDp4EN4O7Oali6CoZck3dPM2EniaMyYDDoHt2E5+Sd77hzP2bUuT7iqOAdNhR1jnyiMX
	5OEG8AmQC5stoLiokMQXRIosOhy+x/jWlYOr41ePh4vtyawMgr5RY2XJW7ufCY00YljV0rxTdeh
	iaqKvzhO+SEWFzD+kNZsEtWOm8PH1cXCCOin/ZJaTjSJeLGeybzShTd9/HIdN19KSxDyg3qUaKX
	d0moRSDIcruoU0nPdI5/8QsLFVZmw72Y0fgIA3SfIK+pm7iB8/ZToL+TBbETpA==
X-Received: by 2002:a05:6a00:1c8c:b0:89e:259c:cd77 with SMTP id d2e1a72fcca58-8c87d32b296mr448486b3a.57.1795113394323;
        Thu, 19 Nov 2026 10:36:34 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:36:34 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 15/64] flatcc: patch CVE-2026-116734
Date: Fri, 20 Nov 2026 07:32:43 +1300
Message-ID: <fecdef3363688c8873f9905ecbc0da211d345ecb.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132705
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-116734

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../flatcc/flatcc/CVE-2026-116734.patch       | 30 +++++++++++++++++++
 .../recipes-devtools/flatcc/flatcc_0.6.4.bb   |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116734.patch

diff --git a/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116734.patch b/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116734.patch
new file mode 100644
index 0000000000..a9e5b59d39
--- /dev/null
+++ b/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116734.patch
@@ -0,0 +1,30 @@
+From 0bdd50b31bfaabaef9cd92c1a3da7413fc091684 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Mikkel=20Fahn=C3=B8e=20J=C3=B8rgensen?= <mikkel@dvide.com>
+Date: Thu, 22 Oct 2026 19:38:52 +0200
+Subject: [PATCH] Fix incorrect overflow guard in verifier
+
+(cherry picked from commit 0df9c097a19badc8bd22d93af8fd47bd291e5d9f)
+
+CVE: CVE-2026-116734
+Upstream-Status: Backport [https://github.com/dvidelabs/flatcc/commit/0df9c097a19badc8bd22d93af8fd47bd291e5d9f]
+
+Dropped changes to the CHANGELOG file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/runtime/verifier.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/runtime/verifier.c b/src/runtime/verifier.c
+index e2d1bb6..19243c1 100644
+--- a/src/runtime/verifier.c
++++ b/src/runtime/verifier.c
+@@ -127,7 +127,7 @@ static inline int check_header(uoffset_t end, uoffset_t base, uoffset_t offset)
+ {
+     uoffset_t k = base + offset;
+ 
+-    if (uoffset_size <= voffset_size && k + offset_size < k) {
++    if (k + offset_size < k) {
+         return 0;
+     }
+ 
diff --git a/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb b/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb
index 9defbfac04..330aeccc16 100644
--- a/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb
+++ b/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b3d8fb7158bf7e2600ba3191428dc4ef"
 
 SRC_URI = "git://github.com/dvidelabs/flatcc.git;protocol=https;branch=master;tag=v${PV} \
            file://CVE-2026-116733.patch \
+           file://CVE-2026-116734.patch \
 "
 SRCREV = "fec0275c0d0c5b6f495ab48d51fcde521d72b5fc"
 
