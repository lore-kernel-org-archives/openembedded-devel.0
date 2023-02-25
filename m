Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9C6C64EC7
	for <webhook@archiver.kernel.org>; Sat, 25 Feb 2023 23:17:41 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.55854.1677367056427134182
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Feb 2023 15:17:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4C03140C30
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Feb 2023 23:17:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5PRHhf99qdiZ
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Feb 2023 23:17:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3B2E540C8C
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Feb 2023 23:17:35 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 566C516375B;
	Sat, 25 Feb 2023 18:17:08 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 0/2] Resolve conflict between /usr/bin/hello from lmbench and mbedtls
Date: Sat, 25 Feb 2023 23:17:15 +0000
Message-Id: <20230225231717.3887902-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Feb 2023 23:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101256

Both lmbench and mbedtls packages provide generically-named /usr/bin/hell=
o
binary, which causes a conflict when trying to install them both into a
rootfs or SDK. Set up alternative providers to resolve the conflict.

Denys Dmytriyenko (2):
  lmbench: set up /usr/bin/hello as alternative
  mbedtls: set up /usr/bin/hello as alternative

 .../recipes-connectivity/mbedtls/mbedtls_2.28.2.bb           | 5 ++++-
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb          | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

--=20
2.25.1


