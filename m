Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Neu5R-0007d2-Em
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 18:41:24 +0100
Received: (qmail 9366 invoked by uid 813007); 9 Feb 2010 17:38:50 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 9 Feb 2010 17:38:50 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Feb 2010 18:38:16 +0100
Message-Id: <1265737098-5430-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.6.1
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/3] glibc 2.5: do not use asm/page.h header (taken from glibc 2.6.1)
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
X-List-Received-Date: Tue, 09 Feb 2010 17:41:25 -0000

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/glibc/glibc_2.5.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/glibc/glibc_2.5.bb b/recipes/glibc/glibc_2.5.bb
index 6792c58..56e7745 100644
--- a/recipes/glibc/glibc_2.5.bb
+++ b/recipes/glibc/glibc_2.5.bb
@@ -1,5 +1,5 @@
 require glibc.inc
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 ARM_INSTRUCTION_SET = "arm"
 
@@ -49,6 +49,7 @@ SRC_URI = "\
   file://zecke-sane-readelf.patch;patch=1 \
   file://ldd-unbash.patch;patch=1 \
   file://glibc-2.6.1-use-short-for-fnstsw.patch;patch=1 \
+  file://glibc-arm-no-asm-page.patch;patch=1 \
   file://generic-bits_select.h \
   file://generic-bits_types.h \
   file://generic-bits_typesizes.h \
-- 
1.6.6.1





