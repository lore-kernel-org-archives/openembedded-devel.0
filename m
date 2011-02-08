Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1Pmuwx-0005tt-Ij
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 22:18:15 +0100
Received: by gravedo.de (Postfix, from userid 5001)
	id 828A815E85DB; Tue,  8 Feb 2011 22:17:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from localhost (p5489C5FD.dip.t-dialin.net [84.137.197.253])
	by gravedo.de (Postfix) with ESMTPSA id 573C715E8005;
	Tue,  8 Feb 2011 22:17:08 +0100 (CET)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Feb 2011 22:17:04 +0100
Message-Id: <1297199824-3712-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] evas: disable cpu neon support for palmpre machine
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
X-List-Received-Date: Tue, 08 Feb 2011 21:18:16 -0000

Neon support in evas is currently broken for the palmpre machine. If we enable neon
support evas causes alignment trap errors and lets the device freeze in the end. This
should be reverted after the bug in evas code is found and fixed.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/efl1/evas.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/efl1/evas.inc b/recipes/efl1/evas.inc
index eb64d7a..ad30eba 100644
--- a/recipes/efl1/evas.inc
+++ b/recipes/efl1/evas.inc
@@ -7,7 +7,7 @@ DEPENDS_virtclass-native = "freetype-native libxext-native libpng-native jpeg-na
 inherit efl
 
 BBCLASSEXTEND = "native"
-INC_PR = "r0"
+INC_PR = "r1"
 FILESPATHPKG =. "${BPN}-${PV}:${BPN}:"
 
 python populate_packages_prepend () {
@@ -83,6 +83,9 @@ EVAS_CPU_TWEAKS = ""
 # Disabled for now, see http://thread.gmane.org/gmane.comp.window-managers.enlightenment.devel/25194
 #EVAS_CPU_TWEAKS_armv7a = "--enable-cpu-neon"
 
+# Neon support for evas is broken on palmpre currently (causes the device to freeze)
+EVAS_CPU_TWEAKS_palmpre = "--disable-cpu-neon"
+
 # common options
 EVAS_OECONF = " \
                 --x-includes=${STAGING_INCDIR}/X11 \
-- 
1.7.1



