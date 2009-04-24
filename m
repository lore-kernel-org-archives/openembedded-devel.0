Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1LxFpM-0006BX-Q2
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Apr 2009 09:28:04 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 5661D1880DC; Fri, 24 Apr 2009 09:27:23 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Apr 2009 09:27:23 +0200
Message-Id: <1240558043-13385-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] pxaregs: GNU_HASH QA fix.
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
X-List-Received-Date: Fri, 24 Apr 2009 07:28:04 -0000

From: Stanislav Brabec <utx@penguin.cz>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/pxaregs/pxaregs_1.14.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/pxaregs/pxaregs_1.14.bb b/recipes/pxaregs/pxaregs_1.14.bb
index d57dace..ada5220 100644
--- a/recipes/pxaregs/pxaregs_1.14.bb
+++ b/recipes/pxaregs/pxaregs_1.14.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://www.mn-logistik.de/unsupported/pxa250/pxaregs.c \
 S = "${WORKDIR}"
 
 do_compile() {
-    ${CC} pxaregs.c -o pxaregs ${CFLAGS}
+    ${CC} pxaregs.c -o pxaregs ${CFLAGS} ${LDFLAGS}
 }
 
 do_install() {
-- 
1.5.6.5



