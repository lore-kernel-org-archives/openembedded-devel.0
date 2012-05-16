Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SUhfm-0008Jo-Tb
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 19:06:03 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 May 2012 18:56:01 +0200
Message-Id: <1337187361-5043-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] systemd.bbclass: drop postrm, use prerm instead
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
X-List-Received-Date: Wed, 16 May 2012 17:06:03 -0000

* Calling "systemctl disable" from postrm is too late and
  causes the following error:

| Failed to issue method call: No such file or directory

* Messing with $D is not needed in *rm scripts.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-oe/classes/systemd.bbclass |   15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index db35717..1edd1e4 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -15,12 +15,7 @@ fi
 }
 
 systemd_prerm() {
-if [ -z "$D" ]; then
-    systemctl stop ${SYSTEMD_SERVICE}
-fi
-}
-
-systemd_postrm() {
+systemctl stop ${SYSTEMD_SERVICE}
 systemctl disable ${SYSTEMD_SERVICE}
 }
 
@@ -93,7 +88,7 @@ do_install_append() {
 
 python populate_packages_prepend () {
 	def systemd_generate_package_scripts(pkg):
-		bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
+		bb.debug(1, 'adding systemd calls to postinst/prerm for %s' % pkg)
 		localdata = bb.data.createCopy(d)
 		overrides = bb.data.getVar("OVERRIDES", localdata, 1)
 		bb.data.setVar("OVERRIDES", "%s:%s" % (pkg, overrides), localdata)
@@ -116,12 +111,6 @@ python populate_packages_prepend () {
 		prerm += bb.data.getVar('systemd_prerm', localdata, 1)
 		bb.data.setVar('pkg_prerm_%s' % pkg, prerm, d)
 
-		postrm = bb.data.getVar('pkg_postrm', localdata, 1)
-		if not postrm:
-			postrm = '#!/bin/sh\n'
-		postrm += bb.data.getVar('systemd_postrm', localdata, 1)
-		bb.data.setVar('pkg_postrm_%s' % pkg, postrm, d)
-
 	# add files to FILES_*-systemd if existent and not already done
 	def systemd_append_file(pkg_systemd, file_append):
 		appended = False
-- 
1.7.9.5



