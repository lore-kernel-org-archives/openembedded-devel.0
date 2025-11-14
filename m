Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B617CDE031
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 08:24:58 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13531.1763108694792309520
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 00:24:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GhKEgEWY;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477775d3728so17033305e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 00:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763108693; x=1763713493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCf+ZAPnPOxpf0joqsQd7PqPXLfQk4+dFJMHo2No3VM=;
        b=GhKEgEWYm1BaXyU4hWLYjR/Dwop8cWS4CUWGe5Eg2XHT5CgRfv9NFMIH5oHzwj8VDV
         kY3mdqmQrz2hebRW/hnQ/7/7ERTlP/4ld+tcIwVQ0jet2ozpZPGbb45kvZKU/lBquW7W
         4O3PppR/CUDUbEIp2OzO2cq7ElkSo95XfA5mPtA+uc6+PqPm2Gd6Cq32cMcEGVLqXTG/
         qx6KOPatppfkCwxWVzkmRrDlcWRYaBqd/TrUA/8Qzkz6V95Xhx8sBqulJ5nnTbaBpdZY
         9gh9WgsmduAfmGdJci5ZBIv9iOxA2CRE7qrr5mGN/FTWOpCf2sW/OpySkwCh948xeWXl
         ktlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763108693; x=1763713493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MCf+ZAPnPOxpf0joqsQd7PqPXLfQk4+dFJMHo2No3VM=;
        b=oE0eePE0YY3PZV0iy3j9v0RgKiLOBnQvPb4hgfEpmW7QjngYxA/taxuQjhwVeu+gcB
         huOQccDac7DZkBqf5TU6+eZ94RLJyR13NY4ZUfaHkakfrXWouYnwJgY7iX+QZB2PAQqk
         yisnswA3iEcblNGohOSyU+ddmPcNxESXz2OCtywjRPpSIju5z3dscs7oy1eoGVS5rXv/
         jJ1MQ3pIsmMbhpYgv578kJsenGKLv7LbcF2BAeR2hrKdIw7nPQSBfryUe2ihEdciY2W7
         gn87Qj50OJMHjQSLRt7Aos0NXWIFmUIJp1yxAFTBSsv4dDHUsifsrUKM9nl9ibL2R3eN
         CaKQ==
X-Gm-Message-State: AOJu0YziAclnxNWT09fPPpl/wRJdrPr8QP021xRLFpT2xJ8Gl/01SjYw
	oFfe6lL1ZEi3VWzV810ceCjR6HenH8FJr4sf4vckmSdxMF61HJHG8MMT/lEX4md6
X-Gm-Gg: ASbGncuXSbOqFHAgZhKlnsA2sVh0dLSXEDEiB4wM1hMfrTIQmGQuAFmcU9bJIz5vuxv
	sCMNC8Wm1ApfBF3diLDaTR2PxuKs14tYmWveaYHWZhrS0LsA99T5+ZoQzps6gn6cqbgAcEvh7j0
	ndZCM4erXRI3tM+EuVYoovu6X38LYaUc9LLGaB2Pp4OE56VDE82vF0W0FCFaiHFpYoStEK96rbl
	+RYT0J0lCvTVLLFRwVftH17U6RSJj9rITGMTK5AVGyk8bP6p09nOOpMxzcVBIGh36lyPHEXE/Ty
	7Z1W7vR75x2BaYjkcTYFr3ctiU9qrJan4M72K5AUg7fB/YsH9a3hYRaplV1Mq0yHDoBpkvP4iUo
	ZDHj+0vjAZcUBjCPsWSxaCMaOtVOJTkYE6mnvrLdPEImCDkLbV7SkleCt93M2GEDc2iaA4NVBEQ
	==
X-Google-Smtp-Source: AGHT+IFpTFnxPoLljzg+mRiiHnQVlfFPhIuzR+WnoH35eBnUumvHfMjoPRVjpAJLIBk1bkSSSvlpyg==
X-Received: by 2002:a05:600c:3b0f:b0:477:557b:691d with SMTP id 5b1f17b1804b1-4778fe9b23amr17738475e9.25.1763108693012;
        Fri, 14 Nov 2025 00:24:53 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778f247821sm53838325e9.5.2025.11.14.00.24.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 00:24:52 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3 4/5] audiofile: patch CVE-2018-13440 and CVE-2018-17059
Date: Fri, 14 Nov 2025 09:24:49 +0100
Message-ID: <20251114082450.2720967-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114082450.2720967-1-skandigraun@gmail.com>
References: <20251114082450.2720967-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 08:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121697

Details:
https://nvd.nist.gov/vuln/detail/CVE-2018-13440
https://nvd.nist.gov/vuln/detail/CVE-2018-17059

The patches have been backported from Debian - upstream
has been inactive for almost a decade by now.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: no change
v3: no change


 .../audiofile/audiofile_0.3.6.bb              |  2 ++
 .../audiofile/files/CVE-2018-13440.patch      | 36 +++++++++++++++++++
 .../audiofile/files/CVE-2018-17059.patch      | 35 ++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-2018-13440.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-2018-17059.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index b14b4792b3..cc7fef2a26 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -22,6 +22,8 @@ SRC_URI = " \
     file://test-for-CVE-2015-7747.patch \
     file://CVE-2019-13147.patch \
     file://CVE-2022-24599.patch \
+    file://CVE-2018-13440.patch \
+    file://CVE-2018-17059.patch \
 "
 SRC_URI[sha256sum] = "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8cb59782"
 
diff --git a/meta-oe/recipes-multimedia/audiofile/files/CVE-2018-13440.patch b/meta-oe/recipes-multimedia/audiofile/files/CVE-2018-13440.patch
new file mode 100644
index 0000000000..f468696845
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/files/CVE-2018-13440.patch
@@ -0,0 +1,36 @@
+From fde6d79fb8363c4a329a184ef0b107156602b225 Mon Sep 17 00:00:00 2001
+From: Wim Taymans <wtaymans@redhat.com>
+Date: Thu, 27 Sep 2018 10:48:45 +0200
+Subject: [PATCH] ModuleState: handle compress/decompress init failure
+
+When the unit initcompress or initdecompress function fails,
+m_fileModule is NULL. Return AF_FAIL in that case instead of
+causing NULL pointer dereferences later.
+
+Fixes #49
+
+This patch has been backported from Debian:
+https://sources.debian.org/src/audiofile/0.3.6-7/debian/patches/11_CVE-2018-13440.patch
+
+CVE: CVE-2018-13440
+Upstream-Status: Inactive-Upstream [lastcommit: 2016-Aug-30]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
+---
+ libaudiofile/modules/ModuleState.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/libaudiofile/modules/ModuleState.cpp b/libaudiofile/modules/ModuleState.cpp
+index 0c29d7a..070fd9b 100644
+--- a/libaudiofile/modules/ModuleState.cpp
++++ b/libaudiofile/modules/ModuleState.cpp
+@@ -75,6 +75,9 @@ status ModuleState::initFileModule(AFfilehandle file, Track *track)
+ 		m_fileModule = unit->initcompress(track, file->m_fh, file->m_seekok,
+ 			file->m_fileFormat == AF_FILE_RAWDATA, &chunkFrames);
+ 
++	if (!m_fileModule)
++		return AF_FAIL;
++
+ 	if (unit->needsRebuffer)
+ 	{
+ 		assert(unit->nativeSampleFormat == AF_SAMPFMT_TWOSCOMP);
diff --git a/meta-oe/recipes-multimedia/audiofile/files/CVE-2018-17059.patch b/meta-oe/recipes-multimedia/audiofile/files/CVE-2018-17059.patch
new file mode 100644
index 0000000000..e9b560102a
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/files/CVE-2018-17059.patch
@@ -0,0 +1,35 @@
+From 822b732fd31ffcb78f6920001e9b1fbd815fa712 Mon Sep 17 00:00:00 2001
+From: Wim Taymans <wtaymans@redhat.com>
+Date: Thu, 27 Sep 2018 12:11:12 +0200
+Subject: [PATCH] SimpleModule: set output chunk framecount after pull
+
+After pulling the data, set the output chunk to the amount of
+frames we pulled so that the next module in the chain has the correct
+frame count.
+
+Fixes #50 and #51
+
+This patch has been backported from Debian:
+https://sources.debian.org/src/audiofile/0.3.6-7/debian/patches/12_CVE-2018-17095.patch
+
+CVE: CVE-2018-17095
+
+Upstream-Status: Inactive-Upstream [lastcommit: 2016-Aug-30]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
+---
+ libaudiofile/modules/SimpleModule.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libaudiofile/modules/SimpleModule.cpp b/libaudiofile/modules/SimpleModule.cpp
+index 2bae1eb..e87932c 100644
+--- a/libaudiofile/modules/SimpleModule.cpp
++++ b/libaudiofile/modules/SimpleModule.cpp
+@@ -26,6 +26,7 @@
+ void SimpleModule::runPull()
+ {
+ 	pull(m_outChunk->frameCount);
++	m_outChunk->frameCount = m_inChunk->frameCount;
+ 	run(*m_inChunk, *m_outChunk);
+ }
+ 

