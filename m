Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 231E46E747
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 11:40:08 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id h14so4400791eaj.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 03:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6v0PMN1UcFXSqclCZi5IhanHkI5cIO2wpEgkQ8sWvZw=;
	b=NABuWp3mTQ6VpRy9DZyqYOTIVECzo6vojs8HVT2Ss7QyQobNVIgRXK7StEn6QRSF7T
	De/jKCmWuWTjynZAlX3PdDK0mBgXv/rYMESPjgQt2sz752cECxo43QqvVmMJIssm/JVi
	Ptr3Z5d3uKkjXz+uc1bx2sVI14+qI4vSHnnpRxj/TWCFQYV9ZPKvtLsZUpcrKarbG20S
	EhRLla5yUscQ6FLurIcXayh8ZjCFu3ubwsA1+bzTfPzzloCpNE0U5weuxzzfJE3h6rhg
	sLd2F7jqyRe3qhoyI3hHyg3fL13Q6Ay1Tleemf+5byH6BX8ENFilCl2KNJ/ctlgqF0DR
	lPdQ==
X-Received: by 10.15.25.67 with SMTP id k43mr1051989eeu.48.1390390809558;
	Wed, 22 Jan 2014 03:40:09 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 8sm5298361eeq.15.2014.01.22.03.40.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jan 2014 03:40:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2014 12:40:07 +0100
Message-Id: <1390390807-9984-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-filesystems][PATCH] yaffs2-utils: Fix formatting, drop PR
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
X-List-Received-Date: Wed, 22 Jan 2014 11:40:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-filesystems/yaffs2/yaffs2-utils_git.bb         | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
index 2b7452b..d83f4ee 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
@@ -6,15 +6,13 @@ SECTION = "base"
 HOMEPAGE = "http://www.yaffs.net"
 LICENSE = "GPLv2"
 
-PR = "r0"
 PV = "0.0+git${SRCPV}"
 
 DEPENDS = "mtd-utils"
 S = "${WORKDIR}/git"
 
 # Source is the HEAD of master branch at the time of writing this recipe
-SRC_URI = "git://www.aleph1.co.uk/yaffs2;protocol=git;branch=master \
-          "
+SRC_URI = "git://www.aleph1.co.uk/yaffs2;protocol=git;branch=master"
 SRCREV = "bc76682d93955cfb33051beb503ad9f8a5450578"
 
 LIC_FILES_CHKSUM = "file://utils/mkyaffs2image.c;beginline=12;endline=14;md5=5f5464f9b3e981ca574e65b00e438561"
@@ -22,17 +20,17 @@ LIC_FILES_CHKSUM = "file://utils/mkyaffs2image.c;beginline=12;endline=14;md5=5f5
 CFLAGS_append = " -I.. -DCONFIG_YAFFS_UTIL -DCONFIG_YAFFS_DEFINES_TYPES"
 
 do_compile() {
-	cd utils && oe_runmake
+    cd utils && oe_runmake
 }
 
 INSTALL_FILES = "mkyaffsimage \
                  mkyaffs2image \
                 "
 do_install() {
-	install -d ${D}${sbindir}/
-	for i in ${INSTALL_FILES}; do
-		install -m 0755 utils/$i ${D}${sbindir}/
-	done
+    install -d ${D}${sbindir}/
+    for i in ${INSTALL_FILES}; do
+        install -m 0755 utils/$i ${D}${sbindir}/
+    done
 }
 
 BBCLASSEXTEND = "native"
-- 
1.8.5.3


