Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1Letab-0005a4-Je
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:05:01 +0100
Received: (qmail 27727 invoked by uid 813007); 4 Mar 2009 15:54:05 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:54:05 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPy-0001Ee-Co; Wed, 04 Mar 2009 16:53:58 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:56 +0100
Message-Id: <1236182004-4523-42-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 41/70] package_rpm.bbclass: Fix package version fixing for PKG renamed packages (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:05:07 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5393 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 classes/package_rpm.bbclass |   21 +++++++++++++++++----
 1 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/classes/package_rpm.bbclass b/classes/package_rpm.bbclass
index 084d8de..de4d898 100644
--- a/classes/package_rpm.bbclass
+++ b/classes/package_rpm.bbclass
@@ -71,10 +71,9 @@ python write_specfile() {
 
 	fd.write("AutoReqProv: no\n")
 
-	bb.build.exec_func("mapping_rename_hook", d)
-
-	def write_dep_field(varname, outstring):
+	def fix_dep_versions(varname):
 		depends = bb.utils.explode_dep_versions(bb.data.getVar(varname, d, True) or "")
+		newdeps = []
 		for dep in depends:
 			ver = depends[dep]
 			if dep and ver:
@@ -83,11 +82,25 @@ python write_specfile() {
 					pv = subd['PV']
 					reppv = pv.replace('-', '+')
 					ver = ver.replace(pv, reppv)
+				newdeps.append("%s (%s)" % (dep, ver))
+			elif dep:
+				newdeps.append(dep)
+		bb.data.setVar(varname, ", ".join(newdeps), d)
+
+	fix_dep_versions('RDEPENDS')
+	fix_dep_versions('RRECOMMENDS')
+
+	bb.build.exec_func("mapping_rename_hook", d)
+
+	def write_dep_field(varname, outstring):
+		depends = bb.utils.explode_dep_versions(bb.data.getVar(varname, d, True) or "")
+		for dep in depends:
+			ver = depends[dep]
+			if dep and ver:
 				fd.write("%s: %s %s\n" % (outstring, dep, ver))
 			elif dep:
 				fd.write("%s: %s\n" % (outstring, dep))
 
-
 	write_dep_field('RDEPENDS', 'Requires')
 	write_dep_field('RRECOMMENDS', 'Recommends')
 
-- 
1.6.1.3





