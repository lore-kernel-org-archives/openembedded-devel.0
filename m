Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetaK-0005Z5-IQ
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:04:45 +0100
Received: (qmail 26806 invoked by uid 813007); 4 Mar 2009 15:53:47 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:46 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPf-0001DS-Gj; Wed, 04 Mar 2009 16:53:39 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:33 +0100
Message-Id: <1236182004-4523-19-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 18/70] yum-native: Add some hacks to make yum work better in the cross build case (from Poky)
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

git-svn-id: https://svn.o-hand.com/repos/poky@5110 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/yum/yum-native/hacks.patch |   66 +++++++++++++++++++++++++++++++++++
 packages/yum/yum-native_3.2.18.bb   |    3 +-
 2 files changed, 68 insertions(+), 1 deletions(-)
 create mode 100644 packages/yum/yum-native/hacks.patch

diff --git a/packages/yum/yum-native/hacks.patch b/packages/yum/yum-native/hacks.patch
new file mode 100644
index 0000000..0486b5f
--- /dev/null
+++ b/packages/yum/yum-native/hacks.patch
@@ -0,0 +1,66 @@
+---
+ rpmUtils/arch.py        |    3 +++
+ rpmUtils/transaction.py |    1 +
+ yum/constants.py        |    2 +-
+ yum/depsolve.py         |    2 ++
+ 4 files changed, 7 insertions(+), 1 deletion(-)
+
+Index: yum-3.2.18/rpmUtils/arch.py
+===================================================================
+--- yum-3.2.18.orig/rpmUtils/arch.py	2008-08-26 12:43:14.000000000 +0100
++++ yum-3.2.18/rpmUtils/arch.py	2008-08-26 12:50:11.000000000 +0100
+@@ -275,6 +275,7 @@ def getCanonX86_64Arch(arch):
+     return arch
+         
+ def getCanonArch(skipRpmPlatform = 0):
++    return "arm"
+     if not skipRpmPlatform and os.access("/etc/rpm/platform", os.R_OK):
+         try:
+             f = open("/etc/rpm/platform", "r")
+@@ -331,6 +332,8 @@ def getBaseArch(myarch=None):
+        base arch is the arch before noarch in the arches dict if myarch is not
+        a key in the multilibArches."""
+ 
++    return "arm"
++
+     if not myarch:
+         myarch = canonArch
+ 
+Index: yum-3.2.18/rpmUtils/transaction.py
+===================================================================
+--- yum-3.2.18.orig/rpmUtils/transaction.py	2008-08-26 13:03:13.000000000 +0100
++++ yum-3.2.18/rpmUtils/transaction.py	2008-08-26 13:10:52.000000000 +0100
+@@ -43,6 +43,7 @@ class TransactionWrapper:
+                          'clean']
+         self.tsflags = []
+         self.open = True
++        self.ts.setProbFilter(rpm.RPMPROB_FILTER_IGNOREOS | rpm.RPMPROB_FILTER_IGNOREARCH)
+ 
+     def __del__(self):
+         # Automatically close the rpm transaction when the reference is lost
+Index: yum-3.2.18/yum/constants.py
+===================================================================
+--- yum-3.2.18.orig/yum/constants.py	2008-08-26 13:12:39.000000000 +0100
++++ yum-3.2.18/yum/constants.py	2008-08-26 13:12:46.000000000 +0100
+@@ -17,7 +17,7 @@ Yum constants. Usually dealing with rpm 
+ """
+ 
+ #Constants
+-YUM_PID_FILE = '/var/run/yum.pid'
++YUM_PID_FILE = '/var/run2/yum.pid'
+ 
+ #transaction set states
+ TS_UPDATE = 10
+Index: yum-3.2.18/yum/depsolve.py
+===================================================================
+--- yum-3.2.18.orig/yum/depsolve.py	2008-08-26 12:44:37.000000000 +0100
++++ yum-3.2.18/yum/depsolve.py	2008-08-26 13:17:45.000000000 +0100
+@@ -144,6 +144,8 @@ class Depsolve(object):
+         probfilter = 0
+         for flag in self.tsInfo.probFilterFlags:
+             probfilter |= flag
++        probfilter |= rpm.RPMPROB_FILTER_IGNOREOS
++        probfilter |= rpm.RPMPROB_FILTER_IGNOREARCH
+         self._ts.setProbFilter(probfilter)
+ 
+     def whatProvides(self, name, flags, version):
diff --git a/packages/yum/yum-native_3.2.18.bb b/packages/yum/yum-native_3.2.18.bb
index d3098cc..03e54d5 100644
--- a/packages/yum/yum-native_3.2.18.bb
+++ b/packages/yum/yum-native_3.2.18.bb
@@ -1,8 +1,9 @@
 HOMEPAGE = "http://linux.duke.edu/projects/yum/"
 
 SRC_URI = "http://linux.duke.edu/projects/yum/download/3.2/yum-${PV}.tar.gz \
+           file://hacks.patch;patch=1 \
            file://paths.patch;patch=1"
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "rpm-native python-native python-iniparse-native python-urlgrabber-native yum-metadata-parser-native"
 
-- 
1.6.1.3





