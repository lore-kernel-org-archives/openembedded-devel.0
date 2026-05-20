Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCB1CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 12:30:40 +0000 (UTC)
Received: from mx-relay31-hz12-if1.hornetsecurity.com (mx-relay31-hz12-if1.hornetsecurity.com [94.100.139.231])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11007.1779280234048560800
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 05:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=sLkiGlGb;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.231, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate31-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.84.142, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=db3pr0202cu003.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=84vFzRQHxweH0vJGaJh2enwZVURYEJGPmy29PjUtZs8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1779280231;
 b=OtFng3PspfBT5najEhI4NLaDGfmugx5yMQpCtjpX/tk+V1ECMxrk92o5pXFQLWD9PrPE53da
 CHz8GH874Vwsw/lgX1CD1CDAD+qZ9GOnpK0//3/HJYt+e1StmhTuZ2TTNmlaYyIf4kuAerkNOct
 EyIKa84k64WWI0Aq/McnwQIluGxD52j4kzMYn82p+REPs4Tl0cBuZ5xd6uQWnxYa002Gka35Fx1
 NivoJvsbO0735yWFeRxs3+G8NuQF+z1dZJ/KwJZ395flCbdDExNWHGhSechweVpRmSnSL6xbfm+
 b1P+5mvjSiFxd8yZoZFKsuqZhU79kikyYPZ4KkXJec6mQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1779280231;
 b=oshDuDYIkU5UD1Dw5cEQma7vCweXbbZficOCDRDvqWt8EK2tM5CzXW1fv+2OYd3JJmZpU6ID
 sHrKNFtEaTc9zDZ7tHFuEJ7lK03FkP6zfIQWJve6AfLXNwiOhh9rLgzYASreSj24yqORMJ4B/tG
 vu6+7zxGtE8oL/axcnxKWHtv9uwq50Q+KDndTe1vsiYGR3SxKwkdcoVcRW+aIvCjBwt7bbj9Q0d
 6tYlA47eUFzKEBHYdldo2nteMPv4iOJ1VF6aptqp1z7fZmHMn7ee3TzzGB+IVYkiRjCJ64sEDps
 Bp9VaDxZm2KWsWcUMHMK4cpZezSTy7UqEoD20VvsIq7Zw==
Received: from mail-northeuropeazon11020142.outbound.protection.outlook.com ([52.101.84.142]) by mx-gate31-hz12;
 Wed, 20 May 2026 14:30:31 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dI9V4CcE77Efmc0gMYdDqmjDHtbu0nII9o3si2XoS0xMd7Gy7c062fFIdr04Yu5TI56M37ZHdMhloCNZYIKwULCxnrcXWwXgAA3+tLvNXGl+bKp7aZtjsRsCZS8ry03Wbj2Xl3T6AifotVWlwyYY9Q7KJgZZQZyo+zU2RbDSu0lMSIxqC8pUS+EHBY3MUYT3mFpN5GJ1PRGHwJc/5GQNMMTTETibWTDw2dvb1x1DJ5eO/sAMmEawZ3bYadOIvLr895TdeOafCmN/F6C2HQgDP8+WHnl62AGEpi0KS+9VglLSWym7GZkRCA0VTl1AUEMo7g6DFK1XwhNozNYINCs/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84vFzRQHxweH0vJGaJh2enwZVURYEJGPmy29PjUtZs8=;
 b=yd8ul19Edhkf1OPluPfWyUVtf3xo7Ezyf7xH8/oNr5nHckztb7/K7QxnJvcyuoR+eJwSO6bFyNV07URrKKT7gKpkSJ2ip+vhwh9ZkxsDrg8aQNreRCPzZdvIb+2na19kcf/DctxmCzOPdTXL1a6Af5uLgvSexwQMEshHSjhcwG7JXIIgbpMHW6eFfXq+2pwwZ8lrKcnYT+0t2K6ze9gt3u2dFy7cESCes+qG9npff5nsvCyRq5wJxNHxwe0QQrqVfJCiy0UYbQuJRR5ABzDwPEzvRHtLhJxQaMymhpm8uHWS61I8ae6XwbZgsPshFDYxSn1KnOs6xKEjVAE6Ywpp+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84vFzRQHxweH0vJGaJh2enwZVURYEJGPmy29PjUtZs8=;
 b=sLkiGlGbpAWfE4znMTAOLmBi17ZEqtLNB0pb0PNC8Y6uEax/IThte51bSGGaSTnrN2B9bKjxH0d6W0oT2AfTr40uU1rSJmLvydYT62Nlg07ct5LrCNJBB42T2q+4ZS1xBhKII1Z7qDu4etzs2l4JkIiX+Q8QGX7Dbim1mzAcsEiw6FRd5VfPWPc3QVeumTwQNZixxuQYVR8GNuczW9ZC97MlHFHD9EE6ulUaoWap6vV6LGpCNaRR0GJtl+CQSme6UVjhOPQ3tu4v9jeGvsCjwSFNzsxOYzpRU+q68pUIaaIGcq77plDUTH+tsC1R3xw4LfDajZtkBSC9/py/P0udag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 AMBP192MB3401.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:75b::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.15; Wed, 20 May 2026 12:30:21 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 12:30:21 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-devel@lists.openembedded.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [oe][meta-networking][scarthgap][PATCH 3/6] dnsmasq: Fix CVE-2026-4891
Date: Wed, 20 May 2026 14:29:05 +0200
Message-ID: <20260520122908.3151647-3-hsimeliere.opensource@witekio.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7c013fb8-b02a-419c-ec1f-08deb66b8f1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|52116014|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	jIX5J/D/3lK3xNYff4aIa6H9vp3gu9WAFtjiFzc4kWdeDV8Qe3A1QDXVMpV16duZOc7qrlJgWmJcDhMmnFis4pkkS4SNTlwTvFDSYj6PBStsXNFqjpX+NfD1bgu1ihYJBNg2kw3TXO+3cUNYWv9n12PRXxHHTaQNKT+cQXEgkWyOM7v7qEOncKvt1JMFO/AYcGnqb0W5Kb9CsBTrw2w2ugHOQpyDU+FNPhlhRb0XSF3Ej+xWB2xRhtDSzoQFap/NO5Kau5BX7Fnb9bdtzIm78bGIdNKEfnnpGQeW51uke+7S3OHQ7VCJErazWeFW+QBbq1cDygVJqi1LPcpY34EUHW2DFbl5uVyAXnKCHaQzkxOki5hgJ8CCQ4+ERFNGSoPOKU7Daxkdo1JiCVlgC5JlcX8Eco88wiyxisZi3oE764fJq0gaQB5qF31PMwawlsx+l///mJTxg9DFbL6nAFgiK20IVxPSejUCwJbjaNYkhg7hDbk7MEb6WVHHe/wdXyMRo19ZUsebzSCkPh3kqxZtV4ScxZyYlADYTTv37d+NHgpadnuO4FEQZFglSrx2aKEr8YLW+uxvRB2GTuaPEKVfezXC4khaENmS7MXJdRe77n9Un38MkkGgpO0GrSXPBssbrW9i5JWMvwoOVvXc79UM+Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(52116014)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EtKTWkwf2xze6R0oS8EoQxyWd+dvjMIfdEiQpoZKcV2h+4hxpzYzn9Rj7XCw?=
 =?us-ascii?Q?Xi1GslTS6OUJzN3E/Rs70RMmIATylrhMNbaBsoSLkf2ljhRK8IYoV2z8ZUuO?=
 =?us-ascii?Q?A93PBkVvL1jVd0/escp3QsqD0NyrTvO9oMzy2DM3WrIfIqwsgvsuNPq1DWZs?=
 =?us-ascii?Q?dZKgPEHzsSuz1AAt+y0bvL6AzArfxwREgOvOeBrfEwtjj05ZM8IbAS7C5kU8?=
 =?us-ascii?Q?8C8WojdbK8tf+ymdSh1yJZ1fquE5LwBvWpSyW4zxxWReOFBI5jZ8boitGvMO?=
 =?us-ascii?Q?mql86FJCqQLDrjS7bdct/c24HdL3mNa6PhbOy4vePS+t5JbF6xUVzJJ2+4PK?=
 =?us-ascii?Q?HUY8QTAFNOnEXfPtCv6aRzWRrIx1tGCDKKxYONGT8HprOxisMUMOK5yfS5Mv?=
 =?us-ascii?Q?bJcBI/AQv+lJbYxo6RZ5SY0sOFbDSU9c4xe5OOIyMvoNLoVaQUiyiWP8ljlA?=
 =?us-ascii?Q?KIOW7eLgZWC2P1HnX04NgiQkQMASGMlC728JBT8QC063JEh9HArRRULH+gOL?=
 =?us-ascii?Q?1gAPUzmWuKx3svtVaAWLLbny2m53XyxQWqVcEG3zOXBtrj0D5BYmLwEnH5HI?=
 =?us-ascii?Q?3BR/SPjVrPRlTrS+1ZqQ8kKmb3QljdXHEK0nBmHIY6I4zzyoiyz1nhlS6Vv/?=
 =?us-ascii?Q?ddqVurYo1bAy40+lQFLVGC0/cOT5MWki36+YozByVXBYuF92i81FYywAMCJ4?=
 =?us-ascii?Q?z+sSiO2RrPv26sYqcyoUWYI/5aBl+bFg6VThoEeLy/x1T/RrQGxNxp/kd/Yq?=
 =?us-ascii?Q?LOnUnggJsJMhx4ThzVEhzRmpRkze70MwaUx4aECqnYwqg3Eu/eE3jd36exWl?=
 =?us-ascii?Q?viRWxboJQvHyn/K4fArasPF64y8Ooskn0ZcI6POXjyvyUS5U51z/vcO28I5X?=
 =?us-ascii?Q?d+3VVf6Z6Sp0Sk7l46Jkr7b910r0E/V6WKvT4b2hzSdVmMzrrZxZ1RzLvnhR?=
 =?us-ascii?Q?KAG4n3ek4o378ZW8N022xKLNWys+aGTqNn+EnOMNE3+BjsZCC2im5uiC7Md2?=
 =?us-ascii?Q?xjUwgJydLzWzCfqvCynTJeCMJsYcmogDjNvPxL5KKHZ9+psuDYtVZ1dIGSHo?=
 =?us-ascii?Q?1gGEMgzO9l2sg8ImkbXV81jKyH+rdyMHxomGn0oEhZN0sfHGTzTcIzrfuSa1?=
 =?us-ascii?Q?VL6PIZhMF88Oe9yhr66vs++ltBUtmyGI1R5dd+X3Tg2Ai55idz0nXpW34kkP?=
 =?us-ascii?Q?sjCSMoqHuTRRNrLLM49+5Y1jxBIPaHcnIfmm6oINL42QPsSFIEw6ogGb/4Wj?=
 =?us-ascii?Q?IM7EQhSNjBQJB1NXrqN2vzmklK/tlsXEX+QHfi0+mphr3q51tZTZQE47PO5U?=
 =?us-ascii?Q?LozIvteAoAOK/crvtUCfbt+W4Iebx6BvhP+0j0+rPdTJ1+aGVG7nMymv4bql?=
 =?us-ascii?Q?8Bffop7YyEh/fnvT2AmKG1WRCzBPHNbuRl+TO4WkrJmZ45R+I18jTFRGxpt3?=
 =?us-ascii?Q?8WbCwR0kqXX79ATaNDM8yqh4LAggKbwE4e/HlFhyS5MhmyuB4ixYrWCWQY31?=
 =?us-ascii?Q?0mFEuExDml8U3WjLwCKRPIitsVltz80HGZblWoIpruzRR65qkSFFF0kzMKZR?=
 =?us-ascii?Q?xLVHsgkVs3sm2HF0FrwKvI5hYmZ7vD/e3C/vCDlGlH3R3lDOgId61giEEl6+?=
 =?us-ascii?Q?qOyv8KXBiF440P24ItzYywWynepeXp2mvNO8zn+k7fWMcAsAkd2/ILZf6sMr?=
 =?us-ascii?Q?7JPUlIfKFp/JKXc6si2PscLxrTx04v3AdZIBsYzGjx9VBqPuSJbPbeLyeTNx?=
 =?us-ascii?Q?8AThTtSHJvdYpmJVbDtePPcqqEh9ccDKZ3lLjI0jhbvnRWswy9b6HunC9EKc?=
X-MS-Exchange-AntiSpam-MessageData-1: 8NP6Ur56DyGRwg==
X-Exchange-RoutingPolicyChecked: 
	MjQVta3gkrYrTwIgMUD4dsIeRqow1rxGsuSXSHaYdItH621PyJr2Wzb8yso9dy0Lff6KtkS2KUsWgyPeaCuOun2bdBr7e9aCw1ydOcikYZlxc5NwWpqLN8db1/c38ey3XtWFfndvufQXoqGGVFRUu7HJJ/MXgQAZG5ok/iLwB8JbP0HOUu9u9jW0EPFqA3pd/7StXEKukKxunWrMwFOmk4cIJ/V05b8DygH1Vwax3oWlF5Vwckk4R47jyJJBmLJ5cht/9jeFYgDxFpvpjt4ZMlqnlppFMkTScc4QMtOSgGKchD6w/UgiuucFEaQhxIbQktj/8isxweVAFpEWZ0sP5Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	N1HOmyFWSiRqIQMKD5X0FpzbTDdPLhOMGCOZ2myFroE4jdLz/9kNIYRWv6wlPNU9y5PXKpZ2AvX9hObibK6vHavudHAgrummK6/Bj3LWPugzwnsL5C6+JSYBI10NLhe+q4jqUXU4BBrscwxvQrFLgYAr47iXpQcLrtev8G7ePsQn7p0w+KDKzf3jI7YfBUczVzsu2nrJb8Q4w7dQG3l0N3T2X1tquXNY0IHZdtY0+ATviYYD5L5RKxXMwkjfZc5lD1DwoY75zVUS2z2Vo4pF2IJ1ptQgF3NPDOdqmoFwvDTg4DnkY04BKhN+FDwjvZYlUudHHgHukWjOMJDBdalm8gkDwfpTRk+IZTRreSslfT9A1g0uxLPPZf+jT7S+HxtgsHS0MQf1QR7TgHL7tzwDtQBVpVpqwCmkJ1U4g9T0uFKSg5WZcHORUeHRk2pxxMWGTQ+OoG6WhgxgvFJqF9C8UbaIawKLONSfxWBCEZHh9w/FAlnIpyjCcO5cmtOIh2CQtio7wtNrVnxaOZPq3Y3elggMcouffv8GrENBHuGw3UVUcIioxsJc/vopHL0OXViX54tAs/wR9wdD8a2AI69c3wOYDEeUOnrg7kfPPHRWvd1Y8biE/zJ4ndFVzw88x1+6
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c013fb8-b02a-419c-ec1f-08deb66b8f1f
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 12:30:21.2846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1p+CDj/gQcoXKYCwlU1sylVJUTFjzSwZyae93mduI6uUEeVW3CeyKq2D+Qv/FmyDWEJwn4Dz8JJPSEhQ7lVhYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP192MB3401
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-devel@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate31-hz12 with 4gL9qM5MVkz2TSft
X-cloud-security-connect: mail-northeuropeazon11020142.outbound.protection.outlook.com[52.101.84.142], TLS=1, IP=52.101.84.142
X-cloud-security-Digest: 2ede330b621a022c7bc1edf775fdc932
X-cloud-security: scantime:2.095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 12:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127112

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patch from [1] dnsmasq 2.90 debian bookworm pacthes.

[1] https://sources.debian.org/src/dnsmasq/2.90-4~deb12u2/debian/patches/CVE-2026-4891.patch

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.90.bb   |  1 +
 .../dnsmasq/files/CVE-2026-4891.patch         | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
index ecd17fa426..ed8708c339 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://dnsmasq-resolved.conf \
            file://CVE-2026-2291.patch \
            file://CVE-2026-4890.patch \
+           file://CVE-2026-4891.patch \
 "
 SRC_URI[sha256sum] = "8f6666b542403b5ee7ccce66ea73a4a51cf19dd49392aaccd37231a2c51b303b"
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch
new file mode 100644
index 0000000000..b566acb286
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch
@@ -0,0 +1,44 @@
+From 046fe2393ea47622b8e1c3e0c6dcca8347a6c431 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Wed, 25 Mar 2026 23:04:08 +0000
+Subject: [PATCH] Verify rdlen field in RRSIG packets. CVE-2026-4891
+
+Bug report from Royce M <royce@xchglabs.com>
+
+This avoids crafted packets which give a value for rdlen _less_
+then the space taken up by the fixed data and the signer's name
+and engender a negative calculated length for the signature.
+
+CVE: CVE-2026-4891
+Upstream-Status: Backport [https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=788b4e0f6c05217981b512bed4e5fea6f8855d01]
+
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ src/dnssec.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/dnssec.c b/src/dnssec.c
+index 68f1b5d0..d32db5b4 100644
+--- a/src/dnssec.c
++++ b/src/dnssec.c
+@@ -546,10 +546,14 @@ static int validate_rrset(time_t now, struct dns_header *header, size_t plen, in
+ 
+ 	   *ttl_out = ttl;
+ 	 }
+-       
++
++      /* Don't trust rdlen not to be too small and give us a negative sig_len
++	 It has already been checked that it doesn't run us off the end
++	 of the packet. */
++      if ((sig_len = rdlen - (p - psav)) <= 0)
++	return STAT_BOGUS;
++
+       sig = p;
+-      sig_len = rdlen - (p - psav);
+-              
+       nsigttl = htonl(orig_ttl);
+       
+       hash->update(ctx, 18, psav);
+-- 
+2.43.0
+
-- 
2.43.0


