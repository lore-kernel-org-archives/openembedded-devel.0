Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13B0C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 13:15:07 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.20830.1713186907253193555
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Apr 2024 06:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=dK2CsaKm;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3B73E879F3;
	Mon, 15 Apr 2024 15:15:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1713186905;
	bh=Mol8iPLJWzg2Ne2+MQTtNMDZnsxUBA0BdXHQhqxPsSs=;
	h=From:To:Cc:Subject:Date:From;
	b=dK2CsaKmAadPXeb1xj1QSfA8ZkG/S05+hC+KBuZR7BG86NQi0Dvr5K23i2BobTAzg
	 nwxDkNdK0xnWS0iDDIPxZL7+fDvJr7GO6zQ+upcdDdvJdSS+zbHp3ni51PN3bznD/9
	 WyTepbfYRpVmfqWz9icMZthA8QY9J2MZ4zDoURzZFe3/LCnlSJf4U9Z06OTg96+9R+
	 kcT7VAtYWLOlYA5igoy/5aqolL7NiWVz1M3bq4zZ99q8/FaXAllzTbOO+oN19b4Zvi
	 lYWS8CMv42ap5Syy8ovWtqNKLjNggaGs5pXZPaojvPjjW6DjtSZw19EOavej+zl8C+
	 uKs0z7l5wIkmQ==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Martin.Jansa@gmail.com,
	Marek Vasut <marex@denx.de>
Subject: [meta-python2][PATCH] layer.conf: update LAYERSERIES_COMPAT for scarthgap
Date: Mon, 15 Apr 2024 15:14:27 +0200
Message-ID: <20240415131443.7295-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 13:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109961

Support both kirkstone and scarthgap as that seems to work well.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 38ef579..0f228ca 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -14,7 +14,7 @@ LAYERVERSION_meta-python2 =3D "1"
=20
 LAYERDEPENDS_meta-python2 =3D "core openembedded-layer"
=20
-LAYERSERIES_COMPAT_meta-python2 =3D "kirkstone"
+LAYERSERIES_COMPAT_meta-python2 =3D "kirkstone scarthgap"
=20
 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
=20
--=20
2.43.0


