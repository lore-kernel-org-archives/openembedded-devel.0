Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023A0C7EE23
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 12:51:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.21442.1684846297606530925
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 May 2023 05:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=45076e778b=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34N5KFpX012620
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 05:51:37 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpwqhahf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 05:51:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLqaBSNJHuMzdthP84FtCPwy1YvGK/l2V1DQZQVB/FOwqkF9mpTMyCGbBTkHITS6JC0Pv5VsEwYiIVadzaOIFVCJ5APIfmg/h1zKPr/2jqc+PRc4yXxf/MBOlQR2w9v27y+eT0V4s9u9lQgmrRnBWIK98w6Eh4Wk+vbvL0m1Fol19raVrNd/OdyIuWK8AlLuPg1XxNWgPlwXX5Z9xQGfrayojgyVNz8wY8ueENlXYT8O6iDRqXim2NKFF807qYDTucqzEE8zUS6GlM74wTjFEtsg5ixl3smkrLvUaoTJJYNdcMQpSUA90U6BTuSSI7oLkaZEUcTX2TXoLxgshwGvOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfJgNE11GiHPXZKhlN7KREHtfZ11pbSwWf0Ala5qOsA=;
 b=KkFqYgnDJeeqLesydzyD0Dq4iTddkUO+n/Ls0oLTtE2MZqdutM3HkQyRpJsoFmR7AGrTet4czeQRWgDXuO1U4uaOf7sGYYF0P4jnE71U/+5EI5Ew3y341mW0Cd/FvJHOTfwdxnOJg7GjkxvDiGCqV2v4IW60dtePC3IDarcjVfjxGx13RIGub3mjKWXoaZ5F96oJuUZpuIedTptiqA9rYcYwrJONG/ZuM1OYNETuubJsrBsVl1uhQL6Oj8ZAUx9FsFDghaugDDFMDbRyIabJSIx4Kw0ohK3WbJFs8hP1TWrqlt5vcFN4+Y38OUOdw5gp3aje9qiDltqvCvT5r/khWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by IA1PR11MB7387.namprd11.prod.outlook.com (2603:10b6:208:421::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 12:51:32 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%7]) with mapi id 15.20.6411.027; Tue, 23 May 2023
 12:51:32 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][kirkstone][PATCH 1/2] Revert "pahole: fix native package build error"
Date: Tue, 23 May 2023 20:51:11 +0800
Message-Id: <20230523125112.1570302-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0199.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::17) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|IA1PR11MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e8bf93c-6870-43c0-7844-08db5b8c6f10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LVUoMDw+0dCoemHzQAHKZsRd/sVwLwCF8oBidsTJ7w75j/RRQIkCUeBCf4Xmw+lGIGtlNAORmYj/V8eK1QckUyZ7YMhCEik9zoWbMDy/nXGCNVp87ZFeAcJIOdZe6S6rvnBQO96cUk7xwo2JeQBAJCZy+tN7Qq6eu1IUOQxP+KMABaYMhGm9cpYbNmD7CbFMycOMId2o1o8yEA78jbFXUb3Ht0IGSGHE4hgIM2NzpnGnDRnmMmqEHYzE64OECNB4UgTptrS4zq69S0ptu9ihuIh7TFUoW2l0mP3TijX7lcqtn3c58rT87eQI90/5svnBhETwXSCT8cw51u+NKekiTXBzShDu04U2u/vW4nrPOO4OuU6gbb01QdbvtYlkHHlFHLHgVxkguIN3yXVDhYcHhzllkwpVwQNlOuW3ckehOEqE7qhjcdeVVmSbHb1LRXUlOicxD3kZvh/9fYZ3oiu3P9sFbBcoGpkdW91X2lt0Gf0jlHmMIY6baaqM9XsyXsITPupKaTU7w6IwE73hWfxOy9d8SbgOxRfVz3hIzqwsnLvv1yjML/vxrdyXsAbW1tFKZWSanUZeKHrT8MVGlIOppQN318k9NZuxWFJ2OirlyfbBvyHW/L/2w/BlH01lXyGq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(376002)(346002)(366004)(136003)(396003)(451199021)(6506007)(6512007)(26005)(186003)(1076003)(83170400001)(478600001)(5660300002)(8936002)(8676002)(44832011)(4744005)(2906002)(6916009)(316002)(41300700001)(66946007)(66476007)(66556008)(38100700002)(38350700002)(52116002)(6666004)(6486002)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l86YryEbc3otunhHliSapslWqkJmhRJLzd1bNaPY39FNwwa7zLGuEN/F6Bas?=
 =?us-ascii?Q?tlYOQN//PwGvy8R1v0bHMedPpjC3cjnzmu1JLl3he939AQlO+ftp9YwA7sLL?=
 =?us-ascii?Q?PRxjxIDga2Jw0PgGLixU6IJEzgaVWpg32eny9JH7FxfMd8WV5ULrpwoQkPDF?=
 =?us-ascii?Q?BX6j1jdA13ePpOleQSmTvk+eo0faCndCcDpAGkaIssHdkLggcTUJBkR3z6OS?=
 =?us-ascii?Q?upkPNUws4DN3Xj7ap6jWfG0MCXEgxse4h4YgUhYl3YkxepNhelbwEOk/G/07?=
 =?us-ascii?Q?Rz1SctBffNFGJLINflhXjINfSq0v5ZFkkXmDKc92IG8w5PEsQDHbOwS/CJVy?=
 =?us-ascii?Q?VLrh0dQzkQtm1Fj3XFmccbAjKKmjtsv28R2Xa0RmmPc8LY5UO+aDGiUoFFGg?=
 =?us-ascii?Q?yYQRhsdxZSUB/L/pqOaxveTC8BzKjmUr76ncZfP3IJ2zGDMj49polKnOAW8J?=
 =?us-ascii?Q?3NwATsTugv5Ea7kvMK7mw3yhurDc0UNw+DRdU78o8gAZUM8AkWti6+TaNY07?=
 =?us-ascii?Q?z8DAeDx6ufLZ0iDnWpVGpZt5nbvTZ/6HreY+L8LZjPZ079VIC8/fUVRvHxBi?=
 =?us-ascii?Q?dUxQUzBN0aj3Vq5okpXjceDOsBO1gfbwa7usxqa99bOqwqFSVsTP8JjlcH/3?=
 =?us-ascii?Q?6NKuERZukb125pbUXcOlz27WFWoL5P/HG/SsgYSDK0+WIksKZJgTi+3VUU7W?=
 =?us-ascii?Q?N5TMMtAH6PljeOR37jq3wBCFE6sYCSTVg0YnHBIyFNBE0T4/ad/1/LTUQS5G?=
 =?us-ascii?Q?mqEhxwCs3H6IZo8roL6vM5aoUXAvHKHlWhUu1PpuQJWNNAVB+bAqcDbEMYm0?=
 =?us-ascii?Q?ZLWRtJgQxapce1baKZrCCApYJTzBMSRIGKL1L780O+80SSDJOxr3iOY8/iYw?=
 =?us-ascii?Q?042htCanKUDarhGihJCR/jtMD9JtSfHpgySZxTc4ueikWYiPGrv7jMbSiBGJ?=
 =?us-ascii?Q?Krdf7QhAJucN1ed9rgR7gp6/ZmhG/MJ7/lwB79KAksZZcTrkMIf4E6iC6hsk?=
 =?us-ascii?Q?rcRmmaNYfzaEXGzo7HnOt8bspjJ47GyqQ+AzzHUaPKTdft7Qg4GxuoFkziS5?=
 =?us-ascii?Q?pB7SUkngrcbMIjNWFh89cHvj0sWGFokGWdBHAVzJYGEBGQ7mR2CsmZr+8Zg+?=
 =?us-ascii?Q?5Ws9hRhEurUfrBdgQBYVz8oDhOTin3M6P1SAq+Y0iPiRvUbqhpVIJZZt86CZ?=
 =?us-ascii?Q?NbXc8D/YcCuEd13QhhmH/Os/4RH5vwDxgr9PcUTapQdW6KJA80PU77qFbOrl?=
 =?us-ascii?Q?S1tvU3DndK2aoZrbHAeCskRPgqygvT0MuPpzDGDu8ccoTsfM2z3zuYLtgRo6?=
 =?us-ascii?Q?JfYFADB3DUT8Vynm4xtBxsttXdFXNJ0GDzWaANRNdeR8dO/+QvOi09NW4+SQ?=
 =?us-ascii?Q?DD2udqFKQQKbOB8TZqScVs0YK9JIbJaQ8K0v3Rq85OdSWUOhPvjGqaS481cH?=
 =?us-ascii?Q?n0hli+h1qCiZnugUC/MqyK9hX4p2CdTVagQoYj6NjB9uXVrKjct1UTbtE4cR?=
 =?us-ascii?Q?tBFfrZ73pVK9H0sxrKu9DBoFf3kjiGTVEx7Jk87p5KSH037p0/SSj84naIXA?=
 =?us-ascii?Q?QJnVFwpGCVbw3r24oygwNPNUFRurKDDML0BKgdVKM28xvv5N6aAMM0rms0cu?=
 =?us-ascii?Q?/g=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8bf93c-6870-43c0-7844-08db5b8c6f10
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 12:51:32.2920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHh5h8Pqxed66NAhzKSg1LHUbnfXHMjCMrnRrqDwhy16B1lGDuokyUEU0hHbTYKrpcaiWrsieWzk0ZZjVdyGfNrrxjBr8UdRlXPEZNm/VF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7387
X-Proofpoint-GUID: S8pP61ByiMsgx1G9L-eXD81vd-Xti2lJ
X-Proofpoint-ORIG-GUID: S8pP61ByiMsgx1G9L-eXD81vd-Xti2lJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_08,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=588
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305230101
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 12:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102736

From: Xiangyu Chen <xiangyu.chen@windriver.com>

This reverts commit 0cc8e22c463324ddd833239116b1ff82ef82f42c.

The pahole-native package should use the header from libbpf instead of linux-libc-headers,
the 0cc8e22c would cause compile error, so revert it.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta-oe/recipes-devtools/pahole/pahole_1.22.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.22.bb b/meta-oe/recipes-devtools/pahole/pahole_1.22.bb
index b790f5237..ec642ec3b 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.22.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.22.bb
@@ -4,7 +4,6 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "elfutils zlib libbpf"
-DEPENDS:append:class-native = " linux-libc-headers"
 
 # Depends on MACHINE_ARCH libbpf
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.34.1


