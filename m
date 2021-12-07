Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D60C433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 11:40:12 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.65831.1638877208882805835
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 03:40:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=HgujRbRy;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id EE5E581429;
	Tue,  7 Dec 2021 12:40:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1638877206;
	bh=Z3aBiXKBx+0yZtjlqhXj/Fk3aQOqWtwcMIgTtDtuBfA=;
	h=From:To:Cc:Subject:Date:From;
	b=HgujRbRyFMlxdwYHmvhCEzsYm8h5srUthUlUvsoXYgvrTavPLSaawPXrb+K3RQhDO
	 GFZzN1LZOlpR2XQYLHN64vInFZHrGbRrLJtin/TDrU5Q/ENcIC2WKUYKjpAmKUN18x
	 3aS0BhUjLHfJE76DQ/vUJAajOFl4Yykss/FnRoD0EEUIs2I6HjXyNdd3agEnAFlKXk
	 ilkTHaXfc425XNiqe/JXIL5ZrMUw4K060aXdP4qZOewn6wi9NrqHFkTzkl1fcoagl6
	 c/VicmGlKzziLbvjL32W/FMQmcYQi68/VbISoSf60OlPGUEzvrp3f722rL01xxhb5I
	 02aFiIgEuLyYQ==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [meta-oe][PATCH] freerdp: Use DEPENDS:append
Date: Tue,  7 Dec 2021 12:39:54 +0100
Message-Id: <20211207113954.8959-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Dec 2021 11:40:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94227

The build system might have put something into DEPENDS already,
adhere to the recommended best practice and use DEPENDS:append
to avoid overriding the DEPENDS set by the build system.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alex@linutronix.de>
Cc: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb b/meta-oe/r=
ecipes-support/freerdp/freerdp_2.4.1.bb
index 571ba5fcb..1604838f1 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb
@@ -3,7 +3,7 @@
=20
 DESCRIPTION =3D "FreeRDP RDP client & server library"
 HOMEPAGE =3D "http://www.freerdp.com"
-DEPENDS =3D "openssl alsa-lib libusb1"
+DEPENDS:append =3D " openssl alsa-lib libusb1"
 SECTION =3D "net"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
--=20
2.33.0


