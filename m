Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0051760D7F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 14:34:34 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id ep20so3891431lab.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 06:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=UxLEDz1lCHQz2sBtucRrdI7kXP2A1NI/2xvI/xI26h0=;
	b=bfTG1UAnYN3v3wcSXfz2b186yzxy9vaD4ezpVUp/RDUAFust/J3kaOzgiGAb9ef/su
	8fxgR/VZaueBc3EOtVQzPat97zfR2jP4DowWBPThln1KXDNrOloqAyV2xRp7DQXCVsjg
	vCPiJ2GYEnDB32FtiPbrS2FV39IqWQzDUkoD6D4RouUssD2LlHQeaQ+WkziRXO0r8DHg
	WXllOBpSq3J91YN9sGq9zUzEnxQ1acgGhs4SJmpf9R+gg9RpbRZUmGK4/68cWECQQBpy
	YZ4AxeMG2j9ZeRl6KXb545L1AIsYxVN6XaruuA7wDjRpdAxZmpx+MtzafV6NH/LD+Hh+
	22mg==
X-Received: by 10.152.244.130 with SMTP id xg2mr11477875lac.4.1387377275086;
	Wed, 18 Dec 2013 06:34:35 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id sd11sm182450lab.2.2013.12.18.06.34.32
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Dec 2013 06:34:34 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id D58161C1391; Wed, 18 Dec 2013 15:34:25 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Dec 2013 15:34:24 +0100
Message-Id: <1387377264-27790-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Cc: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.nystrom@enea.com>
Subject: [PATCH] [meta-oe] pcsc-lite: Fixed md5sum for tarball
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Dec 2013 14:34:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
index 266781a..7aae334 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a39d325b7d9cf2f07826a5154b16500c"
 DEPENDS = "udev"
 
 SRC_URI = "https://alioth.debian.org/frs/download.php/3757/pcsc-lite-${PV}.tar.bz2"
-SRC_URI[md5sum] = "3e4b777231d35ce35c15c0704f936eaa"
-SRC_URI[sha256sum] = "1e44049168d1ce55fd56c175f61206955254df0f385455f2a20ec7e8a0e6a77a"
+SRC_URI[md5sum] = "d41d8cd98f00b204e9800998ecf8427e"
+SRC_URI[sha256sum] = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
 
 PR = "r3"
 
-- 
1.8.3.2


