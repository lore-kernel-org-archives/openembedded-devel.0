Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FF7CCA470
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 13:58:40 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.10963.1759672717067447121
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 06:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mkFdSa94;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b3ee18913c0so622279566b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 06:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759672715; x=1760277515; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dWLu+S/DZTCqT9ml2YWJnobsWuW0OeT93nD9juwMA1Y=;
        b=mkFdSa94AL3sbUT4UWdHE6bzMjUtJZYOVyBMKDX4IjvkkOaqRM1SK+oQcCZ0gt42C4
         VbdX+cg211f2x73MAmvcUUqvZgeGUWiqXvkZg5gyFeAUcDOEhvo7otDN5+En00eGF1DM
         vvuRQwq6oMus0eHycmoDW+TtMTkL1otAyI/mf7Oa2RMZrC0ka4XxIuCrpnsjqNon1M1w
         Ll84IC7TeppV0azVqlSiN/xcOErMu6fV8zNeYAKPWj3lisf5jWVO3kAXDCsA9RkcpmXd
         TyY2o1Fmn2IRo2Q/srDbWbbQpRRgsm++KrPmvcWdiZNkz9uXPxAAZbVgfME9SJPdceUa
         Y6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759672715; x=1760277515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dWLu+S/DZTCqT9ml2YWJnobsWuW0OeT93nD9juwMA1Y=;
        b=pLKo2xXUKJ6Vk8XkgqV2yTQOXz4GX4ImWBBeMWyHz+Prn+owMUdn/tFx7PIkMuKHMl
         EVJLBHzMR8VYIuWQ0wkXwvVtjYmLxksRJfLd0sDbElaSPa1sPpATv7MUG52IZ0tyASvT
         rQqAaTeCX8OILJ1z4PT6xiBsND0i4yJEdL9oaTApDvRypmnNIUavM7Xb7kJc1mcNX4Z3
         7dOHDVupNblXvI33VvY0E8CXpMCOinUs6P7MZFKpsmjLCBX5DfMgloWKqjQVxVRK/Cwi
         U4HgW9tiSO8cEICDeV2tp1X98tFnMto1nZxSoyzRExoOwdjMM34D5xGZbKds0ycId84A
         Jnow==
X-Gm-Message-State: AOJu0Yyj208QjQoOyVDsECjh1yfqPL6j4tCjxtuzLcIxWgFImiUr9FR6
	rX/dev52kIsrpHlBa9RBcZAP+fi76ySaJoROQZ30VyioWUe3HKfHNaDqaxBC7w==
X-Gm-Gg: ASbGncul9j/CZh/TK6+XcgwMI9e/ObWj0uNfR2PkAkYdPCOI8RPxajSfTL0Ecrd4mHm
	cVtnYBeSUdZPnGhigH/F5Yso3R41pyUAw9x2QFIHCZZlFLla5cLk9Au5l3ZY+40RhV4R4XzXLNs
	Iju1DLTLssdp89BAR+zaPscyAZ6g03LkF+d7QJ4TuCNA4VfPf7bDEsEJiAEwNkgoU3/t3U1+z3i
	VHxYcHXirjtJwZMY6WEtQaPQluVBRdM52xpLMNEcaujv9+GRFDC4gYC58oTNxGxZWIB8TWMY0bx
	LaIyt/qD1OHeOE5VuHhpko+dBANkxO6x3cPnHa7oskQ7SifoQP1T691eLH3PvqpkqPiiGDZ40iX
	01sQ9a//xWByQNOrGMc0wWK+P0VtI/DPaEFlJ8+pVV149wCs10YjTBF8=
X-Google-Smtp-Source: AGHT+IH5ceTY13ZwKcGDlwFtwt14IGWSmKHYIevB8XZumsRHR7q3xTEPwla5fbJ4PpfxLM4XMVmV5Q==
X-Received: by 2002:a17:907:6e9e:b0:b3c:f0f2:842f with SMTP id a640c23a62f3a-b49c3936513mr1155741366b.49.1759672715111;
        Sun, 05 Oct 2025 06:58:35 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4f314sm909200166b.69.2025.10.05.06.58.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 06:58:34 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 1/5] audiofile: fix multiple CVEs
Date: Sun,  5 Oct 2025 15:58:29 +0200
Message-ID: <20251005135833.879336-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 13:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120251

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

