Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1Onj4u-0006Cx-1l
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 04:18:02 +0200
Received: by vws13 with SMTP id 13so5840859vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 19:16:55 -0700 (PDT)
Received: by 10.220.62.72 with SMTP id w8mr3830041vch.60.1282616210508;
	Mon, 23 Aug 2010 19:16:50 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id m31sm2216984vcf.37.2010.08.23.19.16.49
	(version=SSLv3 cipher=RC4-MD5); Mon, 23 Aug 2010 19:16:49 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Aug 2010 21:16:47 -0500
Message-Id: <1282616207-2847-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] beagleboard.conf: get a console prompt on the monitor
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
X-List-Received-Date: Tue, 24 Aug 2010 02:18:02 -0000

Bump sysvinit PR and enable the right GETTYS for BeagleBoard.

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---

 conf/machine/beagleboard.conf     |    3 +++
 recipes/sysvinit/sysvinit_2.86.bb |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
index ce48019..0e35e04 100644
--- a/conf/machine/beagleboard.conf
+++ b/conf/machine/beagleboard.conf
@@ -23,6 +23,9 @@ EXTRA_IMAGECMD_jffs2 = "-lnp "
 # Guesswork
 SERIAL_CONSOLE = "115200 ttyS2"
 
+USE_VT = "1"
+SYSVINIT_ENABLED_GETTYS = "0"
+
 UBOOT_MACHINE = "omap3_beagle_config"
 
 # do ubiattach /dev/ubi_ctrl -m 4
diff --git a/recipes/sysvinit/sysvinit_2.86.bb b/recipes/sysvinit/sysvinit_2.86.bb
index 40c642a..51f229f 100644
--- a/recipes/sysvinit/sysvinit_2.86.bb
+++ b/recipes/sysvinit/sysvinit_2.86.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "System-V like init."
 SECTION = "base"
 LICENSE = "GPLv2+"
 HOMEPAGE = "http://freshmeat.net/projects/sysvinit/"
-PR = "r58"
+PR = "r59"
 
 # USE_VT and SERIAL_CONSOLE are generally defined by the MACHINE .conf.
 # Set PACKAGE_ARCH appropriately.
-- 
1.5.6.4



