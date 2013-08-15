Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6B2AC6B836
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:40 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so183743eae.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=F5QXg3WT6UyiSI1V8Jkjw4y4YNv5Z6f8E2Ei0/e0fy0=;
	b=Eu9ehs/mcT2oeXUUbim6x07w7o8C6xjfHPKDenp8nQlm8A1ryG3D2cihwbrWz2k4PF
	lzcvhXyhVCNBwqNTsQ4KodZM0HCsQ2beeGAb8v3OArAx/+We9rj5TFtQHt8NURtcvemP
	QJGDSk5eSBQ5pHumCHJLfFKp8RH8GijBuTMt8sAsn6SJ41NRlBN13XcbhrZM3GPR74l0
	iW3ZCdapnJ4G4P+u/yliVwtC/fptL8MxFHAzjQlOs1lbwuBxd2R6UvGfPEFSWXLKtP4g
	5fctwxIwp8ONRI7WqgUsjYwQZ3PCR5QoDBzZWB4SBZkDReRcmQ+2yNWNjAvZn4wyY23w
	gevA==
X-Received: by 10.14.241.74 with SMTP id f50mr20891261eer.29.1376551180838;
	Thu, 15 Aug 2013 00:19:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a6sm69987253eei.10.2013.08.15.00.19.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:16 +0200
Message-Id: <726c06e2bc57ff1ada5fbcf54f7641b97bc7af75.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 36/60] fbida: add dependency on curl libungif tiff
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:41 -0000

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


