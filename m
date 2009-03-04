Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetaS-0005ZU-Ca
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:04:58 +0100
Received: (qmail 27197 invoked by uid 813007); 4 Mar 2009 15:53:55 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:55 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPn-0001E1-PV; Wed, 04 Mar 2009 16:53:47 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:43 +0100
Message-Id: <1236182004-4523-29-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 28/70] yum-native: Fix hacks.patch to handle architecture detection issues (from Poky)
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

git-svn-id: https://svn.o-hand.com/repos/poky@5396 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/yum/files/hacks.patch    |   36 +++++++++++++++++++++++++++++++++---
 packages/yum/yum-native_3.2.18.bb |    2 +-
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/packages/yum/files/hacks.patch b/packages/yum/files/hacks.patch
index ac8445f..61f4771 100644
--- a/packages/yum/files/hacks.patch
+++ b/packages/yum/files/hacks.patch
@@ -5,10 +5,40 @@
  yum/depsolve.py         |    2 ++
  4 files changed, 7 insertions(+), 1 deletion(-)
 
+Index: yum-3.2.18/rpmUtils/arch.py
+===================================================================
+--- yum-3.2.18.orig/rpmUtils/arch.py	2008-06-17 14:05:42.000000000 +0100
++++ yum-3.2.18/rpmUtils/arch.py	2008-10-02 22:09:19.000000000 +0100
+@@ -275,6 +275,12 @@
+     return arch
+         
+ def getCanonArch(skipRpmPlatform = 0):
++    import os
++    if 'YUM_ARCH_FORCE' in os.environ:
++        return os.environ['YUM_ARCH_FORCE']
++
++    sys.exit(1)
++
+     if not skipRpmPlatform and os.access("/etc/rpm/platform", os.R_OK):
+         try:
+             f = open("/etc/rpm/platform", "r")
+@@ -331,6 +338,12 @@
+        base arch is the arch before noarch in the arches dict if myarch is not
+        a key in the multilibArches."""
+ 
++    import os
++    if 'YUM_ARCH_FORCE' in os.environ:
++        return os.environ['YUM_ARCH_FORCE']
++
++    sys.exit(1)
++
+     if not myarch:
+         myarch = canonArch
+ 
 Index: yum-3.2.18/rpmUtils/transaction.py
 ===================================================================
 --- yum-3.2.18.orig/rpmUtils/transaction.py	2008-06-17 14:05:42.000000000 +0100
-+++ yum-3.2.18/rpmUtils/transaction.py	2008-09-03 17:55:27.000000000 +0100
++++ yum-3.2.18/rpmUtils/transaction.py	2008-10-02 17:09:57.000000000 +0100
 @@ -43,6 +43,7 @@
                           'clean']
          self.tsflags = []
@@ -20,7 +50,7 @@ Index: yum-3.2.18/rpmUtils/transaction.py
 Index: yum-3.2.18/yum/constants.py
 ===================================================================
 --- yum-3.2.18.orig/yum/constants.py	2008-07-21 16:56:54.000000000 +0100
-+++ yum-3.2.18/yum/constants.py	2008-09-01 15:47:11.000000000 +0100
++++ yum-3.2.18/yum/constants.py	2008-10-02 17:09:57.000000000 +0100
 @@ -17,7 +17,7 @@
  """
  
@@ -33,7 +63,7 @@ Index: yum-3.2.18/yum/constants.py
 Index: yum-3.2.18/yum/depsolve.py
 ===================================================================
 --- yum-3.2.18.orig/yum/depsolve.py	2008-08-06 17:05:16.000000000 +0100
-+++ yum-3.2.18/yum/depsolve.py	2008-09-03 21:05:52.000000000 +0100
++++ yum-3.2.18/yum/depsolve.py	2008-10-02 17:09:57.000000000 +0100
 @@ -141,9 +141,14 @@
              else:
                  self.logger.critical(_('Invalid tsflag in config file: %s'), flag)
diff --git a/packages/yum/yum-native_3.2.18.bb b/packages/yum/yum-native_3.2.18.bb
index 679f8e9..f4dc87e 100644
--- a/packages/yum/yum-native_3.2.18.bb
+++ b/packages/yum/yum-native_3.2.18.bb
@@ -5,7 +5,7 @@ SRC_URI = "http://linux.duke.edu/projects/yum/download/3.2/yum-${PV}.tar.gz \
            file://paths.patch;patch=1 \
 	   file://yum-install-recommends.py \
 	   file://extract-postinst.awk"
-PR = "r6"
+PR = "r7"
 
 DEPENDS = "rpm-native python-native python-iniparse-native python-urlgrabber-native yum-metadata-parser-native libxml2-native"
 
-- 
1.6.1.3





