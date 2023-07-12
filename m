Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850C2EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 13:04:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6793.1689167089079968759
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jul 2023 06:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MBtoyeKL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6557aa1aca=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36CBEt2h016050
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 06:04:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=P3krMo7DJJIKFx7kKc
	PWnbupMfp3COOKXzvFJtH2vMg=; b=MBtoyeKLRzhUOu7x86P3sn8e6B2878ict8
	pNxy07RRbS4N9W5pLoXEQ9nad6TbEoK1pabC6CHVFPGFtCfvZTbmyCEGlfxG+m5u
	my1L/zrg1Mzz6b7ICq4/6fPVswF3SCTuoCkkyzZlUl9b0PVI7Ne9rjJ10MgCyxR+
	k+hQZ2HbPXG1fTzw64/u+e0J7pMzN+GGpufs+458sBn3UYSOfEJ9oSia4T030+QK
	9AN2pQQ9+bcHtS5BqUuiVWrXef+UvOwMMaqon+zTJm4u1Kd68DNM1vAbZrUfLzaQ
	3RjYuy6H1TqszELl2GvAyhE8a3L73PLVbUyFhhOuCWMC0fOP+4oA==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rq32ykfpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 06:04:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Puqjl0K3w3rYzHjhT3JCXHzoToRTx2AZZs6AD7O+T7bzpB/yVxyQA9G2oYj8qFaVTZd/mZ7DX5T8RoMedlSeGTqHgWkJng/RlHbC+EbJ56EgXyNeLKjd/FfuWJiJyxVK1EGEsJ/8WAy8jOlYkE58nxU610+bhavTc+h7ZZUPPhaslD9aprAuzPJKJObXMM0+sKPHAsKxbJwIRz+MkCvh9t/J2bbxf2Psa5IIX25EIZstf8e+4ePBXIe/A+/IidmmxPfVg8BY3RRaiahp1EpoKpuYYw4zuzeCcAbnA5dOzPloTwaN0RqQ8HyamCtM4EQqDZ46UIlLwVryKqR/ABAvDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3krMo7DJJIKFx7kKcPWnbupMfp3COOKXzvFJtH2vMg=;
 b=VirAoXjN7FvmIkVHHsaGe68mt85ytosu4vooujh6CEHecKigGFergqQcN9RkWm+Lcsg/Zkoel5lW1C5DYtni8Re/1x0HX9EGAAP1qHtpGi1jMGMiTwvsRqCUUDtUfWvCLUrZlYwHAJiztZO3QR7rRgusfBzLmzLnOwC7D45nKFoHbGXDi76G94A7XzecmrhcaKEJR1vFjie7TJgCa03DEw4UfJ6zyKHofl9XPDkpdOYrIUqfflPqsOsd38S3po6c6vAwTwgsX+l7GkKxdjfkz3e1RricBrHmEaqssM/K60UPzzvWnLS30DlXUW8mbBME1be2UMgJy1Sh2cMQc4DFug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DS0PR11MB6351.namprd11.prod.outlook.com (2603:10b6:8:cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Wed, 12 Jul
 2023 13:04:44 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::60cd:a296:6dfd:e0c9]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::60cd:a296:6dfd:e0c9%7]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 13:04:44 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] samba: upgrade 4.18.3 -> 4.18.4
Date: Wed, 12 Jul 2023 21:04:32 +0800
Message-Id: <20230712130432.2901218-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYBP286CA0016.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::28) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|DS0PR11MB6351:EE_
X-MS-Office365-Filtering-Correlation-Id: b5497d1f-d2ec-4847-78f1-08db82d88fcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7njpokXdsGgAPTyLGQAbbeUfOn20bUpZNKsZCZe5dBS9OJqaa0ioHX2toh5C0erUx0mWLM6h+SpV23TNXWy1WAAlJyH8WF5ZUZOyHLU6SiL8nj6yfksbYdidOzou2ktfTbSlBGE42eRH9H3ObRgI/Hu/6UOIkU3asCMVe5xZOgqB8lSxk2Jnhwk5ALZf/mfWD8Irra33vNWF2byVNkq4kF4gEAIUixixSTXkjitN18OcaSXNojJHrso+vHHazukN6TwulL10zbYkuIwnMD2ttr86rhbyiuU8JmlQjMgfVrsk0KjyDFhyGFcIK/AluPTqWsyYJb/A93VT9Cyc5Y0VRXPhzBxzMu+cPrSXWJ1yYBd4d+zmTlYFSvSSI4+aSy0TBe0hPmQ/+nVs7rXK75mR8AOWzdAsZxwRXogLPlYgxPz4N6ADvJQvpiReyiWKayvX6GKO4/ci9avXWUP568r9M5DnbgSSaiDj99w/30lK+3nlMyKorOhlXLTk1bv4cOrjT+9dd2dYV/PK5MbCtbMVCOtdHnYz7aJeevvkStnZcdmA0GXPoF6ZkRQq2sICOGgXAND3CT7k8CTgpcEupSUbptUS52EfA1cGInlm/JR1fok=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39850400004)(366004)(451199021)(8676002)(8936002)(41300700001)(6486002)(6666004)(5660300002)(2906002)(316002)(44832011)(6916009)(66556008)(66476007)(66946007)(478600001)(6512007)(966005)(52116002)(36756003)(186003)(86362001)(38100700002)(38350700002)(83380400001)(6506007)(1076003)(2616005)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UU/jifDAMRF2Oo/SD4SYbFkqqS+4jKZDKfOCe2dOGdu0vppQDx6UQuhUJ26R?=
 =?us-ascii?Q?pE+3HXVaK5Ork1NN8zRCnzwExpyRZLwcIkInL5h+rWq27VAcZvTSkxOextkv?=
 =?us-ascii?Q?2L2dBnRUMKR5OQ6OXwLK56nrBspWCyDkWsPESm2WQx5ZCNXXp+yK+qqshQtJ?=
 =?us-ascii?Q?2qlX9GUwHlm6U7pQNqvL02BUXDTDUw56VJsRWEhS8YQTkprcKTyupDvglLlW?=
 =?us-ascii?Q?lxkyo4n92Hl/j1rayCMR7nxYveq0Em9DKIhyguRE8gEiHZxKb7PlOus1UYTD?=
 =?us-ascii?Q?s7LjOjbXXFvSDG8E5g1lYzCOxhbUXdNi8bIGgNmIk2NXUcoI/IOURa5xpk6X?=
 =?us-ascii?Q?fVmoiYxJF6lWr+ly8qOR3trb9hAK75QyUSX3iRxmkE9PIXBSrI4ZyKyCwWoU?=
 =?us-ascii?Q?+htwUWAlxkEVbMsXL0l3PavkZYHNm/vn9eQHq9PyhXDatb+PDR/EBVzzfalt?=
 =?us-ascii?Q?7s+YLilTvw/Gbx9MitZIwfkTTW6CX47tQ4d+AIA//a2LT5hScbXuoK1OQPu3?=
 =?us-ascii?Q?OJ4mHnPMPK9rGTKeTWqWkSjlVZ4NkVoQTCJ71FLQG/kN/OJvCbSo470i/arf?=
 =?us-ascii?Q?Hi7m0JsJRA2YnDA7eVv1Y4Uue/xACuB0SCouOqRZCPMs0IRT5hn8PHTNqpER?=
 =?us-ascii?Q?IBMr2858fmbmAoKRx814ovH19u0PhbvrEsnivxvcV5O9V8zgdeWdipFZw/QY?=
 =?us-ascii?Q?OQK2cskiIVNpFUzNuE62xs1smJtxI85s6Hq2BjiwN9omTJEIWa2XmyrdyVjE?=
 =?us-ascii?Q?uKdaYY2G5PPKxcAgGoTGLjjsC8U+T+4oZpLjkznE9iS0L3bJUGIcq5eWOQhX?=
 =?us-ascii?Q?xRdWkI1KE/BHDhLC1x0Afe+fYoCabEGbXoYnKVhY1Iagf8U1wPOqFw/v5xH4?=
 =?us-ascii?Q?baFJVXlbqVLlXpsbQu1o7t4qHujuntmx2RvPi0zZFvArtk77h1m0GSZ/c+o1?=
 =?us-ascii?Q?0M6nAvXckR37QdFhkqR65jy865jd71H3NSl/6fOY6xH4e+tm6ACAxvzk1J2L?=
 =?us-ascii?Q?aUFMvHcWbA5eEZ2rb8kTgnF2QgzGttML0IUw5k/xRpocRZMybY3Uzozok+pa?=
 =?us-ascii?Q?uTxj9gHLn7ZkWZJkJT3Pcklp9VQcIIHcjCvvkQ9nhivq0e1dCTh+iKv4N2KB?=
 =?us-ascii?Q?GY9leGwsROGGL4aLDKOfk+LSVRJceSpvYzitVMeDG1RFk9Ru/UW7/VPq1HV3?=
 =?us-ascii?Q?ocALF6brTEuwJPK7or2SKwm3XfZupRQbgAOgU3lmJOqYGFtJi4FQXVHiHhQS?=
 =?us-ascii?Q?LbJGW5JQa6Denutk0G+K7oeZqJG5FSNfjxCDpxDtKB8Vk7vCdlT9kk+jBy3R?=
 =?us-ascii?Q?PUToXa0k2JiBG9pAdAMb8PBdw4G8sgJgXUqp6EqWJjjODiGuHNi5W7UIJ6CL?=
 =?us-ascii?Q?4CGrkiDeTdFxlIMf05aC+P+F4Cn3BrLhNBs7nm4FFVC+SXdZIME8MHM9s4Qj?=
 =?us-ascii?Q?AgU5aiJyGU74nV06bkcX/DWbm174EWdk8OcO0ND4b5Jft2XS1QCtYhMa7gBn?=
 =?us-ascii?Q?kSI2K9BuY1tv2I3TXn6ZeN48XIHvLrC8UyOvesclv0NQodOzwrDOxU4caixR?=
 =?us-ascii?Q?LN3ak6KLlgghkxFgYH5LtAohLrt8rfXsUgxqbEov?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5497d1f-d2ec-4847-78f1-08db82d88fcf
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 13:04:44.2748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZzUOE6YwRbFjZJMGQleuVvlOtvwMo1/DNstTcp5pPGi1tVb7HZjNDZWb79JgWQRQG3f3mj9SdOAHFntvk1lA/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6351
X-Proofpoint-GUID: Om7RXiXyr3aPYb8csjvI9ARTZ4_G_FWN
X-Proofpoint-ORIG-GUID: Om7RXiXyr3aPYb8csjvI9ARTZ4_G_FWN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_08,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 impostorscore=0 mlxlogscore=789 priorityscore=1501 mlxscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2307120117
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 13:04:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103839

Release Notes:
https://www.samba.org/samba/history/samba-4.18.4.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.18.3.bb => samba_4.18.4.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.18.3.bb => samba_4.18.4.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.18.3.bb b/meta-networking/recipes-connectivity/samba/samba_4.18.4.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.18.3.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.18.4.bb
index ee3665ca1..66089edad 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.18.3.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.18.4.bb
@@ -32,7 +32,7 @@ SRC_URI:append:libc-musl = " \
            file://cmocka-uintptr_t.patch \
            "
 
-SRC_URI[sha256sum] = "c67e1453165a3918ffffad600236ca3966b47bde4798e89ae600ae3903ccc32c"
+SRC_URI[sha256sum] = "6ba7b3503cc59c9ff4f6fcb1b510c2c855fff93e0b366ab891a32a4732e88e53"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.18(\.\d+)+).tar.gz"
 
-- 
2.25.1


