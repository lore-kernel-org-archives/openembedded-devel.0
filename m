Received: from mrsl.grasp.upenn.edu ([158.130.53.11] helo=morwong)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kartikmohta@morwong.mrsl.grasp.upenn.edu>)
	id 1Q7dyx-0006BH-CZ for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 03:25:59 +0200
Received: by morwong (Postfix, from userid 1000)
	id 0C820A6140; Wed,  6 Apr 2011 21:14:07 -0400 (EDT)
From: Kartik Mohta <kartikmohta@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2011 21:14:06 -0400
Message-Id: <1302138846-5819-1-git-send-email-kartikmohta@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] Adding mercurial v1.8.2
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
X-List-Received-Date: Thu, 07 Apr 2011 01:25:59 -0000

Haven't updated the native version since it requires python-docutils for
which we don't have a native recipe.

Signed-off-by: Kartik Mohta <kartikmohta@gmail.com>
---
 .../mercurial/mercurial-1.8.2/python_inc_dir.patch |   11 +++++++++++
 recipes/mercurial/mercurial_1.8.2.bb               |   20 ++++++++++++++++++++
 2 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 recipes/mercurial/mercurial-1.8.2/python_inc_dir.patch
 create mode 100644 recipes/mercurial/mercurial_1.8.2.bb

diff --git a/recipes/mercurial/mercurial-1.8.2/python_inc_dir.patch b/recipes/mercurial/mercurial-1.8.2/python_inc_dir.patch
new file mode 100644
index 0000000..7b651be
--- /dev/null
+++ b/recipes/mercurial/mercurial-1.8.2/python_inc_dir.patch
@@ -0,0 +1,11 @@
+--- mercurial-1.8.2/setup.py~	2011-04-06 20:29:35.576828632 -0400
++++ mercurial-1.8.2/setup.py	2011-04-06 20:29:07.869694480 -0400
+@@ -254,7 +254,7 @@
+                     self.py_modules.append("mercurial.pure.%s" % ext.name[10:])
+             self.distribution.ext_modules = []
+         else:
+-            if not os.path.exists(os.path.join(get_python_inc(), 'Python.h')):
++            if not os.path.exists(os.path.join(get_python_inc(plat_specific = True), 'Python.h')):
+                 raise SystemExit("Python headers are required to build Mercurial")
+ 
+     def find_modules(self):
diff --git a/recipes/mercurial/mercurial_1.8.2.bb b/recipes/mercurial/mercurial_1.8.2.bb
new file mode 100644
index 0000000..26c10aa
--- /dev/null
+++ b/recipes/mercurial/mercurial_1.8.2.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "The Mercurial distributed SCM"
+HOMEPAGE = "http://mercurial.selenic.com/"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+DEPENDS = "python python-docutils"
+PR = "r0"
+
+SRC_URI = "http://mercurial.selenic.com/release/mercurial-${PV}.tar.gz;name=src \
+           file://python_inc_dir.patch \
+          "
+SRC_URI[src.md5sum] = "a1634b9b709ecc70662f3257abece2c7"
+SRC_URI[src.sha256sum] = "d326be6a5d8d9d39bfab1cadd4d8fd64937ba7c217dfbcba1f83e5026c57b041"
+
+S = "${WORKDIR}/mercurial-${PV}"
+
+inherit distutils
+
+FILES_${PN}-dbg="${libdir}/python2.6/site-packages/mercurial/.debug \
+                 ${libdir}/python2.6/site-packages/hgext/inotify/linux/.debug \
+                "
-- 
1.7.1



