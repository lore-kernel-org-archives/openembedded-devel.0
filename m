Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 13D2C6B32E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:40:58 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id e53so213350eek.40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=F5QXg3WT6UyiSI1V8Jkjw4y4YNv5Z6f8E2Ei0/e0fy0=;
	b=NPqjS5Rml40nofcL3+FXbCRxG9pa/P78p64/LXp0f11/DxJ9V7xlBsMojsGNKMke9N
	80e3Lfyf0Fqe8+hLr0DtRE5gnti5VM6wLYGjZsF3aBIFmE1Mm8SEk7OR/WHTfn2ieqqY
	hWY71QIek1D3ZHBjHousjRuRPUdg77BAr/3DnlT9b4tK6XssQixi0IoJpQEsO+5HVYT0
	kd5ZQt/1jvUIPAx8beblFGT6j79mxJ0ivOdNTbowFmlaptMrUQt6/oFRb0xY4Z1kAYFW
	jc54KP8tZe3cze00Yug2JNpAyuRmA9e5R2wc0bbILT4CssxFMLKEdi04lxY6mbueurm9
	W14A==
X-Received: by 10.14.103.196 with SMTP id f44mr37114147eeg.37.1374669659520;
	Wed, 24 Jul 2013 05:40:59 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n5sm65859498eed.9.2013.07.24.05.40.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:40:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:40:49 +0200
Message-Id: <89cd32a3119a8fca95fea1cd4f37cc9c5e867279.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 05/29] fbida: add dependency on curl libungif tiff
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
X-List-Received-Date: Wed, 24 Jul 2013 12:40:59 -0000

* it's autodetected from sysroot
* GNUMakefile doesn't allow to use PACKAGECONFIG to explicitly disable them

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/fbida/fbida_2.09.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.09.bb b/meta-oe/recipes-graphics/fbida/fbida_2.09.bb
index aa4c1ca..24100ee 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_2.09.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_2.09.bb
@@ -6,7 +6,7 @@ SECTION = "utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-DEPENDS = "virtual/libiconv libpng jpeg fontconfig freetype libexif"
+DEPENDS = "virtual/libiconv libpng jpeg fontconfig freetype libexif curl libungif tiff"
 
 SRC_URI = "git://git.kraxel.org/fbida"
 SRCREV = "cb0ce5fa5f42bfaea4f8f326bcd8914dd14e782d"
-- 
1.8.3.2


