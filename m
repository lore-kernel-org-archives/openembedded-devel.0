Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BACCCD184
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 13:58:40 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.11020.1759672718968888680
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 06:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cxjebk8D;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3d50882cc2so756472266b.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 06:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759672717; x=1760277517; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F2D9fQSno8bBNzEQvtflJGA03xsaYNLvFA9fjKJa+zQ=;
        b=Cxjebk8DK8I5suFvdoH2hFvQANc35Eu5H63lAyXbO2atd32i8cm+zcvQe2BVknaPWr
         J4lAkn2AcZxFylu9L6L0h0OpNXkd4m6IReyYyMuByEPPXNlWCKgWY1h9ybc29xwF3oks
         eQSAm6yBEj1pHrYqPsZe3xOXez1PgAUWC//5u3NT287qNm+gCb/9gd7qRV8tXeXMRULA
         VnJNr2XIJdwkL2cjtke8XsSJe77VzO+BNr8lVuaPK0fUEcreGSc2OkT5/s/BqgsdjWS5
         V83aGnZQhSQIKUMdNgr2NTvC3DDcm4Tsr6RYRc9XV96SzEcUVV9PkkySd804Z6ymq50V
         k65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759672717; x=1760277517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2D9fQSno8bBNzEQvtflJGA03xsaYNLvFA9fjKJa+zQ=;
        b=PQ5vqHDuQmxyjUbp+vM55HbIW5Q53pFQJQUq2/+k7lH4jvToh2c6m3rzPkmDbfeTCr
         k27GxdBfuhMOPz/7RCxZB2+O0PqYE/YZeqhO9MkTw66vxtsRLbbIzEhw6LwSVE9bEsSE
         qpkq4YijgFgdLHv2PPW9T/EYx0PTHVSqqSPY6EzO7t1PJvncxdLFpcF+rFx9a6gl9VLh
         DowaH2xlq/10b+sIX/ehGwAXvuT4AOtKPv1UCn3bChDPJOVs7UHv9MXGcMnw9AfJEMDQ
         desGTZ6jXmZ99Aab6/k6lfyLgsyPhcCFycLJ8ficpHUsFpooCnkfTdsM2TQ0AcNcr5Lm
         APwA==
X-Gm-Message-State: AOJu0YzzCzxACg9IsAPr+7ZixFsfvFz+DqUkYLPVPsevqUN5d9owNVEF
	+sWQzYpI6pwGmaUsON61z4Sjay4NcLzhOp8bHqX0axptvUlrVRg2Yhm7hIASBw==
X-Gm-Gg: ASbGncvE13j03ilgEOuuS4FTCp1Dv2vSUs+HLQwzmIVDa+uGGR/UDBT+SBmP+Zq+4g0
	h1xJ0qXFO/Vx/ZEAdVelnpCXoU6MGo/x1xXNvZecGHwNX1JWo1znjGLpKbD7n8av7EqDNke5CvC
	iCPWAy7fiaOg0+I7PQuWl8pk9i/EQZGwoHnL5iG27hVtWo5iCWwEPkXrDaqbH1dEbybi9xlZVBr
	w06UB8rxQyh4I9e+tAmd4Og5O85xkxTIAc3y1DMPMrVuSmVq/8HeENfRzZmNM3xP6aJSXLU2dAw
	KktUt2Fbgi57CmQmcq3yiD50lmwqEi+Rvpa+BVwBtmmmXpKoKCE3EHTQ2ECePzqnwmxWSF8YB6h
	HJxdK/tC75sJafR6zxSFzPqJOsc3WFAxDPt26NdedKEIblfBOdTmjciitGSmPFa/dZg==
X-Google-Smtp-Source: AGHT+IGPZjQtry/Ip0YjHqAopUMrcKzuQ7/PNZBGzhquLU1ipv80tRIpf4GV+faZr9w7UFpWiyCMDQ==
X-Received: by 2002:a17:907:868f:b0:b46:52f2:5493 with SMTP id a640c23a62f3a-b49c4be73c4mr1169948466b.44.1759672717187;
        Sun, 05 Oct 2025 06:58:37 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4f314sm909200166b.69.2025.10.05.06.58.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 06:58:36 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 4/5] audiofile: patch CVE-2017-6831
Date: Sun,  5 Oct 2025 15:58:32 +0200
Message-ID: <20251005135833.879336-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251005135833.879336-1-skandigraun@gmail.com>
References: <20251005135833.879336-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 13:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120254

From: Peter Marko <peter.marko@siemens.com>

Use patch from buildroot:
https://github.com/buildroot/buildroot/commit/bd5f84d301c4e74ca200a9336eca88468ec0e1f3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9d668989b1447fb19aff55c1a47acdf8d4e8c5e2)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../audiofile/audiofile_0.3.6.bb              |  1 +
 ...ail-when-error-occurs-in-parseFormat.patch | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0007-Actually-fail-when-error-occurs-in-parseFormat.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index 8aebe88f26..3d0ce3bfbc 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -16,6 +16,7 @@ SRC_URI = " \
     file://0004-Always-check-the-number-of-coefficients.patch \
     file://0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch \
     file://0006-Check-for-multiplication-overflow-in-sfconvert.patch \
+    file://0007-Actually-fail-when-error-occurs-in-parseFormat.patch \
 "
 SRC_URI[md5sum] = "235dde14742317328f0109e9866a8008"
 SRC_URI[sha256sum] = "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8cb59782"
diff --git a/meta-oe/recipes-multimedia/audiofile/files/0007-Actually-fail-when-error-occurs-in-parseFormat.patch b/meta-oe/recipes-multimedia/audiofile/files/0007-Actually-fail-when-error-occurs-in-parseFormat.patch
new file mode 100644
index 0000000000..38294ca200
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/files/0007-Actually-fail-when-error-occurs-in-parseFormat.patch
@@ -0,0 +1,46 @@
+From a2e9eab8ea87c4ffc494d839ebb4ea145eb9f2e6 Mon Sep 17 00:00:00 2001
+From: Antonio Larrosa <larrosa@kde.org>
+Date: Mon, 6 Mar 2017 18:59:26 +0100
+Subject: [PATCH] Actually fail when error occurs in parseFormat
+
+When there's an unsupported number of bits per sample or an invalid
+number of samples per block, don't only print an error message using
+the error handler, but actually stop parsing the file.
+
+This fixes #35 (also reported at
+https://bugzilla.opensuse.org/show_bug.cgi?id=1026983 and
+https://blogs.gentoo.org/ago/2017/02/20/audiofile-heap-based-buffer-overflow-in-imadecodeblockwave-ima-cpp/
+)
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+CVE: CVE-2017-6831
+Upstream-Status: Inactive-Upstream [lastrelease: 2013]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libaudiofile/WAVE.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libaudiofile/WAVE.cpp b/libaudiofile/WAVE.cpp
+index 0e81cf7..d762249 100644
+--- a/libaudiofile/WAVE.cpp
++++ b/libaudiofile/WAVE.cpp
+@@ -326,6 +326,7 @@ status WAVEFile::parseFormat(const Tag &id, uint32_t size)
+ 			{
+ 				_af_error(AF_BAD_NOT_IMPLEMENTED,
+ 					"IMA ADPCM compression supports only 4 bits per sample");
++				return AF_FAIL;
+ 			}
+ 
+ 			int bytesPerBlock = (samplesPerBlock + 14) / 8 * 4 * channelCount;
+@@ -333,6 +334,7 @@ status WAVEFile::parseFormat(const Tag &id, uint32_t size)
+ 			{
+ 				_af_error(AF_BAD_CODEC_CONFIG,
+ 					"Invalid samples per block for IMA ADPCM compression");
++				return AF_FAIL;
+ 			}
+ 
+ 			track->f.sampleWidth = 16;
+-- 
+2.11.0
+

