Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4252FD1CA3E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 07:16:37 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.12330.1730790994663892490
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Nov 2024 23:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=enNOeKpr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 982CD1C0004;
	Tue,  5 Nov 2024 07:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730790992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SD5Z8UIMFGmIM0O5hPQq+IJrPz4MUmU6/FdJtiY8T0U=;
	b=enNOeKprdaFi5PgkMPJKbu4yx0m3RtgUB0yOmSAHv9b2QE9CS1UAtURtWgs5bz3oY+OKN9
	qJIvVcpuZD/+2ygXdfRJM2Y+zGIEoDD+mKQLylkKIT2W+yR7jp3XKeiOtVd2opNL+/K8yV
	OOGMl5HhkYYb5j98Omvm9DAX1c68jc0FAsq3/xojZRMUFZOQO63J4iz09cVVFF2zMH0rBj
	qUR3fttBK9TqsSlWYz1IObPc2ocr6rdL55DMbaFlnvOR7nUFmJUNqanYbEUaPDHAHRLzYl
	t+Z776SFXrQcwXcAEI1I2N0H2xGNLOsrBjbm+TbQbhIsxrIKNFwFB6XWO+UtNg==
From: thomas.perrot@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [oe][meta-oe][PATCH] taisei: add a recipe for version 1.4.2
Date: Tue,  5 Nov 2024 08:16:09 +0100
Message-ID: <20241105071627.2768743-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 07:16:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113413

From: Thomas Perrot <thomas.perrot@bootlin.com>

Taisei Project is an open source danmaku.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 .../recipes-graphics/taisei/taisei_1.4.2.bb   | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/taisei/taisei_1.4.2.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 178256c83f63..4635fe3d44d0 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -521,6 +521,7 @@ RDEPENDS:packagegroup-meta-oe-graphics = "\
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "st", "", d)} \
     stalonetray \
     surf \
+    taisei \
     terminus-font-consolefonts \
     terminus-font-pcf \
     tesseract \
diff --git a/meta-oe/recipes-graphics/taisei/taisei_1.4.2.bb b/meta-oe/recipes-graphics/taisei/taisei_1.4.2.bb
new file mode 100644
index 000000000000..2d2ab32bace7
--- /dev/null
+++ b/meta-oe/recipes-graphics/taisei/taisei_1.4.2.bb
@@ -0,0 +1,52 @@
+SUMMARY = "Taisei Project is an open source danmaku"
+DESCRIPTION = "Taisei Project is an open source fan-game set in the world of \
+               Tōhō Project. It is a top-down vertical-scrolling curtain fire \
+               shooting game (STG), also known as a 'bullet hell' or 'danmaku'. \
+               STGs are fast-paced games focused around pattern recognition and \
+               mastery through practice."
+HOMEPAGE = "https://taisei-project.org"
+BUGTRACKER = "https://github.com/taisei-project/taisei/issues"
+LICENSE = "CC-BY-4.0 & CC0-1.0 & MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1a11ffd7e1bdd1d3156cecec60a2846f"
+
+DEPENDS = "\
+    cglm \
+    freetype \
+    libsdl2 \
+    libwebp \
+    opusfile \
+    zstd \
+"
+
+RDEPENDS_${PN} = "\
+    cglm (>= 0.7.8) \
+    freetype \
+    libsdl2 (>= 2.0.16) \
+    libpng (>= 1.5.0) \
+    libwebp (>= 0.5) \
+    libzstd (>= 1.4.0) \
+    opengl (>= 3.3) \
+    opusfile \
+    zlib \
+"
+
+SRC_URI = "gitsm://github.com/taisei-project/taisei.git;branch=v1.4.x;protocol=https"
+SRCREV = "c098579d4fa0f004ccc204c5bc46eac3717cba28"
+
+S = "${WORKDIR}/git"
+
+inherit features_check meson mime mime-xdg pkgconfig python3native
+
+REQUIRED_DISTRO_FEATURES = "opengl"
+
+PACKAGECONFIG ??= ""
+
+PACKAGECONFIG[a_null] = "-Da_null=true,-Da_null=false"
+PACKAGECONFIG[developer] = "-Ddeveloper=true,-Ddeveloper=false"
+PACKAGECONFIG[docs] = "-Ddocs=true,-Ddocs=false,python3-docutils-native"
+
+
+
+FILES:${PN} += "${prefix}/share"
+
+INSANE_SKIP:${PN} = "already-stripped"
-- 
2.47.0


