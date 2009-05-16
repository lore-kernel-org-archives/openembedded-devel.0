Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M5QPw-0003P3-ND
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 May 2009 22:23:36 +0200
Received: by ewy20 with SMTP id 20so3154080ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 May 2009 13:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=TJJTrjuauhkilxdZNrZwZH099B9xXcmhRyzbIa/DSlg=;
	b=siVcgu/K2MMjLXEUt1S2mB+QQphaxKPviPeMEkZLwe4/QHkZBENZg6tJy5vkdqgI94
	BjGrQXguHN1mMWy5Qltl1XAc7VzKqAXtahncqA/gdYXrk+SkevUA29tgqzsKhEIptS0g
	r00RJ63uQUkZiC7j71vPP2w1O6SsLfMkD8EbE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ni1mQaQjxlH6kRtd3oVTFle5esRxJinGraSE++Hk9+BzSOJQWJQp9FO1+RqLxjm8Jq
	82dxbWS6Z9S9bfI0GhAkFfBw4K+NC0EU5YqoZdL8q7IFU10ooAv0Q3wSypsc643P7Xl9
	CZItTuMk16+S6nHGPdF1sIb425wkbC3oWQUzA=
Received: by 10.216.3.65 with SMTP id 43mr1613846weg.149.1242504989990;
	Sat, 16 May 2009 13:16:29 -0700 (PDT)
Received: from localhost ([80.249.93.57])
	by mx.google.com with ESMTPS id m5sm5358834gve.3.2009.05.16.13.16.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 16 May 2009 13:16:29 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 May 2009 23:16:09 +0300
Message-Id: <1242504969-15764-1-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.0.6
Subject: [PATCH] xserver-kdrive-common: fixed xTs_Calibrate script name.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 May 2009 20:23:36 -0000

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 .../xserver-kdrive-common_0.1.bb                   |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/xserver-kdrive-common/xserver-kdrive-common_0.1.bb b/recipes/xserver-kdrive-common/xserver-kdrive-common_0.1.bb
index 33c0a40..a6fbc6d 100644
--- a/recipes/xserver-kdrive-common/xserver-kdrive-common_0.1.bb
+++ b/recipes/xserver-kdrive-common/xserver-kdrive-common_0.1.bb
@@ -9,9 +9,9 @@ SRC_URI = "\
   file://Xserver \
   file://Xsession \
   \
-  file://30xTs_Calibrate \
   file://60xXDefaults \
   file://90xXWindowManager \
+  file://98xTs_Calibrate \
   "
 S = "${WORKDIR}"
 
@@ -22,9 +22,9 @@ etcFiles = "\
   Xsession \
   "
 sessionFiles = "\
-  30xTs_Calibrate \
   60xXDefaults \
   90xXWindowManager \
+  98xTs_Calibrate \
   "
 
 do_install() {
-- 
1.6.0.6



