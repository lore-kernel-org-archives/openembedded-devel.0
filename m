Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F3FC433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 16:44:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.28568.1647276266834947792
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 09:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KYx5vJRK;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=00725df8ab=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22EDMVY1012648
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 09:44:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=Ue9/AXcfF9O50vmM0qsbubRWH+yfDggmYoOUZ51rzEg=;
 b=KYx5vJRKAGXP+F0sp76uL7Qr8P1J+C1XrgsXwkRYKDBn1YqHrIYxHplCFsuw/r8yOCoz
 jFLoML6ImF+RtSqxgbDwNwBqxij5Dl5zWdZ4E+/lRmq3HErMHj/poAskj9138oRSy4sY
 w9HjzTn4FmGECo3ihgPS/ff0/3Z2sOiB+RTMoXysDl4iHa16PqGAb9Ln6cpuWM/OnLZk
 Yn2aTdGw4qiWxjLflZa2hkrOMNe4VcZGOCnOHJE84edgYR8JoytBYzrm6pPem3VZnnUq
 H1qowEdeNlU0+Bmr0/QDKYnpjcmIvzW+3aTSzmOuac9+uB7gzlPypKfin2CQBOF4ruFT YA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3erqp99mr8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 09:44:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OwDG7dN0XfzfhzSNm3q0mkZ0sPWGBbbePFl8nQQGDbw09enq8f1qxQ2CySNmQgAJIFxiZqExVB+Q8aL7ulLWfTZTlNiepiH5nVE0sgr0lk1qptsuA9kLvULzz3aND6bvrc7CXXqur2solMrQcn/KkY+jCCDxaA/i5YKwHn7kuTcM/UCn0jRYGH3BjmsTNOb+21QjE+8roFz0W4V/7/+PXvfTkyoL+i99BTfNTyKnxb80Gs9x966Hg7Na9aHf+fMqgUQkEOcloBJfjHrxiII+LHWA8XB4DteXjifZWMA2BawCipxqPvVrUFH2qaCy+Pt45jv+JwVvc5GLc9ArAoeRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ue9/AXcfF9O50vmM0qsbubRWH+yfDggmYoOUZ51rzEg=;
 b=VnsaRxnKFbf2ZPNe3X/GH1xHkKAf1+b+CYVG60ji69TDcTPE51g06zvFILe0S0pQCIos5zc8SqjYEDwj1HHuW1jd5DgB1CaiBZm/s056VdmMmxAroZm4MJQ8WRmX1Z6FoCbrX3ufWB7tgGEqjGSw4iWEWg0sx8rPrQ07BqAQ3UOsJ35XA/mx+MlyIO4xpIQDPfle5RJopkXug7imq4yRlgBscdRNBccbgaSpYVCjhCwpjiwUK5mJw0QQJZct0dF5hA1Dyxes8INHo3FSMVxJSo//cn8WELGv+icmh7lGRqhas0tokfXdi2JGghFs+II9qdC9LrEzjpJmJCZmXU2/9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SA0PR11MB4671.namprd11.prod.outlook.com (2603:10b6:806:9f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Mon, 14 Mar
 2022 16:44:24 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::75bf:a544:9ea7:a236]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::75bf:a544:9ea7:a236%3]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 16:44:24 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python3-django: upgrade 4.0.1 -> 4.0.2
Date: Mon, 14 Mar 2022 12:44:10 -0400
Message-Id: <20220314164410.32738-2-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220314164410.32738-1-trevor.gamblin@windriver.com>
References: <20220314164410.32738-1-trevor.gamblin@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0169.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::12) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72bb2bea-2d14-4e43-bfaf-08da05d9e57b
X-MS-TrafficTypeDiagnostic: SA0PR11MB4671:EE_
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4671F72C85641F81A8E51D9D9F0F9@SA0PR11MB4671.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H8BYjGpQYuD8MgyYtXP6IMT07vTPYzheisEERgRSHvfNvU7dcEvK92+POEJYkSRtBUpq+vhSlHjHmbp2xi7wwroHT4Vo+UXE4F2EQfAmpqGeIRsRSawFohJmnfbPWc3VOdHkx/jKE9/MQFL4GoBXaem63/9yhPIO9+FGpwbvDDGrytq9oLHliBtlNkQVGBX+UDjTe7+xoDIf/ARKHv/khU7dUDP194Oqg0uLDrioyUho+CL80kb9Bcx+ulfHYC7iz8+/cdvT5AaBpRloPr5MtU8MKvZQPltZXx8O6mGTdd7suZP8CtbWLIUGH4SAnwbSKywNhH1Nu+4uHUmYyJdRU9E7jr0QretBk+6LxDFJjh1L4y4B3Mc6wOAT7WHEIrI1L1Fr5VToUcB8db9NrRAY7dp3qg+UcHEdebkpC4yl0fkBTlM3suO826DSIdGAn889x4XoOfHb0rdIh1VhxAZmr2Nq/Eu/riB2QaD0mjBm1+PoeBtR/CPIvwT2nMDNlUyiZ4L+VLFMocpnXLa22bFYsAV677Ln/YQV2dqJJCcUiaEI5oNfCyGN88jzXmIJH+r4ZBtPAGom2hBWihaaWYALj71TikcTGlbZ5/w9DeZZAspMi4PY9BAqwACGmCcqeqeguT97ZCzJUDl6cENDkKty4Nojt2tODU9jIc7ymL4bvP5QAvBARSxgC0jEM7I7nE+u14ydrEKJ/k3T27PDcpwc7KNa/Fepm1f8xFBODIxTbbDrVHVN6nNFPqp7hDk6x8zfN3/OXYsbrPKi9/bRdLRdk3R2pSGRvh3JDWDHcyVaJLg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(44832011)(36756003)(66556008)(66476007)(66946007)(8676002)(5660300002)(6916009)(83380400001)(316002)(8936002)(966005)(2616005)(6512007)(86362001)(6666004)(26005)(186003)(508600001)(38350700002)(6486002)(52116002)(6506007)(2906002)(38100700002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cmzesl0ANAtjcC6tMyxifqBb+nMbOTVIRG0oU7dP5e4S3dV5TlTd8PJ/OtBf?=
 =?us-ascii?Q?dwWW/JGHXvEQy19ZIQESJG5PwigMxSVGpv9O3OG2+NG0YRKCNn9t4RGisBeM?=
 =?us-ascii?Q?opPRSo+ntsMfxdYgCIfIvwiKq4ufTbNhiPhi7h7FhMDzTm+cehsLBV4FA72F?=
 =?us-ascii?Q?LfMFsq2N4di1IqJFtYwvYy7/oTKvnsmVIsp1ZEgPIIqmHrgZBiV5xgmlp/FS?=
 =?us-ascii?Q?H2+2IA+YvFckZxBjBRchD+plRi/Eh4+vR4jZw755hll37sAxFpKrgtNaVFcV?=
 =?us-ascii?Q?PAgcb7qCMjV5JDgHNV4CPJYrt06U6SyCSyCBjPwk76AVCCIsYvxCZ6Zu0Mgm?=
 =?us-ascii?Q?/PTA44fnXexude0WBylLKU6MpZrDy9H3a1hFdqVvBt0DqyAnV6oZ6XezD4h9?=
 =?us-ascii?Q?SoRM8Eu5jSUTNYfroTULk2b2Bgz7YDc/fsDQLHMA0dr7yhsRTnyuILSFnqF9?=
 =?us-ascii?Q?ChA4dsaAAFu3bth3eABd0pAK/ZicGImq4+Hwj+MIJWkOIw5q14s0HIyGQ5LO?=
 =?us-ascii?Q?KjlEvZy/1sqvc/aO9/eRlnoVwPEy+uNxtuLJCoX2ppsjVEHUmHLJBpaP3yGX?=
 =?us-ascii?Q?CzAJmNBqoFqzIPUJCQRz9SWK6DLEG/2BQ30DgSPF4u4rl3M8InhWNZrGkAEd?=
 =?us-ascii?Q?CItCUn601ZPs4vQM9e7qkiZe3LvxIlfZFUQkKPOXQ1MVtfi0FwuAq69GZvC2?=
 =?us-ascii?Q?XQ+6vT6bZQ47B+vGAB/e2w6DIoqf7H05Sr36rtUi1o2CEm+dsmaMUj4RCo5B?=
 =?us-ascii?Q?0Hvwr3Ddl0Dl2Ja9CHr1xFAysTnat1I263pgua13NWKdHVY3Aufr82NMWBSV?=
 =?us-ascii?Q?qo3W+7ertuJBFkBNkMpFOrJ0jI3k1pqF550f9SKkr51uwHPJAJYUfS0F+ynb?=
 =?us-ascii?Q?uN9T+j+K382QYL3zJQ+93QIKV1eDZ6D4H4RY8bq12vF2rMozs2RrLBdRVIa5?=
 =?us-ascii?Q?JzEJ6NuBq2Tn3ct3pE7AXf19OtvwJWPjJz2eBWtKmixfC0TZdZENi04lZziE?=
 =?us-ascii?Q?mMjdV6bmnTXxNUUPhfv15jcf66GGF6leQqVYq0+SYCcaqhx99sazk4I7beVc?=
 =?us-ascii?Q?OqGCzD5fbBLSLy5r3GXAjkDmGgq81oDceQydnvWLMqmK/aoGqdGnXNiaLiLu?=
 =?us-ascii?Q?cTHRs4RxSUX1uQj9ekpW77YGFXeCS/Ci2SAV2mnhc2AjkKoFPYLJCLkOdue9?=
 =?us-ascii?Q?oEygqrU8zDfOV5REvIx5VqGCNTi8NtN2dnDvLdmieiPV+gTVEy2XMDNcXS+b?=
 =?us-ascii?Q?BG24bN4AmcpmZkoEj+VxSKu8BVYnji5HcVpPMhWQ70xSGxHgh6FEp9ryEvs/?=
 =?us-ascii?Q?0r6BlxByMTOQsHtsnRxitEqT30kvXOegOKL16z/PwMEMK6UwWP/+U3CyLJ/4?=
 =?us-ascii?Q?lUcqKWr6coZ6CyID0dQB2oNssHF2yauWpEkWLvYBAEP81RJx+fjAqggUepjz?=
 =?us-ascii?Q?N1U/ynJ5lCfLPnPQ6QShiteHNfsfkd5WB5EuZ4YZ5fsqrzTEefnZGg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 72bb2bea-2d14-4e43-bfaf-08da05d9e57b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 16:44:24.5137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VaCi5aQGfAy56JmZgEuK4MWQckzOF5dr8XJsOjWVHvguzUaSNjbszAMGpx7wCPLz7UQ56xuQIdxv1rjdIUDf8N6VuFDZds+SkldiMrYZxXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4671
X-Proofpoint-GUID: hPoZ4c8ibe2KYojwU31DMqozaK8BYnuV
X-Proofpoint-ORIG-GUID: hPoZ4c8ibe2KYojwU31DMqozaK8BYnuV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_12,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=928 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203140103
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Mar 2022 16:44:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95987

4.0.2 fixes CVE-2022-22818 and CVE-2022-23833. See:
https://docs.djangoproject.com/en/dev/releases/4.0.2/

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python/{python3-django_4.0.1.bb => python3-django_4.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.0.1.bb => python3-django_4.0.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.0.1.bb b/meta-python/recipes-devtools/python/python3-django_4.0.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-django_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-django_4.0.2.bb
index 6cf8cad8a..690b9809d 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.0.2.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "2485eea3cc4c3bae13080dee866ebf90ba9f98d1afe8fda89bfb0eb2e218ef86"
+SRC_URI[sha256sum] = "110fb58fb12eca59e072ad59fc42d771cd642dd7a2f2416582aa9da7a8ef954a"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.33.0


