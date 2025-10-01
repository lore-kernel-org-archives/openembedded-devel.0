Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 285CFCCA472
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:53:08 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.18619.1759326777968066004
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bBl+aUGo;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-636688550c0so4067289a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326776; x=1759931576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23YU7E/p13gODIg6+adcxe9duB0AoiRH6nGC6I/ff2s=;
        b=bBl+aUGo0z8rK0awm5asUw74WVYM/xo2uxxB3R8jsTEMgg5dZAdDs4n7a+rzAGCWvL
         nnCFegMnVB+mDwvJcL7Ndv6nIvOSQCHryOTHAD3wCRxYkR2vLVvT0xE4solw/u9L0E5n
         KRDve437oJ10A74ggWNk9SJNuOJoZi1u26+j82CK943oQXk2NCx+S5yszC+1IRBRNph2
         PZ6xgOgsRewXuQS0MW2A7Z8OKZFEzgD7oyZUUTj9pdLmsdWEVAhTV4e2zSTvJ6z+fd8B
         b+IBAKVuHYBDVytBH1i19FJADCiF4e/FzQHg9Xa5JP29tfVBpQVzip/dlJ6n3deUA/PW
         96Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326776; x=1759931576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23YU7E/p13gODIg6+adcxe9duB0AoiRH6nGC6I/ff2s=;
        b=TcUQKumxh0BzJSksZcyEVmjGWTiC9XfWyMMNgnqnVWHd3XZQLcKKF8hfeZIGaSmXze
         fhVO26peJ5o15y2qWIV5UmyriSkiCBGXi5hxlqrVNJkXQ7k7kF+zqpjYNmqHh+XHYzfA
         JPqlidSZHngL9812DcWUjZ1d9ayVvtjUmVESkHiZpgK/YWn4zRZfmxBUmAuctel41RkT
         CFsVzgmUJikpc3z7Qzbb6j/+/9R7OzMT8xD+jzhXq1ydBOaO/9nnN2IvYJDXEqRbToVo
         Gf57mDKgpxZUWaF6yudLUSWJP4aZhGM/yIXL3eHuXkSCyIhIXOEYD8Xyj5FF7Fcy0L4m
         LPzg==
X-Gm-Message-State: AOJu0Yxyx3C+txlnjnu3GYzkG3E7n8nJpYvZbtElEfcHrfXlmfoflhg2
	gK/KCLhmfj4kx5XWXLwNMxcZHQeiYkIac0U/hvUGPKH8wj6wbhThBLdbqS9TcQ==
X-Gm-Gg: ASbGncuNVDDA3FTLQ3FPZlax1VTlckKRBNVtooEFcUHJZhO8XheZgx44S7hyoCFMId2
	4Q4tZrC87ECcixk4zRjb4sUAzdxuhjuYyiv9D8kPJqx1jlNcLexubHaVmzytnOBTJzFcKIgR4v1
	Zhu8Rm/q7Uv8Ewjik2UI6SZ8dUFawFmikSSJPlGbRNli1B9quOYzrDc4b9pW5xeqSuduXn6PzpK
	XGV3hzZu2/ATr42Uq8EVOqYGJkDLInT+8JGLpY4lw6KOoupLA5+P5V9avu7qUpehknPlUl8hV4M
	GVKGducg8qfc8PnpSE9WOseZYk5c+mdyXNo1qpPjB8WYZ3WC3HzKa2fya9Eyk7eFlgKqdIDEGU3
	/ZTIHUL42tIJUJ9L0THIcEzjI+5PzPyTtwJ46s8gEG3h9
X-Google-Smtp-Source: AGHT+IFT4Bp2fR7/BE4Av6bry+lcv/xbk2XboCPip1z2O6VlJz0/e5uAXJUMV2EpX1b0JvJr/S0jrA==
X-Received: by 2002:a05:6402:1ece:b0:634:5381:530b with SMTP id 4fb4d7f45d1cf-63678bb7adfmr4309225a12.13.1759326776164;
        Wed, 01 Oct 2025 06:52:56 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.52.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:52:55 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 14/25] audiofile: fix multiple CVEs
Date: Wed,  1 Oct 2025 15:52:32 +0200
Message-ID: <20251001135243.1490753-15-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120129

From: Peter Marko <peter.marko@siemens.com>

CVE-2017-6827 / CVE-2017-6828 / CVE-2017-6832 / CVE-2017-6833 / CVE-2017-6835 / CVE-2017-6837

Use patch from buildroot:
https://github.com/buildroot/buildroot/commit/cc00bde57fc20d11f8fa4e8ec5f193c091714c55

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 634cbcb91c3ab7154e0cda707663a1e4aa500f4a)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../audiofile/audiofile_0.3.6.bb              |  1 +
 ...ays-check-the-number-of-coefficients.patch | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index e91c81d703..89604f71a0 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -13,6 +13,7 @@ SRC_URI = " \
     file://0001-fix-negative-shift-constants.patch \
     file://0002-fix-build-on-gcc6.patch \
     file://0003-fix-CVE-2015-7747.patch \
+    file://0004-Always-check-the-number-of-coefficients.patch \
 "
 SRC_URI[md5sum] = "235dde14742317328f0109e9866a8008"
 SRC_URI[sha256sum] = "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8cb59782"
diff --git a/meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch b/meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch
new file mode 100644
index 0000000000..282f4c01b9
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch
@@ -0,0 +1,45 @@
+From c48e4c6503f7dabd41f11d4c9c7b7f8960e7f2c0 Mon Sep 17 00:00:00 2001
+From: Antonio Larrosa <larrosa@kde.org>
+Date: Mon, 6 Mar 2017 12:51:22 +0100
+Subject: [PATCH] Always check the number of coefficients
+
+When building the library with NDEBUG, asserts are eliminated
+so it's better to always check that the number of coefficients
+is inside the array range.
+
+This fixes the 00191-audiofile-indexoob issue in #41
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+CVE: CVE-2017-6827
+CVE: CVE-2017-6828
+CVE: CVE-2017-6832
+CVE: CVE-2017-6833
+CVE: CVE-2017-6835
+CVE: CVE-2017-6837
+Upstream-Status: Inactive-Upstream [lastrelease: 2013]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libaudiofile/WAVE.cpp | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/libaudiofile/WAVE.cpp b/libaudiofile/WAVE.cpp
+index 0e81cf7..61f9541 100644
+--- a/libaudiofile/WAVE.cpp
++++ b/libaudiofile/WAVE.cpp
+@@ -281,6 +281,12 @@ status WAVEFile::parseFormat(const Tag &id, uint32_t size)
+ 
+ 			/* numCoefficients should be at least 7. */
+ 			assert(numCoefficients >= 7 && numCoefficients <= 255);
++			if (numCoefficients < 7 || numCoefficients > 255)
++			{
++				_af_error(AF_BAD_HEADER,
++						"Bad number of coefficients");
++				return AF_FAIL;
++			}
+ 
+ 			m_msadpcmNumCoefficients = numCoefficients;
+ 
+-- 
+2.11.0
+

