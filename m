Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F125D25952
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 06:50:25 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4658.1769496623400414747
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 22:50:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m4vCUp7y;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4805ef35864so15305545e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 22:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769496622; x=1770101422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBWSNdvfgoPwFj9uDTvgTWMAmcJqIM8c0VPMyyV25hY=;
        b=m4vCUp7yrv5jFaQ1TOTiV9YWKQWaAEc5oe9l6jFG4r/ADlpg6PuJjyaq5f8AhcLht/
         vM1Cz+SUnJq70eb3xPWqUrcOIEg9SWy4/IWl6mjHX200dtcEKAdMDohrQadZbYN16ulI
         gErmwvQFTjwMQkjBz33kthK2kW+wAqyLaWdAanzr1mDXNtVxCjlaNmcASXa+5xILNY8+
         unxaJ4TA9RCvPH9GkQ4ix2ib1FMGyzXP7SlydVtHyoDjKKhf5NupAyDGoygsfvuUkaZK
         KfECwrYzOssKd7r9+0f/34Ub9AEkJOMghU99HI/BFqD0Crog6nkn8+37GJVwPVERonpD
         5wNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769496622; x=1770101422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBWSNdvfgoPwFj9uDTvgTWMAmcJqIM8c0VPMyyV25hY=;
        b=MEmt96PESh2AD73Sqq9WJ4+0MIDfqytQfcr002FJvK3rFIun4Orj7mSMnWkoKKr5Db
         5U3NC/NrvPhasm89C265T48MwBpdrFy4cDFgt1NWfYx0AWKuBn690KkLRhXJVunv2gfg
         VgRyQ4SN2YNM25d+KetLk1hWZ8hvuYky3nQRiF4S7sLMQCicLubdhn5Twt4IEOEWlKN1
         2+PdRfzMtxJAVIfyTBugryHpAfmFxPtxk+9zubgupzBrR81T5765Q7DbIdvs0u40Ku+k
         JpMu6ZJSic3bwwtBjyhv4gE7tBxj6yLPdg9dV79UxF5XiBf3sFNmJUqECgsTFZVEHlme
         s7Zw==
X-Gm-Message-State: AOJu0Yyrr5rHNrTm3PzHm1nvyXHDsFPz6SICe/8zlTvM0xuhxHjknaM/
	kagYEfkrUSaT4ln/QsCIX2gdhLQrAQJyhoHiakRk13xzgZBxkbEFGB2C8o2WJg==
X-Gm-Gg: AZuq6aIR3JvWEoblOBPncq0GrVV3O6shGM/ebe0GX8i7hDNCJsl5dDry4nk0pugWBry
	RoY4iSscNnHy1azV3g9Ml7RblY/zAKBOlN2fvL6LcpS2kRzSXMiE0vflY47L/qXLH1qhHHXbV3I
	lwyP/pJ8tjUXLgnttFgzoD0yPQeikKABHHAoi46PDZ4orNm+Ztc6QJs3QWySkI/n+7KrClqA34x
	9Aeo0bGttLpdsZB5/yZlH6b6eDd19WCm23UV/AVXiiCE1NWq94ThcbGX6TfZbLQ434g+3ABn+AO
	MVmvk4rYR8uMTL0n8dTUOztovQG1C74Q6vwsYUvtFZeuLxOVaYzVR/03zeBKvIyGkmO2+ZVCm/Q
	IQf09FAXH5e/ccsGwkTYpQQJe9hUHC4a2+r5LyNTS7JJBUiCt29r+4Bl4ZeyTXqR/UyJAMN+tJg
	5Z61+/qY1J
X-Received: by 2002:a05:600c:699b:b0:47e:e8de:7420 with SMTP id 5b1f17b1804b1-48069c47cc6mr7350625e9.22.1769496621585;
        Mon, 26 Jan 2026 22:50:21 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bf8sm35191925f8f.11.2026.01.26.22.50.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 22:50:21 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 2/4] fontforge: patch CVE-2025-15279
Date: Tue, 27 Jan 2026 07:50:16 +0100
Message-ID: <20260127065019.1324332-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127065019.1324332-1-skandigraun@gmail.com>
References: <20260127065019.1324332-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 06:50:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123909

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-15279

Pick the patch that mentions this vulnerability ID explicitly.
Also, this patch has caused some regression - pick the patch also
that fixed that regression.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: no change
v1: https://lists.openembedded.org/g/openembedded-devel/message/123871

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
index ab3af19cda..e6533079d5 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
@@ -18,7 +18,9 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https;tag=$
            file://0001-include-sys-select-on-non-glibc-platforms.patch \
            file://0001-fontforgeexe-Use-env-to-find-fontforge.patch \
            file://0001-cmake-Use-alternate-way-to-detect-libm.patch \
-"
+           file://CVE-2025-15279-1.patch \
+           file://CVE-2025-15279-2.patch \
+           "
 
 EXTRA_OECMAKE = "-DENABLE_DOCS=OFF"
 

