Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2DE105A593
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 12:12:09 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19725.1773317523767940542
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 05:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=l2+uaQHi;
 spf=pass (domain: prevas.dk, ip: 40.107.162.37, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQA2aCDk1hefCAlo5TuI/uW7B2g0i/G5d6YblMUmJGxAZKX+VO/uQBStjhd55iCppbJmDVbCMS9VdlNVaRKKLgn7iJ54hX2VUlXQYKT1Lj8raZr8hhkmUbWjjFD6ltLT3V5b24DLVpOKnnQWWsaUqgIseW4ZEIwt/DngiGfTqD4l1w7spZSU0MMriHU/DhLWCxcPGwVAHeoQZXD2rKNAoUwHNZVzO7Jpee/Fy/X7eMjFA5IjtNS/1lj9rHpY3PlwgdMxZqIXekiJ3WTmIfRZbJWc7uZuA0wI//LGQ+wZZi3Cw0usVaO9XHQzy05rBayQMaYszeozsMWQfsY0/hYeJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCNBFrKk3kGS+hhjWV66OdFeO6MMTvCnCwO3rab+6UY=;
 b=SDiGcmzc0YIMdiYCji1aADD+g+DVIOMcC58Cdbwo8lCOqnHYW8qggPbpBC08LBChiLPoMsSBbGuVMfPF2If3r9LgjJ1G1RkjM3Nmcj6LWwZvIA/pCvB93RjvwWmUX2M3Wxo4ohc/MdeFZ/6X2YwyUMkKk8nLfabyvYAP1p/tZJ+tWFLo9vgCv2d2cEwIRiljklzrj66zZY5GmDtA0abHijDhSCeddJST6lTW5KfYXcyGa0vupyTEuDFwNCJBLMOIBA0SnamWuUYwUXY+mbeZ31skG+6HkFkeEnBmp5Etq+V6rd2E8mRSASrDgphcXvhaeYF1tw6jMJfamfNqm4CW4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCNBFrKk3kGS+hhjWV66OdFeO6MMTvCnCwO3rab+6UY=;
 b=l2+uaQHiR7i0P+Q6Pi12NTw8+N3Ki40nC2hywzshAH9n79GpOx705F09woEkwR7Xptx8DYXvY7JHpxacd+hTeDNtj2L0/zR/b+bwhr0ubptgdEsp5pTk5al6TwGrAn2aRoymPwhHJLw0bmdeNZ6OrfpZrSrjjkJZcyfRrDcjr2E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by VI1PR10MB3677.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:137::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 12:11:56 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%5]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 12:11:56 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-devel@lists.openembedded.org
CC: Khem Raj <raj.khem@gmail.com>,
	Wang Mingyu <wangmy@fujitsu.com>,
	Leon Anavi <leon.anavi@konsulko.com>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [PATCH] python3-snagboot: enable building -native and nativesdk- variants
Date: Thu, 12 Mar 2026 13:11:51 +0100
Message-ID: <20260312121151.2536421-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0001DC1D.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::106) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|VI1PR10MB3677:EE_
X-MS-Office365-Filtering-Correlation-Id: effe2445-ec70-402e-37a0-08de80308e16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	pyqiabcuXbVw8D2sXNf8DJ2OTkI4hK0FssprfFWC3iR5oP3lhGxPyL1F43qEs+QJj5/S/riY+MN8bIJDYYDE9OjKxriajieuB19F2+ohV/vAyN3PiL/XkbmRy+XWuErk2f3PK93w/daPPH2N4I9yKgGEC17maoxSbUq/acQgHi8PaXEykR8A94EfRGlSriEFICWP1N5eCA6+Holf7nUyeoJDOuxhYD75xsSAAdXso7PMzAQKVXRBofbw4I6Bsl9xXsEMYDyXhfk0lI2Ns+C/MvMYRaQ9/fZPbZTh/KGqtMtSI/dfpgPTPY9ZvzV7en73zhMbEn+hTIR509oW4bJmZf/lhAGhhz8ot91gVl7uTni0l8CY2uwIjoSQs3cQ/hSB9h1CTq5h8vuv0iTlh7nFnrF+H1VP5V8CzFFj4mkvQj6ptLhOstu5WHH2ymR41RJppzy+/PLCSwMU/xrKH/kV9M0SDFVpsaP58Yu/gecdncj68YG4cFpvFovHCw4+4k6hteTq9uLs27pRVIQtVzP6gyZeGWyH7bT64PuxOHHt7x0nglCRVbHPB9y17EQpwRzCjU3jxNIO+5r97bvwEUh5PxutOgmm1gvIUIpj4jbIp8fT1OHiFinNQTwbuilzcOAT5d3NUPaipDSYZIjUfPt1sTYLWQyLe38LcjwuKlUXBOiuHbHriIGFBsiTjNV9EU4xoh9Q2MiUBqAM35agjWGHlfGG4m+HqJTBUbDRcgb2vX31pB48/rYZ+Q0n/z0ciaPWm2hu3unNX08cIYR0/hBGkbx0uyjecWkb6dpZrm/Allo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GUykGbOvbqhvkJikfRqhEd755/4geaZkyAYC9e+3B38job/ewGmkRcxd8JPk?=
 =?us-ascii?Q?efe8mCvypEQISy/Yh4hYxEIB+NeTv6z0ULSD2YbIa3Y267aBPoMW4ZGy/ec/?=
 =?us-ascii?Q?tfM0VHZdb28cTUHdEm+gUp4kEPsnz2v0qwH2EpWRFyMMBdu7mbhQDpzm049Y?=
 =?us-ascii?Q?7YwmEQjn/dd3Dms2Yg8Kzyz3/62yG33xZOG2uO2JVnpmNNAlg0sUj3yWUTkw?=
 =?us-ascii?Q?ylsjhqiiQy+tqX/s7lGEQYdhmDOyVFPuZqQbp7tWxi6773YumSwM/Tr/+tVe?=
 =?us-ascii?Q?Hh2SCtLtohqeHd7Qq+lCDIYljD8f5+e3STtjvYJFX4NzcoRn5Z26JmbjUjU4?=
 =?us-ascii?Q?o6gPAShK01S/frx7A7seNt/mLs19eEukbw4TWhyLJNW1nqqL6M8b8wiXhmnV?=
 =?us-ascii?Q?7l3N0ZNPe5Ag4IRNcYle9gkyhiMhsl6RY2TqDXmIF9Vl0W2EJQetOxon18G7?=
 =?us-ascii?Q?mhcDuJ1Ntksh8sOyM0jEMjKOklB0uzUoJAHmH9U/nczm3VdivJllx4A7Nkzm?=
 =?us-ascii?Q?faqo/6NBbtLnxWSJJ5Iz/ZlDFc/fhi1lqMrDkJB7PjrM2mR5ZC2k/19WuZM8?=
 =?us-ascii?Q?9Cgmk4R/SIDm3yFjTcsLhGpuB07Tr24fyuB5324BML2/5zXTeONInLStAgti?=
 =?us-ascii?Q?ybNqpwRWigz8fsxKxSyQKObHa8V98y4cDG7ytOQBB3gFoQ39pmphOsIiGuNA?=
 =?us-ascii?Q?0gbVPyVFiw83FJHrm0zLSRqcVU58PLqBqIdgNmOvPIGmURLaEVKbEVw7a9ge?=
 =?us-ascii?Q?g9qpsvg2RHb2T3PMVNowMdJOFqtbU3NBVYM3XDswQupEDqDA67y5NFUvr6hU?=
 =?us-ascii?Q?m7i5AlVkAZ3TsxubKcFgWeWzEJxS0ftDByOhmg2Oxex96hmt8Fbx1r6w01br?=
 =?us-ascii?Q?VPuE4NVBtn1L+7umI50ZkmjwdoXKMJZx6Bw4YWCob1c+yA+divoPMgnTuwH2?=
 =?us-ascii?Q?p60DPOs4963QL+zACv6YJsUqaPcXS2m0Mj4Ut76o6Ole+V9S7uChylaw+my9?=
 =?us-ascii?Q?bL76bOD66+YDCQN5IXZsUb177xOyPWoMWhLPRwsAJW+MdnbBPMgvPAGxZni5?=
 =?us-ascii?Q?yabnB0hh9JO44Ky7e7g41R91VAofltEmGUGplupMp9XrRLtqUdeCghCS6Loy?=
 =?us-ascii?Q?JlcOwwEIO4naoHQzgABkYAlA91EiUUjf9QeOVDenTK+yHqbyGT+zzxTvrJ3r?=
 =?us-ascii?Q?ydb1IEI6X3gNmWuP2XRhUE5KoNSKeEtt6ZGVYN/rZbZr+zDKhl9yluloNRtY?=
 =?us-ascii?Q?1nKmhqhFix/D6PP3ijhzvSrbz17kTlozcgSgW4tLVoPkFtO8Si8rRvoxTI8e?=
 =?us-ascii?Q?zJrGjTXGAfxXF/i+wRUH6mZXBi67ENAH2AfwlTJL1dEcgjwOglxGZba1r5qi?=
 =?us-ascii?Q?cZS73aMBdeTNutmBXJ2SCUyL+tfXe+E0SkbQmim9Sjw+TR0BQ6sdoCmIIee2?=
 =?us-ascii?Q?IH1oEZnL3SCmPbVX2zMQqaoAMBOTMYBL2KX5O/12vDBGXRH7MkNdrbVhJrBA?=
 =?us-ascii?Q?KAAtmlRI/e0IAd/IPe1vbHefdUdaCM6QTp8B9j0s5xLOYoLXZ9a54s7UbTrh?=
 =?us-ascii?Q?Z3fjKt01Xt2QiaDrauWPETn5L1RH9Iz2a5nuD3H7KB9VdYmq+DyRUPPIcbJo?=
 =?us-ascii?Q?H6uEG7KEBYktD7siuoVFetWMJZFwRgCftes4U/whhjFzcn1WUQQIl2KH51an?=
 =?us-ascii?Q?cu7WZCWb/i5WhcUuuTZkhchU97FSY9ETO4RkEknJ/AGkQ3p75mJUL8brHYU5?=
 =?us-ascii?Q?Po6Xho5gmJ4/7AkAgQowQcGB+shml2s=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: effe2445-ec70-402e-37a0-08de80308e16
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 12:11:56.5601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHpHDsrCLK6r9uaSSTjxl5+7DhWgH5UXbXhUMy+7Q0XlogGQ7Nfja8LQ6UXlTKuPhlTpiLD4bV3FhTqL8kcrzQ2HjwARCCvCqRCmtl8DT2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3677
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 12:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125165

From: Rasmus Villemoes <ravi@prevas.dk>

It can be useful to include snagboot in the SDK, so allow building
that variant. While I don't see a use case for it during build,
there's no reason not to also allow building the -native variant while
at it.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 meta-python/recipes-devtools/python/python3-snagboot_2.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-snagboot_2.5.bb b/=
meta-python/recipes-devtools/python/python3-snagboot_2.5.bb
index fe496ffc2f..a280103d63 100644
--- a/meta-python/recipes-devtools/python/python3-snagboot_2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-snagboot_2.5.bb
@@ -19,3 +19,5 @@ RDEPENDS:${PN} +=3D " \
 do_install:append() {
     install -D -m 0644 ${S}/src/snagrecover/50-snagboot.rules ${D}${syscon=
fdir}/udev/rules.d/50-snagboot.rules
 }
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.53.0


