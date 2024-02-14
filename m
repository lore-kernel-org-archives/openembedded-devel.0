Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A92EC48BEC
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 08:25:50 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.128])
 by mx.groups.io with SMTP id smtpd.web10.37243.1707899147186602873
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Feb 2024 00:25:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=iQaYvLVE;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.128, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNvNDTpAnoaLcRL4mgs3SUklt5l+5eFakKzsbp+dIc2ir+ak7IUufNiMngM5b8MzeaKwLu51PY19WGOdWyQaxnR0HafbO9S9Jp90pSR6wiBUiILLO6IW67FN1omBLQzyIsBG1AGqGbPTYhvZ49sWjtEL6Qtzun6hEals6s69Rka9T2M67/eKSFvrWmrm925SRAqY8yK7jximh47kG5WBF+sROyEYQEYScPWxgBP28HNb6EeOQ7NHukmUCg3lObYbcSUmVMBHUW4wInpMYSawhrICnj/cdYpZxIxYSFiiVcPWfFhyTnKtzcFlh2zMLE6wKsYLAZg/vPvEFOABM9Hwxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyxh30eVT4768rj+Y6Cl15DG4aK2rnKn6Ur1AXl5Bes=;
 b=O8B5kAV9PbUnr29C4d4kkYceANH7xsBZ52dZLsowi1FV8agTLFVv3R8Z1td01cCMd/k3enKtabT4dunELO8fbQtGd7vYm15zyEa4rw+SW/AvxDijbzaFyCG9gcZoESPRyu5LqaS7iRwSql0vo1PBCSQWyR0qMCtD59kzFgfWenQgrhyoID9Ms4vjaKBFfcn5Iclln2vKGRNzuc5kt1D5C5XHVDzGl8JIUUne+rLXNlEQxrfmTCyTFyCbw74QHuofE+O3yY/HI/x3HdzxP0mlAD2iiFnfobM9ojovIkp5llKh9myalcSUi8c3vk6nNH+zOXR/cWbWjbpVWu0UUWqMoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyxh30eVT4768rj+Y6Cl15DG4aK2rnKn6Ur1AXl5Bes=;
 b=iQaYvLVEP62MEJysa7X0Ug34PMzgi2bU+ZZPsHpqL68VguWMF/HrnfSkLfCvjb87GL6AwtrjjZ3P2lBgVE6Alb4TzFGwHtoTKpDfYHyuBwvSws6buzGGjnspz2UeO/0XLoj5fuqQlcIuuOvrLiCbGoipFaxw7ig0VNw7d2dmKgb4HZjwejNRelLTLBCiTFQiJdG7sX4UsCI1SuYxWIiqfDLly1rKGUwWvPBhZX1KaCTk5IMtSeSMBqnePYAisalDJPsQZIsLCqLIK6vi5z6G5oXW74pLx8Jj+Eb1SAiCMcZw5FlPKrPAsomGX9GZoh2VQQMKQQbEV90YIbRh3UwNIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DBAPR06MB6741.eurprd06.prod.outlook.com (2603:10a6:10:187::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Wed, 14 Feb
 2024 08:25:45 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::b5ae:8355:acaf:29e0]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::b5ae:8355:acaf:29e0%4]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 08:25:44 +0000
From: niko.mauno@vaisala.com
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 3/4] python3-pybind11: Fix LICENSE
Date: Wed, 14 Feb 2024 08:24:48 +0000
Message-ID: <20240214082449.3498259-3-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9f7c3fed-223d-4846-4fa4-08dc2d368a19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GvKSzGI9pv5uejS+t2WnPbAjDDmxORp+gCWQIFtllQ1wS6XI4MDpTVEHPHB9yftWI+h3bN2dMxtkXdNuKXKrrDwQYU5ytdS398Flo8AZRmV4/Z2EwDXlFe61y2IDKxP7GuNYGoCwRkxmCWqui1DVCfdrXWlxS5Q0v1weLZVHi7q4RDtPctxDqH7CM1VL3QOFW8V5vqnThlkgBawa70CEwQSrjhs6lisJjsv55LZJXJk5DQSnFwThymNxCBqIvQ4exKAr0hPdqmqiy/BpeEFk1CEU27IGqX9+WTU50OY0KVo3WKEDYPxBnfS4HBjtZ1YnQAHfjr4bciqYZstaZnJfY7/M+N16eWUNvxP3qvtZXx196OzZoKmEkdTUH0WO0AHZnjCpVMrjyL/kXS+IUfvMErOuuh7jpoUQ+S1bEqOg1yFzBbRhuEch1vGbuAo4Uc8/zibNHB2eaBe1gtiNSUM8uk91v8iFX4ISrQoKeSrFBX2NWTv/ZvOuMUW6k5cxUxBzO6ffZC25tm3bnOcgL2pVARi9n5UQZTS97qrlzFAgOQp3kvPpP9DmlzobQ8HUOROa/2HlCTV4WyhWtYTlFfSD+aXFskPlfd6tX9qERqOeMdA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(376002)(136003)(366004)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(9686003)(6512007)(6486002)(478600001)(41300700001)(2906002)(5660300002)(8936002)(4326008)(8676002)(4744005)(38350700005)(52116002)(6506007)(66476007)(66556008)(66946007)(316002)(6916009)(2616005)(83380400001)(107886003)(86362001)(1076003)(38100700002)(26005)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DEEVBqI3LFDu69sNBLrUeeG3PQKs2UGPi7StKYvC0+g197uiWPlIj9VI/1go?=
 =?us-ascii?Q?rUFDBVsncpivmy2XiLJRZkCREAfkp/KU+WKRrfirvg1VQaxyJZbZ/qTHjJhg?=
 =?us-ascii?Q?lss7g2oKOduFHTFEUXezI3vQLZDetlYlpRpaxh2hVIioAbkqo7TSMNFRJIID?=
 =?us-ascii?Q?LF2WSuxROebs42ZFBqmPl4CYF4+Xjkpcy821ng1LryYKI4Q/f3BO8oHWk5Iq?=
 =?us-ascii?Q?pv9LcSn3NEc3+oAEUfNbsPVfDFePTGRknr/CyKY9JRSPTKF20VrDjAGIO+hn?=
 =?us-ascii?Q?DQCWmuVn2TJWGSLwP4AZtZOXPoYrv8REWNFCG69i/Sv2V+S9kzeK648g54fe?=
 =?us-ascii?Q?sp7EhUtGM4LLbEmD8SVG4Z/5ls+/2IkHQrHX/52Vf1vcCKXS0EQAPLVtMr+t?=
 =?us-ascii?Q?jw6iP9fALyi6DmtJFb5Pl9OnsL6uFAxc7ROKOsE15tuH8PFDhTr0ND9/JuHT?=
 =?us-ascii?Q?bn327vMUxwEilTan1v1r0S8Mu2UNscMGu2+BgEiFZxlyCQtg7cygPH3bOPgf?=
 =?us-ascii?Q?N4y4vNjiL/wzgCib2ZBUtbVBmautpmcR9LmZQx3VBimzZFE+tHy6SQjn/X5W?=
 =?us-ascii?Q?cwucT/Ob1Sk6ngs5QnpAJHErFl1edWhuAg3VvrTJiAHkZzVscoUlYw0r++27?=
 =?us-ascii?Q?xwYu+6uQwzheMOK+ZQUSI12djBKUTZCfdrmwiJPqQ2WrMcZIiH/pfSxMXBc5?=
 =?us-ascii?Q?Bi7pmO3QIoR5wjqbkvjuPp3t8aYYPHIY7H1duCFqxvBXP1QRiURYoK+Vtfqx?=
 =?us-ascii?Q?883j5d7tQfUbucfkssvvWtHJmqwgd26zV/iKCUVIBc53Q1mhQXbmALYcJ3SN?=
 =?us-ascii?Q?m2UQHmxtD5AjPnxMm1GfN2GE13wcgAOCSUdPfJyA7ptOmF7DmLoO7IeduVfN?=
 =?us-ascii?Q?PtnvzWy5eywCCAvpKMHiJlecIXtvDmUR49FhXgfqpaoC+9x0sV2IZvQx3by/?=
 =?us-ascii?Q?bWOF01eYgOuCDBew03SPxJ4fTXpn4/vQQS+Zj3udQrSCJN6f2DFlSxz6mh+v?=
 =?us-ascii?Q?Gv3W1hKl9O7gTm6g0EVxk29lNZLTxO8nhoJoYCNQX5Vx5mrRpSTnTSIyLewR?=
 =?us-ascii?Q?ZUwLjbl+Kvf/DPomlKY/rhh4GbgQgN5fwk5scXy787FV4nx+U9zEZZ80CKML?=
 =?us-ascii?Q?vNUgS+oC4LZjm/dNlOrxC10IXg8rCuJQYRR//LebYdTh8+sNlXwKgvj9iA7l?=
 =?us-ascii?Q?R0ut0S2LHVhBTFVcD8XIX/jGrjHcv1cxD6q9ANhK85seB9xYAKQ3CHcdma2g?=
 =?us-ascii?Q?+5Sr4LOvbRX762FN2LLkYby1LiUKlo+L0f3ycyRpwOkkW2OMiBpNbNevflfH?=
 =?us-ascii?Q?69oBObx6wz/8gHVaGXm8ETlM/fK+jQjfwD6F8ZbtFwt7lx1LJOAbDTwGvIMI?=
 =?us-ascii?Q?ZXwnIBeDJIV3ptGVu/d//NIkDBt6uWMz/dho3iLfMkgIaAAZO15v089W18WN?=
 =?us-ascii?Q?2IXOuSRQpk0X864IJLTVV8feoBkX9TDbqKSRrMAKh6AHMU1wZ6ztJHwAUQ1p?=
 =?us-ascii?Q?ekSX0e46VGKyF5lzKFul03MUGuxRZUwHPAUIDm+BjLzFGW+buDRQULNFtWnl?=
 =?us-ascii?Q?xlYZBrRnCbDmzVHR7R1UdBTUFZU6MgA8mjmCXm6hHQ/xaWJFR2WLhg8G0lLy?=
 =?us-ascii?Q?AA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f7c3fed-223d-4846-4fa4-08dc2d368a19
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 08:25:44.9583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5568dW3IOP6/H0ZpYuEkxhKdLzCKh4fT/vI/ZLQihhGAw+NdpuhNvSxLcIj5umsXUz0nFZJwfBn+ZEuASYE6ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB6741
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Feb 2024 08:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108736

From: Niko Mauno <niko.mauno@vaisala.com>

The repositorys LICENSE file contains BSD-3-Clause license text, so
update the relevant recipe information field to match.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb=
 b/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
index 442837199..402f2c7ca 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Seamless operability between C++11 and Python"
 HOMEPAGE =3D "https://github.com/pybind/pybind11"
-LICENSE =3D "BSD-2-Clause"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D774f65abd8a7fe3124be2cdf766cd06=
f"
=20
 DEPENDS =3D "boost"
--=20
2.39.2


