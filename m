Return-Path: <d.schultz@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A073DCA0EE4
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 22:51:05 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.116])
 by mx.groups.io with SMTP id smtpd.web10.35277.1755211863116545815
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 15:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=nN8KKpHF;
 spf=pass (domain: phytec.de, ip: 40.107.21.116, mailfrom: d.schultz@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oj4myYEHEVQzp7jH5hLsN3y5S1cKzfKaDEGXa16vBrFT3ucCKzENrBNR5wgkBhWcsOm4JRYH1Ijro81k5eVtS+k5wAQUsABNvUjZynLT87nuivxxh7Bne7Qej17tgW3PT8hFmtTkr8sI+S/z6qD45jXEhiFSXWdScK5qrbn+IIFfbPPfSFqwhJ0vOfo+n/vqQxQG5QoN3yA98GzWDvVnr4sA7+ZOY+5ClFLgQD5aafWe6aYKrRSgqWg0G5r1w0QJTKRog1XkmghxJQA+vQg6fWvzQYGG9mw6br46GNn+W4tAZDvnDftbGaDmodPSM7wT2CnecGtbK/F+U5D14ril4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvvARONIQQcnc2NcPl1B2cWC34JAhVK4bdIU6JVIfnk=;
 b=AbhxtUmZD/vRyim9ui1sL2JuyGgtSL+2JpI4NhioJg2z+81T4G6C9yYeolDGrpSg++gTh/TFncObQrmj8Ud4uxT2ePsa7+oyt8tJ9Nb+M+1E/LmOpDWmcIWWl7qvmluPehxCEpbeRp6ec8uebf1rNordzrvHAowdBMHgDGTijIfcq43ptqoa8/SpzgkS2gee9EJcCeDvk4k1yOdcb3V0mAu7J5PATkV7/GWFn7B54MBiYSzlouxaahGuNEqjAQuTJkIyxpeoJgpPpys/GFUxQjz9jAZcTlKFTe8T23jVk9lP7stI34d0spRC3LscORC25TA4rW1cbbkf1xNGKJFZug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvvARONIQQcnc2NcPl1B2cWC34JAhVK4bdIU6JVIfnk=;
 b=nN8KKpHFXPloZKX8xB7VDYmaPpXZDK0d6FN2BDT+O62WGQE69ioFRmqG1RWFqIP4sKZ2W4tYZCwrtJ9TC/oBef63UHRFP47iDu1QYbNcnmRJQC1srE/eRryQvduRsqLNTJFQ1+Tmom8XCSMa5LSLPqn+L6/xmGcTDXDUJbB9Pvw22A2CXXaF3xAhClheV4KeAMsbYzuonzRI3eZL7XeDt00fFyHOURp45YhLpNsHsAiolNNwNGJIvpTgSpBOnHMWo9lGqDsncAeY/+DHfkdlILVcOB+eoMpVYfVDspJh0DAiAIZSkMcLsnzmo+hEtyaBIj/NpHyLSQ66NRN60J5lFA==
Received: from AM0PR05CA0082.eurprd05.prod.outlook.com (2603:10a6:208:136::22)
 by PAXP195MB1328.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:1a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 22:50:57 +0000
Received: from AMS0EPF0000019A.eurprd05.prod.outlook.com
 (2603:10a6:208:136:cafe::78) by AM0PR05CA0082.outlook.office365.com
 (2603:10a6:208:136::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.15 via Frontend Transport; Thu,
 14 Aug 2025 22:50:57 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS0EPF0000019A.mail.protection.outlook.com (10.167.16.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Thu, 14 Aug 2025 22:50:57 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 15 Aug
 2025 00:50:56 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 15 Aug
 2025 00:50:55 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
CC: <upstream@lists.phytec.de>, Daniel Schultz <d.schultz@phytec.de>
Subject: [meta-networking][PATCH] meta-networking: mbedtls: Remove tag from SRC_URI
Date: Thu, 14 Aug 2025 15:50:42 -0700
Message-ID: <20250814225042.3310913-1-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019A:EE_|PAXP195MB1328:EE_
X-MS-Office365-Filtering-Correlation-Id: c4e2c5c0-b67f-4301-8fcf-08dddb850831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?K+H/f2whkJZ0jY+1twZvXM2qblcmcotz2IbJskiA/xVzmNOEHfvyY+RybEAI?=
 =?us-ascii?Q?uFUIKSsBKvIM5jenaXQ8uOTIfFW6EKAbh2WXD2Ber5gcvuOnwvP3FHy/pZmc?=
 =?us-ascii?Q?f4VHgKiT4f5+KBuH/P1LXY65P8l2guOgGADFsgXC8WKC/OEsdSNMjL1C2pFx?=
 =?us-ascii?Q?tsDOkPAQ76kageUOWtCxPTwAiVDlDEhw2f0uCkjLj8UROyBz1ac0jKy+Kv2L?=
 =?us-ascii?Q?Lpo1a7NhsVwLLfChSOro7P8Beq1qn2HmdFWmWpNgHHoiISSK8h3Cgar3P1Ip?=
 =?us-ascii?Q?2YSr5DFB3wctpLh8RCgD8jHKJLkW6Nm2r59MGj5oILC5oxRqBVRrp4r7LE7z?=
 =?us-ascii?Q?2lhFgeCUuHr4DFQjNhckjSRhZSTzAJ7fG0ayEDNtqSnk6qgCBq4A0kQisRHv?=
 =?us-ascii?Q?IKHwGNj6p2Cfo/8iIsfwV+r9+NPTbmO9YR6l4Z0lmzN+P5Hd6eQAOpe/20mm?=
 =?us-ascii?Q?VajxiWzDCeDvajQf5a6t+OGaE3kl7kJCXYHXsWueAY9EZ76juPcYcA8gYq1G?=
 =?us-ascii?Q?BCIKPKsObysyzoisTWDovZqwpNfH4LQDwIr769Eaj/gKUuhFvBAh4XO3G4c+?=
 =?us-ascii?Q?BU0F5wXTitf2JZg5Rvz6TQ078m+9nXqwWuaJJUU6p6CKPIM07HfIPeU6ogX+?=
 =?us-ascii?Q?qwbCCR6sNn1FUXsuc0LQBhnHUFyexZQaZLF/5SNR1K0JNKhwYxX2/4Bgwxtz?=
 =?us-ascii?Q?CUM1dq+Ryu55bNGSojU1aGifQt6VtlDUuXUu6lyJhbnbwC0Rm5pl7B4exCSE?=
 =?us-ascii?Q?dw1x1kGMA95ydpBWU4BpnxACfG5cBla6jnYsdr1K3V+K65gr84A1+nbYIDBJ?=
 =?us-ascii?Q?SKXOgUzbc3Z6OWGYLmz+Wj3TtzXNrNAJcQm60YTm3rDnlkuAC7Zddasf4WFj?=
 =?us-ascii?Q?K96GMi067rwIthBDnSTNySHPDahwqJBoVOzWkWrxj9aHz7Us9o+PUiVA/sYC?=
 =?us-ascii?Q?zXp9Ja1o4GeCGaD9g55EL89Pl33jVyqX6wH/6z18754vvS3FqW/HmGT0g065?=
 =?us-ascii?Q?UqtumgyfMdkGsl0XW+elWv+ZfExihevcIljapS7/76gsDFTVB0Qtr3fTsDWj?=
 =?us-ascii?Q?CB49dmTxOZ0B4fjGQdlJ8k0leeEtJBwGMGADlzvhgqLWGrYHCqTvv9OMSaaA?=
 =?us-ascii?Q?ftO/RT70Qmt6Fh0PB01TlVrNw77AYHEAX+DR5zriJnzyEd+XcYxh5DsqSoDi?=
 =?us-ascii?Q?TE0uMLh9K39L4waP1Q8HxINmCLjl75burYEPCtBQGs/ouJADBdgu5GJfuBBB?=
 =?us-ascii?Q?0QrAOInw+bWHQne3oTlyjyAvDLubgKY8mw6lRyopswHHMhWSMa4NJBZ8E+Vy?=
 =?us-ascii?Q?wDaSiWg4jrdkVTqqjTuBrLfleJtI4vxfnG8Wq4KVtksfUTuxZFGe8O8BwXin?=
 =?us-ascii?Q?hNeNFSLUaFXBupYQ+phqND9pk1GsIRYJxzkVpFhIN8/jYmaDfmTR2khS8R2w?=
 =?us-ascii?Q?MsRH+N8Qn03Usiv8TSHsG80UO5X1kccX2CwRqa8VNhshD0amMDTmgjd8YLYY?=
 =?us-ascii?Q?jHIDpSUpQZwMJPqtzZa6v3m8OZDKcosd1w5Y?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 22:50:57.0592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e2c5c0-b67f-4301-8fcf-08dddb850831
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP195MB1328
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 22:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118951

This recipe uses SRCREV as well as defines a tag in the SRC_URI.
Only use SRCREV since this will generate an error.

Fix following error:
  [...] FetchError: Fetcher failure: Conflicting revisions
  (c765c831e5c2a0971410692f92f7a81d6ec65ec2 from SRCREV and v3.6.4
  from the url) found, please specify one valid value

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb =
b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
index 88b50a406b..a0dc6a689a 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D379d5819937a6c=
2f1ef1630d341e026d"
 SECTION =3D "libs"
=20
 S =3D "${WORKDIR}/git"
-SRC_URI =3D "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;bran=
ch=3Dmbedtls-3.6;tag=3Dv${PV} \
+SRC_URI =3D "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;bran=
ch=3Dmbedtls-3.6 \
            file://run-ptest \
            "
=20
--=20
2.25.1


