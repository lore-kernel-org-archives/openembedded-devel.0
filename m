Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B40C433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 11:32:09 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.68])
 by mx.groups.io with SMTP id smtpd.web11.5364.1648553526439964751
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Mar 2022 04:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=jk3nPGf3;
 spf=pass (domain: weidmueller.com, ip: 40.107.21.68,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPDbKmn1GM6AQv86yXKXu0o7kBL6IPskHMk1A1qAq5MqXlyoOdfQ7V15Vai/CSI5uffFwwEbab5tLUolRGi043SLsW7pY+80+6YfQrUJbRDnsVnHhsCZDmcMpNdmitA/nWTduANbMKeV1HlUrKD8/XxTDrb8IrzQcbaENa7zRsP8sjSXukOvzqAvZaTJPRoNnSPbLQryyTh+cykpGQrke34VHtp05so54u3awjewKuHKDEN8Mz7UFyk7GFqcnBznuPn73PeBjHnKCQiGpwlijnpeF3rgON+3+HjLEZyWSziqCYR3NjUmL92d37YvEVRDO05oXprberj+JbcdxBiTpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47kx18He9ill2t2c85t7Ac7YFWo5/A68aNgohUBfQN4=;
 b=kGaBq7io+CIMoQ5jyGXJfnN/0fAJZzp6RebeYahr15wKOy45Er6L8Id1Zcn5ocTeKBr0nz35cdDVW5c5aGHJUy4E3z9TS/NJY5uEEKDi4qL6hmJ5cZ4Sub74PbFsR45Eo7ETXINx2IcCWDBg8PMgEAAyzLuvzEff33PtixCJ1x4j5xnOlxtvG/rJ3C7LTaSVHYOG82q1DSooZxgiWfsiSgCs7ap5twUwr++RIZYPs2aqzK8l/1VQp8YWgnVRnDvD0roShbzJCO+YhV4puQN8s0AY91snvZR0Rs3UtS/yLQMgO32N/F9URrSYuVDremr7AwoYa79AsZ7P80/BbD53fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47kx18He9ill2t2c85t7Ac7YFWo5/A68aNgohUBfQN4=;
 b=jk3nPGf36Scsi4tl8XNNvFWlQR9CsRLx/32d5pmCWE1tO+0B55sHfrMlbFAzoQZbLqFTOhNyZVdmOhq3jMImnXdp/mQgiSZAj5U9DD7yZZTDrfphPdzrN3iC4lfu3B4ISUZa1Y4X6qHDipwB6bAjU0FspnD11tVmY0Cpi+NfQ2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by HE1PR08MB2795.eurprd08.prod.outlook.com (2603:10a6:7:33::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Tue, 29 Mar
 2022 11:32:00 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba%7]) with mapi id 15.20.5102.022; Tue, 29 Mar 2022
 11:32:00 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-devel@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH] nginx: add gunzip PACKAGECONFIG
Date: Tue, 29 Mar 2022 13:31:38 +0200
Message-ID: <20220329113138.9165-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6PR10CA0105.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::46) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eeafc008-5c05-43b6-e396-08da1177bd49
X-MS-TrafficTypeDiagnostic: HE1PR08MB2795:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR08MB2795E222949ACA7041672711D71E9@HE1PR08MB2795.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OQV+53DmUJYa4fIes2hlj8KbOZG3w3M3/E43s2B5Ieho2UCjJ3pphVS0mSHL9SexHZf9LWkHOtHbbfNtNPBUAizQpE/uFx8MWhGDtCCrGCujls9nBMjW4vxxSgdUTHAzxFo53Pby67TBjDBpnzgFlX1+2Dvub2K1Cd3Egz1knGRO1cLeUOBDQJS0vacAdTDUOK7edrbPw6jmjxT1Z2J3zK3Yzt9CZ8l2E3ZMk3scoBzC+1T9bnY4h5Yv/t623767G/7+lu3tSwdfsdMzV0JsUl/i2gA/Zznn2zozjURKSXWHjWSJjnIWs9tSRov9YD16K6tTB1yGiGFN0C5eAhgLqOXL9oIqvgiWTC+jIzyvZwprTRwtGMA9hEsucXDx78ixEjAxxm7HBRR8eV6n05EqyGUlKz6FlBbI4wfS2JtzA4T6mFrp2xur3OYIqP1lSVVcCagHvAYZHuGrRhgPAtZgBcWUv3elJ0cYKR2hnqwOUbwMwMnmM20FbuEexz7pGd1wIzwlY6GvlAIhUjK+yhjquQmjqbd+D2ZeA2VHv1NifKrmQsodntrFaILTIjk+8qF13a4EdevwPtZs0k9ab2oppd/zOUcV6+Q/Pj6eZnbKdfgtd8CTm2SfA2nbYJd+B23bHGXVnFW18czbutq5Uz5BfGiglOEJf3WYwzV/AA2wqCzylA0B+FkCf0wnhEpInohoEuUVl6xTcFdGdqUO/ZY5wA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(107886003)(66556008)(66946007)(52116002)(38350700002)(2906002)(6666004)(316002)(1076003)(8936002)(5660300002)(38100700002)(6512007)(66476007)(6916009)(8676002)(6486002)(2616005)(36756003)(86362001)(4326008)(83380400001)(186003)(26005)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h31M62Ul7A+gfcwvVgsiRAukudNxj0WP1ChVAzLZXmBgt6zYA3KK/X0E6Tkp?=
 =?us-ascii?Q?lpzkWjVBX/nBGTFek6pRqn/qJxH2q5bxgjb47fspL3lhMH+6SOSry7vCZSIZ?=
 =?us-ascii?Q?7bAjHjbuYLf02I34ji+7YLyXb5x0hb5udT7+EJ5DrFBHxgs3IMPwKcNPswvQ?=
 =?us-ascii?Q?jvgzdWQjyNpRM5r6sDvOM6H3uB7TfStvnAYMgww0IhuS8bdAuU9mTXjX7xiS?=
 =?us-ascii?Q?DkdiB/YAep0a72IrT1Mqd3XqE+bEkdKZ+FU4OxZr7m62S8F97paz/AHdFCvw?=
 =?us-ascii?Q?lapECe896olaZ31t7+U+c5VApo31FB/7fhDEVnsPtEdtg8ix5REyWCQbreYQ?=
 =?us-ascii?Q?6X6c7EZfHHp57DopCikbeHFgvOlvaBNktSpo1OQyKda9iiF9gkC+m8k+gkeM?=
 =?us-ascii?Q?BpMH0B68MyGThVr7Ez7bEyqRLs8NfGv54BtnZzc84wY3s0UotEuBoRcbiewY?=
 =?us-ascii?Q?mNNzDemBC+N+BcrJQu2aQ5tY7Uo3Az+JaAd8yyUDq0YLnmr92Bqx05PZL/lO?=
 =?us-ascii?Q?eN0Q/pilwWjuYxNhJCmexQbsnPWnLH5jZrp/R3eCtgEA5W02OglJqhSx7eUJ?=
 =?us-ascii?Q?uDp9323FQBy3j9usbgFRzhHvlH6m9D5o8jUQ3NFJL4mhGZRM8eW4b0PdXAK/?=
 =?us-ascii?Q?7JSgS2U19CgFVACvKaddcJOZ1Fldf4GX00BnnprVxgfCW9EQnqoi1pp6gIfV?=
 =?us-ascii?Q?EX9Htt7trTibWR4um3trzJou0dDLeFYJMYknWu6RgC6KdNo049+Wo8jSdp+T?=
 =?us-ascii?Q?W+TuYyKwNO65lxV2+whWwe+FFREexvIzeNDvdYg/g+JgabNyrT4nMKMzNZa9?=
 =?us-ascii?Q?VbEpF/Ks27jBi9wOjy1qFHl9TX0hZUCDEhpwKUsFmzdph/gqwNB8pwYKpTbB?=
 =?us-ascii?Q?Oiu9uWk5DM0djm5ODli7+Sj4EzbJXIFwg6MBiEGYuGSRlqKZSd0ef2TSxyHH?=
 =?us-ascii?Q?Y/MR/LeC5jZfq1OKL6x53R+zFvBJPGsOtXnjdCxx6XILMnI0x6TUPVdiO7D2?=
 =?us-ascii?Q?WIaXJjIxRrbdBiKi5t7KzUQbXxleQ176GPGRTbjg+f2JfojkfDPZvC9uw7eb?=
 =?us-ascii?Q?5aIvGjFIB9RDvmlPZ+s9Jo5M0au7M0I/+OgEhyzkJZk1Rl/IWO9MUmQi3Zbj?=
 =?us-ascii?Q?WXp7WJs9xCg768jwkddQ5bxOukiWv4/ujt90Sp2Wzo1DtgNRqzb+9qKO0Lqa?=
 =?us-ascii?Q?+jdkwAPjdY4gUFiXmSoTQZ40Pjz/N5lDVG0MvDN/iTAWpst6D2JEbTt51fGs?=
 =?us-ascii?Q?JUuBrORe97CDg30mSm/pNeyOs2y9W6AC05S/m8T3Jp7cMdGMmPnY9aUnFCp+?=
 =?us-ascii?Q?5Bi3iL0G+HhX1GAgMrLrOuauqbcZjM4OnjeycaseB4DvZVCf5Hoc0V6VKd0f?=
 =?us-ascii?Q?b6n/BQ4s5LUoZzmXcU267OfDH9Q7BLUjjbvd/eU7tsJQ6z1agvROvZ3eoHAi?=
 =?us-ascii?Q?e0a00lXdgMaTSpak5U3Px3dzgx8eLmOEcbrOoFi9xhp+AjZM3ApEBarQIbJU?=
 =?us-ascii?Q?CJHwlODqb42z3E0lRC2idHIpBjxM4bxUqjvBLoQXTgBXMyIa50r1X9Jwu9oN?=
 =?us-ascii?Q?75MsYpncnkY8/FEpMmmNhZEJai0cp1HeFA7W8wWZ2qpd/7U/WVLQktJG+ajo?=
 =?us-ascii?Q?In1Qm5b6iu4CPIllNrZpTBYBOtEMpjFh46X0wf7hxEWk3VQdy2qQ2m27a18S?=
 =?us-ascii?Q?0vOU2Uhq60TDYrDo7HXtscP+viapOXH1IBkF7H+TvvhzvmK29rKLyjZLX4MQ?=
 =?us-ascii?Q?MUX2qebTN1P/RJYJi25kzBW9R9XzaF4=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eeafc008-5c05-43b6-e396-08da1177bd49
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 11:32:00.2112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GOgaHEBvAqikEjyUf2nsTJ/QD6I0JZOCmqmoWFV5Oyd4t2H1W9lnd0ovw5TxHAhlRhXHd22GdeJAZApUQ2GcQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2795
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Mar 2022 11:32:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96256

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The nginx gunzip module is a filter that decompresses responses with
'Content-Encoding: gzip' for clients that do not support 'gzip' encoding
method. The module will be useful when it is desirable to store data
compressed to save space and reduce I/O costs.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

 meta-webserver/recipes-httpd/nginx/nginx.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/=
recipes-httpd/nginx/nginx.inc
index b99e29ef9..dfced3330 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -39,6 +39,7 @@ DISABLE_STATIC =3D ""
=20
 PACKAGECONFIG ??=3D "ssl"
=20
+PACKAGECONFIG[gunzip] =3D "--with-http_gunzip_module,,"
 PACKAGECONFIG[http2] =3D "--with-http_v2_module,,"
 PACKAGECONFIG[ssl] =3D "--with-http_ssl_module,,openssl"
 PACKAGECONFIG[http-auth-request] =3D "--with-http_auth_request_module,,"
--=20
2.30.2


