Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PiJTI-0003wD-3G
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 05:28:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 0C8D0314D3E7;
	Thu, 27 Jan 2011 05:27:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id m35bRAgh5QVS; Thu, 27 Jan 2011 05:27:41 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id B0EA5314D373;
	Thu, 27 Jan 2011 05:27:39 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Thu, 27 Jan 2011 04:27:39 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jan 2011 04:27:39 +0000
Message-Id: <1296102459-29461-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
Cc: Chris Larson <chris_larson@mentor.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] package(_ipk).bbclass: fix versioned dependencies in RDEPENDS et al.
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
X-List-Received-Date: Thu, 27 Jan 2011 04:28:36 -0000

* explode_deps() changed its behavior to omit version information
  when the function was removed from OE in favor of BitBake's
  implementation in March 2010. Since then, packages didn't contain
  versioned runtime dependencies.

  See commit 89b7e433719f43f1c36c76cb8856d559014e99bc

  The solution is to switch to bb.utils.explode_dep_versions(), as
  already used by package_rpm.bbclass.

* Two functions in package.bbclass needlessly added whitespace
  characters to RDEPENDS_*. This was removed.

* The following statement was removed from package_ipk.bbclass:

  if not '-locale-' and not '-dbg' and not '-dev' in pkgname:
      rdepends.append('%s-locale*' % pkgname)

  It was added in November 2008, but can never evaluate to true.

  See commit a045dfacf6f2541e0f410d9d109581f181303756

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
CC: Chris Larson <chris_larson@mentor.com>
CC: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/package.bbclass     |   15 ++++++++-------
 classes/package_ipk.bbclass |   41 +++++++++++++++++++----------------------
 2 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/classes/package.bbclass b/classes/package.bbclass
index 678ffa9..1ea3b72 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -292,12 +292,13 @@ def runtime_mapping_rename (varname, d):
 	#bb.note("%s before: %s" % (varname, bb.data.getVar(varname, d, True)))	
 
 	new_depends = []
-	for depend in explode_deps(bb.data.getVar(varname, d, True) or ""):
+	depends = bb.utils.explode_dep_versions(bb.data.getVar(varname, d, True) or "")
+	for dep in depends:
 		# Have to be careful with any version component of the depend
-		split_depend = depend.split(' (')
-		new_depend = get_package_mapping(split_depend[0].strip(), d)
-		if len(split_depend) > 1:
-			new_depends.append("%s (%s" % (new_depend, split_depend[1]))
+		ver = depends[dep]
+		new_depend = get_package_mapping(dep, d)
+		if ver:
+			new_depends.append("%s (%s)" % (new_depend, ver))
 		else:
 			new_depends.append(new_depend)
 
@@ -517,7 +518,7 @@ python populate_packages () {
 						break
 			if found == False:
 				bb.note("%s contains dangling symlink to %s" % (pkg, l))
-		bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
+		bb.data.setVar('RDEPENDS_' + pkg, " ".join(rdepends), d)
 }
 populate_packages[dirs] = "${D}"
 
@@ -897,7 +898,7 @@ python read_shlibdeps () {
 				fd.close()
 				for l in lines:
 					rdepends.append(l.rstrip())
-		bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
+		bb.data.setVar('RDEPENDS_' + pkg, " ".join(rdepends), d)
 }
 
 python package_depchains() {
diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
index a68d208..03fa29c 100644
--- a/classes/package_ipk.bbclass
+++ b/classes/package_ipk.bbclass
@@ -250,28 +250,25 @@ python do_package_ipk () {
 
 		bb.build.exec_func("mapping_rename_hook", localdata)
 
-		rdepends = explode_deps(bb.data.getVar("RDEPENDS", localdata, 1) or "")
-		rrecommends = explode_deps(bb.data.getVar("RRECOMMENDS", localdata, 1) or "")
-		rsuggests = (bb.data.getVar("RSUGGESTS", localdata, 1) or "").split()
-		rprovides = (bb.data.getVar("RPROVIDES", localdata, 1) or "").split()
-		rreplaces = (bb.data.getVar("RREPLACES", localdata, 1) or "").split()
-		rconflicts = (bb.data.getVar("RCONFLICTS", localdata, 1) or "").split()
-
-		if not '-locale-' and not '-dbg' and not '-dev' in pkgname:
-			rdepends.append('%s-locale*' % pkgname)
-
-		if rdepends:
-			ctrlfile.write("Depends: %s\n" % ", ".join(rdepends))
-		if rsuggests:
-			ctrlfile.write("Suggests: %s\n" % ", ".join(rsuggests))
-		if rrecommends:
-			ctrlfile.write("Recommends: %s\n" % ", ".join(rrecommends))
-		if rprovides:
-			ctrlfile.write("Provides: %s\n" % ", ".join(rprovides))
-		if rreplaces:
-			ctrlfile.write("Replaces: %s\n" % ", ".join(rreplaces))
-		if rconflicts:
-			ctrlfile.write("Conflicts: %s\n" % ", ".join(rconflicts))
+		def write_dep_field(varname, outstring):
+			depends = bb.utils.explode_dep_versions(bb.data.getVar(varname, localdata, True) or "")
+			newdeps = []
+			for dep in depends:
+				ver = depends[dep]
+				if ver:
+					newdeps.append("%s (%s)" % (dep, ver))
+				else:
+					newdeps.append(dep)
+			if newdeps:
+				ctrlfile.write('%s: %s\n' % (outstring, ", ".join(newdeps)))
+
+		write_dep_field('RDEPENDS', 'Depends')
+		write_dep_field('RSUGGESTS', 'Suggests')
+		write_dep_field('RRECOMMENDS', 'Recommends')
+		write_dep_field('RPROVIDES', 'Provides')
+		write_dep_field('RREPLACES', 'Replaces')
+		write_dep_field('RCONFLICTS', 'Conflicts')
+
 		src_uri = bb.data.getVar("SRC_URI", localdata, 1) or d.getVar("FILE", True)
 		src_uri = re.sub("\s+", " ", src_uri)
 		ctrlfile.write("Source: %s\n" % " ".join(src_uri.split()))
-- 
1.7.2.3



