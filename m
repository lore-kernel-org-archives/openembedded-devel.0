Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1Letay-0005eT-E8
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:05:20 +0100
Received: (qmail 28742 invoked by uid 813007); 4 Mar 2009 15:54:26 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:54:26 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetQI-0001Fv-Sy; Wed, 04 Mar 2009 16:54:18 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:53:21 +0100
Message-Id: <1236182004-4523-67-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [PATCH 66/70] package_rpm.bbclass: fix syntax errors
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
X-List-Received-Date: Wed, 04 Mar 2009 16:05:24 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>

---
 classes/package_rpm.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/package_rpm.bbclass b/classes/package_rpm.bbclass
index c86455c..aeb4126 100644
--- a/classes/package_rpm.bbclass
+++ b/classes/package_rpm.bbclass
@@ -52,7 +52,7 @@ python write_specfile() {
 			pass
 	if not files and bb.data.getVar('ALLOW_EMPTY', d) != "1":
 		from bb import note
-		note("Not creating empty archive for %s" % (bb.data.expand('${PKG}-${PV}-${PR}${DISTRO_PR}', d, True))
+		note("Not creating empty archive for %s" % (bb.data.expand('${PKG}-${PV}-${PR}${DISTRO_PR}', d, True)))
 		return
 
 	# output .spec using this metadata store
@@ -107,7 +107,7 @@ python write_specfile() {
 	write_dep_field('RDEPENDS', 'Requires')
 	write_dep_field('RRECOMMENDS', 'Recommends')
 
-        fd.write("Release\t: %s\n" % bb.data.expand('${PR}${DISTRO_PR}', d, True)
+	fd.write("Release\t: %s\n" % bb.data.expand('${PR}${DISTRO_PR}', d, True))
 	fd.write("Summary\t: .\n")
 
 	for var in out_vartranslate.keys():
-- 
1.6.1.3





