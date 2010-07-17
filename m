Received: from smtp202.alice.it ([82.57.200.98])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Oa8vq-0000G4-VM
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 17:04:06 +0200
Received: from localhost.localdomain (95.232.142.62) by smtp202.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4C1A2A7C005F758C; Sat, 17 Jul 2010 17:03:56 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Jul 2010 17:03:24 +0200
Message-Id: <1279379004-15038-2-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1279379004-15038-1-git-send-email-GNUtoo@no-log.org>
References: <1279379004-15038-1-git-send-email-GNUtoo@no-log.org>
X-SA-Exim-Connect-IP: 82.57.200.98
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] keymaps: remove initscripts dependency
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
X-List-Received-Date: Sat, 17 Jul 2010 15:04:06 -0000

Multiple initscripts version exist,for instance
  initscripts-shr,initscripts-openmoko,initscripts etc...
Depending on a particular initscript is not a good idea:

For instance on SHR(distro) and htcdream(machine)
  it install initscripts instead of initscripts-shr in
  shr-image,which result in having the /etc/init.d/devices which
  is,according to mickeyl, an init script for devfs.
  if this init script is present(with the corresponding rc links) it get
  executed,which causes some devices nodes to lack.
  which prevent sound,modem and maybe other driver from working on the
  htcdream.

Thanks mrmoku in #openmoko-cdevel in Freenode
  for helping me finding the offending recipe.
Thanks mickeyl in #openmoko-cdevel in Freenode for telling me
  that usually packages don't depend on the initscripts

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 recipes/keymaps/keymaps_1.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/keymaps/keymaps_1.0.bb b/recipes/keymaps/keymaps_1.0.bb
index 25a93c2..f8cd77f 100644
--- a/recipes/keymaps/keymaps_1.0.bb
+++ b/recipes/keymaps/keymaps_1.0.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Keyboard map"
 SECTION = "base"
-RDEPENDS_${PN} = "initscripts console-tools"
+RDEPENDS_${PN} = "console-tools"
 LICENSE = "GPL"
 PACKAGE_ARCH = "${MACHINE}"
-PR = "r24"
+PR = "r25"
 
 inherit update-rc.d
 
-- 
1.7.0.4



