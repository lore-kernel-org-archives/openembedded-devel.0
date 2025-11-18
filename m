Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9BE1CED603
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 10:31:39 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9363.1763461895764659555
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 02:31:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IBBoxhcv;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779a637712so19933125e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 02:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763461894; x=1764066694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ql8z3TRp1s2DUWZmZbG9KDyJfu4v4EnVuNorCIm6hNE=;
        b=IBBoxhcvFHuVLhzMLVnVRgw2E27pjdefDRKpiixdtiQgdIAMcMtHh0WuFjsMwELtpt
         wWn+7DjAs47rSNZ4xv2kR/tPqBoHcLPk5tLum224WjiVZBYo2AJ5XKWIo7sIJL97oqL1
         399N4bTjc2hE7yrEiH5urZfpXiIhk49rGVt8dNpzI7cc1DNBf9spg2iW+4uaw2la0EbP
         n4IejxJEsLoHKVriJaxAkEIBNZg6+kpG3fKW0vL4bsALPTCFT15AC5jP9eg/h5g4QZmt
         J2pb7P4R7DWGmQIW32Ke18/Lm36nficxiBIqdGMzpTsTZOl30oSfXLFpVbzmEA9bTXdM
         oqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763461894; x=1764066694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ql8z3TRp1s2DUWZmZbG9KDyJfu4v4EnVuNorCIm6hNE=;
        b=JOQ0+EWAKm8plENQCU6sLGy39ic3bNmbzzRjwZWqmuJiib1+V6GtIVozoO3ajmYfmV
         TB2A3HfUngjTK5zGAOnDHKdKZ1IP5HbMTc7rWR53T0S6T0V34SuiH+DW9DiZmFCuHUMy
         lI0w/GXjl3jmFBFd3cRY3rTF87HZVZalOZgKbYjhpHfww6EXgkHSewKgTCKnVCQnbYxx
         WMIhjsIztKbGwOQjIjblS+uAvRYLaqx4wHIV20OJR8O7+zoq6td/YRZSGFxSzZpPvw5W
         3R4L3G97ihScPXtKVhZfDggM4vwBj/IPNawWf7r5/lxRp42lBf5nyQBFasrKjpRTpD5J
         4BBQ==
X-Gm-Message-State: AOJu0YyWk5vVDRoXDEmzENX0MzZ24c2D5w4x64owBTRbO7Qb6cv8n3ec
	FNt7EVMB71T6xr0GUBRqqLjTxD5uZWIDiDjLyJpX1rQLsOBhsrsKf1Sk71+/PLMv
X-Gm-Gg: ASbGncsKMFTvYNY30T566Q9Y1LiJ7MPACPv+3d96vw7IE4Ew7g9JbNy4+YwfomuSxIC
	DiWLUqZlH+S+HRgirg1p2za2zocq3zmQMD0UrizeDAE9sjvI6HUy4czMXTTI9J4AlhMjN8FOQyN
	IRLBBZ9qOvu49xegstdTfplP/ac3xklRVKTAHQfJwDgZaI0VDXsRsTvNWhnlvWI0CGwakt+zc5K
	WIzOAJDTk7PNXdzrzsPMLq3/kfkbxhdnoKVK2bkWupVNZCvSvVa6AK9b/31nDJAmM4oP/Ymm8Z6
	Vi7EanKSCKy0wL95WpHQ4Bt7WJjSNUSYArP/FDSqWiZiFKcLAhV7ul7KcSfEEGLU46tjvg74i8f
	aEyWSPRXN1GJb8M96S2qiiwsjAd0aQrM9dAxsjnbtvkH7RIWHxHA/ty7/Mk9+wK2pboN4rsxNt/
	bQ/WW6n96o
X-Google-Smtp-Source: AGHT+IHTOI9PyMLql0seXoESVEcoKkiBraOsLsxNfJPtTr2arXxTEww82mcgUqtpvmph8G5KEbyBnA==
X-Received: by 2002:a05:600c:6287:b0:477:632c:5b91 with SMTP id 5b1f17b1804b1-4778fe5fabbmr191010885e9.16.1763461893946;
        Tue, 18 Nov 2025 02:31:33 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a81c567bsm55743925e9.9.2025.11.18.02.31.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:31:33 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 6/6] libwmf: patch CVE-2016-9011
Date: Tue, 18 Nov 2025 11:31:28 +0100
Message-ID: <20251118103128.1471091-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251118103128.1471091-1-skandigraun@gmail.com>
References: <20251118103128.1471091-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 10:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121848

From: Gyorgy Sarvari via lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>

Details: https://nvd.nist.gov/vuln/detail/CVE-2016-9011

Pick the patch that explicitly mentions the vulnerability ID.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libwmf/libwmf/CVE-2016-9011.patch         | 50 +++++++++++++++++++
 .../recipes-extended/libwmf/libwmf_0.2.8.4.bb |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/CVE-2016-9011.patch

diff --git a/meta-oe/recipes-extended/libwmf/libwmf/CVE-2016-9011.patch b/meta-oe/recipes-extended/libwmf/libwmf/CVE-2016-9011.patch
new file mode 100644
index 0000000000..e2044bc3e6
--- /dev/null
+++ b/meta-oe/recipes-extended/libwmf/libwmf/CVE-2016-9011.patch
@@ -0,0 +1,50 @@
+From 245ec5c80d8d9964d150507f5583ab890a327fe8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Caol=C3=A1n=20McNamara?= <caolanm@redhat.com>
+Date: Wed, 8 Aug 2018 14:01:34 +0100
+Subject: [PATCH] CVE-2016-9011
+
+CVE: CVE-2016-9011
+Upstream-Status: Backport [https://github.com/caolanm/libwmf/commit/2208b4881ceb8056480735dc330cfd52be03893e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/player.c | 27 +++++++++++++++++++++++++--
+ 1 file changed, 25 insertions(+), 2 deletions(-)
+
+diff --git a/src/player.c b/src/player.c
+index cd87cb5..628cdcb 100644
+--- a/src/player.c
++++ b/src/player.c
+@@ -139,8 +139,31 @@ wmf_error_t wmf_scan (wmfAPI* API,unsigned long flags,wmfD_Rect* d_r)
+ 		WMF_DEBUG (API,"bailing...");
+ 		return (API->err);
+ 	}
+-	
+- 	P->Parameters = (unsigned char*) wmf_malloc (API,(MAX_REC_SIZE(API)  ) * 2 * sizeof (unsigned char));
++
++	U32 nMaxRecordSize = (MAX_REC_SIZE(API)  ) * 2 * sizeof (unsigned char);
++	if (nMaxRecordSize)
++	{
++		//before allocating memory do a sanity check on size by seeking
++		//to claimed end to see if its possible. We're constrained here
++		//by the api and existing implementations to not simply seeking
++		//to SEEK_END. So use what we have to skip to the last byte and
++		//try and read it.
++		const long nPos = WMF_TELL (API);
++		WMF_SEEK (API, nPos + nMaxRecordSize - 1);
++		if (ERR (API))
++		{	WMF_DEBUG (API,"bailing...");
++			return (API->err);
++		}
++		int byte = WMF_READ (API);
++		if (byte == (-1))
++		{	WMF_ERROR (API,"Unexpected EOF!");
++		       	API->err = wmf_E_EOF;
++		       	return (API->err);
++		}
++		WMF_SEEK (API, nPos);
++	}
++
++ 	P->Parameters = (unsigned char*) wmf_malloc (API, nMaxRecordSize);
+ 
+ 	if (ERR (API))
+ 	{	WMF_DEBUG (API,"bailing...");
diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
index e1f94172ae..381833b812 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
@@ -22,6 +22,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/wvware/${BPN}/${PV}/${BPN}-${PV}.tar.gz;name=ta
            file://CVE-2015-0848-CVE-2015-4588.patch \
            file://CVE-2015-4695.patch \
            file://CVE-2015-4696.patch \
+           file://CVE-2016-9011.patch \
            "
 
 SRC_URI[tarball.md5sum] = "d1177739bf1ceb07f57421f0cee191e0"

