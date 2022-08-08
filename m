Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B92C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 14:09:58 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.40])
 by mx.groups.io with SMTP id smtpd.web10.25996.1659967797782896174
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=hBAuH4sD;
 spf=pass (domain: kpit.com, ip: 40.107.239.40,
 mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FhINrcj6En23yTrbOEzU5yjTpOOAu5i8h1Xhe/LtRln42izuerwd28AqGY0kreSmMP8XQHaDg06/0tMajulv0kPEMOsjXKMC0Sxr/VAWmAq4vrxtRjuGJGcSaKrfi/DJacFWnLd0rXGF+Bj9Wkl2ipkutYGC5jE3BsaUQBaC5HG7E4DQgnIi50+lQoH++dFKNuX5WqolIwBodYplaBqcTBJWBB/qjSNY8clzSx54jKlyeGRVdgkfKvYGkSmjKt7+KInpute7xqX4GZRVw/Lvl1XPAjTyf2a1c2696TA/7OjDilikr5k5vH+XbxplUZ9ps0Lt3s/XS1X+W7d9A/SRHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vr7gHDYaWcCwp9pQdqePonRQzWrFbUwTvVmvdJj8Nog=;
 b=FAMf67svktEB1jG7iG2YqnXIE8Lp/VhpFjSWP2Y3swgofub2Pt3ylZbgpj1FswQyzS2prW69RP6ENfYFE9cGuNL1AR9Ub0hfaznoeXQnviX8Ah8JcNEsM2LssrjNALgYJMnOvER82WVYn+lHxjYp9uddCzrHueoKdi2JX2zXuqt+uYt1N7zm6JGAh4iVjlfFsAV3kERnx0DJlEnzT7QTr2NYnLv26DPvvhQmFfc3VVWn3JHXFJlPiVIKmu6ErIFve78Edz25HFemdRpzgYfiI2R3764RK4kBbgYfsfIyd3wdnYI24GhPkW2bfCMTYdzRKLsNfTxitldDS21UJ4dkWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vr7gHDYaWcCwp9pQdqePonRQzWrFbUwTvVmvdJj8Nog=;
 b=hBAuH4sDegLdWH7DCtWk5WU7qL2c3eA4mdetX2nSA1e5Wo5gKEBYvzzMmmSBPZosWTmOurknOkD9VLtCLT1Ms5FOJIWAc88OrJI5AUDSnPcQcq8fL8b1SjAE9nNoEWqCbsiq7ZkBJh0SR9hPqTzzbIiJW1B0U3ay6Ebf0ixxMcA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8d::14)
 by MA0PR01MB7612.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:29::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Mon, 8 Aug
 2022 14:09:52 +0000
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6986:8621:f6e5:e4ed]) by PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6986:8621:f6e5:e4ed%4]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 14:09:52 +0000
From: Ranjitsinh Rathod <ranjitsinhr@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Subject: [PATCH 0/5] Upgrade nodejs to 12.22.12 and c-ares to 1.18.1
Date: Mon,  8 Aug 2022 19:39:27 +0530
Message-Id: <20220808140933.25968-1-ranjitsinhr@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::8) To PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:8d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd555765-8e3f-4d13-ea14-08da7947a98a
X-MS-TrafficTypeDiagnostic: MA0PR01MB7612:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gbWnS25Wn/hWv1ew//nFEBKz63bhgaEI3wOZsxlEf1lqWvPJl9UbNG8rPUphLHxv0iGvxWy/evPJELRBa5gbneeuKghpcXR5jehZa0Bi7XsVJv3J1V2sRj3Eta4mWOoQgdrPNKKknTIxeZo50DNu3lSDMZtQcDYxxgqbUQMYZQ7jTR2V3Ic17KpJD1rF9JgPmDbArBg9g16KHBhdSc62rmo+lT4g3F1IYUUaj22Er9SjmoYIoSo9eZLT/+t9QnXiei6gQgmsKnEMteIwusQOK/59FfkkCXBVCcNX1pUEUmUM89m0DPfrzwXZZQJxUeKzTzOdJ7ehjULZLawgvKLQNxP8Vv/MEjhWA4xEnZmhKaWJen2QW4HDr909k7rGvC4HDKT3JLdd8leQaoR5qt5RvVtmmTPww5DKIIXvjsawODMDaM7fgM2HIvCiw5lRv/0kTFy4lFCLb3vO0m71HSgEmHWklQWRudvo3/ncibGYSa30D7teKp3TIES/Rvoeobnwl6O7bDL6IzGAg5pzx8HiIrgPgfxRdC9xtZcn2LmFWwLW59hPZH8efVUNslDEcaKc7hPCEBY/87wC+e6ZDRBG581dNR8poWfmyeGaZQy0P+3UDVwW1ye9y1RN2v0e2D2lz1op97HQx+NXKSrpffBosLEfF1df/MIcNdCscUPnFtxZ2Ubhayp6b34AwZcDwTRCFMzYFK+1NasCyxSf3dY4VBPkG+iZsyxFQQFdhycxdO+hHW732MT9Vp1yHRYO38UKIq6yRyZju8u7fPkzVyBWeK2M2/46ddXzUHnzCNyRN0w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(4326008)(8676002)(2906002)(66556008)(66476007)(66946007)(6486002)(478600001)(316002)(36756003)(6916009)(52116002)(38100700002)(38350700002)(41300700001)(6666004)(6512007)(6506007)(26005)(5660300002)(8936002)(66574015)(1076003)(186003)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XYXecql9WpU4VQcPCvPuilvamhGhLFnXRnqIliuBJzgcoazX/5/U70q36pLk?=
 =?us-ascii?Q?a7tsvwpbbWNGYhaJgzs8sNGs+a6uUQl1ioyuYNMgj4H6FP8jYTd9bQ0hsZIO?=
 =?us-ascii?Q?a8YU0AizD0s5XM3GapEISSwkM6w9h/OOtvGqUGQFJ0jtyVyePSJJ8AVPhXE4?=
 =?us-ascii?Q?FwU8Gxm7al//7TJfbb5+LhpfMvEHLHJP1DWNDJOwCTNFfuruOuLPlnRmr3ir?=
 =?us-ascii?Q?/4P/yNJI1P/d1fkTgXF45ZIzruIRSrkGNDJ3j/ORvMLN4s7SteF1V4e8P1+W?=
 =?us-ascii?Q?++mXTS7SR1K6pwSX/P+/GICrB2I1H9xXhHLIFAO92wei2tOk0fakcVxs/vvP?=
 =?us-ascii?Q?+OMBXqR15MKWqSmv7hqP3GZxMxXlYArXVCChsQdeNeB7j8mG9YTuPUBGpBG+?=
 =?us-ascii?Q?fV8FAWwguwD867VPOpHIYazT3HOYVGeR0YGPOGtdgckTy3ZSEUWN5YUu7IED?=
 =?us-ascii?Q?Su5u4jutcA/h1qLx/+HWw+v1o0qd58IGV4OkkRygFgOxvXdbJnv0Z1u7N/eo?=
 =?us-ascii?Q?EC6xC7s6igw8dH6aI39cpxdSnJ+e9W8yTl7eSaNOwWbWHZXgP14/XoMAs3f4?=
 =?us-ascii?Q?ZgH0niDCiHekHRh3f/yFwYSVqMCY75fOB+lf8kpotQTJ2dMKvK9uKOzgQnYG?=
 =?us-ascii?Q?3K06ZYGl0ccv7VjcBxjVjOB4cDkrdTb1ZksgjZ3YsUf/q0IV69jclCSIAfCe?=
 =?us-ascii?Q?S3VroSQdDW6ToXpb+GX3/VMAo4JLAHgMHC7ug5k/myLkmznTTzURfO89bE47?=
 =?us-ascii?Q?7oIBi44C0FcSfBIionM0U8e1y2NqlTLdleYz3HRmIQ6/QMkaLKV4P0g9ZGRi?=
 =?us-ascii?Q?hunbp5out+dTv8m7kfdnMI/raAsFeH8B3iWn38o+o9uPU3wAuKeCcKaB9B90?=
 =?us-ascii?Q?BywbVGXbKav4d/j/SGxPtpdRBBdgHczC6gk4kyQYt0Dlew869yhKL20yZ41I?=
 =?us-ascii?Q?Ifrrv2wvl4SVpZTsqxL0tn2DDIGopDQ8AnOKuekbe8yNxZVPsZdQlnKL9b2v?=
 =?us-ascii?Q?dBe2OaihtoOgFFhTEO8nd62DKSske819l0gDIZkhp4y9GzO9rzQT701ZKNvk?=
 =?us-ascii?Q?rwrM1tpa4LV1wsunV6DEBqkiXJPYiYhA5om1VtYIKArLTAve/pEAPC6lpBht?=
 =?us-ascii?Q?iSkfpJYU1YacCFtA+EkA1mbQ8Vw3dH6xPVn3aHYv5cUWl+9SVtD5IbDoW9Md?=
 =?us-ascii?Q?r6uR7PunduZImptpCHf2bozaNCjpuMvsLVXR+7wksBLCEeub885qN3NVRaYH?=
 =?us-ascii?Q?7sF4wbZic5RIkUMbOrnRkfen8/gZiTZ2w/sR0NXRntuXhKZEXAEgqLVYqzJn?=
 =?us-ascii?Q?4/osevVUDm0ZNSU8z9iCHK8mqFqg98COg8reNXdS44bnwOqHGJxIPeeUwrl7?=
 =?us-ascii?Q?FhCusjBrYIt2AXI4c5oVNFrDfk8/0tV33Ziv3GDZ9SVDK7vXSxfUWTiMNl0q?=
 =?us-ascii?Q?pdqSklznkeRBRu1m+y7DmOY/jnar/XS1mZb7/7UbLT2YHd8b/an8YYxOXNi3?=
 =?us-ascii?Q?+PT54qunxeub4WIwRKEBCPpeWpnC1AUrnerVkXblShTjKBS5FD5rzmMknG72?=
 =?us-ascii?Q?ox9P5pCezALF9fLT7SY42y435Qa9QUWaQm8mOYDOC6myDuEyj/mAqhGVdImn?=
 =?us-ascii?Q?GQ=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dd555765-8e3f-4d13-ea14-08da7947a98a
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 14:09:52.2469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FdqCHR7mlhy7n2VY64vZ7qYkAzx8ARysxVnGj/e+xxBnusDW7xHZ8OLnT9G1dbhTfk7xDo/bB8tfxvYzAk9n2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7612
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 14:09:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98153

From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>

This series upgrades nodejs to 12.22.12 which is the last release from
12.x branch
This nodejs has compile time dependencies with c-ares and so upgrade
c-ares to 1.18.1

Khem Raj (1):
  c-ares: Upgrade to 1.17.1 release

Ranjitsinh Rathod (1):
  nodejs: Upgrade to 12.22.12

Sinan Kaya (1):
  c-ares: remove custom patches

wangmy (2):
  c-ares: upgrade 1.17.1 -> 1.17.2
  c-ares: upgrade 1.17.2 -> 1.18.1

 .../nodejs/nodejs/CVE-2021-44532.patch        | 3090 -----------------
 .../{nodejs_12.22.2.bb =3D> nodejs_12.22.12.bb} |    5 +-
 ...ror-mv-libcares.pc.cmakein-to-libcar.patch |   27 -
 ...-fix-formatting-and-handling-of-root.patch |  115 -
 ...d_name-should-escape-more-characters.patch |   90 -
 .../c-ares/cmake-install-libcares.pc.patch    |   84 -
 .../{c-ares_1.16.1.bb =3D> c-ares_1.18.1.bb}    |   12 +-
 7 files changed, 4 insertions(+), 3419 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2021-44532.p=
atch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.22.2.bb =3D> nodejs_12.2=
2.12.bb} (97%)
 delete mode 100644 meta-oe/recipes-support/c-ares/c-ares/0001-fix-configur=
e-error-mv-libcares.pc.cmakein-to-libcar.patch
 delete mode 100644 meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-=
fix-formatting-and-handling-of-root.patch
 delete mode 100644 meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-=
should-escape-more-characters.patch
 delete mode 100644 meta-oe/recipes-support/c-ares/c-ares/cmake-install-lib=
cares.pc.patch
 rename meta-oe/recipes-support/c-ares/{c-ares_1.16.1.bb =3D> c-ares_1.18.1=
.bb} (53%)

--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

