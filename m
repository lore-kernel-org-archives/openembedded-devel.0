Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 822DDC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 11:00:27 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.102])
 by mx.groups.io with SMTP id smtpd.web08.32625.1644836424811417288
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Feb 2022 03:00:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=APm9JWpd;
 spf=pass (domain: arri.de, ip: 40.107.20.102, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWrU9Vr/f0ZpsOkIFvU08QpJ8Mbjmq2LXD1BA3dIxWQueLJRkbOJfxdJ0fqYM16+L8Hi+wG39YAZ81682UbRv7Wvm1p+ZkK9oc8LnSaW/smEyoOQyiBGkENewtZy9958XKy4w/os2FU3ReN30mph2fnmEQMXx4zgAJ8pS9JerjQozbbmORkxy7bdG1d8eNOX8WS5yCLce7uo5s0Byj/cahvfYDiMnauHr9ePr2o3n50YQnUZpgeRi/Rxmi+8WXPnHioC4QLR5HT5k+FF5oopdXwkuherWtwkmK827r+iBXz0fh3fjoXzykFaFo3xzn+TIasl9VIpMcjlJT18+3SwGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akuIGdL9RXQYANzLCQKMf9e94JHaUDveie00ZuTwaIU=;
 b=WUic7fEL+E5LGUfTMzrGv/6S/bGVzUOamMDkhdEmpca1DFQijlBk3xeOccuVPCpiScPgJOt1lTVy8rrSG/E9z5h/kYr8UBJRD/Idyi2+6QN3/8O6o+Ncxf2gHtqYyCV97Yiyc64Bd3L9qAOUWk4M7Xcmb/xmyfFuAekmjRgnz9g3kdSmBCHOLjSFmxcOIroCbChl6Hj8g8L1FPVBmhJ2HXmbFgMYKWYsieWcyFsDfo8kaImgj/vlBZ06ulsGJihByUi0IR6rSw6Ah67ioQzDUlejOaje9HxqJW8ee/CSvAYSjBWUcshUdPrFCiCSzkqZ/DNqXQjpDlLgkP/HFiigXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=arri.de; dmarc=none
 action=none header.from=arri.de; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akuIGdL9RXQYANzLCQKMf9e94JHaUDveie00ZuTwaIU=;
 b=APm9JWpdyrHJ+4gkKWvhokD0sivsP3VuBXNUMIPqDQYaMXzgSI05nJ7hCzVKAHqNAyFaN4JLvaA+fnAdMa5n0PhMqqGwlgnmehi5hBWNSOoOsDSISzABO2sG0wDH/1ngkH2ctJOkRm4wvLiQpKLnH779/rmLKg/uyEUjW4ET1zk=
Received: from AM6PR0202CA0039.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::16) by AM9PR07MB7266.eurprd07.prod.outlook.com
 (2603:10a6:20b:2c4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.8; Mon, 14 Feb
 2022 11:00:22 +0000
Received: from HE1EUR02FT038.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::ee) by AM6PR0202CA0039.outlook.office365.com
 (2603:10a6:20b:3a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18 via Frontend
 Transport; Mon, 14 Feb 2022 11:00:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 HE1EUR02FT038.mail.protection.outlook.com (10.152.11.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 11:00:21 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 14 Feb
 2022 12:00:20 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Mon, 14 Feb 2022 12:00:20 +0100
Received: from dhcp-192-168-0-28.wgnetz.xx.de (192.168.54.144) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 14 Feb
 2022 12:00:19 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: <ceggers@arri.de>, "Jeremy A. Puhlman" <jpuhlman@mvista.com>, Khem Raj
	<raj.khem@gmail.com>
Subject: [oe][hardknott][PATCH] cdrkit: remove ${PN} from ${PN}-dev RDEPENDS
Date: Mon, 14 Feb 2022 12:00:06 +0100
Message-ID: <20220214110006.17163-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.144]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8228836e-8ab2-4725-796b-08d9efa931b4
X-MS-TrafficTypeDiagnostic: AM9PR07MB7266:EE_
X-Microsoft-Antispam-PRVS: 
	<AM9PR07MB7266793781FF9660AD22F72EBF339@AM9PR07MB7266.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:311;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QTZOJcM+yCSHSemIynxnoUKQvukureOOWzES+BY4dntnMfzPnqhUd91zfLYAMQdlniR4NvgB8vQCAvHhWsj2RtPv46G8iuKFxBuH+LCaAY9QnkxsjaRYFSiwvGeOwwKRd4LnD0gdVyCF0q8ZzlychVocBOm24zvQ6jwww2hhi/QMTc8VHImsenB52rNnctq+THYFcfkGkJvO+zX3X9iORa4J9GV2gG/n8fbTGf+906HwGMV9lYDSrupMEV9FMf5fYbSzdcv7ToS6r6JWhI5pCFWvhlb8cpDlZE5Ac3i2Xg5/kxIextpl2z0rT0hmWI1bNwZ1coMJz6eCU2p3u4Edoiiw2nOtsLLd5DEsdkyetqMt41K7nVy8HQSqaTEJdhcAigl9lO92fXKc0UpohyPiBlmCJYjlgpZ4qU2FBLiYUsfUEFUF3UpZTxnVuwTZukM+uQ+wJ4xvAB+Dz1Bc4a9MnnAeoSRvyjs0KzbFTHAo/jD4G+7BDo0/3/uHJ/wP//ZQ4onEwd2KnOP27ePl64m/MPr7hHiD6xb42b6jKowjie7Uwh08gPKqhziIpmiXSY35eCFOprdBz+FvAtrZjSJZJqEgO2v9G0RkVPQDBrwNHw3OZ+MwyzLCjrjm49ttQJqm4dLvP5FwQVTYCFdsNpXufmNqZVuRxhsjRScBr9mScryooVWI8+yZGhal+zH/h3bPLNhhaSRhzS2a9rZaVqLIJRxaVd6QXLPzRr1jzVQJ81M=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(8936002)(2906002)(83380400001)(40460700003)(5660300002)(86362001)(356005)(81166007)(36860700001)(47076005)(36756003)(6666004)(70586007)(70206006)(316002)(6916009)(4326008)(8676002)(54906003)(82310400004)(508600001)(186003)(336012)(426003)(1076003)(2616005)(16526019)(26005)(228453006)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 11:00:21.1239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8228836e-8ab2-4725-796b-08d9efa931b4
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR02FT038.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7266
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Feb 2022 11:00:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95306

From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>

upstream commit 245afbc8bd3bf6e91d02a99532ab8cab26e00024

If you add -dev packages to an image, as in an
sdk, ${PN}-dev is pulled in, which depends on ${PN}
which no longer exists in the new package layout.

Error:
 Problem: conflicting requests
  - nothing provides cdrkit =3D 1.1.11-r0.1 needed by
cdrkit-dev-1.1.11-r0.1.corei7_64
(try to add '--skip-broken' to skip uninstallable packages)

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/r=
ecipes-multimedia/cdrkit/cdrkit_1.1.11.bb
index 3344821fa0da..b9ee03425e70 100644
--- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
@@ -20,6 +20,8 @@ inherit cmake
 DEPENDS =3D "libcap file bzip2"
 RDEPENDS_dirsplit =3D "perl"
=20
+RDEPENDS_${PN}-dev =3D ""
+
 PACKAGES =3D+ "dirsplit genisoimage icedax wodim"
=20
 FILES_dirsplit =3D " \
--=20
2.34.1


