Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetU7-0005Oo-VO
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 16:58:45 +0100
Received: (qmail 27624 invoked by uid 813007); 4 Mar 2009 15:54:03 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:54:03 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPv-0001EV-To; Wed, 04 Mar 2009 16:53:55 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:53 +0100
Message-Id: <1236182004-4523-39-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 38/70] package_rpm.bbclass: Fix problems with package version with '-' in the version (replace with '+'), improve the Requires and Recommends generation code (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:00:48 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5129 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 classes/package_rpm.bbclass |   33 +++++++++++++++++++++++++--------
 1 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/classes/package_rpm.bbclass b/classes/package_rpm.bbclass
index e1398d2..040d8b8 100644
--- a/classes/package_rpm.bbclass
+++ b/classes/package_rpm.bbclass
@@ -12,9 +12,14 @@ RPM="rpm ${RPMOPTS}"
 python write_specfile() {
 	from bb import data, build
 	import sys
+
+	version = bb.data.getVar('PV', d, 1)
+	version = version.replace('-', '+')
+	bb.data.setVar('RPMPV', version, d)
+
 	out_vartranslate = {
 		"PKG": "Name",
-		"PV": "Version",
+		"RPMPV": "Version",
 		"DESCRIPTION": "%description",
 		"ROOT": "BuildRoot",
 		"LICENSE": "License",
@@ -67,10 +72,24 @@ python write_specfile() {
 	fd.write("AutoReqProv: no\n")
 
 	bb.build.exec_func("mapping_rename_hook", d)
-	rdepends = " ".join(bb.utils.explode_deps(bb.data.getVar('RDEPENDS', d, True) or ""))
+	rdepends = bb.utils.explode_dep_versions(bb.data.getVar('RDEPENDS', d, True) or "")
+	for dep in rdepends:
+		ver = rdepends[dep]
+		if dep and ver:
+			ver = ver.replace('-', '+')
+			fd.write("Requires: %s %s\n" % (dep, ver))
+		elif dep:
+			fd.write("Requires: %s\n" % (dep))
+
+	rdepends = bb.utils.explode_dep_versions(bb.data.getVar('RRECOMMENDS', d, True) or "")
+	for dep in rdepends:
+		ver = rdepends[dep]
+		if dep and ver:
+			ver = ver.replace('-', '+')
+			fd.write("Recommends: %s %s\n" % (dep, ver))
+		elif dep:
+			fd.write("Recommends: %s\n" % (dep))
 
-	if rdepends:
-		fd.write("Requires: %s\n" % rdepends)
         fd.write("Release\t: %s\n" % bb.data.expand('${PR}${DISTRO_PR}', d, True)
 	fd.write("Summary\t: .\n")
 
@@ -82,8 +101,6 @@ python write_specfile() {
 
 	fd.write("%files\n")
 	for file in files:
-		if file[0] != '/':
-			fd.write('/')
 		fd.write("%s\n" % file)
 
 	fd.close()
@@ -97,8 +114,8 @@ python write_specfile() {
 	bb.build.exec_func('BUILDSPEC', d)
 
 	# move the rpm into the pkgoutdir
-	rpm = bb.data.expand('${RPMBUILDPATH}/RPMS/${TARGET_ARCH}/${PKG}-${PV}-${PR}${DISTRO_PR}.${TARGET_ARCH}.rpm', d)
-	outrpm = bb.data.expand('${DEPLOY_DIR_RPM}/${PKG}-${PV}-${PR}${DISTRO_PR}.${TARGET_ARCH}.rpm', d)
+	rpm = bb.data.expand('${RPMBUILDPATH}/RPMS/${TARGET_ARCH}/${PKG}-${RPMPV}-${PR}.${TARGET_ARCH}.rpm', d)
+	outrpm = bb.data.expand('${DEPLOY_DIR_RPM}/${PKG}-${RPMPV}-${PR}.${TARGET_ARCH}.rpm', d)
 	bb.movefile(rpm, outrpm)
 }
 
-- 
1.6.1.3





