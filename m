Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CABCEB2CC
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 13:11:18 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8213.1763212271165742873
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 05:11:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tb2sG2tz;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-471191ac79dso31067125e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 05:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763212269; x=1763817069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDxHwhIMfs3QVyDDI9xksuhEX5TKYQilz7LFBJGKNwc=;
        b=Tb2sG2tzngvNyfp8zTj2VQrVKY1uEbyXV41GfnnGF+2oaZ0MTsaZdy4g3/WUywXA4d
         ZGE6stFlXUdu9esihGUDMealu158m660b5tIyvwrDRUXFBJhmtT5Np07PYVSLsmHHGZJ
         mHj3sVQeZ3dEbN93ITw4xC0vGNAQCPGbZ9NcWrXEuQESDqvGebOEGBNEvXq+pYMM4PXf
         xb3+9BGLQds3oDgmGbnriz8HtodmJ5VoiLEk8HKAaKJGq0OYjj5fwvpAHvHxP1icWy/k
         +SrL9jxvFWb62CR8gl8EQZlYQbvg4oiNQQGuCZzfT7sgx9OF+66MihSF8xMNBr9W1wNR
         e95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763212269; x=1763817069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UDxHwhIMfs3QVyDDI9xksuhEX5TKYQilz7LFBJGKNwc=;
        b=IgB9sX/g8QakumuwES7jipWtRK+qsJyK0jxuCncrOQyFRXSZYisKzwdJ/lYNWcxe7Z
         GJ9DGewYZmEkP+ZUMmQTFTs5iBN5h+79bNaAFwwgfeGYVKYP9CUO7Y7egwK0PhzS8z3Y
         yUxOpBVlOkQDW81kFLFpMv0an3nBEdOPYZmOamgXIfchcE2AECdPpYwmR1TzonnY5qSY
         t9Q/Y4uBR19+0Gan9iHoHfoZoA68Fnrq8eY/P6Go+eOIc3DMW/F4eN5Wh9azTPwCUJEG
         45gkbesnjHYeCaFsoKRHri0sbvhU5ZApTo3Lf5olh8wyi4NOCxsAfG8D7/JP/jmUwu7n
         alAg==
X-Gm-Message-State: AOJu0YyCjSCRPDVUiDeELtHKfvhze34n/idQ7rLqdrqJ4TrcLZ6lQYm6
	xdmFa16Afv3IoZSmVr/18ATf0E2xKu1kiUEQ/MO/PAaLZCmAK9CaZ3O4bgH4qYSB
X-Gm-Gg: ASbGnctEvPrhOXvZ4lhfcdjQNTQJJwkua35Y0lRzBVszCTvVfQ18OGjca8SFqQaDZUw
	6xd81naNsHRtsveog7puvYZo9nDcQoldyzSxQP6sbONnZAHiTz0DsIdM7fMYDMzTeZ9/XKGac/5
	+faNb3f5spt3OQOyqfiRgrGQd9ZzNkNJCTIx0inJWf0nAo7+j8TMUXzOUHhLwcnOnRnfWn5YRkM
	wQP0PNHdGXZY2C4AbIQB3H2CjYRYZv5XbaaWv5/nc+SlO54jLBI8uIyYeiiIVBIGQUy/ZsxSBeF
	QwdKpa31t1dlsck3b7vsnivxAW6cfe2TNnBCZkZY8eTtd4hcbaExE6fsndVkSR7p9JC9ajPkzLX
	QrxHfFA/kKviftUif0eqvdruq+IpPjn3idmb3InIYzPTeczp8UBWqQUzrNOR+9BmU2/SWWlibmS
	Kuyi5BqQTe
X-Google-Smtp-Source: AGHT+IHDo3JCUQ7AJ3NSy5MQr2Z1LDV/VPhbp+Vqioo9yljUfFpUXO0ZIooKU15dK8/5tOvXm4ajyA==
X-Received: by 2002:a05:600c:3b19:b0:477:6d96:b3ca with SMTP id 5b1f17b1804b1-4778fe5522fmr67407515e9.5.1763212269400;
        Sat, 15 Nov 2025 05:11:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47796a8a695sm42868995e9.13.2025.11.15.05.11.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 05:11:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 5/6] audiofile: patch CVE-2018-13440 and CVE-2018-17059
Date: Sat, 15 Nov 2025 14:10:58 +0100
Message-ID: <20251115131059.1146238-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115131059.1146238-1-skandigraun@gmail.com>
References: <20251115131059.1146238-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 13:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121734

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
index f9683bd0c6..4c368f8875 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -22,6 +22,8 @@ SRC_URI = " \
     file://test-for-CVE-2015-7747.patch \
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

