Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484B5C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 17:03:26 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.121])
 by mx.groups.io with SMTP id smtpd.web12.13199.1644512602337066464
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 09:03:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=d4nHvd8a;
 spf=pass (domain: arri.de, ip: 40.107.22.121, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BiAMuCSDt8hyvW+Ewbf/Ek+YOwiTP+Wo+vfDLM/NjhgMCjBBr1ZlnIAWYDmLDwl5im3NpYVgPfemKTvODAK+Y0eXHbT5HmElq+fjeWxtM7CoIldHK3fXz8n6JxhU675x0HXj1SYlLcIyo+xQzj+CUX6On0fyFK8gUZyX6QMnpuOeG3hf3A1REk61tr548ADUz7NaFfAOBZ3YjBCUpuKyrJeOe74hvKLxsyiyUXjo/eLjhPsdi6Pnk66upq4iLQWcAbOCdFP/I5gZ6RUxNLR/cnAMT0iBuLXIVoSU39ZXFJcGTYpAtlwEACKVF9PeW5qdLkSSLBZl2kD7LgHY+npHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFv8fdEHsqPi0BhAl5ZeleVBVxbZ3l4cIgBIaA0WZIM=;
 b=M6H4WGtJD7LBPf05KU7bInpVTy/uy46F3D30RdOdeD68e6Jxm0jV2CjpPzWf96unJYDywHdHL96WRy9RupreoihUFQc8WSCRS3G2YMPKKXi29sTr/81MpSFA/q0JGsyBIpwZRZeKCKsCVTnYeaPsRB3UsZMdunHgPY63sh01LjQlj7a6CzY9ewPmatjs+/k1dSpSP02MBk7BR2yfhY8HoI0C4KyciXxNISBGOO5j0tH7+YX+879mzVOUHNMXk7MKE2m1uzJUEKZvHzLsLk8NDShAGeOBIvKy6NC+ttE284RxcUizbZUWQrTHPWEVvO3GNSv53CcyL6hTQoWoRHJ2Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 52.169.0.179) smtp.rcpttodomain=gmail.com smtp.mailfrom=arri.de;
 dmarc=bestguesspass action=none header.from=arri.de; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFv8fdEHsqPi0BhAl5ZeleVBVxbZ3l4cIgBIaA0WZIM=;
 b=d4nHvd8afzbnvmwk7yzBsyDEbP0XrthFChUHvPeGoYjHe94R6k4ymbcBTd3yE1qUb3D+uFLIrSkyTPHVfOZWSFLqgOrZvLdgXd/ozkNHpw2C80Ybmke75DJNVkqaz/lC4U8TXKtk5kyq8FBUJP9eFxi7SE0SpXHJ6Uz/2tSwdtE=
Received: from AS9PR06CA0010.eurprd06.prod.outlook.com (2603:10a6:20b:462::33)
 by DB9PR07MB7913.eurprd07.prod.outlook.com (2603:10a6:10:2a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.9; Thu, 10 Feb
 2022 17:03:17 +0000
Received: from AM5EUR02FT062.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:462:cafe::49) by AS9PR06CA0010.outlook.office365.com
 (2603:10a6:20b:462::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14 via Frontend
 Transport; Thu, 10 Feb 2022 17:03:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 52.169.0.179)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=arri.de;
Received-SPF: Pass (protection.outlook.com: domain of arri.de designates
 52.169.0.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.169.0.179; helo=eu2.smtp.exclaimer.net;
Received: from eu2.smtp.exclaimer.net (52.169.0.179) by
 AM5EUR02FT062.mail.protection.outlook.com (10.152.9.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 17:03:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.109)
	 by eu2.smtp.exclaimer.net (52.169.0.179) with Exclaimer Signature Manager
	 ESMTP Proxy eu2.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Thu, 10 Feb 2022 17:03:16 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 15302224
X-ExclaimerImprintLatency: 9913859
X-ExclaimerImprintAction: ab773d21b2954823b52d9d43b7aad98d
Content-Type: multipart/related;
	boundary="----_=_NextPart_91b78f01-f739-4f4f-9ecd-e8bafd0da14b"
Received: from AM6P191CA0059.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::36)
 by PAXPR07MB7725.eurprd07.prod.outlook.com (2603:10a6:102:15e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.6; Thu, 10 Feb
 2022 17:03:13 +0000
Received: from VE1EUR02FT033.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::a0) by AM6P191CA0059.outlook.office365.com
 (2603:10a6:209:7f::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 10 Feb 2022 17:03:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT033.mail.protection.outlook.com (10.152.12.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 17:03:13 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Thu, 10 Feb
 2022 18:03:12 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Thu, 10 Feb 2022 18:03:12 +0100
Received: from localhost.de (192.168.54.166) by mta.arri.de (192.168.100.104)
 with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 10 Feb 2022 18:03:12
 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: <ceggers@arri.de>, "Jeremy A. Puhlman" <jpuhlman@mvista.com>, Khem Raj
	<raj.khem@gmail.com>
Subject: [oe][honister][PATCH] cdrkit: remove ${PN} from ${PN}-dev RDEPENDS
Date: Thu, 10 Feb 2022 18:03:02 +0100
Message-ID: <20220210170302.12018-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [192.168.54.166]
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 127651f9-9abc-46f5-2b3f-08d9ecb73b25
X-MS-TrafficTypeDiagnostic: 
	PAXPR07MB7725:EE_|AM5EUR02FT062:EE_|DB9PR07MB7913:EE_
X-Microsoft-Antispam-PRVS: 
	<DB9PR07MB79130A2B8FA109C1AC9AEF83BF2F9@DB9PR07MB7913.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 xc5rpC96i4agFeRLILK7NWHokyXA5C47bJmvSMn48ocf0SYH2L+wE6tdu9l/JMZONbAi0OJB3JBjZrov1UksaVNcBJsnXGo1xhRCpuU8U4gBJ5YtAdLY2Po1/O85ztafVy9Kv9MZtApH/YElGkX1lFEKL3kqO0B9lEPkoGCZlL7eagIZ4gPPtiNmLCSTUzoErgSPenVPt113bUUkxLVQQkxZhdUNNdUIy9d3zqrI8SGiLhN/JNmZV7C/Vg+sX5YcY2tvNoCmDPK9kUICYahtK2xuheFKevvaRV8JPOxnU4pohNsBDhDWIYYaDCmNVqC+00BhSK/IdhRL+E/6nfPjEsXsya7yS1tfAGQ1KVNY7yNAy0ckLCGWFTYoiCkDsVD4IfyeK08j6CdAKJJvfBwzz4DfvtbCFNezGF/XxVxvUj5JlUds369h/S4K8PaKmWuD1tQ2uiekRIYM3hWWxqOmmpgKvcQd7FSDSyaUv6xkU4AB9XmQrSJ0omtAp1F0nYFOz9EelDSgD9h9FFtq0NYW5z0Zoamzrj1YUeJmpB6epvuXzSaXhTOsQXAc4XwzQRsm5j8STLmuJelAyFilCAfnyShe++xMDS9FLmHnLzsI+dfqYNevuM7TuXYISSwSUJfJrJPZfFryLu3/QsvcxIXryHi275p6hT2hZPXkVTNaYVVOc9ehgZJvnFv9njKxi/fhsjddS8SvjqfJZuomwfCGRyqvmSqtUcE8jEpgOWEm4xHxY+pMK89GuGqU6qajN4Pd9HRCVwLja9wY7qkYxF/xs+PCcDXgKieTxmZbe2vSE7A=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(336012)(6916009)(26005)(8936002)(83380400001)(54906003)(316002)(40460700003)(8676002)(4326008)(36756003)(1076003)(86362001)(70206006)(70586007)(5660300002)(16526019)(186003)(2616005)(82310400004)(47076005)(36860700001)(81166007)(508600001)(426003)(6666004)(356005)(2906002)(228453006)(36900700001);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB7725
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR02FT062.eop-EUR02.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	63b98181-d91f-4fc8-957c-08d9ecb7393a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2ifm2paYYYtAaE/cWn/86I+DxEv42glAllsVmaKTo5Ezd7n/cMZOKtgXUxnBAY6aofjz+2zCEsCK/Ih/yX6bOxP4beAU+dljT/x1YKtiIRKlVFhOlQo/pfAT8KKUFIt4n+l6kSxjh9ji5wDioJLJE5TXzLF5ig46yz0gjphJ8g/DRrcxKHXC8iEuqP5tBUeEC2SWHeC6H/rbzAFcH5itZARhmnzEvWzgKl0c8clBJaAiJw5EnITX+VMKX3HteNzdG2hehBxq8vd63VXezzwgLN3XJWRPRSrlYKOn+rnKzP3nU16+NGjcXh6SDvKZHgtzdyuyjw3LL6IEQMCqV2FGFy+723vdNalBrpWiVpoFETk3b28ziXZLJLxqFbXpGo8953JPdp/26OH+4Q64xXxSB76XDEjqRLLNqyuht+jqni//XYngupoHKpIwSz4rhxfMAmCzSggM6W1NF1nmh0d0g/hDkJ1r1u55GcVqKi/XPWbr+aa76dhWFylP5ZlryHxdSLrMI7nl1K7WtKp2VfgvgtOEnjBvzB4RDRk18XaqW/2iAete2OHNdBljXAdgs/pheFIpUPKYSrhEanmMD+fjI00stP4rYvqInuVhMvbTLQfgp7awFRVkH3BlLBeN3W6ixV8+k73m6sr33Hbcjk4RgiIWqD8gnIoJoX9bgax/B+hl0GOWR+jiutI4PMCnPYKNGsBR4tARLln58Gjw7EaE8ZHHCm6RPmYfhJYWXA+m5Pq9VV9jVB3qRjG+GiZfAoqanF2ZmFoTc5r1hemtTh6gynnl8d41XORvEm4YIH4P9e1qmM3P4RU25xsnqvVVI4g9
X-Forefront-Antispam-Report: 
	CIP:52.169.0.179;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu2.smtp.exclaimer.net;PTR:eu2.smtp.exclaimer.net;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(4326008)(8676002)(1076003)(8936002)(7636003)(70586007)(15974865002)(86362001)(7596003)(36756003)(7066003)(508600001)(33964004)(70206006)(54906003)(166002)(82310400004)(40460700003)(36860700001)(16526019)(426003)(47076005)(83380400001)(186003)(26005)(2616005)(6916009)(2906002)(6666004)(5660300002)(336012)(316002)(228453006);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 17:03:15.3383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 127651f9-9abc-46f5-2b3f-08d9ecb73b25
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[52.169.0.179];Helo=[eu2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR02FT062.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB7913
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Feb 2022 17:03:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95291

This is a multi-part message in MIME format.

------_=_NextPart_91b78f01-f739-4f4f-9ecd-e8bafd0da14b
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_b0c51fb0-8138-4f8b-a074-5a901aff39ee"

------_=_NextPart_b0c51fb0-8138-4f8b-a074-5a901aff39ee
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>

If you add -dev packages to an image, as in an
sdk, ${PN}-dev is pulled in, which depends on ${PN}
which no longer exists in the new package layout.

Error:
 Problem: conflicting requests
  - nothing provides cdrkit =3D 1.1.11-r0.1 needed by cdrkit-dev-1.1.11-r0.=
1.corei7_64
(try to add '--skip-broken' to skip uninstallable packages)

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/r=
ecipes-multimedia/cdrkit/cdrkit_1.1.11.bb
index c89204062eac..e9841e483e8f 100644
--- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
@@ -23,6 +23,8 @@ inherit cmake
 DEPENDS =3D "libcap file bzip2"
 RDEPENDS:dirsplit =3D "perl"
 
+RDEPENDS:${PN}-dev =3D ""
+
 PACKAGES =3D+ "dirsplit genisoimage icedax wodim"
 
 FILES:dirsplit =3D " \
-- 
2.34.1


_______________________________________________________
Christian 
Eggers
Software Engineer
=E2=80=8B
ARRI
Arnold & Richter Cine Technik GmbH & Co. Betriebs KG 
Arriweg 17, 
83071 
Stephanskirchen
www.arri.com 

+49 8036 3009-3118
CEggers@arri.de

=E2=80=8B
Get all the latest information from www.arri.com, Facebook, Twitter, Instag=
ram and YouTube.

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRA 57918
Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik Gmb=
H
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRB 54477
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Neuh=C3=A4user; Stephan Schenk; Walt=
er Trauninger; Markus Zeiler

=E2=80=8B

------_=_NextPart_b0c51fb0-8138-4f8b-a074-5a901aff39ee
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8" /></head><body><div>From: &quot;Jeremy A. Puhlman&quot; &lt;jpuhl=
man@mvista.com&gt;<br /><br />If you add -dev packages to an image, as in a=
n<br />sdk, ${PN}-dev is pulled in, which depends on ${PN}<br />which no lo=
nger exists in the new package layout.<br /><br />Error:<br /> Problem: con=
flicting requests<br />  - nothing provides cdrkit =3D 1.1.11-r0.1 needed b=
y cdrkit-dev-1.1.11-r0.1.corei7_64<br />(try to add &#39;--skip-broken&#39;=
 to skip uninstallable packages)<br /><br />Signed-off-by: Jeremy A. Puhlma=
n &lt;jpuhlman@mvista.com&gt;<br />Signed-off-by: Khem Raj &lt;raj.khem@gma=
il.com&gt;<br />---<br /> meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.b=
b | 2 ++<br /> 1 file changed, 2 insertions(+)<br /><br />diff --git a/meta=
-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/recipes-multimedia=
/cdrkit/cdrkit_1.1.11.bb<br />index c89204062eac..e9841e483e8f 100644<br />=
--- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb<br />+++ b/meta-oe=
/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb<br />@@ -23,6 +23,8 @@ inherit =
cmake<br /> DEPENDS =3D &quot;libcap file bzip2&quot;<br /> RDEPENDS:dirspl=
it =3D &quot;perl&quot;<br /> <br />+RDEPENDS:${PN}-dev =3D &quot;&quot;<br=
 />+<br /> PACKAGES =3D+ &quot;dirsplit genisoimage icedax wodim&quot;<br /=
> <br /> FILES:dirsplit =3D &quot; \<br />-- <br />2.34.1<br /><br /></div>=
<div dir=3D"ltr" style=3D"mso-line-height-rule:exactly;-webkit-text-size-ad=
just:100%;direction:ltr;"><table cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"width:100%;"><tr style=3D"font-size:0;"><td align=3D"left" =
style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" bo=
rder=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:0;"><td align=3D"l=
eft" style=3D"padding:0;vertical-align:top;"><table cellpadding=3D"0" cells=
pacing=3D"0" border=3D"0" style=3D"width:100%;font-size:0;"><tr style=3D"fo=
nt-size:14.67px;color:#7F7F7F;font-style:normal;font-weight:400;white-space=
:nowrap;"><td align=3D"left" style=3D"vertical-align:top;font-family:Calibr=
i,Arial,sans-serif;">______________________________________________________=
_<span style=3D"font-family:remialcxesans;font-size:1px;color:#FFFFFF;line-=
height:1px;">&#8203;</span></td></tr><tr style=3D"font-size:0;"><td align=
=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacin=
g=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:0;"><td =
align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cells=
pacing=3D"0" border=3D"0" style=3D"font-size:0;color:#7F7F7F;font-style:nor=
mal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size:14.67px;"><=
td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,san=
s-serif;">Christian</td><td align=3D"left" style=3D"vertical-align:top;colo=
r:#000001;font-family:Calibri,Arial,sans-serif;">&nbsp;<br /></td><td align=
=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;=
">Eggers</td></tr></table></td></tr><tr style=3D"font-size:0;"><td align=
=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacin=
g=3D"0" border=3D"0" style=3D"font-size:0;color:#7F7F7F;font-style:normal;f=
ont-weight:400;white-space:nowrap;"><tr style=3D"font-size:14.67px;"><td al=
ign=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-ser=
if;">Software&nbsp;Engineer</td></tr><tr style=3D"font-size:14.67px;color:#=
000001;"><td align=3D"left" style=3D"vertical-align:top;font-family:Calibri=
,Arial,sans-serif;">&#8203;</td></tr></table></td></tr></table></td></tr><t=
r style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><=
table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0=
;"><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:to=
p;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-s=
ize:0;color:#0E50AD;font-style:normal;font-weight:400;white-space:nowrap;">=
<tr style=3D"font-size:13.33px;"><td align=3D"left" style=3D"vertical-align=
:top;font-family:&#39;Arial Black&#39;;">ARRI</td></tr><tr style=3D"font-si=
ze:10.67px;color:#7F7F7F;"><td align=3D"left" style=3D"vertical-align:top;f=
ont-family:Arial;"><span style=3D"font-size:11px;">Arnold&nbsp;&amp;&nbsp;R=
ichter&nbsp;Cine&nbsp;Technik&nbsp;GmbH&nbsp;&amp;&nbsp;Co.&nbsp;Betriebs&n=
bsp;KG</span>&nbsp;<br /></td></tr></table></td></tr><tr style=3D"font-size=
:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=
=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#7F7F7F;fo=
nt-style:normal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size=
:10.67px;"><td align=3D"left" style=3D"vertical-align:top;font-family:Arial=
;">Arriweg&nbsp;17</td><td align=3D"left" style=3D"vertical-align:top;font-=
family:Arial;">,&nbsp;<br /></td><td align=3D"left" style=3D"vertical-align=
:middle;font-family:Arial;">83071</td><td align=3D"left" style=3D"vertical-=
align:middle;font-family:Arial;">&nbsp;<br /></td><td align=3D"left" style=
=3D"vertical-align:middle;font-family:Arial;">Stephanskirchen</td></tr></ta=
ble></td></tr></table></td></tr><tr style=3D"font-size:0;"><td align=3D"lef=
t" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0"=
 border=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:0;"><td align=
=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacin=
g=3D"0" border=3D"0" style=3D"font-size:0;color:#1532B9;font-style:normal;f=
ont-weight:400;white-space:nowrap;"><tr style=3D"font-size:11px;"><td align=
=3D"left" style=3D"vertical-align:top;font-family:Arial;"><span style=3D"te=
xt-decoration:underline;"><a href=3D"http://www.arri.com/" target=3D"_blank=
" id=3D"LPlnk689713" style=3D"text-decoration:underline;color:#1532B9;"><st=
rong style=3D"font-weight:400;">www.arri.com&nbsp;<br /><br /></strong></a>=
</span></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"ver=
tical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" s=
tyle=3D"font-size:0;color:#858080;font-style:normal;font-weight:400;line-he=
ight:normal;white-space:nowrap;"><tr style=3D"font-size:14.67px;"><td align=
=3D"left" style=3D"padding:0;vertical-align:top;font-size:0;"><img src=3D"c=
id:image177872.png@86E503D1.7D1DC86B" width=3D"20" border=3D"0" alt=3D"" st=
yle=3D"width:20px;min-width:20px;max-width:20px;font-size:0;" /></td><td al=
ign=3D"left" style=3D"padding:0;vertical-align:top;font-family:Calibri,Aria=
l,sans-serif;"><a href=3D"tel:+49%208036%203009-3118" target=3D"_blank" id=
=3D"LPlnk689713" style=3D"text-decoration:none;color:#858080;"><strong styl=
e=3D"font-weight:400;">+49&nbsp;8036&nbsp;3009-3118</strong></a></td></tr><=
tr style=3D"font-size:0;"><td align=3D"left" style=3D"padding:0;vertical-al=
ign:top;"></td><td align=3D"left" style=3D"padding:0;vertical-align:top;"><=
/td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"padding:0;v=
ertical-align:top;"></td><td align=3D"left" style=3D"padding:0;vertical-ali=
gn:top;"></td></tr><tr style=3D"font-size:14.67px;"><td align=3D"left" styl=
e=3D"padding:0;vertical-align:top;font-size:0;"><img src=3D"cid:image442272=
=2Epng@2D17C44A.1979DC01" width=3D"20" border=3D"0" alt=3D"" style=3D"width=
:20px;min-width:20px;max-width:20px;font-size:0;" /></td><td align=3D"left"=
 style=3D"padding:0;vertical-align:top;font-family:Calibri,Arial,sans-serif=
;"><a href=3D"mailto:CEggers@arri.de" target=3D"_blank" id=3D"LPlnk689713" =
style=3D"text-decoration:none;color:#858080;"><strong style=3D"font-weight:=
400;">CEggers@arri.de</strong></a></td></tr></table></td></tr></table></td>=
</tr></table></td></tr><tr style=3D"font-size:14.67px;color:#000001;font-st=
yle:normal;font-weight:400;white-space:nowrap;"><td align=3D"left" style=
=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;"><br />&#8203;=
</td></tr></table></td></tr><tr style=3D"font-size:0;line-height:normal;"><=
td align=3D"left" style=3D"padding:0;vertical-align:top;"><a href=3D"https:=
//www.arri.com/en/lighting/led/orbiter-accessories/orbiter-dockingring/" ta=
rget=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:none;"><img src=
=3D"https://assets.arri.com/media/sign/2022_Orbiter_Docking-Ring_E-mail-Sig=
nature_650x95.jpg" border=3D"0" title=3D"Orbiter Docking Ring" alt=3D"Orbit=
er Docking Ring" style=3D"font-size:12px;" /></a></td></tr><tr style=3D"fon=
t-size:13px;color:#7F7F7F;font-style:normal;font-weight:400;white-space:now=
rap;"><td align=3D"left" style=3D"padding:0;vertical-align:top;font-family:=
Calibri,Arial,sans-serif;">Get&nbsp;all&nbsp;the&nbsp;latest&nbsp;informati=
on&nbsp;from&nbsp;<span style=3D"text-decoration:underline;"><a href=3D"htt=
p://www.arri.com/" target=3D"_blank" id=3D"LPlnk689713" title=3D"www.arri.c=
om" style=3D"text-decoration:underline;color:#7F7F7F;"><strong style=3D"fon=
t-weight:400;">www.arri.com</strong></a></span>,&nbsp;<span style=3D"text-d=
ecoration:underline;"><a href=3D"https://www.facebook.com/TeamARRI" target=
=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:underline;color:#7F=
7F7F;"><strong style=3D"font-weight:400;">Facebook</strong></a></span>,&nbs=
p;<span style=3D"text-decoration:underline;"><a href=3D"https://twitter.com=
/ARRIChannel" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration=
:underline;color:#7F7F7F;"><strong style=3D"font-weight:400;">Twitter</stro=
ng></a></span>,&nbsp;<span style=3D"text-decoration:underline;"><a href=3D"=
http://instagram.com/arri" target=3D"_blank" id=3D"LPlnk689713" style=3D"te=
xt-decoration:underline;color:#7F7F7F;"><strong style=3D"font-weight:400;">=
Instagram</strong></a></span>&nbsp;and&nbsp;<span style=3D"text-decoration:=
underline;"><a href=3D"http://www.youtube.com/user/ARRIChannel" target=3D"_=
blank" id=3D"LPlnk689713" style=3D"text-decoration:underline;color:#7F7F7F;=
"><strong style=3D"font-weight:400;">YouTube</strong></a></span>.<br /></td=
></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"padding:0;vert=
ical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" st=
yle=3D"font-size:0;color:#6A6A6A;font-style:normal;font-weight:400;white-sp=
ace:nowrap;"><tr style=3D"font-size:10px;"><td align=3D"left" style=3D"vert=
ical-align:top;font-family:Arial;"><br />Arnold&nbsp;&amp;&nbsp;Richter&nbs=
p;Cine&nbsp;Technik&nbsp;GmbH&nbsp;&amp;&nbsp;Co.&nbsp;Betriebs&nbsp;KG<br =
/>Sitz:&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Registergericht:&nbsp;Amtsger=
icht&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Handelsregisternummer:&nbsp;HRA&=
nbsp;57918<br />Pers&#246;nlich&nbsp;haftender&nbsp;Gesellschafter:&nbsp;Ar=
nold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH<br />Sitz:&nb=
sp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Registergericht:&nbsp;Amtsgericht&nbsp;=
M&#252;nchen&nbsp;=E2=80=91&nbsp;Handelsregisternummer:&nbsp;HRB&nbsp;54477=
<br />Gesch&#228;ftsf&#252;hrer:&nbsp;Dr.&nbsp;Michael&nbsp;Neuh&#228;user;=
&nbsp;Stephan&nbsp;Schenk;&nbsp;Walter&nbsp;Trauninger;&nbsp;Markus&nbsp;Ze=
iler<br /></td></tr><tr style=3D"font-size:14.67px;color:#000001;"><td alig=
n=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif=
;"><br />&#8203;<br /></td></tr></table></td></tr></table></td></tr></table=
></div></body></html>
------_=_NextPart_b0c51fb0-8138-4f8b-a074-5a901aff39ee--

------_=_NextPart_91b78f01-f739-4f4f-9ecd-e8bafd0da14b
Content-Type: image/png;
	name="image177872.png"
Content-Transfer-Encoding: base64
Content-ID: <image177872.png@86E503D1.7D1DC86B>
Content-Description: image177872.png
Content-Disposition: inline;
	creation-date="Thu, 10 Feb 2022 17:03:16 +0000";
	filename=image177872.png;
	modification-date="Thu, 10 Feb 2022 17:03:16 +0000";
	size=528

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGlSURBVDhP1ZOxSgNBEIZ3o6QSSWGRwiJFCl9A
iCDEIqKFgo2FYGHjA1hYRZ0sGrURgq0WgkoqEUHQShJMYWFhmcLCwsIHsJBEs/5zmTvvJIE9sPGD
Zf7Zu/tvdndW/TVaogcRDSWVKlilMhvGVGQ6FoEhzAaTWt9AFji31q7C9Jh1HBISFSpbQPDMGK31
NlcsqTOBIRxmRPmkUTGJdubHUKmsxDA5ic6EDV8k+jRa1i6KdiYw/LL2QiTzDrNpY8yb5M4EhlvG
XKNdniXl9pkTHYvwkrlXDkTxIR3tEWUkcyZi2FbqBOGxm6lUR+tT7k/JnYgYYs8+sHfzkP7eTaJ1
LmGaktyjTDSGsSxphMjV89khyqGx7yG96rC3r7g5S5vGNHaJsrb7LI3RwPw6btQDv8f0NGRwTWYT
Wlch/eo+Mc5gPoWPfu9tpVgqrbGIHkoIVHOLQ5qAQVOmuNqVHma8guDK9jVkisY029aOQ/JhcYU9
wbLPRaoBiX2p1+utu1rtqpDPV9FKHVQziiqH5fETzMr40yHe68hcfPaJRnHyI5L+K5T6BsZ9gKi6
xb3hAAAAAElFTkSuQmCC

------_=_NextPart_91b78f01-f739-4f4f-9ecd-e8bafd0da14b
Content-Type: image/png;
	name="image442272.png"
Content-Transfer-Encoding: base64
Content-ID: <image442272.png@2D17C44A.1979DC01>
Content-Description: image442272.png
Content-Disposition: inline;
	creation-date="Thu, 10 Feb 2022 17:03:16 +0000";
	filename=image442272.png;
	modification-date="Thu, 10 Feb 2022 17:03:16 +0000";
	size=824

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALNSURBVDhPtZQ/SNVRFMfv1Z/S4PCGBoeg1Uih
oaFB8j1wMGgweBJBgUNRUQ2BQaH2e79SaKipwcGhlkioQEiooT++7RUOBkYODg0GgiIOLyi1bp/v
/d3fL8U31hfuO/ec3z3nfM895z7zr2GDbIg4jgutxvQ6Yw5IRy5uGzOfJMmKP9AADQMSaH+LtQ/5
WEaNUutfEHj5t3OXbyfJTDDl2BNwPI7LxtoJthFOD5A1WM0hf7QY04FDB98vohdZjzeduwbjOnuP
piA9QrBnMJjl4KHRJBmD3hJlF5HdW8Z8HU6SqeFKpeScu4BLmUoepd4pcoYqs9XaLwo2UqkMoEfo
YjrIysreNs6dI+kk515b516wf4ptgETPdSBnqDtDRFuUIJ1g0s/jOE3pJ7TQZ30AY9pg4tmyn8E2
AYE29mlmdVMNwInrSFbG4vgq5kvY7lHeLZ0ROFcj0SrbCFYfZNM9N1n7XveLOucZajQQCl6TTsYr
MFv66dyo1wNItoFQg4QF/dAwL0GnfnxAnP2cqZu6S3WSD1MEwLQbnFVpdcpdlM6ZNcSatfaw9Cyg
2Ml5G7bd3ubcJ8md0D2RTEzmU0uOPLEPyM8yIiLqEYIXZMtY7wTJhsI2K1tJ2hHtEPgs3QfcVPdS
HGP5UijhtGSGO3F8EuOw9pmzGNOkSbYbkHkjGxWkGK9UXsGqk7Hp4tBLTN3oU2RcQvahH0VO49DP
XgxF4iyr8Is5zJ6hZyg08TY5XCDY3WbnzgTnMnKEz5FeBgN/ijG5gW1fSKLh7tr5pnOGguaPUjXQ
93l6GhlddlsYl13gmfZzVTXNbTB5NAfp8a5a/Vjq6flO0JsM6yD3sspaf1utruu77qy3WDzeWyo9
4T6HKO8bPunsBuximIHs+kfRo1eThA1KrHM46/w8pV/nzyNrZo6GATNwBRqjPtgeRK2H7i6MJEk+
Nv8ZxvwBPgIhrepF7fMAAAAASUVORK5CYII=

------_=_NextPart_91b78f01-f739-4f4f-9ecd-e8bafd0da14b--

