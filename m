Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetaG-0005Yj-Vj
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:04:38 +0100
Received: (qmail 26706 invoked by uid 813007); 4 Mar 2009 15:53:44 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:44 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPd-0001DJ-1O; Wed, 04 Mar 2009 16:53:37 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:30 +0100
Message-Id: <1236182004-4523-16-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 15/70] createrepo-native: Add fix for empty data fields when creating repositories (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:04:42 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5108 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/yum/createrepo-native/fix.patch |   17 +++++++++++++++++
 packages/yum/createrepo-native_0.9.bb    |    2 ++
 2 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 packages/yum/createrepo-native/fix.patch

diff --git a/packages/yum/createrepo-native/fix.patch b/packages/yum/createrepo-native/fix.patch
new file mode 100644
index 0000000..4fe58e3
--- /dev/null
+++ b/packages/yum/createrepo-native/fix.patch
@@ -0,0 +1,17 @@
+---
+ createrepo/yumbased.py |    2 ++
+ 1 file changed, 2 insertions(+)
+
+Index: createrepo-0.9/createrepo/yumbased.py
+===================================================================
+--- createrepo-0.9.orig/createrepo/yumbased.py	2008-08-26 11:41:13.000000000 +0100
++++ createrepo-0.9/createrepo/yumbased.py	2008-08-26 11:37:01.000000000 +0100
+@@ -37,6 +37,8 @@ class CreateRepoPackage(YumLocalPackage)
+         self._hdrend = None
+         
+     def _xml(self, item):
++        if item == []:
++                return []	
+         return xml.sax.saxutils.escape(item)
+         
+     def _do_checksum(self):
diff --git a/packages/yum/createrepo-native_0.9.bb b/packages/yum/createrepo-native_0.9.bb
index e682667..22b5033 100644
--- a/packages/yum/createrepo-native_0.9.bb
+++ b/packages/yum/createrepo-native_0.9.bb
@@ -1,5 +1,7 @@
 SRC_URI = "http://linux.duke.edu/projects/metadata/generate/createrepo-${PV}.tar.gz \
+           file://fix.patch;patch=1 \
            file://pathfix.patch;patch=1 "
+PR = "r1"
 
 inherit autotools native
 
-- 
1.6.1.3





