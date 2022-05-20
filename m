Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A685AC433F5
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 13:24:32 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web08.8678.1653053070357351472
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 May 2022 06:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Xf4XFEH1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3FE401C0008;
	Fri, 20 May 2022 13:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653053068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6qxjNR6tQ6IBmI4hVd8jc8NrvXuKwZcByrbK1yi710I=;
	b=Xf4XFEH12BK9ocYPjfVVrzGlMlUoFG9MCb0Dhh+65SYdyb6erjuyJaZtNK7CbZmX2GohGm
	B8sd6jqmIJr3VT02hFdz8kwJfl5bI+3JOK1pH+FMFtGNnrGv/HghBnWxYMvNOYbM9BquEX
	083jsC99oL87LkesvBMm2kbqk1hSXb7Y7ZtaU5SP30CmruLAiG4+nFKbQtgixmg420MdlZ
	q0b20IOslzK5jOqM4Q1j0k9kXpAEpGad3BDWk0eknSHImwKvrbtZfGECP/4mDQRgCQwF22
	sKVwQw9bhorkYMjVBvBIjXpu5Vml79kAH7AErvDHBOeC1MUXtrQfx72ES0srew==
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [meta-networking][PATCH] nbd: update 3.20 -> 3.24
Date: Fri, 20 May 2022 15:24:15 +0200
Message-Id: <20220520132415.3195248-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 May 2022 13:24:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97214

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 .../packagegroups/packagegroup-meta-networking.bb        | 1 +
 .../recipes-support/nbd/{nbd_3.20.bb => nbd_3.24.bb}     | 9 +++++----
 2 files changed, 6 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/nbd/{nbd_3.20.bb => nbd_3.24.bb} (56%)

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index 143e48712222..d5a2dfad6304 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -218,6 +218,7 @@ RDEPENDS:packagegroup-meta-networking-support = "\
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "ntpsec", "", d)} \
     nbd-client \
     nbd-server \
+    nbd-trplay \
     nbd-trdump \
     openvpn \
     macchanger \
diff --git a/meta-networking/recipes-support/nbd/nbd_3.20.bb b/meta-networking/recipes-support/nbd/nbd_3.24.bb
similarity index 56%
rename from meta-networking/recipes-support/nbd/nbd_3.20.bb
rename to meta-networking/recipes-support/nbd/nbd_3.24.bb
index 7b7f5cbfa23e..da9f82952343 100644
--- a/meta-networking/recipes-support/nbd/nbd_3.20.bb
+++ b/meta-networking/recipes-support/nbd/nbd_3.24.bb
@@ -4,16 +4,17 @@ SECTION = "net"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "glib-2.0"
+DEPENDS = "autoconf-archive bison-native glib-2.0 libnl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "910fe6c152f8c30ad8608388e6a4ce89"
-SRC_URI[sha256sum] = "e0e1b3538ab7ae5accf56180afd1a9887d415b98d21223b8ad42592b4af7d6cd"
+SRC_URI[md5sum] = "a6d9e7bbc311a2ed07ef84a58b82b5dd"
+SRC_URI[sha256sum] = "6877156d23a7b33f75eee89d2f5c2c91c542afc3cdcb636dea5a88539a58d10c"
 
 inherit autotools pkgconfig
 
-PACKAGES = "${PN}-client ${PN}-server ${PN}-dbg ${PN}-trdump ${PN}-doc"
+PACKAGES = "${PN}-client ${PN}-dbg ${PN}-doc ${PN}-server ${PN}-trdump ${PN}-trplay"
 
 FILES:${PN}-client = "${sbindir}/${BPN}-client"
 FILES:${PN}-server = "${bindir}/${BPN}-server"
 FILES:${PN}-trdump = "${bindir}/${BPN}-trdump"
+FILES:${PN}-trplay = "${bindir}/${BPN}-trplay"
-- 
2.35.3


