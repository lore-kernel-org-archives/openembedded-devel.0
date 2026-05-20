Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC696CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 12:29:40 +0000 (UTC)
Received: from mx-relay11-hz12-if1.hornetsecurity.com (mx-relay11-hz12-if1.hornetsecurity.com [94.100.139.211])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11094.1779280169754597317
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 05:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=qx2DCHzx;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.211, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate11-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.66.126, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=duzpr83cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ag1B6tMQqWm0wgyMvNRqGh+RCqErfelpaNzvOBkuJ8s=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1779280167;
 b=FYPwZaDViEixLbqO9p0O2+SL2TvYvw3gjSNd8VPBecwrAf+WGSWydfQC/bRb7p1rk75uLjyz
 TWOy3c6T4kBdcOhWlHmB1tk10veG03YgY3/SQwt/cddP64cZVphLa6GGwCvNKb7l4+efIIkIsMK
 hjLUzjePl7+XZ/0iOXmndXKVRw+vZjwo6A+qExNJi+uxytG6FsKDSEXzXIjUPVvarCxyuAIz7ec
 paMIM73ete7VUhDD6Uhl7UswPaBVqZ/iBHzo7bJpTBqEt8+z5zL9BiXja5+80raw6kqXS5f/5MA
 GHG3OACa7hIsCVWZtvtKG2o+GLRdw97Txb7Ply0Y6zQ6Q==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1779280167;
 b=VtgvgalNQMqI6nME3forArtmKzmoKzESFubA9EPwShHadsy4+4tqp6rSRR0CsJUH0aj3u8M0
 cU7wXk44HT0ffWERyUNTUsgNU9W3c5/fzMl0kgs/jLyE1YzaxPz5GcIjqJk+I5nKuHiIo52v5OR
 syzWoJpbOTrgky9PokM5kuqVCPxaz3fEAGdyIeEk5OWiYQhpKgk4jQn5Rh+TbXh79hjyhoLRsnL
 AIGlpG9NNdfquS+/vwnTcOMAHtAIR1v4SX1+pKWxadSs3mhrGRrGl1YtdIuWurTVqQ9o0a4jiBP
 bkt9fp92j9ODNJ1C1b1O2dbzChsJikN1dAKSpEvfa7+8w==
Received: from mail-northeuropeazon11022126.outbound.protection.outlook.com ([52.101.66.126]) by mx-gate11-hz12;
 Wed, 20 May 2026 14:29:27 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VyyIVplvNcFd0mBzJSxTY0eHSxjlxH3MAp20/e5YwQQ+cHxp3dfYz23SrRaxQKVZalZVyHokd1L3dPZYTDub5uAgvrF++D5s1vTyilg3G9IG69SSqfXajipod6LgC4sUALou9gZ/0Z8cVqhplYgECju1cKeY3cJxGIGYOBrqbBYddMveAwtTA/tNEkr0VsD5xpOJu/36nzz0FZtiLx/et0z7hVfWqAJvlQJiRyhHcQpxQ4hxUPxC1diarF9I4vNFcF5DpipObIjQdr2DcUBB+7gktwO8V8lzOJmVJl/o8K1GUc933Jh1vvq0U/cnZDA3bx2YwLGTN620DJdg84H7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ag1B6tMQqWm0wgyMvNRqGh+RCqErfelpaNzvOBkuJ8s=;
 b=C4lli1vu3L47FDVdBsH3JpQc0ktPdeN+HZaGNRkCdmfGFdDQAtjSNEHaHTl5Gh/nRIVd55BKm5Eq72sEzUIncM/QOHA4htvZ15TuHUofO1PLRVDucpKbG3nl5iG0aSKi7rL66WRljpBo9tm8gIsxhIDv0V088oK5tYkh8P7HGml2SaOqtD8JD8uvLClXMtHnu1vbSS1nvJKHtfJf+UJOFCD5ucPFnI9pgMKO+h4HQ1DjDK8DRNwYFTXg7/i6rhy6RMFagU3TvS4uiLc2kKKRZjtW3E7hYCyjoIU7xuokngV1ExTb7Q0MCFVT0YVLo6V58SWEaKyzroqI/NSgeXy1sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ag1B6tMQqWm0wgyMvNRqGh+RCqErfelpaNzvOBkuJ8s=;
 b=qx2DCHzxpmbET7ip4ApyOj6zUeAwogZ8Lmc+usu3QEZ40nrFDX0TLw1WzwFUE4knxKSumwfFs9ZGL/NnLIbLmtNWoEP/TEtA2wYHCBevG45JLU8yb0tm13vxMTwDsJh5wXFFSF4AnPzK+t4QJXjUyfF6qtMcrzvrreFFsfoECpt7ZCupaZT8LYzMtn9Q7N7tyoQwSfrK/hvEddZ4pJYJo4lZRYmiHWH+6pjgn2rJ5hY/VnBzIiU0B1+oTfhSsT4XeJPJR+lPXQz+DvuWF4mEYslTdKyOT5t40De3fcYocWnOBz8HepKgNkWr9oVborDy6zj6SHtJfSx4tPR5iAXfTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 AMBP192MB3401.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:75b::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.15; Wed, 20 May 2026 12:29:20 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 12:29:20 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-devel@lists.openembedded.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [oe][meta-networking][scarthgap][PATCH 1/6] dnsmasq: Fix CVE-2026-2291
Date: Wed, 20 May 2026 14:29:03 +0200
Message-ID: <20260520122908.3151647-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0178.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::22) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|AMBP192MB3401:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e4fe3f-64d3-4030-d11c-08deb66b6b09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|52116014|376014|1800799024|5023799004|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	YsYtQoWTtPS4TVVBxPAmxxy4OmCHJNcIZ3+qThxsXmj/7BoxkNZbBNOLPvYpc15v8OSirhlwRDnbzbQUkojlbYtNPaLJRSJPvgACX9FvWSTI4sPT2Tm7mEWlDyJFuiCPr98tOcrGzZArf3SNSZmK9wL1Eb/0C5EUEgqZkQnw2Lq2jZd5UZLT5k6sQsdHU9ih6YxniWTxIQOmbPdqHmhnDAQEXab99viWelZs378eLJZEIcjgw3AuRVcguaqtNr2jubxjPWmeqmiuJrLm8wpcSccu1Tyl5xrK6s3ZzfskfqfesRsQLZ4Zpm6WEP3ISoObfSHK2DSGT7soVGpQ2gFhz4V8PyqN4DWewVWrXsCscedSgFCTc040YppbuVXHnODp68r5OAh4VgPF66OmhnS9XT3/bafpkNaelbx3WLLEP11nKCH3fvpI1CujQq6RsLNV8Xgfa94GRPhfgZtmnGk8bG3WNP9OuKuj6j1eL1bhm6d0oIufm04LaK5DNiHC7U2B8kbqSjQIODowlGliV/hvsT1MRSwc4zRgNi91HXsqszMCWkmJTKsYThYeB7mAjicxgMNyMlrloGZUv3jFvQmdfVj+8Rdvx82Flw2RVbsxe7/PG0PTPr0qB9igaXlQN8ywLU4wmpEwQQwQm10De/qskg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(52116014)(376014)(1800799024)(5023799004)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WDcYspZhMPNipsqu2fCuzThJvFeW2kSmgMpGO7s7dqZccHrT6jYCYlkNkCQz?=
 =?us-ascii?Q?/D4T2N7GO0W6kWGAECu198QZJACI4rIvLapKUyKsED+4AC5Y/X4J5V/F5pXZ?=
 =?us-ascii?Q?BL1lH7c7F3IYtFgp18+5xSUacHPx/viVAFaAhcb1AePNEQT4piGw8FW+QFew?=
 =?us-ascii?Q?dHkmaQj4Xhxbb2RI7tUfrcRmok3WC2E4X5OlsVY7oE+spCHW0qTXwkZt4j8L?=
 =?us-ascii?Q?oJqiZG2JMlVX03HAQyJZerGzSL09bLmXforckZjZbOEogjCZSXAMGiuFaH1L?=
 =?us-ascii?Q?YeaTklFYjph4jX6YsGV3TMw8w8opXhNd905fPPK0VgsAt9+vQFWqpmejXlBD?=
 =?us-ascii?Q?XUusHKrsC0TunLiSbqoetJ93SIg37kqIVX+MZnrY+ZqjjK9L5UGJchvLrPLQ?=
 =?us-ascii?Q?HFQGOUHozpazcNg1Pxz58yKs8lO6Nl/9m2+/PjJJIwovZAnic/58nINSJah5?=
 =?us-ascii?Q?cRHtX+Z4pcgAzQH86F9PgAqOMZLc1JtonvGMD/6Msr3LC/k/IbScjXXWNMrJ?=
 =?us-ascii?Q?lxh27dWt5NRS34CHMwsxeYDgCnjxOcyMKAJsb1UUTpHd9p5DC3kZdsgLddcc?=
 =?us-ascii?Q?njbd7tmZ+EITUVWtEJAQn8iNndaEgic67U8PAdl84RHTX8rVuOIh8Fmgiq56?=
 =?us-ascii?Q?ljh4mIvzCibRm+Cu1i83ZkOzsa8kxtn9vFSl2mzFN3aiQDs2XsuVUFCfpPnr?=
 =?us-ascii?Q?bpc9BjNAne/vSIRVspzh2hmUvisl5llmMtSuttksn0smmiOORd9vwa2uUuhr?=
 =?us-ascii?Q?Tq6ukp5hwa4xCI34NyrozT7X+HEDiOjFoGhUiLGdsvQ8HFkTm4LRZ0zMYdEz?=
 =?us-ascii?Q?Nx6hUyOlQFObtuU/aqOgfsUEcRk7TmQ95MA3KblUtWEIVk4ETM3+R7fUfs+i?=
 =?us-ascii?Q?jYjKkekDzcucnIrTDTid4I9JMgQP8AqSpwkJcy8oaY6w4auh+ySkyrh05stQ?=
 =?us-ascii?Q?u2I6qEoE97fHeKB1gtUOsNehlSrujBj7tA2fUmMp+WMqqf5sbOXHZsAoXx8W?=
 =?us-ascii?Q?IQ7h8q72GpNC6ngkqj3HT8hnA1RhHyqzyHjWnUz9NcmwtJ+oEbOCmyfxpHH1?=
 =?us-ascii?Q?1+bqL0MUGdEsEkr28P80eUHP8S6ebG4XDPc4UDMmSHNI+cK6VAh9PRpTzFXR?=
 =?us-ascii?Q?B+dQ+3+TxmygyXM7l9I/AsXtG5Rz0jZvdREaNzLbGWdMeoX4Uze50afwC2yA?=
 =?us-ascii?Q?um/d0MAbFEfQPhhugLngRrYr7QSl3yOyh89i60MsQ7fQloGHfGrPHucCAYgQ?=
 =?us-ascii?Q?CcY1m8Mvk3rjp7ZJNwpEJabnac6/18uzWAhXyArxAmGl5dBpGAEc3QuxNTRR?=
 =?us-ascii?Q?vCe0+RwbGl5BYliesKZC+vpF2VgIw0yfMK7226UFOvnqfBreyDi1tFS7VYyF?=
 =?us-ascii?Q?N4DkRMEFEDt9gQnVW/MJwrBB6XemqQrw2QzaFWrww9zpTkGGM3i/LM8zikwA?=
 =?us-ascii?Q?dR/GF/WnRpLf091fKERjxqUr1VxbwhBHaKA8+wDEfFO1PL3+7tjc6g5NS4Zt?=
 =?us-ascii?Q?5OkO7b3vNLGQ/tC22RL/ZZbxz67/DykoN4wA9qLVdvnMBeyuiG8Rxjkh/x1J?=
 =?us-ascii?Q?GJbkeXjWj4WEHU/8pUQXE+I1HxfQ4hYvs2uCK2YxJEAHTtyZbGk+waRvastJ?=
 =?us-ascii?Q?FkwklNUl5YIIDLxwfuRyzZoNmOHcubsvsYUA3EHZgoEA5T55kITHPGdIWxxL?=
 =?us-ascii?Q?i8gAVy71rK8X3JBSsrtfYklZHMHFVu/LxzghCec+GWHVdM4jO14Y/d665HBY?=
 =?us-ascii?Q?mymlYKDCzDTNTw+SOEPVkyU36zInoEjfv0pxWiYpoh+aVrCal7KkSA6kkz4X?=
X-MS-Exchange-AntiSpam-MessageData-1: 091B7KARFT5uzw==
X-Exchange-RoutingPolicyChecked: 
	FZCyzPfaygEWdbv34w+IgvVwliY2aRH87JYvvtpFQUD2VUKV77fVc1hc5yerpkQg585RWd6OEOyXxAVVcKMuqMi2QtYr7X+jItvOdMPD2qOXiokAy3Paf1sWG7aouEaWBNcCr/CNzhCVvP6WKKNuNU3JImrTL2JyXxsKUzrPwpDQYjdtEmPDBlkNsEJ9PGyddErNr5Q2AfNckhVTZeHKArpZVRY09TzkhQFhuY/POXd4Df7PdREtxMTKcIyp/CBEGWvy4sn3TIb6A2fpjzPRMA946nSV4a/HMfo+q2BY4CYrjRP7DZXp/4sj5RHhwBIVuJZbm3nLEkJb98zesI6dew==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	AaBH511O8SD04vi3pdL7FD0/pPC2Wz+dxxZH3gZmKqSE1o21vpyREcdiqcL2bi1x34o+j9nKssFfMpw5bj+nITQgC0wRjapXtVYYhREVS4eV82JYRrwRhFOeRrwkxWkHCykT6plxgiPl3qZK+DxEuRp1uiuNNnwR/kLC0yWsB0QIJyKXSD7uSg/aHvTdCKXrKe9gR9kYDYqE/Jvot3O6YXNKkvEVF/QTZPk1qAJTqHSupBPQo0dJTAFELfSDVVdXWGYTC5mBTsiFx07a+a1rPlCHGGY1liY2MKy2VoCCuw9d3P5J7BZQYs2VcG5ItKSs1KPOJ3MlCMbIs6MM8fdzWHbINSmENbLULWszCTTFaqDIpx5FYC6t7e2zpmuLB+rZ0gFcXEQy/faI5lky6ECrU00X7KyfRNHLnHqx6QJVaF1/8wljDAQIApVcHGGdKjIwftYfBLRqq4kA7DFoFGZ+8kBe4SrWwCRtjLwgDgLkHy47nzZLv9ZsKO8JLviOGzgFsnXjaLBhDKNtuJ0mGawLYmsnqA8E3tFqJT50UcqdEAptHSjPeYHpjpZuj4N0HCaSrCZaJE5uvlxDKO8Qezhe8htwySu7C0J9T7F89V66OZke4tt48+BBdffsw5yusGOW
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e4fe3f-64d3-4030-d11c-08deb66b6b09
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 12:29:20.7755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUwZ7e0Lrqev3CmWRs0ml8WBtsjfEdNvIIJyYTn0UqIMFySpy1Hzp8aN7hW69PfInoV+M5wB3v9kFrfzI0qciw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP192MB3401
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-devel@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate11-hz12 with 4gL9pB34hQz46ScC
X-cloud-security-connect: mail-northeuropeazon11022126.outbound.protection.outlook.com[52.101.66.126], TLS=1, IP=52.101.66.126
X-cloud-security-Digest: 82f485fcfbbaac28553711084ee3f1ed
X-cloud-security: scantime:1.455
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 12:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127110

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patch from [1] dnsmasq 2.90 debian bookworm pacthes.

[1] https://sources.debian.org/src/dnsmasq/2.90-4~deb12u2/debian/patches/CVE-2026-2291.patch

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.90.bb   |  1 +
 .../dnsmasq/files/CVE-2026-2291.patch         | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
index 38fa271dc3..3281404e42 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://dnsmasq-resolvconf.service \
            file://dnsmasq-noresolvconf.service \
            file://dnsmasq-resolved.conf \
+           file://CVE-2026-2291.patch \
 "
 SRC_URI[sha256sum] = "8f6666b542403b5ee7ccce66ea73a4a51cf19dd49392aaccd37231a2c51b303b"
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch
new file mode 100644
index 0000000000..c59fa031f9
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch
@@ -0,0 +1,41 @@
+From c3059821cd52b423592aeffef7935fdf81035a81 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Fri, 10 Apr 2026 16:29:31 +0100
+Subject: [PATCH] Fix buffer overflow in struct bigname. CVE-2026-2291
+
+All buffers capable of holding a domain name should be
+at least MAXDNAME*2 + 1 bytes long, where MAXDNAME is the maximum
+size of a domain name. The accounts for the trailing zero and the
+fact that some characters are escaped in the internal representation
+of a domain name in dnsmasq.
+
+The declaration of struct bigname get this wrong, with the effect
+that a remote attacker capable of asking DNS queries or answering DNS
+queries can cause a large OOB write in the heap.
+
+This was first spotted by Andrew S. Fasano.
+
+CVE: CVE-2026-2291
+Upstream-Status: Backport [https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=014e909f787e808bb35daa546d3f8f3663918de2]
+
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ src/dnsmasq.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/dnsmasq.h b/src/dnsmasq.h
+index e455c3f7..be8cf2ad 100644
+--- a/src/dnsmasq.h
++++ b/src/dnsmasq.h
+@@ -467,7 +467,7 @@ struct interface_name {
+ };
+ 
+ union bigname {
+-  char name[MAXDNAME];
++  char name[(2*MAXDNAME) + 1];
+   union bigname *next; /* freelist */
+ };
+ 
+-- 
+2.43.0
+
-- 
2.43.0


