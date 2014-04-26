Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3C58965D31
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 20:32:40 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id lj1so4321945pab.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 13:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aZb7NX0k7R6uVeC1qh0h0V2i05laE89Anc6IEX7NKnM=;
	b=VexiCKUDnGbGRd/lOuir8wXRtMhXxvr7+HBZ8lVhdhy7yOJ2FzL0kBaKk7lVGpG1x0
	TZawCIEUmlioQJI+6UYKYS+L6e7IShnLWDOFS0LmpO8964IekledsBUXtI9jwrsUcKjm
	MJmK8vOjAXlEXotcOyQWzwlxa1o0IOgjNcDqaMOF2y+JEGsQOlivyk4sqAQ6Ej5PR/ki
	/2U9BMm/qOZ3eC3XqG6QZnXQba0q5H4/8UlbDjdPXX0sSUKsuUKSG3/sN+7mslg9NxNA
	BJG1BfPpTi0EgUwvXGHpuMayNvpAzHdm/S6x3ownMghuOy9ea1VaBOdAJ+cMftoAIzby
	yHyA==
X-Received: by 10.66.248.228 with SMTP id yp4mr15869350pac.94.1398544361882;
	Sat, 26 Apr 2014 13:32:41 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ci4sm24455471pbb.50.2014.04.26.13.32.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 13:32:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 13:34:26 -0700
Message-Id: <1398544484-27299-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
References: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/21] lcms: Update to lcms2 version 2.6
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
X-List-Received-Date: Sat, 26 Apr 2014 20:32:43 -0000

Fix S != B build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/lcms/lcms_1.17.bb |   15 ---------------
 meta-oe/recipes-support/lcms/lcms_2.6.bb  |   15 +++++++++++++++
 2 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 meta-oe/recipes-support/lcms/lcms_1.17.bb
 create mode 100644 meta-oe/recipes-support/lcms/lcms_2.6.bb

diff --git a/meta-oe/recipes-support/lcms/lcms_1.17.bb b/meta-oe/recipes-support/lcms/lcms_1.17.bb
deleted file mode 100644
index 64e6f07..0000000
--- a/meta-oe/recipes-support/lcms/lcms_1.17.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Little cms is a small-footprint, speed optimized color management engine"
-SECTION = "libs"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=156745cad721a8783cb847e82b79f586"
-SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms-${PV}.tar.gz"
-DEPENDS = "tiff"
-
-PR = "r4"
-
-BBCLASSEXTEND = "native"
-
-inherit autotools
-
-SRC_URI[md5sum] = "07bdbb4cfb05d21caa58fe3d1c84ddc1"
-SRC_URI[sha256sum] = "5ef3b4dab30956772009e29dba33fe1256cf9da161106a1e70b0966c96d14583"
diff --git a/meta-oe/recipes-support/lcms/lcms_2.6.bb b/meta-oe/recipes-support/lcms/lcms_2.6.bb
new file mode 100644
index 0000000..ad727df
--- /dev/null
+++ b/meta-oe/recipes-support/lcms/lcms_2.6.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Little cms is a small-footprint, speed optimized color management engine"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6c786c3b7a4afbd3c990f1b81261d516"
+SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz"
+SRC_URI[md5sum] = "f4c08d38ceade4a664ebff7228910a33"
+SRC_URI[sha256sum] = "5172528839647c54c3da211837225e221be93e4733f5b5e9f57668f7107e14b1"
+
+DEPENDS = "tiff"
+
+BBCLASSEXTEND = "native"
+
+S = "${WORKDIR}/lcms2-${PV}"
+
+inherit autotools
-- 
1.7.10.4


