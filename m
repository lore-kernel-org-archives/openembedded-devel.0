Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F01E7C02192
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 18:03:27 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.15103.1737828200349227951
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jan 2025 10:03:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W1OXgQNp;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21675fd60feso71258335ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 10:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737828200; x=1738433000; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzYvuAIxwjAOaILTEP6RyyDzpWECgDCttYfjHfM18jU=;
        b=W1OXgQNp/ey0PtK3TW2+juOmcElR4b8ZCW2yj6boRKgG9V4jQ5hsmE/f+LGhllFcvQ
         aCS3c14YHlUwIRBFwededSQ2n/U9/MFPkyuy92+E+rf7IH2afXnYmvjPHNL5EhN4e/KE
         XkoQ/EVY2HF9Mv87Ys3RmOliBQ6DxIxNq0+3uj+et9tx1D2Z5nSUBJnW5ZaPN6zQlPeZ
         w2RHbjGcebPe+zE9HtTxmFE8FpSCRpZwUPtWPvSCvAtjasLDGSDzHuPjQ+j7LT5DC6iN
         U8lWdTWMCrjE8RX6ko8Maodtif5+ONu81bHH+NCsEa33nY+9C9nPqFtsIy+BMkD/ZRMQ
         pEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828200; x=1738433000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HzYvuAIxwjAOaILTEP6RyyDzpWECgDCttYfjHfM18jU=;
        b=J5Zzas6dA4TAxLw0Pl8IKrLHWzFzcuvHQLYjrEZU5gej6AvUTP1K5ISS8ItZ/riIza
         qJ2upAQ3RFVLZGBNoow4x9UFR+tfEcI4KVK5s48Lf8Gev+pwgUt78m6JVYLonjt2GVFH
         cB9s+PMc8bS6erIE8NeMDsg/rD1yxio04TrRbVUltchPBf8zfEjH4dlJxHOjoYKhERds
         db9WWws9auWxi6HiGAjjE0Fj2EeQLwtIUUc4kWIOF5xOugHIzwvK8Qui/wPfgCQMq7xq
         gr52UD7unGIF7i1h3XpOhByZ40KL5qp9Tf4HvL78/wgMC5d5BmFQjiUbbwc4d2CX954z
         SDpg==
X-Gm-Message-State: AOJu0YzcJyN/CmFcXt3vdVZjCsW2Csn/udX7tJCF1vA+cz+1CECKgK2Z
	X3Q5QrFvWb2rGjQUudfa6Q4sl6oRyvl6sWgEY3F5meq7x85K22ur03KIUA==
X-Gm-Gg: ASbGncsdzJT34nVNG+z6ncShHXmwiYbvFzTK82w/V0hrb+/50b1Wp0cNot/bSIvXRJs
	8KJ78WgJ9f8NHZ+8+IpTdQSERxWCfuldZ3rgaUVACsSNTF9vuxhibhG/bbpa7LDabCN0mgthlFt
	eT+wPxWkivixKF9DLrrYRbmhsjRrYKta/GN02EEoqIR0hCQdgvMogNQDqc9ZzR9VsABsHVR922j
	e9YbAqdEisM2klghVOWCxleSK3VUZp0zgatbpWFFA73YPQBKqk5ZLTyUTClj6kha65hdiOvah4U
	gGbcm+yclRatCKXWYFoN/02sg5c=
X-Google-Smtp-Source: AGHT+IG8rYW3Nh4/tYINie2pN+5BWpm7ufwKl21/0a7BbKbxtdRiUnfYhXUpJ17QxwByC7BshcNkDw==
X-Received: by 2002:a05:6a21:3285:b0:1e1:b1e4:e750 with SMTP id adf61e73a8af0-1eb214946aemr58920967637.18.1737828199648;
        Sat, 25 Jan 2025 10:03:19 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net ([2601:646:8182:b790:f137:fcfb:97fc:71bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b51e7sm4108906b3a.69.2025.01.25.10.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 10:03:19 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 10/14] audiofile: fix multiple CVEs
Date: Sat, 25 Jan 2025 10:03:04 -0800
Message-ID: <20250125180308.7856-10-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250125180308.7856-1-akuster808@gmail.com>
References: <20250125180308.7856-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 18:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115093

From: Peter Marko <peter.marko@siemens.com>

CVE-2017-6827 / CVE-2017-6828 / CVE-2017-6832 / CVE-2017-6833 / CVE-2017-6835 / CVE-2017-6837

Use patch from buildroot:
https://github.com/buildroot/buildroot/commit/cc00bde57fc20d11f8fa4e8ec5f193c091714c55

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 634cbcb91c3ab7154e0cda707663a1e4aa500f4a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../audiofile/audiofile_0.3.6.bb              |  1 +
 ...ays-check-the-number-of-coefficients.patch | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index a09f84381e..7654c073f4 100644
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
-- 
2.43.0


