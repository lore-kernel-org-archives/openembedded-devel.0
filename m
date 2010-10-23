Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fidencio@profusion.mobi>) id 1P9RlZ-0003WV-6n
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 02:15:26 +0200
Received: by gyg13 with SMTP id 13so1137517gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 17:14:39 -0700 (PDT)
Received: by 10.151.109.21 with SMTP id l21mr7227928ybm.361.1287792879049;
	Fri, 22 Oct 2010 17:14:39 -0700 (PDT)
Received: from localhost.localdomain ([201.82.29.28])
	by mx.google.com with ESMTPS id r29sm216413ybn.10.2010.10.22.17.14.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Oct 2010 17:14:38 -0700 (PDT)
From: fidencio@profusion.mobi
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Oct 2010 22:14:05 -0200
Message-Id: <4cc228ee.1d8b970a.4cbb.0974@mx.google.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <y>
References: <y>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fidencio@profusion.mobi
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/4] lightmediascanner: Add *.a/*.la files to -dev package
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
X-List-Received-Date: Sat, 23 Oct 2010 00:15:27 -0000

From: Eduardo Lima (Etrunko) <eblima@gmail.com>

Signed-off-by: Eduardo Lima (Etrunko) <eblima@gmail.com>
---
 recipes/lightmediascanner/lightmediascanner.inc |   17 +++++++++++++----
 1 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/recipes/lightmediascanner/lightmediascanner.inc b/recipes/lightmediascanner/lightmediascanner.inc
index 9ba7a01..95d2299 100644
--- a/recipes/lightmediascanner/lightmediascanner.inc
+++ b/recipes/lightmediascanner/lightmediascanner.inc
@@ -6,14 +6,23 @@ DEPENDS += "sqlite3 libogg libvorbis flac"
 # DEPENDS += "mpeg4ip"
 
 PE = "1"
-RDEPENDS_${PN} += "glibc-gconv-utf-16 \
-             glibc-gconv \
-             "
+RDEPENDS_${PN} += " \
+    glibc-gconv-utf-16 \
+    glibc-gconv \
+"
+
 RPROVIDES_${PN} += "liblightmediascanner"
 
 inherit autotools pkgconfig
 
-FILES_${PN}-dbg += "${libdir}/${PN}/plugins/.debug"
+FILES_${PN}-dbg += " \
+    ${libdir}/${PN}/plugins/.debug \
+"
+
+FILES_${PN}-dev += " \
+    ${libdir}/${PN}/plugins/*.a \
+    ${libdir}/${PN}/plugins/*.la \
+"
 
 do_stage() {
 	autotools_stage_all
-- 
1.7.3.1



