Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33202E7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 10:58:30 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.11094.1735297103750963454
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Dec 2024 02:58:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=M9aJECnP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202412271058225c065a38cf23b8f522-hccmxg@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202412271058225c065a38cf23b8f522
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 27 Dec 2024 11:58:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=3hMTVwYbEdEHsJBpdro1b3xStP+apzX6Un0qQlgYL+w=;
 b=M9aJECnPe8BmSBp7TiskBsg/sEuMXUO1lsaLAdMI19bujSXdhNZGN6Qd9ev0BLKo4XSes4
 Vor2VRAFiJM5jZL2tI8f29P+MafGbZL6PKVyZNtW+63PQ+oIicsBvAzx3GluIEGmixwYaMQQ
 gTwx8Skhft0pAMVOsuq2ye7Jvz/6XHGNnLERb/tJERtcOUv74ZEN1HU5JjDqe1bczlBLzH8l
 /zU4xf9oR37O0QZn4PEUI4roX5/aD5oHhHZxKfgJn8rgs1Vr/VUjCH/zlReFhlc0sgRf31J6
 DqHfbBVIOUq+zWqSB3eflWxKV357zPVk/MhSFoOoOdGBjLwRMu8q3MRw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 14/15] audiofile: patch CVE-2017-6831
Date: Fri, 27 Dec 2024 11:56:14 +0100
Message-Id: <20241227105615.3303193-15-peter.marko@siemens.com>
In-Reply-To: <20241227105615.3303193-1-peter.marko@siemens.com>
References: <20241227105615.3303193-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Dec 2024 10:58:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114572

From: Peter Marko <peter.marko@siemens.com>

Use patch from buildroot:
https://github.com/buildroot/buildroot/commit/bd5f84d301c4e74ca200a9336eca88468ec0e1f3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../audiofile/audiofile_0.3.6.bb              |  1 +
 ...ail-when-error-occurs-in-parseFormat.patch | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0007-Actually-fail-when-error-occurs-in-parseFormat.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index 66194fdc8b..08709a35e3 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -16,6 +16,7 @@ SRC_URI = " \
     file://0004-Always-check-the-number-of-coefficients.patch \
     file://0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch \
     file://0006-Check-for-multiplication-overflow-in-sfconvert.patch \
+    file://0007-Actually-fail-when-error-occurs-in-parseFormat.patch \
 "
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
-- 
2.30.2


