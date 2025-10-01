Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87442CCD185
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:53:08 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.18620.1759326778852223145
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m+PP8g5Y;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-62ec5f750f7so10793760a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326777; x=1759931577; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qc5SNt9LTSp0SweB5u91IARqXHqFBBuijhc9lvnv7DU=;
        b=m+PP8g5YAr8dk/2oxNOiz39B51WNqCZ+ZXoOsRh7YWCWrW5cpCZN3dv0Sgfl6I+3M9
         ivVlofiLBa/5ISq7nu+hQ6q4+4Etu0K2Ogh/C6XiuWue509VCRuqPY+Lq1ikmx6ggF8m
         MHtuMOh1p6zpHi5Y5iKDoVGHvsDTDl6/EG2eKddSrnkKG43HmOmCud3yZUvL+Ys7qSFz
         bbYzuMGgs6kb3A33kEhJAdxp05kBxlhhb2vc4hH+nLgKmfq+BSliLI3RQ1DF6Pl6mU1X
         Q8tP53s4zT+RaaeVRIVZM0oi5t6RGu/BCgqfIPO100Ie4I1XXfh+llNcPC1DylC1BC7X
         L6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326777; x=1759931577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qc5SNt9LTSp0SweB5u91IARqXHqFBBuijhc9lvnv7DU=;
        b=LruJ9QIVskbhUb1kIcmVGM6FFHMk+tsqgysGYZA4QJJsvQWzVWpxH3PdQXl+RuoKJe
         L90Gc+8+c3w9P9AYKT+iZd9c2JPPihs4OjELLdjbpntzOuqoT1XL/Q9GykBKKTqgqFY4
         3wEV6KE56HK5ZboGqd9pOD4xUrFI1N448TgpCN0hOpWFvRzJbsoHZ5jibCgXPJvzFR+w
         NIu3q4ZJYN2otQf/ceSHNa9PazI2KOGnEVSoCIhFA2NNz8S4lV0YWCtZPNe+fK9A0sVb
         TM5XNEeanc0s+iZ/tKrFxz8a9tVpN9b7mOo+baTc0Lz0UUUXfRhK9Pu8HGmn/ij3fbY7
         ZHXA==
X-Gm-Message-State: AOJu0YzGu94o/0hYOA6540aqpKgPYBCGlmvFH6paG2ZL63LK2D05QIoL
	BVmh2uiKkjDqQlJI5Ea8IgfUVVl4FETWr506ZRY1l85/R0oC/grR/hIxfFecZQ==
X-Gm-Gg: ASbGncvMBIsogN9xLPlvnKtaYFK6gI564zv6zBkxuHkcMfEVUpjD2PPUu/XAojWwG18
	Qpy42zlZ95/BXO7l+q4n5UODwbevkGo6QWosiSf7vTgj3sw61e48r22G1o1xb/9hoKDlzRPjSZI
	GOxleHfFonAKQ+NZoaayqte70EhTEy8di0LqxZrEzPsPiPo3pcWMJlybVQ9DelIKYPqiJyTD5mg
	wy2K5AS5cKzk1xPsKu2kfM4HUqXgx1bW3JPKFPawoA0JvkoxhOi/4xJyAf3lRl8I9rH0nr3szv5
	KlRSCf7B9f0Wwa8kfUmwgoN7VZ6mc1PTDNdxvHq9RhNTLA8hJ4kCIGcVJs79hPFk+IhO3GuJdBB
	kfQQ56GRpzCln0Dc86wX7APMZkyx9A7ioIrjCzZejGNs5
X-Google-Smtp-Source: AGHT+IEko+JOF1n2q0Fy8z5h9eN3u1KNxVO3rzqb2usPO9Gnf0Nd8yMcjDGN1dUs8KEEXeZqtLcFfQ==
X-Received: by 2002:a05:6402:1ec9:b0:636:740:e4f8 with SMTP id 4fb4d7f45d1cf-63678c4d390mr4152580a12.18.1759326777069;
        Wed, 01 Oct 2025 06:52:57 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.52.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:52:56 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 15/25] audiofile: patch CVE-2017-6829
Date: Wed,  1 Oct 2025 15:52:33 +0200
Message-ID: <20251001135243.1490753-16-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120130

From: Peter Marko <peter.marko@siemens.com>

Use patch from buildroot:
https://github.com/buildroot/buildroot/commit/434890df2a7c131b40fec1c49e6239972ab299d2

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f29fbaa4650201a059c65572947ed8faa991fcd8)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../audiofile/audiofile_0.3.6.bb              |  1 +
 ...ues-to-fix-index-overflow-in-IMA.cpp.patch | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index 89604f71a0..ec162154b6 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -14,6 +14,7 @@ SRC_URI = " \
     file://0002-fix-build-on-gcc6.patch \
     file://0003-fix-CVE-2015-7747.patch \
     file://0004-Always-check-the-number-of-coefficients.patch \
+    file://0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch \
 "
 SRC_URI[md5sum] = "235dde14742317328f0109e9866a8008"
 SRC_URI[sha256sum] = "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8cb59782"
diff --git a/meta-oe/recipes-multimedia/audiofile/files/0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch b/meta-oe/recipes-multimedia/audiofile/files/0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch
new file mode 100644
index 0000000000..00bb7e597e
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/files/0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch
@@ -0,0 +1,43 @@
+From 25eb00ce913452c2e614548d7df93070bf0d066f Mon Sep 17 00:00:00 2001
+From: Antonio Larrosa <larrosa@kde.org>
+Date: Mon, 6 Mar 2017 18:02:31 +0100
+Subject: [PATCH] clamp index values to fix index overflow in IMA.cpp
+
+This fixes #33
+(also reported at https://bugzilla.opensuse.org/show_bug.cgi?id=1026981
+and https://blogs.gentoo.org/ago/2017/02/20/audiofile-global-buffer-overflow-in-decodesample-ima-cpp/)
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+CVE: CVE-2017-6829
+Upstream-Status: Inactive-Upstream [lastrelease: 2013]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libaudiofile/modules/IMA.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libaudiofile/modules/IMA.cpp b/libaudiofile/modules/IMA.cpp
+index 7476d44..df4aad6 100644
+--- a/libaudiofile/modules/IMA.cpp
++++ b/libaudiofile/modules/IMA.cpp
+@@ -169,7 +169,7 @@ int IMA::decodeBlockWAVE(const uint8_t *encoded, int16_t *decoded)
+ 		if (encoded[1] & 0x80)
+ 			m_adpcmState[c].previousValue -= 0x10000;
+ 
+-		m_adpcmState[c].index = encoded[2];
++		m_adpcmState[c].index = clamp(encoded[2], 0, 88);
+ 
+ 		*decoded++ = m_adpcmState[c].previousValue;
+ 
+@@ -210,7 +210,7 @@ int IMA::decodeBlockQT(const uint8_t *encoded, int16_t *decoded)
+ 			predictor -= 0x10000;
+ 
+ 		state.previousValue = clamp(predictor, MIN_INT16, MAX_INT16);
+-		state.index = encoded[1] & 0x7f;
++		state.index = clamp(encoded[1] & 0x7f, 0, 88);
+ 		encoded += 2;
+ 
+ 		for (int n=0; n<m_framesPerPacket; n+=2)
+-- 
+2.11.0
+

