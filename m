Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 18E3D73F88
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 May 2015 02:27:50 +0000 (UTC)
Received: by iecnq11 with SMTP id nq11so54038361iec.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 May 2015 19:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3eOHp4qxUu/XapPJ9/OG2W98ldWbok8bQpDW7Ylq93s=;
	b=dhlu3bb0oBy5YEtxtJz6mtBOLSt/ihnKiQREQJTRcYcaFE/YARJbikXH+OvDBsXE1I
	CemfvfPJRjdN/0TERykKUEowxn0pWtHQCSWT+dzWcLHO2kPfLYzoJXzwW/OP8aiteGfw
	ydHlsR4ldrxOy/l7kIGZ8ERDAKz0exOKrERBR8PxSIpv/1Y1IP/bqx2KKFsy7w9rg9d/
	eITeXnan7PkBy1ru37usPxBm8YXOo6jpbrKs4oOAaU/ZCLf0cG1VLz53E4nZd2ES3UzF
	e46CBbUwl1ZdPJxGs3bbzoUYn+b2cVMwVXK8AgFbSHjv6ud7mMl9KqrFzCJJ8NiqAL8e
	ABjg==
X-Received: by 10.42.103.196 with SMTP id n4mr1751027ico.31.1431052071594;
	Thu, 07 May 2015 19:27:51 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id b2sm2870894igf.10.2015.05.07.19.27.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 May 2015 19:27:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 May 2015 19:27:45 -0700
Message-Id: <1431052065-17113-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-browser][PATCH] chromium/cef: Fix chromium installation regressions
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
X-List-Received-Date: Fri, 08 May 2015 02:27:52 -0000

CEF rework caused few problems where we missed packaging needed resource
files and misplaced some icu data files

Use loops to install similar files

Tested on x86 emulator making sure google-chrome starts up
properly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-browser/chromium/chromium.inc | 86 ++++++++++++-----------------------
 1 file changed, 28 insertions(+), 58 deletions(-)

diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
index 9c34a68..a9e9b8a 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -31,73 +31,43 @@ do_configure() {
 }
 
 do_install() {
-	install -d ${D}${bindir}
-	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/cefsimple" ]; then
-		install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/cefsimple ${D}${bindir}
-	fi
 	if [ -f "${WORKDIR}/google-chrome" ]; then
-		install -m 0755 ${WORKDIR}/google-chrome ${D}${bindir}/
-	fi
-	install -d ${D}${datadir}/applications
-	if [ -f "${WORKDIR}/google-chrome.desktop" ]; then
-		install -m 0644 ${WORKDIR}/google-chrome.desktop ${D}${datadir}/applications/
-	fi
-	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/icudtl.dat" ]; then
-		install -m 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/icudtl.dat ${D}${bindir}
+		install -Dm 0755 ${WORKDIR}/google-chrome ${D}${bindir}/google-chrome
 	fi
-	install -d ${D}${libdir}
-        if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/lib/libcef.so" ]; then
-		install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/lib/libcef.so ${D}${libdir}
-        fi
-	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/libpdf.so" ]; then
-		install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/libpdf.so ${D}${libdir}/chrome/libpdf.so
+	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/chrome_sandbox" ]; then
+		install -Dm 4755 ${B}/out/${CHROMIUM_BUILD_TYPE}/chrome_sandbox ${D}${sbindir}/chrome-devel-sandbox
 	fi
-	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/libosmesa.so" ]; then
-		install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/libosmesa.so ${D}${libdir}/chrome/libosmesa.so
+	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/cefsimple" ]; then
+		install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/cefsimple ${D}${bindir}/cefsimple
 	fi
-	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/libffmpegsumo.so" ]; then
-		install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/libffmpegsumo.so ${D}${libdir}/chrome/libffmpegsumo.so
+	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/lib/libcef.so" ]; then
+		install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/lib/libcef.so ${D}${bindir}/lib/libcef.so
 	fi
-	install -d ${D}${bindir}/chrome
 	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/chrome" ]; then
-		install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/chrome ${D}${bindir}/chrome/chrome
-	fi
-	#Chromium *.pak files
-
-	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/content_resources.pak" ]; then
-		install -m 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/content_resources.pak ${D}${bindir}/chrome
-	fi
-	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/keyboard_resources.pak" ]; then
-		install -m 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/keyboard_resources.pak ${D}${bindir}/chrome
+		install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/chrome ${D}${bindir}/chrome/chrome
 	fi
-	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/chrome_100_percent.pak" ]; then
-		install -m 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/chrome_100_percent.pak ${D}${bindir}/chrome
-	fi
-	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/product_logo_48.png" ]; then
-		install -m 0644 ${S}/out/${CHROMIUM_BUILD_TYPE}/product_logo_48.png ${D}${bindir}/chrome/
-    	fi
-
-    	# CEF *.pak files
-
-	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/cef_100_percent.pak" ]; then
-		install -m 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/cef_100_percent.pak ${D}${bindir}/chrome
-	fi
-	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/cef_200_percent.pak" ]; then
-		install -m 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/cef_200_percent.pak ${D}${bindir}/chrome
-	fi
-	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/cef_resources.pak" ]; then
-		install -m 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/cef_resources.pak ${D}${bindir}/chrome
-	fi
-	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/cef.pak" ]; then
-		install -m 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/cef.pak ${D}${bindir}/chrome
+	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/icudtl.dat" ]; then
+		install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/icudtl.dat ${D}${bindir}/chrome/icudtl.dat
 	fi
-	install -d ${D}${bindir}/chrome/locales
-	install -m 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/locales/en-US.pak ${D}${bindir}/chrome/locales
+	if [ -f "${WORKDIR}/google-chrome.desktop" ]; then
+		install -Dm 0644 ${WORKDIR}/google-chrome.desktop ${D}${datadir}/applications/google-chrome.desktop
+	fi
+	#Chromium plugins libs
+	for f in libpdf.so libosmesa.so libffmpegsumo.so; do
+		if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/$f" ]; then
+			install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/$f ${D}${libdir}/chrome/$f
+		fi
+	done
+
+	#Chromium *.pak files and CEF pak files ( prefixed with cef_
+	for f in content_resources.pak keyboard_resources.pak chrome_100_percent.pak product_logo_48.png resources.pak \
+	         cef_100_percent.pak cef_200_percent.pak cef_resources.pak cef.pak \
+		 locales/en-US.pak; do
+		if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/$f" ]; then
+			install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/$f ${D}${bindir}/chrome/$f
+		fi
+	done
 
-	install -d ${D}${sbindir}
-	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/chrome_sandbox" ]; then
-		install -m 4755 ${B}/out/${CHROMIUM_BUILD_TYPE}/chrome_sandbox ${D}${sbindir}/chrome-devel-sandbox
-	fi
 }
 
 PACKAGES =+ "${PN}-codecs-ffmpeg ${PN}-plugin-pdf"
-- 
2.1.4


