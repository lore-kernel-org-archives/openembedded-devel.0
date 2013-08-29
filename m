Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5AF876BDA5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 23:39:58 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b47so565801eek.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aBycGNm9YSrHJ6MlLT1WIge+sfmmxPdJ1ok0xyYCLPU=;
	b=0hG7V5djM5S5muSGjxctkej7IrVAHxmmmO2lFbNnNLXiS3u09+VUbLlg4C7LyH10Rm
	sYHT30SfLpZw3jeWfK6QyZInUBzCkHSv6GVUvpI9Wj3T8Av8kiA1CeV8MaXLLk2tYGSU
	fLB7ozyK7P/7ony0eZnHKnDIqBJoZOZ9BEwLVmghLEkcnV31tWWFIP9A+j4NHTep+d0O
	XAxwldhSbf+/gQqG/AXNrZPi6Net3PukLCHj7yER+c30mNqRHcTYzffSw2icyPEjMYep
	/IXwvJ/yEmVPlVV7D4LB5ajihuew0gG7h5aqKG+uEHBBF8MjvW/Q/j7Iml5Yy+gVZxFl
	FOIg==
X-Received: by 10.15.100.198 with SMTP id bn46mr7535101eeb.11.1377819598773;
	Thu, 29 Aug 2013 16:39:58 -0700 (PDT)
Received: from mizar.localdomain
	(host202-221-dynamic.17-79-r.retail.telecomitalia.it.
	[79.17.221.202])
	by mx.google.com with ESMTPSA id a6sm50084582eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 16:39:58 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Aug 2013 01:39:54 +0200
Message-Id: <1377819594-27497-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-filesystems][PATCH] cramfs: remove, we use mkfs.cramfs from util-linux
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
X-List-Received-Date: Thu, 29 Aug 2013 23:39:59 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-filesystems/cramfs/cramfs_1.1.bb       | 29 ----------------------
 1 file changed, 29 deletions(-)
 delete mode 100644 meta-filesystems/recipes-filesystems/cramfs/cramfs_1.1.bb

diff --git a/meta-filesystems/recipes-filesystems/cramfs/cramfs_1.1.bb b/meta-filesystems/recipes-filesystems/cramfs/cramfs_1.1.bb
deleted file mode 100644
index 0bca0e1..0000000
--- a/meta-filesystems/recipes-filesystems/cramfs/cramfs_1.1.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "Builds cramfs filesystems for embedded systems"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
-DEPENDS = "zlib"
-
-PE = "1"
-
-SRC_URI = "http://sourceforge.net/projects/cramfs/files/cramfs/1.1/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "d3912b9f7bf745fbfea68f6a9b9de30f"
-SRC_URI[sha256sum] = "133caca2c4e7c64106555154ee0ff693f5cf5beb9421ce2eb86baee997d22368"
-
-EXTRA_OEMAKE = "\
-    'CC=${CC}' \
-    'CFLAGS=${CFLAGS}' \
-    'LDFLAGS=${LDFLAGS}' \
-"
-
-do_compile_prepend() {
-    ln -sf GNUmakefile Makefile
-}
-
-do_install() {
-    install -d ${D}${bindir}
-    install mkcramfs ${D}${bindir}
-    install cramfsck ${D}${bindir}
-}
-
-BBCLASSEXTEND = "native"
-- 
1.8.1.5


