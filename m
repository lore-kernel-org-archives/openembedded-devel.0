Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.102])
 by mx.groups.io with SMTP id smtpd.web11.3139.1590869548392378677
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2020 13:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=THNivHZy;
 spf=pass (domain: outlook.com, ip: 40.92.75.102, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NklEHwTP93RQ1Q2TXe0QE7mmdlWMXdG7aagmSs69Fqwjj3OT6mxgN2Cm50obKJ/6wzEHmFYbXU1znSEt+jsDwBGXdYIjUjHIv3RPUfpbrWUYw327vmW4i/kzkC0aDSMkfYs6jjCWdaFlbtosu3cbH3t8L1xdisdzi01rH0RcEhFcMQQEskOksjsP8eR/1F+ITBnlTwVUdSegIK9nUWmkCM4nA8enx5/4DS3+PVefDcw0lMcAGksAzqiFwu+8eq/MBSqHc/zNkHzmPZ7FA67JaTkz6sSxZopVIgp2ymCekqhy+NZzdDRAq4aEfhydJpWWgbBZqAqZarJKesLTQwYRPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWuDqso3AU0Ur40ApVP7+uuWuildFee0DaRRZ91OvBo=;
 b=d2CphN6338sYWUkoLFPLpipX3bMtLFZvZNjaHpND9eojMW8YwHYMby38ZmqoOKcyv5H5zIS9BhZxgyBZK6XdmI+QmeUHx/SqFO2yJ6o4AQ6yvlV8K/ChmUJRLdwyvw4KnTLoEKcFlFBoW9VzCblTly1Y/DfMJN/X/OgEAJEVPbaN1U2cakGJ6BNvI6+yXxkFW1ewDcl04btr+LMNpnqy43aKAnnbHQ6n97LerdgFRSFVT/dtpc5pNJtGKiU1hYUjPNPuiA1uAaXUu9e2LJLEKgesEZa/vgkrYmvwIC0TLLL0YZCmstKz87IN5rBR/Z7DEZurgVf1S08NRqFF+kVmhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWuDqso3AU0Ur40ApVP7+uuWuildFee0DaRRZ91OvBo=;
 b=THNivHZynwdLcjrDJt9bs6ClGXc/n9BtLrXSWuaXPaUSvS6+DUFpe89XDxH5e+RvMjlGEWWLsNUaBEehdJKNWVr56UCP46LN9xwg0yPFjT276gXkx6+JN/mzj9kN6HvE2ZSQLcWBeMo0DvQPJpEMvIkG8RokXOq/3BY4/y8XvgK+94xub9XCVoqLyGKRzZreYswz61dnk8fubprnZlD9qV6TKBB4owfBbh5yYbKNtLQFEynSHa9aYgQoGeMJ2a007sbGTlkmFqkYVonMVp0ff8rbo9ek3hx3dbcLXHX5b3VYlU8mk/9wOkdwN6jNtKHLwy50KiK+nXxG78zAutTFUg==
Received: from VI1EUR04FT021.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::53) by
 VI1EUR04HT037.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Sat, 30 May
 2020 20:12:26 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0e::40) by VI1EUR04FT021.mail.protection.outlook.com
 (2a01:111:e400:7e0e::319) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Sat, 30 May 2020 20:12:26 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:ECC9B6DB207DDED8592F05E046887BF6F304A79C4FFEDB98AED9127B3CFEB008;UpperCasedChecksum:849059718B6B039D467A0D205955DD4727983ACF4B8765624DEE42E7461B1D38;SizeAsReceived:7448;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%7]) with mapi id 15.20.3045.022; Sat, 30 May 2020
 20:12:26 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH 1/7] pugixml: fix typo for homepage
Date: Sat, 30 May 2020 22:11:19 +0200
Message-ID: <AM7PR05MB68811B8CF90104D6F2C6A50FA88C0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM5PR0402CA0005.eurprd04.prod.outlook.com
 (2603:10a6:203:90::15) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200530201125.9938-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.43.214) by AM5PR0402CA0005.eurprd04.prod.outlook.com (2603:10a6:203:90::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Sat, 30 May 2020 20:12:25 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200530201125.9938-1-kweihmann@outlook.com>
X-TMN: [O8fjgGD2gq0mWvTddAfxF1rE409AaZU+]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: ca87e05d-3a2f-49df-0c69-08d804d5c52a
X-MS-Exchange-SLBlob-MailProps: 
	=?us-ascii?Q?apgo5D0uMOHu9u6AKyaa05BxdpLYz6fwCGIX5BgTDoHQlt+G4yINH1PXI8EZ?=
 =?us-ascii?Q?oTQVC5+JPl6Hta+LF5rxs4rcrI6v1TbjLZuUShUhll60qFZiZz+ZDw0UXhKa?=
 =?us-ascii?Q?o6k0tnznfgr466yc6+5gZEJbOW0XDo2SxcGIMLdn2Zx0ZcNNE3mb/iksn9g0?=
 =?us-ascii?Q?GvBIDa7Ctd0kSJB1bKfdy1bLV7XxmTATMy35Rnv7eXWUoL/TCcJhKs9Ruu6I?=
 =?us-ascii?Q?k2hATSiQyBBgnDk6n6vdNQpBu50AujPBU/u1Q8iUkdtGfUT1mt0Edz1K6ElE?=
 =?us-ascii?Q?QxCqMYk+7lAMGz1MZbw09aF0FZ0kpR42pKXFjEaj7fmK7ous5FEwC/sWiTE2?=
 =?us-ascii?Q?kUb0v4/tD6cqoAz0oT81SuvFrSdioGYLvLKHG4YN5sSY4HdGOkjkGRJ30Mmg?=
 =?us-ascii?Q?h4ckw0kJiwGQHrYtTuWF0GJIwN1Fi+Ow/4tjfCv75AGAg+XWotIDdtYtGlMo?=
 =?us-ascii?Q?jQmIDbRWqFarZL2ww0PCmpJqV1QT3Imu8EQi7bgaC5DdbX+Lnki42bIgBZEU?=
 =?us-ascii?Q?TIs1zFk6GKX/Fxf50c+RvAhC+PeGzd99RIfv/myJ/gWV1QJHG2vZGb2b50Ze?=
 =?us-ascii?Q?FcfAg5SvgE9K0qCUryGI8Prks4eEodZD/adLoMo/L1XJSFCsig39ars/rDpL?=
 =?us-ascii?Q?GNw9eCcMVP4IpRs8p9GhnF6GxoCS8U2d/c0EoMmCd/BD6leEmO9aC8OR6iKR?=
 =?us-ascii?Q?Vtfc0nBRrRWwEpwdlcJUQ8iT1+Kmxz0qBxbVdKOOmwvSElwFsCsiTmnMckdu?=
 =?us-ascii?Q?BtlY9oPw/oVVggDuiVFHOWCSYOQnQEKP7cnNwoVID3wBRlTsonOA0yTmINFN?=
 =?us-ascii?Q?crTUqyh4WibG8oWCAofVrn6YUeyS778CyfhV7SeEtWM3YoWSWF/5kn4gCpPn?=
 =?us-ascii?Q?N39XhWeYmSbliWgcaUDDWdooJFR1AfsxSKKaKDSiLKU7Fg+uf2Dj3XiZcAoj?=
 =?us-ascii?Q?03nvu7A9olA/ymuIvJVBIrIR6SOGcuDosGvgh5lKVLW4syVr1gYQ4g=3D=3D?=
X-MS-TrafficTypeDiagnostic: VI1EUR04HT037:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qLKllbln8tN0EHJZAlU7+st3zTVm2yII+2jYc1c3GCMDlnaY7NGzkFaGIh3J8JybuNw4wFGELj119TvMaH80vjhZG98ZvfrStauFXSBfCuYJzZPjG9T0W+Lf4FrPTZGHK3nJe7G68rvAh2ggBjSJMUt2PvdeH5DMpVMeKj+LKSzqHi4IoTKrqB5EUELYOEnbtYkfO1mo9NcSNi8De5b+GpJrG+Amc5uunzWBC158+o3L/ZsNHKXA6uR5TwJCumVX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	dihVa/AJ/kVsFFiPcBgZPKokKMd/MYvgSuHSj0YtrMfvR8cNy6qMioLvp3002aYxRZr0LUsPmB76DI6yIDOQPbH9VH7aZCQMLzLHPdGrkpsQDOw9D+fJbe2fi/yogZHObNPXtonuGjasRoYiJEjJBQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca87e05d-3a2f-49df-0c69-08d804d5c52a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2020 20:12:26.0684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT037
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Fix typo for HOMEPAGE var

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-oe/recipes-devtools/pugixml/pugixml_1.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/pugixml/pugixml_1.10.bb b/meta-oe/rec=
ipes-devtools/pugixml/pugixml_1.10.bb
index 69e66289c..2815ed613 100644
--- a/meta-oe/recipes-devtools/pugixml/pugixml_1.10.bb
+++ b/meta-oe/recipes-devtools/pugixml/pugixml_1.10.bb
@@ -4,7 +4,7 @@ DOM-like interface with rich traversal/modification capabil=
ities, \
 an extremely fast XML parser which constructs the DOM tree from \
 n XML file/buffer, and an XPath 1.0 implementation for complex \
 data-driven tree queries."
-HOMPAGE =3D "https://pugixml.org/"
+HOMEPAGE =3D "https://pugixml.org/"
=20
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://readme.txt;beginline=3D29;endline=3D52;md5=3D=
d5ee91fb74cbb64223b3693fd64eb169"
--=20
2.20.1

