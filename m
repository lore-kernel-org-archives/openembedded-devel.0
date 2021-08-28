Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.50])
 by mx.groups.io with SMTP id smtpd.web08.3661.1630158469877099771
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Aug 2021 06:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=FFAHI86i;
 spf=pass (domain: vaisala.com, ip: 40.107.8.50, mailfrom: vesa.jaaskelainen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=blqjdO5o2vc1KdUPYS2MgfAM7Odj0IWEAu6syk4/clq8PC+VeLGZ7b3SqdB9UoCv/TPWbPx6bITrkZSERV9smuiFQXGpYajhJNiWlcncuP7EcNqOZEumVIXx62SgbZTEWSrLPkf3EbNN4kxpUHudNzeojd9enTra70BM6iPJvHGpQCdrpnMQ4UZSm7JDkNp9ZNYKpi9w0n5ZLZjGV6o5Z4nDKYdHTJAv99A3jW1AAYDKoyPxI/9YxJB8/4gEqavVck43LAL7Vh3Ehzoh6ofTsON6rBlV1/zcPrRohd4PuSINkPs0qQ/jQayNJUtrP2OjwZ/9loA9Hn+6rYHdkXKUEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ha9WskbNlYneJZ6a6c6KFaSOltCjs79xdmGUbVJxypE=;
 b=O+2illkEEEhD/vVXVY77mpcyCZi5+tHUJM+xEFqPNEyLbyJTser8+Xkuu9emrAEOlX0NmTgZ+fZK9tCgK1U5bXiI0lXn7tingMRxUyLW9geRg6IpOtqmQ7jXFOd5iJ8j0814poReovf3hz9OV31PcbTr/I9LPin6uxJWHQPErd2ShMYjdlI0ETXf6uy7ZI0AoAGBrRjf6E5FduaXrFTcBgyyvbTYcQroTyWd/2RmCq4vs8zCNUWOhCLQaU4Tkk1sT9BVwy0Tf/6AJ4OijaI38eqs3AUDw/07ef0TFxewWgWDV8d7+JY2I0JJSlRjPopBi2KB5x7G/h/TxdWvIRLEzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ha9WskbNlYneJZ6a6c6KFaSOltCjs79xdmGUbVJxypE=;
 b=FFAHI86ik5nqBE64J13pZAZ7+J97Kc/IQmQ7F5HQ/hZE9ysF8Obj+CkrZ0vBUf2H7IddZVkIto7PpsjFmkF798E9RV16YOIMgTngh/kuX6XUSp3oblWS9IAyP7ijXbopxzpUNDcVFZpQqG0aQF7NkaafNrHYPWN7zN3Oz1+VtN5vEStiZld7/B2MrDv8f+dsN/o2NO/EQx2ARpidi3LMfwizdX2ecGMOX3yuFPkmYcA8sdhn+Asta6XWXlMwK6uT9lGC2q1txu9ZO0IY83UN0qOddteKxVAZep2jfHVUb6z8CykkoD40J3blpn2QJRJLU3dM9s7FyHtEo8V8nNPFDg==
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from HE1PR0602MB3241.eurprd06.prod.outlook.com (2603:10a6:7:17::28)
 by HE1PR0602MB2746.eurprd06.prod.outlook.com (2603:10a6:3:d7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Sat, 28 Aug
 2021 13:47:45 +0000
Received: from HE1PR0602MB3241.eurprd06.prod.outlook.com
 ([fe80::213c:5e2f:60ab:ecf4]) by HE1PR0602MB3241.eurprd06.prod.outlook.com
 ([fe80::213c:5e2f:60ab:ecf4%3]) with mapi id 15.20.4436.019; Sat, 28 Aug 2021
 13:47:45 +0000
From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <vesa.jaaskelainen@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?= <vesa.jaaskelainen@vaisala.com>
Subject: [meta-python][PATCH 0/2] Add python3-pkcs11 recipe and it's dependencies
Date: Sat, 28 Aug 2021 16:47:25 +0300
Message-ID: <20210828134727.277771-1-vesa.jaaskelainen@vaisala.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HE1PR0402CA0051.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::40) To HE1PR0602MB3241.eurprd06.prod.outlook.com
 (2603:10a6:7:17::28)
Return-Path: vesa.jaaskelainen@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (87.92.181.210) by HE1PR0402CA0051.eurprd04.prod.outlook.com (2603:10a6:7:7c::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Sat, 28 Aug 2021 13:47:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 429d011e-c67b-4fd5-7bea-08d96a2a6a75
X-MS-TrafficTypeDiagnostic: HE1PR0602MB2746:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0602MB27460FED18FF5BF77E105EC9EDC99@HE1PR0602MB2746.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+2jO69YSCMu04XFlJU1LIGjPZqN9m0IncTzozkOWe+1JPywzhaGQVwE4mphoZQzAOaV80nL7gRux1hXjlevjetPTaaRT06BpsOpwcnbTVFxHe8XCjHyIuun17AQ7yA8mubeXGqR4ghG4ov9HXRDvzsdy8VdSV0VVW0LTq98UQAXMVvQuJY5AIR6ZkkOCUKtBG0UmpAfH5x9WLw5QHUDCnkWHlaVLe3KfN/rVrLArWg1+LTVUcZQPvq6q2QzEFbCYHJiPUkGIPdeRzHTEWQWzMj4e+xTGLAXpMta7n7u0kk+ZSpg36AvgLGMdjk0VW/qNi2byXIlZrPWlWk4ubXMn3Wm+5l+Wi16072jXkDpMf6MtwvCWX+3coZGaIhcBkJtCJtuBGfP/pF3AdHKpgiSO07LyP0KHtDbsl8VZ/gTYwqxeiZIRpSYaDLZYyCFaXP2i0B75odSiJyjemJfxULiaRuv+Q/2YrdZsgS5UsnEPv33iO5aIXod65K++EpwTK6YM3xq2T5nWDoZOwLT4bOADBB0AwAaxRS/mC8xqiUFa15eMxSkLLNx6+BPSKmO5W4OM9Qg5ebFfJF2nOF9zSK2Zm/v6PVVd2d6ycCbhryRku9VIQtFFMA31pxq6xDW9jPPabHudsiemVNQ3ju10TOKDfGG6M4noAAAFArD8Wgys0Ve/T8gUknYVLr2hOJgFqpTQ/QXtmpG3hBGm0CVSBeuGhA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3241.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39850400004)(366004)(396003)(52116002)(66476007)(2906002)(66556008)(6916009)(478600001)(956004)(2616005)(6512007)(5660300002)(6666004)(86362001)(6486002)(66946007)(4744005)(26005)(6506007)(8676002)(107886003)(4326008)(8936002)(38350700002)(38100700002)(1076003)(36756003)(316002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ie75Ubh5+kDsI5MRV3AgeTem635+aasX8bnF5O+Zr4NY5Zh/7WZxFMFayM9R?=
 =?us-ascii?Q?YD5IqbPvIJ5ACMTP9DuqB6443i8ffgtq7EgFmCHxTMFJ+Z7x3udYtTxSLT3r?=
 =?us-ascii?Q?/ON1yMNUwSV6LJepRuX/zm9V78nb3iR4vfAm3RLRr9TT4DF/AXlG9SEY156F?=
 =?us-ascii?Q?cLzBfSnOn9SvW0OWtcMK6e/d++RK9MVObtSEQk9SctEu+YSF/BODy+IR/6bj?=
 =?us-ascii?Q?QOwx4OJioDmMMVkMrfUmixcUEUNGnbPO4F9KngsLLrmFLxdPQb9+WbQItcZR?=
 =?us-ascii?Q?RLntXM0S8xM66YhCfV9T0fpmlu8orwMXnyUFPa1KPCW7zP80kM8AF1ZkPGs3?=
 =?us-ascii?Q?9NBsGUqMq5v7GYSurOovLQUN+QqStBM5xSO9CIL5psQuMrcPay7jzPAwGdK3?=
 =?us-ascii?Q?WdJedTxBpty9609O23UUqMJvpH6jyCWcorg0D2YS7nFhB8s5zwwfP+fFG9ka?=
 =?us-ascii?Q?ORZXbSjvsXHt0wv9v/kFwYmqg9fEn6PNhdQLrgGrlQo9VwEv6GI1bXFCy9cd?=
 =?us-ascii?Q?fPorLZotXm46MM8vS03+93nandAdcFIrFdM1rmt1mjsE6aI/aP0XKlbK2eyb?=
 =?us-ascii?Q?UhcUgriLjY+haHQwK62a5UrM+aBNxVVCIrsyTYFFd16wbO6TxcrhzK8Dd6hG?=
 =?us-ascii?Q?yaUAjGKOHUBjlpzvkCOAZDasU/AvDg2boibhP4u9L2oM3Vppb6gSMn1Z/Yc+?=
 =?us-ascii?Q?WGw+u7EcCr++RoGSPR8l4hTXv6V9xqwS/AxkyS1IKPYA8DRGi7LNmOIT0T8W?=
 =?us-ascii?Q?lkH5Q+7KFeEK4TummkwZ7lxNuJXJFOq1a2IIQCUMkkRRLYlDvfPD6+wfnYjS?=
 =?us-ascii?Q?ZSkuml9n2fa4yeZCw3p7qcRyyIVnqdvXBE7jKJ3tr7nWqKvTmaUuAOxj49Bu?=
 =?us-ascii?Q?qNgih6ufFHR62AmL6D/UDjsXCYHcj7ZHlFYYfCMhXRhUzjzPJVvU1umoV7x8?=
 =?us-ascii?Q?Hw3ItKdPI3pX6xCJaeAkR7gTlRA2ZW9VSt0Crsqt9p0t3viHgeuwMmMIKm1T?=
 =?us-ascii?Q?UckUnVjxOux+ztE/j0ubH3ykcEjeMYfD/tPxkKwlcXT0JQ6ui8jf+c1XoTSc?=
 =?us-ascii?Q?qCCpPwp0JT2KdxMyvMliAUbIkZ92PxbK9yuv7IaIcBMRfVSJ/LlzNBwpJc67?=
 =?us-ascii?Q?hGLbPu93Dp5nJADfoHq15oYY9fUyHxe4u2Q15Unx2FdCqI5LpelGdxWJrmOw?=
 =?us-ascii?Q?NmCiiVKBQ4qgfuUhrMPUUkha4apxTEsg7ioc5xuCR8AGKz2uI3ra/nmMMZjF?=
 =?us-ascii?Q?FC6tpHA1hvk8+vXctzbk+mbniJ27rVIlBVrBtuAt706UI6LcPzDwWmes0GKB?=
 =?us-ascii?Q?H/1u85e9TMUwRS5jDjvP7cZA?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 429d011e-c67b-4fd5-7bea-08d96a2a6a75
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0602MB3241.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2021 13:47:45.7970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBf8d5D7Mw6SvnIcEBVgBnsaIlV9qvJL03cLAf0mbjRxMAkTstlIanF3UsO+JmPsdSFwsl/y+wLVTX/yF2pkUTPm9HDCiN1rdk243VALDMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB2746
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Adds recipe for python3-pkcs11 package and it's dependency for
python3-cached-property.

Vesa J=C3=A4=C3=A4skel=C3=A4inen (2):
  python3-cached-property: Add recipe for version 1.5.2
  python3-pkcs11: Add recipe for version 0.7.0

 .../python/python3-cached-property_1.5.2.bb   | 13 ++++++++++
 .../python/python3-pkcs11_0.7.0.bb            | 26 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cached-prop=
erty_1.5.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pkcs11_0.7.=
0.bb

--=20
2.25.1

