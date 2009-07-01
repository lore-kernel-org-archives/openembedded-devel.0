Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM58U-0003A1-1Q
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:06:26 +0200
Received: (qmail 30478 invoked by uid 813007); 1 Jul 2009 18:54:30 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 18:54:29 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 20:54:17 +0200
Message-Id: <1246474461-16671-11-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200907011817.02564.marcin@juszkiewicz.com.pl>
References: <200907011817.02564.marcin@juszkiewicz.com.pl>
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH 016/125] bitbake.conf: weakly assign OLDEST_KERNEL ?= "2.4.0" *after* machine and distro configs are included
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
X-List-Received-Date: Wed, 01 Jul 2009 19:06:26 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 conf/bitbake.conf |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index c411b95..2226d5c 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -310,7 +310,6 @@ SDK_PATH = "/usr/local/${SDK_NAME}"
 # Kernel info.
 ##################################################################
 
-OLDEST_KERNEL = "2.4.0"
 STAGING_KERNEL_DIR = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}/kernel"
 
 ##################################################################
@@ -644,6 +643,8 @@ require conf/enterprise.conf
 # Weak variables (usually to retain backwards compatibility)
 ##################################################################
 
+OLDEST_KERNEL ?= "2.4.0"
+
 DL_DIR ?= "${TMPDIR}/downloads"
 IMAGE_FSTYPES ?= "tar.gz"
 PCMCIA_MANAGER ?= "pcmcia-cs"
-- 
1.6.3.1





