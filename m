Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1OsahK-0004Pp-Tp
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 14:21:20 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Osage-0000db-Er from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 05:20:36 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 6 Sep 2010 14:20:33 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Sep 2010 18:19:00 +0600
Message-Id: <1283775540-13164-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 06 Sep 2010 12:20:33.0667 (UTC)
	FILETIME=[E7678530:01CB4DBD]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libsdl-native: Convert to new style staging, remove do_stage
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
X-List-Received-Date: Mon, 06 Sep 2010 12:21:20 -0000

* Remove do_stage ()
* Replace tabs with 8 spaces in do_configure
* Bump INC_PR = "r3"

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/libsdl/libsdl-native.inc |   18 +++++++-----------
 1 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/recipes/libsdl/libsdl-native.inc b/recipes/libsdl/libsdl-native.inc
index 783797a..faae90c 100644
--- a/recipes/libsdl/libsdl-native.inc
+++ b/recipes/libsdl/libsdl-native.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Simple DirectMedia Layer - native Edition"
 HOMEPAGE = "http://www.libsdl.org"
 SECTION = "libs"
 LICENSE = "LGPL"
-INC_PR = "r2"
+INC_PR = "r3"
 
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
 "
@@ -23,15 +23,11 @@ EXTRA_OECONF = "--disable-debug --disable-cdrom --enable-threads --enable-timers
                 --disable-video-picogui --disable-video-qtopia --enable-dlopen"
 
 do_configure() {
-	gnu-configize
-	oe_runconf
-	cd ${S}
-	# prevent libtool from linking libs against libstdc++, libgcc, ...
-	cat ${TARGET_PREFIX}libtool | sed -e 's/postdeps=".*"/postdeps=""/' > ${TARGET_PREFIX}libtool.tmp
-	mv ${TARGET_PREFIX}libtool.tmp ${TARGET_PREFIX}libtool
+        gnu-configize
+        oe_runconf
+        cd ${S}
+        # prevent libtool from linking libs against libstdc++, libgcc, ...
+        cat ${TARGET_PREFIX}libtool | sed -e 's/postdeps=".*"/postdeps=""/' > ${TARGET_PREFIX}libtool.tmp
+        mv ${TARGET_PREFIX}libtool.tmp ${TARGET_PREFIX}libtool
 }
 
-do_stage() {
-	autotools_stage_all
-	install -m 0644 build/libSDLmain.a ${STAGING_LIBDIR}
-}
-- 
1.6.3.3



