Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 957E471223
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 07:35:56 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id hz1so14119771pad.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Sep 2014 00:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WD+wIuLFQRzZAsEwB8BzYb+dmWeZ4Zrrg162ahqBMcM=;
	b=xzGEY34pyC8shjTujLrR0wU/AmdJ3hkb/6xEi+4re7ADJ1lx0IuFXbXUcMLO/DtzrW
	PKmku4kRiJXSaspVY4mofc/mME5f/xIB0Ky1UUf9XShhLiEI86E9O0UYxJr2FJlPilay
	QpzbMjn2rM7FXP3l2fcwiwrpfs0CBLcL1CCzxj8+bhqQ8cSEsFKIQABHPPM/DVmnokd+
	DIXS5mJ+OEBm//1oYieqPlruOHxiUwyyVBtJo1pFR0/ZzCD4DMre3OWrVQ8r1POGFsGQ
	ZuIUrXPlQUyPmnP60wfFvLKfNIGT03V9JjWNHrmcOWqc2oNDKw3oLT6TqY1uqS80O/iZ
	1srw==
X-Received: by 10.66.97.41 with SMTP id dx9mr22763253pab.65.1409643355779;
	Tue, 02 Sep 2014 00:35:55 -0700 (PDT)
Received: from haswell.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id q1sm4253564pdq.67.2014.09.02.00.35.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Sep 2014 00:35:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Sep 2014 00:39:34 -0700
Message-Id: <1409643577-4088-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-gnome][PATCH 1/5] libgnomekbd: Drop using autotools-brokensep
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
X-List-Received-Date: Tue, 02 Sep 2014 07:35:57 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
index 0381192..d148062 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
@@ -6,17 +6,13 @@ SECTION = "x11/gnome/libs"
 
 DEPENDS = "gconf gtk+ glib-2.0 libxklavier"
 
-inherit gnome autotools-brokensep
+inherit gnome
 
 SRC_URI[archive.md5sum] = "de32a6e3e3464b566eecdc4332bf34bd"
 SRC_URI[archive.sha256sum] = "ddd52c4cc7d83ad7ef964a1bcb4db87407e65b00ffc3e70c088ca4ee7383d256"
 
 do_configure_append() {
-    find ${S} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
-    find ${S} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
+    find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
+    find ${B} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
 }
 
-
-
-
-
-- 
2.1.0


