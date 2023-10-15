Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45E7CDB47E
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 13:19:06 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.83])
 by mx.groups.io with SMTP id smtpd.web11.89851.1697367731043602381
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=nmZucyL/;
 spf=pass (domain: welotec.com, ip: 40.107.21.83, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEYFcfGoMWKC1NwIQ6b4lTDFyktpTGarDRcZbGozaCZoe7rbDaqsj71He9HjmSY5Py/Z6VPJVUf4TBxbVwpbDs7e/trOyKGtIiuApzdF5RtO0FR33DGy7pU1nlizwqzLUceP1mDm4ljrHESvoUn8dEy+aj6yrUN8C3kzlGkfqqaNekYh6aEf+pWY4dkQ3tAVzCZQU7r5x3fIGuWwXk/mtB6pvtWBJe90ssdQ8mHNO9BuuWqqPjsrxKe3a+1Csgi9Wzt1bPwBNQkM3/zxOBGIjIskRoH4tnil02Yspi9nsuhaPwiU4EpA52bA7bd124im+jPF9Hp7JP6aZVxxSo587Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pCHrGgRW8Gp1h1gb1SRnmIAa/LM7Qk5jOvHDwzHCbk=;
 b=kOLp3SPJg03LodT+RATXu10rDhUMyCBxSZfNJK6SnPyf1QmdBSIXnwuK5Z7w+fNTIjenm8MVlFe5jGmpOnZoW42jI1jk2M7gUGRLCp2AJSpvDWdYTGGfWFGuDK/zSEp2dEdFAxUVbjGugHZSeJaNWwv4SFFCHu+x9UZMdPtJV1Jjh8vNt9Anz9zeIvSv3SGZEVabk5FEHXS8ho4gRbWdbB7YhUgCvlPX+u+ZO6uxg0SeYQZ9OBXgS/SxLZp/a5GJkPepj5JnqEu5tNQsOr3CMpOGflve69t+saZnP+JXWs5bYekgSjDH5972/H081t7hJz7rhxBG1kWI7WA2m5VoFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pCHrGgRW8Gp1h1gb1SRnmIAa/LM7Qk5jOvHDwzHCbk=;
 b=nmZucyL/+ZWskbtkWrINyL35O31aoSss4sOtSFFGu/K26KhFDHKD04OfA+turKFMo2wMfYcBffKXZhFGc/6xnydLV3xd8JRCINrlErc0JPLrhdsMAu7ZUZgGWwbKHYyj3U0hzwKCsDsvUrdg41C813MLuYGRa1FU7WHIJTh7NoVFgba7XVNX93XSgIdLxYAYRgODyK/2pGBnHRJI1tnME6ELFfJgK6mmnr9Y68QS0ifVKtAzodZWeTvJEOpyPZIVFaAYoQowTUI8a4tns96Tvq/1+UYXGoz+FxWgrhFcgshnqXNzq7HR2gVKH3wYSmtAu9QeCsdtstJ8ubRkhp1+HQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7925.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 11:02:07 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:02:07 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 08/11] sstatesig.py: fix hash calculation for timestamp
Date: Sun, 15 Oct 2023 13:01:51 +0200
Message-ID: <20231015110154.53364-8-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015110154.53364-1-p.lobacz@welotec.com>
References: <20231015110154.53364-1-p.lobacz@welotec.com>
X-ClientProxiedBy: BE1P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: c256fb0b-f20e-42e0-bb24-08dbcd6e2c3a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ESfUF8/NFPpHMfC2u6PsCakf3RMJ48eAnuPsOB+gEgerjQuwECLgIMaVyxx+s/pFQCcbWXnr1zgbWLaVYhAR0DM5D4r49+41Qtydg2Nqc1rbJfeBWnjlUFDjwrgQSqsgbgQtqrIniwYSugXu3cqmQuPpqnyhMxHAakTg2fPWPYRU4wawsuSb6bTOIExmV1oumer3DFq28r4LmBkHo1YMYuTqS34WuaDAfzjXuIedTM/m412v+/ATIbP+ioRVuvrjX76em09f7A6s1ZAIMz5h0FNuiLawttowiH9GBqkH6mtbN6suWDtqHrxUbrxzizS71jcUagstadxcjaqYUNScM3eVFPigDn9mg3RQINWeWiZIQstuAOapkh5eRmWEgZfXgG1C0Yu6xyKfKxUjOgPmzEvmM6lzZLoEmQXBwnSS9v1I5CmBnTolvlT2FMDTDdPpUsC+hNbcerGqnevalF+dWOUhQOi+WBfKMRTE9d6WA64CE8uS6RyiABXHuPt4gywBilqUYcovDUYQr+84W1Z437Tb/jCYf57rXnbEvKlTwjGwDjmRtmH67fjdKtOxviI9aI+nShgVb+LNddaQcA2f/Y43UnX09oUtsObjFFpJ7QZ8qiQRuFHJgbnTv6450v9i
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39830400003)(136003)(396003)(186009)(1800799009)(64100799003)(451199024)(6666004)(6506007)(6512007)(52116002)(478600001)(6486002)(83380400001)(107886003)(1076003)(2616005)(66574015)(26005)(2906002)(4744005)(6916009)(66476007)(5660300002)(66946007)(41300700001)(66556008)(316002)(8936002)(4326008)(8676002)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?k+WSeipyfAeBIlC1E3DvEjiITm0jAr/8fm0AWcsl4O5Mus89An0z/ap5gePj?=
 =?us-ascii?Q?oFTb2Ecgi4QTxG2nXrvVZlW+ef0oQlOwBeDNJFQ8SP4e6eoqh6vOO20MarBc?=
 =?us-ascii?Q?gh3g5H5gG439rPUXZSe/XQ9/eCrJMTKiCNEoJ1xmnQpHlIVWurSQdQIGtM34?=
 =?us-ascii?Q?wxrrZdZlHD50tFVA0O8cIMMbJV+3qRfU6bnVe0PYqa5ldZHbnX228ZkAAE3k?=
 =?us-ascii?Q?/FF6jbIEbseNxLXS7X63m2woUL3hd1St9AfcgV7l5ZFLHm+km9U0yqdtnyus?=
 =?us-ascii?Q?V5wCMObS7rD1XvJ/ypVlBHIIzFDj+DUYT3D25cwaQrcmShex7jAVuiuhorF6?=
 =?us-ascii?Q?UL1xuAyx9KdHVmEVAuTlYXmK/FyjQycaKlMjVgx/uZotRk0OfWyRMa24qQDf?=
 =?us-ascii?Q?5twOnbJ3S7JS435McWC6ypEfuFsdm8eZqBPtLlGV5urpKYgrQgb0/ShVkJlr?=
 =?us-ascii?Q?cd7eykEdMhPxjF8hzQ67SloTND8P5YFova9UMHrE2XSnmKF4TFLPpSnioSE2?=
 =?us-ascii?Q?I9c9UEEJrLeBEtBvgt5XMzJxdF2roafwvQaXsuScY9l1rv3LI3vjZteFfc3D?=
 =?us-ascii?Q?8nHPskkm4jKY/KkINwa7UFBabiTaWexNWp9fKkPxVGi6tKRP/RSHRbHkcxLX?=
 =?us-ascii?Q?04Nv+2uuj1tCjY7oYBuWimCcQYsdI27K7JasFAiSVAuUUBJdXIqQpCJK//xI?=
 =?us-ascii?Q?5+sgZBvV2U6uZsSy3/MGEov0wVI+NqlxAcnwqlxry1x72kOk1sVu3O+Odwes?=
 =?us-ascii?Q?TlFisG7QsPHM8Vk5ySZt8/5iNk20kUDf7sEw8xYE7INzRov7pd4LML1S24R9?=
 =?us-ascii?Q?KIPYO8O5NPc7HqeJWND1ICqMgJ0lLMfIoXxNnkNwwycBbTZW9hf4RG/q9093?=
 =?us-ascii?Q?JzUjTCJNl+bIJ/rB7DwIebs1IYEGx68AJYfQBt+8zPOTqNtchKa/fLXZkU4N?=
 =?us-ascii?Q?BdkXek8vilF78XNjpuvv9T+HDHNfHr+Sm0SerNg9KGgSNC2eWsJwBuK00t6b?=
 =?us-ascii?Q?ZOFBXAX0gDFzuM44ic6ktSvppshirqfqdFbP+1rhhRZux8/Pg4wbyK7L/04v?=
 =?us-ascii?Q?WaKdpf2VljV2f/G/h/PTGwLeML0RIDIzB9Fv3eRTTMbFXiFLE2diYJWXsFtW?=
 =?us-ascii?Q?xxNqjQZq5NPqcACol8JGvjt/VCFN6MuYD12xFSgi1QFfVbTHEgeUG5ParGcB?=
 =?us-ascii?Q?Ww4MrjW5wKnvpoj2p85wWYphKZGvvS9KEEM6qtUqg8qggA7kTRM7mw9u0hd5?=
 =?us-ascii?Q?kIx/ap0qMds4JN8q9tAsu/YSJqHt+egB3l0kA4kRKtKM8q+om714jbjnxlxL?=
 =?us-ascii?Q?nJ1Iz7qcGmpfmmheFz4jYWQdeZxRh6CmiN+3RKtiAi4YNOC/D5CwgvJBpXMH?=
 =?us-ascii?Q?IueYRd9Zm+Oln4qVeVVx1g5KazNTBwZLqjCesygrFatr4DbTQwNV0eNBGtJR?=
 =?us-ascii?Q?YFUerEYcbASD8ILBQ8JNcjjmENp09EfBIS1rqbmujdkMa5KaGQUkaCOimg3P?=
 =?us-ascii?Q?ELuohu3C9ZLFkfqwgfC4GjuMbGnnTChXyQn0DhK9l7kxtYlFq5GJb520qZB6?=
 =?us-ascii?Q?ZNDACsSml0b4Bbx4wpaTTgZZgVPwy96N3bQriOM/?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c256fb0b-f20e-42e0-bb24-08dbcd6e2c3a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:02:07.7402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xk+tOSgOb9RtTolbpsjsIH6kkUdFayV4aLiR7ARo3JmzypKkR5a2Sq+aBEuIp5o4jGoJz6y+vHUIRtfSe19GDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7925
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 13:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105513

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


