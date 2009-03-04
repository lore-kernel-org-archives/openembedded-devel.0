Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1Letas-0005dS-F3
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:05:14 +0100
Received: (qmail 28547 invoked by uid 813007); 4 Mar 2009 15:54:21 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:54:21 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetQD-0001Fb-V9; Wed, 04 Mar 2009 16:54:13 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:53:15 +0100
Message-Id: <1236182004-4523-61-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 60/70] package_rpm.bbclass: Add support for postinst and preinst scripts (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:05:15 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky/trunk@5131 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 classes/package_rpm.bbclass |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/classes/package_rpm.bbclass b/classes/package_rpm.bbclass
index f6cb2c6..93429ea 100644
--- a/classes/package_rpm.bbclass
+++ b/classes/package_rpm.bbclass
@@ -24,6 +24,8 @@ python write_specfile() {
 		"ROOT": "BuildRoot",
 		"LICENSE": "License",
 		"SECTION": "Group",
+		"pkg_postinst": "%post",
+		"pkg_preinst": "%pre",
 	}
 
 	root = bb.data.getVar('ROOT', d)
@@ -67,7 +69,8 @@ python write_specfile() {
 		if out_vartranslate[var][0] == "%":
 			continue
 		val = bb.data.getVar(var, d, 1)
-		fd.write("%s\t: %s\n" % (out_vartranslate[var], val))
+		if val:
+			fd.write("%s\t: %s\n" % (out_vartranslate[var], val))
 
 	fd.write("AutoReqProv: no\n")
 
@@ -110,8 +113,10 @@ python write_specfile() {
 	for var in out_vartranslate.keys():
 		if out_vartranslate[var][0] != "%":
 			continue
-		fd.write(out_vartranslate[var] + "\n")
-		fd.write(bb.data.getVar(var, d) + "\n\n")
+		val = bb.data.getVar(var, d)
+		if val:
+			fd.write(out_vartranslate[var] + "\n")
+			fd.write(val + "\n\n")
 
 	fd.write("%files\n")
 	for file in files:
-- 
1.6.1.3





