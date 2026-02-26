Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E87FC5937
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 14:46:41 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71422.1772117192379551573
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Feb 2026 06:46:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QCA/hMsN;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso8994195e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 06:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772117191; x=1772721991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PckXQyOaePsjlnHvgxTYlxRnfRdVT7aOxylcQRnXCls=;
        b=QCA/hMsNVgsaJhpy7h7yplc/lQyzqxluw3Yh+8DSKQ9RDdkvs1am4qBAmCHhf4kCMp
         2Pxh8AWVk+7bv967hTy9M+fUK00xYiueQh59msrpjymqN59STdpEL7kbDsCpax1/fyJb
         d0rbjN9iwsFCejQnMQvGlpXay9P62fosdEOMa1Pa9MKKQe56liGcvoMkjTxfQXx7Fieq
         SP2aUbrV3kQ50k3lUZHYywRKdPZMALaK2Y0ic+XOrL1UBAcnWWugbtTs0B7jmrb6cRiO
         MuHgO03OGaoWDuIBpdmA3AEAKeM+8N8p4bAiEOVsxtrcYnipR4yDEyXjYoqTsS91RFuc
         3LsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117191; x=1772721991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PckXQyOaePsjlnHvgxTYlxRnfRdVT7aOxylcQRnXCls=;
        b=q8TB5BptCqbrP3s00poNVLE7a3D0Y+Rj+1wEbWhLwrJjOfcPHCK9y1F9Q0zsQyWeFY
         iAZowQRmvfPyH6fPHBBzYn55PhsleoCKmbdO0vT+FzX5BnSZGBYNqte9qPsceofpduNJ
         N63ocgqCcnZGrdc1eQbkRMakloBiGVN00vUvlb7ZSNtm9uBCrpAjlTlA7eYHouIBoWZJ
         wTvofOT+1M/FfHPiTItRRtLc8rBFKWaUwFqmo15sI/O+122iip8UscAXjUBass5R4WHT
         Y2vxHzDDN89hTVeepsP+48P9Zay+8RqE4XTEQpNRysVHVbGz6WkBdQ2gpPpJ3g+ZQTbb
         ++fg==
X-Gm-Message-State: AOJu0YzXUsSopVgqQItnjjQpwwb/wCaF975CQr4a4tj8xujl8fHuIpx0
	J27KLMYDN8DVfOkYLxtq+2SvjablpYt2AhEsgftkj11iIQ6X5gOCNTnYyZkygw==
X-Gm-Gg: ATEYQzycstMVr8VOgje2/Jw42/ioiBJEQB67zKG4kU/PiVEtBdU2BpNLY6UJ3l/dCXf
	4aILJgh9hApevXtzDpcgCyBo+cd1fAq8xy46uQqR2Z4GcpCzLwJK5/QQtO1kmEGzgBAZv+j4mcS
	i3+cxrwHojW1R7DS8ahK6ky5Ko8iE/Lrl0VqlYV82V/RdabZikw+eQIqv65hVCh3ieYQVGuIEzP
	I1NbtXucLYgmQ2ckjTVQ9ApntJnURrZAnEC+wAO7gqzn+/lcuQGeuD2CeStL3pFISlXDWvE1igc
	bAwVJPMd40GtvJs0L7SZkZ5Q/aAddnzuZkBleY7VpctCuCEAdZ+HKmuq+/UagvqFTl9h8JOWvOL
	wKBO40c4JY3A1aHsEspgS56R1lc+0y4ZBbEr1V4ncQwBF3dbr9Z2FTTYgZMe/IIJIF1qHXXGfXF
	peN/JhHAaGwaqyAMe3fGhv
X-Received: by 2002:a05:600c:46c3:b0:480:6ab1:ed0d with SMTP id 5b1f17b1804b1-483c3dbcec9mr35313035e9.9.1772117190525;
        Thu, 26 Feb 2026 06:46:30 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbd781sm75913745e9.8.2026.02.26.06.46.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:46:30 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 7/7] fontforge: patch CVE-2025-15279
Date: Thu, 26 Feb 2026 15:46:24 +0100
Message-ID: <20260226144624.3743168-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226144624.3743168-1-skandigraun@gmail.com>
References: <20260226144624.3743168-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 14:46:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124684

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-15279

Pick the patch that mentions this vulnerability ID explicitly.
Also, this patch has caused some regression - pick the patch also
that fixed that regression.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../fontforge/CVE-2025-15279-1.patch          | 41 +++++++++++++++++++
 .../fontforge/CVE-2025-15279-2.patch          | 34 +++++++++++++++
 .../fontforge/fontforge_20190801.bb           |  2 +
 3 files changed, 77 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-1.patch
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-2.patch

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-1.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-1.patch
new file mode 100644
index 0000000000..4ab5ae3fb3
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-1.patch
@@ -0,0 +1,41 @@
+From a64a45ef6930128226d0d8fdaa4b41847ac507a9 Mon Sep 17 00:00:00 2001
+From: Ahmet Furkan Kavraz
+ <55850855+ahmetfurkankavraz@users.noreply.github.com>
+Date: Thu, 8 Jan 2026 15:47:43 +0100
+Subject: [PATCH] Fix CVE-2025-15279: Heap buffer overflow in BMP RLE
+ decompression (#5720)
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
+index e56477fc8..3ec5abbff 100644
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
index 0000000000..95965f8ab8
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-2.patch
@@ -0,0 +1,34 @@
+From 3ea803a0205aa1d9134a0440ccd55546e3aec019 Mon Sep 17 00:00:00 2001
+From: Ahmet Furkan Kavraz
+ <55850855+ahmetfurkankavraz@users.noreply.github.com>
+Date: Mon, 12 Jan 2026 22:45:16 +0100
+Subject: [PATCH] Fix CVE-2025-15279: Move bounds check inside cnt >= 3 block
+ (#5723)
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
+index 3ec5abbff..4bf255ee1 100644
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
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
index b41a7dd8de..d8c9752c27 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
@@ -23,6 +23,8 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
            file://CVE-2025-15269.patch \
            file://CVE-2025-15270.patch \
            file://CVE-2025-15275.patch \
+           file://CVE-2025-15279-1.patch \
+           file://CVE-2025-15279-2.patch \
            "
 S = "${WORKDIR}/git"
 

