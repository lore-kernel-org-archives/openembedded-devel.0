Return-Path: <clopez@igalia.com>
X-Greylist: delayed 602 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 15 Jul 2016 17:23:06 UTC
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 1AE8F606D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 17:23:06 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2DrAgCHGIlX/5tjdVtcKgGDE1Y1R7Zlgg+BexIIhzE4FAEBAQEBAQFlJ4YrgQKINAGhXp45hiqJWYRyHQWOCIsZhhOISAKCN4x8kBseNoE6DHiBN2yGUwEBAQ
X-IPAS-Result: A2DrAgCHGIlX/5tjdVtcKgGDE1Y1R7Zlgg+BexIIhzE4FAEBAQEBAQFlJ4YrgQKINAGhXp45hiqJWYRyHQWOCIsZhhOISAKCN4x8kBseNoE6DHiBN2yGUwEBAQ
X-IronPort-AV: E=Sophos;i="5.28,368,1464645600"; d="scan'208";a="151881795"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 15 Jul 2016 19:13:03 +0200
Received: from 1.14.117.91.dynamic.reverse-mundo-r.com ([91.117.14.1]
	helo=trinity.local.igalia.com) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim) id 1bO6ff-0003nd-Js
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 19:13:03 +0200
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jul 2016 19:12:54 +0200
Message-Id: <1468602774-12745-1-git-send-email-clopez@igalia.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-browser][PATCH] chromium: install all pak files plus resources and blob.bin files.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jul 2016 17:23:07 -0000

 * This files contain localized strings and other resources that are
   needed for support of internationalization and localization.

 * Files under the resources directory are needed for the web inspector.

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 recipes-browser/chromium/chromium.inc | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
index e5deac1..0e7250e 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -52,20 +52,32 @@ do_install() {
 	if [ -f "${WORKDIR}/google-chrome.desktop" ]; then
 		install -Dm 0644 ${WORKDIR}/google-chrome.desktop ${D}${datadir}/applications/google-chrome.desktop
 	fi
-	#Chromium plugins libs
+	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/product_logo_48.png" ]; then
+		install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/product_logo_48.png ${D}${bindir}/${BPN}/product_logo_48.png
+	fi
+
+	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/natives_blob.bin" ]; then
+		install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/natives_blob.bin ${D}${bindir}/${BPN}/natives_blob.bin
+	fi
+	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/snapshot_blob.bin" ]; then
+		install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/snapshot_blob.bin ${D}${bindir}/${BPN}/snapshot_blob.bin
+	fi
+
+	# Chromium plugins libs
 	for f in libpdf.so libosmesa.so libffmpegsumo.so; do
 		if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/$f" ]; then
 			install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/$f ${D}${libdir}/${BPN}/$f
 		fi
 	done
 
-	# Chromium *.pak files and CEF pak files (prefixed with cef_)
-	for f in content_resources.pak keyboard_resources.pak chrome_100_percent.pak product_logo_48.png resources.pak \
-	         cef_100_percent.pak cef_200_percent.pak cef_resources.pak cef.pak \
-		 locales/en-US.pak; do
-		if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/$f" ]; then
-			install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/$f ${D}${bindir}/${BPN}/$f
-		fi
+	# Chromium *.pak files and CEF pak files ( prefixed with cef_ )
+	for f in $(cd ${B}/out/${CHROMIUM_BUILD_TYPE}/ && find . -type f -name \*.pak); do
+			install -Dm 0644 "${B}/out/${CHROMIUM_BUILD_TYPE}/${f}" "${D}${bindir}/${BPN}/${f}"
+	done
+
+	# Chromium resource files (for the inspector).
+	for f in $(cd ${B}/out/${CHROMIUM_BUILD_TYPE}/ && test -d resources && find resources -type f); do
+			install -Dm 0644 "${B}/out/${CHROMIUM_BUILD_TYPE}/${f}" "${D}${bindir}/${BPN}/${f}"
 	done
 
 }
-- 
2.1.4


