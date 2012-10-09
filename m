Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TLXvl-0004lB-FC
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 13:24:57 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 17D41D22BB;
	Tue,  9 Oct 2012 13:11:54 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Oct 2012 13:11:35 +0200
Message-Id: <1349781099-25754-10-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1349781099-25754-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1349769155-12643-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1349781099-25754-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [meta-oe][PATCH 10/14] ttf-ubuntu-font-family: added license stuff and updated to 0.80 version
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
X-List-Received-Date: Tue, 09 Oct 2012 11:24:57 -0000

Dropped Serif handling code - there is no Ubuntu Serif.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../ttf-fonts/ttf-ubuntu-font-family_0.69.bb       |   18 ------------------
 .../ttf-fonts/ttf-ubuntu-font-family_0.80.bb       |   20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 18 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.69.bb
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.69.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.69.bb
deleted file mode 100644
index 22a7aec..0000000
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.69.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require ttf.inc
-
-DESCRIPTION = "Ubuntu Font Family - TTF Version"
-HOMEPAGE = "http://font.ubuntu.com"
-LICENSE = "UFL"
-PR = "r2"
-
-SRC_URI = "http://font.ubuntu.com/download/ubuntu-font-family-${PV}+ufl.zip"
-SRC_URI[md5sum] = "2c3287ea72f81ce025095f7a6d68af28"
-SRC_URI[sha256sum] = "23206a306d92ec57404ab3bc75610b6d8cfed0b8ddcfbe51b99fb48519a4855b"
-S = "${WORKDIR}/ubuntu-font-family-0.69+ufl"
-
-PACKAGES = "${PN}-dbg ttf-ubuntu-mono ttf-ubuntu-sans ttf-ubuntu-serif"
-RRECOMMENDS_${PN}-dbg = ""
-
-FILES_ttf-ubuntu-mono  = "${datadir}/fonts/truetype/*Mono*"
-FILES_ttf-ubuntu-sans  = "${datadir}/fonts/truetype/Ubuntu-*"
-FILES_ttf-ubuntu-serif = "${datadir}/fonts/truetype/*Serif*"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb
new file mode 100644
index 0000000..08d79a1
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb
@@ -0,0 +1,20 @@
+require ttf.inc
+
+DESCRIPTION = "Ubuntu Font Family - TTF Version"
+HOMEPAGE = "http://font.ubuntu.com"
+LICENSE = "UFL"
+LIC_FILES_CHKSUM = "file://LICENCE.txt;md5=325a1a9029112a2405e743c7f816427b"
+PR = "r0"
+
+SRC_URI = "http://font.ubuntu.com/download/ubuntu-font-family-${PV}.zip"
+
+SRC_URI[md5sum] = "a1fc70f5a5b1d096ab8310886cddaa1c"
+SRC_URI[sha256sum] = "107170099bbc3beae8602b97a5c423525d363106c3c24f787d43e09811298e4c"
+
+S = "${WORKDIR}/ubuntu-font-family-${PV}"
+
+PACKAGES = "${PN}-dbg ttf-ubuntu-mono ttf-ubuntu-sans"
+RRECOMMENDS_${PN}-dbg = ""
+
+FILES_ttf-ubuntu-mono  = "${datadir}/fonts/truetype/*Mono*"
+FILES_ttf-ubuntu-sans  = "${datadir}/fonts/truetype/Ubuntu-*"
-- 
1.7.10.4



