Received: from smtp202.alice.it ([82.57.200.98])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1QNmDR-0003zn-5K
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 May 2011 15:27:37 +0200
Received: from localhost.localdomain (95.244.3.148) by smtp202.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4CC7FB5F03883A19; Sat, 21 May 2011 15:24:41 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 May 2011 15:24:34 +0200
Message-Id: <1305984274-18073-2-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1305984274-18073-1-git-send-email-GNUtoo@no-log.org>
References: <1305984274-18073-1-git-send-email-GNUtoo@no-log.org>
Subject: [PATCH 2/2] bug20.conf: override the omap3 kernel PR and bump PR
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
X-List-Received-Date: Sat, 21 May 2011 13:27:37 -0000

The bug20 uses a different kernel than the one defined in omap3.inc
  So the PR should be independant of omap3.inc.

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 conf/machine/bug20.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/conf/machine/bug20.conf b/conf/machine/bug20.conf
index 97369e3..2d80e82 100644
--- a/conf/machine/bug20.conf
+++ b/conf/machine/bug20.conf
@@ -21,6 +21,7 @@ GUI_MACHINE_CLASS = "bigscreen"
 require conf/machine/include/omap3.inc
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-bug20-linaro"
+MACHINE_KERNEL_PR = "r102"
 
 IMAGE_FSTYPES += "tar.bz2 ubi"
 EXTRA_IMAGECMD_jffs2 = "-lnp "
-- 
1.7.0.4



