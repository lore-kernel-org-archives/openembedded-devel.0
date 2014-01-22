Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0E5F06002A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 11:44:05 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so4024498eek.41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 03:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=07NgLQXwmM6xQtpBn5HT0IU6mmoRsvOAAMiqsYKTimg=;
	b=Lj15+VHWG9NUF4+cyW+IP7fTNZw/w8uRNDIoNJkioO/drLT9aXPeh1MjR4UesMbhpo
	HyV9ckuxbEW+5qAk3K+g7zAShqwmKgvQchjfND8VFRMYJvKWC4Ika7bl/v22shhcJl8e
	fFGk8EMERPMHBAh7RdUc8Q1iebrNufEJfyBAb5z3gv2TnH/hby1/MmoJnOQArU5wO3u2
	xqPnqU7STlHYPAx6WGc/5PIZz+P/St+txH35h1xS4Rk8cCRcc/kn52Y5yI2+oYC5989s
	+r6lGF5I20zhsfLQkG4VTpg883tA/4acnHv287QCG5IZKG+DxNQKB0wbK4g8lAodjjzT
	2JFg==
X-Received: by 10.14.113.199 with SMTP id a47mr1017342eeh.41.1390391046537;
	Wed, 22 Jan 2014 03:44:06 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 46sm26151722ees.4.2014.01.22.03.44.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jan 2014 03:44:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2014 12:44:05 +0100
Message-Id: <1390391045-16689-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-filesystems][PATCHv2] yaffs2-utils: Fix formatting, drop PR
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
X-List-Received-Date: Wed, 22 Jan 2014 11:44:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-filesystems/yaffs2/yaffs2-utils_git.bb  | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
index 2b7452b..0e1e460 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
@@ -1,38 +1,35 @@
 SUMMARY = "Yet Another Flash File System"
-
 DESCRIPTION = "Tools for managing 'yaffs2' file systems."
 
 SECTION = "base"
 HOMEPAGE = "http://www.yaffs.net"
+
 LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://utils/mkyaffs2image.c;beginline=12;endline=14;md5=5f5464f9b3e981ca574e65b00e438561"
 
-PR = "r0"
 PV = "0.0+git${SRCPV}"
 
 DEPENDS = "mtd-utils"
-S = "${WORKDIR}/git"
 
 # Source is the HEAD of master branch at the time of writing this recipe
-SRC_URI = "git://www.aleph1.co.uk/yaffs2;protocol=git;branch=master \
-          "
+SRC_URI = "git://www.aleph1.co.uk/yaffs2;protocol=git;branch=master"
 SRCREV = "bc76682d93955cfb33051beb503ad9f8a5450578"
-
-LIC_FILES_CHKSUM = "file://utils/mkyaffs2image.c;beginline=12;endline=14;md5=5f5464f9b3e981ca574e65b00e438561"
+S = "${WORKDIR}/git"
 
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


