Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC1CCEB2D3
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 13:00:08 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8032.1763211605289623464
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 05:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TOnRFdNa;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4775ae77516so31400025e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 05:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763211604; x=1763816404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4svifvfusqkfHMzVReq6bZJBVN8D5jCn6M72OVb8bE=;
        b=TOnRFdNarFnMsR7YrualAMeLmtSaYFnJPds/BVjZQnA0h+QsoWwzj1mC5vq3gcjMtW
         CTI3lk+Ss3q+sxe5PoxLCOqT2Iak2DymacngtyGeJO2tHyvLsAeS4URFsEn+ptugwQvq
         x61fknjqbj68ApszkAVerLm81srn7oAu5cLooa0a7+PYRoHzGsK2E/gBBqdhkAdjE7Cg
         hlsD+tpgoRTx2L+4VTlx82Eigo8PZocVRxrxncW+yXpsYXA/bL4nvgm6+BfYMeE41gN7
         8Q2nV/HJgAO7DprozF8V9+1IVGhIhqUCTf7QJleYRgwrvk0reaAzdI8GcZRy8oBt5gE8
         lkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763211604; x=1763816404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x4svifvfusqkfHMzVReq6bZJBVN8D5jCn6M72OVb8bE=;
        b=ncaALL4JS6KcO/tWf5OOjc6QOYwExPNDIsqHeS0ugeOY1VScmoi8kw/ZzD2uXWlB97
         IfRSY3XF98bU20le109Dtsi9sMetT0+Mq7fwegG3xmflKmpVflColwSVKDCROrzqMYDX
         +QmSAxBZvunmRi4haLzmPQ7MRvVS7k61PGzoB3Yp9SulXOCi79K6dHevpXPD35AsRSLa
         4FQYYdFILZdohIU10YoHt2JVf7VtT5DdBvXzHbPVUbzs/n9HA56rOexnVHKlLAJit5K3
         hu35dWXI/wRSI1Kwb8KUG1JzgoJZhJl5LR5nq1AgHKxSpvdNpEChO2P3jC+NLgfEB6Me
         n9bQ==
X-Gm-Message-State: AOJu0Yy0oLIoPi+CLEfhTjUp4KHM2GIYD9uhx7zSjYlVzQ9ZfDBDscw7
	TrE2P0zy3+1SYSvi+ketuuOXcwX0u8ZQi0ULV1ajZ1vnxK/4deYDIK+A0A4GvIr3
X-Gm-Gg: ASbGncuHgQJ8msvZN408dYQKM85x47u2t89zmY/ZF3+ut2AgR3xZiweuo+VPtXAwxeN
	5Pk44UYVK3wPm44knqqu91p26sFifHahWoZGVW21GPlUuR0jWQXJX/+81Ua0fxOkWKxwQJYcgRY
	UH5vnop6vNlywl8pqaAp0CDgSkOuoAVN4cflnWhGeGGDMGeZ4BZaRidH1SIyqdmB9ulBwDOnzIG
	NK1HhqN5bmT3SY+sODzheTbWosq4WQrwbUy0kYEZ82EDAGp09Dpe/pFJjqu64tb2NGTa2bnH8PB
	44dxg0ynN97cj5Y5pjkgt3WpfkA1xatLekpUjStXGwwhvE7C4q/6ZzHT2+/P9UUVHyANwH6/L7Q
	MbOhr56Q0s/mdsRhAunFmWeoCukg4KwZ6SdInZndOajZgccRnoQmIm4S990VYxuk9Ky7GXRta0w
	==
X-Google-Smtp-Source: AGHT+IEo1rzLE+3Yg0QNiFgGY05sFwU+As7Yw5WCbqp0d1Y3kUvZNG7qDvYXHBL+NManM7C7O42Iqw==
X-Received: by 2002:a05:600c:c4a2:b0:477:c37:2ea7 with SMTP id 5b1f17b1804b1-4778fe9ac28mr57720405e9.21.1763211603075;
        Sat, 15 Nov 2025 05:00:03 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e953e3sm198104075e9.14.2025.11.15.05.00.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 05:00:01 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 2/4] audiofile: patch CVE-2018-13440 and CVE-2018-17059
Date: Sat, 15 Nov 2025 13:59:58 +0100
Message-ID: <20251115130000.1121405-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115130000.1121405-1-skandigraun@gmail.com>
References: <20251115130000.1121405-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 13:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121727

Details:
https://nvd.nist.gov/vuln/detail/CVE-2018-13440
https://nvd.nist.gov/vuln/detail/CVE-2018-17059

The patches have been backported from Debian - upstream
has been inactive for almost a decade by now.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e16a7d11d1dc0c577cb17652085b0c183c791883)
---
 .../audiofile/audiofile_0.3.6.bb              |  2 ++
 .../audiofile/files/CVE-2018-13440.patch      | 36 +++++++++++++++++++
 .../audiofile/files/CVE-2018-17059.patch      | 35 ++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-2018-13440.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-2018-17059.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index d44ce5c004..f992104e4f 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -20,6 +20,8 @@ SRC_URI = " \
     file://0008-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch \
     file://CVE-2019-13147.patch \
     file://CVE-2022-24599.patch \
+    file://CVE-2018-13440.patch \
+    file://CVE-2018-17059.patch \
 "
 SRC_URI[md5sum] = "235dde14742317328f0109e9866a8008"
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

