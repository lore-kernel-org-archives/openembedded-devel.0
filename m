Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1Letat-0005dY-KE
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:05:15 +0100
Received: (qmail 28680 invoked by uid 813007); 4 Mar 2009 15:54:23 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:54:23 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetQG-0001Fm-Dg; Wed, 04 Mar 2009 16:54:16 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:53:18 +0100
Message-Id: <1236182004-4523-64-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 63/70] package.bbclass: Write out extra useful data into the pkgdata files (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:05:16 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky/trunk@5388 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 classes/package.bbclass |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/classes/package.bbclass b/classes/package.bbclass
index 5559592..7a61c5a 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -483,6 +483,11 @@ python emit_pkgdata() {
 		val = bb.data.getVar('%s_%s' % (var, pkg), d, 1)
 		if val:
 			f.write('%s_%s: %s\n' % (var, pkg, encode(val)))
+ 			return
+ 		val = bb.data.getVar('%s' % (var), d, 1)
+ 		if val:
+ 			f.write('%s: %s\n' % (var, encode(val)))
+ 		return
 
 	packages = bb.data.getVar('PACKAGES', d, True)
 	pkgdatadir = bb.data.getVar('PKGDATA_DIR', d, True)
@@ -503,6 +508,7 @@ python emit_pkgdata() {
 		subdata_file = pkgdatadir + "/runtime/%s" % pkg
 		sf = open(subdata_file, 'w')
 		write_if_exists(sf, pkg, 'PN')
+		write_if_exists(sf, pkg, 'PV')
 		write_if_exists(sf, pkg, 'PR')
 		write_if_exists(sf, pkg, 'DESCRIPTION')
 		write_if_exists(sf, pkg, 'RDEPENDS')
-- 
1.6.1.3





