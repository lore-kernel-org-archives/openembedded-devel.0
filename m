Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id CB4086B019
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 01:24:09 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c1so1063128eek.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jul 2013 18:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=1skNarL9jJxsgqffWBDHWJm7sOT1Y6AikZwlTyB0Kes=;
	b=VZLJgBHG8UM2dqhYJ6PGPA9XoTsloOcv0xJtnAGQTqXUCCYiNGfo+5xydm93xSwiMC
	bQYvqh1DGLeWfXERbgciRSkmtx3XLX73OdmTe3QBNB07JBjbhUBztNC6ZYqXRlifTfc1
	gHswxB2cQsBlGdAHpl+cX01TJPa05aH3NllUSv5XpF/bmwgZ/z+ws7nAkAQ7bio3MJF4
	kGDSqPcTni7lzAhMvVq3k++iJvdIGt9hpJJN6dEXk3Jl4mVVJxTMWj/80oNfklm9i2vB
	fvLgJpBYPUtMHBBbR5J+bmqzed/z1w3jkSKSMaptGPriXICcmRjZCnDHYqZZcA+hod8d
	yhDw==
X-Received: by 10.15.86.65 with SMTP id h41mr8690703eez.147.1372987449594;
	Thu, 04 Jul 2013 18:24:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	ci50sm9616252eeb.12.2013.07.04.18.24.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 18:24:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2013 03:23:53 +0200
Message-Id: <d83e029dbc5706f357446c7bfbae7e536d1db533.1372987207.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <47686756f036d39b24eb30d4522eb1f1b1a12702.1372987207.git.Martin.Jansa@gmail.com>
References: <47686756f036d39b24eb30d4522eb1f1b1a12702.1372987207.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1372987207.git.Martin.Jansa@gmail.com>
References: <cover.1372987207.git.Martin.Jansa@gmail.com>
Subject: [PATCH 09/10] fbida: define -I when checking jpeg version
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
X-List-Received-Date: Fri, 05 Jul 2013 01:24:10 -0000

* echo JPEG_LIB_VERSION | i586-starfish-linux-cpp -include jpeglib.h |
  tail -n 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/fbida/fbida_2.09.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.09.bb b/meta-oe/recipes-graphics/fbida/fbida_2.09.bb
index 02ea57f..aa4c1ca 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_2.09.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_2.09.bb
@@ -15,7 +15,7 @@ S = "${WORKDIR}/git"
 EXTRA_OEMAKE = "STRIP="
 
 do_compile() {
-    sed -i -e 's: cpp: ${TARGET_PREFIX}cpp:g' GNUmakefile
+    sed -i -e 's: cpp: ${TARGET_PREFIX}cpp -I{STAGING_INCDIR}:g' GNUmakefile
     oe_runmake
 }
 
-- 
1.8.2.1


