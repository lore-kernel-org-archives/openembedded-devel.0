Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B892C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 08:17:25 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.126])
 by mx.groups.io with SMTP id smtpd.web12.9398.1644999441912151463
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 00:17:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=eP9vtnrN;
 spf=pass (domain: arri.de, ip: 40.107.21.126, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OX+avDs4uhtYff4uCpRJVzPGP/h6vGaCTywe/nlQWHjoNMg/nhKqTKeRN/IqkxleGm8Ag5lf5RHPa3qKOpuAMRNpbZzwd7+asCrcLH6Nc23RvGgCyD4irUiNDhrk1Lt06BoAQA+kzOOGdV7SHSJQ0S4iw2xuTHmBHaUa7TvF2WBm0b7Nll2BBJvxeMNLmWybrarlf1m9zJPnTnGwT3tFZCeEKSueD8qJqJpHN9+kIDhpRMIZpbv0s+1XtYgtP0j/KlRDTwR/2YgyotJ9DoUL6dlQg4roPY7lDX3EUDzuhPJT6B3npUFMuRqtq5Db4q2V6hUkTn+iIodli/Yr0kRDMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/EH2UDjDLlSR7upJQwOKU7Q5hBjRRipltGpIT1Um4M=;
 b=DFN7Yj/k22x5UQSZEtCHo4h7B/iWPFs9xohRsGQ5tDABsYHjBmAMFrUtYwe9JRIKUJFIU/QHcKPPS5pEqSTOctllbhUiKAZ5imKaA4alFGJYzZcposvS0l/GC+mhoPHqck3IXSz7NWqgFjlpK0Yacqtl0ftZb4rTgh57PP2VL58AOG6s5pQZITy0iCq2yEn83BrGosXrLmlT1ueuIu3TOp0LwDUZ2fYoigFDMc/ZFzh3dwQR5j7QxyzG7rqYtyl7S8aOvNyZviKYhgeR7BaYCuGZiape7hY+X8iwFWOj8ti9FobGuIq3OeDlz8c/xEaQKvZqNX0vxfenJ+guFg8XRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 217.111.95.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/EH2UDjDLlSR7upJQwOKU7Q5hBjRRipltGpIT1Um4M=;
 b=eP9vtnrNK57nzdcS2mF30e7w6sFtPfRH3dQ2ymgo+2FMCRmKl6QGU31YcVpk/eHsPClilMd2WVh3DxRkxEZAvos6Z0VPhYzJXxGmYPNi+8BBovwRzcOiYJz/slEeivqYNDD92D8B0+LVodx476fcqhEbodbO3oCHtftYfLKmCJo=
Received: from SV0P279CA0063.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:14::14)
 by AM0PR07MB4403.eurprd07.prod.outlook.com (2603:10a6:208:b5::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.8; Wed, 16 Feb
 2022 08:17:17 +0000
Received: from HE1EUR02FT061.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:f10:14:cafe::d1) by SV0P279CA0063.outlook.office365.com
 (2603:10a6:f10:14::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15 via Frontend
 Transport; Wed, 16 Feb 2022 08:17:17 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 217.111.95.7) smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arri.de: DNS Timeout)
Received: from mta.arri.de (217.111.95.7) by
 HE1EUR02FT061.mail.protection.outlook.com (10.152.11.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 08:17:16 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Wed, 16 Feb
 2022 09:17:16 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Wed, 16 Feb 2022 09:17:16 +0100
Received: from localhost.de (192.168.54.102) by mta.arri.de (192.168.100.104)
 with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 16 Feb 2022 09:17:15
 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>, Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][hardknott][PATCH] ebtables: remove perl from
 RDEPENDS
Date: Wed, 16 Feb 2022 09:17:07 +0100
Message-ID: <20220216081707.16184-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.102]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cb48aba-170f-4f54-b73c-08d9f124be8d
X-MS-TrafficTypeDiagnostic: AM0PR07MB4403:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR07MB440374062743F0B7AD046A2CBF359@AM0PR07MB4403.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:478;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Nkil3GGzythDQe+b4dhLdplL2mw6gA6sqGigFpX6IR9P9f/JNu3x3nA4/nL7apKmZIvJlRABeWepRVB6Zbdgf6a5Z47NOt44MOwCr0FLbw3FXruRpPq9RpR6UGng3/Pmg+LYpCxmc/J3BIm3T06t8TxlUvwppq7L4VfqvaHKZ0MdIFYip0iSFKJ5zgOCGnuoFUzTyMbUuEWF5Zhw+Yb6XeOOAo+48xh8dRChAZ3W7JAJRM1zruSaCNRntKUVjUVri3qKiyL3Tdy9YYoUD1xB/GKbd9FFlA2fZiVF7QKcCr+nd4S0fs8Wwe6m37QG1apP/uC9x+t8kV7gWEE7JROGbEje1MGxAOFTsIxprKGy8wvFmlxCU+3Sz3JFn/6s1w2bbgyP+8P80/rc6hhQJ4s7b7ZajHdBe2NLb7q9grj9ShGvu6mcvEAQjX8qlx5lPGSp4tXH5Q4RQfgT1P7342BbykqHYZmbl57NTZQZjHrM0ReVdI2Hg8fgIdE7yNlmcbEsqTmXeCGN8i+ZPXS3wJX/+bZg3AXP9cGrjPJ4aPrhaC8DqB5yaP4ln9iN9vh8ha4hiGI3Pz1HVTiEuzAoLKILcCmqXEVl8v597b+9vo6oc4o5sN6LuHt3R9FcN98k3XgvOo027/nRM28FLr39I4L7bY021ChQ4fc/c6bvSAsw5I3gIbwQ7eZo7HHiu9Po9ejdVK8Gfy6UaN7vN/G2XhgCFA==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(26005)(83380400001)(508600001)(86362001)(2616005)(63350400001)(36756003)(40460700003)(1076003)(82310400004)(54906003)(316002)(186003)(6916009)(426003)(70586007)(336012)(70206006)(4326008)(81166007)(4744005)(16526019)(5660300002)(6666004)(47076005)(8936002)(2906002)(36860700001)(8676002)(356005)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 08:17:16.6927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7cb48aba-170f-4f54-b73c-08d9f124be8d
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR02FT061.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB4403
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 08:17:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95332

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
index bc33c18c0b67..7b8027259f00 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
@@ -6,7 +6,7 @@ LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D53b4a999993871a28ab1488fdbd2e73=
e"
 SECTION =3D "net"
=20
-RDEPENDS_${PN} +=3D "bash perl"
+RDEPENDS_${PN} +=3D "bash"
=20
 RRECOMMENDS_${PN} +=3D "kernel-module-ebtables \
     "
--=20
2.34.1


