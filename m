Return-Path: <ts@ferncast.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F29C19F2E
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 15:12:20 +0000 (UTC)
Received: from smtprelay05.ispgateway.de (smtprelay05.ispgateway.de [80.67.31.94])
 by mx.groups.io with SMTP id smtpd.web10.12888.1740669135217369630
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Feb 2025 07:12:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: ferncast.de, ip: 80.67.31.94, mailfrom: ts@ferncast.de)
Received: from [81.173.161.10] (helo=ferncast-thomas.fritz.box)
	by smtprelay05.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <ts@ferncast.de>)
	id 1tnfYN-000000003i4-1ZmZ;
	Thu, 27 Feb 2025 16:11:59 +0100
From: Thomas Schlien <ts@ferncast.de>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Schlien <ts@ferncast.de>
Subject: [meta-oe][PATCH] ttf-liberation: Upgrade 0.2 -> 2.1.5
Date: Thu, 27 Feb 2025 16:11:07 +0100
Message-ID: <20250227151107.2890370-2-ts@ferncast.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Df-Sender: dHNAZmVybmNhc3QuZGU=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 15:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115691

The liberation font release 0.2 is not available for download
anymore and was released in 2007, so let's do an update.

Since 2007 also the license has changed to a better suited
SIL Open Font License. In addition, the ttf is now build from
source like, e.g., in ttf-lohit.

Signed-off-by: Thomas Schlien <ts@ferncast.de>
---
 .../ttf-fonts/ttf-liberation_0.2.bb           | 21 ---------------
 .../ttf-fonts/ttf-liberation_2.1.5.bb         | 27 +++++++++++++++++++
 2 files changed, 27 insertions(+), 21 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
deleted file mode 100644
index 188064c37c..0000000000
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require ttf.inc
-
-SUMMARY = "Liberation fonts - TTF Version"
-HOMEPAGE = "https://www.redhat.com/promo/fonts/"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://License.txt;md5=5b171c5100029d884fcea21d9a2b7543 \
-"
-
-
-SRC_URI = "http://fedorahosted.org/liberation-fonts/export/807b6dfd069b998cd9b4d3158da98817ef23c79d/F-9/liberation-fonts-ttf-3.tar.gz"
-S = "${WORKDIR}/liberation-fonts-${PV}"
-
-PACKAGES = "ttf-liberation-mono ttf-liberation-sans ttf-liberation-serif"
-FONT_PACKAGES = "ttf-liberation-mono ttf-liberation-sans ttf-liberation-serif"
-
-FILES:ttf-liberation-mono  = "${datadir}/fonts/truetype/*Mono*"
-FILES:ttf-liberation-sans  = "${datadir}/fonts/truetype/*Sans*"
-FILES:ttf-liberation-serif = "${datadir}/fonts/truetype/*Serif*"
-
-SRC_URI[sha256sum] = "174cf27c57612971434ec8cc4a52bfd37bad8408e9b9219539c6d5113df6ff8f"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb
new file mode 100644
index 0000000000..7b0828574c
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_2.1.5.bb
@@ -0,0 +1,27 @@
+require ttf.inc
+
+SUMMARY = "Liberation fonts - TTF Version"
+HOMEPAGE = "https://github.com/liberationfonts"
+LICENSE = "OFL-1.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f96db970a9a46c5369142b99f530366b \
+"
+
+
+SRCREV = "4b0192046158094654e865245832c66d2104219e"
+SRC_URI = "git://github.com/liberationfonts/liberation-fonts.git;branch=main;protocol=https"
+
+DEPENDS = "fontforge-native"
+S = "${WORKDIR}/git"
+
+PACKAGES = "ttf-liberation-mono ttf-liberation-sans ttf-liberation-serif"
+FONT_PACKAGES = "ttf-liberation-mono ttf-liberation-sans ttf-liberation-serif"
+
+FILES:ttf-liberation-mono  = "${datadir}/fonts/truetype/*Mono*"
+FILES:ttf-liberation-sans  = "${datadir}/fonts/truetype/*Sans*"
+FILES:ttf-liberation-serif = "${datadir}/fonts/truetype/*Serif*"
+
+inherit python3native
+
+do_compile() {
+    cd ${S}; make ttf;
+}

