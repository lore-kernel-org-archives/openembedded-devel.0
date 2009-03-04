Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetaV-0005Ze-2e
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:04:59 +0100
Received: (qmail 27306 invoked by uid 813007); 4 Mar 2009 15:53:57 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:57 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPq-0001EA-7k; Wed, 04 Mar 2009 16:53:50 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:46 +0100
Message-Id: <1236182004-4523-32-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Marcin Juszkiewicz <hrw@openedhand.com>
Subject: [PATCH 31/70] fakechroot: fix duplicated readlink (from Poky)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Mar 2009 16:05:07 -0000

From: Marcin Juszkiewicz <hrw@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5115 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/fakechroot/fakechroot-native_2.5.bb |    2 +-
 packages/fakechroot/fakechroot_2.5.bb        |    3 +-
 packages/fakechroot/files/fix-readlink.patch |   32 ++++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 packages/fakechroot/files/fix-readlink.patch

diff --git a/packages/fakechroot/fakechroot-native_2.5.bb b/packages/fakechroot/fakechroot-native_2.5.bb
index efd41c7..8cb88bd 100644
--- a/packages/fakechroot/fakechroot-native_2.5.bb
+++ b/packages/fakechroot/fakechroot-native_2.5.bb
@@ -1,5 +1,5 @@
 SECTION = "base"
-PR = "r0"
+PR = "r1"
 require fakechroot_${PV}.bb
 inherit native
 
diff --git a/packages/fakechroot/fakechroot_2.5.bb b/packages/fakechroot/fakechroot_2.5.bb
index c791512..dfe9077 100644
--- a/packages/fakechroot/fakechroot_2.5.bb
+++ b/packages/fakechroot/fakechroot_2.5.bb
@@ -2,6 +2,7 @@ SECTION = "base"
 DESCRIPTION = "Gives a fake root environment which can support chroot"
 LICENSE = "GPL"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/f/fakechroot/fakechroot_${PV}.orig.tar.gz"
+SRC_URI = "${DEBIAN_MIRROR}/main/f/fakechroot/fakechroot_${PV}.orig.tar.gz \
+           file://fix-readlink.patch;patch=1"
 
 inherit autotools
diff --git a/packages/fakechroot/files/fix-readlink.patch b/packages/fakechroot/files/fix-readlink.patch
new file mode 100644
index 0000000..f218956
--- /dev/null
+++ b/packages/fakechroot/files/fix-readlink.patch
@@ -0,0 +1,32 @@
+---
+ src/libfakechroot.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- fakechroot-2.5.orig/src/libfakechroot.c
++++ fakechroot-2.5/src/libfakechroot.c
+@@ -596,11 +596,11 @@ void fakechroot_init (void)
+     nextsym(open64, "open64");
+ #if !defined(HAVE___OPENDIR2)
+     nextsym(opendir, "opendir");
+ #endif
+     nextsym(pathconf, "pathconf");
+-    nextsym(readlink, "readlink");
++    nextsym(readlink, "own_readlink");
+     nextsym(realpath, "realpath");
+     nextsym(remove, "remove");
+ #ifdef HAVE_REMOVEXATTR
+     nextsym(removexattr, "removexattr");
+ #endif
+@@ -1864,11 +1864,11 @@ long pathconf (const char *path, int nam
+     return next_pathconf(path, name);
+ }
+ 
+ 
+ /* #include <unistd.h> */
+-int readlink (const char *path, char *buf, READLINK_TYPE_ARG3)
++int own_readlink (const char *path, char *buf, READLINK_TYPE_ARG3)
+ {
+     int status;
+     char tmp[FAKECHROOT_MAXPATH], *tmpptr;
+     char *fakechroot_path, *fakechroot_ptr, fakechroot_buf[FAKECHROOT_MAXPATH];
+ 
-- 
1.6.1.3





