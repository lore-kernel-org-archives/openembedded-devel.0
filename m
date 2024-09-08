Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC09EB64DE
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 15:34:46 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.121])
 by mx.groups.io with SMTP id smtpd.web10.32313.1725809679183516956
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 08:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=uKhc/RW9;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.121, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xk62owexo6EWZ6U7is9v2scFGLcQV7y6n7DzxCvuGeMPwhtkTpGr9PchlbLR9Wyj5ejRGAy0FjHSGVSh++x5v6/dGc5y6aMOjP9E+ew3FqqoflfnJk4DpkdM0ldMg2/bdpGcHxM02uad6HMt/s2iM2vLFhCD+FCtcyZpK2g2HHBiyOAGbtP/pRmpCmYHHo7UurEqgK/c1hxGaFvj934FLaGxqmxWUuHBkeBd1WD30LDJhlKTpekBbemlstDm9pnjh0N3STlDbFnvbVvfkUlmvioq4FjfQGBy/IGJ4wGqenDDjYh6T8gkp7Ulfy6SLUIhBlRvzNjj7RX3Fk6TNtHbYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHi8VWx6wxS+uk9AJpMWIb94wAXigjuspUff/PrPRUw=;
 b=HtBXCr7lxBU7rohtHOnIBOu9LmPLGJ4Hn/1qytB0/xlfVAgFgIgoFZFPckSgXK/jYzuodMnl/FVlEBJgExMuZ1vNDfVu5nUDwftOLNXHFGfDt5fEmTV2uwP2u5urnS6ILTVl06hQ97qm/nxOQQeBjG/plkm9Gh11xpU+PjhWhE/DVFZZaYCLWaKAVqyiQyrkfgzNfu4+EVIfi53/OClyWgcBUA+i1CkLWVkzAeLdGhh2BVzzZDD187ZRbjuWpMNCIvAaAUIXi9mH6mFNhyH6plpGltRPXJRVnKtlQ5VXq9wEOR6aS93ngZ7Jju5KICCEbb7OpezaauWInih5z8+QiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHi8VWx6wxS+uk9AJpMWIb94wAXigjuspUff/PrPRUw=;
 b=uKhc/RW900voz4ODZ3NLfti/CWlfIi3DK0iPbHyecPbreSoEcN9Xw5Vl6bdbBOSUEOn/NPxdvLPpRLFtkNxWv0zvRm1z4QekcL1LXoUj7RgJxMmZhaxJihWwpBDe5+f9c0A9vjysqdlQiymPnPVeCdx8vsfa2JZr7QyMhshjjHh/dxucJNdHWXurfcdxvFkhYfVWgTkB1QJd6LY5CXw6JGkv9d8ywUrp4GwlzJ4OB2w6Wog7R77X2oj9FNrkUjp2OPO4rJWQWuD6/HoRZwxoxpCoa7USSSsKWOkIiibcKjrh/xUmkmRhlqhPPn6UISFrt/WtUzfewtuI/Aku/nd9iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7472.eurprd06.prod.outlook.com (2603:10a6:102:154::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Sun, 8 Sep
 2024 15:34:38 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 15:34:38 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCHv4 19/19] python3-xmodem: Fix LIC_FILES_CHKSUM
Date: Sun,  8 Sep 2024 15:34:08 +0000
Message-ID: <20240908153408.4114753-19-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: eacfcb67-55a0-4a0b-7d4c-08dcd01bbfa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0GARFZ0xaRZ1U2Amxcxf05mp2lZ+dmcbzWI5X0d99j/NmkINFCkJpQX/ndRi?=
 =?us-ascii?Q?XFuaJ3h/9vsjMLX8T41OgOaqANNZpk8FGLlJprbNilALCi7tPV4axAi4Fyqo?=
 =?us-ascii?Q?nboy8JMy9CzblrIeFOPGi5Fwb+Higlrxlk8TexSioCxJkVXp6suVEHIbkDoT?=
 =?us-ascii?Q?XfXMJ92HCyJ2jBZVgYy84WSEkzJQzZcj/vHExV8IEFC2Vfl0HICEwO209jN9?=
 =?us-ascii?Q?q8y4uaPwOIV48U558fz92gaormLV1xj+AWju/BUU79tq+/zCyptPcSBbRAXC?=
 =?us-ascii?Q?xp+6B8E0a6rEmzvsRy3rLY2FHBZqc7XYtndQB7yPGnU3yt9+NupX6UAVire4?=
 =?us-ascii?Q?dsQrPYEHVcP0lzahEUsJlecj7qTVDq7XA/0aq0Vh9fJ9yFgiFElw8hnoSTva?=
 =?us-ascii?Q?dj/XdyGFqR5FUWCVwTEPNS70rsRn5pk0mDY4RhLqJpG3sa66PgD2ACr1pjNd?=
 =?us-ascii?Q?xbjv98bNI+KbTm76zo6luvT50H6veRahtKnebFMHRh459dB+vdce71ozrKG3?=
 =?us-ascii?Q?guslT+F6k+6R5BVaCgvyNJZwSFBwOmtLBh/nDpPdb4lixYX5p4dJY8dwWyMb?=
 =?us-ascii?Q?4jSHdhcPMtihNEJMMKN/oOUasauxXpPeQikLD57s5pnCzujwmfl9QE+j+ypf?=
 =?us-ascii?Q?9xu06qCS+joLJXRaAHR6hvgxrZfbZ4Cdhg80poTDAZlyF9JlxUd33R42XstQ?=
 =?us-ascii?Q?Y2osjmj434eEDYDA9Ck7YwazWsH+yquhiaSHdsSFSTTMjxwJtnR3uGB9hZiY?=
 =?us-ascii?Q?6gstYKBsZKHRbg2QYWKoC0R+jNK1QNZ7qQhvmR6AzY1Y8axLzvONiP2xdzG7?=
 =?us-ascii?Q?oxx3AZv4uE1hzMomeKHYAr/L6E802rbOKLzdbbiaMHyqjBaykiq0l56KK/hg?=
 =?us-ascii?Q?+jS4+WW26UzvhKO54X8riW6jkwVlYFj8Kf4Hxl5CDlJhJFbNkniWRel83Ne2?=
 =?us-ascii?Q?WSKbZW32orsBG7SX/BsrAdBCsK2X/th6ZS/bt1/Z6AQW77P8raI+JHDumgMa?=
 =?us-ascii?Q?+CUXPv/uM55POzoYheARs4nadeM76JqcwTUHmmrXCtTGpJ601EUE5RBE9kQU?=
 =?us-ascii?Q?4adaNAgu1EBzRpSzYZeSST+sqbycJNg2P7Y1XqFlC73ipHRy4v9+veZhD8yt?=
 =?us-ascii?Q?PAW/DOGybCBJfMZSPGeOd9AaTCTdpvNAMkvCBUInDDt47/oCdeaMRi+HJ34H?=
 =?us-ascii?Q?3aiag40NetRU4rWhD+W1x2foxiKlmjExpRNn43hw4V/MNaH3prv32v8rsD86?=
 =?us-ascii?Q?SLMTlteVcqRX5D2GAI3fG1VG21X1g/9v/VG2Dxbm9ecCvv/rA2cNCRoY5/OQ?=
 =?us-ascii?Q?hGjHb1+VZ31+0xabfvJn2w6WTgbANOQ79AZpSC8nuS0DWky9RQcwHBnMLcck?=
 =?us-ascii?Q?9hlcag2I2jp2VWqZuXvkk2YlX2//SGxAwKZ2XyF+4+4yBS2knQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bv0MQFUSiJBivnI43LSkFTLMDo/ImUs0Hr6mCW6Eq561n0zcKAAOcu6WSqDC?=
 =?us-ascii?Q?oi3iSvIhZyY3qg4JF1ptBjKhcw1zPoLzZ6CJocvxISZV4Z5yZIkw7Rw5Fksv?=
 =?us-ascii?Q?iUIjKygYprrFhcDnYx3sga+RfaQHhS/GieyRVDQpO9U7anod1HL5LJQrIzy9?=
 =?us-ascii?Q?i/KwnNVangrEnNvqjYZkhx3N8IWnSydaABpKHSM+uK1NxRiVGIETLOvRmLu6?=
 =?us-ascii?Q?WU45LGnl8jqIQ1inQmNea+D+rgimKl7rKXs+yfSMP8/JYO6f1DeIk3Xy+Hbz?=
 =?us-ascii?Q?XVEQSgTiecBbuqLIzaX3dnYzrIrv08UaWzn1HcFFM9MpVDzdla2h8uuFYTBn?=
 =?us-ascii?Q?n16wc8qHd26NY3w6P0M60+0rQwvLb1ZUEvqQmwPZ709h2Hno0bHMXqFRfE62?=
 =?us-ascii?Q?yBz5Uaq02I3lk5IBPx3yRKui7F61ScdDos+3v/uzR+HTzLA2W+pamUCEU5GV?=
 =?us-ascii?Q?GXKTkRSTEZtxdtU6EdHy0uM7zSap8LmDYqYeYf5pfWGN5ioI3WGN5A1GOaYs?=
 =?us-ascii?Q?AAKZyBN4a4JhgNJwZ28yNCDwYnsXM69unDDPlTOxb6B1cMRL49oeIKT7dDQl?=
 =?us-ascii?Q?aTeDWJphl7UvtwrgD8WKP+QU/RPsdZiLQoezdy2CPLRpn5XF437B/qizh9jq?=
 =?us-ascii?Q?xIQK7cMhWEerTNHwA0lkMBWImFquEzc3YXdlq9Jc6YJ3bf+b82L+cuIjj53z?=
 =?us-ascii?Q?OxeIQInvKActXvCfsR1xbxWJMxkcmMfk/ZGZrLw0wdNbunt7LlytYl01GWrG?=
 =?us-ascii?Q?w83CsQc4CnXveLmQKRSjAntMedUBfuGxullMqRASwbaILxGnZe/VbmRqDBnA?=
 =?us-ascii?Q?yBdOuFhghfFXekspLJaBJJBrde8yvG5mcfh5M52BNHeKvU/8/JMQeqdkNBne?=
 =?us-ascii?Q?YPd2QZB3uNc37phMDBl9B2yhf/uVAPmifYy2zweJ0YumRLiQffDDebq6KKb7?=
 =?us-ascii?Q?NBkt+WduHT/m1h1zvFZXK7YeLsi33hfe6SvgFzo7L7YryQ2yTmnvYngY+WNM?=
 =?us-ascii?Q?nphFZ3Vi8m0W43N7thz9gWXxo3x2haSj97sKY18KstZysz/BuA6yyB5OTNMl?=
 =?us-ascii?Q?LFUfMbHM/88h66vDTzXrULFphR3r5qqrmyDoQ4S4VJPmNQUMzcuER88gDtyK?=
 =?us-ascii?Q?f1Gwt2JQWfgDG2IoS//96vPHgzyjBwxxhwHGBjDOyI0Pqn/ulwOAyfOYGF5R?=
 =?us-ascii?Q?61JUwiOgFngWE920RnIn89yP9i4SF5OlJee/MvOQUyGCpfIa21YZaqn0Yxar?=
 =?us-ascii?Q?kJq5iJxMjATb0xTAEc2e2H5pg8RXqs7KfQEAOW9OTOjpStgGG0u5R/GDzWME?=
 =?us-ascii?Q?tZHs4qfxh30wy+z00ZrP22tjlchkv9fyZR+S48HnYAxsIdRf/Cv0dXq+WLoZ?=
 =?us-ascii?Q?+BWeFucVm3/wRMc7wk6S/+/sNvWx0GPZQOqbES0ZCpD+ZUc7Oyb1lyqzGqSv?=
 =?us-ascii?Q?yfGtA9QqPjtnomBl8rZdBmgsZk0aXDNR9GUbXewkmeJHdHD54OWvbDyTZdPx?=
 =?us-ascii?Q?6fbXSvxfuG35ptYR/odl9WEzh+4nueCKYViXawAiY64AAFF9W9eT8+OZ188O?=
 =?us-ascii?Q?aU2B0NK06xaxo9xTDfzMu5ZL1lSeutQpzfk9PTHg6S7Frff7/hXAzxDlXwBS?=
 =?us-ascii?Q?oA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eacfcb67-55a0-4a0b-7d4c-08dcd01bbfa6
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 15:34:38.5043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lCRExMarKg0hefEPDjRvTx7o0rwAUy+kG88LhKQJ6buj8xd2hvp6gDCAnzwqYrSfA/gKS47Cj9PP+CmhFMwHhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7472
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 15:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112159

Change the reference to the MIT license containing LICENSE file in the
downloaded archive.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb b/=
meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb
index 482f0c641..c1ad6a2a8 100644
--- a/meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb
+++ b/meta-python/recipes-devtools/python/python3-xmodem_0.4.7.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "XMODEM protocol implementation"
=20
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D90bc9522130d68de0dcbf33707bbf12=
4"
=20
 SRC_URI[sha256sum] =3D "2f1068aa8676f0d1d112498b5786c4f8ea4f89d8f25d07d3a0=
f293cd21db1c35"
=20
--=20
2.39.2


