Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1U0Cs7-00064C-HM
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jan 2013 16:13:18 +0100
Received: by mail-ee0-f43.google.com with SMTP id c50so284766eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2013 06:57:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=mq99nzpP76lR103xWngQtqnslOBHoQpxfKBsEwenjDc=;
	b=pIaMQodMSiuG4d+460nTwgt53n3hKrZlD7g1mn77rba8GphNHp04Tft6pKgyfGOwFv
	CP29NJP2fUxREk434Htt1KZ7IcqcSZz6akUAjkRgOBUbkq3xH3PpmU0bSVSRvWxRcTFs
	Cm3eXZLszs2lD5sj/HptWXGSkMWbJlb+Gq0UsdE6CR7XqX9gsZ/Oure0ROeen4Z0m1kq
	TZmQg/HdBXgppqQ2i5/PhEyRKqiAOr8dSmCbmDNi6xWh7jh1a9E7Uf5PieMwWrd+t+79
	7XPv4RUpK2uNaJ2uPEqzTMDR9Rf169w+mZ+IS8TIotkqSy4t4t5/nN81z7iZWICI3Ba1
	LPOw==
X-Received: by 10.14.173.65 with SMTP id u41mr4128617eel.13.1359471455591;
	Tue, 29 Jan 2013 06:57:35 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id t44sm20619227eeo.2.2013.01.29.06.57.33
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 06:57:34 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jan 2013 15:57:23 +0100
Message-Id: <1359471443-8946-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
X-Gm-Message-State: ALoCoQlJ7mLWUyRNHmoivgJPYYS4TBoBed7V4WQenfyS3GJCycSTDB+jzqr53qITw9dUzc3UJSiq
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] fbida: update to 2.09
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
X-List-Received-Date: Tue, 29 Jan 2013 15:13:22 -0000

Build from git to drag in buildfixes and run set to fix a non-cross compile safe use of cpp

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-graphics/fbida/fbida_2.08.bb | 26 --------------------------
 meta-oe/recipes-graphics/fbida/fbida_2.09.bb | 27 +++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 26 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/fbida/fbida_2.08.bb
 create mode 100644 meta-oe/recipes-graphics/fbida/fbida_2.09.bb

diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.08.bb b/meta-oe/recipes-graphics/fbida/fbida_2.08.bb
deleted file mode 100644
index 4b8ddad..0000000
--- a/meta-oe/recipes-graphics/fbida/fbida_2.08.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-HOMEPAGE = "http://linux.bytesex.org/fbida/"
-DESCRIPTION = "frame buffer image and doc viewer tools"
-AUTHOR = "Gerd Hoffmann"
-SECTION = "utils"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
-
-DEPENDS = "virtual/libiconv libpng jpeg fontconfig freetype libexif"
-
-SRC_URI = "http://dl.bytesex.org/releases/fbida/fbida-${PV}.tar.gz"
-SRC_URI[md5sum] = "9b3693ab26a58194e36b479bffb61ed0"
-SRC_URI[sha256sum] = "298e7f3545e33596a5876f6b9c3da7ef475c2692e5fab0df824fbcd7a489cd80"
-
-EXTRA_OEMAKE = "STRIP="
-
-do_compile() {
-	oe_runmake
-}
-
-do_install() {
-	oe_runmake 'DESTDIR=${D}' install
-}
-
-RDEPENDS_${PN} = "ttf-dejavu-sans-mono"
-
diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.09.bb b/meta-oe/recipes-graphics/fbida/fbida_2.09.bb
new file mode 100644
index 0000000..455fd8a
--- /dev/null
+++ b/meta-oe/recipes-graphics/fbida/fbida_2.09.bb
@@ -0,0 +1,27 @@
+HOMEPAGE = "http://linux.bytesex.org/fbida/"
+DESCRIPTION = "frame buffer image and doc viewer tools"
+AUTHOR = "Gerd Hoffmann"
+SECTION = "utils"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+
+DEPENDS = "virtual/libiconv libpng jpeg fontconfig freetype libexif"
+
+SRC_URI = "git://git.kraxel.org/fbida"
+SRCREV = "cb0ce5fa5f42bfaea4f8f326bcd8914dd14e782d"
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "STRIP="
+
+do_compile() {
+	sed -i -e 's: cpp: ${TARGET_PREFIX}cpp:g' GNUmakefile
+	oe_runmake
+}
+
+do_install() {
+	oe_runmake 'DESTDIR=${D}' install
+}
+
+RDEPENDS_${PN} = "ttf-dejavu-sans-mono"
+
-- 
1.8.1



