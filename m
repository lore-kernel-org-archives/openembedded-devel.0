Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8173CDE021
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 07:43:47 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12996.1763106225275916778
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 23:43:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QRqDwncE;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso1309092f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 23:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763106224; x=1763711024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOhZG6CbHzSIWP6PP2mozWzGKhQgwUrRqTEV3xS5QZA=;
        b=QRqDwncEU5MEda3nNMMhUlk0RgM5KCLrkMjDycTwFLIhiuzHnH0NIySaRnnrE21DNK
         d7TCUKkeqzBb2dgl9oeSKi+ZuYNeRWCLnf+Wy28BeDJInKMQDmkmtgzJXjrv5MHhBlYo
         V7raN4lSaXhQhCTs1GgWfMvptaGxydoshEe/co1EM3noQQ/ctatSu+TdyC/fnKYqwhSG
         WKyGumlHytAwmwuTlFaHnJCP6xmhdakvmLN6BcjOkU72sQcqwdTO2DCK2LzZRZHBxgz2
         sThglTtlABASm6Fx0hKB9Ashg4W6LDw/Jt9oEajI6vmDlF4zX9f69rnbafNfJiuHAPGv
         yCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763106224; x=1763711024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XOhZG6CbHzSIWP6PP2mozWzGKhQgwUrRqTEV3xS5QZA=;
        b=P0naTNyXSxUOQUUWvLuwYlerz5QFK0gG8EGkPwjnvlwtT84kESK3lC7/D1N/nmvQFS
         pMPgWlExdNAgZXcv/r1hqCHDouoKB/OsSJcUFB7LEIoWZR/wNrMDxUeVdMt+P0DW/fAU
         SChtyqSfsiIsaQ7P5EdouTgVFQYzOaK8tSrsYMSW9P1r+Pz7mLPIsswQObClULdzEG6I
         FF+XzYUjNB8B11SWuiIqdLPlxcgnlbcU2QRU5gYUZy1sgplispdPNXvjbAhmQX3CLfBt
         lOMzNyt3IrEHNIpWzTB83uOb/i/VsZJliLT5GT4rg4SPYY5Uq1pjo+zVKdTWHOnoqVAN
         jAvg==
X-Gm-Message-State: AOJu0YyDNiyFIELfMar6Im9RwFELUERItFtFdLEHqprl8tzUBDXClA/L
	1KvvR8lEv43RZiuL0KojzowZvecUeQ7rOuBXTchv+21lO5lC017Z0gVhIDwL++oo
X-Gm-Gg: ASbGncvE6M6dVVfWfwxOCV1zIk3VrYGfDVUC2SLRe+Rvxwp04PA03vhdRWtnd7j+0aW
	rcEqKoIusWxUm7W8Nk2n7i+gjcfwvYtYXD8GW0CiYyag/KJphjFBWDdj72aR0Rd98WfLeMEHe5X
	XppJ3PJE5DWwM06MRUEjz3PuoCDpW4oMTwCfR4pHvoakuc/Wrxtxo73UMUuM1Fh4dBsiEq27XNu
	I4e3iHzNIcbijNZG0C+WHSzWwekDEJ4b1dgHZ4lcXzV6F2ORy7Rkz7Vi6yUiwYvHVfBXSlf/6Qq
	7xK+8QmRf3kTPiVtFweJ/WklFLBE9MvuaFRLR+GOqKxzdukysCcGpZlh5wNZ5Q5A+ZILmCaFV9c
	LwRwgE5DnYLWaHaLPT6pSZ9QC4Xf2hEI0vCzFMTi9ibsGypVtFok6sldV4SGXAv3XrUTj+OIAxA
	==
X-Google-Smtp-Source: AGHT+IE47Vwl+ByzaPMNtlkVGpcC8osDur/pcxQfjHV5Z8qd0+ytvANAOEL3S3VT/8IzTrUEoqw2DQ==
X-Received: by 2002:a05:6000:438a:b0:42b:43b4:2867 with SMTP id ffacd0b85a97d-42b595a3afemr1812163f8f.63.1763106223495;
        Thu, 13 Nov 2025 23:43:43 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b622sm8090954f8f.29.2025.11.13.23.43.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:43:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 4/4] audiofile: patch CVE-2018-13440 and CVE-2018-17059
Date: Fri, 14 Nov 2025 08:43:40 +0100
Message-ID: <20251114074340.2716135-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114074340.2716135-1-skandigraun@gmail.com>
References: <20251114074340.2716135-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 07:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121688

Details:
https://nvd.nist.gov/vuln/detail/CVE-2018-13440
https://nvd.nist.gov/vuln/detail/CVE-2018-17059

The patches have been backported from Debian - upstream
has been inactive for almost a decade by now.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: no change

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

