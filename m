Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97376CF65E9
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 11:45:16 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18225.1769427910859171727
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 03:45:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OkSE3BLX;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee807a4c5so46338195e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 03:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769427909; x=1770032709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ujKaAZKwh0mW2XgD0HbmokKiaH9HTTt6jG8dl66SHHY=;
        b=OkSE3BLXy/Ual0j76m+4Cghd3dPJq3Bs7YfehHTllKSFSRGs3DVa37vTTMmi51dLO0
         k8UXZuxvkVgJMDnF+vdgEoncoN1h6vxhGcDQlo8uMenspZYn6TXl5zPDfOc/Q9/BGMv9
         ORZuvU9ZJ1faA1/Hynj+RWHkTWYUqu0WHo+BXmENWo8JmbzQFg4rpp5EPt1NeYCqwnPQ
         4bbmpqejxmJMFh5dj8/lBLY6tFOU4CzdZK1utw1rHB5uKkGhLPbFkS9dopLheqyzbvuC
         r/xHR5u8K/bByx/sgDHcrdZ5k6rNsZDef0jTi4Bbxqj+OMD/A/1o+xmNOtCT2w0y2nbA
         hrqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769427909; x=1770032709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ujKaAZKwh0mW2XgD0HbmokKiaH9HTTt6jG8dl66SHHY=;
        b=nsz1+RB45i73IIGgtR25bZYEGffvtxLOu048fgCCB4iOw31u78cE8qmFoNn+RA1XF0
         UIC7IaAmX87bIkELpJ78ZJbvLVNfvDHPt/V6a2bvaXOk5ilITa4MaU0Uk5u0V6zJIDzO
         HyKt3znCUBvT9hL8sesNCYDPXCcECQO/W7sjJsh55tX2dlBIKmsPWv0CHI/nyV4vlDeD
         Ubh45hWZqSht9GXNOWU3HLCMW4QMKvYAtHT+GEYpJNvyMz65zldC4YxO7CfFJMvxiNqM
         yHb8wmneqJ00GaEzjLSae2RCHA56ygydV+jTS+CVv8Vgk04YfdWygNRNlZAOCpj/Yv1b
         x05Q==
X-Gm-Message-State: AOJu0YybFJm5jC4FC2PpcxcRtb7nKcnOWoLXjsyT9OYZxsvM1Q1wl5fj
	zWmgPND9W2C8Po+EDhuhqH4t2ThyMcyA92lim/Qywm+VOB24D7F6iBtgrMo3Vw==
X-Gm-Gg: AZuq6aLQy7GeIn47SRsieC7yc/BzygWp9+4IHsCyNheFShqRtV8RIUie+3QpW6UUBeO
	4QPYFTNR8fhlsPNt6bEri3cOB1avAx6nOz2WpDE8yYCsEu5NAPJGnmmzyt9rqSX3n0gtVGmKPXD
	ZVzbITx/v9ySqR/SHk+DmyfKY5bMRwtOfznJicuD95ZZ0UmX6DxlMv5WF6KNkVc8sjuAJUUu28M
	wjvAJ69Xgv1I3PsKvg9/9KqPnDVJXvct27KR9nB+Nk/z/8vukRdUcvkWn/zW+hlV9gZQ7Scz9LE
	n5isg0qSw/Zb0BI+iHTyKcm3QaInK5Tq21V6muyiMRuZVtwqWvaORBevBY3RFAQlrlBKok6HXve
	ru0MqcZfBPs6bk8X8sYamO/G55NIuHTOl9X6MIjJe1ug1tSFep1w2E/YaYID260Erk9BqvV4sM9
	SLJQFM34Yr
X-Received: by 2002:a05:600c:3e18:b0:477:a219:cdb7 with SMTP id 5b1f17b1804b1-48060ad816fmr42103695e9.0.1769427908980;
        Mon, 26 Jan 2026 03:45:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbd4630sm98454055e9.17.2026.01.26.03.45.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 03:45:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/4] fontforge: patch CVE-2025-15279
Date: Mon, 26 Jan 2026 12:45:03 +0100
Message-ID: <20260126114506.3846753-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126114506.3846753-1-skandigraun@gmail.com>
References: <20260126114506.3846753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 11:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123871

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-15279

Pick the patch that mentions this vulnerability ID explicitly.
Also, this patch has caused some regression - pick the patch also
that fixed that regression.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../fontforge/CVE-2025-15279-1.patch          | 42 +++++++++++++++++++
 .../fontforge/CVE-2025-15279-2.patch          | 35 ++++++++++++++++
 .../fontforge/fontforge_20251009.bb           |  4 +-
 3 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-1.patch
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-2.patch

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-1.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-1.patch
new file mode 100644
index 0000000000..17f33f41ff
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-1.patch
@@ -0,0 +1,42 @@
+From ce71f0cdce556f56c5207a33a1be3830a73cc04f Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 8 Jan 2026 15:47:43 +0100
+Subject: [PATCH] Fix CVE-2025-15279: Heap buffer overflow in BMP RLE
+ decompression (#5720)
+
+From: Ahmet Furkan Kavraz <55850855+ahmetfurkankavraz@users.noreply.github.com>
+
+CVSS: 7.8 (High)
+ZDI-CAN-27517
+Co-authored-by: Ahmet Furkan Kavraz <kavraz@amazon.com>
+
+CVE: CVE-2025-15279
+Upstream-Status: Backport [https://github.com/fontforge/fontforge/commit/7d67700cf8888e0bb37b453ad54ed932c8587073]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ gutils/gimagereadbmp.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/gutils/gimagereadbmp.c b/gutils/gimagereadbmp.c
+index 5a137e28a..133336787 100644
+--- a/gutils/gimagereadbmp.c
++++ b/gutils/gimagereadbmp.c
+@@ -181,12 +181,18 @@ static int readpixels(FILE *file,struct bmpheader *head) {
+ 	int ii = 0;
+ 	while ( ii<head->height*head->width ) {
+ 	    int cnt = getc(file);
++	    if (cnt < 0 || ii + cnt > head->height * head->width) {
++		return 0;
++	    }
+ 	    if ( cnt!=0 ) {
+ 		int ch = getc(file);
+ 		while ( --cnt>=0 )
+ 		    head->byte_pixels[ii++] = ch;
+ 	    } else {
+ 		cnt = getc(file);
++		if (cnt < 0 || ii + cnt > head->height * head->width) {
++		    return 0;
++		}
+ 		if ( cnt>= 3 ) {
+ 		    int odd = cnt&1;
+ 		    while ( --cnt>=0 )
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-2.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-2.patch
new file mode 100644
index 0000000000..840a37a8a9
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-2.patch
@@ -0,0 +1,35 @@
+From 4cd078071e2487f052ec997ee13bb910d796587b Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 12 Jan 2026 22:45:16 +0100
+Subject: [PATCH] Fix CVE-2025-15279: Move bounds check inside cnt >= 3 block
+ (#5723)
+
+From: Ahmet Furkan Kavraz <55850855+ahmetfurkankavraz@users.noreply.github.com>
+
+Co-authored-by: Ahmet Furkan Kavraz <kavraz@amazon.com>
+
+CVE: CVE-2025-15279
+Upstream-Status: Backport [https://github.com/fontforge/fontforge/commit/720ea95020c964202928afd2e93b0f5fac11027e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ gutils/gimagereadbmp.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/gutils/gimagereadbmp.c b/gutils/gimagereadbmp.c
+index 133336787..ad365158c 100644
+--- a/gutils/gimagereadbmp.c
++++ b/gutils/gimagereadbmp.c
+@@ -190,10 +190,10 @@ static int readpixels(FILE *file,struct bmpheader *head) {
+ 		    head->byte_pixels[ii++] = ch;
+ 	    } else {
+ 		cnt = getc(file);
+-		if (cnt < 0 || ii + cnt > head->height * head->width) {
+-		    return 0;
+-		}
+ 		if ( cnt>= 3 ) {
++		    if (ii + cnt > head->height * head->width) {
++			return 0;
++		    }
+ 		    int odd = cnt&1;
+ 		    while ( --cnt>=0 )
+ 			head->byte_pixels[ii++] = getc(file);
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
index 2d08ee2e57..58f15ab396 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
@@ -17,7 +17,9 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https;tag=$
            file://0001-include-sys-select-on-non-glibc-platforms.patch \
            file://0001-fontforgeexe-Use-env-to-find-fontforge.patch \
            file://0001-cmake-Use-alternate-way-to-detect-libm.patch \
-"
+           file://CVE-2025-15279-1.patch \
+           file://CVE-2025-15279-2.patch \
+           "
 
 EXTRA_OECMAKE = "-DENABLE_DOCS=OFF"
 PACKAGECONFIG = "readline"

