Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.147.1628601529668036259
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Aug 2021 06:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 11AC8200008;
	Tue, 10 Aug 2021 13:18:46 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [meta-oe][PATCH] opus-tools: update to 0.2 and fix license
Date: Tue, 10 Aug 2021 15:18:36 +0200
Message-Id: <20210810131836.137934-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The license in version 0.1.8 was already BSD-2-Clause and GPLv2
(for the "opusinfo" command).

The license checksum change is due to trivial changes on the license
text ("https" instead of "http" and whitespace changes).

This new version now DEPENDs on "libopusenc" and "opusfile" too.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../opus-tools/opus-tools_0.1.8.bb                | 15 ---------------
 .../opus-tools/opus-tools_0.2.bb                  | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb
 create mode 100644 meta-oe/recipes-multimedia/opus-tools/opus-tools_0.2.bb

diff --git a/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb b/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb
deleted file mode 100644
index a84f2bf07..000000000
--- a/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Opus Audio Tools"
-HOMEPAGE = "http://www.opus-codec.org/"
-
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=843a066da9f1facfcc6ea6f616ffecb1"
-
-SRC_URI = "http://downloads.xiph.org/releases/opus/opus-tools-${PV}.tar.gz"
-SRC_URI[md5sum] = "b424790eda9357a4df394e2d7ca19eac"
-SRC_URI[sha256sum] = "e4e188579ea1c4e4d5066460d4a7214a7eafe3539e9a4466fdc98af41ba4a2f6"
-
-S = "${WORKDIR}/opus-tools-${PV}"
-
-DEPENDS = "libopus flac"
-
-inherit autotools pkgconfig
diff --git a/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.2.bb b/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.2.bb
new file mode 100644
index 000000000..b5e6ed947
--- /dev/null
+++ b/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Opus Audio Tools"
+HOMEPAGE = "http://www.opus-codec.org/"
+
+LICENSE = "BSD-2-Clause & GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=79f6fc2a6239fbe5f6e52f20ac76698c"
+
+SRC_URI = "http://downloads.xiph.org/releases/opus/opus-tools-${PV}.tar.gz"
+SRC_URI[md5sum] = "ff2d0536e960cabbfb8ca7c8c1759b6c"
+SRC_URI[sha256sum] = "b4e56cb00d3e509acfba9a9b627ffd8273b876b4e2408642259f6da28fa0ff86"
+
+S = "${WORKDIR}/opus-tools-${PV}"
+
+DEPENDS = "libopus libopusenc flac opusfile"
+
+inherit autotools pkgconfig
-- 
2.25.1

