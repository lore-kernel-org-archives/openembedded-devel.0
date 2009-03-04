Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetTv-0005Oi-M2
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 16:58:23 +0100
Received: (qmail 26984 invoked by uid 813007); 4 Mar 2009 15:53:51 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:51 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPj-0001Dm-LV; Wed, 04 Mar 2009 16:53:43 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:38 +0100
Message-Id: <1236182004-4523-24-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 23/70] yum: Add yum-install-recommends.py script to handle installing Recommends (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 15:59:35 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5157 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/yum/yum-native/yum-install-recommends.py |   39 +++++++++++++++++++++
 packages/yum/yum-native_3.2.18.bb                 |    4 ++-
 2 files changed, 42 insertions(+), 1 deletions(-)
 create mode 100755 packages/yum/yum-native/yum-install-recommends.py

diff --git a/packages/yum/yum-native/yum-install-recommends.py b/packages/yum/yum-native/yum-install-recommends.py
new file mode 100755
index 0000000..64716f2
--- /dev/null
+++ b/packages/yum/yum-native/yum-install-recommends.py
@@ -0,0 +1,39 @@
+#!/usr/bin/env python
+import os, sys
+
+root = sys.argv[1]
+installcmd = sys.argv[2]
+
+#
+# Take an rpm image and look through for Recommends:. For each recommends 
+# found, try and install any matching packages including any Recommends for
+# packages installed by us.
+#
+
+
+def get_recommends():
+    deps = []
+    output = os.popen("rpm --root %s -aq --recommends" % (root))
+    lines = output.readlines()
+    for line in lines:
+        line = line.replace("(none)","")
+        if line:
+            deps.append(line.split()[0])
+    return deps
+
+processed = []
+
+while True:
+    toinstall = []
+    recommends = set(get_recommends())
+    for item in recommends:
+        if item not in processed:
+            toinstall.append(item)
+    if len(toinstall) != 0:
+        print "Installing %s" % " ".join(toinstall)
+        os.system("%s %s" % (installcmd, " ".join(toinstall)))
+    else:
+        break
+    processed.extend(toinstall)
+
+    
diff --git a/packages/yum/yum-native_3.2.18.bb b/packages/yum/yum-native_3.2.18.bb
index 76e92b3..60dafe3 100644
--- a/packages/yum/yum-native_3.2.18.bb
+++ b/packages/yum/yum-native_3.2.18.bb
@@ -3,8 +3,9 @@ HOMEPAGE = "http://linux.duke.edu/projects/yum/"
 SRC_URI = "http://linux.duke.edu/projects/yum/download/3.2/yum-${PV}.tar.gz \
            file://hacks.patch;patch=1 \
            file://paths.patch;patch=1 \
+	   file://yum-install-recommends.py \
 	   file://extract-postinst.awk"
-PR = "r4"
+PR = "r5"
 
 DEPENDS = "rpm-native python-native python-iniparse-native python-urlgrabber-native yum-metadata-parser-native libxml2-native"
 
@@ -20,4 +21,5 @@ do_compile_append () {
 do_install_append () {
 	install -d ${STAGING_BINDIR}/
 	install ${WORKDIR}/extract-postinst.awk ${STAGING_BINDIR}/
+	install ${WORKDIR}/yum-install-recommends.py ${STAGING_BINDIR}/
 }
-- 
1.6.1.3





