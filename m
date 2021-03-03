Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.50])
 by mx.groups.io with SMTP id smtpd.web10.786.1614794298387359109
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 09:58:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=alFpVplr;
 spf=pass (domain: windriver.com, ip: 40.107.223.50, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6z1laxKxRegibzWQX/fUcYiGt448gDHAls3KJpLSwt+xB9Zn4SnGAZkJDG01vJCHKvAdASdQ7dqWobIm4YluePMmmk9IfX9eYigGxxa3UeQbOtFv1ky0Yol37xY++UVQU455YQMEVMpG7TxZs89ijI6HicZNDGhLANzHdhfRNDOGH2lMFEG8oRpv1iBZHUKDx1levCmpdn5AFWwE3O4mWDFIuTIHQcC1uPsviuY2HoXW/r+44AD8gSPkayRkfDma2hmaShM0Id9qtZ+Ilsqxxx9dfXd4NGjNP8/r1pK/rRj7dx7aQpBxyAMhTmD7VV7M6SHmx5ooJCIa1gGasxmTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOqzgMt/fDr8XDugAIhMGRrQ65S+b9pOd8L7XAxlZmI=;
 b=NAvCSnI6b7CggmoNQz1Ez8DZ6Sqx5cm+G5dGrxPrqg9Piv20LBG9908idvd3NJuwS4HYX/p02J6qI+d8CD5wM5e9ub/klCIqNKFNt9f094lv8Nx4KfqLbk0sZ12Tw6SnQZUYmGjfd2/4EjEwezh9ENHjvGy4kM2h0rkKIA5G9seGcxVI0hDRiMhZeX7vNizvpd8wAcKAc0+PeXUk9z9DngVdkqep5+VkiGQhtJDcRC70Fjs/sVQ0gKcboc3wVvRVgIbotqc9fA/jVHlKG++yCsT37XCQFbl2rpOu35e0pF92AV78hcUkOVk7PNVKB03IdPlQF5HOast5iIT9PcB9rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOqzgMt/fDr8XDugAIhMGRrQ65S+b9pOd8L7XAxlZmI=;
 b=alFpVplrY0hJovduH2jvKQh5s3wbiOH2tqB14Lqet35tvkO8sZ5unIwyMQhAmHKi/bVoP4dvfPX2RyA7ysqGbssA7y7zEa07pLAZw1Hl36nDVmPVzeCIEcnATo3h7d0rSsa4JjopH6wFji+qVNmw+YowGJuP4cd4Fh1W18qc2tQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA0PR11MB4544.namprd11.prod.outlook.com (2603:10b6:806:92::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 3 Mar
 2021 17:58:15 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%8]) with mapi id 15.20.3912.017; Wed, 3 Mar 2021
 17:58:15 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] rsyslog: Update 8.2012.0 -> 8.2102.0
Date: Wed,  3 Mar 2021 12:58:03 -0500
Message-ID: <20210303175803.36628-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: MN2PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:208:236::21) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by MN2PR05CA0052.namprd05.prod.outlook.com (2603:10b6:208:236::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.10 via Frontend Transport; Wed, 3 Mar 2021 17:58:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23addfb8-1e1d-4dc9-6058-08d8de6deb73
X-MS-TrafficTypeDiagnostic: SA0PR11MB4544:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4544E1EA80F1415A2F3BFB8980989@SA0PR11MB4544.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xCn+k0C09teJ3dRHUa8mgh3XqJOCccu63IDsf35UsCo1mZQsu3QQm6oAhagIUKrmJSz7m5hd89gZCl3IEr5m1YkrAaQbfJhpvLIDx21AriTaQMM3PMpae6SmvlyMTVOWKtvgSE0zpqJcxFKcrVjPJ3JbHIViwXT/+zL3RobeDpjj++iQmmYGZwcxDgPdo5H9cLfy90nLql9RzbgbCMJQcAoiQnoMxSwHn8uLuw2jZCxbeKwSQVSpp4KhmETak2l4CjfFLLtTeZYJDS/INTmYigpkVpXWwM/fFKan8X1M+T3WWx5owC3KRqfy3idH3Wf499O0Gg58hFdxlzeV45VHoh5OKgzq/CdK4QsAvmPzQ8gWtRhsvRmq0RBVMDKw+kQTP5r9opxwUV7n1X6hrGx8VO6MCzzsWCPQR/XzctANnFCd2TNFoV/yuZtHK8wRkGpYbUxnat43JSvtBztihnK7VOQIQCJ34CmmPtyk802cHHSPXVOPkhW/YBf6ZyzwJM16abdteLLtIenKc+HpqDaTOmDD/nDGhpqdtuYz/oQqOimaLrIO4+lUGNj2opGyD+2m5fxFwbpx3nP3MY+lOOXSaiSCAFm3IUFJVmHsuabPrEc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39840400004)(376002)(396003)(366004)(346002)(36756003)(1076003)(186003)(8936002)(86362001)(83380400001)(6512007)(316002)(52116002)(66476007)(6666004)(66946007)(66556008)(5660300002)(26005)(8676002)(478600001)(6916009)(2616005)(956004)(6486002)(16526019)(2906002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?x7vSir8LLmc527uNZlJv1QUUddKElLYkncVJ6/OI5sUvkR93NObZwYQYJkJM?=
 =?us-ascii?Q?HAPjOSszFknehLQPRZcAAmtTvK5x2gAkMFffv6IIMt1E1Ms6KUQklQZDWPLW?=
 =?us-ascii?Q?VsJOKlb7wa+AD/Da7Txy5rD3Tlrxp/IikSh6jgXH/ccxbH8B87ugB7w73xk+?=
 =?us-ascii?Q?Y6ACql+G9+ByrkJYjMMjLVnACPM6sozdwo3Qi2cc1CYULvgYqpUIrztkNzOe?=
 =?us-ascii?Q?zw4KEdHVUQt7k/50STeYgo8+0IqGR1dfkG3Re7uLs0kaft3mYELBZ/HQPbju?=
 =?us-ascii?Q?UWTa6NnPaLzfRyiS2wYQuv7qVWC76yCuNvSpYN2r1go6JqM92aQLQNUzgzss?=
 =?us-ascii?Q?mRq5eiyaAerbt1WUmTT2ckA2tkCzIHtCZdVFj9lkvh5vhXsjwwysVe8m6BZF?=
 =?us-ascii?Q?5j4qZj4dDV6jufpS5nBtW8I75n3gvMicv+yARPTi7IuwS/U7zgVGZDreJ57k?=
 =?us-ascii?Q?ckttIf8LZm6FQ/r8oj98EkVAIk9r7sS0FFT7pHi3uJaVFNEOkTfSNiKSDO1k?=
 =?us-ascii?Q?Ddn292nZFLFEz7SHUNAomloFbBM5q8pxmRnMXgxHn5gepXH3Wzgxd9IsiexJ?=
 =?us-ascii?Q?v2ertrqxXlDfvOCz9IRSfeHLOU47IgNsVNYIOEZ42hc6RuqczU67aIN1YFgJ?=
 =?us-ascii?Q?+lef1rt10nPJJV8+CycYyKE2lxfG7T2JAgrim7ABZR+gFGS1360r3Hv5xLRz?=
 =?us-ascii?Q?l1raXtYImFCgQfMHTx5H8THmH9PTRyrGG9icsypyjkU0OWN0TnhNmAjylDe/?=
 =?us-ascii?Q?J+Er8DQNi7xcAKfEqLXv7G53ENB25xRvHYWWogQmyGiCgo3Ot89RoB+pIZYT?=
 =?us-ascii?Q?CZlubUt71EXRuaS6nnxaQcA3o/m5TL2U8d2977jIEAQS1HjobYSVjAa5vZqq?=
 =?us-ascii?Q?8T5/kycbqIMWjij2cW6CFkY+FTfe9/Qi5coC1vj/LwNP61wGaGTpX94rfesC?=
 =?us-ascii?Q?c1I/Kst16+dZl2pzlvozYhKgS3G9FPBA9OcXJeV3yx8NeMbfLT5knWVLqxe2?=
 =?us-ascii?Q?y4YRNObK5U9ISKivqCEUVQQSO/jnhaWJlx1+zus7ThJ49KMz4Y6CMsaiX7+J?=
 =?us-ascii?Q?b3hn5wS+X+K3QyeRRKy8XpUsLyV5PCZoSkSTlEX8a8V58dA3UFVQQaCtbHFb?=
 =?us-ascii?Q?No+MKERzqekjzYxz+MsCcdLVqm1maMWN7SpdIOBCdFM5qQGBGKp+3aIpT1sP?=
 =?us-ascii?Q?wqLn8ztXan77Tqo+KXx3VpcZ7DvALE3QVExjWIgcYnkethB9dem5CIcS+uXf?=
 =?us-ascii?Q?HqFoTJLVH+TMgPmCPO1epT+14wHd5UK+QC3y76//bqly94l193mBM/tYi1yL?=
 =?us-ascii?Q?g4xUJ/QdDB7b5YjQhe7PlSMy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23addfb8-1e1d-4dc9-6058-08d8de6deb73
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 17:58:15.8029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSG3ZKy9RLVxOfqKOjG1mW02v+jADPTtUURQpUtGceHn+8hZCbujfzHFYkcv34klCo+ZTWGlDMTJmubPToSqdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4544
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Ptest Results: (Timeout 800) (qemux86-64)
           2012 2102
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    TOTAL: 424  424
    PASS:  369  369
    SKIP:  41   41
    XFAIL: 0    0
    FAIL:  14   14
    XPASS: 0    0
    ERROR: 0    0

Many ptest failures are due to
busybox logger not having the `-d` flag.
---
 .../rsyslog/{rsyslog_8.2012.0.bb =3D> rsyslog_8.2102.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2012.0.bb =3D> rsyslog_=
8.2102.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2012.0.bb b/meta-oe=
/recipes-extended/rsyslog/rsyslog_8.2102.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2012.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2102.0.bb
index 4fd7e85e5..15e31cec8 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2012.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2102.0.bb
@@ -30,8 +30,8 @@ SRC_URI_append_libc-musl =3D " \
     file://0001-Include-sys-time-h.patch \
 "
=20
-SRC_URI[md5sum] =3D "2a64947e3d157c0198609aabd37be42f"
-SRC_URI[sha256sum] =3D "d74cf571e6bcdf8a4c19974afd5e78a05356191390c2f80605=
a9004d1c587a0e"
+SRC_URI[md5sum] =3D "1f6150dfd2ef38db37c2165e98d2f2b1"
+SRC_URI[sha256sum] =3D "94ee0d0312c2edea737665594cbe4a9475e4e3b593e12b5b8a=
e3a743ac9c72a7"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
--=20
2.29.2

