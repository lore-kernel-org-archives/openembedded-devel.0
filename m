Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB6AC4332F
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 22:47:40 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.15672.1641941259593600937
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 14:47:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=IQ40Xzqe;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id D14A182F89;
	Tue, 11 Jan 2022 23:47:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1641941256;
	bh=IG7fKHneN1qf+cYuCV7kYqJn6PeyKgTMV+KJQn2cyaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IQ40XzqetSzJTTckdYhC9Sk6SWToJ8R4GohNyrdU+eB7A6e32OjTIDJsYKQYH9dhj
	 EjrNiBYxh+uiVq+4poSWMank3BtjyY5qt5A5WQYWp+0gqd/57dnWJ1KIKrFe7FjS7b
	 vPekYHx6WbyEWjIN3OWLtuOZW9RFMuSYgdXHrXiImQtNCp7gbHLkK+ZJ18Kzq7sj3g
	 2Xp1YTmEwxBgzhaSxswP0aipiR5YpSDPGr2AgBHNZv/seCU1bjMQFLU2fkuayy5aPb
	 lkCfKZNvvuapbRsYhw9XqZA5e/K5bFkDyU70EkQrGXISFJk9eKYMGeaamfK7thk1+n
	 tIvTPfxEED5Uw==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [meta-oe][dunfell][PATCH 5/5] freerdp: Add missing libusb1 dependency
Date: Tue, 11 Jan 2022 23:47:14 +0100
Message-Id: <20220111224714.1289840-5-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111224714.1289840-1-marex@denx.de>
References: <20220111224714.1289840-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jan 2022 22:47:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94764

The freerdp does depend on libusb1 for rdpdr device forwarding.
This missing dependency is currently hidden, since it is pulled
in by pcsc-lite, but if the later is removed from DEPENDS, the
build fails. Add the missing dependency.

(cherry picked from commit 26658cc249746f780f0aea72a638a664897c3c6e)
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alex@linutronix.de>
Cc: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb b/meta-oe/r=
ecipes-support/freerdp/freerdp_2.4.1.bb
index 7ea7b71ef..055176e39 100644
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
2.34.1


