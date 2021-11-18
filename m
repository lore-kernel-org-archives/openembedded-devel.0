Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F645C433EF
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 17:52:16 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.5142.1637257934818366986
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 09:52:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=OtXgXRHP;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A7DD482982;
	Thu, 18 Nov 2021 18:52:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1637257931;
	bh=4gNNhR10i7X+vp8kYK1WhSpDiPe3qjb0YE8x46ATJTA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OtXgXRHPJW3MazbmYb3u6l2Klzetzx6XrZ4ctqNB+9BMFaI/FKWU0D/FwW5kdq1e2
	 eT8gNncnkButCBR0G2klTPg7AYrTc0YgzpFEhxRxXbi7+xIIAKhldYy0CLpWAmbg5q
	 VyIcb/0S4TM/VIwFVhLOCTX4NM6RXdOwvGnWIjBT+ZFJVx6UjvQzNJytEFCIpE0hd0
	 R9wwJPwAmG9a7vuKkIrm6ThX3eOVsxT3fZcg8jhmZjnbSaqatLpkMKxanGupFzP/oF
	 Amvdj4GGfVw8gkOKzAAyNd/cyKpcEmtITJsB/TuIMn+umESegnLXTk7mc9in1MJFHJ
	 2EAfc+dyvDTkg==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [meta-oe][PATCH 2/4] freerdp: Add missing libusb1 dependency
Date: Thu, 18 Nov 2021 18:51:42 +0100
Message-Id: <20211118175144.1708578-2-marex@denx.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211118175144.1708578-1-marex@denx.de>
References: <20211118175144.1708578-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 17:52:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94047

The freerdp does depend on libusb1 for rdpdr device forwarding.
This missing dependency is currently hidden, since it is pulled
in by pcsc-lite, but if the later is removed from DEPENDS, the
build fails. Add the missing dependency.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alex@linutronix.de>
Cc: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb b/meta-oe/r=
ecipes-support/freerdp/freerdp_2.4.1.bb
index 6582b2e7d..d2851a602 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb
@@ -3,7 +3,7 @@
=20
 DESCRIPTION =3D "FreeRDP RDP client & server library"
 HOMEPAGE =3D "http://www.freerdp.com"
-DEPENDS =3D "openssl alsa-lib pcsc-lite"
+DEPENDS =3D "openssl alsa-lib pcsc-lite libusb1"
 SECTION =3D "net"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
--=20
2.33.0


