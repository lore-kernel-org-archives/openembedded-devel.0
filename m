Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E920CD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 12:31:10 +0000 (UTC)
Received: from mx-relay11-hz12-if1.hornetsecurity.com (mx-relay11-hz12-if1.hornetsecurity.com [94.100.139.211])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11018.1779280265273705054
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 05:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=aZQpccTQ;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.211, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate11-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=40.107.159.92, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=osppr02cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=jj+/2PJVVujjQq0uzPyXQbPuQxZCfK3Q0jiTdKqkzH8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1779280262;
 b=GNF7imhLKstBLkxw2WMRw5jhEC+MEWvfHm7VL4X5GhLW7Lg6NZD8+IV/trqc0FbZH0H8MIcW
 ceaWgKvCXy4/eKy5xhLlGLEAtECJu//SMB0J+oP4n7idOkHBq6IMXvydYKwkQ+mrX+q+hF0s175
 PcYlS0MuSXpBZ51nmPhcxVCzeryDFrrCATWbq8q2I7oKyKnnEGZYFKzb2jJW3l/DO3w7e5L6gEl
 hp6rPLmutFn7MyOMei3RcoTzy05tD9dfjKLUBms8xrxYGURhim/UM4Svl+xNQkp4BdouosdkF79
 znJXxxM8A6tFBFC5tUxmHfhkbVvDWqqQs0EilTpkMDRIw==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1779280262;
 b=kARy1z3LbnyxQzmKYLlalfKvRKlNCgF8zoWJpcXctEOqc5lM7WLCewAok7dJfS/r6RqHmKX5
 xjAA1pIpczllojC+5G7ePwSwHWdAWY7K3Gc1/EqXiwZusBrMKEbYrWuzhDk9z/hwN50oAvpNDwR
 s7SIwGCYWXtjWgmx9P/LJ5f4QIxMcd/jHP3srVtXqw4N7DoodJscxiA4kHeqMR3zk090MxIm/Ne
 P39S2X4CqF7F6103q6S6ecqrPt2eJukdczrRh7IrISH8B4xtSSMfguz2+simy+XByfNS4ggJL8q
 68T9q5e6YFNlfy6sFdvVZAtGKfZVSQ6Qip2TcpqstJ77A==
Received: from mail-norwayeastazon11023092.outbound.protection.outlook.com ([40.107.159.92]) by mx-gate11-hz12;
 Wed, 20 May 2026 14:31:02 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pt/LWlkw0cnVd8GIpdJ/GGvEcjlcXLNRd6fizPCoTBHvdA95RaplRFF+dZr5HgUZNVwqxKDZKHaFf3ucxvf8/m5V04uzudxFHtXGRbV/B6NsjhhQtDZDbkAt9WMf6uihOthX9N1zQ8C/3YTqQfFhhoYW+IWtqGEjLvvICQBsxJ4fteIPZCeeKx8CAOaiK6R2cvrA6v56fwfVJZGBzJmyb5mfE183mB7WQvVt/5P4gonzRgAT7MrLX1bEtamK6GF2ag2ee6/n5PHmMXwQuX17+oIUc25GW6Pgt2a7IU2fG3ObDC8pLknoIW/j4434aBWlaDjvjeccxSY3sPefbjZtqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jj+/2PJVVujjQq0uzPyXQbPuQxZCfK3Q0jiTdKqkzH8=;
 b=WCNJMcDxJ+fAm6qxA9jV2TX68idIOjq5g//P/tOxtbOIEOBUN1ir9wwp7g/KZLdiNx9fNBVlSIi6IiW7d4qs6UPDKyet+lwvr/xMOXtlNAmMjExRL8nTAcb4UX3m+kN6a5hVIDmhMYZ7MUXEqBAU5IRaQIBbQ8ykDUU/gGy2Fu/JZmVg0qk9PbQ0cGlxmNV6HS+6oCPOZP7uWrER/Ib08RbQJhXtDhEu33eXT8Y141fJDqxf+oQYixoFNC9IXqvY5hiJOF9d8834Z1zMROa8WGrL6uOKbA1X33FtjZwEEXho+dVW6i1yJs/JnBKfmWNAhsmb3GJDc35yKVQEFWA+JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jj+/2PJVVujjQq0uzPyXQbPuQxZCfK3Q0jiTdKqkzH8=;
 b=aZQpccTQSXE5enTq2nlMw3z0fo+hl/u13GAvupf1pcHwqC9EKafbXDSkFng8XkwoNbVCLsr+8w2KZ0rfFOASbUF6aQe0xVizbmEqnpmsFuiijDUhVpsA06lzM0eimYaccERsyw9mol+k+cNeLSqWWia8jqJWsRM+cCLwsLhR3zNT57HfCw9zOrQYDjafpeosze2CDSdjBw8V9fUuLKpqzFvSNtZM21ndkXw42q0eDzK3lZUueU4pPDv6sS8otQCIN5yYwLFEfBX+iurA6BOBYE3/UaEOiD/OQ+olagmREAbQHO1byZKBb1BBrCGIZ7pQaFB5CmesCEtgzx29mIBDjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 AMBP192MB3401.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:75b::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.15; Wed, 20 May 2026 12:30:55 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 12:30:55 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-devel@lists.openembedded.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [oe][meta-networking][scarthgap][PATCH 5/6] dnsmasq: Fix CVE-2026-4893
Date: Wed, 20 May 2026 14:29:07 +0200
Message-ID: <20260520122908.3151647-5-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520122908.3151647-1-hsimeliere.opensource@witekio.com>
References: <20260520122908.3151647-1-hsimeliere.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0178.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::22) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|AMBP192MB3401:EE_
X-MS-Office365-Filtering-Correlation-Id: f6eed3b1-f2c4-4b99-9ac0-08deb66ba376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|52116014|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	vryNh5FbnNhNsUHmTEnrpdrreI12XmnrHeTBWHb6DdqyHHZfH6sf7JSIC6R93VdV2w/s7WqA7IXMILRg8F0JFTJIrJrW5RQD2aqp4Hzwkr6JLO9qKcoPhAV/Thp1NkkqUwuPVVhaREKWA1X7DIGE8PJpqB5hUJbuwnrp9Ou/FjnX3/Yr/sKSfX6bI/2gmsXRexAAy4mmfRgIgbrGJNJ6j8Av2z0gQ1HlVrS8o/rM/MF8R57plWAs8QZ9ReEqHc1ZH11R6l6OA9P2Y6aDi2qz0HYAGMCDJI0XVZYrG8LxQQAfhtvy4iZ6qyoTOVfZliQuUwBgAwBRP+I7Ch9wCW5zqRF59xxBAJtrOpL+Ku1NgL3UkYSLvzkDsYOdFyc2I2/D7G+HpdbJ2SWy1QerxFFj5/WqfFeehO5oPC8rby8r3TEbASrO9mIcCW1M4QEq6iB/BqFyCf0LAHDb991u5Dbua9lxXl3ihH0OGp67GhOnS7/hMg/GHSFQZGtDmdDcKdO+/VJQb6E8ZrhoG4ouvZqiOz01CSUChdyJMBBxzcup6Lp51fdiiTfF9C792cGQgf+hpceiS9asgjqn3AgIIkyJ+CeHLFC46IIEzXredvhuj7CGSTCn3A3r9AJjf2TObw/b1J82iPpBQ+SrGm6pFnpM9A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(52116014)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XNFt4Ve8iymWU9j+DC7SL0KLMkArw6Xho0SaAdkZ1+vyiEfdE1iyO9iRlb7X?=
 =?us-ascii?Q?b3XTGENLuGm7rBM9yLwu0nke424cWC62h1DeXobEd5p2f54ybOTUNQ9bNP2P?=
 =?us-ascii?Q?L0Ue7pjJ8CrQBZeFefomUEpKI1tj8eYkKFuHSa8XwmIvK3QdyrPiy1FYy34H?=
 =?us-ascii?Q?YU5hQclFm24hruCI0u9g7L7GmXuX1ghcDvsCIsby1JP3DO5HjrJDoL8W45ht?=
 =?us-ascii?Q?jNo8+34gnGy1lSh5pW+GFWF7A3A5Qt/Ax4zG2ISVGKF/vMeNJKM50485BQUC?=
 =?us-ascii?Q?qhWXD+PMUYxzmfudZkMCIBOhmgGEyZMxxUaRjqBOceEydYZSxqe1SddjWaNN?=
 =?us-ascii?Q?FF50dsfvH3ZWE8kstTeMIJu7Uy494dKPCYCQnirNsalhXMN0WvdoTcDR4+VQ?=
 =?us-ascii?Q?IQQOnd0gmxgwhJdfzd//S+bbC0y/6TKBSp2Jq1Z/7vpTn9AR1XmDzTonVS6l?=
 =?us-ascii?Q?pFcs68ylkGmO77fM2CcrlTkB0b3GYHv589i9YHAkJsENAlT4J8e7WmO2z2tw?=
 =?us-ascii?Q?ij3dO8+gXSajkeLQ3mf6WJLmC/EoknL+9PFEyCfMGZ4e4wHi7nQKEPMt6yzm?=
 =?us-ascii?Q?8vx9rY1vhUSOfbMWFqQw24BqhPMCYME1ohYb/oDa0efZRSfsOSNjKWDCuIl4?=
 =?us-ascii?Q?bvioelDpJTP36IxtCv4uYSNmy9r6TexYU74AdprvrY4uQ19OAFbOAV7BtQO9?=
 =?us-ascii?Q?tB0ywxRJPBgJncCp5HAbPAaY4zAOwzHpjS5CF3bDwS9aAT83PKXB2HPcqzCn?=
 =?us-ascii?Q?lgq3n2CyADFH/FM6YfzjSwpeXv4rxpPS84OtYB0XsDBOiFl3OaObEbyq4WmX?=
 =?us-ascii?Q?1zr77eNu5bC0VT2cgCJcS2ipd/FcQm4elKq1UxqoTzfWylm2V+JTyiL/Omzq?=
 =?us-ascii?Q?8BZg1nGkLFvco6/IPQ95VGn1Lblq3Xxv72Q9K1jAwATXht4AuEpGgo22Wsjo?=
 =?us-ascii?Q?gDciQYh1M37JOBnOZUwqyptdiZlt5UFlzD95dSaeY0nUdDBVMG3RdsMvkAGU?=
 =?us-ascii?Q?8SB2b5DuuZIKLPf5SmSqA3UQdfU3C4sx4bdLzDIAp4bPlvWe4CB6uOJFb0Nt?=
 =?us-ascii?Q?uHAHPWIip0O8vX1KN1MhmM7gecp18a2tozMCj4XgnB0aJvdC7JW/A1zelsnk?=
 =?us-ascii?Q?UKtG7pAjc+xO3BjDPN5GoF5KOaL8z26obFMm/kxjQuiniGyU+rKnn5OVuEN3?=
 =?us-ascii?Q?tLfY8FbwJZe3AnblGj6G610PERnO4iHkqAqmTlOBCSNpQMS9WlcQZnfRAPLb?=
 =?us-ascii?Q?k8U5Lr5am4IltKt2t66G0WWPdRWSxR7tEsH2B6Dpf4NoBeDIv+4tH7KF/6FU?=
 =?us-ascii?Q?UZh8thn9qoEK8oaT5DE50QByroBSk9ITpn9VSx1ZjdYFeA+ekXyz3Vp4cw6a?=
 =?us-ascii?Q?R+cFB61+dnxDkWxHxOT6Ez3V8sHR/60hchBNBF8zBFkJd+zBKSYG/C3Fp/Ll?=
 =?us-ascii?Q?ktx6ckBM+5Di/MKBVSTYkBNLMmkkQ7IIIPU5p3INEcsQOPl61Xw3N4LC0x+S?=
 =?us-ascii?Q?ZS2hMaHBwPLcWnoukubGYJP1fWh44BQS1vijQwKuTq2unQA0nGVYhWLAsTxn?=
 =?us-ascii?Q?25U1id5VgWssZoa9l9qgDI+wOzj3T4NyfkFnVInbNmpG3MTmdOt+rS3ROzAg?=
 =?us-ascii?Q?VhpfgCkg5LjynFJ/UtkRbbJr7QlhS/hNR12Gf16rN4mG4ysWQuN1xkGcLyQf?=
 =?us-ascii?Q?XXumrAETWoZFTh7RiOZV2+ANMT0NIGjUfeeCXtadKafony+3nTdbgfWl4tkv?=
 =?us-ascii?Q?7gX/da6q21u7j3ln36Y2KOzxgHffoP0STR5Onx4eXjK/rEAMuzxDs0pNxxZs?=
X-MS-Exchange-AntiSpam-MessageData-1: v3fJy4+ccLZUvA==
X-Exchange-RoutingPolicyChecked: 
	DuHGxkcV3LL7MhvRbnEO4VAhYk0PTtRYU76nclPds6lAZG7vEXY1jgNolIh2AEFtoYJRptG3PvxmUcpQTFacRZmuysZ1SG4o1p3N+CGs89mDrWcApt7jQdFGtTN2PHNqcr+QFYLR/Kvyh+G1uvGpNG3axy0MxN0xwN/S25NVeuajo4CosFAXITXbTo5xbaJunTfmVhBzt7FtoPWAgP0mDw6GQ0DZvPwjk/qYxXMiuLuNXs+SrnrvuAbIguf6JhynOwsJ0dxaMJw8gKYXIUGV/2aibYg7cKk4GqXwn4P6hVsOvZ9hQ4MG3bXJY/EvZpUAsBuqg2Xtp+XabC5vtINLfA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	zsboanh9bfiKpeCThFLbsuA1hDe6nVVI6EOYNVJ4hY+0RXZRzqTlD/k+Nxl/KHaO0c4kubQgkQ5y6ZtleCEVFnu6aj6ZtJT4ah9Qg9EKyFFU3bSVl2s0kr8NVb3giBd9uCMCIPtn6fDqEw82mnSoT2k/ss7OSIxBPi9Bym9Cz/PxVk/tPAHwbR7PV7TMasQzziTI1o0DZL3wFdb8dlj5AKDwnsTeT1WIvmrH4y4S8rxZAg8mtK2/H241Z3xo7ajXk4zK4VRjWb8Q6/zc+Zht99QqdjY0v3rwpB4c3TG+Lv45GfFs1GU5yNCQIvF83DAgGIJTyT2JOkfisOyMdhxxyQWkdvu8SADRE7oSRYx50zh6Yk8VboN/NPZZFL//5PnaFm0bIZRBv/SXs1oCfzXxJYY4cdz3Ydmz9t+qjrS9XzfrT4jSEc/mXSgCdM+8/SUXPryQiUCaiIIvjp7AnELllLu/mSFeLnvrsJm+CmbC9M8ZzYvv5RbZ5yCyGEFfpr+z3RMB9yQVDMPAvjq8/G7nkdSHHUSyjIyvqSUN3ziWFVZVeMRtVuJwn3099DuBe1a10CqVO0eLE4KWXGYKotVoeFZiXUx6F53WPm2gQjjZ3HYgpdfUxRdggeqisy7dfAdu
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6eed3b1-f2c4-4b99-9ac0-08deb66ba376
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 12:30:55.4331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JIbvlpaJGN4XKqogO+PW0DZmBH5fVoNmgPvLaaGPkR/h6t9zHrGjQc53+x61j7Jn2QFJmaNyOppw/RBfHYUP/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP192MB3401
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-devel@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate11-hz12 with 4gL9r10SRxz46TqR
X-cloud-security-connect: mail-norwayeastazon11023092.outbound.protection.outlook.com[40.107.159.92], TLS=1, IP=40.107.159.92
X-cloud-security-Digest: 934bbedbd05ed8681c9b3a7b215c0dd9
X-cloud-security: scantime:1.663
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 12:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127114

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patch from [1] dnsmasq 2.90 debian bookworm pacthes.

[1] https://sources.debian.org/src/dnsmasq/2.90-4~deb12u2/debian/patches/CVE-2026-4893.patch

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.90.bb   |  1 +
 .../dnsmasq/files/CVE-2026-4893.patch         | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
index e08d9df18e..3f06bbb6cf 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://CVE-2026-4890.patch \
            file://CVE-2026-4891.patch \
            file://CVE-2026-4892.patch \
+           file://CVE-2026-4893.patch \
 "
 SRC_URI[sha256sum] = "8f6666b542403b5ee7ccce66ea73a4a51cf19dd49392aaccd37231a2c51b303b"
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch
new file mode 100644
index 0000000000..8aea321329
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch
@@ -0,0 +1,38 @@
+From 262aadd7a38947d2299234c8c9cf736ff6ad955d Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Wed, 25 Mar 2026 23:22:37 +0000
+Subject: [PATCH] Fix broken client subnet validation. CVE-2026-4893
+
+Bug report from Royce M <royce@xchglabs.com>
+
+Location: forward.c:713, edns0.c:421
+
+With --add-subnet enabled, process_reply() passes the OPT record
+length (~23 bytes) instead of the packet length to check_source().
+All internal bounds checks fail, and the function always returns 1.
+ECS source validation per RFC 7871 Section 9.2 is completely bypassed.
+
+CVE: CVE-2026-4893
+Upstream-Status: Backport [https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=e3a26d092e47bf1d18aeadb758e4ca35c83b5f2d]
+
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ src/forward.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/forward.c b/src/forward.c
+index 32f37e40..19ff4401 100644
+--- a/src/forward.c
++++ b/src/forward.c
+@@ -710,7 +710,7 @@ static size_t process_reply(struct dns_header *header, time_t now, struct server
+       /* Get extended RCODE. */
+       rcode |= sizep[2] << 4;
+ 
+-      if (option_bool(OPT_CLIENT_SUBNET) && !check_source(header, plen, pheader, query_source))
++      if (option_bool(OPT_CLIENT_SUBNET) && !check_source(header, n, pheader, query_source))
+ 	{
+ 	  my_syslog(LOG_WARNING, _("discarding DNS reply: subnet option mismatch"));
+ 	  return 0;
+-- 
+2.43.0
+
-- 
2.43.0


