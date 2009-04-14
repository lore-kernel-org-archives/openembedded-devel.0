Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1LtjpL-00036D-R5
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 16:41:45 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 5A74AE8082; Tue, 14 Apr 2009 16:41:11 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Apr 2009 16:41:11 +0200
Message-Id: <1239720071-6333-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
X-SA-Exim-Connect-IP: 80.81.242.146
X-SA-Exim-Mail-From: koen@amethyst.openembedded.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] ltrace: fix build (at least for omap3)
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
X-List-Received-Date: Tue, 14 Apr 2009 14:41:52 -0000

From: Carsten Haitzler (Rasterman) <raster@rasterman.com>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/ltrace/ltrace_0.4.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/ltrace/ltrace_0.4.bb b/recipes/ltrace/ltrace_0.4.bb
index 19a0d43..9dc959e 100644
--- a/recipes/ltrace/ltrace_0.4.bb
+++ b/recipes/ltrace/ltrace_0.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://packages.debian.org/unstable/utils/ltrace.html"
 SECTION = "devel"
 DEPENDS = "binutils libelf"
 LICENSE = "GPL"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/l/ltrace/ltrace_0.4.orig.tar.gz \
            ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_0.4-1.diff.gz;patch=1 \
@@ -18,6 +18,7 @@ EXTRA_OEMAKE = "INSTALL_FILE='$(INSTALL) -p -m 0644' \
 		INSTALL_DIR='$(INSTALL) -p -d -m 0755' "
 
 export TARGET_CFLAGS = "${SELECTED_OPTIMIZATION} -isystem ${STAGING_INCDIR}"
+TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_configure_prepend() {
 	ln -sf ./linux-gnu sysdeps/linux-gnueabi
-- 
1.5.6.5



