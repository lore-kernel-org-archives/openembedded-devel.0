Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S8Vqy-0002fO-2w
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Mar 2012 13:01:52 +0100
Received: by wera1 with SMTP id a1so3856079wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2012 04:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=J3oqw7pt6u54mk+6blqw26rqID+gg04BDmhQfhnyitI=;
	b=WgWb5nWRNmrGz+vUowNVEcO7+90RFHPBcXgQ0U0mxdui67iOyb2+ilWv5UyBDfKWRK
	nYNs6uj8m9O9fqs8EOuV5Cyy1Ap8sPIfjccIbAYQj/EgeXghbkMKVKvd5vaRfQ5ZdtZM
	GMxNTS3Gp5CuO8vu78JBhkL8LvO6uFIspNdipYb3qALd6KHIKcoRRkv+/DkcDYqwaDJI
	yWI1SOqJ/BP8ppW/1S47ZLjzBNk/8EjiqBJrbGVdsRtrsk9jnp63smFvLnG3jakYKv7W
	nRUZWhO/DsAIfVL7TJDKC7bzreCl3iJevrzv8c/3zZm2sy0bSGwX1JDpG9+AdFhpQ29Y
	N3cw==
Received: by 10.180.94.33 with SMTP id cz1mr5866941wib.13.1331898784471;
	Fri, 16 Mar 2012 04:53:04 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id df3sm13197857wib.1.2012.03.16.04.53.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Mar 2012 04:53:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Mar 2012 12:53:01 +0100
Message-Id: <1331898781-4682-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH] libass.inc: fix typo OE_EXTRACONF -> EXTRA_OECONF
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
X-List-Received-Date: Fri, 16 Mar 2012 12:01:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/libass/libass.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libass/libass.inc b/meta-oe/recipes-multimedia/libass/libass.inc
index 9fc0e07..fbf4424 100644
--- a/meta-oe/recipes-multimedia/libass/libass.inc
+++ b/meta-oe/recipes-multimedia/libass/libass.inc
@@ -6,13 +6,13 @@ LICENSE = "ISC"
 
 DEPENDS = "enca fontconfig freetype libpng"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 SRC_URI = "http://${PN}.googlecode.com/files/${P}.tar.bz2"
 
 inherit autotools pkgconfig
 
-OE_EXTRACONF = " \
+EXTRA_OECONF = " \
 	--enable-enca \
 	--enable-fontconfig \
 	--enable-png \
-- 
1.7.6.5



