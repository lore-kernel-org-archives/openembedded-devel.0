Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetaK-0005Z6-IT
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:04:45 +0100
Received: (qmail 26854 invoked by uid 813007); 4 Mar 2009 15:53:48 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:48 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPh-0001DY-5R; Wed, 04 Mar 2009 16:53:41 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:35 +0100
Message-Id: <1236182004-4523-21-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 20/70] yum-native: Add NOPOST and NOTRIGGERS flags when installing packages (from Poky)
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

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5130 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/yum/yum-native/hacks.patch |   32 +++++++++++++++++++-------------
 packages/yum/yum-native_3.2.18.bb   |    2 +-
 2 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/packages/yum/yum-native/hacks.patch b/packages/yum/yum-native/hacks.patch
index 0486b5f..d0232ec 100644
--- a/packages/yum/yum-native/hacks.patch
+++ b/packages/yum/yum-native/hacks.patch
@@ -7,9 +7,9 @@
 
 Index: yum-3.2.18/rpmUtils/arch.py
 ===================================================================
---- yum-3.2.18.orig/rpmUtils/arch.py	2008-08-26 12:43:14.000000000 +0100
-+++ yum-3.2.18/rpmUtils/arch.py	2008-08-26 12:50:11.000000000 +0100
-@@ -275,6 +275,7 @@ def getCanonX86_64Arch(arch):
+--- yum-3.2.18.orig/rpmUtils/arch.py	2008-06-17 14:05:42.000000000 +0100
++++ yum-3.2.18/rpmUtils/arch.py	2008-09-01 15:47:11.000000000 +0100
+@@ -275,6 +275,7 @@
      return arch
          
  def getCanonArch(skipRpmPlatform = 0):
@@ -17,7 +17,7 @@ Index: yum-3.2.18/rpmUtils/arch.py
      if not skipRpmPlatform and os.access("/etc/rpm/platform", os.R_OK):
          try:
              f = open("/etc/rpm/platform", "r")
-@@ -331,6 +332,8 @@ def getBaseArch(myarch=None):
+@@ -331,6 +332,8 @@
         base arch is the arch before noarch in the arches dict if myarch is not
         a key in the multilibArches."""
  
@@ -28,9 +28,9 @@ Index: yum-3.2.18/rpmUtils/arch.py
  
 Index: yum-3.2.18/rpmUtils/transaction.py
 ===================================================================
---- yum-3.2.18.orig/rpmUtils/transaction.py	2008-08-26 13:03:13.000000000 +0100
-+++ yum-3.2.18/rpmUtils/transaction.py	2008-08-26 13:10:52.000000000 +0100
-@@ -43,6 +43,7 @@ class TransactionWrapper:
+--- yum-3.2.18.orig/rpmUtils/transaction.py	2008-06-17 14:05:42.000000000 +0100
++++ yum-3.2.18/rpmUtils/transaction.py	2008-09-03 17:55:27.000000000 +0100
+@@ -43,6 +43,7 @@
                           'clean']
          self.tsflags = []
          self.open = True
@@ -40,9 +40,9 @@ Index: yum-3.2.18/rpmUtils/transaction.py
          # Automatically close the rpm transaction when the reference is lost
 Index: yum-3.2.18/yum/constants.py
 ===================================================================
---- yum-3.2.18.orig/yum/constants.py	2008-08-26 13:12:39.000000000 +0100
-+++ yum-3.2.18/yum/constants.py	2008-08-26 13:12:46.000000000 +0100
-@@ -17,7 +17,7 @@ Yum constants. Usually dealing with rpm 
+--- yum-3.2.18.orig/yum/constants.py	2008-07-21 16:56:54.000000000 +0100
++++ yum-3.2.18/yum/constants.py	2008-09-01 15:47:11.000000000 +0100
+@@ -17,7 +17,7 @@
  """
  
  #Constants
@@ -53,9 +53,15 @@ Index: yum-3.2.18/yum/constants.py
  TS_UPDATE = 10
 Index: yum-3.2.18/yum/depsolve.py
 ===================================================================
---- yum-3.2.18.orig/yum/depsolve.py	2008-08-26 12:44:37.000000000 +0100
-+++ yum-3.2.18/yum/depsolve.py	2008-08-26 13:17:45.000000000 +0100
-@@ -144,6 +144,8 @@ class Depsolve(object):
+--- yum-3.2.18.orig/yum/depsolve.py	2008-08-06 17:05:16.000000000 +0100
++++ yum-3.2.18/yum/depsolve.py	2008-09-03 21:05:52.000000000 +0100
+@@ -141,9 +141,14 @@
+             else:
+                 self.logger.critical(_('Invalid tsflag in config file: %s'), flag)
+ 
++        self._ts.addTsFlag(rpm.RPMTRANS_FLAG_NOPOST)
++        self._ts.addTsFlag(rpm.RPMTRANS_FLAG_NOTRIGGERS)
++
          probfilter = 0
          for flag in self.tsInfo.probFilterFlags:
              probfilter |= flag
diff --git a/packages/yum/yum-native_3.2.18.bb b/packages/yum/yum-native_3.2.18.bb
index fcb5680..d90f158 100644
--- a/packages/yum/yum-native_3.2.18.bb
+++ b/packages/yum/yum-native_3.2.18.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://linux.duke.edu/projects/yum/"
 SRC_URI = "http://linux.duke.edu/projects/yum/download/3.2/yum-${PV}.tar.gz \
            file://hacks.patch;patch=1 \
            file://paths.patch;patch=1"
-PR = "r3"
+PR = "r4"
 
 DEPENDS = "rpm-native python-native python-iniparse-native python-urlgrabber-native yum-metadata-parser-native libxml2-native"
 
-- 
1.6.1.3





