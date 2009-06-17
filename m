Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MH0dY-0007We-4q
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 21:17:32 +0200
Received: from localhost.localdomain (unknown [10.50.1.118])
	by hermes.mvista.com (Postfix) with ESMTP
	id 59AB619405; Wed, 17 Jun 2009 12:07:02 -0700 (PDT)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jun 2009 12:07:01 -0700
Message-Id: <1245265621-19602-1-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.0
Subject: [PATCH] src_distribute*.bbclass: cleanup, revamp parts, distribute all sources.
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
X-List-Received-Date: Wed, 17 Jun 2009 19:17:32 -0000

- Kill the big shell function with the case statement used in _local in
  favor of a set of bitbake variables, with the appropriate one selected
  as SRC_DISTRIBUTECOMMAND.
- Add and use SRC_DISTRIBUTE_DLONLY to toggle distribution of all sources
  versus just those downloaded to DL_DIR.  This variable expects to be set
  to an integer, anything but 0 will enable dlonly operation.  This is
  disabled by default.
- Add a more sanely named distribute_sources_all, and make distsrcall
  depend on it, for compatibility.
- By default, distributes the sources into
  ${SRC_DISTRIBUTEDIR}/${LIC}/${PN}/.
- Move some _local specific bits, like use of SRC_DISTRIBUTEDIR, out of
  the main class.
- Set a "LIC" var along with the "SRC" when running SRC_DISTRIBUTECOMMAND,
  to facilitate the above.

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 classes/src_distribute.bbclass       |   43 +++++++++++++++++-------
 classes/src_distribute_local.bbclass |   58 ++++++++++++++++++---------------
 2 files changed, 62 insertions(+), 39 deletions(-)

diff --git a/classes/src_distribute.bbclass b/classes/src_distribute.bbclass
index 30b2670..7d75c9e 100644
--- a/classes/src_distribute.bbclass
+++ b/classes/src_distribute.bbclass
@@ -1,29 +1,46 @@
+SRC_DISTRIBUTE_DLONLY ?= "0"
 SRC_DISTRIBUTECOMMAND[func] = "1"
+
+addtask distribute_sources before do_build after do_fetch
 python do_distribute_sources () {
+	import os, re, bb
+
+	bb.build.exec_func("do_fetch", d)
+
 	l = bb.data.createCopy(d)
 	bb.data.update_data(l)
-	licenses = (bb.data.getVar('LICENSE', d, 1) or "unknown").split()
 
-	sources_dir = bb.data.getVar('SRC_DISTRIBUTEDIR', d, 1)
-	import re
+	licenses = (bb.data.getVar('LICENSE', d, 1) or "unknown").split()
 	for license in licenses:
 		for entry in license.split("|"):
 			for url in ((bb.data.getVar('SRC_URI', d, 1) or '').split()):
 				bb.fetch.init([url], d)
 				s = bb.fetch.localpath(url, d)
 				s = re.sub(';.*$', '', s)
+
+				try:
+					dlonly = int(d.getVar("SRC_DISTRIBUTE_DLONLY", 1))
+				except ValueError:
+					raise bb.build.FuncFailed("Invalid value for SRC_DISTRIBUTE_DLONLY: expected integer.")
+				if dlonly:
+					dldir = os.path.realpath(d.getVar("DL_DIR", 1) or "")
+					if dldir and not \
+					   os.path.realpath(s).startswith(dldir + os.path.sep):
+							continue
+
 				cmd = bb.data.getVar('SRC_DISTRIBUTECOMMAND', d, 1)
 				if not cmd:
-					raise bb.build.FuncFailed("Unable to distribute sources, SRC_DISTRIBUTECOMMAND not defined")
-				bb.data.setVar('SRC', s, d)
-				bb.data.setVar('SRC_DISTRIBUTEDIR', "%s/%s" % (sources_dir, entry), d)
-				bb.build.exec_func('SRC_DISTRIBUTECOMMAND', d)
+					raise bb.build.FuncFailed("Unable to distribute sources, SRC_DISTRIBUTECOMMAND not set")
+				bb.debug(2, "srcdist: running %s" % cmd)
+				bb.data.setVar('SRC', os.path.normpath(s), l)
+				bb.data.setVar('LIC', entry, l)
+				bb.build.exec_func('SRC_DISTRIBUTECOMMAND', l)
 }
 
-addtask distribute_sources before do_build after do_fetch
+addtask distribute_sources_all after do_distribute_sources
+do_distribute_sources_all[recrdeptask] = "do_distribute_sources"
+do_distribute_sources_all[nostamp] = "1"
 
-addtask distsrcall after do_distribute_sources
-do_distsrcall[recrdeptask] = "do_distribute_sources"
-base_do_distsrcall() {
-	:
-}
+# compatability wrapper
+addtask distsrcall after do_distribute_sources_all
+do_distsrcall[nostamp] = "1"
diff --git a/classes/src_distribute_local.bbclass b/classes/src_distribute_local.bbclass
index 5f0cef5..ed58ed1 100644
--- a/classes/src_distribute_local.bbclass
+++ b/classes/src_distribute_local.bbclass
@@ -1,31 +1,37 @@
 inherit src_distribute
 
-# SRC_DIST_LOCAL possible values:
-# copy		copies the files from ${A} to the distributedir
-# symlink	symlinks the files from ${A} to the distributedir
-# move+symlink	moves the files into distributedir, and symlinks them back
 SRC_DIST_LOCAL ?= "move+symlink"
 SRC_DISTRIBUTEDIR ?= "${DEPLOY_DIR}/sources"
-SRC_DISTRIBUTECOMMAND () {
-	s="${SRC}"
-	if [ ! -L "$s" ] && (echo "$s"|grep "^${DL_DIR}"); then
-		:
-	else
-		exit 0;
-	fi
-	mkdir -p ${SRC_DISTRIBUTEDIR}
-	case "${SRC_DIST_LOCAL}" in
-		copy)
-			test -e $s.md5 && cp -f $s.md5 ${SRC_DISTRIBUTEDIR}/
-			cp -f $s ${SRC_DISTRIBUTEDIR}/
-			;;
-		symlink)
-			test -e $s.md5 && ln -sf $s.md5 ${SRC_DISTRIBUTEDIR}/
-			ln -sf $s ${SRC_DISTRIBUTEDIR}/
-			;;
-		move+symlink)
-			mv $s ${SRC_DISTRIBUTEDIR}/
-			ln -sf ${SRC_DISTRIBUTEDIR}/`basename $s` $s
-			;;
-	esac
+SRC_DISTRIBUTECOMMAND[dirs] = "${SRC_DISTRIBUTEDIR}/${LIC}/${PN}"
+
+# symlinks the files to the SRC_DISTRIBUTEDIR
+SRC_DISTRIBUTECOMMAND-symlink () {
+    test -e ${SRC}.md5 && ln -sf ${SRC}.md5 .
+    ln -sf ${SRC} .
+}
+
+# copies the files to the SRC_DISTRIBUTEDIR
+SRC_DISTRIBUTECOMMAND-copy () {
+    test -e ${SRC}.md5 && cp -f ${SRC}.md5 .
+    cp -f ${SRC} .
+}
+
+# moves the files to the SRC_DISTRIBUTEDIR and symlinks them back
+SRC_DISTRIBUTECOMMAND-move+symlink () {
+    if ! [ -L ${SRC} ]; then
+        mv ${SRC} .
+        ln -sf $PWD/`basename ${SRC}` ${SRC}
+        if [ -e ${SRC}.md5 ]; then
+            mv ${SRC}.md5 .
+            ln -sf $PWD/`basename ${SRC}.md5` ${SRC}.md5
+        fi
+    fi
+}
+
+#SRC_DISTRIBUTECOMMAND = "${@str(d.getVar('SRC_DISTRIBUTECOMMAND-%s' % d.getVar('SRC_DIST_LOCAL', 1), 1))}"
+python () {
+    if d.getVar("SRC_DISTRIBUTECOMMAND", 1) is None:
+        cmd = d.getVar("SRC_DISTRIBUTECOMMAND-%s" % d.getVar("SRC_DIST_LOCAL", 1), 0)
+        if cmd:
+            d.setVar("SRC_DISTRIBUTECOMMAND", cmd)
 }
-- 
1.6.0



