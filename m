Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0D81670F3B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2014 16:01:54 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id k14so12102781wgh.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2014 09:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XHG/8dgB1xPreG18zUL8BECGqmlbCAZ90U67Djb4IXA=;
	b=0ovGgNgANdLpClDslnHhRXY+f3sJvCLwphYICKVim36i0bCDr6NkxgPMTPOjV+z0Em
	JtvFdieamtjWClZ9FAnNd0cRDlFRlMkETcKWFmHziVcBcT3Qombxd7uUAR7/aVwfPlJF
	8/LiNOuHwSHMFxkj+QH5wzobsc/XfYPPhW+LrmCHqylOtImjNPgRvmqcDB3HA/sJx+ya
	U3n3PkzjgGvxXwj3JXb5c5Omc7b3wgPMJtGiNRXXfpL5RdDkK3r7C6EULK8teVv4EgA3
	r+MwZtXyO8kOaAzTyy1C6FvEtFE9Hgi8pw1McFgFOywC5mpr8ib5YaSSV8/g+J7gysv1
	RvXQ==
X-Received: by 10.180.14.170 with SMTP id q10mr9859911wic.56.1408896115391;
	Sun, 24 Aug 2014 09:01:55 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w14sm21778749wij.2.2014.08.24.09.01.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Aug 2014 09:01:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Aug 2014 18:01:58 +0200
Message-Id: <1408896118-20829-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [meta-oe][PATCH] packagegroup*: set PACKAGE_ARCH before packagegroup inherit
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
X-List-Received-Date: Sun, 24 Aug 2014 16:01:59 -0000

* The required order was changed in oe-core commit:
  allarch: Add warning about packagegroup
  Since we want to start including this class conditionally, detect cases
  where packagegroup files use the old ordering and inform the user they
  need to update this.
* drop PACKAGE_ARCH setting from xorg-fonts-100dpi - nothing seems MACHINE
  specific in it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-basic.bb | 5 +----
 meta-oe/recipes-core/packagegroups/packagegroup-boot.bb  | 5 +----
 meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb  | 2 --
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
index ad1cd83..20b1652 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
@@ -7,11 +7,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
 
 PR = "r13"
 
-inherit packagegroup
-
-# packages which content depend on MACHINE_FEATURES need to be MACHINE_ARCH
-#
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+inherit packagegroup
 
 # Poke extra recomendations into the list using your machine.conf
 #
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
index 61a519d..f50443d 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
@@ -4,11 +4,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
 
 PR = "r58"
 
-inherit packagegroup
-
-# packages which content depend on MACHINE_FEATURES need to be MACHINE_ARCH
-#
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+inherit packagegroup
 
 #
 # those ones can be set in machine config to supply packages needed to get machine booting
diff --git a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
index aacf379..fd6c992 100644
--- a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
+++ b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
@@ -3,8 +3,6 @@ LICENSE = "Custom"
 
 inherit packagegroup
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 RDEPENDS_${PN} = "\
 	font-adobe-100dpi \
 	font-adobe-utopia-100dpi \
-- 
2.0.4


