Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1Letam-0005cX-8G
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:05:08 +0100
Received: (qmail 28115 invoked by uid 813007); 4 Mar 2009 15:54:14 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:54:14 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetQ7-0001FD-CC; Wed, 04 Mar 2009 16:54:07 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:53:07 +0100
Message-Id: <1236182004-4523-53-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 52/70] classes: Split rpm feeds by PACKAGE_ARCH (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:05:10 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5381 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 classes/package_rpm.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/package_rpm.bbclass b/classes/package_rpm.bbclass
index eb39834..32e5f82 100644
--- a/classes/package_rpm.bbclass
+++ b/classes/package_rpm.bbclass
@@ -129,7 +129,7 @@ python write_specfile() {
 
 	# move the rpm into the pkgoutdir
 	rpm = bb.data.expand('${RPMBUILDPATH}/RPMS/${TARGET_ARCH}/${PKG}-${RPMPV}-${PR}.${TARGET_ARCH}.rpm', d)
-	outrpm = bb.data.expand('${DEPLOY_DIR_RPM}/${PKG}-${RPMPV}-${PR}.${TARGET_ARCH}.rpm', d)
+	outrpm = bb.data.expand('${DEPLOY_DIR_RPM}/${PACKAGE_ARCH}/${PKG}-${RPMPV}-${PR}.${TARGET_ARCH}.rpm', d)
 	bb.movefile(rpm, outrpm)
 }
 
@@ -191,7 +191,7 @@ python do_package_rpm () {
 		bb.data.update_data(localdata)
 
 		basedir = os.path.join(os.path.dirname(root))
-		pkgoutdir = outdir
+        pkgoutdir = os.path.join(outdir, bb.data.getVar('PACKAGE_ARCH', localdata, 1))
 		bb.mkdirhier(pkgoutdir)
 		bb.data.setVar('OUTSPECFILE', os.path.join(workdir, "%s.spec" % pkg), localdata)
 		# Save the value of RPMBUILD expanded into the new dictonary so any 
-- 
1.6.1.3





