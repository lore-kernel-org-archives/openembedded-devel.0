Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311A5E7718F
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 10:58:20 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.10963.1735297092307253586
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Dec 2024 02:58:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Ceh9kNKw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2024122710581024183362e97ba18502-6qyxk1@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2024122710581024183362e97ba18502
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 27 Dec 2024 11:58:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=T61j0PO1E1RsxpRGYaBxTYfTWp0mih9BPrJ2xVoEvDU=;
 b=Ceh9kNKwFhFXjmV2IQZl4oeAitNTTpQfXFyvjUId/qS+xWnmcGwbeAcWryWIBnUe3kwbqB
 62cutVjgsktiEGKvZd9WtrfV03WTP+ZYwYBCHLfA0gTeXn8esBtPBiu22XirjLiY+8+Gg2MK
 Ucz5CfergL8iyHvz5wo/auGZkA7fzucXnqg1/pwnkOA3yDQOa3vWRR1w+qwFZG1yKwgJ+3jJ
 zBT16Hy8QQbf8QNkBDGebPmT1E/JZA6mWCrbsPfHnHQi/SqWjyKTiYfZgeUg0eyHSD1dDcjE
 ka8v/lZpdiVSrDesoEay6A7SmQcGiS+E7EiFtkNRqe8llSTx728aAx5g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 11/15] audiofile: fix multiple CVEs
Date: Fri, 27 Dec 2024 11:56:11 +0100
Message-Id: <20241227105615.3303193-12-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114569

From: Peter Marko <peter.marko@siemens.com>

CVE-2017-6827 / CVE-2017-6828 / CVE-2017-6832 / CVE-2017-6833 / CVE-2017-6835 / CVE-2017-6837

Use patch from buildroot:
https://github.com/buildroot/buildroot/commit/cc00bde57fc20d11f8fa4e8ec5f193c091714c55

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../audiofile/audiofile_0.3.6.bb              |  1 +
 ...ays-check-the-number-of-coefficients.patch | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index d7181e7b56..2c690437c1 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -13,6 +13,7 @@ SRC_URI = " \
     file://0001-fix-negative-shift-constants.patch \
     file://0002-fix-build-on-gcc6.patch \
     file://0003-fix-CVE-2015-7747.patch \
+    file://0004-Always-check-the-number-of-coefficients.patch \
 "
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
-- 
2.30.2


