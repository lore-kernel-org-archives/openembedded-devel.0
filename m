Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0768ECDB48C
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 13:19:07 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.83])
 by mx.groups.io with SMTP id smtpd.web10.89881.1697367080398083208
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 03:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=n1hzqm5L;
 spf=pass (domain: welotec.com, ip: 40.107.7.83, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AM8xBn95MUYamsnU4DhROfPWKsC0U6eczSKZIeGxWcgGdST6Dm8mEV+kvQAYhqVxPvx+Dgq5W0JUMtRg59w9YTxEWxdPIPOMBFLte8Yn6AwijXbLpH9+NTmxf0G7NZW4sfm3tO41hCAE/GcwMyy2guJzBnrXBSFOtT058mUrSsuAHBRlnAlp0zQdSNSBEKr4MTSOGTnIXADNJVrLYGeQJcb1gPDnDuQjmvo+br29xf5Rb423q1xmQL1y4KFoaAyS0SvFl5LHjwc1XmiqJIe7IqSsJOfa1d8Aqwt37WJIZXrASvRvXT+vDAUi5RSGIkQ6Kd7ufwhpCZMx5bhGd0QmZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pCHrGgRW8Gp1h1gb1SRnmIAa/LM7Qk5jOvHDwzHCbk=;
 b=bXBHzAxs+PDlZWDpSSIn8g3NlwrK/l0BlFwnkTTw7OY3u3LU7JyXUBkDmHr0uzYSFsochPwJpkHDlsxB7GvHMqZudxF77cHyg7UXMfguRHcwaz2n7QsVz554/dsiJxM9Gj1KypeW+dOPrLed/VK/AZ2r3ZcduBl9F6XnUP3fY1SgeRve3ixbaTTrOl5W9Kr6gy31CK1rFgXBrhGfvmiH4X4z9AxIoZ3DefhfXkOvVRwIltGh2yKXrYO7ZtxMlSdMpdIBQw1Uxcxxq4VIL9ILgMaM1wR/PLNKmW0uURdninHJotN5GXeaUtd6NtEqtCbBai09I+vUPbvxYVa80JiXJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pCHrGgRW8Gp1h1gb1SRnmIAa/LM7Qk5jOvHDwzHCbk=;
 b=n1hzqm5LOeR5Ws3tbSHEyTOH4o0oQQ+KO4lgB8Xofl5jCdruXfaf+Nl+dtabvU8XlceGgotFkcHH2QGa8gHO+3mB6ja908RmhQxTtjSRPAQ2SrwTkvhwu57Yc9/FWgUKkAc9IChMlUKvZpE6HxMw6BnVsPJP+vH/1QcUxVWVUZyo49uS2DzNGVZQ7J6dClqGbvh8Cfl1frHTWouGPT2WqRlpuqcdFFQ1nkkxYtV7uVXGIZSeQXOF20hQ/QKO7qHzUpP169RYVIBv7B5deJ0MwwOs1K/eZ6vbs1FdkZGtgWBuxKjNQpBEWVzWhYZxSwBWEapSntXCYn5N2W9LQBOsLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8308.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 10:51:15 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 10:51:15 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 08/11] sstatesig.py: fix hash calculation for timestamp
Date: Sun, 15 Oct 2023 12:50:52 +0200
Message-ID: <20231015105055.52510-8-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015105055.52510-1-p.lobacz@welotec.com>
References: <20231015105055.52510-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR2P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: 748163b9-cf17-4629-6440-08dbcd6ca76e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KOECDlASlmlpp8NCCBM6qglkhrf62nzXO9NEHM4M8Zv34botm1bAJVXWNRD2YghzaojHhdIrPPJ7elUA8L0AwHjYLfILsGws3kJ5iPSM/JXPw6Bd+15Adk87UtN13Buj4M+ZAhLAaabXWjaRyF6tXKE6x9VIkT1ZgB/qRcT7CWNs2j+/9Cx4Jw6GqcFl2toPeI+VzaJk1DxlvWUUMs9E7GSO5aOs8S5YSd1yxhRh8RZ+Udt9g91YZLkugwVmV+VUhauSU1zQ4m3L3b7EAqoHPuo5KcrpQNmLTJNtgzzsQHuvQrAEl2CuaqVtyPB/Z4ocw2YYRqboEAXBi2gNNEDru9HrblaUlwPqAsCrgulZfxQB3jbahEIidx0LKgf6tgvW7qQfT8Cu8/t+eek5gZAyDIUNgVbtDpaCSFtVhGSkuZz4YpWNX/7mjiElZh7/bQW9wNh3kWN4rzeNcqKu7+uBiAhMevpE29OCXfvT8aMP/tW01DU5O4TSZTM1Kyqaiar9zkutjynCKeC9SfrsOL3WUjVT0dhWLH3/h/rcpwnH+T2LJup9gNbG4nDw2IywJJEL7PP8ixUmaDmzKUQ/RRg5+gsfVRzsnZYjqdh3YPzIXrwVLVS3d31ZIWIolucnjj5Z
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(39830400003)(396003)(366004)(1800799009)(64100799003)(451199024)(186009)(38100700002)(6512007)(26005)(66574015)(107886003)(2616005)(1076003)(478600001)(6486002)(5660300002)(8676002)(4326008)(8936002)(86362001)(2906002)(4744005)(6916009)(316002)(36756003)(41300700001)(66476007)(66556008)(66946007)(6666004)(52116002)(6506007)(38350700005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?po2+MNXZHux6ZmdPixZMnIyapUFCbzMPr9EgUFgiuhbZQSNtpBVI+IAUYiyM?=
 =?us-ascii?Q?yRxb5LtDVDtc9h+0I6+1cqMc7aoUl7zdZt7SobJcKPaIqaGyGfZQQbxH5sUY?=
 =?us-ascii?Q?Ky1wDsJZ9UddFWMacCGhLn7D62wEwOmdbn6AomD/Bx9I9OFmEMQAhcpuGQUP?=
 =?us-ascii?Q?ewH2D50YxcEgClQcepvTwSmZ1wutzly7okp3xs9KoRjt7qpoQl7CAnHwU4B1?=
 =?us-ascii?Q?7wrBaCpuG0YzMAmkI0xfztewRvYfNCrjNNlqAMhR7P9PQ/H+vOwEEL8MTpD/?=
 =?us-ascii?Q?S0gufK+RBqAvIF08Nxrt6mOcXIQfx/iLMTmCdbG66tTYtW4qduvF5RgHvFpx?=
 =?us-ascii?Q?TLQAGscwkJ0lr4dgBnoMAe1h5biU9NUJIyTfvwDOqbw6168jVPY+sdagF+WU?=
 =?us-ascii?Q?UHVp6svnn74xS5DwIgbBKoyU3yn1pzLwGkttcfHZEV6kmecaPSFVoLS2vTkt?=
 =?us-ascii?Q?UBIb1njER6C/k1WWxRnGhO4lzChd3om48TeDdjjpvq3ZqWA4Hn+MI2SoDhNF?=
 =?us-ascii?Q?WromPaU0/Fy9cGqiESLjZse43A3kdpwEoIjzcaHgF7qIdWas5cu7Sa9SF1rX?=
 =?us-ascii?Q?xb1uguzzKcSvCgqOz3RBqDiDkgIxJQwF+wNW4zBbGfvPdrxMPCWYLePGCnwH?=
 =?us-ascii?Q?raI/jLDT7A4wtWXlSTaC955nHToc3u9F7Wl01i24nXPK9yed3JolD60aqXwi?=
 =?us-ascii?Q?aVOAaSlQr9Z8Oze+EWgr+4orajSennYi9ckdDQmjdIQJvIcB3UKVMRNXR9yK?=
 =?us-ascii?Q?qEpwmDSa4ektqcDFoB6aQmxQsih5RD54D6laz3nbzncMCfZZLtLetx+Dn4i8?=
 =?us-ascii?Q?LlYBKBwwoefA95kj91/ROUXenk0jv7FYpp0pY3XdJdvZtSKFifqZmIKKxeDI?=
 =?us-ascii?Q?tiKiebwYJfH8z42F/M3NDke+N6TqIhlRuCVFiOZwiB6fnpb4L863nPhrf7ul?=
 =?us-ascii?Q?6PIMJpKpaGQNSS53V7yPux3ziq+HgnrStQxIed9OlAnHluetZFUmfEc6CSAJ?=
 =?us-ascii?Q?QN9m1vqf5A6dUlaL67SxPyMc5TBMhYYiXj9IYKxh0xsgT1qLpgRWr84hntio?=
 =?us-ascii?Q?9Wt+4dZ3MsaM+rkTcJ+L/p12FyEn8cghBaVahgRUSiEvkYelAwHENM2xMKJN?=
 =?us-ascii?Q?yU+TsNk7fwJrQSBksp00CKNXvZ1KCwkkXbKWTKrYypw2RuIW6rEI/zK2Hzf1?=
 =?us-ascii?Q?+UymOpMmrWUWPAD8vRf1LL+wGnKIyIGgRsIbx+Q3g8hb9/KiKGUMtIfWO5wb?=
 =?us-ascii?Q?g2VwlcIpA88ZKmNkdBadkH8QwFpVcKTn2O/0kVNg26qebbp3vlhuMM56aa6D?=
 =?us-ascii?Q?fTol8sqARFyGkfKA9dojJDKMR0P8BItHM55Cpx/LOCOOzQrZpFAhpYpIrYf/?=
 =?us-ascii?Q?moFlAA5hruYVIg+Sh6xu1GzQzAbjNHYFmRVjdesWboZaF4T9EKpRkltIzH1p?=
 =?us-ascii?Q?2/EycrwcRj6PJNJrjR6VCf7nmZQEAaWYl7gXBCd36xHDBrfQNXHiYL7CrAbW?=
 =?us-ascii?Q?DXKr3sEXNYY+7ayMMPlbGgXWqFSVOjY60DjRB1as/mvTiQFJbkkTOukNfTwQ?=
 =?us-ascii?Q?0caTYviLMoOg6DmQCcwUYNrUoW6eT2vBRun2ir1p?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 748163b9-cf17-4629-6440-08dbcd6ca76e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 10:51:15.4054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pyo6s2OPVsFjH1+cY6U4mkMkI8eQiHD5CUPFDZ2YNvq7/yroeXZGE/RabPGGW7zXCom40cLtzPSYnVjk6I5k/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8308
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 13:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105501

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


