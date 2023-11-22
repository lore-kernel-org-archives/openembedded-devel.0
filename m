Return-Path: <charles.perry@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64762C27C40
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 23:57:13 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.79439.1700697424936170942
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Nov 2023 15:57:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=llTbpmKi;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: charles.perry@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id BB8C09C2B80
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 18:57:03 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id nFuVOcsBuDie; Wed, 22 Nov 2023 18:57:03 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 55C1F9C2C3B;
	Wed, 22 Nov 2023 18:57:03 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 55C1F9C2C3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1700697423; bh=VVJZqdqdsKS3/W/26dSfDUrOsv7rnE2DS1F+69qsCKA=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=llTbpmKidg1LcHP3yJOBgCFu2aVSSa3ebgw9sTCIez8DOkB2kQ2IYjS21ILMZi7I+
	 nHDJPpPV3kc0kKnwm/z1AmRLid/JpTAQkSEDXEj2sjpJGCfD82qskWbrznhuDfkVUs
	 52z/hCoYlyqF9RZFfXY6b0UTPcHXoRDeEVqr3GelWfmH4NuOCklwF1eGcOE9g+6fL3
	 oecWLCwtLetYTNuC1wJJ7yQhif6B44zvxrSiYc/f92oOIwWcEvFlKPG9iwbTk0k8XQ
	 B2PDYfc/RjgJknH6VCaMYNypQNn8bm9c3M5rBYcYHquBn3nyH5ICAWLYsWMerOrtS2
	 dkCDyJ1YVjDTA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id Ycq2YyE-K9hz; Wed, 22 Nov 2023 18:57:03 -0500 (EST)
Received: from pcperry.mtl.sfl (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 33DA59C2B80;
	Wed, 22 Nov 2023 18:57:03 -0500 (EST)
From: Charles Perry <charles.perry@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Cc: Charles Perry <charles.perry@savoirfairelinux.com>
Subject: [meta-networking][PATCH 1/2] libexosip2: add c-ares and openssl PACKAGECONFIG
Date: Wed, 22 Nov 2023 18:56:45 -0500
Message-Id: <20231122235646.3631072-1-charles.perry@savoirfairelinux.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 23:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107015

They are enabled by default as libexosip2 works better with those.

Signed-off-by: Charles Perry <charles.perry@savoirfairelinux.com>
---
 .../recipes-support/libexosip2/libexosip2_5.3.0.bb            | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/libexosip2/libexosip2_5.3.0.=
bb b/meta-networking/recipes-support/libexosip2/libexosip2_5.3.0.bb
index 99a32fd4d..3246baae4 100644
--- a/meta-networking/recipes-support/libexosip2/libexosip2_5.3.0.bb
+++ b/meta-networking/recipes-support/libexosip2/libexosip2_5.3.0.bb
@@ -13,3 +13,7 @@ SRC_URI =3D "${SAVANNAH_NONGNU_MIRROR}/exosip/${BPN}-${=
PV}.tar.gz"
 SRC_URI[sha256sum] =3D "5b7823986431ea5cedc9f095d6964ace966f093b2ae7d0b0=
8404788bfcebc9c2"
=20
 inherit autotools pkgconfig
+
+PACKAGECONFIG =3D "c-ares openssl"
+PACKAGECONFIG[c-ares] =3D ",,c-ares"
+PACKAGECONFIG[openssl] =3D "--enable-openssl,--disable-openssl,openssl"
--=20
2.40.1


