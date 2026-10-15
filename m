Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8ECCCC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:07 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32814.1792043038768626927
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oV5912ZG;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e95bd1c14cso3267035ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043038; x=1792647838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VhF7MzhOuo8VqGdj2+OUIQdkbeWwCa6uyZhl/+jTfks=;
        b=oV5912ZGy8ooEWvLTLP0pOccGkp824UCOMtB+5hsj3sc4MBPsH/OdSFDYao0uFWOOh
         NVdytFdja90t2ZaMpXqjqu9U5yvTqxUqHchywpe2iRF4HrbTSr2jhYRqxfLc7fQ4+7pA
         x8J/RsjqQpx8WZWyV7JWZjAHMiAFKfgMalNJl3oiNOWmIlTXtMClQspAmimgq83C8SjO
         zuOtgeoYVVdppKoIYP+bHB7kJ5AITKjrV5cQX35DeOR9Lnnz/gWdCmmgnbtMFm0Kotzn
         nuc76cdNrAspqMIjOEDgUJnjX9Gw6Tp49L1FRI4K9+hAPkZu70a36AU1+Y/cQAojud42
         Xkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043038; x=1792647838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VhF7MzhOuo8VqGdj2+OUIQdkbeWwCa6uyZhl/+jTfks=;
        b=XFfwtVxdLNGvibP0akSnXtx0YpJj85aTzYwQ+MijsRhirkVSYGczIZVgUNWs8iACRq
         9MFmADJjkW24v4vFWE0qOJcntHWaV7ZRpf0TZiiX3D6Yu2M7PuUtyk/1wFG6tFXl9jsL
         987pruhG2pNWAJ2BuTc90LfcyKVt+gMtJA6C7WD4b9Po1kyQoWg/xL8OJVbJb/mB3uL/
         eE9+5EdSjQ8/c1T50pIBitr5rLy2GlsrmeskdZDr+YkpK9Y9pAyCjkExD952rfeFW+HE
         +ysP+L5SYB0rqW/fgqAdR5XSdtCqL2o3S2tuLCNLK32vfvGMH5V80gkPMGdorF1bdhX9
         o4xQ==
X-Gm-Message-State: AFq9FYJ3vQHpDEvsCCUHyeygZsouIbz6BK7UtZzjo6JbdsWvVuKLUg8Q
	U6FTkDh7ybArz1O6BHyMJ44AxuwXkroY4sxpcKgWM3zortbou+yj29VGBEf0pg==
X-Gm-Gg: AYBFou2XfhTPmdlZTxaFvKu8WpY6x7D+M8hHqMu0t8Fj91j7zF1oBEEzylUwlXmm7bj
	FDbmxgNMPP3huV1usLGRfpcOSfsmW1dW0iz0QZ2OsYCo/S1y99VGSRnCBx3gUxTr6GWJG29IMW9
	3yMDbjVPnjaWL0GWUocrn/qdWHEGrXASMP44C8ePmOEz5plduJXMybOQWiM9gPt4m+LAnIx4ZrT
	GQUTNFz7eTCegiAyoINs4tSMbi6t83T6TanNOABqgG+m8IN99l1w4JuEiAABQ9wtWcUwr3gZ3GG
	bcQQOYlqVzEbMvFpK4N0h03me/SgQbD8Sv796+2nrALOhlCD16rdl66YzZ7Qk7hXZ/7BTgiaio5
	3Ww1M0qwW1xM/ghaVFu7qfteT13MSdug3mkVIg9xUctzG7yeRrhLFKyHBtyTGaowWT3/ob/STXG
	FUO/QeSUXfHYGgrCT4NZlnArFJj8LsexGk9sPWS11HbE+5P/VkzsTEUba6MU903tk/6u1JMXXc5
	ogjZI1DIenOStZp8o4mjyc=
X-Received: by 2002:a17:902:d50a:b0:2e3:1bb4:610d with SMTP id d9443c01a7336-2e842f31562mr157121825ad.50.1792043038066;
        Wed, 14 Oct 2026 22:43:58 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:57 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 32/82] libnfs: patch CVE-2026-53689
Date: Thu, 15 Oct 2026 18:41:20 +1300
Message-ID: <8abdf08b09f02003e63d33341b5f757135deb2d3.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130952

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-53689

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 6ace2f0b5e54469c5e9fd8b99412e8f412128458)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libnfs/libnfs/CVE-2026-53689.patch        | 34 +++++++++++++++++++
 .../libnfs/libnfs_6.0.2.bb                    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-53689.patch

diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-53689.patch b/meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-53689.patch
new file mode 100644
index 0000000000..0c624c7219
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-53689.patch
@@ -0,0 +1,34 @@
+From d45a7d6cdc899ac2a62abc21280d674ae91ae0ae Mon Sep 17 00:00:00 2001
+From: Ronnie Sahlberg <ronniesahlberg@gmail.com>
+Date: Wed, 10 Jun 2026 11:43:28 +1000
+Subject: [PATCH] ZDR: check the string size for sanity
+
+It could otherwise cause an overflow in the bounds check later.
+
+Reported-by: Nick Hummel <nickhummel@google.com>
+Signed-off-by: Ronnie Sahlberg <ronniesahlberg@gmail.com>
+(cherry picked from commit 55c18ea33a83d667f79f0ef209c96895795c729f)
+
+CVE: CVE-2026-53689
+Upstream-Status: Backport [https://github.com/sahlberg/libnfs/commit/55c18ea33a83d667f79f0ef209c96895795c729f]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ lib/libnfs-zdr.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/libnfs-zdr.c b/lib/libnfs-zdr.c
+index bc507eb..cbdb650 100644
+--- a/lib/libnfs-zdr.c
++++ b/lib/libnfs-zdr.c
+@@ -305,7 +305,9 @@ bool_t libnfs_zdr_string(ZDR *zdrs, char **strp, uint32_t maxsize)
+ 	if (!libnfs_zdr_u_int(zdrs, &size)) {
+ 		return FALSE;
+ 	}
+-
++	if (size > zdrs->size) {
++		return FALSE;
++	}
+ 	if (zdrs->pos + (int)size > zdrs->size) {
+ 		return FALSE;
+ 	}
diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb b/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
index 49617eaa29..8068d35e1c 100644
--- a/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=825301ba17efc9d188ee0abd4b924ada"
 
 SRC_URI = "git://github.com/sahlberg/libnfs.git;protocol=https;branch=master \
            file://0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch \
+           file://CVE-2026-53689.patch \
            "
 SRCREV = "18c5c73ee88bb7dc8da0d55dc95164bb77e49dc6"
 

