Received: from nat-lmt.mentorg.com ([139.181.28.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ciby_peuse@mentor.com>) id 1Smosd-0001vc-5N
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jul 2012 18:26:11 +0200
Received: from localhost.localdomain ([134.86.97.114])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id q65FsxgE016094;
	Thu, 5 Jul 2012 10:54:59 -0500
From: Ciby Peuse <ciby_peuse@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jul 2012 10:52:58 -0500
Message-Id: <1341503578-16231-1-git-send-email-ciby_peuse@mentor.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Ciby Peuse <ciby_peuse@mentor.com>
Subject: [meta-oe] libedit: Update LICENSE, adjust DEPENDS assignment and include PR.
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
X-List-Received-Date: Thu, 05 Jul 2012 16:26:11 -0000

Update to include SPDX license string and include a few other
improvements to the recipe.
Signed-off-by: Ciby Peuse <ciby_peuse@mentor.com>
---
 .../recipes-devtools/libedit/libedit_20110802.bb   |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/libedit/libedit_20110802.bb b/meta-oe/recipes-devtools/libedit/libedit_20110802.bb
index 2aac727..d55eaf6 100644
--- a/meta-oe/recipes-devtools/libedit/libedit_20110802.bb
+++ b/meta-oe/recipes-devtools/libedit/libedit_20110802.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "BSD replacement for libreadline"
 HOMEPAGE = "http://www.thrysoee.dk/editline/"
 SECTION = "libs"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1e4228d0c5a9093b01aeaaeae6641533"
-
-DEPENDS = "ncurses"
+DEPENDS += "ncurses"
+PR = "r0"
 
 inherit autotools
 
-- 
1.7.0.4



