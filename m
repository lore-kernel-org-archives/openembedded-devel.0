Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1Letau-0005dj-KM
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:05:16 +0100
Received: (qmail 28707 invoked by uid 813007); 4 Mar 2009 15:54:24 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:54:24 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetQH-0001Fp-7U; Wed, 04 Mar 2009 16:54:17 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:53:19 +0100
Message-Id: <1236182004-4523-65-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [PATCH 64/70] package_rpm.bbclass: fix indentation
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
X-List-Received-Date: Wed, 04 Mar 2009 16:05:17 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>

---
 classes/package_rpm.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/package_rpm.bbclass b/classes/package_rpm.bbclass
index 93429ea..c86455c 100644
--- a/classes/package_rpm.bbclass
+++ b/classes/package_rpm.bbclass
@@ -196,7 +196,7 @@ python do_package_rpm () {
 		bb.data.update_data(localdata)
 
 		basedir = os.path.join(os.path.dirname(root))
-        pkgoutdir = os.path.join(outdir, bb.data.getVar('PACKAGE_ARCH', localdata, 1))
+		pkgoutdir = os.path.join(outdir, bb.data.getVar('PACKAGE_ARCH', localdata, 1))
 		bb.mkdirhier(pkgoutdir)
 		bb.data.setVar('OUTSPECFILE', os.path.join(workdir, "%s.spec" % pkg), localdata)
 		# Save the value of RPMBUILD expanded into the new dictonary so any 
-- 
1.6.1.3





