Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetaQ-0005ZQ-CI
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:04:48 +0100
Received: (qmail 27107 invoked by uid 813007); 4 Mar 2009 15:53:53 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:53 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPm-0001Dv-3o; Wed, 04 Mar 2009 16:53:46 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:41 +0100
Message-Id: <1236182004-4523-27-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Marcin Juszkiewicz <hrw@openedhand.com>
Subject: [PATCH 26/70] yum: do not hardcode arm architecture - rootfs_rpm provide arch info (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:05:01 -0000

From: Marcin Juszkiewicz <hrw@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5392 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/yum/files/hacks.patch    |   21 ---------------------
 packages/yum/yum-native_3.2.18.bb |    2 +-
 packages/yum/yum_3.2.18.bb        |    1 +
 3 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/packages/yum/files/hacks.patch b/packages/yum/files/hacks.patch
index d0232ec..ac8445f 100644
--- a/packages/yum/files/hacks.patch
+++ b/packages/yum/files/hacks.patch
@@ -5,27 +5,6 @@
  yum/depsolve.py         |    2 ++
  4 files changed, 7 insertions(+), 1 deletion(-)
 
-Index: yum-3.2.18/rpmUtils/arch.py
-===================================================================
---- yum-3.2.18.orig/rpmUtils/arch.py	2008-06-17 14:05:42.000000000 +0100
-+++ yum-3.2.18/rpmUtils/arch.py	2008-09-01 15:47:11.000000000 +0100
-@@ -275,6 +275,7 @@
-     return arch
-         
- def getCanonArch(skipRpmPlatform = 0):
-+    return "arm"
-     if not skipRpmPlatform and os.access("/etc/rpm/platform", os.R_OK):
-         try:
-             f = open("/etc/rpm/platform", "r")
-@@ -331,6 +332,8 @@
-        base arch is the arch before noarch in the arches dict if myarch is not
-        a key in the multilibArches."""
- 
-+    return "arm"
-+
-     if not myarch:
-         myarch = canonArch
- 
 Index: yum-3.2.18/rpmUtils/transaction.py
 ===================================================================
 --- yum-3.2.18.orig/rpmUtils/transaction.py	2008-06-17 14:05:42.000000000 +0100
diff --git a/packages/yum/yum-native_3.2.18.bb b/packages/yum/yum-native_3.2.18.bb
index 60dafe3..679f8e9 100644
--- a/packages/yum/yum-native_3.2.18.bb
+++ b/packages/yum/yum-native_3.2.18.bb
@@ -5,7 +5,7 @@ SRC_URI = "http://linux.duke.edu/projects/yum/download/3.2/yum-${PV}.tar.gz \
            file://paths.patch;patch=1 \
 	   file://yum-install-recommends.py \
 	   file://extract-postinst.awk"
-PR = "r5"
+PR = "r6"
 
 DEPENDS = "rpm-native python-native python-iniparse-native python-urlgrabber-native yum-metadata-parser-native libxml2-native"
 
diff --git a/packages/yum/yum_3.2.18.bb b/packages/yum/yum_3.2.18.bb
index 67e9ad7..7d34097 100644
--- a/packages/yum/yum_3.2.18.bb
+++ b/packages/yum/yum_3.2.18.bb
@@ -1,4 +1,5 @@
 HOMEPAGE = "http://linux.duke.edu/projects/yum/"
+PR = "r1"
 
 SRC_URI = "http://linux.duke.edu/projects/yum/download/3.2/yum-${PV}.tar.gz \
            file://hacks.patch;patch=1 \
-- 
1.6.1.3





