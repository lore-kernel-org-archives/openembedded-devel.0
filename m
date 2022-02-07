Return-Path: <matthias@extraklein.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B43B7C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 11:37:10 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.61.102])
 by mx.groups.io with SMTP id smtpd.web10.21089.1644233827434843223
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 03:37:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@extraklein.de
 header.s=key2 header.b=arsymTkh;
 spf=pass (domain: extraklein.de, ip: 188.68.61.102,
 mailfrom: matthias@extraklein.de)
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4JskdD6Nqxz80hc
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Feb 2022 12:37:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=extraklein.de;
	s=key2; t=1644233824;
	bh=0bpAILD+b9EuDmj6XKX3x1jkC/r50P2HzL4+lSMIj2A=;
	h=From:To:Cc:Subject:Date:From;
	b=arsymTkhPe2uVLLo+EDpy4LTxweA7bb+MPamTiCJCuWG0RrcSsdo/XQFvXFkQuWp6
	 sXLz4qIlvb6JhQyzELNCuctjHlcfUxpJgtjzZJTaS7aK1NTCB9lWSlzbSVft1mYirr
	 JQKBCxhHLQwljxDWUmKv+q7KRSmKL8r7xMbNsUWTDjYzj36F6joj5Hm4rRzM4Orh1A
	 mOAnh0GqlgIOqId+OT+F4lHn9UalyYhRRuIqO8L9KKkZIrPpRfjKJ2UeLJqmLBVLmP
	 EmMyRdsy7GRwD181+omjJY2AEdgbmIMsx9yzqe7ya7wWaXoJ6xIP6p8dYUmxFv9xYT
	 HwoebLQjPDx5g==
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4JskdD60bqz80hD
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Feb 2022 12:37:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
Received: from mx2fa3.netcup.net (unknown [10.243.12.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4JskdC4VtJz8sh3
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Feb 2022 12:37:03 +0100 (CET)
Received: from localhost (ip-062-143-218-156.um16.pools.vodafone-ip.de
 [62.143.218.156])
	by mx2fa3.netcup.net (Postfix) with ESMTPSA id C4FB9140142;
	Mon,  7 Feb 2022 12:37:02 +0100 (CET)
Authentication-Results: mx2fa3;
        spf=pass (sender IP is 62.143.218.156)
 smtp.mailfrom=matthias@extraklein.de smtp.helo=localhost
Received-SPF: pass (mx2fa3: connection is authenticated)
From: Matthias Klein <matthias@extraklein.de>
To: openembedded-devel@lists.openembedded.org
Cc: Matthias Klein <matthias@extraklein.de>
Subject: [meta-oe][PATCH V2] gpsd-machine-conf: set precise BSD-2-Clause
 license
Date: Mon,  7 Feb 2022 12:36:52 +0100
Message-Id: <20220207113652.5420-1-matthias@extraklein.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-PPP-Message-ID: <164423382308.15146.2279909452065586130@mx2fa3.netcup.net>
X-PPP-Vhost: extraklein.de
X-NC-CID: 3ENcGfE6Y/eH7CZXNQSa3MNRZGe/DlWjWfrvsUHH7RfQlpn4BIU=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Feb 2022 11:37:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95239

Signed-off-by: Matthias Klein <matthias@extraklein.de>
---
 meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb b/m=
eta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
index 8d74eb4a2..46e26767d 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Machine specific gpsd config"
 LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/BSD;=
md5=3D3775480a712fc46a69647678acb234cb"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/BSD-=
2-Clause;md5=3Dcb641bc04cda31daea161b1bc15da69f"
=20
 # empty by default
 # BSP layers can add stuff like meta-openmoko example:
--=20
2.30.2


