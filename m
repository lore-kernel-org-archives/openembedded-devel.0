Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0CE52727E8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 04:10:02 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so81244476igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 21:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YC8XoEUmdu7iHalHeNvN9e00ARObIWAeUNzEtSXy9hc=;
	b=B8NoOPiW8UKgYThYa7BTrMNG45lDxHS8sw6rL7meppcLijXsdIQCFvPZM3lVad+cBB
	GPaqR07nA1/A8pMIr8gqkulvlCjKqQrVGL8ELjQFXBr+WIZJU3dh9HA1oj7q1v6tC3U9
	YG1SenJ1qoDCz/GPQZhc8XiNamFGuX8sRBTULNG+QERTygyLyxQ/Xoq1fg4NCPtHkxCG
	ElXbhtiAplKVgB62w6MAceC5b4dPW7ETHflrCAgBEKo8MXmcNoGnmEsLBDRtEI4ZMXvg
	tgLKqqa7c5YdQGJm4pE3sQm8aY5zyf97AuAAjZ+aY+8Nql3aFlC/5DL3ja5q4RImxmAV
	jvww==
X-Received: by 10.50.35.195 with SMTP id k3mr17803473igj.11.1430194203313;
	Mon, 27 Apr 2015 21:10:03 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id w2sm6521727igl.22.2015.04.27.21.10.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Apr 2015 21:10:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Apr 2015 04:09:55 +0000
Message-Id: <1430194195-1325-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1430194195-1325-1-git-send-email-raj.khem@gmail.com>
References: <1430194195-1325-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-browser][PATCH 3/3] chromium, cef: Package codecs separately
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Apr 2015 04:10:02 -0000

chromium does not use versioned shared objects so deal with it
Remove the band-aid to pretend to have versioning shared objects
put the ffmpeg plugins in directory of its own in /usr/lib to
avoid namespace conflict with same .so coming from other codec packages

Change-Id: Ia9dceaa84844086fe8918246eb864d91ab4ec6aa
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-browser/chromium/chromium.inc | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
index 655cf65..9c34a68 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -46,14 +46,17 @@ do_install() {
 		install -m 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/icudtl.dat ${D}${bindir}
 	fi
 	install -d ${D}${libdir}
-        if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/libcef.so" ]; then
+        if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/lib/libcef.so" ]; then
 		install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/lib/libcef.so ${D}${libdir}
         fi
+	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/libpdf.so" ]; then
+		install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/libpdf.so ${D}${libdir}/chrome/libpdf.so
+	fi
 	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/libosmesa.so" ]; then
-		install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/libosmesa.so ${D}${libdir}
+		install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/libosmesa.so ${D}${libdir}/chrome/libosmesa.so
 	fi
 	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/libffmpegsumo.so" ]; then
-		install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/libffmpegsumo.so ${D}${libdir}
+		install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/libffmpegsumo.so ${D}${libdir}/chrome/libffmpegsumo.so
 	fi
 	install -d ${D}${bindir}/chrome
 	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/chrome" ]; then
@@ -95,22 +98,12 @@ do_install() {
 	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/chrome_sandbox" ]; then
 		install -m 4755 ${B}/out/${CHROMIUM_BUILD_TYPE}/chrome_sandbox ${D}${sbindir}/chrome-devel-sandbox
 	fi
-
-	# take care of yocto-way libraries naming (versions)
-	cd ${D}${libdir}
-	for library in $(find -type f -name '*.so'); do
-		startDir="$(pwd)"
-		cd "$(dirname "$library")"
-		rm -f "$library.0.0.1"
-		mv "$library" "$library.0.0.1"
-		ln -sf "$library.0.0.1" "$library.0.0"
-		ln -sf "$library.0.0" "$library.0"
-		ln -sf "$library.0" "$library"
-		cd "$startDir"
-	done
-
 }
 
+PACKAGES =+ "${PN}-codecs-ffmpeg ${PN}-plugin-pdf"
+
+FILES_${PN}-codecs-ffmpeg = "${libdir}/chrome/libffmpegsumo.so"
+FILES_${PN}-plugin-pdf = "${libdir}/chrome/libpdf.so"
 
 FILES_${PN} = "${bindir}/chrome/ ${bindir}/google-chrome ${datadir}/applications ${sbindir}/ ${libdir}/chrome/"
 FILES_${PN}-dbg += "${bindir}/chrome/.debug/ ${libdir}/chrome/.debug/"
@@ -118,11 +111,10 @@ FILES_${PN}-dbg += "${bindir}/chrome/.debug/ ${libdir}/chrome/.debug/"
 PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
 
 INSANE_SKIP_${PN} = "ldflags"
+SOLIBS = ".so"
 FILES_SOLIBSDEV = ""
 FILES_${PN} += "${bindir} ${bindir}/chrome/ ${libdir}"
 FILES_${PN} += "${bindir}/chrome/*.pak"
 FILES_${PN} += "${bindir}/chrome/locales/*.pak"
 FILES_${PN}-dbg += "${bindir}/chrome/.debug/ ${libdir}/.debug/"
 
-
-
-- 
2.1.4


