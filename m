Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwhTQ-0005jX-2y
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2012 00:33:00 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so5030562wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Aug 2012 15:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=WQfZ8vUppceTMPtVYovZs5qNMqGDJdHWAH4OU6KUBvU=;
	b=rHSAcSfiCpvVP61/fmigEc2IIW+ZlZ19dmwiqgQQJBpPuCpK0vR+2SEAqYTXUFreWH
	eNRhhIkv7ZdAqe6URP7uAJXRHa2hPLRjphxqZAkJG7Hd3GLUWTm6SEsFR3TKTcn5mFXN
	kzC4NAdfjZe1e92uWVmjwe/dbZ/hOYcEdAwyGDf68kxQ70/8mqCh9NeWZopZvwMO6xQD
	tOP0e/zW8W5mwl9xvMlM/KKyHxLlCRyy1zWx1HAQDocTgHELFSSVV1/2l2LZTGVRWaRQ
	D9i1d4S15kaoVh78LvdDFiimeP/Wow2Rh7DdHRb8ou3iMnyz7m+5bji1MIvbwwI7bvSN
	CPog==
Received: by 10.216.68.2 with SMTP id k2mr9141433wed.69.1343859683555;
	Wed, 01 Aug 2012 15:21:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h9sm30233846wiz.1.2012.08.01.15.21.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 15:21:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Aug 2012 00:20:58 +0200
Message-Id: <1df89045a5e60e8b5f53f1e59a902802fd2d9b80.1343859304.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343859304.git.Martin.Jansa@gmail.com>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343859304.git.Martin.Jansa@gmail.com>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/8] fbreader: drop machine overrides
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
X-List-Received-Date: Wed, 01 Aug 2012 22:33:00 -0000

* sorry forgot to move them to .bbappend before merging to meta-oe

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/fbreader/fbreader_0.12.10.bb   |    5 -----
 meta-oe/recipes-support/fbreader/fbreader_git.bb   |    4 ----
 2 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-support/fbreader/fbreader_0.12.10.bb b/meta-oe/recipes-support/fbreader/fbreader_0.12.10.bb
index 40fc631..4786846 100644
--- a/meta-oe/recipes-support/fbreader/fbreader_0.12.10.bb
+++ b/meta-oe/recipes-support/fbreader/fbreader_0.12.10.bb
@@ -15,11 +15,6 @@ READER_ARCH       ?= "desktop"
 READER_UI         ?= "gtk"
 READER_STATUS     ?= "release"
 
-# because of defaults overriden in machine config
-PACKAGE_ARCH_om-gta01 = "${MACHINE_ARCH}"
-PACKAGE_ARCH_om-gta02 = "${MACHINE_ARCH}"
-PACKAGE_ARCH_om-gta04 = "${MACHINE_ARCH}"
-
 FILES_${PN} += "${datadir}/FBReader ${datadir}/zlibrary ${libdir}/zlibrary"
 FILES_${PN}-dbg += "${libdir}/zlibrary/ui/.debug/"
 
diff --git a/meta-oe/recipes-support/fbreader/fbreader_git.bb b/meta-oe/recipes-support/fbreader/fbreader_git.bb
index 8baec79..937bdc8 100644
--- a/meta-oe/recipes-support/fbreader/fbreader_git.bb
+++ b/meta-oe/recipes-support/fbreader/fbreader_git.bb
@@ -19,10 +19,6 @@ READER_ARCH       ?= "desktop"
 READER_UI         ?= "gtk"
 READER_STATUS     ?= "release"
 
-# because of defaults overriden in machine config
-PACKAGE_ARCH_om-gta01 = "${MACHINE_ARCH}"
-PACKAGE_ARCH_om-gta02 = "${MACHINE_ARCH}"
-
 FILES_${PN} += "${datadir}/FBReader ${datadir}/zlibrary ${libdir}/zlibrary"
 FILES_${PN}-dbg += "${libdir}/zlibrary/ui/.debug/"
 
-- 
1.7.8.6



