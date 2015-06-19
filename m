Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 41C72759F4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jun 2015 03:16:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,625,1427731200"; d="scan'208";a="97305866"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jun 2015 11:21:05 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5J3FK7T026705
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jun 2015 11:15:20 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 19 Jun 2015 11:17:12 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Jun 2015 11:08:08 +0800
Message-ID: <1434683288-56691-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-filesystems][PATCH] smbnetfs: using PKG_CHECK_MODULES to found headers and libraries for smbclient
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
X-List-Received-Date: Fri, 19 Jun 2015 03:16:56 -0000
Content-Type: text/plain

After samba was upgraded to 4.x, headers of smbclient were installed into include/samba-4.0/,
so we should using PKG_CHECK_MODULES to found headers and libraries for smbclient to avoid
error as below.

 ${WORKDIR}/git/src/samba.c
   | smbnetfs/git-r0/git/src/smb_conn_srv.c:12:26: fatal error: libsmbclient.h: No such file or directory  #include <libsmbclient.h>
   |                           ^
   | compilation terminated.
   | make[2]: *** [smb_conn_srv.o] Error 1
   | make[2]: *** Waiting for unfinished jobs....

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 ...CK_MODULES-to-found-headers-and-libraries.patch | 42 ++++++++++++++++++++++
 .../recipes-filesystems/smbnetfs/smbnetfs_git.bb   |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch

diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch
new file mode 100644
index 0000000..f05f09f
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch
@@ -0,0 +1,42 @@
+From 7a524d49b3d4459280f18942df2980603400ec52 Mon Sep 17 00:00:00 2001
+From: Bian Naimeng <biannm@cn.fujitsu.com>
+Date: Fri, 19 Jun 2015 11:54:44 +0900
+Subject: [PATCH] Using PKG_CHECK_MODULES to found headers and libraries of
+ smbclient
+
+Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
+---
+ configure.in    | 5 +++++
+ src/Makefile.am | 3 +++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/configure.in b/configure.in
+index ce21aef..ecd7119 100644
+--- a/configure.in
++++ b/configure.in
+@@ -125,6 +125,11 @@ AC_CHECK_LIB(smbclient, smbc_setOptionUserData,
+     )]
+ )
+ 
++dnl *****************************************************************
++dnl *** Check libsmbclient by pkgconfig to get cflags and ldflags ***
++dnl *****************************************************************
++PKG_CHECK_MODULES(SMBCLIENT, smbclient)
++
+ dnl ******************
+ dnl *** Final step ***
+ dnl ******************
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 41519d8..9fc97e9 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -16,3 +16,6 @@ smbnetfs_SOURCES = \
+ 	event.c			event.h			\
+ 	reconfigure.c		reconfigure.h		\
+ 	main.c
++
++smbnetfs_CFLAGS=${SMBCLIENT_CFLAGS}
++smbnetfs_LDFLAGS=${SMBCLIENT_LDFLAGS}
+-- 
+1.8.4.2
+
diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
index a0eddbc..f1420fb 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
@@ -17,7 +17,8 @@ PKGV = "${GITPKGVTAG}"
 SRCREV = "ace1c519d45fe488b9b7e6cc77a2bcadb6c83464"
 
 SRC_URI = "git://smbnetfs.git.sourceforge.net/gitroot/smbnetfs/smbnetfs;branch=master \
-           file://configure.patch"
+           file://configure.patch \
+           file://Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring=yes,--with-gnome-keyring=no,libgnome-keyring"
-- 
1.8.4.2


