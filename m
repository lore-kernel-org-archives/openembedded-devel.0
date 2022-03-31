Return-Path: <potin.lai@quantatw.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039BCC433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 15:49:40 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (APC01-SG2-obe.outbound.protection.outlook.com [40.107.215.102])
 by mx.groups.io with SMTP id smtpd.web08.8976.1648741778396103384
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 08:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quantacorp.onmicrosoft.com
 header.s=selector2-quantacorp-onmicrosoft-com header.b=2kSnm9Fw;
 spf=pass (domain: quantatw.com, ip: 40.107.215.102,
 mailfrom: potin.lai@quantatw.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMHP0FQc7tdM7WtFW8AxdxRKHxWGx40wJyQzt1E9XV23ceYM1G5gwI2iKD3Oon36vH/z9DUBBAqefUTbD2PaZcmrn8GnnL5LE41e+w/zbaSaWhvJ91atzJt9jlrJpP8p+7WPv5Ti+jbK7bx6+Rnc2k1ulJp347KZK2RiUQHx8dXCINUXrr/uq3vowrrqXqrbI5cUmSrPRW/Mo9ShPLsfnHB8zaiZ7c2XqnbfMQCfF1HOnAwZhWpQTAy/5ZenLibvhWw0zoepaJbfsSFX1tiXM1iZvUZT7WD2rlo0x2Vr03RgiGrTgjlEqGL2Xjkub03XCjHL8nQInZkB3nTTEspWJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VaOZ4xcsmwM1D0utpZxwjCThxyTFgscSyiQAUGYNWHA=;
 b=bWtlLBSORs9ziwr6cnXfqvgzK5w57SStGTe6WlnT2wKjvieP6tNAyBp0WYLg+5yr/qzxJBNCLaL8Ud8SXyPhb4VQ9m9O2k80Z656h5n2Rgwx31He/eUeCdw7XmLIat1TKjIpzYT8BMBtlfid5AxuOCrUr0MqpsXWe8ETt5JLsfV+KnmIY6MXNbzmj6hcfq3sJPzUp/G8p64dVX8QT52DJWiwpk3gcGWqz+U+W3+9cgqMkvxhfNfY7rNGE+j2HWnHP/s1L30Ir/n8xeqe2auYIjlrbybrIN5bnkX6mfoYr11WlnOGhN87B0lAED+emysttyKfFfGO7EaI6SsmHllWpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VaOZ4xcsmwM1D0utpZxwjCThxyTFgscSyiQAUGYNWHA=;
 b=2kSnm9FwEgWrFk/r9sRxQlfp5eU0KJAdwki/a4zyBUh5iIAsBdVANeZqarPStbJtZo7us8DXbrXbypZkw+7ahHwhcVPpQGXTg6bfMiVl9ZGptVmLyLEgaJbC2H/qr1t36XZLfvWJKKKUWRwTV8vWe3XXuXeCIDr9rhj/3OHnnH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by HK0PR04MB2785.apcprd04.prod.outlook.com (2603:1096:203:5f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.24; Thu, 31 Mar
 2022 15:49:32 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42%7]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 15:49:32 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Potin Lai <potin.lai@quantatw.com>
Subject: [meta-oe][PATCH v3 0/4] add idevicerestore support
Date: Thu, 31 Mar 2022 23:49:08 +0800
Message-Id: <20220331154912.1456-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0148.apcprd02.prod.outlook.com
 (2603:1096:202:16::32) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef11be50-eb2a-4ab4-f6f5-08da132e0c2b
X-MS-TrafficTypeDiagnostic: HK0PR04MB2785:EE_
X-Microsoft-Antispam-PRVS: 
	<HK0PR04MB2785D0DEF370AA93869DBD578EE19@HK0PR04MB2785.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	v8M8e9NLzGx8WiGB/r9WdTgK9lIoBI6mg9fN+CnoCLn5vqmt54UTASMf2NIs0b3CtUelS73hxBas5fjpXRNMxJWH+frxaOv9tdqx3nb5Ez+v51QJ2MpgmikLUbfGDRshBSGuQJgg0F258PEwkLpxmr9VjNhO9CT22hIxshHRlUPhUpXsX/JpVRzYdDgr+JEOya6BnpdS0Yu48ySfEtT94yKKEjiRKt/oYQEUQAr3kp85IXk/Rj2d3VVkkTQBDTyAc+j5a0I8LEfTEMPvZf1gYhTyap44DtQC3qB+uZoye2Ug64FBUaaSSsSIUg5Pc/yZqafdX9JzoQT+R0qASt7t5TMe/7baa1RNkqTBAvKM135jBMiYBd6vIq9R286Q1vmoRRWEEXDHQNW5e7m1cvaYokJDCcomt8XfTU+Hbhm7yiY+INHZuy7juiAB6lYw58MUtxV05mQv6HoECgGEqpdNiIFDmQM6kaIB7LSK/4YKw4rnlV/wVfKyKlppBb7VOtd2VOTf0y3bc/HpaZVCO2J17+/P3ZcCs2hPZeiGhczwa87vzvSwZAruH5HMOL49bMiib9kJBc4CCSvlXkAxqsgri/FwTS36RNcqJ5H+xWnkaCGHFwBtYS3WZ59m4KjpxF2rlcnkdgG1ViyAqa9YHHeGSFCzlDzjt3vkhM5itIJDe1sbXE5XATE769Q1QRYxFe8lSNLz9bd4LmQZwhE3qZxGxGLT9r9EvgS+iJXosI9iLuHejwZ9Nq7FP5mL4tGvxmbKrCH/NhS0mOA+66mg1oz5H+TbDNi6l/Jduo4ZcsbOOy8rmgra4fK39AAt+jIkgFt/VZno1u0mLUutH4eIjXGiNw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR04MB3282.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(966005)(316002)(6916009)(54906003)(186003)(2616005)(26005)(107886003)(1076003)(86362001)(83380400001)(508600001)(6666004)(6512007)(6506007)(52116002)(8936002)(36756003)(44832011)(4326008)(6486002)(8676002)(5660300002)(38100700002)(38350700002)(2906002)(66476007)(66556008)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pOJCZ+TeUG66lWhrfpwaf3ZcAmPIa/IlLJY6BIezXVQEGob2LH4qh9krrtaX?=
 =?us-ascii?Q?RlCOAOBw1l2FcyxB6AwAV2iqUSC2jgUPNm2CeRdDaIf8Ksm/PcQEwWwZEtOo?=
 =?us-ascii?Q?WAO8teu/1MlJVwb5ZzQDriogjCGuIdq6ld7usuPOXaCNw589IGe3Rq/P2Wdx?=
 =?us-ascii?Q?SmlOBC8rviqkqCba+Mb5Okuey/86YCBeoUqZ2YzOlZaPs+tyzAPZjH/xQtJD?=
 =?us-ascii?Q?3yIB+0h6jc8QFNIWz7YjHdHQMbB989zbWLSzB0lhNF+sJ78iPtDj6uZXVfoF?=
 =?us-ascii?Q?j8x+ScaUApUBFJC2N51kEPMQ6Aaj+yI9DD+nNLTle9gH8pG+Blwzpu9UJKya?=
 =?us-ascii?Q?omduu6cYR8171nvFPluNC6FMRPUB333lHK54DS6MazVjZF9cPakjWLpr2onZ?=
 =?us-ascii?Q?Yvu01x+tHeBNzRMlIhm+C89jPoEcvHvSsSKUB9Y6Hv8uNbyTAABJVy1oJ2QD?=
 =?us-ascii?Q?PCP+TYkq/6lm7k3v3yjfxqx9WNY/LShK3oSunbp+KfTY99aPlqcXCLTttRk5?=
 =?us-ascii?Q?zofIeh+6+Tifk4qsryCnsapdyUYIC9SeaqXMbSd/1dVszKHwc2Wt/DmSk27z?=
 =?us-ascii?Q?WsybA+uJKn8+D3+QdbP6OiquvI5ax2WRNlZY2HtQlkahosEg6xAqha2a5eKD?=
 =?us-ascii?Q?iX5HpunnfBm47+3nBFls29QvYCr3OwdtLDJRfILosxe4/h7S83+ZdWqAiZZI?=
 =?us-ascii?Q?CDpKj2BFroYp2fsAUtx4eLfzhErpp/IrHj7AmkRO7iiMtHPgj782Y1WiYdFX?=
 =?us-ascii?Q?9mlT9h2xOUN97eQ6SS3pl+MktgzIExfbia4I9c89S+btQp9iQIq2I/XgdeYv?=
 =?us-ascii?Q?Z6B0yUYujyEHImVOaqok+PhrNQqmpONzdufNn4f//UJHvE1KlMIYyCrkjOrq?=
 =?us-ascii?Q?XhKYWrBrZixE0i9agR+MJzls0XkQo54k1P1cu4pu/ECb1FO0SWU+3FPOmkRq?=
 =?us-ascii?Q?Pjb7EVnrGNHruSl24WmTCcnLb2thMcUA4kd1XHtBBW1icZfEPH1R8nioDJHD?=
 =?us-ascii?Q?Bei1Pjz1oan9svsDQ3jJ5kalaYaLihKFsHtle506YkmJU4i+T0LNs4pdTkCi?=
 =?us-ascii?Q?U2QzUH1dfydhmFZ7NboWLuMYarZ4V6Jh+bxMquf1Zks/4+2t5GlEdbPBbhuG?=
 =?us-ascii?Q?aXOpRnmBnzXMNqqwlVnr7CTnFcefKcFLzXGPjrcrwjSI6AIDxAZSB0jatjsI?=
 =?us-ascii?Q?zTQpd6jFJCI0t9GC+Mpcf6sCjomSvkWLQKQYZ26wfnaKJpGb9zjIUa2KYnTb?=
 =?us-ascii?Q?YOjCQm1UN7z3YsVb1NiUzCJHtCxFA4K52SmGdXQvbzWKfTXqsh+Ae5GNQIGs?=
 =?us-ascii?Q?RBnWWXce65m65MNwCwv4yuT9YgyvJmnTFxWVstlFp22ZySwpX0Xr+cFJ/3NP?=
 =?us-ascii?Q?pdku8NBZvIcryvUeSe4fg+vSZt6maBFYLSRxKk03LNSclgbFZtc+1hkBXZnz?=
 =?us-ascii?Q?4Sme41I5B7fGqv2YZZn2ElY9wvnkRuCZZv79M+kcefPg0JP2RowuZkzYo0J6?=
 =?us-ascii?Q?TzN+ok/ixbH9ULhkpIqv+olgDtbYE5p2+3kAULC8GzU6MDmm28mIwKD+e3BV?=
 =?us-ascii?Q?NTQBU+Owl1Xax7swwXp2rmAiDv4of9tFC5QmbNSdfK6tgY/iWTSAqn+NeJ9h?=
 =?us-ascii?Q?5y6Ih7CYUCFZ1MCg4qBIQP2D6VBmA/QX55i9fCj+Ul3PO/LVR4sV1FPe1ghd?=
 =?us-ascii?Q?OU3BNtMG85EwXdc8IhlwkkTzGxgCbZCDLKTISELLimELwGPNd/IwAqwpcrmh?=
 =?us-ascii?Q?kepGjE3yW+gy3WoAS9lY2Cd2pJFr6AA=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ef11be50-eb2a-4ab4-f6f5-08da132e0c2b
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 15:49:32.1383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AD9WGUfgbcNGoQMkQ5o2Euw/uH+uTgo6M43mJZaMAjR8qFjBMiai5rEAO96+D/NeGsMfx9hbOC8I0AbH6NupZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2785
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 15:49:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96293

This patch series adds idevicerestore package and dependent libraries.

LINK: [v1] https://lore.kernel.org/all/20220329024856.27349-1-potin.lai@quantatw.com/
LINK: [v2] https://lore.kernel.org/all/20220331021648.16582-1-potin.lai@quantatw.com/

Changes v2 --> v3:
- update license to follow SPDX format
- set PV information

Changes v1 --> v2:
- add patch for libimobiledevice-glue to fix undefined bswap error

Potin Lai (4):
  libimobiledevice-glue: add recipe
  libimobiledevice-glue: fix undefined bswap error
  libirecovery: add recipe
  idevicerestore: add recipe

 ...wap32-and-bswap64-errors-for-MIPS-ma.patch | 32 +++++++++++++++++++
 .../libimobiledevice-glue_git.bb              | 20 ++++++++++++
 .../libirecovery/libirecovery_git.bb          | 17 ++++++++++
 .../idevicerestore/idevicerestore_git.bb      | 17 ++++++++++
 4 files changed, 86 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libimobiledevice-glue/files/0001-fix-undefined-bswap32-and-bswap64-errors-for-MIPS-ma.patch
 create mode 100644 meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
 create mode 100644 meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
 create mode 100644 meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb

-- 
2.17.1


