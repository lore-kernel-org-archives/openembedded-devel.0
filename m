Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F28ECE57C
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 15:34:46 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.121])
 by mx.groups.io with SMTP id smtpd.web10.32313.1725809679183516956
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 08:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=KkShLiGZ;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.121, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byKScUHOVCIjX5XYvAZuhnb79jAia9d9owqiDNzY+/kTz2/U8M3fhE2zR645MUuAAjGqg1uCPkEr3fP62QKX1th8cv4g0paOHiizs0zKgg8xPCjqiEhvO2h543JDDPFaemWIKojAkLYvUeSo4z8orK20AVJUt0rgyOsn28fcEm4bkzaOrMqMI+SWp7i2hK6pu/UZgifFlFPebPpN3JGWCLstmAuBe37bJx4hkspQDcgJ6Cvz1EbKWODVQiryJh38inNjU7HBQ1u9QfvRm6K1mjw2LDgYTzsJ1tWjB4BJGAoWqyITzc8oPM1MTibkJLfKCgk+4UJPHhPG+QW/AFq6KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfDliKv6Kj0cIcmjBwoQch0h9U29hTsBI22Vzb7WlBU=;
 b=yN+03eKsLvd/aBIhzYs53g/kP2H+fNbKLrR+/QkXuh6U5ScTvi95iObxk005b4bf5V+Hb2RZHjz2TneHsh1KbedHl+yMSjYEVEdC84rsyLqpuo+7A87XHNqhiuaq7BwYJj8xwBBmSakFxsbEb6wYyI9GWBJyh/g12uwSn0XRYSGlPGB1roKSWBHL4p+VfvB5dKgfPIXC+MGdZ/WjJBOcEdfJcEbQDuUfCRq/WY1RfXiPE0XEBHmALcU0Yxxw28sISFOskLMHi7tkrpy6+M61DcSVni+2+JoJ/2SCOcvmpPhaLHGJ9LoAHNBOBjwKYEaEjUngM0akEGqIFIb2ZZKaqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfDliKv6Kj0cIcmjBwoQch0h9U29hTsBI22Vzb7WlBU=;
 b=KkShLiGZP9szE0Cn4VSrT41StvEIesGAAiFhAC5NBRPjk+tyyab1bJm++4sVtTTiHAJHFEXkS4VRE/4oA39vjQA20IwladgiVY8WKlFQiAhthffYZS9RVb84UU6P/LM03KommDYYbXwlhrefezdR1QHDO+C+Q7n09UfO59X5PcPNsejb54pq7dVau3HPs6vnSpTRQINKc1JHN0u+KU0jw7WN2mWYVGYuTA00e7zXLK7mUUfQkHncmLA6VfPbwMs/wT9q2WAwkLznj4G6AuY7uPLXc2TDbaYX+DBfGIGf2ngQW78IsIZs87Di39chuU8pameF75Yc91HnJeQ5SW5jjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7472.eurprd06.prod.outlook.com (2603:10a6:102:154::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Sun, 8 Sep
 2024 15:34:37 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 15:34:37 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCHv4 17/19] python3-libevdev: Fix LIC_FILES_CHKSUM
Date: Sun,  8 Sep 2024 15:34:06 +0000
Message-ID: <20240908153408.4114753-17-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908153408.4114753-1-niko.mauno@vaisala.com>
References: <20240908153408.4114753-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0011.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::7)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: c3f67d19-3cca-4208-e5c1-08dcd01bbf12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WWn39x8KFfFNiU8lOqeBPqyjFCFIyWi06/lmchs0QjcFyJQ4COYCr+UB+IIf?=
 =?us-ascii?Q?Rp8R5aVoBczQh/opqBn7+AF9qFTY1DHkdwb4c24sTuzFo8oXcX+/aLGOHL+H?=
 =?us-ascii?Q?qGIADgMphnv5QGNFeasSvQDjHhgyQwq5q+Z4erCmSsvL75Zte7VcRpi+78J9?=
 =?us-ascii?Q?jX82OUSCTiBG7dFirNEug1K+9paBgmxqoPO2LR1zudooQhaUzyvmEjk7E6xu?=
 =?us-ascii?Q?8KQSqeuFxseM6TYYdMnViohC/9EpazTm2TZqvyabMpWeajDb6AUNZ2IaSsvp?=
 =?us-ascii?Q?lFDK5rth3HhDIkTeLBGAuLyJJ/jociZJ/hWkPRkhZDlBpDnSdDlqxt92KNuW?=
 =?us-ascii?Q?r2N6KR84Exf0a6zE3UepFCfmOmJM9JxWsd4WuvkYfmEU5dDCG+y/1FxgcU6X?=
 =?us-ascii?Q?T68l6PFH8RE17h+6JXw0xT0d1NasC68lCR+9/n1diLdsZMsabpQTmI252zl7?=
 =?us-ascii?Q?erkx3a8fcHDy2apZpcbgOqotcm4cktdOi9xUmSn+O+zfYyEK39/5pVQuee/d?=
 =?us-ascii?Q?uFGuW45AkhgcsffXVrAROJ3eBi8c/ArAGOP22ZVJBHBq6/n4QuRoTmXUcVxP?=
 =?us-ascii?Q?gg9rVHAm48xteA3TaktqyBrn9+4wK+IIQKVR7Zw0KjsfIpokF0qAzidtEdiM?=
 =?us-ascii?Q?/RrIUhuYEBewALZmbxwjH1+kCSuPu77F1YIKIxKVn06DvM6P4H9FRJZxBjuD?=
 =?us-ascii?Q?9Qq1+WB/C59TJp+Ieah7dYQgVsqIS2ota257JZsNZeTLaImeUtSvH9y1rrTf?=
 =?us-ascii?Q?SxmLEhmkAFFjwpD0Iztj2/KLBiwCHcjeHbpZt588VCVIJSCl5ReqM/S3Kh98?=
 =?us-ascii?Q?CxHFAf6nrFBtg4KOidoQF7xtRMosQYAVSgQSjbbWZ1tqPAIvuHMPjP1lvYef?=
 =?us-ascii?Q?CNhjAVrNHYxW870ZMeKw/7iVYdIeRxeO3DZoRyBphU2GqbzgX5IzwMSoU0s7?=
 =?us-ascii?Q?ASwfllYHnRKGGKww/5FmJ5GXJve3ERhn46Txf7loDwhSmMFBwfVupZpjH+Ma?=
 =?us-ascii?Q?IzZKBMgKm4IHx/DrIArGsRRZj115KsaRvzUcuTLY4/vEuX6/i3D1jbvXpYII?=
 =?us-ascii?Q?KtfaaQnKpjaBTmY7uFk1zIJpMZewrIk2hUUCW6nJjPT1SZEYCXU5/qyMRNRg?=
 =?us-ascii?Q?lAlEAB6hMoATvoUJAU2dxSpab/tjZBgyx2F4SPidbfWWvTPxDTlAgogpBiFK?=
 =?us-ascii?Q?TXajiGqfkegKb/CFSR3PUEziXBqL5rOcHY4nrNVQE22CWn/fvUqx9K/gYxVM?=
 =?us-ascii?Q?yEDHpfcI7z2dHqkpC4Bojme98baOEcbqC2mqkR92tnR554aUDtHLI/lZs8PK?=
 =?us-ascii?Q?KFxYpSO4wJXbmQMbQ8Vpmj0vEvWdg7FQX48Y+7eQcsmmdaLRwmIiIzTwrrbz?=
 =?us-ascii?Q?vs/rBSc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qog/b6VWOSl3UKweWm0+CB86qX2FWANO3abIYwJpD3vSluourfpKGhhcokkO?=
 =?us-ascii?Q?MsbPGk//wjdP45ghobaHwX269cF9wXGJ8KTPOPHLDy/vVfkRaHidLBFh3glB?=
 =?us-ascii?Q?+j3uK7DTQfFuzWnYhlljaEpQ91yr9D/qsCUz/7WIOTb5lhCNmjSHMWyNf2rO?=
 =?us-ascii?Q?Pjk7pUKYUOCB5ZsQ1bf4wSIhUXzFKhp00Xx4l97TeSA7CAfsXY/pO7Oqd2cP?=
 =?us-ascii?Q?bnBblHlf0+f7xIeGFhXRbmGp/YPvyDr+DAxKSW81GZbpaNLmmpl4889X/kC6?=
 =?us-ascii?Q?s2pHbjrmZULYx98hxbawzLBqDaNcGTUxiELFBISXEo7kX8u54w+xCHgCLt0W?=
 =?us-ascii?Q?4KXzt9KeU+gXpoNWACYjmnVfnvuMYuZtpM1eJpqNN2l4E9WHNI4Ak2qhlNLw?=
 =?us-ascii?Q?uoBzOdaSIBRmWBCM4FGOOJcAY4pDSnRA3nB8mWpb4jUdZpiZX7A/qXT2F0vr?=
 =?us-ascii?Q?Rbuc6lc7tGH2o/7QJbA5FOz3MPyOrjty/WMQOdQ/dxMu5VOExnpxwzvTeypF?=
 =?us-ascii?Q?Tg/5Jtd2AdckTNFvdCzx/fScABqyBNrVxkWy5mgSCPZJk9ev0mmMRQ7HlMiT?=
 =?us-ascii?Q?OJiEXKDY8348t3zx5ntWWVA5h8DnXchwqz/J/oVoqfgx1tXpEgVqyCFeCHr4?=
 =?us-ascii?Q?FdXHDbwygkrT68+fevuzv4PGYWL6u8X4nIV5sWq1eRTXPN21uB3xbKv/64lo?=
 =?us-ascii?Q?EdmsT9lmE43PdOOj+B4ieArG38NSB/7v8vVoZfiV9v50FBMQc6+fYpxTUET0?=
 =?us-ascii?Q?K2DWG4m86PvaHL9sjNF6Yhega44QK9UF4ph49kw/SFQmyKkIX5RFwfTNDUNb?=
 =?us-ascii?Q?QPLQ4ciivommHBekZme2JSulAN4nirkIsCHgiMrViwQlglKnSu2zHZT9ClSl?=
 =?us-ascii?Q?kkhzurhBPriBuCrmhW9hlEKYWPfuk7poRifNxtdQ9P0qhh5tq3O9pQfndHcM?=
 =?us-ascii?Q?4vbv5jJvHC2Xq3xXUp8gqxHSM2c5NWcwxxVreGeIWEDvx1RbCJ5MZes3pqJ8?=
 =?us-ascii?Q?c+LVyLcuTqACkdghbS/phuKLkNiGmKpH3ymggk3AFwuz3y1xDHXvCtFCwq4M?=
 =?us-ascii?Q?hoFK4NfidGmrqNVQ3JOUkTPmtwx/jcg0kyM7+F5SYi7B54XGxkkvdE9p4AYv?=
 =?us-ascii?Q?7pyxdrkVuh8yJYIqI07hRoacsI4HjHi6j8QHGaLVXhG3j7OVsXzicKrfODRW?=
 =?us-ascii?Q?XoSw8O007I4YFqmv1nhSKLbQaeXvB19jv81+KLk0zK5zHt2aDi6jkfpy67P9?=
 =?us-ascii?Q?YT56zm/+tcHdgg3iONlSepMb3JFSYoAAD2PMEsWuSfd73YZULU3XffQckLSp?=
 =?us-ascii?Q?htIw+TtFFOw4JcnADpIKJU1lmvGJF3q5NS0z4Y6nav1x/9Di+jGl+puKrrq/?=
 =?us-ascii?Q?8AYIOu0Ctj5GeO6UwnO7tN30qdYfpQbcWgWiyjgdmAMQyVYQwRoZnvYarKFr?=
 =?us-ascii?Q?vcLdi8udHwXBf8dS+3Ci7Z2ado+9BTo+bFtol3lRenF5BRDYqHJHXMtZ4ObR?=
 =?us-ascii?Q?td+oGzgcJTWTpSWuhhcBbmhyYK0QcaDuWg8reLc3gc0VDXvOeh2WHYhAOeDv?=
 =?us-ascii?Q?CVrceTdKwUVqMGOpV6pJD83A8FQbXlfycRFdVA9+bfNXtOHB81lb/1tlq2Pu?=
 =?us-ascii?Q?yg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f67d19-3cca-4208-e5c1-08dcd01bbf12
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 15:34:36.9627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9v/jmeplX5CbtfqN9g6vBsoqXCyo2TVyUCYhKdKmplKv8NcixqyJf3iOLsMKYvr6xOEMSzdVckw6dDJbFFTDUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7472
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 15:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112157

Change the reference to the MIT license containing COPYING file in the
downloaded archive.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-libevdev_0.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-libevdev_0.11.bb b=
/meta-python/recipes-devtools/python/python3-libevdev_0.11.bb
index 27e336710..5ad2a5995 100644
--- a/meta-python/recipes-devtools/python/python3-libevdev_0.11.bb
+++ b/meta-python/recipes-devtools/python/python3-libevdev_0.11.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://gitlab.freedesktop.org/libevdev/pytho=
n-libevdev"
 SECTION =3D "devel/python"
=20
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd94c10c546b419eddc6296157ec4074=
7"
=20
 SRC_URI[md5sum] =3D "34b48098c1fba26de79a0d67a17a588a"
 SRC_URI[sha256sum] =3D "e9ca006a4df2488a60bd9a740011ee948d81904be2364f017e=
560169508f560f"
--=20
2.39.2


