Return-Path: <richard.leitner@skidata.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAE3ECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 12:42:05 +0000 (UTC)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (CHE01-GV0-obe.outbound.protection.outlook.com [40.107.23.135])
 by mx.groups.io with SMTP id smtpd.web09.69874.1661776921858770589
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 05:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=0Hii7dFr;
 spf=pass (domain: skidata.com, ip: 40.107.23.135,
 mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNll3VDtSJqF/GCtrSdAh3ZPYd+sFb99Jxf/LCDenQsZUKs8R0f9V5MOgrILLVzOtdor1yXzbxlaJycdYfgVxvU1Cw5TQKSAvEb/mv/RB3kGHr5uOBAod8s5cch/MCPDIabNKSIDeIiVaob5PkvWZnvUOsAJ+2Wux/PO+Mn7v1ZQFhak386vIlAwUwqulm/COktLtvk1FASnDyvL05+tQTXL/ZF3wdXUAt40yeOexPM/uEY6cFD40lFiyVJf81lEwcUcxD+AjJUhC1lqNNePql6f15/gS79t/Qcwy7dXAXnImj6J7ZvYpCcTEXlP62eFpa3C/6UyxESXvfzF5HHXKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7SNXhs/SddJxamPcmOt/N8/AP0yDe70QXMM4pSTHbw=;
 b=K2l7lqfLvNc0smByZnpdh+D19ILByH691K2OkDDveamYL72JHCUZiAKc9MCKYrnpgK40o1+H7I08AlmFSPpfGfUoOYuarBoHqA2QVrpr+zpu8PfHtKbYhvYWxTLsUlr6Vt4jJa4JaQh0T0NTeG4P6qQqyWTgByTejQfxseyHvNmszsIf9D2KYYhnxJRPNTEs3OPh47IEoedtcYsoEG861RfM5R+5TEue0zv9nhZBlv38wdd9fRSbjPyp9UJW5QLfszNRHrKyMWn75GWk4iMXmBClRzANEiI0reHau9uShohxCfWWIvZ/1j08n0z7pwDnIvKFdZa4Kjh3H6xAB8xQ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7SNXhs/SddJxamPcmOt/N8/AP0yDe70QXMM4pSTHbw=;
 b=0Hii7dFr4nFbUDroOG8rzLMIJZQaWoaFAqzt91KFGvvPXt2nIptb2UY+r+G9a4qVTMaTR9zC4riTqnWoLHNJWbUxzP4DJF3aYfxj1R7xqyOV20zjAPQMPq3PAqwzUBL0q9qp4ITVYchkvyW9Ni1dMV17wNdu6wSFV4YLdkNnvWoyYLHRXueLeblwk+wbiWgWzSvxTPtcM8kGGWK7yDkd1sAnQXmZiYxQ2NmLm+RVPaOk3ICTUyKY+Dj/jtehq+RtArdFr7YCRBtdCBaaXoumzr+14K01sjHBn6X/pClK4cbHXaTxYMZGj1iHTvZ/K9ib6aBruAhH82Y1rX8AglcO+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
Received: from GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:30::7) by
 ZRAP278MB0610.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:3d::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Mon, 29 Aug 2022 12:41:58 +0000
Received: from GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
 ([fe80::296c:8ac0:a30c:a0d]) by GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
 ([fe80::296c:8ac0:a30c:a0d%3]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 12:41:58 +0000
Date: Mon, 29 Aug 2022 14:41:56 +0200
From: Richard Leitner <richard.leitner@skidata.com>
To: pawan.badganchi@kpit.com
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-java[dunfell][PATCH] jsch: Whitelist CVE-2016-5725
Message-ID: <Ywy0FHkLdZ8Wb0e+@skidata.com>
References: <20220421134506.7421-1-pawan.badganchi@kpit.com>
 <18991.1661763381629374914@lists.openembedded.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18991.1661763381629374914@lists.openembedded.org>
X-ClientProxiedBy: FR0P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::16) To GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:30::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: badf1fc9-1286-49a4-812f-08da89bbdccd
X-MS-TrafficTypeDiagnostic: ZRAP278MB0610:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZN/fVLAVaB7ku7ymh4p9TzzjrcSWrXbJ5QFbfQlNmoDxup/MyJPni4VEmY+WoB6CjnbPGLubq9LKhDz7nAGLFLAJ+U26ztZliilkXOwLtb+PZncZZyVi6L7+KXzCRH7x5Z0Q3WAbOheqN/ICi/rJ325JC2w4gLpUwwEFJ5lVkCJIyCmt1mO2DBZ4Rk6vRgSeA1qeRj3ehL18fX4w8cGczj5ICku3of2LSbO99sU8S+HIfe58W8F9+cvnXStz/WLTH1TkmoVEuuh+WV5dPY4rFODkOmgf2uyhR5iHfGA9Sfh7f3GQCvcdd7Numiv19zRznY20JppLNrfrAXZfWjZ8WwTUrpw0yWyZLyQDFLaopaVVo2/PWw71v3invhFHLPJIlEs9A+pZyov2w4N0I4tV/kJhV3YK4L7YEPvKgR5bCXA0h0YdKZWgZ7aopq+KMGrclFeH261mY5SG9JvZuvX2SpiQUkTXL53sc5QXK9eRqlYFABP0w7nT7UBuPVpbUCUtjQjHPeSuJQmOUb/gDTtOLi/8AJMU6EEAM/YUp0I8qXsFpMWzYRxB6mBl43qo2XkM4QqtTycAQlazX+hQvAH05LHQ8oLOgtVntarvRJdm0C7xLRpB3y8+ekd6mgrbFrcUqclDWtVIrjAXzb78KGvQ89hrYNtxm5ZKGRWp5uvYwE9s4WDTmdh9DWxM/MnZVsUH5yyM6ZKv2/AhjCD4nvZjhQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(2906002)(6512007)(26005)(44832011)(2616005)(6506007)(38100700002)(558084003)(186003)(8676002)(4326008)(6916009)(66476007)(66556008)(66946007)(6486002)(41300700001)(5660300002)(86362001)(8936002)(316002)(36756003)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ezscQwbxoZf7zWvKkaiNxUY7dCVDv+OpEj8kJ8v1LP7KbBLQpwy9neGF4ZtQ?=
 =?us-ascii?Q?KL79xt8tr91Pxj95auj6StfH80en8QhphEuzT/6eEbNNAcPnAPEAavhwPtio?=
 =?us-ascii?Q?SRI9vAi/i9UE0WriLILfB1nJHKTVLH76H0xy42dAX8S4chKgmityh0lNtPh1?=
 =?us-ascii?Q?GgOFMx48Xwv9u5pz0rZ9T07a6myjh/3jc3h/VlbNYTSFolaJemBwsV1rcA5r?=
 =?us-ascii?Q?LpexapHU5w3a6gsu4Ue6ElEHcR9zohzkVXhZ+TM3G/AaYO4SOXrJG+22FAMR?=
 =?us-ascii?Q?93RQW3DvqC8utsYsu6DIpk1PwXJgi0bplXPOtJdvtRQ+c76lzZqVoC/Vfegi?=
 =?us-ascii?Q?e7fZkvTEMDB40g7wXYQSKL7+BuQ3EX9FmM/RGyI4iIiW+n3VUkJqEjCqBIP/?=
 =?us-ascii?Q?vyWiZ3Sk+hdagqDU9OcMyLxobe5xSxRYtZFsz6Ulqrrbn8E77Ml4GbnDA0xL?=
 =?us-ascii?Q?H9MQuORBX9xpHnvgmAFB4CPNNy+RryTtxF5r/yhipLnht29JbBKyquWvSARP?=
 =?us-ascii?Q?Y5KHZhgNCSaVjrTpd/xRQebNeulS9t5CNwyXXAevB+epWI5t44ydmc+5DL1p?=
 =?us-ascii?Q?H8R7UjSQfyiS3a5s3nPtbdMiozxLJF4124PrB62tnDUl5PFgZKzshiNn1Gvr?=
 =?us-ascii?Q?iwfpjdHCqDylx6DL9f+O0i60kjzdgP1upe84v/jyoXw0C95txpMqoWvErptw?=
 =?us-ascii?Q?KPdmkyHk4Xx9Wnerz+ZKrvnSupMFJMvaFrQaB4gw5erV1FVmfxEfxnRYfl/i?=
 =?us-ascii?Q?AEZE/AgbAYRNW0irNvUjMqaaoMPBfCJWFtSc5kj0RBpBRATDjMz0fl/e+sWg?=
 =?us-ascii?Q?O9vfRsdNxCedoYaHyXab21w+ydWPR0Gk0Y25qMTxUgOrZi9YndJ5/9erw3Xq?=
 =?us-ascii?Q?3yRABtIQq6aOXps2z76i9FWQkFjx9/dk3PIpKFYbAZcs6kYUOuGyl2a84ULB?=
 =?us-ascii?Q?yip1yJ5JeSgq9hf6oc3EpQ0N4sJEM7n0VKIG1cq5kk7ijUCW4Tj7p5zXQJxF?=
 =?us-ascii?Q?8+hhB1a2e/YGMrHwKiQB9pH8C/fbVO8mb3Af4s8JglsOiTrslUwBJ0wm+A1k?=
 =?us-ascii?Q?hBUCbF58g1vikJhw1c8Y/6i/MUE6TshJzBzdrVJux9dOgnLGpwa9sU/+WMv2?=
 =?us-ascii?Q?57nWKM6yrJYGOotuSPCnlLy8dA2j0K/OBaYg6P9p1zAbrSVH+OIPx2S21LyX?=
 =?us-ascii?Q?K/QH36ZvctZcrZmDO4eEp7dfIpwRfpjQo0KZAg+WhnDpIBdLJpszv/Hv79c8?=
 =?us-ascii?Q?/lvKSDNWgJxHhChV4MdyFGx2wojCx1uPPkk7A6xLWGHtcs+SNbtkTsVHuhxw?=
 =?us-ascii?Q?7mt/muK6jk6NGIw/Ah+gKnpzbskWKWwlfbcEkwAaNFoKBibiK23TQJJ+dwMW?=
 =?us-ascii?Q?l0uVxA8XB6dFRS7JG25AQ+hWFmRfyIDNA0rem7YIyighHb9AtUL181N6tquo?=
 =?us-ascii?Q?0k0SiwqRw4lIo2+cNOwS7AUWNP9bZg2I4KZsObylzjLFHQzkgQsEscM0BkkD?=
 =?us-ascii?Q?WZZFlxjEZkYhYH8o5Dtymm9kYHJwPV+2Dww0OCZ99Cv+jnswCd5nGq3tZjRG?=
 =?us-ascii?Q?dBYE54P9fkaqTJi5zC7UEWzpBVQJNar34FZS+rVUrb8k1/gef43v18Hh4G56?=
 =?us-ascii?Q?Jw=3D=3D?=
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 badf1fc9-1286-49a4-812f-08da89bbdccd
X-MS-Exchange-CrossTenant-AuthSource: GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 12:41:58.4097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FXr0rXFnfHols1kx0jZ12qeG66W8fFZ1BFkmrNt/Vo6zeKZekUlgkcUw8up2k18bIsZQGU+ppB/yTRU3GujTip2ZhULyLFSWLiGbsAjPLaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0610
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 12:42:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98523

Hi Pawan,

On Mon, Aug 29, 2022 at 01:56:21AM -0700, Pawan via lists.openembedded.org wrote:
> Hello,
> Could you please add this patch in the dunfell branch as well.

Please send a valid patch or open a GitHub or GitLab PR/MR.

Thanks and regards;rl

