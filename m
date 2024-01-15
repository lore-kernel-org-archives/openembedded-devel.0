Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2673AC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 16:14:07 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.84682.1705334472517055816
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jan 2024 08:01:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HV48uCVH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04C251BF20C;
	Mon, 15 Jan 2024 16:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705334470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yEJ2r7EaJICFD2WaHIvE3x9HwFAdiHgnbV/3EvChYTg=;
	b=HV48uCVHpK5yZrK/MzAOg8OG6hujb6Zh+6/ETRl4NGzbcUvPozguR4ksiPqlV3CMq17bLe
	8vt9B0Zrc96Wp0DkKiybsvvmKeg8pyURP1H8Wnu8mdqQ28eBTfmNl0l9pWeEWOr8JOfm+l
	r905zD5qkqn3wspBuLtBHD6I7ujYQeFd1F54H+KT770HOT6FOnZQ2FqdbWhDhmi/vuTz0P
	Z6KvG1deaForsMKtf9APOMGrzAgg3FLzWDSEDzXRt2y7e83TeRXWhV+dG2MO3T6lJ8yFnA
	10NMSD9RbQr2I4KPOqsQjsAZMkbWdFa7IC8v4xx2QRv8PUr07OYJcR/9srpkIQ==
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	thomas.petazzoni@bootlin.com,
	alexandre.belloni@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [meta-oe] [kirkstone] [PATCH v1] xscreensaver: Add osuosl backup MIRROR
Date: Mon, 15 Jan 2024 17:00:53 +0100
Message-ID: <20240115160053.2175550-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: joaomarcos.costa@bootlin.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 16:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108291

old tarballs disappear from main location, use a backup location to
fetch it in such cases.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Backported from Nanbield
(cherry-picked from commit 8d34444c749a466f35445fd4c2212b3fbdb8d844)
---
 meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.01.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.01.bb b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.01.bb
index 2ab529794..a5271f08b 100644
--- a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.01.bb
+++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.01.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://driver/xscreensaver.h;endline=10;md5=c3ce41cdff745eb1
 SRC_URI = "https://www.jwz.org/${BPN}/${BP}.tar.gz"
 SRC_URI[sha256sum] = "085484665d91f60b4a1dedacd94bcf9b74b0fb096bcedc89ff1c245168e5473b"
 
+MIRRORS += "https://www.jwz.org/${BPN} https://ftp.osuosl.org/pub/blfs/conglomeration/${BPN}"
+
 SRC_URI += " \
     file://xscreensaver.service \
     file://0001-build-Do-not-build-po-files.patch \
-- 
2.43.0


