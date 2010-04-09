Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@build2.altell.local>) id 1O0Bwe-0000kx-Mn
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 13:00:17 +0200
Received: from build2.altell.local (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTPS id 53CC86826E;
	Fri,  9 Apr 2010 14:56:39 +0400 (MSD)
Received: from rik by build2.altell.local with local (Exim 4.69)
	(envelope-from <rik@build2.altell.local>)
	id 1O0BsN-0003fK-V6; Fri, 09 Apr 2010 14:55:51 +0400
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Apr 2010 14:55:51 +0400
Message-Id: <1270810551-14070-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
X-Altell-MailScanner-ID: 53CC86826E.938D1
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: rik@build2.altell.local
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: rik@build2.altell.local
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] image.bbclass: another take on interdependent images build
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
X-List-Received-Date: Fri, 09 Apr 2010 11:00:17 -0000

Previous episodes:
736c06e8d8 image.bbclass: reorder do_rootfs
049a7998d0 Revert "image.bbclass: reorder do_rootfs"

As I still build many interdependent images and as I still don't want
to write "do_rootfs[depends] = ..." in images, I think we can easily
solve the problem by recrdep-ing do_rootfs on any other do_rootfs-es.
This way one can add any images he wants to be built before that one
via usual DEPENDS mechanism and it should really work nice this way.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 classes/image.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/image.bbclass b/classes/image.bbclass
index 8e202f0..78987ca 100644
--- a/classes/image.bbclass
+++ b/classes/image.bbclass
@@ -36,7 +36,7 @@ IMAGE_BASENAME[export] = "1"
 export PACKAGE_INSTALL ?= "${IMAGE_INSTALL} ${IMAGE_BOOT}"
 
 # We need to recursively follow RDEPENDS and RRECOMMENDS for images
-do_rootfs[recrdeptask] += "do_deploy do_populate_staging"
+do_rootfs[recrdeptask] += "do_deploy do_populate_staging do_rootfs"
 
 # Images are generally built explicitly, do not need to be part of world.
 EXCLUDE_FROM_WORLD = "1"
-- 
1.5.6.5



