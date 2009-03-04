Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1Letab-0005a5-Jg
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:05:01 +0100
Received: (qmail 27668 invoked by uid 813007); 4 Mar 2009 15:54:05 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:54:04 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPx-0001Eb-IE; Wed, 04 Mar 2009 16:53:57 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:55 +0100
Message-Id: <1236182004-4523-41-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 40/70] package_rpm.bbclass: Improve handling of '-' characters in Requires and Recommends fields (from Poky)
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

git-svn-id: https://svn.o-hand.com/repos/poky@5390 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 classes/package_rpm.bbclass |   46 +++++++++++++++++++-----------------------
 1 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/classes/package_rpm.bbclass b/classes/package_rpm.bbclass
index 47fbb38..084d8de 100644
--- a/classes/package_rpm.bbclass
+++ b/classes/package_rpm.bbclass
@@ -24,8 +24,6 @@ python write_specfile() {
 		"ROOT": "BuildRoot",
 		"LICENSE": "License",
 		"SECTION": "Group",
-		"pkg_postinst": "%post",
-		"pkg_preinst": "%pre",
 	}
 
 	root = bb.data.getVar('ROOT', d)
@@ -69,29 +67,29 @@ python write_specfile() {
 		if out_vartranslate[var][0] == "%":
 			continue
 		val = bb.data.getVar(var, d, 1)
-		if val:
-			fd.write("%s\t: %s\n" % (out_vartranslate[var], val))
+		fd.write("%s\t: %s\n" % (out_vartranslate[var], val))
 
 	fd.write("AutoReqProv: no\n")
 
 	bb.build.exec_func("mapping_rename_hook", d)
-	rdepends = bb.utils.explode_dep_versions(bb.data.getVar('RDEPENDS', d, True) or "")
-	for dep in rdepends:
-		ver = rdepends[dep]
-		if dep and ver:
-			ver = ver.replace('-', '+')
-			fd.write("Requires: %s %s\n" % (dep, ver))
-		elif dep:
-			fd.write("Requires: %s\n" % (dep))
-
-	rdepends = bb.utils.explode_dep_versions(bb.data.getVar('RRECOMMENDS', d, True) or "")
-	for dep in rdepends:
-		ver = rdepends[dep]
-		if dep and ver:
-			ver = ver.replace('-', '+')
-			fd.write("Recommends: %s %s\n" % (dep, ver))
-		elif dep:
-			fd.write("Recommends: %s\n" % (dep))
+
+	def write_dep_field(varname, outstring):
+		depends = bb.utils.explode_dep_versions(bb.data.getVar(varname, d, True) or "")
+		for dep in depends:
+			ver = depends[dep]
+			if dep and ver:
+				if '-' in ver:
+					subd = read_subpkgdata_dict(dep, d)
+					pv = subd['PV']
+					reppv = pv.replace('-', '+')
+					ver = ver.replace(pv, reppv)
+				fd.write("%s: %s %s\n" % (outstring, dep, ver))
+			elif dep:
+				fd.write("%s: %s\n" % (outstring, dep))
+
+
+	write_dep_field('RDEPENDS', 'Requires')
+	write_dep_field('RRECOMMENDS', 'Recommends')
 
         fd.write("Release\t: %s\n" % bb.data.expand('${PR}${DISTRO_PR}', d, True)
 	fd.write("Summary\t: .\n")
@@ -99,10 +97,8 @@ python write_specfile() {
 	for var in out_vartranslate.keys():
 		if out_vartranslate[var][0] != "%":
 			continue
-		val = bb.data.getVar(var, d)
-		if val:
-			fd.write(out_vartranslate[var] + "\n")
-			fd.write(val + "\n\n")
+		fd.write(out_vartranslate[var] + "\n")
+		fd.write(bb.data.getVar(var, d) + "\n\n")
 
 	fd.write("%files\n")
 	for file in files:
-- 
1.6.1.3





