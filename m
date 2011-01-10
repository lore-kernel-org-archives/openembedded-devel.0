Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1Pc9Hz-00031o-KF
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 05:23:27 +0100
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Pc96v-0005QW-26 from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Jan 2011 20:12:01 -0800
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 10 Jan 2011 05:11:59 +0100
From: "Ahsan, Noor" <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jan 2011 09:13:57 +0500
Message-Id: <1294632837-21666-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 10 Jan 2011 04:11:59.0813 (UTC)
	FILETIME=[8708DF50:01CBB07C]
Subject: [PATCH] packaged-staging.bbclass: bug fix in ipk file name generation for searching ipk file.
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
X-List-Received-Date: Mon, 10 Jan 2011 04:23:27 -0000

* First check the availability of PKGV_pkg variable, if it is not available then get value from PKGV variable for creating ipk file name for searching ipk file.

Signed-off-by: Ahsan, Noor <noor_ahsan@mentor.com>
---
 classes/packaged-staging.bbclass |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
index d0aaea1..1200abc 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
@@ -454,10 +454,13 @@ python do_package_stage () {
             pr = bb.data.getVar('PR_%s' % pkg, d, 1)
             if not pr:
                 pr = bb.data.getVar('PR', d, 1)
+            pkgv = bb.data.getVar('PKGV_%s' % pkg, d, 1)
+            if not pkgv:
+                pkgv = bb.data.getVar('PKGV', d, 1)
             if not oe.packagedata.packaged(pkg, d):
                 continue
             if bb.data.inherits_class('package_ipk', d):
-                srcname = bb.data.expand(pkgname + "_${PKGV}-" + pr + "${DISTRO_PR}" + "_" + arch + ".ipk", d)
+                srcname = bb.data.expand(pkgname + "_" + pkgv + "-" + pr + "${DISTRO_PR}" + "_" + arch + ".ipk", d)
                 srcfile = bb.data.expand("${DEPLOY_DIR_IPK}/" + arch + "/" + srcname, d)
                 if os.path.exists(srcfile):
                     destpath = ipkpath + "/" + arch + "/"
-- 
1.6.3.3



