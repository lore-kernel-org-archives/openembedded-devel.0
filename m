Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PPEor-0006aC-9w
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 14:40:03 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 700671B40D;
	Sun,  5 Dec 2010 14:39:58 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Dec 2010 14:38:36 +0100
Message-Id: <1291556316-5467-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] u2nl_1.3: fixed SRC_URI
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
X-List-Received-Date: Sun, 05 Dec 2010 13:40:03 -0000

new version avalible.

Signed-off-by: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
---
 recipes/u2nl/u2nl_1.3.bb |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/recipes/u2nl/u2nl_1.3.bb b/recipes/u2nl/u2nl_1.3.bb
index 8390e38..3b096aa 100644
--- a/recipes/u2nl/u2nl_1.3.bb
+++ b/recipes/u2nl/u2nl_1.3.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL"
 SECTION = "console/network"
 PRIORITY = "optional"
 
-SRC_URI = "http://www.reitwiessner.de/programs/u2nl-${PV}.tar.gz \
+SRC_URI = "http://www.sourcefiles.org/Networking/Tools/Port_Forwarding/u2nl-${PV}.tar.gz \
 	   file://buildsystem.patch"
 S = "${WORKDIR}/u2nl-${PV}"
 
@@ -16,6 +16,4 @@ do_install () {
 
 SRC_URI[md5sum] = "d97a16d8b2231501ba418b5f1ffe018a"
 SRC_URI[sha256sum] = "7e1d8239a5bd43c50f6091b484acbc8a7c5886cd4523f1e369504266cbaca50d"
-#CHECKSUMS.INI MISMATCH: I've got this instead:
-#SRC_URI[md5sum] = "5c26e620674932b4d1e50ba86f47a805"
-#SRC_URI[sha256sum] = "d204bba10ce115d474d2d2ae3d027ddcbd10ad3909940a6779731d8df6c51c42"
+
-- 
1.7.0.4



