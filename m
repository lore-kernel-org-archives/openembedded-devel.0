Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 162E8C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 12:30:43 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.12292.1724329835711468623
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Aug 2024 05:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HFJtfrZl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AED2BFF808;
	Thu, 22 Aug 2024 12:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724329833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9/ZCXxzuHrHPVw8aAOpOHTfBATcUI22CbKi01ouVd1s=;
	b=HFJtfrZlN01bMyEGSCINz5ZGafO4W/eRvoRagHAvMmdKP/9xIlac7lH9iZtNjm9V/n28UF
	w1TO6iUfz5vQ0KmFTnLN6MaYBN24g6pAhMyVaqKBw21+4PxYLr/2by/amiMO7aOWArB7NH
	Ped/3oI67G7KinLsdU7fKZzwPQr/CQUvdMlYOIwTTB2VtJ5IBu4YpqOV4QKQ0hvtUmdehO
	S2klnVMUYcB8iD3IyOgLytFAZl59ozl1CtxAMLefuWAW7m4NabFlsFy8QsjmDTpzFy4QtZ
	j8QXZh1rZLxaf6VXT5xeTKGsBavcIn2iRQGvA197MHD+oIsVmC++vT5WIHxgrw==
From: thomas.perrot@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [meta-oe][PATCH] vdpauinfo: add recipe
Date: Thu, 22 Aug 2024 14:30:31 +0200
Message-ID: <20240822123031.1156755-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Aug 2024 12:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111904

From: Thomas Perrot <thomas.perrot@bootlin.com>

vdpauinfo is a command-line tool that can query the capabilities
of the system's VDPAU implementation.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb

diff --git a/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb b/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb
new file mode 100644
index 000000000000..99afe745079f
--- /dev/null
+++ b/meta-oe/recipes-graphics/vdpau/vdpauinfo_1.5.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Tool to query the capabilities of a VDPAU implementation"
+HOMEPAGE = "https://gitlab.freedesktop.org/vdpau/vdpauinfo"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5b6e110c362fe46168199f3490e52c3c"
+
+DEPENDS = "libvdpau"
+
+RDEPENDS:${PN} = "libvdpau"
+
+SRCREV = "d3c5bd63bf8878d59b22d618d2bb5116db392d28"
+SRC_URI = "git://anongit.freedesktop.org/vdpau/vdpauinfo;branch=master"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
-- 
2.46.0


