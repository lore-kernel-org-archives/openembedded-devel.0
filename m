Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PPDZm-0005Mz-Uc
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 13:20:23 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 052C51B40D;
	Sun,  5 Dec 2010 13:20:19 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Dec 2010 13:18:47 +0100
Message-Id: <1291551527-3806-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] asterisk_1.2.24: Set correct Checksum
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
X-List-Received-Date: Sun, 05 Dec 2010 12:20:24 -0000

Tilghman Lesher <tlesher@digium.com> wrote on asterisk-users@lists.digium.com:

Due to a licensing issue with some of the files we distributed with previous
tarballs, we removed those files from archived tarballs in order to avoid
continuing to distribute those files in any form.  So yes, the checksums
will have changed, although the checksums we distribute with the tarballs
were also updated at the same time.

Given that most of the changes since 1.2.24 have been security fixes, I
would strongly encourage you to update your packages.  There is no excuse
for distributing vulnerable packages beyond the date that the vulnerability
is disclosed, plus a brief period necessary for releasing updated packages.

Additionally, the 1.2 branch has been EOLed, which means if any additional
security issues are found, we will not be releasing updated packages to
deal with those issues.  For this reason, you would be better off putting
forth the work to release packages based upon 1.4 or 1.8.

Signed-off-by: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
---
 recipes/asterisk/asterisk_1.2.24.bb |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes/asterisk/asterisk_1.2.24.bb b/recipes/asterisk/asterisk_1.2.24.bb
index fb2fd4b..0db2b70 100644
--- a/recipes/asterisk/asterisk_1.2.24.bb
+++ b/recipes/asterisk/asterisk_1.2.24.bb
@@ -45,8 +45,8 @@ FILES_${PN}-dbg += "${libdir}/asterisk/modules/.debug"
 FILES_${PN}-dbg += "/var/lib/asterisk/agi-bin/.debug"
 
 
-SRC_URI[md5sum] = "63dc8b7be4cd10375c5fbda893c780bc"
-SRC_URI[sha256sum] = "9debaf410636fa477e1e1f09fe0b16a1c2814afaf7195f34f29e4ce5b8debbbd"
-# CHECKSUMS.INI MISMATCH: I've got this instead:
-#SRC_URI[md5sum] = "db7bcaaa494804af361157a37c224dfa"
-#SRC_URI[sha256sum] = "eed3493b1409d7100e0f983af0486bd7f8965e9e47b7a6d5ab8539b2dd3609aa"
+#SRC_URI[md5sum] = "63dc8b7be4cd10375c5fbda893c780bc"
+#SRC_URI[sha256sum] = "9debaf410636fa477e1e1f09fe0b16a1c2814afaf7195f34f29e4ce5b8debbbd"
+
+SRC_URI[md5sum] = "db7bcaaa494804af361157a37c224dfa"
+SRC_URI[sha256sum] = "eed3493b1409d7100e0f983af0486bd7f8965e9e47b7a6d5ab8539b2dd3609aa"
-- 
1.7.0.4



