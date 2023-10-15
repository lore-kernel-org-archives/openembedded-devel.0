Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47318CDB491
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:28 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.60])
 by mx.groups.io with SMTP id smtpd.web11.90066.1697369032343148425
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=Alr+gdjn;
 spf=pass (domain: welotec.com, ip: 40.107.249.60, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jyjr7SUJKcCfR/AUCisMNWQKJ102xTsptqQ9MNYz4dSkJv/Tg+5W45Pllh/nRFE6zC2Wj6LRsFN2SGGL5sKRtcVuI2IvUxytPuLYOIZhEK3ZUKdK+2rlFISD1VgyuVaIbVXu6EYMqYvIrzVzHKdaFWNwxh56JYla48fWK5L+gBKpvSy4CCCKStVt8c8ux99axt3PSEax5vOsbFk72LFzuKg/68O8d0aGL5Bo89yi0wjCYQTJO+yWZ75pKaNVNIiqZKhMMAyTggN3CM34FvzlZfwokrBAltg6J9JQNOc4XZaGjf8FTDHhXNONXCFmGffgiYYfC3iKx/h7M7pWL1aFpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pCHrGgRW8Gp1h1gb1SRnmIAa/LM7Qk5jOvHDwzHCbk=;
 b=TYnw1d+ee9EqrvS9uGJT0risLlR2jLXx5qFleIuUq+nu2BNuNyYAFZj+mI9qmxc9jPqlSrb14mG4qsv11rz52BDdwnUQrlc0Y71iPif+1xPHPHqIRq7+b+Tq7Cq5IzoIsSPkHSKNHNnzvhthHIozbQJ9A6jSaYmOLCgTSBfSX079BpyVJhCJ6Pjva2IoAMqUQd1DsFlt7oQgS2z8oRLv1C8TxDhKcib+XmOXXItH+nr/oLVJ7oF2/a4aZTMJu/kAuu/HiC2P1aR48je9elovsj6olSFAb3JOVi6A7SxMbJov2jgR76eQ5r1sFXRJf4QzMsFMbGsNQ/9ddfmVspCuTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pCHrGgRW8Gp1h1gb1SRnmIAa/LM7Qk5jOvHDwzHCbk=;
 b=Alr+gdjnegfDMpg8i/6gnnEmLFrnV8cNNqqJ2HJ5fxYi6rQBdbbzdVtUjIp7J1+PB2dy/AN3cu6YO7as2ej0oIuiCrf6aKEh+p+8r0FMT/ddBITvf/ie3CrmUTJFEcK08QXSHPU46M8k4dlFIJ7ghhmKgfXaMCTyjNM0CgtKXw3F7Ke2GyDb8eKASPPBVl3neKYHNpHBqw/QmohjeNSuNtgBaxY5wATyWF5IQ7t1qyF7ji2vhB1K/1Mg7J2wtRBl6GT4Ke/MpkMm95fHprmGyUCFJiN9Hm8/2BojDS4OV5S7qV329HXuB2z6r2lwLmnNR9iH0Gt4ORSWoJJhXkyvqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8113.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Sun, 15 Oct
 2023 11:23:52 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:23:52 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 08/11] sstatesig.py: fix hash calculation for timestamp
Date: Sun, 15 Oct 2023 13:23:33 +0200
Message-ID: <20231015112336.55722-8-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015112336.55722-1-p.lobacz@welotec.com>
References: <20231015112336.55722-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR3P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::18) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: 087c6502-12af-4663-64ec-08dbcd7135c7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rI3LWm5XN5cDdmF7qGmBn9YWWH1cm2ZG0nYn91ybJbOklrft2z8ESVsy3DIUkcjvFtxJPMqjJZablegjguzl1cd2jB0IRY4mo26PwkQzsCaJ6iaC0wAU+VHe/wukkG/xkXebiVrrY/e/hXvolB0Y2akycbrjwRjMCO8POz2gyGK3R1yTx5Ww+OZIHLuwFXZAYppMTE/1PBRrmk8T3YHal6g118nAE0ElJF7vDskqB+hK8JcnRPU4CBno010E8/wfiBSkztw9BjstLNeRWA7XT53UcNUIMOeNiwZ8NzimMxb9TGPkS213rNpyU2MnF0NDHLP/CyVmVOBQikbNtmon5D/1ns2ddn2XI1iW2PGa/GyKJE7LftsoiJzWzeQ+YP3PtSfuswvIHRbKvVmipwBOM6o/lvjG/fIn4/QB4uDCqaMNQ42ihtkA4v6wr+uUuS+UzYPU5IR8dfa9A7undh/3x6Il12bXj1cO8UBxdzh5rnh0EFJrb+Y9lpsRRgNIIYLxgIV3KuBEAMPWCY+HS1cDa77oOrb6ZZO08nwo1emz4At4YIp4WYe/60X5NDs0uSsRJYjlZE6NDkgS2J2sjm/8fwvA0THtybndJCYkTykgkjhrV+ALGgcNuCRhYxZSKBTn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(346002)(396003)(39830400003)(186009)(1800799009)(451199024)(64100799003)(478600001)(6486002)(66946007)(6916009)(66476007)(66556008)(6666004)(83380400001)(86362001)(38100700002)(316002)(6512007)(66574015)(26005)(1076003)(107886003)(52116002)(6506007)(2616005)(4744005)(5660300002)(41300700001)(36756003)(8936002)(8676002)(4326008)(38350700005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3CpR0b0R+jKTqM5ReJZ1XiNSApBannd28Zc8TmLJEJHfcoWCF5uTGp6ji3/N?=
 =?us-ascii?Q?/+aYPAX0pIbIhlmnaMrrWXf/Q/+E/eMadQrUnnF4Tn0a36uWbW+8ezhmudsp?=
 =?us-ascii?Q?XBgZQCX7gdOPcqv/MG+UHCDW2CtAsLbN1vtoUTyPnvNpbXacWr5utCrg4erk?=
 =?us-ascii?Q?XdbYiyFlSLJoN/ZVwlnl4IaYn1UfgzCK0MJbUuvK1eH/LAAYNO+yWUkHYTsy?=
 =?us-ascii?Q?ebnnb6F2KHVvwmeiProgx3MQxPFS/RN+4dM8pfN1froTvAjhZWqnZC6UKf0O?=
 =?us-ascii?Q?gEDuAR98V6pJAM6dZavpjDH5ca5PkCwpneeDF+qjOPhdyazheYclbU5IxASQ?=
 =?us-ascii?Q?jBhkpYTjAlmK5Ir1NgEU9eiJhgzTlXP6aYei75GvaFTbsGptbQAkirS1ZTHj?=
 =?us-ascii?Q?n014vM6Xb/gI5mLjuA5HvugnDFgipzMjU2JKUxlY2+WjNP6Oe8p6Ytmkvkwe?=
 =?us-ascii?Q?H33Xgp2inw1f1xIGlGOTosrTBVzAgmaPnQ7TdH1A9f7ndPd80ZXdWxaHQsSp?=
 =?us-ascii?Q?YtEbWOXj3AovmyO1NZWGLO6C90XPsOhR2dIdVyEQuMmx+soQ82pTN7Kna6Vp?=
 =?us-ascii?Q?B6H+qgzayodChw2LLbsaSM0qUTpMqiPQti2PT2T9TAjFr1r9qklMoAIBlyCO?=
 =?us-ascii?Q?RZd6avsUY8Lfc8xukyaI+cIE/Z6XRSLHa7uozNQFcKUFRSJH3Sut0k5dj9m0?=
 =?us-ascii?Q?YBqa2f1FHrkXbsPkTA9A7DqMHF5z8Pee1CuAsxGbUHVFKjLw9DBqzg6Qa5P6?=
 =?us-ascii?Q?sfp/82mcFjkfz3/qBw35UBKEPsgCZ+XBeGR+tfkV8UAY2OniE8EcYWOUBhYT?=
 =?us-ascii?Q?0qfBkFwp3IW4ulJMUxkjfz4bOj3XrgysnJSwSEsTTPvvAMGvm8h4XPHxlBj3?=
 =?us-ascii?Q?z/8xNN52IF54n6uP+JwZ/F+f+MvcPKEk2rvlvNLKRfxZAjwY+bGLYskmRdSo?=
 =?us-ascii?Q?OBZI64qVB7eu3KglFnI73K4zV8hjDpcilI+Oa/ihUI48DKCRvegA5IZ2KBWJ?=
 =?us-ascii?Q?Zm/FGlB2vntakQ445B+Kn6HhhY8i9jLwhNUOjGYuwWPA8xkmbXhYyeX9hsq0?=
 =?us-ascii?Q?gMQF4s6fhrRpsk3rlB8MKEWEDEGGiWqH9Ab/ZFI2m1H7j6r/wydTvmMOwrST?=
 =?us-ascii?Q?LdpLjvSakVKsDGXKXAe9KZSPKBagU5om2zZXHYg+gq09K6x60fD6nhppzUJS?=
 =?us-ascii?Q?Ko8VbbuN1YLMKEk2HwInkJc/2GsHT3rpnMYVGuuD9mLBWA/3+tak4YFuGa2q?=
 =?us-ascii?Q?a52RZnubojjgkYMObuL1AgBZXfj9DsnMrqlgQHCkrPo2r4Bh1xA/+CTTR4vT?=
 =?us-ascii?Q?GN/rhsaAcA4UCIUUO03/D7BUijbNa/Fpfa1ricHtJKAMNzDi3ZarubXQxGue?=
 =?us-ascii?Q?+UCDSaI0hfqqlVJV9FodPE27gE8uz9g7zyOEzbl44ktMwiuDmfJUCdEzXfbR?=
 =?us-ascii?Q?PVYRQ8XUVVseFngvsCuxzL36SpQdmFfepv9NsoMPeyiwulne6XHkqPogVVwB?=
 =?us-ascii?Q?B5JmI0GnzWM+TwD8yD5w+NpZcBT5ZWdnYX18OlRmOvTZ7TBLJMikbOHZMJJ0?=
 =?us-ascii?Q?VOB7s+gWdWCi2A8f1OcGTdgsLVQew2gMF4SLCjby?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 087c6502-12af-4663-64ec-08dbcd7135c7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:23:52.1740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZ5U9IAUuuX5D6TJ59pKFY3lZ/Y7UBI7kE4mvWxeEL22QJmdZ4+czHtOoIkklyCIbvfoLM0JYtFAFuDWUIKKMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8113
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105536

Passing timestamp as an integer was losing precision, which led
to problems with badly recreated sstate cache.

Passing it as floating point number fixes the issue.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/lib/oe/sstatesig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 5bf1697e72..f1f9de253d 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -604,7 +604,7 @@ def OEOuthashBasic(path, sigfile, task, d):
                         raise Exception(msg).with_traceback(e.__traceback_=
_)
=20
                 if include_timestamps:
-                    update_hash(" %10d" % s.st_mtime)
+                    update_hash(" %f" % s.st_mtime)
=20
                 update_hash(" ")
                 if stat.S_ISBLK(s.st_mode) or stat.S_ISCHR(s.st_mode):
--=20
2.42.0


