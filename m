Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1Mbc3b-0001KB-4a
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 17:17:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 89BE953A61D;
	Thu, 13 Aug 2009 11:01:03 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13452-06-2; Thu, 13 Aug 2009 11:01:03 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id A6A5053A7B3; Thu, 13 Aug 2009 11:01:01 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 2852B53A287;
	Thu, 13 Aug 2009 11:00:48 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 3600141A97; Thu, 13 Aug 2009 11:00:48 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Aug 2009 11:00:41 -0400
Message-Id: <1250175641-4869-4-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1250175641-4869-3-git-send-email-msmith@cbnco.com>
References: <1250175641-4869-1-git-send-email-msmith@cbnco.com>
	<1250175641-4869-2-git-send-email-msmith@cbnco.com>
	<1250175641-4869-3-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 4/4] openssl.inc: fix packaging on x86_64; use INC_PR
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
X-List-Received-Date: Thu, 13 Aug 2009 15:17:36 -0000

openssl's makefile always installs to ${prefix}/lib, even if
libdir is ${prefix}/lib64. Move some files around to make it fit.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/openssl/openssl-native_0.9.7g.bb |    2 +-
 recipes/openssl/openssl-native_0.9.7m.bb |    2 +-
 recipes/openssl/openssl-native_0.9.8g.bb |    2 +-
 recipes/openssl/openssl-native_0.9.8j.bb |    2 +-
 recipes/openssl/openssl.inc              |   13 +++++++++++--
 recipes/openssl/openssl_0.9.7e.bb        |    2 +-
 recipes/openssl/openssl_0.9.7g.bb        |    2 +-
 recipes/openssl/openssl_0.9.7m.bb        |    2 +-
 recipes/openssl/openssl_0.9.8g.bb        |    2 +-
 recipes/openssl/openssl_0.9.8j.bb        |    2 +-
 10 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/recipes/openssl/openssl-native_0.9.7g.bb b/recipes/openssl/openssl-native_0.9.7g.bb
index dfe3ab5..40558f2 100644
--- a/recipes/openssl/openssl-native_0.9.7g.bb
+++ b/recipes/openssl/openssl-native_0.9.7g.bb
@@ -2,7 +2,7 @@ inherit pkgconfig native
 
 require openssl.inc
 
-PR = "r2"
+PR = "${INC_PR}.0"
 
 SRC_URI += "file://debian.patch;patch=1 \
             file://armeb.patch;patch=1;pnum=0 \
diff --git a/recipes/openssl/openssl-native_0.9.7m.bb b/recipes/openssl/openssl-native_0.9.7m.bb
index 445b6e9..ccae43e 100644
--- a/recipes/openssl/openssl-native_0.9.7m.bb
+++ b/recipes/openssl/openssl-native_0.9.7m.bb
@@ -6,7 +6,7 @@ require openssl.inc
 export FULL_OPTIMIZATION = " "
 export BUILD_OPTIMIZATION = " "
 
-PR = "r2"
+PR = "${INC_PR}.0"
 
 SRC_URI += "file://debian.patch;patch=1 \
             file://armeb.patch;patch=1;pnum=0 \
diff --git a/recipes/openssl/openssl-native_0.9.8g.bb b/recipes/openssl/openssl-native_0.9.8g.bb
index 27f0169..d567ae7 100644
--- a/recipes/openssl/openssl-native_0.9.8g.bb
+++ b/recipes/openssl/openssl-native_0.9.8g.bb
@@ -2,7 +2,7 @@ inherit pkgconfig native
 
 require openssl.inc
 
-PR = "r1"
+PR = "${INC_PR}.0"
 
 # This flag can contain target options (e.g -mfpu=neon for armv7-a systems)
 export FULL_OPTIMIZATION = " "
diff --git a/recipes/openssl/openssl-native_0.9.8j.bb b/recipes/openssl/openssl-native_0.9.8j.bb
index ffbd5ea..976a4d7 100644
--- a/recipes/openssl/openssl-native_0.9.8j.bb
+++ b/recipes/openssl/openssl-native_0.9.8j.bb
@@ -2,7 +2,7 @@ inherit pkgconfig native
 
 require openssl.inc
 
-PR = "r1"
+PR = "${INC_PR}.0"
 
 # This flag can contain target options (e.g -mfpu=neon for armv7-a systems)
 export FULL_OPTIMIZATION = " "
diff --git a/recipes/openssl/openssl.inc b/recipes/openssl/openssl.inc
index e6e345b..fd0756b 100644
--- a/recipes/openssl/openssl.inc
+++ b/recipes/openssl/openssl.inc
@@ -6,6 +6,8 @@ SECTION = "libs/network"
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz"
 S = "${WORKDIR}/openssl-${PV}"
 
+INC_PR = "r10"
+
 AR_append = " r"
 CFLAG = "${@base_conditional('SITEINFO_ENDIANESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
 	-DTERMIO ${FULL_OPTIMIZATION} -Wall"
@@ -91,9 +93,16 @@ do_stage () {
 }
 
 do_install () {
-	install -m 0755 -d ${D}${libdir}/pkgconfig
 	oe_runmake INSTALL_PREFIX="${D}" install
-	chmod 644 ${D}${libdir}/pkgconfig/openssl.pc
+
+	# On x86_64, move lib/* to lib64
+	if [ "${libdir}" != "${prefix}/lib" ]
+	then
+		install -d ${D}${libdir} ${D}${libdir}/pkgconfig
+		mv ${D}${prefix}/lib/lib* ${D}${libdir}
+		mv ${D}${prefix}/lib/pkgconfig/*.pc ${D}${libdir}/pkgconfig
+	fi
+
 	oe_libinstall -so libcrypto ${D}${libdir}
 	oe_libinstall -so libssl ${D}${libdir}
 }
diff --git a/recipes/openssl/openssl_0.9.7e.bb b/recipes/openssl/openssl_0.9.7e.bb
index cda364a..b821076 100644
--- a/recipes/openssl/openssl_0.9.7e.bb
+++ b/recipes/openssl/openssl_0.9.7e.bb
@@ -1,6 +1,6 @@
 require openssl.inc
 
-PR = "r6"
+PR = "${INC_PR}.0"
 
 SRC_URI += "file://debian.patch;patch=1 \
             file://armeb.patch;patch=1 \
diff --git a/recipes/openssl/openssl_0.9.7g.bb b/recipes/openssl/openssl_0.9.7g.bb
index fbd2af2..68a2614 100644
--- a/recipes/openssl/openssl_0.9.7g.bb
+++ b/recipes/openssl/openssl_0.9.7g.bb
@@ -2,7 +2,7 @@ inherit pkgconfig
 
 require openssl.inc
 
-PR = "r7"
+PR = "${INC_PR}.0"
 
 SRC_URI += "file://debian.patch;patch=1 \
             file://armeb.patch;patch=1;pnum=0 \
diff --git a/recipes/openssl/openssl_0.9.7m.bb b/recipes/openssl/openssl_0.9.7m.bb
index fbd2af2..68a2614 100644
--- a/recipes/openssl/openssl_0.9.7m.bb
+++ b/recipes/openssl/openssl_0.9.7m.bb
@@ -2,7 +2,7 @@ inherit pkgconfig
 
 require openssl.inc
 
-PR = "r7"
+PR = "${INC_PR}.0"
 
 SRC_URI += "file://debian.patch;patch=1 \
             file://armeb.patch;patch=1;pnum=0 \
diff --git a/recipes/openssl/openssl_0.9.8g.bb b/recipes/openssl/openssl_0.9.8g.bb
index 1cb360f..d76e756 100644
--- a/recipes/openssl/openssl_0.9.8g.bb
+++ b/recipes/openssl/openssl_0.9.8g.bb
@@ -2,7 +2,7 @@ inherit pkgconfig
 
 require openssl.inc
 
-PR = "r9"
+PR = "${INC_PR}.0"
 
 SRC_URI += "file://debian.patch;patch=1 \
             file://configure-targets.patch;patch=1 \
diff --git a/recipes/openssl/openssl_0.9.8j.bb b/recipes/openssl/openssl_0.9.8j.bb
index 21450d2..bb9694f 100644
--- a/recipes/openssl/openssl_0.9.8j.bb
+++ b/recipes/openssl/openssl_0.9.8j.bb
@@ -2,7 +2,7 @@ inherit pkgconfig
 
 require openssl.inc
 
-PR = "r2"
+PR = "${INC_PR}.0"
 
 export OE_LDFLAGS="${LDFLAGS}"
 
-- 
1.6.3



