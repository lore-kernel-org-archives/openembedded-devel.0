Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MpFzY-0003rQ-PZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Sep 2009 08:33:52 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KQ900EVSBJCUQX1@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	20 Sep 2009 01:33:13 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7134014AF4F; Sun,
	20 Sep 2009 02:33:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Sep 2009 02:33:00 -0400
Message-id: <1253428380-27587-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC][PATCH] package.bbclass: export subpackage individual version, if different from main
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
X-List-Received-Date: Sun, 20 Sep 2009 06:33:52 -0000

Fixes the wrong versioned runtime dependency for shlib subpackages with
own versions. Consider this:

PACKAGES = "libfoo libbar"
PV_libfoo = "1"
PV_libbar = "2"
PV = "3"

That will generate libfoo_1 and libbar_2 packages, but version 3 will be
exported in shlibs database, leading to the following versioned runtime
dependencies:

RDEPENDS: libfoo (>=3) libbar (>=3)

This fixes the problem.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>

---
 classes/package.bbclass |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/classes/package.bbclass b/classes/package.bbclass
index 5a9fa50..7a0ba80 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -652,6 +652,10 @@ python package_do_shlibs() {
 		needs_ldconfig = False
 		bb.debug(2, "calculating shlib provides for %s" % pkg)
 
+		pkgver = bb.data.getVar('PV_' + pkg, d, 1)
+		if not pkgver:
+			pkgver = ver
+
 		needed[pkg] = []
 		sonames = list()
 		top = os.path.join(pkgdest, pkg)
@@ -696,7 +700,7 @@ python package_do_shlibs() {
 			fd.close()
 			package_stagefile(shlibs_file, d)
 			fd = open(shver_file, 'w')
-			fd.write(ver + '\n')
+			fd.write(pkgver + '\n')
 			fd.close()
 			package_stagefile(shver_file, d)
 		if needs_ldconfig and use_ldconfig:
-- 
1.6.3.3



