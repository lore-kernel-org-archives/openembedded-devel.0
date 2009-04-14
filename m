Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1LtdBS-0006LH-Qf
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 09:35:57 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id C744E189350; Tue, 14 Apr 2009 09:35:34 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Apr 2009 09:35:34 +0200
Message-Id: <1239694534-23578-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
X-SA-Exim-Connect-IP: 80.81.242.146
X-SA-Exim-Mail-From: koen@amethyst.openembedded.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] gdbm: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Tue, 14 Apr 2009 07:35:57 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gdbm/gdbm_1.8.3.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/gdbm/gdbm_1.8.3.bb b/recipes/gdbm/gdbm_1.8.3.bb
index f3beb47..883022e 100644
--- a/recipes/gdbm/gdbm_1.8.3.bb
+++ b/recipes/gdbm/gdbm_1.8.3.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 PRIORITY = "optional"
 LICENSE = "GPL"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
 	   file://makefile.patch;patch=1 \
@@ -12,6 +12,8 @@ SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
 
 inherit autotools
 
+TARGET_CC_ARCH += "${LDFLAGS}"
+
 do_stage () {
 	oe_libinstall -so -a libgdbm ${STAGING_LIBDIR}
 	install -m 0644 ${S}/gdbm.h ${STAGING_INCDIR}/
-- 
1.5.6.5



