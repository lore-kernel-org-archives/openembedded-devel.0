Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1BD8B65E3D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Apr 2014 05:01:56 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id r10so4544067pdi.30
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 22:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=s8jcWjByakvO6C7v42pvlCs19y5GtBiMLe0BNZY2Dew=;
	b=dxnAUUPZRA5mFph+Fz1cVyEPLEBjP+KbUtBlcwz+epb63rleAhHoXJeEuQbX+3E9+p
	z7t+x36RWKoNCL8v7H/cnYDb9R/4YsZIIh+EFZW07nFM+0J4H9xbo+D7KLno/aRVB7NV
	YZPgz5yG/USOgrp/kS253bAvJALqMBm8p24CXGegCY/dYLvhONu1SCS5iKABAsqBQQVq
	bfM1IXXr6/eTsUb3SwBIXGkebHJssGRCnldcnlZ04ckzYv27eDk17RdKKO9L5mheNxME
	YSW3pF+A+Mp9jyqsO9MtLRV54wPSbvyW35df8HqAj2c5IStwNugKSfMbjo+ugtf0nE6x
	yDPw==
X-Received: by 10.68.222.105 with SMTP id ql9mr21401603pbc.4.1398574917763;
	Sat, 26 Apr 2014 22:01:57 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	id10sm26117504pbc.35.2014.04.26.22.01.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 22:01:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 22:03:34 -0700
Message-Id: <1398575015-5506-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398575015-5506-1-git-send-email-raj.khem@gmail.com>
References: <1398575015-5506-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 17/21] t1lib: Fix build when S != B
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
X-List-Received-Date: Sun, 27 Apr 2014 05:02:00 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb |    7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb b/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb
index d687ddb..86cc166 100644
--- a/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb
+++ b/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/t/t1lib/t1lib_${PV}.orig.tar.gz \
 SRC_URI[md5sum] = "a5629b56b93134377718009df1435f3c"
 SRC_URI[sha256sum] = "821328b5054f7890a0d0cd2f52825270705df3641dbd476d58d17e56ed957b59"
 
-inherit autotools
+inherit autotools-brokensep
 
 # Fix GNU_HASH problem
 TARGET_CC_ARCH += "${LDFLAGS}"
@@ -21,11 +21,6 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 EXTRA_OECONF = "--with-x --without-athena"
 EXTRA_OEMAKE = "without_doc"
 
-do_configure() {
-    rm -f ${S}/ac-tools/aclocal.m4
-    autotools_do_configure
-}
-
 FILES_${PN} += " ${datadir}/t1lib/t1lib.config"
 FILES_${PN}-doc = "${datadir}/t1lib/doc/t1lib_doc.pdf"
 
-- 
1.7.10.4


