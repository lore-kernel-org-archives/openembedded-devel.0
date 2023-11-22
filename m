Return-Path: <charles.perry@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65885C61D99
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 23:57:13 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web10.79290.1700697429398492640
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Nov 2023 15:57:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=bQGQb917;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: charles.perry@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A141B9C2C7D
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 18:57:08 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id OYfGYB3y6NkB; Wed, 22 Nov 2023 18:57:08 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 45B149C2C3B;
	Wed, 22 Nov 2023 18:57:08 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 45B149C2C3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1700697428; bh=ZyWUad9Z+F6aJoopkqdcYS6YO1Ws9wyIehUx8hjyxWo=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=bQGQb917AdVHdZAZ3EWmZAej4LYmCyhWksG34RYspUrP4aIVyRY6iDrxN7pGTQsC8
	 Q4rNtH7ZKytNTpDRcZy2BO+lo2W1AcPdurA6pL20fa5X4ESHgjTJzK2dyWzGUrrajh
	 1gE3dRlY+HoiMAXyaIsUfRIoS0KRr1Nehn0yfI3HtjZOdlHQhbauEkwNDxHz+1PUbm
	 g5BNVfkpE7Zk2y7+SQgN3/5qXPTrZPVUeMys/ctAnN5YKoEpn/ZfVdIFXWfrMI1hix
	 QAD86D/LvmvpapNEqEkYxBQ4hh2VaHjzpCfAQceqsRXmTt8GHTKaKs7+PCHwZJM3Tw
	 WHx0zrGW8N0Vw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id atdfZhB-UP0Q; Wed, 22 Nov 2023 18:57:08 -0500 (EST)
Received: from pcperry.mtl.sfl (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 37DFE9C2B80;
	Wed, 22 Nov 2023 18:57:08 -0500 (EST)
From: Charles Perry <charles.perry@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Cc: Charles Perry <charles.perry@savoirfairelinux.com>
Subject: [meta-networking][PATCH 2/2] libexosip2: package binaries in a separate package
Date: Wed, 22 Nov 2023 18:56:46 -0500
Message-Id: <20231122235646.3631072-2-charles.perry@savoirfairelinux.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231122235646.3631072-1-charles.perry@savoirfairelinux.com>
References: <20231122235646.3631072-1-charles.perry@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 23:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107016

Put sip_monitor, sip_reg and sip_storm in a separate libexosip2-tools
package as they won't be needed most of the time.

Signed-off-by: Charles Perry <charles.perry@savoirfairelinux.com>
---
 meta-networking/recipes-support/libexosip2/libexosip2_5.3.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/libexosip2/libexosip2_5.3.0.=
bb b/meta-networking/recipes-support/libexosip2/libexosip2_5.3.0.bb
index 3246baae4..541b2edce 100644
--- a/meta-networking/recipes-support/libexosip2/libexosip2_5.3.0.bb
+++ b/meta-networking/recipes-support/libexosip2/libexosip2_5.3.0.bb
@@ -17,3 +17,6 @@ inherit autotools pkgconfig
 PACKAGECONFIG =3D "c-ares openssl"
 PACKAGECONFIG[c-ares] =3D ",,c-ares"
 PACKAGECONFIG[openssl] =3D "--enable-openssl,--disable-openssl,openssl"
+
+PACKAGES =3D+ "${PN}-tools"
+FILES:${PN}-tools +=3D "${bindir}"
--=20
2.40.1


