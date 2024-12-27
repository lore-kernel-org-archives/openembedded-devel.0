Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37634E77192
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 10:58:20 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.11090.1735297095810019207
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Dec 2024 02:58:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=bmE8zWhJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20241227105813b9ca338b895b755a07-u9kcj_@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20241227105813b9ca338b895b755a07
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 27 Dec 2024 11:58:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=bUORKpNzXywz6MiQ+HW3S/Txkag1+du1gWujKSF4YyE=;
 b=bmE8zWhJvh82SUYpGSYbbpeLXM4IZQj5pP+T/XS35pHlGSWqGIlD6uxf2+mtmdLbhlqBhe
 bgrDH69orTiC7G1o3B/IW9TOF+6GBi4oQVxjMH/BiXVGtpXaXqYtyps2X7XU0vUQig49KSNQ
 q88SIOdRIO/MZwNUH0ypVxoybJFG28LHNay4MZepJ1CUojtg63x7TOwFNeGmD1wz7cxDrd96
 NU7SoVsJ5sUw+xTIaj8drD2pwSbv996DOOleQFLqELhCQZIuKWYkOYmC7tnNZvLJQ4jaB1sq
 PFXsxnnOEIGQCtYO8vKMPECvC0Hqjzr6TPSGHUnpDd9AznI/GTSgBIKA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 12/15] audiofile: patch CVE-2017-6829
Date: Fri, 27 Dec 2024 11:56:12 +0100
Message-Id: <20241227105615.3303193-13-peter.marko@siemens.com>
In-Reply-To: <20241227105615.3303193-1-peter.marko@siemens.com>
References: <20241227105615.3303193-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Dec 2024 10:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114570

From: Peter Marko <peter.marko@siemens.com>

Use patch from buildroot:
https://github.com/buildroot/buildroot/commit/434890df2a7c131b40fec1c49e6239972ab299d2

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../audiofile/audiofile_0.3.6.bb              |  1 +
 ...ues-to-fix-index-overflow-in-IMA.cpp.patch | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index 2c690437c1..67c1992cc4 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -14,6 +14,7 @@ SRC_URI = " \
     file://0002-fix-build-on-gcc6.patch \
     file://0003-fix-CVE-2015-7747.patch \
     file://0004-Always-check-the-number-of-coefficients.patch \
+    file://0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch \
 "
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
2.30.2


