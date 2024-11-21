Return-Path: <benjamin.bouvier@ekinops.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EF4D75BD3
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 08:29:41 +0000 (UTC)
Received: from PAUP264CU001.outbound.protection.outlook.com (PAUP264CU001.outbound.protection.outlook.com [40.107.160.128])
 by mx.groups.io with SMTP id smtpd.web11.6472.1732177773316989998
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 00:29:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ekinops.com header.s=selector2 header.b=UB4JKHoX;
 spf=pass (domain: ekinops.com, ip: 40.107.160.128, mailfrom: benjamin.bouvier@ekinops.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Akbuo0WasBRJ6CAaZNn7QlXtHEOJzRJbI4i1ileDO1UssR21yyMYCdkyYUVUIAwhGRQHPxRtJUbJGtdkH8uE5hbKHh8hYHYpA2kNxsLqEUyOMvSVURp0jSDdO8JC/wWxu8FxvUY0pe0qp/dbpuvwGyiwFRk4C3LY4K7g2R407pgDFtour9s/5KENTQekHhKCOWLO/W9GdtFz1JC0fDE3PE+bOukCxHcieUFApKlypCDRYUY6DLVH1MdqUa9SiYigycwbruo3PGvZAOFXq9pTSYKB40mbmpMqyHU7H9N/V4q79e4Ww1ytcMEfRHbSKuS8FKQ5/doXNuLrCS9mrOS3Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayzkX782xUfUKFanZ2OBfpc/DRUjVb5v1SFlwTyoIPs=;
 b=cWN3u37DmIyV6sWIC/Jv1dHRJ4fn8XT5d9YKi7O4kRZhoZyYxh0y2yyvRop+3IIaNPIFRTJcJ5iT+Zuajy5c/wFI2Jb4fATSMMVvdXudZeFtfL3ZHMt6UE7br5HkuK2Up5Q7jT42l9a6NM22g7wftA+Q0DFATriSwYwvIF+yfm7yVgR91hr3R0ruTduhbL4SIt7jdVg0flG+YYf7KlXgDbzheSc1RC0hJTIT+SEWrsWiuU4JdWrranBHx8IhEOVmlvV023HzZtkrMxhc+De1MJdnfoWovaGRhzVncg1mfGkOtS2h5wxtu64SqcU44WT2VKRl5x4L3Fi9fGSMnQjNXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ekinops.com; dmarc=pass action=none header.from=ekinops.com;
 dkim=pass header.d=ekinops.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ekinops.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayzkX782xUfUKFanZ2OBfpc/DRUjVb5v1SFlwTyoIPs=;
 b=UB4JKHoXzDBVSvdkSyAY1AOGszd7Tq/Twt1ssi3KW8DkLxwxaxUT/7FTItYbMTox+YulXc7z0Su7QOJo+TfBbYfiBva+ewznkuffjVqPLVATz0CUbFH8yTdfyW2V5jQ1ID4/uylxII/DnzG9NdSvxkO2w+m3r56YQRloD7caoG4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ekinops.com;
Received: from PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:255::23)
 by PASP264MB5740.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:49e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.16; Thu, 21 Nov
 2024 08:29:29 +0000
Received: from PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM
 ([fe80::6d29:2327:f523:aa1]) by PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM
 ([fe80::6d29:2327:f523:aa1%3]) with mapi id 15.20.8182.014; Thu, 21 Nov 2024
 08:29:29 +0000
From: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
To: openembedded-devel@lists.openembedded.org
CC: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
Subject: [meta-networking][PATCH 0/3] Add exact CPE name including vendor to several components.
Date: Thu, 21 Nov 2024 09:28:58 +0100
Message-ID: <20241121082901.2747720-1-benjamin.bouvier@ekinops.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0224.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:374::10) To PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:255::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR1P264MB4342:EE_|PASP264MB5740:EE_
X-MS-Office365-Filtering-Correlation-Id: c52f7472-f4e2-4194-0f4e-08dd0a069e24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Qzjs2vraJvspSaWBzjXGOQqv+5ie3xNartHa64JFlvUvB1ZI9EZs/SRP8BSH?=
 =?us-ascii?Q?CRMKIPNKc4BvpLCjUvGnRcI6i9hBgSq+9a95E+lP4jkysQbY/uf2qoWHIQ6p?=
 =?us-ascii?Q?y0VePxysIqCEwBECSSuNT0XHciJ1Af37QWJqmAoJW0NTshVVgFryCeLneBpK?=
 =?us-ascii?Q?Sev6+qC2dGAjlUdy+AWxp7zC0MAZGfCswITcQTaR6Tq3yrLSpMt3A1eC+W1T?=
 =?us-ascii?Q?2Aq05dOeiT2nE+68oObnTEB9Z+75H68g7JCiWS5bvl9bqPqjmh+8omN/4jnc?=
 =?us-ascii?Q?5WHat4lb48idbAqRT636QLgCOgbXu0DROZsCYkEOE/Z8PtT/N5VUXO0/u/X+?=
 =?us-ascii?Q?g/gI9SdSKWDvprzWtg8suPOfgiic5uPIOxgxoNnedj6L8NFXG5r1mzN1EYGK?=
 =?us-ascii?Q?XS6V4DDISftySUaataw09K+v40cTAMaf/JsLRdvjETvswr8Nfj1+465F+Yjq?=
 =?us-ascii?Q?GuBaKic+iUXrUTb5oSacxApCEgza9ZqRdvSPk8o/UTPHi3RC/EgXDj8Gwzd2?=
 =?us-ascii?Q?Av42YHiCji6qnwsShtF7ytxBdcddPALiJJzU9LUI4crELz3DDeyEjO1/zucn?=
 =?us-ascii?Q?0qjBWktcMxqU1ViB3eYaRLDbMZuSemHeONF3nWcpGjpMFw3XUTaJl9eeinok?=
 =?us-ascii?Q?eI892k5RS1ulnUbFmYtHWRVx172VMbjGcZ7qkOCsxicDMdCwrA629TkApUiS?=
 =?us-ascii?Q?20GfilTcgssHUESzUquxtUNq6nmCYib1ofFgcFjsQgZdvgWHTGXzJPI8r//R?=
 =?us-ascii?Q?nEM1pZMrxyoxBXe89khdChjnqej92kqoZr9KZYOaTt2wsNxQ2UizO6ln89WZ?=
 =?us-ascii?Q?v9hYrl62C1Dlih9X1jhxdUIJDRPS5hh9sXk7BrPOtpIraOz2Q+TzZlZE/nod?=
 =?us-ascii?Q?wpK8MrjCeW72qd2CgbKw32TsJPTxWUeZ70SHCOP5iO6wfPbMPJP1YO82uFBb?=
 =?us-ascii?Q?eHA7eOqhk7KFxheg9TJIH/25LlVpDbFkEIMBGo6tyx22+qNbdZMKIq7jk7YT?=
 =?us-ascii?Q?xaiRBjNpttvKgCIzffyAQzCH7QnxxeGrpL8BmG04+v8GlkLvYIbKmlYm7UAa?=
 =?us-ascii?Q?POPc1jbqdx6e2P80UyF6oNcHiCLZ/jwsanMtxAVcsoqyUnEVQygApJSzmal9?=
 =?us-ascii?Q?RqmtKGJMiuG9bTuXAyspO9W1mHEVdOZwEHRhwDsqwORzelwMkjw5NYi1dQ1X?=
 =?us-ascii?Q?f74MAWvKVUMNncPE30bsPmgQuyPmIuzKJoPRKQnofD6duqCePa+ufJZpbCHE?=
 =?us-ascii?Q?wZjDLQXcaVM/YLe0nZdS1dwknAHHje7pfbfIWWlGZ34H6UvibskmtHMlmLyB?=
 =?us-ascii?Q?w0KKUso407+A6nLzUMjqeoT9Qe6kW1flHyjZD1jZdRunt809NM4lKy5xKX3o?=
 =?us-ascii?Q?hJ6DZGE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wdnL3vmGlYjM/9Uov0jtQH5t+pSvcJItEaWXa4Y1+ocEae6Rx7qTiL0w0Rvl?=
 =?us-ascii?Q?nA+widSLzvYy30fYiriv9Q3/TdeDjXaEz9zo0zU/zL0VEYkPIpaMWBkWWXyD?=
 =?us-ascii?Q?zYzyutWfLSEe6YUd5yWB1qnQ4NcTiCfI7OQNHxF3jFmd4d4xr+xrBdvKVzpp?=
 =?us-ascii?Q?V1hhtMGoYi5yF9Ck6yOEYg6OxLLAQ1VtL1zuMFz/3mlwKHYB0dCChPBR87sy?=
 =?us-ascii?Q?2lanlBAT0w9bNYkWZo8ltlJqqA4bVXLb8LFNHGWPM9wQOBQGX7nKpMHyz0JV?=
 =?us-ascii?Q?H4IYK9lpZCTFv7gtAPau5TLnTzWYBXBLRRPnzZtdmbi/eIpDHiZ2W7RzBzJ7?=
 =?us-ascii?Q?oU4j5YK+79O4+gdmzvyEwtbp+xMHm+uoJdb70tkt69mGLf9ZlLW/6K9Uv5Tc?=
 =?us-ascii?Q?5FiS05RpPXL+iLAe6aypQl23sYE04zIBvZTNK29s00OML3v6/f+rYi+RTMC7?=
 =?us-ascii?Q?iLUhhHTs0jNLqaNhk9//K7TWfjCXWhtvz4X0Cvm06x8MmVUIk0xypFQ01Ax3?=
 =?us-ascii?Q?5B2WhZaP57Jh511V1ZUEO3sTysgNMp6TwELOHaeiJjJn3b1Jsx2vAmcyYJio?=
 =?us-ascii?Q?QR/bH5ZzqE220lC/Xj6x+nPTsm6X9gxrwaM323zy3SaulrL8AWLltq5mTJoL?=
 =?us-ascii?Q?89Wwz8K1lNiPmZ+fa58JyCjVQ2izmoHUhIqnfwnV2woyswrE7x+icehvv+he?=
 =?us-ascii?Q?QPYdsjEN1NyXQEN0c7hAytgxG6GFB/BCDrN94b86g8Yy0NrDYJSMM+n7id5f?=
 =?us-ascii?Q?BbA2pXuENLSqFIXC7Ghr1K/07ElqcXBheRxm8RBTx/Ts0/H3AAEmkDLRUwGP?=
 =?us-ascii?Q?hcweNVOON8j3WSK33+HwI8ir7JOtUTT2H95DgaF1dtZtnjKrueWtRCAPyX1T?=
 =?us-ascii?Q?gf+TEUJOKBu18kgBT7Wd4bzvWEcWxL5PkYLz971JO/UZBYdU0SpRPkGceS9d?=
 =?us-ascii?Q?orAG28FmvzKoc0h3CbY8A4+FwryL5uvLBWV6GaAw4WrcxsvhafowBKm+hjJn?=
 =?us-ascii?Q?p75p1wbmL/EBxdUas65eyuRhjkZ4p2bJ/47KL0GGbZfLaIJKGebSfdYqhjwT?=
 =?us-ascii?Q?asmb8G4NasdVl8ZgBLAcqCuCz8zV3ZkDinR+f4Oy4cFaNoIF/QlHExv4NwMq?=
 =?us-ascii?Q?FWWsCdgXWR7PNTV1So+QVJsKwbIB5I3nvOaHl+EmKljRvCo5icfjhM6yz2xm?=
 =?us-ascii?Q?giYkD9LsVl82I/PABFY+Do4Gy7YGT00FKmpGy+RI1NAnjYAN+VjaHiH+6nZj?=
 =?us-ascii?Q?tAw8GO0TtruBjIR/DSwBOLmzBmmKQ40QeHX6rbq7X2jLEWgRLdblMHdj7Mlh?=
 =?us-ascii?Q?kWPZxxqScKm91d7kwFLUzzbdwVIyuT5ezg3L0sBWHbgyH/sWRIPkDky2V0Wb?=
 =?us-ascii?Q?x3sxLtBt7s/FGDVSQP5EfqKyxaR8+t62ykCrGVO1yzOP4kScTL+Y4lMoAkrk?=
 =?us-ascii?Q?R1v8fDyeYqI/N836hTl8BFqYDG1BMyhur8q0F23uIdA9kRM77dn6fCd23hb9?=
 =?us-ascii?Q?o/4T155n35Q2+3SJqS9R33NDDYvH7HDXAmjCqZeyuL7URQcwVlfdD3kbDUNo?=
 =?us-ascii?Q?+lrF9WCyYYFO5cmPPzCYNQjqsS1Hccnj/1lMbag4Ds6ItV6n2Ohtqtvp8P7S?=
 =?us-ascii?Q?/A=3D=3D?=
X-OriginatorOrg: ekinops.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c52f7472-f4e2-4194-0f4e-08dd0a069e24
X-MS-Exchange-CrossTenant-AuthSource: PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 08:29:29.7575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f57b78a6-c654-4771-a72f-837275f46179
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cm/2jnO6vcCT5Qem4kfwARRsyDk+JY4UIh+qWlWB9eEMegHEXR+XWHD4lI9likhojJgzoC3qAYfQRLt4Y1hQylPx85iV83C7MZ1sOr4J43c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB5740
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 08:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113957


Benjamin Bouvier (3):
  net-snmp: add CVE_PRODUCT
  bridge-utils: add CVE_PRODUCT
  tcpdump: add CVE_PRODUCT

 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb    | 2 ++
 .../recipes-support/bridge-utils/bridge-utils_1.7.1.bb          | 2 ++
 meta-networking/recipes-support/tcpdump/tcpdump_4.99.5.bb       | 2 ++
 3 files changed, 6 insertions(+)

--=20
2.34.1


