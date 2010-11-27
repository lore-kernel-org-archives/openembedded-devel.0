Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PMIeh-0006zn-0M
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 12:09:26 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 587EF1B421;
	Sat, 27 Nov 2010 12:09:25 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Nov 2010 12:07:18 +0100
Message-Id: <1290856038-5691-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] cpusage_0.1: fixed download link
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
X-List-Received-Date: Sat, 27 Nov 2010 11:09:27 -0000

cpusage have a new homepage: http://www.net.t-labs.tu-berlin.de/~fabian/proj_de.html
---
 recipes/cpusage/cpusage_0.1.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/cpusage/cpusage_0.1.bb b/recipes/cpusage/cpusage_0.1.bb
index 3f4ddfc..9a3811f 100644
--- a/recipes/cpusage/cpusage_0.1.bb
+++ b/recipes/cpusage/cpusage_0.1.bb
@@ -1,10 +1,12 @@
 DESCRIPTION = "This tool read out the tics counter of the operating system and \
 calculates the Percentages spend in each CPU_STATE."
+HOMEPAGE = "http://www.net.t-labs.tu-berlin.de/~fabian/proj_de.html"
 SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "GPL"
+PR = "r0"
 
-SRC_URI = "http://www8.in.tum.de/~schneifa/group/sources/cpusage-${PV}.tar.gz \
+SRC_URI = "http://www.net.t-labs.tu-berlin.de/~fabian/sources/cpusage-${PV}.tar.gz \
            file://cpusage.patch"
 
 S = "${WORKDIR}/cpusage-${PV}"
-- 
1.7.0.4



