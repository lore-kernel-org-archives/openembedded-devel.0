Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PMOWT-0004KH-1O
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 18:25:17 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 14B0A1B421;
	Sat, 27 Nov 2010 18:25:19 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Nov 2010 18:24:01 +0100
Message-Id: <1290878641-21360-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libspf2: fixed SRC_URI
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
X-List-Received-Date: Sat, 27 Nov 2010 17:25:18 -0000

fixed URI, and homepage and checksum
---
 recipes/libspf2/libspf2_1.2.9.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes/libspf2/libspf2_1.2.9.bb b/recipes/libspf2/libspf2_1.2.9.bb
index 0f491c9..55227fe 100644
--- a/recipes/libspf2/libspf2_1.2.9.bb
+++ b/recipes/libspf2/libspf2_1.2.9.bb
@@ -2,11 +2,12 @@ DESCRIPTION = "libspf2 is a complete and robust implementation of SPF which \
 provides support for many MTAs."
 SECTION = "libs/network"
 LICENSE = "LGPL"
-SRC_URI = "http://www.libspf2.org/spf/libspf2-${PV}.tar.gz;name=src"
+HOMEPAGE = "http://spf.anarres.org/index.html"
+SRC_URI = "http://spf.anarres.org/spf/libspf2-${PV}.tar.gz"
 S = "${WORKDIR}/libspf2-${PV}"
 
-SRC_URI[src.md5sum] = "3305df4d1b13ca964d80b23bb5e4e2b6"
-SRC_URI[src.sha256sum] = "4837f6b063b1431673754cbf6bef8979de5ffc4d7f26f6b93abd42787ba04862"
+SRC_URI[md5sum] = "3305df4d1b13ca964d80b23bb5e4e2b6"
+SRC_URI[sha256sum] = "4837f6b063b1431673754cbf6bef8979de5ffc4d7f26f6b93abd42787ba04862"
 
 inherit autotools
 
-- 
1.7.0.4



