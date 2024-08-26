Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E07ADC5473F
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:41:10 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.132])
 by mx.groups.io with SMTP id smtpd.web10.49386.1724665264443298756
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=0xbs/WvQ;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.104.132, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEWaUVQvz4Xz7JUBiQPn1j75v1Ykwk9vh0kRR3UhR3cIxbVzp45H6+ph3ZgTCmJ/TzZsQHAruFxGY1XottgHKg55yl0a5OMBJcrTzQ/yte1VduQqf8gVSuxRbDxuwzwsLnM0TsRoPzo4qsaVO7jeRlIdiV342+HSzq6QoIsPCcTIdx1PUjNiB0kdjnjqg+2D6iOJkpSm+YQafQSHcrHqKBbGl057IH68643V/Uyw1BbSipZpj06rqamvB8fUNzSmbpXbj1t9fKo3mynb4LA8+Y9sR7VK/VQygG4EJjFzPzpZpt3CjIcbLGFq87+eFxqpxGuv/zFS9E4Rfx1yS0CR0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vUzX6uDtppGBwpaDBf9ljs/M01M6sxa7cm6TJaT6Fw=;
 b=wJbHl+SwTqAEyK7A0LocpjpFrF9gNi2xOqCrWrpK7lnRXBFjIPDZSQBHiPjznK+NyBF8EcHGZ4AxlqyYt0OEDQaQFf930GfbHfhqf7uJqrtufgl/R8ak2tiWd6QIjTgsEMUMpG81YDXWXvIXH5TWvIBsjC723xI188E9Y8UD1xHcoVg/J0BI5VC/ZPkcN0jrUVEKyqq90+T7x5+qvMU7c+9tdys8oVCkO+L2LOdlyH1ZXO2WGlSA99HwFqDOBSmaX4CFPEHtasiUnawiHcTnPN+lGoIBQ/sOPU6PqVFmyiSkbwZIOrjC26sXlj7SqALwG4f0gl6hMkhLXmu1iFQO3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vUzX6uDtppGBwpaDBf9ljs/M01M6sxa7cm6TJaT6Fw=;
 b=0xbs/WvQO4CeFqxY1YfKdTDf+C88KALD/4UvQnEptzQv4A8+Xjv/bU+lI5C9KjGxuupeQf/SnWZJRQaMLmkyGR6+DsVft6KNrL+J4plCrKuTJUZgKdhKHt39ntnRkMdgqeFOfwQoUwBCKuK1tKu3DMVMiFZqXt9jplSj7cDPj1EQVI0mSurmw/7mGzqoCsWx5NfILCiWTXjN5SGmR/Isxq16qqutabCvzH+mQfqVT2AcfzniTYRGB0XalzrGM3fh7xCwlKWy5zCbDG8JSKdzpN/fGTPkqGuf7Tcatr8WfJL4UI+7pvZKtEPx7zv+vBJJyNSFWiYRfgVBcWleAtp7TQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9577.eurprd06.prod.outlook.com (2603:10a6:102:44e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 26 Aug
 2024 09:41:01 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:41:01 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 06/21] python3-email-validator: Fix LICENSE
Date: Mon, 26 Aug 2024 09:40:06 +0000
Message-ID: <20240826094021.2744296-6-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240826094021.2744296-1-niko.mauno@vaisala.com>
References: <20240826094021.2744296-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00003668.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::384) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA1PR06MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: 70738874-9904-4d55-dcc8-08dcc5b32ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0QMSXt4udpS3BFqOtZ3O6oKPWmtXrLbvKoouiNA+58jCIgYnLkGcEU1H45YF?=
 =?us-ascii?Q?FAdsnAb95WXdp396D65Ao455ca6qTor66Qd1rjQdC0TH2SrYubpJCBnoB/cT?=
 =?us-ascii?Q?MiO99hD6EtDuOdF7z4AYe/GaCUWFOQ0GtJY/Z7LSisENMOApro7uptiSe69X?=
 =?us-ascii?Q?aEUfSV/WVhJkrl2LLhr1U6jqX/JJ3otHWd8JQ+MJu9+nVogiWLsdWZhhW4td?=
 =?us-ascii?Q?/hk60H+Jzp5yAQzPifCEY9pFcrgw+FMm2HFQj5jjzlbdSmGS8WBFJVYDlZlZ?=
 =?us-ascii?Q?ywx3fjdPJbMZoMCjTa0hdiiut+tOw6xrkElxgdex9JW+hyOz7xgoHO37Nqaa?=
 =?us-ascii?Q?560SnyxIO3P/gCOQje2zd5fEgvw+SFKchuZBeTx1B65jHXcJej+25msWxqyM?=
 =?us-ascii?Q?vltiWgUxeghIt3uyLFnIwKYSPmgJQo4E4Nt24rYM3I9c5xELqgf2pwRordtP?=
 =?us-ascii?Q?loK43UyZoI1yeRJTlvUooJZLvu2jLZLrpcgEKgLDiNemzGh/sM4Get1Mt4F8?=
 =?us-ascii?Q?+gIviMSNud0pQzuDpcqqNw+upPQgU4keeqNelVOaTvq6GLPmJVn6C7JzJ99H?=
 =?us-ascii?Q?cT9Rvu5kEJLE5LI6jwEOKJ7t9nhuW2CY+2WHuf07SOQiq7TvRDRkEsAeTAEi?=
 =?us-ascii?Q?MYJn9S5v19B20zCIVA3MMMrxk5Ek/ydjYqv6TPeYROGVJwuS5s7yuy1VsDNO?=
 =?us-ascii?Q?VeknyE+fqifumlGD9Zp1AYVUNvV7Q7gDXD9di1Bh0sL6ywe7ldn/3InwfVW3?=
 =?us-ascii?Q?vX4mktZsIHDe/pChz8mUaMJfjQ/TJD6EFRAr1w3B8b4jJEKsLOfRxIpiqyih?=
 =?us-ascii?Q?+4gDaq2LEvh/5ifBv1Ux/2KA5q+1a3uklzl2YRtcz0DsSwFLF/XsuYPBXPx5?=
 =?us-ascii?Q?kLZfu5DFbWM0EvjkpNZZ3JnM6bMkEzGVrXQ0OceCYK32hWYjs7aLTsEqpDxb?=
 =?us-ascii?Q?lY6KOU1NT4Li4brwQaT6hc3swkbyG2nMrAsV0B7qbwiYSUOFRgwqRd4HlaTK?=
 =?us-ascii?Q?LP1pHrNdO313AwvzJn51XFXZe3l6uQijQ9dCY9XUqip0FUMi2uEXJmmNWh6A?=
 =?us-ascii?Q?+HcN0SS9UtGhJjIpfKNt7MeLpaGpJFq62YfZOkoP8OYMNbnzgjIVaZrrZ5WY?=
 =?us-ascii?Q?dLJNMDHgk/JPuI838XE2lCrgAKAyZzRqeTCaE7DRolHfaA8kqdH4vffRUTBI?=
 =?us-ascii?Q?RZPz67EkPnoHV/6jyyVOFVQd7SDR5YNTYvXmxi64FU2h+DdBYM8XEdMA9dgw?=
 =?us-ascii?Q?udR/8KYjtGBG/iXD3PEZCFyenB/ehJlgyCKK8DTCvZEbGLqtcLE/q+Uqq5UX?=
 =?us-ascii?Q?lIr9C88B/JDMJVJp6+xABT6T/n9ItT96r0q19vASOMYZxuIoShvEcxyrS+7l?=
 =?us-ascii?Q?KnDYrrA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rl0mZGAOHFbi6eIztEYBly0/Et1AxTkQFwYC15iznjJRkLeCB3htQ7omW2BW?=
 =?us-ascii?Q?/ncCClJ3nOjriowiysbMeutjJrVdCDVnLWxPXT5MvcJPNxJh1l1d+Cj7zN9S?=
 =?us-ascii?Q?1EN6uOfGYQ3CFNG2F2q8Jgd20qX2uM4nqGPIBaG7NkKOUayOpwX16Tz9f7SV?=
 =?us-ascii?Q?jpkEmJamSTxtEvu+qXPuwbLmT7bIVl/PCFX3DETP01XbZOhpu6z1XNdP8DSP?=
 =?us-ascii?Q?P00I2gVn5qI5qDTrXxslIxEs9KmyMchTwvb+lP3oNmS5qbU+t5zhZGoQP3Nm?=
 =?us-ascii?Q?fzw3XKsKJMjxFUiDYgQBI824KAbdVu91mIoEDfIiIveo6o6uMN6ClSh9csbp?=
 =?us-ascii?Q?xTTYPWmPvXvExXrxBZn08zUyTEpAjFozQWnzqDCDLG6xoocaIc+8BSEQ5yg7?=
 =?us-ascii?Q?r77jiHR0CZKdG6oEFwNaLhN4C9hxIy/3/hEwxGAYgRaVGa1p3o0KsoZ/xOip?=
 =?us-ascii?Q?xmGwnNVajswcjPd1dtjRuqRwukGmJyEuBrCZez2+5EchQwsdDzkvDra2LiMK?=
 =?us-ascii?Q?uahxQYBTxZ2Oj/HETCuXO7TgvwSX3iQHJSHgRJ5Jweaz0vd/zRkQ+MbiKUC6?=
 =?us-ascii?Q?e7qAnbyf+aGrU6WwfEr0NWYkL+aOIHDcnfJQ164mw9JN6eV6TXfT4WnrGDvf?=
 =?us-ascii?Q?flPu0RWxTSY9ankriEpnyxxPkBOIWyKNTabKm4eGvflmaatdOh8C+vNfEsYV?=
 =?us-ascii?Q?Ro1/8Jx2ofMWPb67NgZ8N2Vwl6oQnq6yMFO5zNR7BhoJZiZVGUs+6XppA7vG?=
 =?us-ascii?Q?0Q18Q00q+hkybR2BDUzHAZ5VHgMoDXvUhTU7OwlwmG0gNgj2k2+OVkx0zHyF?=
 =?us-ascii?Q?Sekk+YUxzxa2Qso0nQZUUP0O4Fvl+hhGdqsfpehPsh+X6l96ZfUFw/lQVhKP?=
 =?us-ascii?Q?4FY7Hd2ZtT4oR+M7WQBwK68aGqfw45vJFCopvLaBMWU5gx0S8bWdt1rblmst?=
 =?us-ascii?Q?LpKMSH+pNteDqDoz9QloEmigaaK3G4h+iBukQi5o/lxMlLeee+j09t3E6iCt?=
 =?us-ascii?Q?xtnOLPD9SuSJz3JJRwIPYTlO4HPJwUl4z0IrzboipVVOo24/pGltucdCRzF+?=
 =?us-ascii?Q?cnBNxfyDN4pX1SvFiO6eGf6WLFz0qEQxchjb4duW3uTkN9Kh3TfoyLFyLOjk?=
 =?us-ascii?Q?c8fgPZZyQdXdX5ntiSIKNPDWwZCUAPtXt1fHz68P/OGmf5dm5fYm9FeGGnIg?=
 =?us-ascii?Q?9/EjGMX4Mcpi8XKFY7vQ36Kw2oVemBrZekOdjuq5n322UuC4NmOeZbNXbPH6?=
 =?us-ascii?Q?nFLRJHV9/5WlXxOLMuVZ/JkHab4gn2bED3NzzLqpeZNJnQLSlAedmy84drKr?=
 =?us-ascii?Q?6m5hD17zeFQ2QihFbl7cXYd6JNRVzc77yy4WyRDkVHZluSiNMJOjj3dpf7Va?=
 =?us-ascii?Q?MiXM6JWSgAUkiEGCASLxp0c6+LIsW7DLVklW0Phip8H8gpV5yPYXdTH/zzdZ?=
 =?us-ascii?Q?1aoLYhe4PVtr+zopVFbKljFm46xkDefczZuHIPtFN129XWfo4FYumX58YrWn?=
 =?us-ascii?Q?HeMT0iDl0fxC9Gt19Mj+XNBWFCHnCBEUJRhKIYvQw9fJeMPCgHpwTBA9tR/U?=
 =?us-ascii?Q?csGrIgh1rc00NjdXO6NUm2H1hr16qsTq+ftVCvo4S75e9bItG6f1FtG/ESyz?=
 =?us-ascii?Q?Dg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70738874-9904-4d55-dcc8-08dcc5b32ee2
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:40:55.7763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4fZhPil2ykP1vw/I3aMe2gfyRvgYIIxOy4PhB+OESCUklTK3VB2lRx7AH3D2ya3XNfO2dJOJe0KuBruOe8ERQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9577
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 09:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111943

Both https://pypi.org/project/email-validator/ and
https://github.com/JoshData/python-email-validator/blob/v2.2.0/LICENSE
declare this project is subject to 'Unlicense'.

For additional reference, see upstream commit
https://github.com/JoshData/python-email-validator/commit/5d72f53412821189e=
bc826100fb2a673530c5ac6
("Relicense under the Unlicense (instead of CC0)")

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../recipes-devtools/python/python3-email-validator_2.2.0.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-email-validator_2.=
2.0.bb b/meta-python/recipes-devtools/python/python3-email-validator_2.2.0.=
bb
index bf6b1cafe..c17cce723 100644
--- a/meta-python/recipes-devtools/python/python3-email-validator_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-email-validator_2.2.0.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "A robust email address syntax and deliverability validation l=
ibrary."
 SECTION =3D "devel/python"
-LICENSE =3D "CC0-1.0"
+LICENSE =3D "Unlicense"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2890aee62bd2a4c3197e2059016a397=
e"
=20
 SRC_URI[sha256sum] =3D "cb690f344c617a714f22e66ae771445a1ceb46821152df8e16=
5c5f9a364582b7"
--=20
2.39.2


