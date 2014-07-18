Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6086E706BC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 08:57:14 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6I8h38V030281; Fri, 18 Jul 2014 09:43:05 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hfjnC8n0-WiJ; Fri, 18 Jul 2014 09:43:05 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6I8gxWV030254
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 18 Jul 2014 09:43:00 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X83kk-0006jP-10; Fri, 18 Jul 2014 09:42:54 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 09:42:35 +0100
Message-Id: <1405672966-25729-16-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 16/27] smbfsnet: Use "foreign" automake strictness
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
X-List-Received-Date: Fri, 18 Jul 2014 08:57:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

---
 .../recipes-filesystems/smbnetfs/smbnetfs/configure.patch     | 11 +++++++++++
 meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb |  3 ++-
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch

diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
new file mode 100644
index 0000000..c80fed1
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
@@ -0,0 +1,11 @@
+Index: git/configure.in
+===================================================================
+--- git.orig/configure.in	2014-06-18 16:06:16.040721349 +0000
++++ git/configure.in	2014-07-18 07:49:17.085552256 +0000
+@@ -1,5 +1,5 @@
+ AC_INIT([SMBNetFS],[0.5.3а])
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
+ AC_CONFIG_HEADERS([src/config.h])
+ AC_PROG_CC
+ 
diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
index c25f5d6..a0eddbc 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
@@ -16,7 +16,8 @@ PKGV = "${GITPKGVTAG}"
 
 SRCREV = "ace1c519d45fe488b9b7e6cc77a2bcadb6c83464"
 
-SRC_URI = "git://smbnetfs.git.sourceforge.net/gitroot/smbnetfs/smbnetfs;branch=master"
+SRC_URI = "git://smbnetfs.git.sourceforge.net/gitroot/smbnetfs/smbnetfs;branch=master \
+           file://configure.patch"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring=yes,--with-gnome-keyring=no,libgnome-keyring"
-- 
2.0.2


