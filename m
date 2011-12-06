Received: from fb2.tech.numericable.fr ([82.216.111.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <guillaume.gardet@oliseo.fr>) id 1RXvDV-0008Av-A8
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 14:37:53 +0100
Received: from smtp4.tech.numericable.fr (smtp4.nc.sdv.fr [10.0.0.60])
	by fb2.tech.numericable.fr (Postfix) with ESMTP id 481461B945A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Dec 2011 14:21:23 +0100 (CET)
Received: from localhost.localdomain (164.60-224-89.dsl.completel.net
	[89.224.60.164])
	by smtp4.tech.numericable.fr (Postfix) with ESMTP id 4AA3912A804;
	Tue,  6 Dec 2011 14:21:21 +0100 (CET)
From: Guillaume GARDET <guillaume.gardet@oliseo.fr>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2011 14:21:19 +0100
Message-Id: <1323177679-8736-1-git-send-email-guillaume.gardet@oliseo.fr>
X-Mailer: git-send-email 1.7.7
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeefjedrudegucetggdotefuucfrrhhofhhilhgvmecupfgfoffgtffkveetuefngfenuceurghilhhouhhtmecufedttdenuc
Cc: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Subject: [PATCH] Fix git URL to linux-omap git repo.
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
X-List-Received-Date: Tue, 06 Dec 2011 13:37:53 -0000

Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
---
 recipes/linux/linux-omap_2.6.29.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/linux/linux-omap_2.6.29.bb b/recipes/linux/linux-omap_2.6.29.bb
index a87fb25..3248dc3 100644
--- a/recipes/linux/linux-omap_2.6.29.bb
+++ b/recipes/linux/linux-omap_2.6.29.bb
@@ -17,7 +17,7 @@ SRCREV = "58cf2f1425abfd3a449f9fe985e48be2d2555022"
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
 PR_append = "+gitr${SRCREV}"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;protocol=git \
 	   file://defconfig"
 
 SRC_URI_append = " \
-- 
1.7.7



