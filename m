Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FBEC48BC4
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 08:25:50 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.133])
 by mx.groups.io with SMTP id smtpd.web11.37599.1707899140497621383
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Feb 2024 00:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=gNXM0+d7;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.133, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0UAN5fFER/aFHon+E5jkE4hwf9E9yJJnPSwwxlGEG9u5w0lvsyPqUk2Zc+UK7EjF7Iw1is3Y4jRMXzCoVryFk3/+8CcpayYnWKyJW7Lf1UhMLZlC6eqFN72X1MexQaVnspZ/EQPVbx2YesYwt2m18KgHxbPC8NxMwKBpjR7xNNM17p8w5Pllp2kj2DMsKqXCXBOc+1l+YOhCntBksKvemiPzQFaKl/L/QnY0zZVz675fH3nmThb0LlRSVeMQUbtuEr5ShVsE5fRx6onF73JK5ON+bw415L+vIHUZ8py3M2PAse4D7MBL8qa2vQCZ4G3+TUyndS1PtF4hsuzBUd/nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGLdwn8YNNnejdQaZ0+yxv6WgPZLc27JifgNkmb7A0M=;
 b=FbmxGAItnFrBtEyCxdmXqSTNK/i4ZvzyqmrBYDMY4DGNgATuRN3jjMlyQz1u1yPGFivAHIgQpXXXCRY0BMuYuuA7CpAUerPTePkeNDScEcpvsjwl7AKCJuL75UfQcryGpL4VQ/l9CBpAsRwAUAYx9nSIalrE/6FD1IHCnSehnRSexfWC2CDvBNpNGnptg+kKShGWqJmMoRgc40CSmXtfKnij0FzJdEUIdIuCEQKJ90AB8qPHg9w4OmSYke+6PP+UTqwx9tqejTQlyDyaenZayPvZAlBEEysjFpuD1Va+hUfKFoCG4oJVdltZGJSSazYPGXrX8nD6WFnQQtMrEbmrGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGLdwn8YNNnejdQaZ0+yxv6WgPZLc27JifgNkmb7A0M=;
 b=gNXM0+d7hnTLmZikqpg0pON1NUM5Fpmca5soMh5NyGtbSE+IaL1PE60ArYkhMBuJE6I6xfpVl6q6W0WnH/J9Q2jxYNNERo3NOy+PkS36JJ7xm/oqnXrBC3HswrSDGZ6nRgErhmdmBtqwfgabaWBDSzvlVOP5avwrfK5sN5PhOHxA1mYmCQOYZ5gvg6kNqD2gWw4FL+iCzrMaysxGhO/j3wkQM+8Bkik7xMn6lG3N8nB2RMYUvrzXe2gj6P28QH6IfJcF/yf4SFyUzBpHxoY9LoBt5GFC7PnR7hARdBbFZcSgbIQjnjLH2dEM11Nmjb4xNzrDchZCg+0owk71jqaGxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DBAPR06MB6741.eurprd06.prod.outlook.com (2603:10a6:10:187::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Wed, 14 Feb
 2024 08:25:36 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::b5ae:8355:acaf:29e0]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::b5ae:8355:acaf:29e0%4]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 08:25:35 +0000
From: niko.mauno@vaisala.com
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 2/4] python3-pybind11: Prune redundant inherit
Date: Wed, 14 Feb 2024 08:24:47 +0000
Message-ID: <20240214082449.3498259-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240214082449.3498259-1-niko.mauno@vaisala.com>
References: <20240214082449.3498259-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0024.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::12) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DBAPR06MB6741:EE_
X-MS-Office365-Filtering-Correlation-Id: 46aaaa1f-c9df-4168-3d29-08dc2d3684a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2wwRE8f4PPmBcViqeQFZGKx4Y/Bh3WUR9n1PbBz8gxFvT/CJzUoExEqyPKd5qIHBZIlE0az+Q98W1W7lZ0wRuAUbLT9DYvq+tyEvneiXqf4kX4zmMJFH/xTEKMgJbA6SA9dX/xueHoL1F8LsRuX4Ev6obHfnslfVC0kzJyLe8FH8VC2vHrTw74nMZq3pPpI/+8Dz3rzH7LmQsCFXgRavD1/r9PZ8Lzu5hJXUYQFFI//ERTObROMX0hp+93hsmllbiXNBMEtI+8dYW8oQ62xYJGuJuy7Ue1p695Vh57RB1Wznufmx2GcpXqMSFgwv5epRxk95k2s72jRDZz/De3OrHHQHfKHSRjbqQIDZKw7maSPAGrNoRLmuHzyEmghhyY02J/22ECIXspW9WOak1d4iHfJre6utdH1jprMfLcDbqD6Itxj2UWrPSQpCMkEUBHn0eNYG0YqoEi0zy0huMbgvlXnA8fQXhHTTfCs8P7KAL5s6M/ag9Ah0I8F8w4cjzdXWyqVQDyuJ/NR+lnZfzxHhXiJSdQVNB0v4nf+O7GqAprdZaoQG+d7Hu+lj8WH35twmI96HFQL78hiFslgfQA9MXsVGAooexteAt8cveEqDISuiPQKSJLbMTzvCZnydDMJY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(376002)(136003)(366004)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(9686003)(6512007)(6666004)(6486002)(478600001)(41300700001)(2906002)(5660300002)(8936002)(4326008)(8676002)(4744005)(38350700005)(52116002)(6506007)(66476007)(66556008)(66946007)(316002)(6916009)(2616005)(83380400001)(107886003)(86362001)(1076003)(38100700002)(26005)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6nyKT9e+cXs9li8E8vGxxZAdsSTb0LM9RNfJiWgik2tai90Ph8x/gLKQPaYv?=
 =?us-ascii?Q?tdjsGwhQc8ntOWuUOW3/JWYYcZgN9FqVszsKOmzGh0fQBluFVdK92fF5026y?=
 =?us-ascii?Q?dBbMDB55MX+xWYxMaNFY4wz6idAn85yGtnnkDfWHgOlZsW38efSNuw2WjZQx?=
 =?us-ascii?Q?SdRhiM4oLG0RuBXbuPDYYmY4UREf4IeTNCFUYfIdvMtz3P8nJQ9qkZSnHddn?=
 =?us-ascii?Q?M+Enao4bKgNCQ2U5hg0FofWoutef1X4kY+i8k6RpcRwtL1DMhpsOfQWxpA18?=
 =?us-ascii?Q?VU4BP1P0kDVhZm7r5f+rFYhXuXgixl7QKt4/TRg29rxPe3eB6it7fSxp7Dms?=
 =?us-ascii?Q?CmYpcRXltVpi3xAHracMCcHAamtH1Boi6//PEe71MnwlBu4hYUqoN+2O050A?=
 =?us-ascii?Q?IPwrpNq2fIg2ghTJ9GyOUIer9JbaNhA02YEvvARmdQ9Fq0mwhvR/v0w0a5Gm?=
 =?us-ascii?Q?5nqSiW9+hZyoiGGJXuTYKN8nDQgrfqjXVC7Gb+M7/fR3xIKMpXxvmGaOKRsU?=
 =?us-ascii?Q?juAmE3y2iiYSWmipRP+UaE5q/PdinTRz3QVy5mWo6Fopk8m5NY33M0+6Bgve?=
 =?us-ascii?Q?lFWcPrMfiKJBHyALZdmoN0EbHaEs7rAcwxlD3eFkVV6qk2sOrVstVHkQc1f1?=
 =?us-ascii?Q?v4q1wUooL68UiAfqN0huKnbgmMj8AreAcJcAB1xwKGQxhxU6ROFI+hABsDJO?=
 =?us-ascii?Q?VA55UgVkYtUOolp0kSxctB6mfPWGMkWnusjr2FGxZ5GsaHthDEn2kLKd8TFa?=
 =?us-ascii?Q?uO0kl28sVypAv4zVGW/vQ/ZqrN9YoXc4eaJ7Ryol8HQwd9PExdHVkM7Yli7Z?=
 =?us-ascii?Q?s57Z9thBbb2QUzOd+PXWYkmN6GfAGdsLnHY8wI9Rn+xqPCa6f7zieFyM/7Sk?=
 =?us-ascii?Q?KJjaYaf8dUBhCf200+1MIs1VCowla+f/f3gMm42IYNqCMOwQQrOKlz2ytp2F?=
 =?us-ascii?Q?aMbxZSHGsr8Brnkxi7FSZvrIZqBKePRXBxVOtpRfr7FWNf96eNm3Pwhq5UF8?=
 =?us-ascii?Q?JkzDbpb8wVv8oEPDp0UOGddr/2hIZvb3SwH/m8tOXMmttzvzaATR3K9epRyF?=
 =?us-ascii?Q?RO9uTJ9Zc+iUywBFKrGNhCq51ttQNDW/Q2CfxHHdSGm/vBKzRgBYiwSGEUii?=
 =?us-ascii?Q?5xf0DWMvYuiVN0j/sbKBZc/+6Lv7Yxtzkrm/J+W24oNUBD4YanvRji0ORxDt?=
 =?us-ascii?Q?p6Lfv/8VLdc7eS9nGTbMaSUd16PSCDQuzlcazZGmrBu4klOOlkN/HaVECOYN?=
 =?us-ascii?Q?tNrqlKDo6vouv4xpW1ZM3HoKPaEGhi5G85WgT8Fhjf/81kJzEvdr6AnmUXSK?=
 =?us-ascii?Q?RBn9UUzEBesefXun9U8e+UTQGmClVWlsU+6iXhr/6mKt3nBkzMJpa2rB+AdE?=
 =?us-ascii?Q?mvWTwcBbMtNZqbo2jurfpoIMNUJj0k+8dqsU1fuTN2GWi7ZrTjgGLYspdW0e?=
 =?us-ascii?Q?GumqPGjyMNOecDePEFX9J1BVKCilBNIf22Ib2sQ6L20UIvRsR9zSovdsVBY4?=
 =?us-ascii?Q?ntoGALctNE23ybj0zJ5dQ8mCLOzD1weCLFXfB819VYfZbkbvE3oDl/lWpHTp?=
 =?us-ascii?Q?kYLLBYhy0+ybX5gwKPwsIFM1XJyCoZvILdtq64PUrOMAlnwvG4NK8PK1QMal?=
 =?us-ascii?Q?2Q=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46aaaa1f-c9df-4168-3d29-08dc2d3684a1
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 08:25:35.7920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cI7hbK1HK17z+JC3ZiAAGDAPOfUFYFuw8hg0305Nt4hYRI6ykwy5wa4dUIZg3xeSrOHzCaJ5UmzwqL/4K2GPzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB6741
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Feb 2024 08:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108735

From: Niko Mauno <niko.mauno@vaisala.com>

Inheriting setuptools3 implies the inherit of python3native, so drop
the latter inherit as redundant.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb=
 b/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
index e919e7dcc..442837199 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
@@ -13,7 +13,7 @@ S =3D "${WORKDIR}/git"
=20
 EXTRA_OECMAKE =3D  "-DPYBIND11_TEST=3DOFF"
=20
-inherit cmake setuptools3 python3native
+inherit cmake setuptools3
=20
 PIP_INSTALL_DIST_PATH =3D "${S}/dist"
 PIP_INSTALL_PACKAGE =3D "pybind11"
--=20
2.39.2


