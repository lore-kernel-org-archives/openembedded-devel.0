Received: from mail.kernelconcepts.de ([212.60.202.196])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <fuchs@case>)
	id 1QHHpS-0003K3-UV for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 17:48:03 +0200
Received: from [192.168.2.131] (helo=case)
	by mail.kernelconcepts.de with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <fuchs@case>)
	id 1QHI2v-0001H4-Fs; Tue, 03 May 2011 18:01:57 +0200
Received: from fuchs by case with local (Exim 4.71)
	(envelope-from <fuchs@case.kc.loc>)
	id 1QHHmy-000337-Lo; Tue, 03 May 2011 17:45:28 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 May 2011 17:45:23 +0200
Message-Id: <1304437523-11692-1-git-send-email-florian.boor@kernelconcepts.de>
X-Mailer: git-send-email 1.7.0.4
Cc: Florian Boor <florian@kernelconcepts.de>
Subject: [PATCH] libtool-sdk: postprocess libtoolize and install additional files.
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
X-List-Received-Date: Tue, 03 May 2011 15:48:03 -0000

From: Florian Boor <florian@kernelconcepts.de>

Install some additional files that might be missed by autotools.
Libtoolize has a path to build directory inside we can get rid of by postprocessing.

Signed-off-by: Florian Boor <florian@kernelconcepts.de>
---
 recipes/libtool/libtool-sdk_2.2.6b.bb |   15 ++++++++++++---
 1 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/recipes/libtool/libtool-sdk_2.2.6b.bb b/recipes/libtool/libtool-sdk_2.2.6b.bb
index ff87873..b8c1e04 100644
--- a/recipes/libtool/libtool-sdk_2.2.6b.bb
+++ b/recipes/libtool/libtool-sdk_2.2.6b.bb
@@ -1,10 +1,14 @@
 require libtool_${PV}.bb
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.4"
 SRC_URI_append = " file://cross_compile.patch"
 
 inherit sdk
 
+do_compile_append () {
+	sed -i 's:${STAGING_BINDIR_NATIVE}/::g' libtoolize
+}
+
 do_install () {
 	install -d ${D}${bindir}/
 	install -m 0755 libtool ${D}${bindir}/
@@ -18,8 +22,13 @@ do_install () {
 	install -m 0644 libltdl/ltdl.h ${D}${includedir}
 
 	install -d ${D}${datadir}/libtool/config/
-	install -c ${S}/libltdl/config/config.guess ${D}${datadir}/libtool/
-	install -c ${S}/libltdl/config/config.sub ${D}${datadir}/libtool/
+	install -c ${S}/libltdl/config/config.guess ${D}${datadir}/libtool/config/
+	install -c ${S}/libltdl/config/config.sub ${D}${datadir}/libtool/config/
+	install -c ${S}/libltdl/config/install-sh ${D}${datadir}/libtool/config/
+	install -c ${S}/libltdl/config/compile ${D}${datadir}/libtool/config/
+	install -c ${S}/libltdl/config/depcomp ${D}${datadir}/libtool/config/
+	install -c ${S}/libltdl/config/missing ${D}${datadir}/libtool/config/
+	install -c ${S}/libltdl/config/mkstamp ${D}${datadir}/libtool/config/
 	install -c -m 0644 ${S}/libltdl/config/ltmain.sh ${D}${datadir}/libtool/config/
 
 	install -d ${D}${datadir}/aclocal/
-- 
1.7.0.4



