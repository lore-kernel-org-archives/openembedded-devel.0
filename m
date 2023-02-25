Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26618C7EE2E
	for <webhook@archiver.kernel.org>; Sat, 25 Feb 2023 23:17:41 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.55997.1677367056537175565
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Feb 2023 15:17:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4256840BA9
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Feb 2023 23:17:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d_OjFiuHIIhK
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Feb 2023 23:17:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2FC0840C88
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Feb 2023 23:17:35 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 624CC163763;
	Sat, 25 Feb 2023 18:17:08 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 1/2] lmbench: set up /usr/bin/hello as alternative
Date: Sat, 25 Feb 2023 23:17:16 +0000
Message-Id: <20230225231717.3887902-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230225231717.3887902-1-denis@denix.org>
References: <20230225231717.3887902-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Feb 2023 23:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101255

As lmbench installs this rather generically-named /usr/bin/hello binary,
it conflicts with the one provided by mbedtls, hence set it up as an
alternative to avoid conflicts when both are installed to rootfs or SDK.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-o=
e/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index d74c28f3f..03018bb52 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -99,6 +99,6 @@ pkg_postinst:${PN} () {
 RDEPENDS:${PN} =3D "perl"
 FILES:${PN} +=3D "${datadir}/lmbench"
=20
-ALTERNATIVE:${PN} =3D "stream"
+ALTERNATIVE:${PN} =3D "stream hello"
 ALTERNATIVE_LINK_NAME[stream] =3D "${bindir}/stream"
-
+ALTERNATIVE_LINK_NAME[hello] =3D "${bindir}/hello"
--=20
2.25.1


