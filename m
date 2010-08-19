Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OmAWN-0007Ny-Ux
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 21:11:29 +0200
Received: by qyk4 with SMTP id 4so2379327qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 12:11:07 -0700 (PDT)
Received: by 10.224.19.140 with SMTP id a12mr198351qab.217.1282245066819;
	Thu, 19 Aug 2010 12:11:06 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id t18sm2075098qco.8.2010.08.19.12.11.05
	(version=SSLv3 cipher=RC4-MD5); Thu, 19 Aug 2010 12:11:05 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Aug 2010 14:11:04 -0500
Message-Id: <1282245064-30490-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] beagleboard.conf: use qt4-x11-free-gles
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
X-List-Received-Date: Thu, 19 Aug 2010 19:11:30 -0000


Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 conf/machine/beagleboard.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
index ce48019..579bcc6 100644
--- a/conf/machine/beagleboard.conf
+++ b/conf/machine/beagleboard.conf
@@ -16,6 +16,7 @@ GUI_MACHINE_CLASS = "bigscreen"
 require conf/machine/include/omap3.inc
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
+PREFERRED_PROVIDER_qt4-x11-free = "qt4-x11-free-gles"
 
 IMAGE_FSTYPES += "tar.bz2 ubi"
 EXTRA_IMAGECMD_jffs2 = "-lnp "
-- 
1.5.6.4



