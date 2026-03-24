Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1066BF54AA8
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 13:00:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18831.1774357199907631021
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 06:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GkNBy03x;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7543866fef=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O4lafA1261825
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Sy6aZG8eeMHB2bG0c0sq3MgHhKtLgd9iAW3PK0gV654=; b=GkNBy03x0jRh
	D/g80ENwm0qqp2uakFMqdvVOO9HbrJynW6ybFagwkCDsrKp7TVPngebr3BAAwAQn
	GkL+o40A6rJun38ceq+xOzA4XxP4ZwTi1w8lv45kMQMAlkg24fsc6s8SMdjZTUeL
	JIJitEAOsk6SEOElre2uKKsXNaL90HPABEcdBPmh4mOcS0ucy8qNj9FvvZ2ooX9M
	QKR3jNc4d78+eiAfBgNr3DIP/YStYi1dwVRaugUQNXOOY97d/6aSGy2apIs3naZm
	TJWMcHPyoaVUfWc0i5ugc+TV3k5OL873iwdS400H1rvyrId23sNVhSrvA4aBwgIz
	ozWzlWnmkg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012056.outbound.protection.outlook.com [40.93.195.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1gj83d8h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9wOxg+owhWjmNVebeyHDWaiwKBwjfWKrga0DnMXA7tPvG+naFK8Yw6Lc0FDxMEvthWJgOLDAm4FVoGBdNPw+nO9HCtcCvV1alPqvCg8QX+lh/x1OPBSqotgNyrxLa46yZp5pDwTfhXSKSXLUvoGK/98m7nldxZMAWenQ/nnpfjTXtSOSM9s0FPELGeDnKyihHXYQkA0HiYR1rsTKeftzm09OtwF0b723WpmOs0au++8XWt2WW1NFH93Q/WGVFpJ0S+sVVgHc7/T/dZe04V6baShYUCQbtgJrRUxg/Z1qev0kKcbO3lG7eO51vEwGAawNvM2sW4sR42i8sBVoRu39A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sy6aZG8eeMHB2bG0c0sq3MgHhKtLgd9iAW3PK0gV654=;
 b=c3qhyWa5hi877w/k+wzx2/5oEHpuTyGnkFY11j/HvLLlXATgAZ+njw8tyyH7wUJGc0H0z2zto5W8Ao6/1jZL0ckCSqMveV64yN/6e/UfBHT6JnzIJuzFSBuGAIBCr94sMLPW8UacZKSvvr8Z0hZsWSHuQ8FBUP3FEAZiXEK+1Z3+VjkxbYR6Enes+l1XmqaNoG1w5XOp4NLo869/izvjywSNd+Nz1BzPZNZH3SPcGIQfIMytJawTq03Tp+ubX9OHFECmJ2o9E3UHAlN5VUDXJ5J5Sc7cFBY5zvJzYb6ufyouAOb/8mjF/+eP4UOt3kSd9c2O251J1E51dxBaKHaOUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS7PR11MB6128.namprd11.prod.outlook.com (2603:10b6:8:9c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Tue, 24 Mar 2026 12:59:54 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Tue, 24 Mar 2026
 12:59:54 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH v2 09/15] thunar: upgrade 4.20.7 -> 4.21.4
Date: Tue, 24 Mar 2026 20:59:21 +0800
Message-Id: <20260324125927.1070644-10-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324125927.1070644-1-peng.zhang1.cn@windriver.com>
References: <20260324125927.1070644-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0114.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::18) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS7PR11MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f24dbb-f27f-413a-34c9-08de89a53e1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	z0n+i3QSjCL0WBcKBEqApF1o+VwEq9BBGhhDkqelab80GbV8pqfy2WR8FgIaq+X6qHUIoN7Om56d2ZQYLdKvNxxs3snxfXTcB8mB0oeprhhMbckmq+HznLd/y4LFz67wXTAqVdN/IohBZGjOkW/CQyn0QaTA/K7tToiUy5qC4rXHSbHPT1CO4wE0HoqEFx4q3yNPCff7IP/dGJUzSAIaX2ZVIxSohxc5rhHBpr6ZBQ7gKxZtXYY0Q5Adhu0z2q0Armq/n/ysRPLbIlUkzXKItMAbuF6X6aYOVLiN3QjY8kBMBU8DMyCVJnsiP/I+Lr242vqId+kdZEryDrcWltJ17dG1LCd3ToJQWCDUWqh0yfVJsewx4Py9lVQpr5YRCxy6prdHivNvzfaitzli2ci5M2jKyd+9tLhg6yxsRUipaO8W8mHYz4zBbsJ7y8pDos7TXL2EjCkU1gvV0tI2oNazq0xy9W24TEOvTaHUgtnVeS3rZ7VJoDuAnS9aZEvYkvlGl7CCoxHFoKiXFD3dA72yfnok2YM4sK8k/EEJ2sukSCThTqVvMU31tuY+xO9qzBLgId53JgS6gGRdibvPxXlR+61SbepHv1DnnQ1b94ggw8/p4dRk9hO7aEtLWBx3G9gRMlvfKVKF7LDv2IlXzbaquIZT8+/O+H7m2J3BKIr68p3J+5BTL6Htg+ZBCV+vMVNOy2n1ryFLfWyKG8d7OZunzEZ/hhm9+duiMSmSERMztnXOZf/Cu7iSGRC9ROGVNm0+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eBfG55s+MAID0lWL08tFjPC3zb7RWxXfhGNXCDZzsE3qqd0Sf+npVncSGK11?=
 =?us-ascii?Q?mkwgOj4AuqLlxdq55RNq9AjnzVJKEeae5nCShT2sIGkjIIrerWA1WFW8JlDZ?=
 =?us-ascii?Q?KW/QG2/BBfzMN0gHRKxWqVtghBe/esI2ZjL1ZQywNLWL1jdwENlfmKXKxDDc?=
 =?us-ascii?Q?BBsFKbo5agFHIf7x8cjiqiX6OaztVSxSIzI8ACh/78qo46QFc8ZO+Yw9DLMd?=
 =?us-ascii?Q?QCikS6Q8yyDpouiJ3wp8p/A0ERc3IAH4X2mJdjx2yM12Asd4vywu33A5Eys5?=
 =?us-ascii?Q?hXcfu8ULg2Eu+nnYFXszCM/mCMx3pZSGZc+P4St7s59zG9QVZrT9k2mSjX6a?=
 =?us-ascii?Q?8VSBCToqxyiE79oaDOejBQnImt6FjRXmEx8t2XQ286svbTih/tuIj9fsW6M6?=
 =?us-ascii?Q?RAkhuUWF1nk7oI7tyi4RWzCKXRsvK1iP6J+FbD4Fn7SBRzJZosL62xTKNATx?=
 =?us-ascii?Q?3bfIGybFr5lwlPjxvaFKHHjQ1yoEki6LFZkpqW/Kj5U8nd1dRrGka6hFqPUz?=
 =?us-ascii?Q?LVEcf0jviHLHkamgwGcQsSlZDQVxgs6NZMm+/p2R0J1aSP9/2oCAjbzCY0j+?=
 =?us-ascii?Q?ZExa/9IGKnAu0F6aY4bYrt2wBo6nD1QAOmZRQ9YZUWWEb4lN4OPyk437TiZO?=
 =?us-ascii?Q?14WRXeAOLfdnB9O0Gq6VQycM3XzljEQESkWVQ7Qi/0KwLM1571qynMbSxQhF?=
 =?us-ascii?Q?4q/4A8901aQZePGt10o+9qe9GmKylob60GbAp5NkWsw+iDcrCdvFbmGMlMnO?=
 =?us-ascii?Q?qd293bsd/kFAioS+cjk4LUSrUnfsfbwFCiR//9s+qwdKI1kRtEyJyiAxiCOW?=
 =?us-ascii?Q?Dun7HTs7uhkklBqoJfpG1fKfZ1GPEiqrWRE0Vqh5c6vVczGIvsmO+hmPDAV7?=
 =?us-ascii?Q?e1RrVkI4v/K8S0ksyXC4yi26UmrfApnClejNsXpW2df6m0HCg/jZAKAtxWlc?=
 =?us-ascii?Q?zTRMhjB4xN1g852RXnaPba+ortMY5IfjTFqgzMw3uNEB45XONs47mvWLEnIg?=
 =?us-ascii?Q?XZyCz3uvfAL4g33wh15M3f8tbJeg8QbD5XELnAAyjzR2rBuDtUVJmrgQC35T?=
 =?us-ascii?Q?CwN7SC9kA5kIPm7QNTM3bER+fPT1s+di6C4g9JDuMpnVbfP1KhoGZAXUAmYO?=
 =?us-ascii?Q?p50Ye8KaQy097tTLtBzKcsKRcxXRPgGtSRezGxpebiStLss/4dW6lrVzrQ3K?=
 =?us-ascii?Q?PDMhXnGTaHfEYTbGf5U2LP+7OpK7P3SXYnaygDyZx7a+VZ48EnlC0eoWXN6u?=
 =?us-ascii?Q?P9xtJ2d2MUeveV2VDD7TRo1dBXeMgxytR6BhXL/CzA/dzRBB/xdqvi2q+4Ru?=
 =?us-ascii?Q?ZVTAphO7lu+4Xt53mkmvr9q1MPaHNBRz/e0kqrPejvR3dRHyLZpAK6Fpawob?=
 =?us-ascii?Q?8ceZTjKhnHD9pNN3GhBGEAntd1mElYa1Sc0BtyXxqJvyV5yxqqENa20rvdXn?=
 =?us-ascii?Q?nUhvyQ3x9Y9qDor0QR/YAO9yJWlTKL8kcG1xxkSL8a5tFEoJUxjPOJ4DbUkL?=
 =?us-ascii?Q?KGoaaTeCJ2kdW/Dskyf+09IQaPjTwo1HqJPdvhs7qDUD8Uvf0BoHzp9/iZBQ?=
 =?us-ascii?Q?5GO3DGrVSpivkgUayDAHCbNEdYOvXT5QJHOs80A+QFF7pkkkacwInyuL6btd?=
 =?us-ascii?Q?waQwTf3uTLxhkLYnKPcqfTMAelc3s7Y8kWWhlw+VeZE+obJHOUgmPDS0cJd9?=
 =?us-ascii?Q?71uRvMzh7zWAOrsAGhb4dcHHO7qSdPmZYEfCnWbh4aGLwehyqkMGSeawfucm?=
 =?us-ascii?Q?9wj3TaCClpl2VTkGQ0U67M3Np9gmpjo=3D?=
X-Exchange-RoutingPolicyChecked: 
	IZullxQyFyQVJ7jOEuBduQHGYr3zFdgNvj6hgoLEkwFzJjbmRHCoA15z1UON4G36U7pfHW/HuPakTf8v1ll8fhLWWEDLxNgtFarR1eRMOa9agzvCon4oof5OVLQOy4AE1Hs5iqEO4ZsVvTuOs29RKe3Jb/RNEsBe4rZdZQ9oVleOFxVYk7JX4ZD8UYPX6FmTrXPZLWgeywtAkpOXg9urrA5pGp44yaPdUwE/S+anFl9ypSg1k4d+FEgFIz8ExOU//BHED4UeZ8xndPXqJDZPeho8UmqmauPOCMXIdGGH9G/+TjNmKKb1OQkIEQVyW1m28X/AqX/2lm1M/govSwuRTg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f24dbb-f27f-413a-34c9-08de89a53e1a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:59:53.9791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPAQy3krb6uGfEX5MtxuJ4v78GJhkNCteIn8O/jHsZksxy36WP/ByQrqOKmrqDNAhgUcXQWSv0Z9GLtHKfYHkrrIEvgEb8pLYGSo4X9blDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6128
X-Proofpoint-ORIG-GUID: XPETXJLQkdCoRwzevpXqRtw8PeXl-Om7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMyBTYWx0ZWRfX7D4xKLFwVHab
 +ReBJnHvqqFC4APDBclGhmfuwfFcKhDpYfBxKPR1j8Zig4MmoQ2saN8sCRSIvpUr3K9WYmA8zNs
 la4i1YR3ku99xKXeGsuMw9Xj5qGdINEw+Jx2OdHmIbgt41mVH7X0zglc2LqwhSgZcNBE2LkLZtF
 acr3GLNDO6j9lt1vvrUapp+HLiapteEtwKTpA5glUnEqJk+SyN6iLESbx1+7oRy2d2bQyBLu5oJ
 7I8axtAcm/+hHUOEzyVmKhd5eDvHk+h/KX0Riw9q5ELxJWJL0VybelVuXf6i0N7Uxv9jh0MVhL9
 X2Gk1uMTHjkYanoGFIO7VvDBWBVgtQPaoR8bJtM3rjvAntEdD72Bk/fFQqZ4VXtyqQipYtMhGZ/
 YePgnseUh5ZRe6Y9Xo5rlbPBCofJjqAEw3SoywTpuJBuEgq6jo6esZlOsI7ndmSSKq0XOqKD2LL
 9KWPxeuRGpTErGZgfjQ==
X-Authority-Analysis: v=2.4 cv=LtqfC3dc c=1 sm=1 tr=0 ts=69c28ace cx=c_pps
 a=3QgNZYwUpJBVNtkd9Eusrg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=8WVA-0PgoPxkN3Xxe0kA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: XPETXJLQkdCoRwzevpXqRtw8PeXl-Om7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240103
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 13:00:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125569

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Changelog:
https://gitlab.xfce.org/xfce/thunar/-/tags/thunar-4.21.4
https://gitlab.xfce.org/xfce/thunar/-/tags/thunar-4.21.3
https://gitlab.xfce.org/xfce/thunar/-/tags/thunar-4.21.2
https://gitlab.xfce.org/xfce/thunar/-/tags/thunar-4.21.1
https://gitlab.xfce.org/xfce/thunar/-/tags/thunar-4.21.0

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../thunar/{thunar_4.20.7.bb => thunar_4.21.4.bb}    | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.20.7.bb => thunar_4.21.4.bb} (63%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.20.7.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.21.4.bb
similarity index 63%
rename from meta-xfce/recipes-xfce/thunar/thunar_4.20.7.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_4.21.4.bb
index a03804496b..af2580e7df 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.20.7.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.21.4.bb
@@ -3,17 +3,21 @@ HOMEPAGE = "https://docs.xfce.org/xfce/thunar/start"
 SECTION = "x11"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "libxml-parser-perl-native exo gdk-pixbuf libxfce4ui libnotify xfce4-panel udev"
+DEPENDS = "libxml-parser-perl-native libxslt-native docbook-xsl-stylesheets-native exo gdk-pixbuf libxfce4ui libnotify xfce4-panel udev"
+
+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
+GTKDOC_MESON_OPTION = "gtk-doc"
 
 inherit xfce gobject-introspection features_check mime-xdg perlnative gtk-doc
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "e0dfbb732c3d7c9174d1c0216dd6177f1d4e9297e623dbced32efd3f3e8682e5"
+SRC_URI[sha256sum] = "85f2c7fba6e891eb0df04b94139d519778130ecde95a6e629ac611d8cc9c6a7c"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-PACKAGECONFIG[pcre] = "--enable-pcre2,--disable-pcre2,libpcre2"
-PACKAGECONFIG[x11] = ",,libsm startup-notification"
+PACKAGECONFIG[pcre] = "-Dpcre2=enabled,-Dpcre2=disabled,libpcre2"
+PACKAGECONFIG[x11] = "-Dx11=enabled -Dsession-management=enabled,-Dx11=disabled,libsm startup-notification"
 
 FILES:${PN} += " \
     ${libdir}/thunarx-3/* \
-- 
2.34.1


