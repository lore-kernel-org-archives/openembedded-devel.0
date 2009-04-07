Received: from [206.46.173.11] (helo=vms173011pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LrKiX-0001rD-UI
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 01:29:12 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KHR00F6L7PK3815@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	07 Apr 2009 18:25:02 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C56926B83B5; Tue,
	07 Apr 2009 19:24:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 07 Apr 2009 19:24:55 -0400
Message-id: <1239146695-28599-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.0.6
In-reply-to: <20090407222717.GK2195@smtp.west.cox.net>
References: <20090407222717.GK2195@smtp.west.cox.net>
X-SA-Exim-Connect-IP: 206.46.173.11
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,BAYES_00,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] curl: move PACKAGES and FILES_* from the .inc file
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
X-List-Received-Date: Tue, 07 Apr 2009 23:29:29 -0000

this resolves the lockfile() trying to access the wrong directory
when building sdk version after target one was built

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 recipes/curl/{curl.inc => curl-common.inc} |   23 -----------------------
 recipes/curl/curl-native_7.18.2.bb         |    4 ++--
 recipes/curl/curl-sdk_7.18.2.bb            |    4 ++--
 recipes/curl/curl-target.inc               |   22 ++++++++++++++++++++++
 recipes/curl/curl_7.18.2.bb                |    4 +++-
 recipes/curl/curl_7.19.0.bb                |    6 +++---
 6 files changed, 32 insertions(+), 31 deletions(-)
 rename recipes/curl/{curl.inc => curl-common.inc} (73%)
 create mode 100644 recipes/curl/curl-target.inc

diff --git a/recipes/curl/curl.inc b/recipes/curl/curl-common.inc
similarity index 73%
rename from recipes/curl/curl.inc
rename to recipes/curl/curl-common.inc
index d3edaef..ce4f5f2 100644
--- a/recipes/curl/curl.inc
+++ b/recipes/curl/curl-common.inc
@@ -55,26 +55,3 @@ do_stage () {
 	install -m 0644 ${S}/include/curl/*.h ${STAGING_INCDIR}/curl/
 	oe_libinstall -so -a -C lib libcurl ${STAGING_LIBDIR}
 }
-
-PACKAGES += "${PN}-certs libcurl libcurl-dev libcurl-doc"
-
-FILES_${PN} = "${bindir}/curl"
-
-FILES_${PN}-certs = "${datadir}/curl/curl-*"
-PACKAGE_ARCH_${PN}-certs = "all"
-
-FILES_${PN}-doc = "${mandir}/man1/curl.1"
-
-FILES_lib${PN} = "${libdir}/lib*.so.*"
-RRECOMMENDS_lib${PN} += "${PN}-certs"
-FILES_lib${PN}-dev = "${includedir} \
-                      ${libdir}/lib*.so \
-                      ${libdir}/lib*.a \
-                      ${libdir}/lib*.la \
-                      ${libdir}/pkgconfig \
-                      ${datadir}/aclocal \
-                      ${bindir}/*-config"
-
-FILES_lib${PN}-doc = "${mandir}/man3 \
-                      ${mandir}/man1/curl-config.1"
-
diff --git a/recipes/curl/curl-native_7.18.2.bb b/recipes/curl/curl-native_7.18.2.bb
index f0e2b89..c95591b 100644
--- a/recipes/curl/curl-native_7.18.2.bb
+++ b/recipes/curl/curl-native_7.18.2.bb
@@ -1,6 +1,7 @@
-require curl_${PV}.bb
+require curl-common.inc
 inherit native
 DEPENDS = "zlib-native"
+PR = "r1"
 
 do_stage () {
 	autotools_stage_all
@@ -9,4 +10,3 @@ do_stage () {
 do_install() {
 	:
 }
-
diff --git a/recipes/curl/curl-sdk_7.18.2.bb b/recipes/curl/curl-sdk_7.18.2.bb
index 816fe64..35b0d88 100644
--- a/recipes/curl/curl-sdk_7.18.2.bb
+++ b/recipes/curl/curl-sdk_7.18.2.bb
@@ -1,6 +1,7 @@
-require curl_${PV}.bb
+require curl-common.inc
 inherit sdk
 DEPENDS = "zlib-sdk"
+PR = "r1"
 
 do_stage () {
         install -d ${STAGING_INCDIR}/curl
@@ -11,4 +12,3 @@ do_stage () {
 do_install() {
 	:
 }
-
diff --git a/recipes/curl/curl-target.inc b/recipes/curl/curl-target.inc
new file mode 100644
index 0000000..88877e5
--- /dev/null
+++ b/recipes/curl/curl-target.inc
@@ -0,0 +1,22 @@
+PACKAGES += "${PN}-certs libcurl libcurl-dev libcurl-doc"
+
+FILES_${PN} = "${bindir}/curl"
+
+FILES_${PN}-certs = "${datadir}/curl/curl-*"
+PACKAGE_ARCH_${PN}-certs = "all"
+
+FILES_${PN}-doc = "${mandir}/man1/curl.1"
+
+FILES_lib${PN} = "${libdir}/lib*.so.*"
+RRECOMMENDS_lib${PN} += "${PN}-certs"
+FILES_lib${PN}-dev = "${includedir} \
+                      ${libdir}/lib*.so \
+                      ${libdir}/lib*.a \
+                      ${libdir}/lib*.la \
+                      ${libdir}/pkgconfig \
+                      ${datadir}/aclocal \
+                      ${bindir}/*-config"
+
+FILES_lib${PN}-doc = "${mandir}/man3 \
+                      ${mandir}/man1/curl-config.1"
+
diff --git a/recipes/curl/curl_7.18.2.bb b/recipes/curl/curl_7.18.2.bb
index 2c3ec41..3de6da4 100644
--- a/recipes/curl/curl_7.18.2.bb
+++ b/recipes/curl/curl_7.18.2.bb
@@ -1,2 +1,4 @@
-require curl.inc
+require curl-common.inc
+require curl-target.inc
 
+PR = "r1"
diff --git a/recipes/curl/curl_7.19.0.bb b/recipes/curl/curl_7.19.0.bb
index a99a68b..1944efe 100644
--- a/recipes/curl/curl_7.19.0.bb
+++ b/recipes/curl/curl_7.19.0.bb
@@ -1,5 +1,5 @@
-require curl.inc
+require curl-common.inc
+require curl-target.inc
 
 SRC_URI += "file://off_t_abi_fix.patch;patch=1;pnum=0"
-PR = "r1"
-
+PR = "r2"
-- 
1.6.0.6



