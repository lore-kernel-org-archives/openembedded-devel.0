Received: from smtp201.alice.it ([82.57.200.97])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1QKrlm-0003CS-GL
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 14:47:03 +0200
Received: from localhost.localdomain (79.51.85.13) by smtp201.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4CC05A4C06BF017D; Fri, 13 May 2011 14:44:15 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: Stefan Schmidt <stefan@buglabs.net>
Date: Fri, 13 May 2011 14:43:08 +0200
Message-Id: <1305290588-7057-10-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1305290080.2448.3.camel@gnutoo-laptop>
References: <1305290080.2448.3.camel@gnutoo-laptop>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 12/12] bug20.conf: switch to the 2.6.35 linaro kernel
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
X-List-Received-Date: Fri, 13 May 2011 12:47:04 -0000

This kenrel supports more features/devices:
 * wifi power management works
 * it supports more BMI modules(for instance bugsound, bugsense etc...)

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 conf/machine/bug20.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/bug20.conf b/conf/machine/bug20.conf
index 95ce49c..97369e3 100644
--- a/conf/machine/bug20.conf
+++ b/conf/machine/bug20.conf
@@ -20,7 +20,7 @@ GUI_MACHINE_CLASS = "bigscreen"
 
 require conf/machine/include/omap3.inc
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-omap-hah"
+PREFERRED_PROVIDER_virtual/kernel = "linux-bug20-linaro"
 
 IMAGE_FSTYPES += "tar.bz2 ubi"
 EXTRA_IMAGECMD_jffs2 = "-lnp "
-- 
1.7.0.4



