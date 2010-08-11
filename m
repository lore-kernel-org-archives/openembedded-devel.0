Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OjH3Z-000597-NX
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 21:33:46 +0200
Received: by qwi4 with SMTP id 4so94522qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Aug 2010 12:33:33 -0700 (PDT)
Received: by 10.224.73.106 with SMTP id p42mr11052207qaj.176.1281555212783;
	Wed, 11 Aug 2010 12:33:32 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id t24sm609458qcs.11.2010.08.11.12.33.31
	(version=SSLv3 cipher=RC4-MD5); Wed, 11 Aug 2010 12:33:32 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Aug 2010 14:33:29 -0500
Message-Id: <1281555209-3993-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] u-boot: beagleboard: adjusted clocks to match PSP
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
X-List-Received-Date: Wed, 11 Aug 2010 19:33:46 -0000


Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 ...3-clocks-update-clock-setup-for-36XX-37XX.patch |    4 ++--
 recipes/u-boot/u-boot_git.bb                       |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/u-boot/u-boot-git/beagleboard/0019-OMAP3-clocks-update-clock-setup-for-36XX-37XX.patch b/recipes/u-boot/u-boot-git/beagleboard/0019-OMAP3-clocks-update-clock-setup-for-36XX-37XX.patch
index 03da8ce..e5dbec6 100644
--- a/recipes/u-boot/u-boot-git/beagleboard/0019-OMAP3-clocks-update-clock-setup-for-36XX-37XX.patch
+++ b/recipes/u-boot/u-boot-git/beagleboard/0019-OMAP3-clocks-update-clock-setup-for-36XX-37XX.patch
@@ -726,9 +726,9 @@ index 73063ec..2045e4e 100644
 +per_36x_dpll_param:
 +/*    SYSCLK    M       N      M2      M3      M4     M5      M6      m2DIV */
 +.word 12000,    360,    4,     9,      16,     5,     4,      3,      1
-+.word 13000,   1728,   12,     9,      32,     18,    8,      6,      2
++.word 13000,    864,   12,     9,      16,     9,     4,      3,      1
 +.word 19200,    360,    7,     9,      16,     5,     4,      3,      1
-+.word 26000,   1728,   12,     9,      32,     18,    8,      6,      2
++.word 26000,    432,   12,     9,      16,     9,     4,      3,      1
 +.word 38400,    360,   15,     9,      16,     5,     4,      3,      1
 +
 +.globl get_36x_mpu_dpll_param
diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
index ed2ee92..7f26a87 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -1,5 +1,5 @@
 require u-boot.inc
-PR ="r62"
+PR ="r63"
 
 FILESPATHPKG =. "u-boot-git:"
 
-- 
1.5.6.4



