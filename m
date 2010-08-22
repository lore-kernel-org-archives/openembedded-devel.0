Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OnHHU-000622-4t
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 22:36:55 +0200
Received: by qwa26 with SMTP id 26so1624268qwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 13:36:12 -0700 (PDT)
Received: by 10.224.47.85 with SMTP id m21mr2696479qaf.384.1282509370959;
	Sun, 22 Aug 2010 13:36:10 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id l13sm5942511qck.43.2010.08.22.13.36.09
	(version=SSLv3 cipher=RC4-MD5); Sun, 22 Aug 2010 13:36:10 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Aug 2010 15:36:08 -0500
Message-Id: <1282509368-7791-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] beagleboard.conf: get a console prompt on the monitor
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
X-List-Received-Date: Sun, 22 Aug 2010 20:36:55 -0000


Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 conf/machine/beagleboard.conf |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
index 579bcc6..91c4129 100644
--- a/conf/machine/beagleboard.conf
+++ b/conf/machine/beagleboard.conf
@@ -24,6 +24,9 @@ EXTRA_IMAGECMD_jffs2 = "-lnp "
 # Guesswork
 SERIAL_CONSOLE = "115200 ttyS2"
 
+USE_VT = "1"
+SYSVINIT_ENABLED_GETTYS = "0"
+
 UBOOT_MACHINE = "omap3_beagle_config"
 
 # do ubiattach /dev/ubi_ctrl -m 4
-- 
1.5.6.4



