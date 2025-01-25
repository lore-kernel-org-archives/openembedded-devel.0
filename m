Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42B4C0218C
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 18:03:27 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.15104.1737828201428946273
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jan 2025 10:03:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P/QpxXbv;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21631789fcdso56358835ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 10:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737828201; x=1738433001; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1t3/uKMdDITGLhAfSJbzne6Mt2lieUnzbfs8d+6v3o=;
        b=P/QpxXbvtj6npZVthbzZRZG3b2+pDHLKYeIbm1/TW3U5c0aamv39f5/D6takwqk1ky
         URzH3vcNEq4/wvpPUoy1KYAfT8G7tAwR6O0X3legYvW8oAVcQ3b3RwQ1/E9EdbsHsWMd
         EtEcs39GpED+7u66YW2lAQbu56LJQ6i04HqXTzScf6jHg660YKwDzLdPwcbLTUTyo1/i
         vPHRO64BsDKt050Ma3iLjPvzpqQmFberwKkYaVbX/SgfYX9KgylobHZTdcbwuDFZDsrA
         F+gHhfOCxKYWwZaBz7WiiOCqW23L5SG8rwAHbjt2kajixJ27Pgjk02ZqDH0FGC5Ez9+C
         9ctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828201; x=1738433001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1t3/uKMdDITGLhAfSJbzne6Mt2lieUnzbfs8d+6v3o=;
        b=aG2AH7S4qOqBD+gVxGrLg1MvIIB0AulVzGpaPkQtrt5pLvbdeQOZduZvQsT4c6m5C7
         sJV7MgZeVA+CAkSLZlvfMq+2etDJNQ2Qgd7B9865wUlbNpN47b6dyG+a+VlK6fC3BZc4
         Evp5JJLW+XYrLguMwMEla+MxWlDF+NTUkOPCQaRohss9eKwGOgf6eaVgzWdU2XHtpzrV
         rHVHBSScip9i0lg6Jxq7Axv0tBxJ5GicLt1UrnrWst7nJZaCWQGDBGMCljjp6ti0MWgU
         DCwIf3FwbJUEkC2JLGbEa9NPRFTL5poL0fQsUMWx0rc8sx63epKLrQQQANKjqELgWpCW
         8ciQ==
X-Gm-Message-State: AOJu0YwnrAtytVYKLxAS1lJDxTyh6xjNJjaNodtfI2RbIUV6p8qDAw9I
	hqWvo3dHMiw2vodgren7cLOQSuBCIuha03ZFtJIFTINUzJbB9aW6k5NRvQ==
X-Gm-Gg: ASbGncsQ0GAcpd2lrDUD0JNnRPz4/AjKXBpmAOoz4xxPBeFe/pPXLu8N67LO1HxfyDM
	k3zcYaankQp2JZhszPJN7ztb0P+TPZ1nmq0RJxb9ue+a7yx2vt9MB6vLWeBCQL89ieIWsQh/Yoz
	NC5COhfnY/YW+DwFu+7FskubFn2/7GbOfMRaDhRrsHDD6yhYiaoM6apZMvgiHYI1GDz4lS7FS2l
	78r1+brYSuJtCpXhlBxarc1zsrIfKjEIEB9XGjbWkzwDP2WGd1SVws0qwSEopFIRrcaeojUvQyA
	z8HWUfvos7nQA4YUPclx5bA7nm8=
X-Google-Smtp-Source: AGHT+IF0GdFnhU8wT9VL8cBQpVTG/37JIsriHE1c3qujr5QUmYA3tShjJGLCF6IqPznEzC3zdlTgRg==
X-Received: by 2002:a05:6a20:c88b:b0:1e1:a48f:1212 with SMTP id adf61e73a8af0-1eb6968a5d8mr20766711637.4.1737828200723;
        Sat, 25 Jan 2025 10:03:20 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net ([2601:646:8182:b790:f137:fcfb:97fc:71bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b51e7sm4108906b3a.69.2025.01.25.10.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 10:03:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 11/14] audiofile: patch CVE-2017-6829
Date: Sat, 25 Jan 2025 10:03:05 -0800
Message-ID: <20250125180308.7856-11-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250125180308.7856-1-akuster808@gmail.com>
References: <20250125180308.7856-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 18:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115094

From: Peter Marko <peter.marko@siemens.com>

Use patch from buildroot:
https://github.com/buildroot/buildroot/commit/434890df2a7c131b40fec1c49e6239972ab299d2

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f29fbaa4650201a059c65572947ed8faa991fcd8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../audiofile/audiofile_0.3.6.bb              |  1 +
 ...ues-to-fix-index-overflow-in-IMA.cpp.patch | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index 7654c073f4..a48bed2a3b 100644
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
-- 
2.43.0


