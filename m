Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 310A2E7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 10:58:20 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.11090.1735297095810019207
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Dec 2024 02:58:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=MbxSYHQM;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20241227105817f69bc38191704ea852-fjjd2d@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20241227105817f69bc38191704ea852
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 27 Dec 2024 11:58:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=7qPIj6So0nRyJlwBlG+OR4va1xExmNHJ148LqrTH/io=;
 b=MbxSYHQMgyF1o52FashV0hYt34wkrtjWRa51jPB4yihjghjCcQV7UUedYHsx6wEAbDOpPE
 vgAPTxxRRefb6EarYHDbA+8PDsKIkYOOQI8W2ZW8UxoMEMrWF7ptcCEVQqbvrbnIecGBs0Dp
 oqfxjvODME1ER8ILOpVhDu9Fhe3p+xFGbQK7rrQwxeMD5qhzZpREMbSXM2c/dZx/yAzDPu3K
 Ha0E1hlqIgSt7etp0MzraXr67VgLRSEyifXgmhaTUdwVttLhNBwEQTezdV5jlXZLw8Cd3rVC
 +8PLHoenXmXvL9kq8GY+q3+pI71iSMwRho8JlIEmU3pPvScD3i7hVqYg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 13/15] audiofile: fix multiple CVEs
Date: Fri, 27 Dec 2024 11:56:13 +0100
Message-Id: <20241227105615.3303193-14-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114571

From: Peter Marko <peter.marko@siemens.com>

CVE-2017-6830 / CVE-2017-6834 / CVE-2017-6836 / CVE-2017-6838

Use patch from buildroot:
https://github.com/buildroot/buildroot/commit/4a1a8277bba490d227f413e218138e39f1fe1203

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../audiofile/audiofile_0.3.6.bb              |  1 +
 ...multiplication-overflow-in-sfconvert.patch | 79 +++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0006-Check-for-multiplication-overflow-in-sfconvert.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index 67c1992cc4..66194fdc8b 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
     file://0003-fix-CVE-2015-7747.patch \
     file://0004-Always-check-the-number-of-coefficients.patch \
     file://0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch \
+    file://0006-Check-for-multiplication-overflow-in-sfconvert.patch \
 "
 SRC_URI[sha256sum] = "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8cb59782"
 
diff --git a/meta-oe/recipes-multimedia/audiofile/files/0006-Check-for-multiplication-overflow-in-sfconvert.patch b/meta-oe/recipes-multimedia/audiofile/files/0006-Check-for-multiplication-overflow-in-sfconvert.patch
new file mode 100644
index 0000000000..ec21b09f30
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/files/0006-Check-for-multiplication-overflow-in-sfconvert.patch
@@ -0,0 +1,79 @@
+From 7d65f89defb092b63bcbc5d98349fb222ca73b3c Mon Sep 17 00:00:00 2001
+From: Antonio Larrosa <larrosa@kde.org>
+Date: Mon, 6 Mar 2017 13:54:52 +0100
+Subject: [PATCH] Check for multiplication overflow in sfconvert
+
+Checks that a multiplication doesn't overflow when
+calculating the buffer size, and if it overflows,
+reduce the buffer size instead of failing.
+
+This fixes the 00192-audiofile-signintoverflow-sfconvert case
+in #41
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+CVE: CVE-2017-6830
+CVE: CVE-2017-6834
+CVE: CVE-2017-6836
+CVE: CVE-2017-6838
+Upstream-Status: Inactive-Upstream [lastrelease: 2013]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ sfcommands/sfconvert.c | 34 ++++++++++++++++++++++++++++++++--
+ 1 file changed, 32 insertions(+), 2 deletions(-)
+
+diff --git a/sfcommands/sfconvert.c b/sfcommands/sfconvert.c
+index 80a1bc4..970a3e4 100644
+--- a/sfcommands/sfconvert.c
++++ b/sfcommands/sfconvert.c
+@@ -45,6 +45,33 @@ void printusage (void);
+ void usageerror (void);
+ bool copyaudiodata (AFfilehandle infile, AFfilehandle outfile, int trackid);
+ 
++int firstBitSet(int x)
++{
++        int position=0;
++        while (x!=0)
++        {
++                x>>=1;
++                ++position;
++        }
++        return position;
++}
++
++#ifndef __has_builtin
++#define __has_builtin(x) 0
++#endif
++
++int multiplyCheckOverflow(int a, int b, int *result)
++{
++#if (defined __GNUC__ && __GNUC__ >= 5) || ( __clang__ && __has_builtin(__builtin_mul_overflow))
++	return __builtin_mul_overflow(a, b, result);
++#else
++	if (firstBitSet(a)+firstBitSet(b)>31) // int is signed, so we can't use 32 bits
++		return true;
++	*result = a * b;
++	return false;
++#endif
++}
++
+ int main (int argc, char **argv)
+ {
+ 	if (argc == 2)
+@@ -323,8 +350,11 @@ bool copyaudiodata (AFfilehandle infile, AFfilehandle outfile, int trackid)
+ {
+ 	int frameSize = afGetVirtualFrameSize(infile, trackid, 1);
+ 
+-	const int kBufferFrameCount = 65536;
+-	void *buffer = malloc(kBufferFrameCount * frameSize);
++	int kBufferFrameCount = 65536;
++	int bufferSize;
++	while (multiplyCheckOverflow(kBufferFrameCount, frameSize, &bufferSize))
++		kBufferFrameCount /= 2;
++	void *buffer = malloc(bufferSize);
+ 
+ 	AFframecount totalFrames = afGetFrameCount(infile, AF_DEFAULT_TRACK);
+ 	AFframecount totalFramesWritten = 0;
+-- 
+2.11.0
+
-- 
2.30.2


