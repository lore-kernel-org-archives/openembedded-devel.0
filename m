Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9352C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 07:41:27 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.110])
 by mx.groups.io with SMTP id smtpd.web12.9210.1644997280764088338
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 23:41:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=PblaOOT3;
 spf=pass (domain: arri.de, ip: 40.107.6.110, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GrE8AF6+H4cyMKUcQ5huCY2DhukzTEg1abSpmOX0BEnCXJQB8ZTFtYK0GTv9KyxQxBQYSKeSHC3Mo2hlNVqyf8yjk4cH5yg9DxXQvXn9pvkfRYPRb4vz42kGInZiDWpijGq8Tm37xyqgAsC9oxStZOQkf3krgEndifVHu5R+Z9iBJhxjPh4hpwEuSBsRV2rK/2WgtFIuN1t6kJjNruq6wJELfLTCCW61N96pO1NUFLVvRXNVPOU3e+kGPg3dmpwFygpNilsm62rd1r6G1QhSDtWQvGDQQ+sJthikppSRhGbFa9954oBACUb4qyESnTsP+xHsZoRfqZPN49CQnlsR+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9rrQ58CPQJaiw8JiwZSzhWFEsUXfoy4yInNqgLcsvU=;
 b=fONk1pil2zF+QK8/NGEV/vGE0tZtoVmwr0soygZdMOQAauq7pa6555d47Fo3dY1LuQTUDyzUqN2OiGOK9TsnpPaag/LjLA8hn8PVezXIqg0SSahynKc2saIOJ2gvmvZmC2v2ymxZ8TiHBw8cIrTDTvs7lyRZ8XRNAQsUvnWrZrISCV4C0d0pOsgzk81+0k7gItRj1F0KIqtGP6QpdhFqOLSmn/Ax3mkB9GOXNy9dmL5WnR2+vpZWmIpEZmS15fWAJPn1L05bHKM13cl/Pf84X7dz7C7y3W4NDPMAPxycVdBwhn/6T9fZ9MK6Zbu/z21faG1E+H0UbFYuyKAiQuWyjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=arri.de; dmarc=none
 action=none header.from=arri.de; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9rrQ58CPQJaiw8JiwZSzhWFEsUXfoy4yInNqgLcsvU=;
 b=PblaOOT3VYZ+FfBb/gfhaF1MHEKtVdJmBT4N6Nevx7ZdeF+M5OybqOTKDV6b6N4nl+CXII/WaIEvrsMTRonpT3H8h14JzAX/6+SGBw/mHnZESUNeiD7GyuDWMJR3TBH9hFgi/i6jazkjFnpigQBwJiEshsuuCOtqtc0x2LbUm2c=
Received: from AM6PR0202CA0051.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::28) by AM5PR0701MB2516.eurprd07.prod.outlook.com
 (2603:10a6:203:11::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Wed, 16 Feb
 2022 07:41:17 +0000
Received: from VE1EUR02FT011.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::8c) by AM6PR0202CA0051.outlook.office365.com
 (2603:10a6:20b:3a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Wed, 16 Feb 2022 07:41:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT011.mail.protection.outlook.com (10.152.12.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 07:41:17 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Wed, 16 Feb
 2022 08:41:16 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Wed, 16 Feb 2022 08:41:16 +0100
Received: from localhost.de (192.168.54.102) by mta.arri.de (192.168.100.104)
 with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 16 Feb 2022 08:41:16
 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>, Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][honister][PATCH] ebtables: remove perl from
 RDEPENDS
Date: Wed, 16 Feb 2022 08:41:05 +0100
Message-ID: <20220216074105.31628-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.102]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6adce371-b289-47bd-ce5f-08d9f11fb744
X-MS-TrafficTypeDiagnostic: AM5PR0701MB2516:EE_
X-Microsoft-Antispam-PRVS: 
	<AM5PR0701MB25160B58E16017FF0A2D2685BF359@AM5PR0701MB2516.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:478;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+SHQK7iDRYdrOwU/UKf/WDx7m39SUk8I1z9N8Xy0TaWuB3ozRIxMhh/OCf85cZi58bOh0QtnG3UGmD/xZ8i/3sjuQ3V3fO5OkJhuWuIwJJXoEyvmOCsoBi/2OkM/WbkLvFWW7S2Ib1LNZyvE/7NCb+7QMSr5rrc+BXQUO9h9sH/x/7OhtSR8kmXjNjjfdIvLYb6BmXPb4//GbeMrpAoLuqCQO4zVtnUf2pkBrdFg2XXX1gKnUwMI1Opgc5wWIvm3JoQwsWZiIq/3Eoyc7f7qyvFchchMy7e+6sublH+IZeLXKspINiw0JMGo7pS30L/lRSA279cTwLXikdHivD8m/P5XJJgFN9o55Jd0VmYAFhK3OOziEq1wEuCiqGnPkEjbK4wCvEd2FjaeOIGiZBX/QxRO+5BVTk017X7DRqIDnHU+bEiuFdltDxtdv0Ma7bjLqvbI3QQsv3tffdu+cYT/wtq8hMvg9mXn4LXJKVW0cEwXiYp1mpPNo7RhOnEOhNT10osq5pf45IV89cHNe1ItbFIKPnnNNCd9wolzfmkEbwyuB4SIA/3dYLF4KEaBgiMOeV2VsVrsQPobXJFiaqZNP9VS5tKEejgYu0E7Vb+cLe8w3uI0Vq9brq1AziooofRVMcEvvopf8uYhyNDVZza1FHMPoEtucAIsD8v2Zh23kF+/2r5Duj+xYYjCd04EjQm/TcB49rkEExiPWfDe0cWAIrvr+uXlfUiFaZxlZapG/07Ey7978LoSuRaYS5TvXnFeHoQCC/WOz8fbFjMYVrAtKA==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(8936002)(83380400001)(54906003)(82310400004)(508600001)(47076005)(4744005)(5660300002)(6916009)(36860700001)(70586007)(6666004)(336012)(426003)(1076003)(2616005)(316002)(70206006)(81166007)(26005)(16526019)(8676002)(186003)(36756003)(40460700003)(356005)(86362001)(2906002)(4326008)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 07:41:17.0030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6adce371-b289-47bd-ce5f-08d9f11fb744
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT011.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0701MB2516
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 07:41:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95330

The upstream ebtables-legacy-save perl script is replaced by a bash
implementation (taken from Fedora). So there's nothing left which
RDEPENDs on perl.

Signed-off-by: Christian Eggers <ceggers@arri.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb b/m=
eta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
index 21e5c1877ef5..fd837629b551 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
@@ -6,7 +6,7 @@ LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D53b4a999993871a28ab1488fdbd2e73=
e"
 SECTION =3D "net"
=20
-RDEPENDS:${PN} +=3D "bash perl"
+RDEPENDS:${PN} +=3D "bash"
=20
 RRECOMMENDS:${PN} +=3D "kernel-module-ebtables \
     "
--=20
2.34.1


