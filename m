Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@ossystems.com.br>) id 1LXebU-0008Er-Js
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 17:39:56 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id 93DC94025B;
	Thu, 12 Feb 2009 12:38:54 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 42D46740DB;
	Thu, 12 Feb 2009 14:38:48 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id BC676610133; Thu, 12 Feb 2009 14:38:35 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2009 14:38:32 -0200
Message-Id: <1234456715-23618-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.2.rc0
In-Reply-To: <1234456715-23618-3-git-send-email-otavio@ossystems.com.br>
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/6] package.bbclass, package_ipk.bbclass: add dynamic depends on locale packages (ipk specific)
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
X-List-Received-Date: Thu, 12 Feb 2009 16:39:56 -0000

---
 classes/package.bbclass     |   10 ----------
 classes/package_ipk.bbclass |    4 ++++
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/classes/package.bbclass b/classes/package.bbclass
index a7cdb5f..5559592 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -293,16 +293,6 @@ python package_do_split_locales() {
 		bb.data.setVar('DESCRIPTION_' + pkg, '%s translation for %s' % (l, pn), d)
 
 	bb.data.setVar('PACKAGES', ' '.join(packages), d)
-
-	# Disabled by RP 18/06/07
-	# Wildcards aren't supported in debian
-	# They break with ipkg since glibc-locale* will mean that 
-	# glibc-localedata-translit* won't install as a dependency
-	# for some other package which breaks meta-toolchain
-	# Probably breaks since virtual-locale- isn't provided anywhere
-	#rdep = (bb.data.getVar('RDEPENDS_%s' % mainpkg, d, 1) or bb.data.getVar('RDEPENDS', d, 1) or "").split()
-	#rdep.append('%s-locale*' % pn)
-	#bb.data.setVar('RDEPENDS_%s' % mainpkg, ' '.join(rdep), d)
 }
 
 python populate_packages () {
diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
index 3a97729..2d28cf8 100644
--- a/classes/package_ipk.bbclass
+++ b/classes/package_ipk.bbclass
@@ -244,6 +244,10 @@ python do_package_ipk () {
 		rprovides = (bb.data.getVar("RPROVIDES", localdata, 1) or "").split()
 		rreplaces = (bb.data.getVar("RREPLACES", localdata, 1) or "").split()
 		rconflicts = (bb.data.getVar("RCONFLICTS", localdata, 1) or "").split()
+
+		if pkgname.find('-locale-') == -1:
+			rdepends.append('%s-locale*' % pkgname)
+
 		if rdepends:
 			ctrlfile.write("Depends: %s\n" % ", ".join(rdepends))
 		if rsuggests:
-- 
1.6.2.rc0



