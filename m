Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C683C52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 15:34:45 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.124])
 by mx.groups.io with SMTP id smtpd.web10.22913.1724254481068842412
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Aug 2024 08:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=sl4lNVNS;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.124, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SX6a6+9dXLCsvj3GzEt9b5GZmilwUzETVUNfZP/m6WBz452uDQuqs3EwGt1xOatZBv/5X+Zi7gMQ+V7KAQC6rPAKf8mCfw8F60cA5PPJItEiU6ZZjF7NErylqOXYggMn1xr7EEPE3gwPtJFkeCv5vB5jqujr5Q89UqaaPbMDL5F6oXAAWu/qM9n8ViTPdyJZ8rQqKbTN+MtwDCCrSUR1B4zpjY6GLV3k1RGcECzwph0oVwDAY6iM/baB1ZW8wLV190oZc7nJSCicuruxOcmWS0wHTdI5dFSFugHl/1JVVdpDMMuivOS5vaYuxOw0mxTgDxg9w0TULIl7NRKZeufEWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1DhDF7sPnQGpumlkZCcQpqcwXq3Ee9EBvsuj2IeIaY=;
 b=xMGKAm2ixpZM52xAhkvGBzkXUHrIkjvY0JLwxowmK8iSf2+jZTjFy8nCXUJeupXTXglmf6GGfyTzUnfRlV47edjBNEXs6FzXtLWSw/P5n85P8DVn6Dl3X8aDM4iFjnGDw/kPsZVNT+QIGw903LvLHJrIqer02yCR7hhqN95zVhSe2+dhZwdLTle9demJjM6o9wz4Ou8sIz5Hy4PJwZMwtDVfk1OgBRlet68noUU5BvCtq9XRvxLyQYpp59vnbCXZ4aCg9fnFZUv0q/eOS9p+uvCh+mTnU9MKd8+8f7Z5vZ+iCrTegMqGieE5ysfAiHaJ9lS+9eUx/MCYb5Zf/SXevQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1DhDF7sPnQGpumlkZCcQpqcwXq3Ee9EBvsuj2IeIaY=;
 b=sl4lNVNSiHxkDqgd5EFF2lXgZApvs0M4FbyuR7VBKfIrNFkELs8HWv6lLGE9hOWPv0yMMFcGAjp9iKLLuBMRTfn0DCSf84v5Ud7I27uJ6nHN1x9E1FbRisYvyMISvQrkHGx0A8SWVj2sxm1/INuBYZm7jojHyAI0jN9c0XfuWUYM7dhW5ea4fjBa3dKTQBxxtiCXGSOFE2p7uXQG6RhSn/c4f5fT8ucG9Oegx7mdLhBVSBX+6nIoiBY6w8uiN3y4M3mxoVhfmswFW4t10CAlT/8CKoJKUdWNM+DqQgzdUxUu9yHhsFzBU5M1yrOaY7j+GvJTkP+UgGlsBJr6g9OTJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI0PR06MB9635.eurprd06.prod.outlook.com (2603:10a6:800:231::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 15:34:40 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 15:34:40 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][master][scarthgap][PATCH v2 3/5] opensc: Drop virtual/libiconv from DEPENDS
Date: Wed, 21 Aug 2024 15:34:14 +0000
Message-ID: <20240821153416.650175-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240821153416.650175-1-niko.mauno@vaisala.com>
References: <20240821153416.650175-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0071.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:a::6)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VI0PR06MB9635:EE_
X-MS-Office365-Filtering-Correlation-Id: ed0320ca-45b0-46f1-6b82-08dcc1f6c5ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dl0Geq3J3c19ShjBnoCeV52SOoUbzAX0YorYFIEcSKNOovH2U+BvkKXblEtV?=
 =?us-ascii?Q?TwvzCRbqvouT1KTwp04HI3V5clScVOUiyBQlw5EalNDC5lOfu7W3fYwEvGbZ?=
 =?us-ascii?Q?eQpD/V/HirXdeXGggSVVS7ir5Z5aKKy1rvOwW3RMPYmfFfTC8k1bh9Idc5HR?=
 =?us-ascii?Q?ZlzAZrYQ8bLavPofz/MDLU+HsoQuHsL/WsyXwJRIYXAupdo0N6mQKEXjtG/V?=
 =?us-ascii?Q?i5yWOAX77Vm7LRLRxfIghNzRXMpt6gcYNC/inm0MlGoW3lbMAsumB/NuFQOG?=
 =?us-ascii?Q?Oig56fkPPnDIAhRa3Eb3xeFx7/aUhOCfv4L66YgoY3jN36YEkFuU5bjX15Lh?=
 =?us-ascii?Q?0DU9EFVbJERTTjYR1iZ00YuxQPeumQlJ1ZsAFVIm1teDd8tLjAru7bojqG4M?=
 =?us-ascii?Q?vtlEuo+aMkEhBACPQy1UM+6N4hUdf0thYclEmPZtX5pjEzPuVhtdswk6AbVp?=
 =?us-ascii?Q?PVEnEGH0/ju1q+NJ86/q9szTneuMlsYlCQv6oqG0h6O2gJOJ/khOTZHc+HnH?=
 =?us-ascii?Q?/c37AOKFNXGZnXx3XWPkbdE/WSoPuYkhcDZAjnUJ92AbRieD0I6g/KDSe5Qs?=
 =?us-ascii?Q?cHNJ1ME3An+WcQ7WbRw9FKcf/UUczmfBx2pbjY95eJzYTWrgHkJQ1ENMivPU?=
 =?us-ascii?Q?sjG3lylSQtwujENJhzUgTxs7B/uT+rKLsHXu0Jn3r7H+gPdlOkWC/UmlHFxW?=
 =?us-ascii?Q?joAFjMPrWk6D1NAMfnyvy+6DcFGLuk8rYPWuy9VeL42bnCt0S+ak5Q/VuGjj?=
 =?us-ascii?Q?bTE57NOAcom2g1b/o5SiTwikJn2kBpgQ8ip00HptP0NprsVhzxQYUV1wYjSX?=
 =?us-ascii?Q?QMWW/s10FHmSmQa9cRXZQYVYv0C6bwaJMHAnEj5ijRYr9RiqydHzMkJrp/Iq?=
 =?us-ascii?Q?Yi70sx+6Nj2jYQ/BtjSdJSrN8X9V/g+lWLYP+31DIOSQLjnPQNF3CA8twym1?=
 =?us-ascii?Q?lxG8TFTsdr3xhad5QonENEAa4Q0clyi2vdxVMAKDetYX0QzF8TWTDq51DSNa?=
 =?us-ascii?Q?Vbp9k9P6tP6qnEqQm+KOmZQrDvUyMSRufeTXWtQy2mySjPjEPf9atHCwVXhF?=
 =?us-ascii?Q?Y/TPQH5p6dfSQlD0mTeBTRf4MLkJ5l/Wg4oRLqOCHCN3mEWOlr+duoZIX1mb?=
 =?us-ascii?Q?tKsK0i7G0yZGkS7c3nrwSD7OXlWQYE87ZlNMiX6d+7tMiF6kMcXol3cW+fhu?=
 =?us-ascii?Q?gOR8HELkiZKyQ+l5F9j8ub2rkN7HWfgf0OISrG5IFlWFz/GL0ROhCaZ1aCBV?=
 =?us-ascii?Q?TMQ1MrutkA05CDrIacunfSFCfRksizS9IJa/OC5xCYBIB0tUi9DLjp8jVaVh?=
 =?us-ascii?Q?9KdhobU3VW+wigIqzBBRTzKeugwdI6CAzRjsZJkYwAjna6d5OovcrUWvE1ZW?=
 =?us-ascii?Q?onB6gpU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?q+n1CqmWI3rOw/W0G0tsycV+CWaKLX09nzNGxo2Owqn/W+Cx5xJljaXzhkMf?=
 =?us-ascii?Q?68kmhzMR6QF8VENwfSXjD7KLutikSd+H1p6uJwL7U2FWcGgEWOtNdpmYHbGs?=
 =?us-ascii?Q?rAO1Yujesz9Hh5mSQylRHw6t3eNTtES4oANvFHFFWbrO926AzIOogNrJU6PF?=
 =?us-ascii?Q?HQIxLJ3ejtSY1Hx3fHswd6Bynwp2OwQntmwqGvfEJ29BJdrzbZAkLf1afkB2?=
 =?us-ascii?Q?bwUxztSrFDyF2rjebzqT6wHyT2/oCqw28WzPm0hx690IUfiJx5wBhSketGgb?=
 =?us-ascii?Q?Tzsl8Zt+R0KOaTgMjAxzFi9cqxqdwwDQPpS1pQV92O9Frb8bPYGIGtoaIDR9?=
 =?us-ascii?Q?98ZTgT6jQHFWLGrj0aSzk9dZAR+RyPkDpSIBWAFUfSGC38c/4LA/Itt08FtA?=
 =?us-ascii?Q?SxIQNf5N6dL1XPVGzlx9M8/teyAHO7HZIqIUv4AkLkjIFQVdIFf/fr3YyJz1?=
 =?us-ascii?Q?BmsXT3lt9XmxvsrdLf0XNpP03XgaWFLUeCtzlXaDS26ra9zJZUfy8Fb4mbIS?=
 =?us-ascii?Q?UIBMIo0ri5xoHofJBiufkYeOQ1HmQkUVPv9j7Goj2oUBM6jEUWOkYKcS634q?=
 =?us-ascii?Q?w7UxH/LxjIVwYKwl8wZSRtk1KuNWkD0KJBU9XcaVn+LhndlE/AAoz8PgqDc0?=
 =?us-ascii?Q?0g5q1sKIQydEXAR3b4C9gGN2fCzy3nr3MAxJIestbKl6pGmSHjG+P4u2+yoe?=
 =?us-ascii?Q?l3Hu3S5NVg2VoVnYS6TOz9wL39tVbn5ynwhR6aT482jem10Fabz7/V8HoTWI?=
 =?us-ascii?Q?zqsP6Lk1zr+12Zb5gW+A9yq06wEs1W5TKCPiwnhtAS3h4pa3Zq18mAG15eKA?=
 =?us-ascii?Q?fk6d3l6sO/IY8F0M+3TFErHjQWvLNEgtyBO5ZnGPgmEI5XgfYAiNc6uSuda9?=
 =?us-ascii?Q?B1oYt5rYiY1YcxMvOXutPKnR8ga+Qhj1m5CbOIYaaeuxV2q5s4rWVazDm88b?=
 =?us-ascii?Q?mHe0tc0PEoN+YoI7wplCeI6zbRuplV9cUlMEAT3GlntscHf4Vj6NIq+mMQKf?=
 =?us-ascii?Q?JaCthGGo+F12Gw+95zJUGIpGOe8p+R0LjeSFHUKNrQ1iLRzD25zmCnOIwpfr?=
 =?us-ascii?Q?it9PHETfbNtdoxSBw0jux2edkKzZWKaNcwOh7rZNLKSBtgsP2NQPYroJCySm?=
 =?us-ascii?Q?1tyc5Z8O2n/+uTQzu5BW4UJaKN4nfpyg3GU1olEaxexOxoH9exlWF6Z3nEkB?=
 =?us-ascii?Q?agdoq6F3jA44ZcoecyskhVSJWg244X51WwU60HFbEITWZRJT2qJ8havw98jg?=
 =?us-ascii?Q?nTJzNomDEoqc/a0KGdzQYLYk7+d962BoDoM9zCQ88W166o2tzarmIGw4mzk4?=
 =?us-ascii?Q?aHZ3LO3TS73w+/uZnK4CK0jN8OmaAM6x8Ihp3KCH1L5bFS+/xKAvglNO2OyP?=
 =?us-ascii?Q?LA2/4J9kGkgmVspiL9L/ldyvg2W8NuENhb+67WJjKGgHn9q2KGmNHE9925qV?=
 =?us-ascii?Q?SpZEa/53YqnFgP5Iiu5w+JPba/eJteQHgwiCG5SQVViYHgMC7BlPwMooW8/2?=
 =?us-ascii?Q?AQj8s9H1E9t7pwJHJlpRJ/wl0pjZDJxfX4b9M2BEJM3vvBFoxHEqMnyqtv6l?=
 =?us-ascii?Q?XdWIihp/uzQwL9GPSWB0yrjaroLwDYTcREN5TTFNnRE3XLGI2yfb+nFAcdAl?=
 =?us-ascii?Q?lA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0320ca-45b0-46f1-6b82-08dcc1f6c5ad
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 15:34:40.3787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: btlcoQmbNuQbyZ9FSGdWMBZPRmgGPmB45+TlTlsb5/tgYkWXhXScHWtahvtOMIR1nLSn6P0NbHrxP/uq7f2/3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9635
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 15:34:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111892

According to
https://github.com/OpenSC/OpenSC/blob/0.25.1/NEWS#L1124-L1125
since version 0.12.0 the iconv dependency has been removed.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-support/opensc/opensc_0.25.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb b/meta-oe/reci=
pes-support/opensc/opensc_0.25.1.bb
index 17dc62e19..40a8dc320 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcb8aedd3bced19=
bd8026d96a8b6876d7"
 #v0.21.0
 SRCREV =3D "0a4b772d6fdab9bfaaa3123775a48a7cb6c5e7c6"
 SRC_URI =3D "git://github.com/OpenSC/OpenSC;branch=3Dstable-0.25;protocol=
=3Dhttps"
-DEPENDS =3D "virtual/libiconv openssl"
+DEPENDS =3D "openssl"
=20
 S =3D "${WORKDIR}/git"
 inherit autotools pkgconfig bash-completion
--=20
2.39.2


