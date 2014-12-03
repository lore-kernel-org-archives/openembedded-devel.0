Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 69F9960030
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Dec 2014 11:14:28 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id ex7so30983441wid.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Dec 2014 03:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jPNUImy422DROlmGVgO4YkitzALERTwEP6wpFyN8Up8=;
	b=Br3GW5gA091nfBbF7vDhc+kBc4jQtE+E6ffy2Xs4ObRMrSoc5YVIV32R+cT7A0BuQ4
	zd7aLw/0qP3SbTfpUiaF9rRVXLrAUrapTHb3ETHSE5Upa/3Vkmsmr2BUcLgUbAXg42nU
	PCDDNZ1RgBBid79gotNy9FaQ63spfM+zMOoodtWNUq59AuKfLMX3fu76lKC2AX+XD76/
	hn43o6s1ae2DHhX9t7OqayXGxb/9aKxkGGUVAbBl8mGXjl8wgeEA98ChaGV059aay0Xv
	edMHuifYCia34tRKxQWGkRA/dHtptADAIPq/Q/t3d85zPeH9dUjCbCS0HDXS8RgX2wwn
	RSig==
X-Received: by 10.180.91.109 with SMTP id cd13mr12503918wib.46.1417605269471; 
	Wed, 03 Dec 2014 03:14:29 -0800 (PST)
Received: from localhost.localdomain (pD9F9B8B2.dip0.t-ipconnect.de.
	[217.249.184.178])
	by mx.google.com with ESMTPSA id hn2sm35833479wjc.5.2014.12.03.03.14.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Dec 2014 03:14:28 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Dec 2014 12:14:01 +0100
Message-Id: <1417605241-2992-1-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.8.1.rc3
Subject: [meta-filesystems][PATCH] f2fs-tools: Update to Version 1.04
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
X-List-Received-Date: Wed, 03 Dec 2014 11:14:30 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 .../recipes-utils/f2fs-tools/f2fs-tools_1.4.0.bb   | 17 ++++++++++++
 ...emove-AC_CHECK_FILE-for-cross-compilation.patch | 32 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.4.0.bb
 create mode 100644 meta-filesystems/recipes-utils/f2fs-tools/files/0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch

diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.4.0.bb b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.4.0.bb
new file mode 100644
index 0000000..c329692
--- /dev/null
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.4.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Tools for Flash-Friendly File System (F2FS)"
+HOMEPAGE = "http://sourceforge.net/projects/f2fs-tools/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=362b4b2594cd362b874a97718faa51d3"
+
+# to provide libuuid
+DEPENDS = "util-linux"
+
+SRCREV = "baac4b4e6f41ceb02511da49dd3707674f3fea21"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git \
+	file://0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch"
+S = "${WORKDIR}/git"
+
+inherit pkgconfig autotools
+
+BBCLASSEXTEND = "native"
diff --git a/meta-filesystems/recipes-utils/f2fs-tools/files/0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch b/meta-filesystems/recipes-utils/f2fs-tools/files/0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch
new file mode 100644
index 0000000..cf844bf
--- /dev/null
+++ b/meta-filesystems/recipes-utils/f2fs-tools/files/0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch
@@ -0,0 +1,32 @@
+From 3b3c6e6376babcd9a0b0db312b0e1e3bb3ab833e Mon Sep 17 00:00:00 2001
+From: Sven Ebenfeld <sven.ebenfeld@vaillant.de>
+Date: Wed, 26 Nov 2014 10:36:44 +0100
+Subject: [PATCH] Remove AC_CHECK_FILE for cross compilation
+
+---
+ configure.ac | 7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0111e72..8c286d4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -20,14 +20,9 @@ AC_DEFINE([F2FS_MINOR_VERSION], m4_bpatsubst(f2fs_tools_version,
+ 				[\([0-9]*\).\([0-9]*\)\(\w\|\W\)*], [\2]),
+ 				[Minor version for f2fs-tools])
+ 
+-AC_CHECK_FILE(.git,
+-	AC_DEFINE([F2FS_TOOLS_DATE],
+-		"m4_bpatsubst(f2fs_tools_gitdate,
+-		[\([0-9-]*\)\(\w\|\W\)*], [\1])",
+-		[f2fs-tools date based on Git commits]),
+ 	AC_DEFINE([F2FS_TOOLS_DATE],
+ 		"f2fs_tools_date",
+-		[f2fs-tools date based on Source releases]))
++		[f2fs-tools date based on Source releases])
+ 
+ AC_CONFIG_SRCDIR([config.h.in])
+ AC_CONFIG_HEADER([config.h])
+-- 
+1.8.1.rc3
+
-- 
1.8.1.rc3


