Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PnsUZ-0001HP-Nu
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 13:52:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id DE749314D3FC;
	Fri, 11 Feb 2011 13:51:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id M74PubnHrXOU; Fri, 11 Feb 2011 13:51:46 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id B9D47314D9FA;
	Fri, 11 Feb 2011 13:51:45 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 11 Feb 2011 12:51:45 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Feb 2011 12:51:42 +0000
Message-Id: <1297428703-2330-3-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1297428703-2330-1-git-send-email-obi@opendreambox.org>
References: <1297428703-2330-1-git-send-email-obi@opendreambox.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/4] package_ipk.bbclass: use common function to write relationship fields
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
X-List-Received-Date: Fri, 11 Feb 2011 12:52:55 -0000

* A function write_dep_field() was added to do_package_ipk() to
  ensure explode_deps is called for every field and to simplify
  the code.

* The following statement was removed from do_package_ipk():

  if not '-locale-' and not '-dbg' and not '-dev' in pkgname:
      rdepends.append('%s-locale*' % pkgname)

  It was added in November 2008, but can never evaluate to true.

  See commit a045dfacf6f2541e0f410d9d109581f181303756

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
CC: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/package_ipk.bbclass |   34 ++++++++++++----------------------
 1 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
index a68d208..28aadc2 100644
--- a/classes/package_ipk.bbclass
+++ b/classes/package_ipk.bbclass
@@ -250,28 +250,18 @@ python do_package_ipk () {
 
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
+			var = bb.data.getVar(varname, localdata, True)
+			if var:
+				ctrlfile.write('%s: %s\n' % (outstring, ", ".join(explode_deps(var))))
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



