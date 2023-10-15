Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F20CDB490
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:28 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.53])
 by mx.groups.io with SMTP id smtpd.web11.89880.1697367955844343434
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=Ob1vmwPv;
 spf=pass (domain: welotec.com, ip: 40.107.247.53, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ee5ueMUjs8+xOFijVyrkJcVXEf63GN52xULUrMnglJ+WZIqgdwy0ikuLQ3bIlYCX1yyhBRScHZDjqZOWE5Hc6ZD9Swih8vmkZbiK1DQAvkf0LIO/hBkOnG+8thqa2VDxtmd5YUlijR98zcddPQ6qRRAwKn2JGLfF29lI6jpUbS7M/X6gACmwZErcviGg4ElBUkEy9KaVsI5AKimIEQxaz62JM5HK7CAG+Tq+IwJ+Tm+hHuq7/KUinLRbdigekG74dr+9+LcpkANDGU2ypNQkKZDdbfhdIsC43+3YdMMyFt47n26AJu2i0tf3dnrLafP2iUcIIQ+sT5DbNRwUvQMp/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pCHrGgRW8Gp1h1gb1SRnmIAa/LM7Qk5jOvHDwzHCbk=;
 b=TiPSOkOvz9JgOQttKv0Mjtn4NT2QVezLUQ8CBFfqc3ZxI/yQXjOoIOdLen/4Lwca4CF/KEAT6tjgoXoBySr6TtZw9VZo7PyIEKdq3pJSYoo8rjTDODZUrOASrYp2lCG4RoO4fUuQKyBd/mkLvMQCbaV4heC+8ofRJsq/v24O/JmNWvGFAa331jp9XjomjE1rP9+8EdNcnf8NYWALDVN9f1YgWhpU92d0HJgd2rGZ5vKZnJnI6UgYXf9d/1J+Pa3GuvPJwtTSgnY09wMgH2EA1M08IwbPvdUAqzNppvoUtomDzaEnUpnRQF5S8HzZ87Gp9wWWv6hTLog8skK0RGgs1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pCHrGgRW8Gp1h1gb1SRnmIAa/LM7Qk5jOvHDwzHCbk=;
 b=Ob1vmwPvuQg6wrek7gVm7Y/VFjcNNT2o65dg3FtsLAzj7eLnuWLODse3I7mOo6G6yWKgLC78YqdkxIKi929E+HzRgT7BWuniJgaEoudDm2W72A2KIDGVcun7YHG/odOobQTbd8hEC/MP9qfnZc1al13K/Ue8onof3clZ9iLC/lW34b3Z7RWYvU3CWzoRCaJwA1yuCU/gCMXID37lFJ0a7x7paNlpIXbVN6JG5nMBwonUpEdXCjF7Zw59Gt27LaRbgGgxYlsL6W7XJ5RyfQmqHWeWhdWM4bfoq2l7wT49nKCJoMRNEdJht32gPhlKIFtkVzsQtKzHTvSmsrTHuPhRWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8940.eurprd04.prod.outlook.com (2603:10a6:20b:40b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Sun, 15 Oct
 2023 11:05:52 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:05:52 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 08/11] sstatesig.py: fix hash calculation for timestamp
Date: Sun, 15 Oct 2023 13:05:23 +0200
Message-ID: <20231015110526.53738-8-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015110526.53738-1-p.lobacz@welotec.com>
References: <20231015110526.53738-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR4P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::13) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8940:EE_
X-MS-Office365-Filtering-Correlation-Id: 873f4c00-2b03-4ca0-b325-08dbcd6eb1fe
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FKmzzKMwYiTSrWFScHeWO1t6Wth5Iz0oDOHhau7US8oWTgJsdN7agdr7jIOwS9FzTVS1S3lllJbFoEkB4WXbSkvVmFb5E826tENwrvtuQGPDFSkfLDda2+YXhNZdMWqK19V+5SKFw6derM9gyXY7H2Xl/0uMgcP+E7lovBYKtPL0aV3gCNbovUH0IGF5RXvPfIaEgFZirZ3I7ZZkc7vFYcSnOJ1PDiEYaCCEUm+PvscpiSpqmvV+riMiHXka2Newgd9ImZb5qZrc4LJmSBndU/3OvkQSbsmTfQoHdYXvU0g1P5Pw7lx9SAFPQFs338kXjpqcUNp8nF7E5nK746RZAKdsNW7GyOyGL9z4yYdjuVHCoa6/3EbRl22/FYN8cnwBZgjbhmvUJ7YUIVLM7N6YynFPSDNrE0snor1iOwh+FR8OMVUfG9jGyIbNJVyI2PppVhn7AoBz2OaiEpegbTKBGX/M0hJKK1Z87IR1ySHOILI9QqAmwPDpofk66un8VZSWN5S//BBhe9oAum/S/aALmYPUhsVS9ea4Hmbt4hthdefW4WbQYL0dbpSFVt8ndTQ03IYpswxS57dUWYbjVc1TYfxBPgGbK6naoNIrJDY6s1E6ZVQM11c77xg5fAUr0Agr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(39830400003)(396003)(366004)(1800799009)(64100799003)(451199024)(186009)(38100700002)(6512007)(26005)(66574015)(107886003)(2616005)(1076003)(478600001)(6486002)(5660300002)(8676002)(4326008)(8936002)(86362001)(2906002)(4744005)(6916009)(316002)(36756003)(41300700001)(66476007)(66556008)(66946007)(6666004)(52116002)(6506007)(38350700005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?z8g7ffdHFAw6WND3OKNvePVyPqt6RCx3Bv91lGYkSLzaJXBCD7rcCw3rHyNA?=
 =?us-ascii?Q?BK1ZoD5a4/VQzr3QlIB6OnGVsMulRSz6J885a3Pp6EtzRC1LLGrPjXPFQMcY?=
 =?us-ascii?Q?WxTPIJm+gSPtLnnaGqg0QPzrJeljz0uMG4BQV5QtRtTn9P3SQ+WTwjg5zON6?=
 =?us-ascii?Q?DF4kOTLtAnpjTSM1QrNe3oGsn0NTa1MLFZ7Xts5gBZLJlq22Ukv7++5hivsG?=
 =?us-ascii?Q?CRJVI6wyqueSONsMf0BEHiV2TqWTbEVpA5Ywm2LfHEwtio2LXaIogkRo5Rgb?=
 =?us-ascii?Q?omWbmAyl8zIQ6Y6OwaoX0TjM5FAztJ7U9mdXHRLN+ffuXom/ZTTnH1XVlrlJ?=
 =?us-ascii?Q?yQ+YsaPWeWT9TIyGk0uhamW44exNvFo5rix9VMSagrv+gHBO2zgQlThbQtb6?=
 =?us-ascii?Q?pyO0hgQXhIzDGzLKiBfpNcWY4r6MdCRAbRJZW1g1rWJWtuTSJ5+XwD07QFxb?=
 =?us-ascii?Q?qjhNw39iE5rA2ptSFYhK5FtZma2T3vi7XiEQ9T0w+a84/fZjTU0Vz9J9pa+B?=
 =?us-ascii?Q?gE4TDDoZQ9jYZdgCP3Wbl0O05PHf4/shfhz3jvKrASeaMAoe3S86mFAwtxAj?=
 =?us-ascii?Q?Yxm2D1ciLra0093b2D1Y/N5LhNIU/Wb1QeQnzUikUJfRYtn9VVZGs+ZkfSTk?=
 =?us-ascii?Q?fP11BlmyffBxsF9/LdXsPL4FTimfuw7wO2Dwv0qHWhheF6b37OUKn9EFMP6I?=
 =?us-ascii?Q?PJPi+3EENKFIzkBoocSlxOBByU+QK5UlnTdj0E9jcCD3/iFkwt26ZP+5wBZ6?=
 =?us-ascii?Q?PB3HnisMwrCR73/85UeATkj2SS5KElDQDUnByiW7yM+O77hYHD6CB8GQj8WY?=
 =?us-ascii?Q?mTPB8QQwY5kM0keau/d9XXj76PkM8ZaVzwPkov3wH4PIYW/Wp78Cr0jtlRNW?=
 =?us-ascii?Q?9c8K6Gv8EdPggAVVeBJU07gb/9op4ZwLDUOvknRYPALvjvFHCAQk0N0PgCY4?=
 =?us-ascii?Q?T6k9GSBTNbf9x7jnG1n8ZVc12RICzkg8E2LyWw1YMHjND9Gopy21m8Ntlv12?=
 =?us-ascii?Q?fyiQsfB29HHltOAvS3amwLhzcfYz17Xyex9CnMXNSe8sIocW237CBvpCWjml?=
 =?us-ascii?Q?E1KBdP5W1i/htRk+cc4/o8KAcJ/7HmNmeQK/gwtlHvkos/BdjHkhbvFHWzWg?=
 =?us-ascii?Q?V7VjmDTSYrkcHXA9VmBgULqQgyQtp8Gi8bJrVfsz1URRryiXkgmvf8St4tAr?=
 =?us-ascii?Q?LlyjiGsd5YzNHjI5SAyv1nPSIqTsj1segjKSu8fAoI6Bb116HYvESYLXDaqk?=
 =?us-ascii?Q?2PgizvGz1z5K8txfppBW4aRAMUT6blh6yt5pIfWni3nwQMFlLmRv0DgZFgmn?=
 =?us-ascii?Q?m0c47xfWoCOcEJppIB8JJlSYdB01N8s/Nvt4nREenBHm2Ccm+p+SOy9pWX7D?=
 =?us-ascii?Q?kf0lVd9OEj/PatiEvTC2a/L0iyxcolLU6g6QhHw2XVyOSvKOKqjFztFFUjrd?=
 =?us-ascii?Q?1ijdAe/POycJjuETB2EHmAFh79XL3fCEbo/cZ0Nhr/X2Zg85YEZpgBhtE1fx?=
 =?us-ascii?Q?av33HKb+zGVtQenqeMZRR+Q9GRZMka9SGm3L2LG/bfbcxVfRNFVTq3BY/a8V?=
 =?us-ascii?Q?CdING5I4La0GpcMq+uW2auUz5ZhS7eBBpKwdbJZC?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 873f4c00-2b03-4ca0-b325-08dbcd6eb1fe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:05:52.0944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rnjqNKgGDPnd4AE9Tx71e4+q9N9jHD7tBHiRxvEzOM6k2uoEvNDEK4OeL3QCBYfMUvimzA8Yr1+ho4GiErYwWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8940
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105525

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


