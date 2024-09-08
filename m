Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F223AE6FE49
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 15:36:16 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.98])
 by mx.groups.io with SMTP id smtpd.web10.32351.1725809774676797854
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 08:36:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=iFGj4ISD;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.98, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhkitAZnsY6c3MCZNltYcE0i3Hqk7hBxZ3J7NZWJInzELoDngcSKOs8mVh3NJiNQe6Vp8HuqIFmNpG3BLAOmq/5/QAOx1UVbXriasauEddodSq4dlCXcyB7EOzDO5E0I80ycVCDytwhQihGmx2NlZkbLn02PY4LPct8m5vrf1/McBYGspTzK4vnShaJmTCykvy4GbcAlxLP2dn+ElECKoz/Adm/L2DQbPwRcwnLjnHpYuEZO2/CWc0RNR1Ze+AnYtub3z8I0vnnx1W9UroU1lZmRnYSWlTwRL2efQdyROZP4dCmKI0QySJOxeoZ84I6nTro2nm3VNPNVri3EbGgMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkTz8KA0H02PjdKtuFj1ITw/fdE4E5PZkQkeoFQSpmA=;
 b=Jr02IuCaATNR6tyPdMMNiaRJmB2k6KSl7LC5gz0rVovwg90f1xts2dm4F3Mf1EtXKQxK289TnWF84TResQLtHX5DFdBAPWdsAuugeVBgL1szXS82nT7hl+h4XhT+P708oXj+GFoNwST6PCqVBpSaUczcR1n98xgig9nR2tLemsDdhZFS0/2CYlXWxCFe9MH4PMKRzfvYM+EJ1uh4O2MYoUGthTxaak3wFvRB/okZyB6MKbMDe3UwOUKUG0PtfRYTxTKOUY+I5qEiGZhbgHD4FWugCaW+aLZwoWGYqLRHZ7tjU/0+/sDUDZFOrquvIwP1jxuRmnw0g0d2okKcZnBvxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkTz8KA0H02PjdKtuFj1ITw/fdE4E5PZkQkeoFQSpmA=;
 b=iFGj4ISDMfbxmj7exZKdt6EAFEUKlJBSUXqeGX5+ZR6kEzdjGSuu8Edy7OeDxB1k+YL3dPGjk7YaGTZgwR38PZEWjyy1h9NjRnYcIvGTyYugXwfU7P8RHMLLdxJWJcqHMoriaLyjewTi7rc20HduZ6csB5OuPFtgXf6lGxkDIHQU7vA8pCtsB+mXl9XQBLV8XNzPuHmlsYdiaq0b0AFioepgJPO0bEzsIIqGeMHSVuSQ2UEVwU1hnjnxCvwbRm/svlf0/zMfLVVx/CIUwLU/yAwrBnQ935gYVTolkSUR9ovkP5vYjH9saAhzMlPucl3sAX9FjuO/1OzU+ZDGbls9CQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7472.eurprd06.prod.outlook.com (2603:10a6:102:154::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Sun, 8 Sep
 2024 15:36:11 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 15:36:11 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] opensc: Fix LICENSE declaration
Date: Sun,  8 Sep 2024 15:35:49 +0000
Message-ID: <20240908153549.4114857-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00004596.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::441) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af2c7d7-5723-4aa2-2327-08dcd01bf72e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Odc6Z6UAGtp0pWivB2sB79CSgUKztDpeKFxtMrJzW5BjZ0ZjGp11lnz2J70i?=
 =?us-ascii?Q?osFZfCVUDNfGSuZOzrxc26XoyXjxb5zAeCpK3SDG10SsdqxF4CUxMzzfNS5V?=
 =?us-ascii?Q?yNe9dLJET1J21c0+T2zJTJU/FaipGaULjg3LDdf9O/WtRe9PSN6IkXs6cP1J?=
 =?us-ascii?Q?z+SOgd0aAhLJYMoPqf/9V7HB3nQR0LSeAl8Rr67GdxfD05JRDFqG8FcJnxb7?=
 =?us-ascii?Q?pQ6tSKTRgnsdd+SyHK1QUDYX3CtfXZsXsPp54e3iscjfUcN9FxxyDcm0HlOu?=
 =?us-ascii?Q?jSfP0cn925ZMcOpXdKdK3iHLD/d1BRt20KlXUrvMH4KbXjAsWAsR6rn7vQGn?=
 =?us-ascii?Q?I1OLs7X1v9M8F5xXuC0e7qWvB2+ekPmt8gyMh5Nra0WqIWneQvjBoYJf+a+1?=
 =?us-ascii?Q?5v+OgcXZMDDwLH2XxzEyUzZb4oIOPEjQzDe+NDfZvYU5A1mUrE6yqhLCnWVb?=
 =?us-ascii?Q?mQ3DDxfu+tZqRary+J/wPTLijtYD9Mndtmb2cfXqpt0fgmlTpYM9HH28wd+H?=
 =?us-ascii?Q?/Cp+3dKq8MixC5L5V7TzMO78tsGh3aWgOjFpWCXgoOKtPNPuGgRXr/YoYp8K?=
 =?us-ascii?Q?AwNg7ZdOqwNxDotdX6Z6YpnJGPoFircrcS+MxxXC/+7sOij6AQIUC0hFcHl6?=
 =?us-ascii?Q?P2MklMA9nifqCwRBbJJBAML/LaWheZDFgXH0kHm8LWoD38eDj4pKQsWdNJS7?=
 =?us-ascii?Q?2DI8edZWULLcogaBuPBbSU5jwBaKwe0KJd6d7m0XBakbQsbsC1ljyu71M9DD?=
 =?us-ascii?Q?/dK5DHet7stP8V237UESz0Rgal3ANQFcsRxN+lwZ+wSGWw50X+LKdzCtTNOy?=
 =?us-ascii?Q?Y0EYKGR0jsNXwzmJ6SRNnUKNlGTL8BThd7w0gpfQ6IPoZqOtY1dLyLwK7Nu7?=
 =?us-ascii?Q?Br48clY3AnEWaInxDZAi9AOa6gypu4izfFsgalHl+uuD4U+GYXDb94xh01MZ?=
 =?us-ascii?Q?NLI13jo51DBUBKS1dVRbW/L/JXMk8gULqDsl5pERJ+YQQRZIxc0osd3yPBj1?=
 =?us-ascii?Q?nK2GPEbyrQPr4bFMNYr0qkj59XF/7IwtA0s/EndqK41hwplyowLMkYstoaHs?=
 =?us-ascii?Q?RiioVPT+/bEMaJYrCR9WTJpx1COtS76HbBNW3vmRUB3BKQTbJft5cQVBlvHT?=
 =?us-ascii?Q?CeetyZqMxtINVLTC0Otdg5R9ht45tX7W7DEq9owKm4nr93++4IxXI0+oUIm5?=
 =?us-ascii?Q?2ceTD7igB0mBJFaLHlRSB1TOxBV7K1iWbuvB2oQ6MeIIosLKVJFmikhka12k?=
 =?us-ascii?Q?2HynCSmInL6SZubEnfcvXoyeKLzgDm0WoWwoYKo75PKUEzQ6jg9HQjRtf+i+?=
 =?us-ascii?Q?Ozoa6avLSjxZOoJ1NKcZO2e+Ev503fCLpuCuExjVbYYxMVAL3LgJ2edfuQZ2?=
 =?us-ascii?Q?APN6zFVfoevnE4BEw6+awpw/t0qjo+UOQ9Nz82fnclAnxI2QUQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tIM2ZLPsvmUxRd+ArnD/yLwtybKYiZrBRiqQ9LK9jtGzSetzHl8oXHCY4Teo?=
 =?us-ascii?Q?lNoxzOnPGG7B7yHYCvx4LSxvEg5n/I3FFIYUaVz3XmSccc08SfbS+/c6mXdy?=
 =?us-ascii?Q?xsK1qqebKQy3KXLmH7DxiDYrsvYlReK381wGzgknXhECCkFwHGHgDYu+TjVD?=
 =?us-ascii?Q?7iwrpmCj1VM0AFTLP4+oUvX0aBtm2ZKbdrNyZ1FXyNCoTtL/EK5Utnhg+dx2?=
 =?us-ascii?Q?OAe66YFnJSq1UHPscVnq8ayzbNdp6l8teAHX5t4QhHtagwQ1ouR1ZFmtQOcr?=
 =?us-ascii?Q?+8bAT6MKjWeRfPtEt5EqwbltwHe/9ICAU/2PLRHZggU+BvMwovGlYtF0m6oU?=
 =?us-ascii?Q?5T/F9YMghOHQJsbq4Nfu0CyiqW/TFI4i6PD4LWmIu93QsbN5EuTu2Z1GIK8y?=
 =?us-ascii?Q?hTMADpp0mb9KqJLX7/05ixuqpJa5y1hKAH/avZFu3+RMi30pSRTc8pFCizeh?=
 =?us-ascii?Q?uOABQSpJlzKDBtOOnMfsCTzjE5UVHC18EyVwMfrnxZRJ7sM/fcoe1BGkL9L3?=
 =?us-ascii?Q?bmmgsSQkTKuPJIAFzH5yGvET6PeAxTB4AZf7c+Z1hrS2mFYeshjk6oetCCII?=
 =?us-ascii?Q?h8L5Lhy0K7BUHtVltIzYxet61ho/vg66uiYMZRBQcpgF+JCG00YYcJKDIWkp?=
 =?us-ascii?Q?PjCqz0RJ2loU0IF7sMc7XKDDJEZkt2DcddmvjzJqoEfLgixLjMhNxoxYuDfX?=
 =?us-ascii?Q?vEMr0z9XDjmH+xdn+JGHQ7bwj4NN2duUYu946WYWTScUQRH1e/Y4uN6hXMWY?=
 =?us-ascii?Q?UMoAwsVnJ84YWrKvF/pjREcO7dOudozBvoERIViH+NKWIOCdcnNBkHwsv8Sb?=
 =?us-ascii?Q?NM/9Fdt0Pp2d65JYMwfowYAZoOvMMx9Jjk4Z3sL80ivzyZQg/aFmfQCtDxS6?=
 =?us-ascii?Q?QFCxPjx/rlpzn9N5GNAZpaCIeQqsDcAC33z2ti40eSlcCioZzoOXGNcJbeHE?=
 =?us-ascii?Q?6rLOcu7BMpcOns7fQTH+BwHQ+r0IH29dOa+W3lbkK5/DDbW4FwvKMctySFRq?=
 =?us-ascii?Q?XknIIwQbesRzgC+Q2CJdaTS/8mumLbBYdpfSBm66T7ifGSv+7YZJYSp15xVK?=
 =?us-ascii?Q?636O4RPG7D3astIb5PPkmW8lEnjFb1e3+MlALwXJJaKC52Ws4FYl6i1uKnhl?=
 =?us-ascii?Q?X+Dxd7bV8ge1tzRRocKymzSixAlW6yJZuBW5CWDaIshPEtww7Kjqz0jjueRv?=
 =?us-ascii?Q?IaQ546x8+3BqmyQ+Lv4OlTzgPTbSg0ZQtIQ4N0jViZsLoNJNlQE7y7KsH10Y?=
 =?us-ascii?Q?N0s/+SL+3BLqLIJQXrJFRsj7QC9olpcVliAy658B6u75twuZVQYT/3hI/Iym?=
 =?us-ascii?Q?o5UoCKFWIukr0genW8YF7Tx78jSFfcAMJnUBKNBKWhMw5HL/vyN7anMZK+Hw?=
 =?us-ascii?Q?YrYEiy/HuXrM+eTCZeu5Vo8/AluI5pQQuVzHA4Yr8daXh3q0wTi5a/VOTX7F?=
 =?us-ascii?Q?/7bsdJfAaTFiNC1xHsvtEo7/LeX8ITj+UAb4dR44fUw38CWFOJ+NFUZsisQD?=
 =?us-ascii?Q?IzyGwgJVZpCu38WBYECtwpu75ke3097Sy7ioFCy7rn+Pk0ymun7UILlMqOcO?=
 =?us-ascii?Q?FSM7SolOUrnWIOHOtD0T8mn7j1fjmyEZFyI0xkisk0GshugOaOvOpPXjKgW7?=
 =?us-ascii?Q?4w=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af2c7d7-5723-4aa2-2327-08dcd01bf72e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 15:36:11.0911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRJXPJ+iwPt7EZzXcGibgMGrt337WyLlIqty+wAaEp4qezsVt1VcVlUFkaxGVzJ21mPTz6xIyllxO7Q0Nu2Ung==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7472
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 15:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112160

According to https://github.com/OpenSC/OpenSC/wiki#license OpenSC is
licensed under LGPL-2.1 or later, which seems to be affirmed also by
the comments in the source code files, as well as the COPYING file.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/opensc/opensc_0.25.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb b/meta-oe/reci=
pes-support/opensc/opensc_0.25.1.bb
index 19fb78092..43576437b 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
@@ -8,7 +8,7 @@ eID cards have also been confirmed to work."
=20
 HOMEPAGE =3D "https://github.com/OpenSC/OpenSC/wiki"
 SECTION =3D "System Environment/Libraries"
-LICENSE =3D "LGPL-2.0-or-later"
+LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcb8aedd3bced19bd8026d96a8b6876d=
7"
=20
 #v0.21.0
--=20
2.39.2


