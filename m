Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E25C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 17:30:23 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.94])
 by mx.groups.io with SMTP id smtpd.web09.1599.1645464620244060997
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 09:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=Ai4LdJSa;
 spf=pass (domain: arri.de, ip: 40.107.8.94, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YnDqxtxHPc9QCC93VxSE4rsAZTkQEeFwRe0aRgBtAsBq7ifu2oOR8UeqoR7zMvafuSo1Rl1+aAwtt4TXQk/rnWpNNr5MATE3kpMXP6ziO7Tr6uP2AsG7JHbyEez1e25XFQRz4Sr9wpZooMVcJBbj0/UASoHK0YJXFsn3qnus9UHItLpRtGU+rghcCOF3UYTXZnv6nRIcuCnwqc+U49fC4yd4PctSLouCa3RRSHLhIIAee0GnFxUmmPMJ2b3Ur8F6B6jNqDPc5PvOqkvwFDXCFnq6gj4WJI6rc8+oAgCFykKBz4yNq/RExZK5x5eO+obUEXy1w8fI3rg97v93Gvnumw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIJJ8pwLxAM45u9AMBGAa4g0445NLGiT31eOSN1ek54=;
 b=LyAjQ4w27DHFbsdX60+3uaTpsAwgS+RlJs1hwbL+EFY0NhV61aFckEB/XwesEhfSQ7jDW0i6oi6f/ZR0n+fSYi7s0vhP7wyJyd+4Boqs3lpIegN/x5nS1LYIwAryu8i94AA3JypR239kJiHBdeLJYlV//oRX1tDhtA5tF6PC+TnzGOptg1FMd9vi1D+rL0WH6mSxMqhhzMYDTnHCrjb/gwIbWzPWw0+ePDzmdcLrdnXkL33DTGOLCK3NriBaSAdN0x/Cy4srAZoivb9j7O5FGFuOwXkgVg9bn3xkD6ySwmqfKxQgxHkFZV6BGGK6dVRFR/9q4cy13+AEy4xV4NMJIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIJJ8pwLxAM45u9AMBGAa4g0445NLGiT31eOSN1ek54=;
 b=Ai4LdJSas4Fl3tdBgei4rxQCj3zb2Y8RdiDEYMSIRL68rqYbDsYQVNlVGwBAdRsN0TOe1BV6InqX4yltQJuw8FdLcqj7+5aTB6XUC/zIjVxrq80uPFzAKxzFroclGMIJ12SJNTfF2GyyOPKZYUqG5F+nkr8Z7BT/DUuRvJA2Ws4=
Received: from OL1P279CA0022.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:13::9) by
 DB6PR0701MB2261.eurprd07.prod.outlook.com (2603:10a6:4:4a::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.21; Mon, 21 Feb 2022 17:30:16 +0000
Received: from HE1EUR02FT038.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:e10:13:cafe::68) by OL1P279CA0022.outlook.office365.com
 (2603:10a6:e10:13::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Mon, 21 Feb 2022 17:30:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 HE1EUR02FT038.mail.protection.outlook.com (10.152.11.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.20 via Frontend Transport; Mon, 21 Feb 2022 17:30:14 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 21 Feb
 2022 18:30:14 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Mon, 21 Feb 2022 18:30:14 +0100
Received: from localhost.de (192.168.54.110) by exmta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 21 Feb
 2022 18:30:14 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH] graphviz: added PACKAGECONFIG for librsvg
Date: Mon, 21 Feb 2022 18:29:47 +0100
Message-ID: <20220221172947.17173-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.110]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fec1040b-f539-4455-bf9a-08d9f55fd25f
X-MS-TrafficTypeDiagnostic: DB6PR0701MB2261:EE_
X-Microsoft-Antispam-PRVS: 
	<DB6PR0701MB22613DA8062AE6CA54CED829BF3A9@DB6PR0701MB2261.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vstTLicuVnZ5otm4JHaJEBTbTWriqzEMQIOWIXY8n/O6FKxHl4trFGZ969IRF+KAJ6BhZaR15wgR2x2w3npuGRJ6Xj8/JY1A90CTU/mPNRMSZ+FBjl+8VVrL9toJ6vwtmgFHfdwQkOVBIrppFszbOlx9Zmy2+EEN0dJ1eQpJ6uTdWlugmAG9AD6MUuDcVucvZt3uBwfyOR3aqFpLNyVo9lb2UGWS4qRup7Td24PHUvflaNTo1z0eSQ8prBbQKq5mX8PCPLuYs8osV8sJbaPWf2kWjWu5V55bpXnrwf1YE/FBfVmT14qQEuBFH9JBdvM8W3e3b1aku+1JxoIubnvzHCyY869wQl8KZivPNivxL56WcGeistMVnPXW7nbkTzDFUYrNfPyQu1gF9VAYi+yKM3SRhwbKSCwhH5catOfJ5PwrOTX9OJ+v7bduqVsCnbEQ3BBDZ1bJq1lE1iDNdj7kg/WC5wS/3RnD8lCv82w8jzoSRPHXG0lo4LegKpBkz0FepRf2RdTV7PfX+4mh9ekq4j6MwoK+Q/DGwDV0x2kB721gZe/RpM8YKC1NDDwc4QxKICsa/Dm+0WbMI52NdY/TTTv3rZErLtwtDNh3LC8mpE0737FmFBQsOSuHDr5ZxRi1EkvAd8XEMkFNyO0SemB5U6LNMVab9hZ8Vv2bSI1ZIbAv0TMsCgZ1/E9cyXdyW3ZG5Iy/TU2NkBE0pN59SbPVMDYgxCaaYq4Fi6R0g5p2v2AfS1x2KqZFeSW0YBIjIfZi67CzQqxU+W5aQJ4FM2fVvA==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(4326008)(47076005)(426003)(336012)(83380400001)(36756003)(5660300002)(2906002)(8936002)(107886003)(1076003)(966005)(2616005)(16526019)(186003)(26005)(70206006)(70586007)(356005)(81166007)(8676002)(6666004)(86362001)(6916009)(316002)(508600001)(82310400004)(36860700001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 17:30:14.9199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fec1040b-f539-4455-bf9a-08d9f55fd25f
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR02FT038.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0701MB2261
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 17:30:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95420

nativesdk-librsvg is not available anymore ([2], transition to Rust).
According to [2], graphviz can be used fine (even with svg images)
without librsvg.

[1] oe-core: 67dd505c42 ("librsvg: do not enable nativesdk")
[2] https://www.linuxfromscratch.org/blfs/view/cvs/general/graphviz.html

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb b/meta-oe=
/recipes-graphics/graphviz/graphviz_2.44.1.bb
index 203e0206fbfe..ff9939ebd02a 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb
@@ -9,7 +9,6 @@ DEPENDS =3D " \
     groff-native \
     libtool \
     gdk-pixbuf \
-    librsvg \
     cairo \
     pango \
     expat \
@@ -34,6 +33,10 @@ SRC_URI:append:class-nativesdk =3D "\
 "
 SRC_URI[sha256sum] =3D "8e1b34763254935243ccdb83c6ce108f531876d7a5dfd443f2=
55e6418b8ea313"
=20
+PACKAGECONFIG ??=3D "librsvg"
+PACKAGECONFIG:class-nativesdk ??=3D ""
+PACKAGECONFIG[librsvg] =3D "--with-librsvg,--without-librsvg,librsvg"
+
 EXTRA_OECONF:append =3D " PS2PDF=3D/bin/echo"
=20
 EXTRA_OECONF:class-target =3D "\
--=20
2.34.1


