Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6C6B16A642
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jun 2013 23:57:38 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id z10so307922pdj.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jun 2013 16:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=vxaLZ6w48/O1ulPxQkVu/D9BPZPHp4AT+u7CuBJKxjc=;
	b=CeZQ/DaY3qMzc9koY+4r0FIKRj3c4JGoqoIkPr0/cnuhXFJ2482Srk/OhvoW5XpaeT
	+uSGBqUL2vMbnl6P/jdKzJIRS9sR/i2zO7c88LCWbCIeaCjaq7JRKg0X2zNsSMEqoeJH
	5mAO7z7jP4UewQ1T5YZd4j/4gS++qE40GartUZwf9Sbuir98Gfd1ayA5kXHfjYEYoIkg
	Kj6GAX2M6n361TF+z0m+fGWccD+rWiMS70vClvyS2QfwpSPHoE3FzAopbOvnbDAIQ2gx
	gDco3DQBzBns26qn2qZVig5GeHoly6AEkAiPZNYZjmDNVdXBLi6MnUm9pMPOqYqBWUsD
	C5TQ==
X-Received: by 10.68.252.67 with SMTP id zq3mr21557123pbc.66.1372031859437;
	Sun, 23 Jun 2013 16:57:39 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	ib9sm15194941pbc.43.2013.06.23.16.57.38 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 23 Jun 2013 16:57:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Jun 2013 16:57:21 -0700
Message-Id: <1372031841-21518-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] proj: Update to 4.8.0
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
X-List-Received-Date: Sun, 23 Jun 2013 23:57:38 -0000

4.7.0 tars have disappeared on the download servers.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-navigation/proj/proj.inc      |   13 -------------
 meta-oe/recipes-navigation/proj/proj_4.7.0.bb |    7 -------
 meta-oe/recipes-navigation/proj/proj_4.8.0.bb |   13 +++++++++++++
 3 files changed, 13 insertions(+), 20 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/proj/proj.inc
 delete mode 100644 meta-oe/recipes-navigation/proj/proj_4.7.0.bb
 create mode 100644 meta-oe/recipes-navigation/proj/proj_4.8.0.bb

diff --git a/meta-oe/recipes-navigation/proj/proj.inc b/meta-oe/recipes-navigation/proj/proj.inc
deleted file mode 100644
index f6275d1..0000000
--- a/meta-oe/recipes-navigation/proj/proj.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "PROJ.4 - Cartographic Projections Library"
-HOMEPAGE = "http://trac.osgeo.org/proj/"
-SECTION = "libs"
-
-INC_PR = "r0"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=74d9aaec5fa0cd734341e8c4dc91b608"
-
-SRC_URI = "http://download.osgeo.org/proj/proj-${PV}.tar.gz"
-
-inherit autotools pkgconfig
-
diff --git a/meta-oe/recipes-navigation/proj/proj_4.7.0.bb b/meta-oe/recipes-navigation/proj/proj_4.7.0.bb
deleted file mode 100644
index 8e4f901..0000000
--- a/meta-oe/recipes-navigation/proj/proj_4.7.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require proj.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "927d34623b52e0209ba2bfcca18fe8cd"
-SRC_URI[sha256sum] = "fc5440002a496532bfaf423c28bdfaf9e26cc96c84ccefcdefde911efbd98986"
-
diff --git a/meta-oe/recipes-navigation/proj/proj_4.8.0.bb b/meta-oe/recipes-navigation/proj/proj_4.8.0.bb
new file mode 100644
index 0000000..6784dde
--- /dev/null
+++ b/meta-oe/recipes-navigation/proj/proj_4.8.0.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "PROJ.4 - Cartographic Projections Library"
+HOMEPAGE = "http://trac.osgeo.org/proj/"
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=74d9aaec5fa0cd734341e8c4dc91b608"
+
+SRC_URI = "http://download.osgeo.org/proj/proj-${PV}.tar.gz"
+SRC_URI[md5sum] = "d815838c92a29179298c126effbb1537"
+SRC_URI[sha256sum] = "2db2dbf0fece8d9880679154e0d6d1ce7c694dd8e08b4d091028093d87a9d1b5"
+
+inherit autotools pkgconfig
+
-- 
1.7.9.5


