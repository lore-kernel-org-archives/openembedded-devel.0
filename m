Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99B2CD5BDF
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 12:06:17 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22297.1763035576739472992
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 04:06:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=loa3DY6m;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47721743fd0so4376655e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 04:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763035575; x=1763640375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zC4aoo/eyvJUjokazg/F69nU8S+RomJN2prhpse3kDg=;
        b=loa3DY6m0anidyJlg8tUQvef6Iax0E1rD20VTla+4M66YfrcWnis6vK87TEuUy+Fwk
         pHlSKRRx0KXq1oULaD8f7A2lBqbgfsWqG5lKGdppFBts7E9BDarcwYbFP3phfkrxFbc/
         eSm3arYh8kSyjOD0hgJ9A1MkJ4Lg2BeXYvGNy6rgB+bfNEZBgwIq/6OtiaouE7876MQc
         kk/N2Yq5cJi42ebdxUHCEEjBzIRQDhm4jVri/tfqx65Ouh0Iumk8kxOyw1VKEBqfbUH2
         a4qIL75jHFnDYmC2ZgrhebfuWqgWlpQQfC8XkKnLucZt2DcOn+Hat3wVaOS+nl931de3
         l4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763035575; x=1763640375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zC4aoo/eyvJUjokazg/F69nU8S+RomJN2prhpse3kDg=;
        b=lBLiPlmvOJELOOzH9D3DIoyEjfpRi0fGsbw6DR8IdMhDI6tNMlMzysz53YzKCEjxvT
         62BhnaEwFJPMTutZxzRX/OrvvjiqfWGiQCwQpg9WkfUlvbaJ0WCLbkQ81p+VJ3h7sq/+
         rlNAX11XvLDLQTCi34T3TKdLmXi4gEXh24J9gOVuAZ58FwryyHpbFecb2xBbOrc4DGJU
         o0faRsh1dCQ39ItcwNH6Ky+NYjKpwVzhO1E0ArrLnuKgPj0cB1hsBXfupbhG0gWxwDVU
         7OM0zpkNCUUjVySJMjj4UJSNWq6TpRiWktT3Ufaj9GksxDpZL9qLYqeVeZiOo0cI1UaH
         PlCA==
X-Gm-Message-State: AOJu0Yx5Nd77Txk/kDhcf1EnUn7y4DJEzP0VSEE4EN584MC2ceQBLRYx
	eMJa4Ik/mnbW0pjkDWfZ+LnMAr73sVqGcpZ8j/eQun0SulsICCo6uY9Exnh/bQaW
X-Gm-Gg: ASbGncsiJxKW+eQbQmSaS38nfEhSj/aqM41dTu1/hGULxz5rr/UVXn3bzZHH6JWrWpS
	A6AgvQ5DIFouYwrip8wDeVEkwwX7Rc0W3g6vLvKWCtDAWXj6nKoNxNBpIezWrdVdjL7Tobdyhf6
	Jtd5kMhq2wIjOhLVibzUv8tBVGKWsRCJ2JnfqNmsm6YT/FRjIxd8TOVUt97wLxJQCaplddPAk0W
	SF/Iz44ARmFplEEstlIxnc2R62DrHgbyvtD9Eruymb+Bmb9jbmUp2odY1fq69obUU9E175fkGf4
	9zDOJsNHPmRGI/3LNQRE2EEVy6pslOs3bqxyTVCZLEB7psuS611/u/ATsHuUnme97aVKDYQdGso
	vzC5ii4PE+PoinyD4wm0AG1LNZO9T3KjLt4Bh4V+bSZnzzRhzhIfPBa2T7DY9ikRx8TD7UvDpeI
	Bm6j7HTChu
X-Google-Smtp-Source: AGHT+IEfcf54dFSbBP6/oIOcUI2v+zFEYrcrMtPUKFeHSU02f/NVqRZHojWqbFbDXIh1X5A4Evf6Qw==
X-Received: by 2002:a05:600c:4f91:b0:477:54cd:202f with SMTP id 5b1f17b1804b1-4778707095emr66270885e9.3.1763035575010;
        Thu, 13 Nov 2025 04:06:15 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e85627sm3974561f8f.16.2025.11.13.04.06.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 04:06:14 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/4] audiofile: patch CVE-2018-13440 and CVE-2018-17059
Date: Thu, 13 Nov 2025 13:06:11 +0100
Message-ID: <20251113120611.2590707-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251113120611.2590707-1-skandigraun@gmail.com>
References: <20251113120611.2590707-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 12:06:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121648

Details:
https://nvd.nist.gov/vuln/detail/CVE-2018-13440
https://nvd.nist.gov/vuln/detail/CVE-2018-17059

The patches have been backported from Debian - upstream
has been inactive for almost a decade by now.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
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

