Return-Path: <matthias@extraklein.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF43DC433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 15:30:41 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.165])
 by mx.groups.io with SMTP id smtpd.web09.21229.1646062236999527494
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 07:30:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@extraklein.de
 header.s=key2 header.b=RzWSCHMF;
 spf=pass (domain: extraklein.de, ip: 188.68.63.165,
 mailfrom: matthias@extraklein.de)
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4K6kpx6Z3Nz3t3S;
	Mon, 28 Feb 2022 16:30:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=extraklein.de;
	s=key2; t=1646062233;
	bh=FCqq1AwWEfPmfGHTd2nOlDTsoXeUq/fRUYe63Z3mzbg=;
	h=From:To:Cc:Subject:Date:From;
	b=RzWSCHMFkq1NOXU8ijM38pRVTeD9nRAJNdQRXdB0BPI4H+GfpClPIfI0m0NbNtJcM
	 ryHdMuOippIld/ct1F6twW4R1AYOC7xDvR9h6Abn3D+R2ympkOw1ZrCmvj1lBMMziw
	 CbF1ZNdzjVBHIs2/WlVhHSBdv6fPTknfQa6wl/jYRW5bCkmonMZB0PtnxCnggtkr4s
	 ZCU2cO6oL8OzYdy/sFffLOoRKtcWmkcJJNdrB/F/remK1T1smJD92wXf/XCULDz9sD
	 mj0LaDC3XMpmFCu8ZJ1dhKBaktrgdPhpbolFfLIvely6h40ENBSk8G/rjcLQ+G9tyg
	 vhX8XUvoQ5rtQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4K6kpx6B5jz3t2t;
	Mon, 28 Feb 2022 16:30:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
Received: from mx2fa3.netcup.net (unknown [10.243.12.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4K6kpx1Rl4z8sh0;
	Mon, 28 Feb 2022 16:30:32 +0100 (CET)
Received: from localhost (ip-062-143-218-156.um16.pools.vodafone-ip.de
 [62.143.218.156])
	by mx2fa3.netcup.net (Postfix) with ESMTPSA id 63AB91400E4;
	Mon, 28 Feb 2022 16:30:32 +0100 (CET)
Authentication-Results: mx2fa3;
	spf=pass (sender IP is 62.143.218.156) smtp.mailfrom=matthias@extraklein.de
 smtp.helo=localhost
Received-SPF: pass (mx2fa3: connection is authenticated)
From: Matthias Klein <matthias@extraklein.de>
To: openembedded-devel@lists.openembedded.org
Cc: kweihmann@outlook.com,
	Matthias Klein <matthias@extraklein.de>
Subject: [meta-python][PATCH] python3-smbus: fix wheel build Recipe does not
 inherit pypi nor would PN be a good guess for the wheel name so set
 PIP_INSTALL_PACKAGE appropriately. PYPA_WHEEL doesn't respect
 SETUPTOOLS_SETUP_PATH so set PYPA_WHEEL appropriately.
Date: Mon, 28 Feb 2022 16:29:58 +0100
Message-Id: <20220228152958.1419-1-matthias@extraklein.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-PPP-Message-ID: <164606223261.25351.7636834588135797561@mx2fa3.netcup.net>
X-PPP-Vhost: extraklein.de
X-NC-CID: v6C3ChJ2GB72P3Ugno91vJkOINS/VeA4FF24QLjdBM5mDd/Ho74=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 15:30:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95580

Signed-off-by: Matthias Klein <matthias@extraklein.de>
---
 meta-python/recipes-devtools/python/python3-smbus_4.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-smbus_4.3.bb b/m=
eta-python/recipes-devtools/python/python3-smbus_4.3.bb
index ecdff3ada..1a6c99cfc 100644
--- a/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
@@ -13,4 +13,6 @@ S =3D "${WORKDIR}/i2c-tools-${PV}"
=20
 inherit setuptools3
=20
+PIP_INSTALL_PACKAGE =3D "smbus"
+PYPA_WHEEL =3D "${S}/py-smbus/dist/smbus-*-*.whl"
 SETUPTOOLS_SETUP_PATH =3D "${S}/py-smbus"
--=20
2.30.2


