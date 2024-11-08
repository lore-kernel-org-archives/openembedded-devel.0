Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3238FD5E129
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 03:52:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5363.1731037918022528287
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Nov 2024 19:51:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1042324eef=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A83nEsF019497
	for <openembedded-devel@lists.openembedded.org>; Fri, 8 Nov 2024 03:51:57 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42s6g5g788-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 08 Nov 2024 03:51:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IU2LLpXn84u7vPPtd6mna3Ro6GUO5gE0wzsYPwl2uKehm8Vt68ZR4zi/ivNxHxHIzCscDb+IqA6VFczeQm4py/IQ1zHAiuW7tOntKpMF8MZ1+yxVOs/8crMxtoSdaLTKNLwSgc75/5DpH3OeOt5EkgXMOeKQDEGyb3LICCAFvfvTamw+YwvBvQs2NSdESVYgFpIyNKZird7rwa3QzFDsr/kFKBM7+2UwCJrMXa6MLjZ8CLL4iv69lhGuFBcvdU2F9b+MRQScVyNuRA8slTWJce8s6131sL1lt02IRxB1AMY32aEEZj0Vr+9t3YR4Te2erZuuLCFindzbRAXFER/gdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syxU8CTooumYlyVtH63s8EL6/s7Cd80Pz6Clxm4VFQE=;
 b=Kp6jXZdR7bgc9axEJHPpGyp0Z2yojOkUC15xne0U5sW7myGu2bUYfADRX8I0CyScMaLSOTeTl6NxOKCu2qF+hp0ujjFIxioOhNml+3280Zu3kEKiU8qHa7k4yJVHBNyrR5qoDKRppKZoodeVOHPpsaq/Miw8AY+OBfxxsNmAyiqW9eOPeMCEl4dYPRsRyNWyeypNJrf7K5FW3MYpOOu8cmXgdMGwObOlxyCIiCHSx3A7FIclwG0nqVK2XrtKMvZUcbMpOnoHR3g4CXrONjNISoRECuIAZ3/AV4RJclff8vvHgfAGaDLN3eHqW/oJDIGZ2LJh7H4cBY9UFBQOFD3XrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB6918.namprd11.prod.outlook.com (2603:10b6:806:2bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 03:51:54 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 03:51:53 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-gnome][PATCH 1/4] libspelling: require opengl distro feature
Date: Thu,  7 Nov 2024 19:51:40 -0800
Message-Id: <20241108035143.2214659-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:254::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB6918:EE_
X-MS-Office365-Filtering-Correlation-Id: b3637a1f-6c6d-4287-10a4-08dcffa8af05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9wha6RGRFPdjxdPrnX6wZZg0Opagn/b8wDM6OgMYNpEEfph/2w+a8xCv0ubM?=
 =?us-ascii?Q?i3c0TeDeq84Xz7oksJn+EcSRs0p2xylVBGFtupTxRhQqpvhMEsDlrUUkozJx?=
 =?us-ascii?Q?TdQgKHlMnENB21x2bijj/M0ikSH3Pjzg5ZnHD9La+GOeZ4YUYFKzCdG11Qwg?=
 =?us-ascii?Q?QCyCm7+yyUvTiH1OIbVbpzpFzuJd0o3UASQyrGCJX91KQhw+dCbBz2J0FqIk?=
 =?us-ascii?Q?LPWhy8lFKXv9cxr2BVX0ukS53odLVDdi5AhduAAuCFa7BqAe4Ilvnm7b5p7q?=
 =?us-ascii?Q?WXryQ72iZoTxCYDjr34l7mmMgmM3xd5PGvUEe6Ki3+s5ODeCzeXoUzFmz2gq?=
 =?us-ascii?Q?d/DeHoWeP4H0XDTl531W1eYHugFSIMeQCLRZe+K/hpwcUN7QN1nS3W7HwYiq?=
 =?us-ascii?Q?JKfBPABEGeJaaACWLexDxMoJHSx0X2S/HXY2xGjBAI/WjNoxGqhCWKXcfFTR?=
 =?us-ascii?Q?H6YXdF2QK/fHCVR3ConcdAW//+vDporc8BFQbOYdUX7tTPOyS2OqxryUveRB?=
 =?us-ascii?Q?l/RgraNSKOizZNjV5PkVw3Kc5JHIwtdf8AJbJ2ydA4MrwvG7DK9fvvd9nHZH?=
 =?us-ascii?Q?B8Ead0nhZvABS6FqusR+5m/Meqyi6RP+/xGx1uNz06+QObWd32EWPNdwjjS9?=
 =?us-ascii?Q?S/cHNiuGlR4d5iWoOVWcTIl+S32Sa3wGwcFledjIsgbWXDJz1onCEkBGaj25?=
 =?us-ascii?Q?fJHlYupMJV1KRWPtHYEivLTE8UL25mXy8+bLi7GqJl9XT7u7eP1GiqiA91Sm?=
 =?us-ascii?Q?vXhbCycd6ivUT00/laJF4VaQp46WqSMTHPh50GxUd9TaINPNWv4b69ruMrGo?=
 =?us-ascii?Q?83/eFuf4U9p8BG98pwF9uiJRrfAjXQABvBbCSw6cQONdhAbp11ObtYEYKk2x?=
 =?us-ascii?Q?WXFF82e5VVoMOguWR2NtBBRuvhN0FSbr9Wrtt6g3l1lyC4ouB9joHuPKKFwR?=
 =?us-ascii?Q?YoFSmmnp/+4dBZSYsBLgcPQW8NK5k9iGtKvhvbRrGU78SydOnHTsfmIaEXBV?=
 =?us-ascii?Q?ZFdgFCZ6JsQKS5PJ89qYPB4K5QBHhBiVB+QcQ2vqyK8s3H6gzCcGMpQcRI+S?=
 =?us-ascii?Q?GBTN+fRshL6Nthl63Ni2Qtdxpnmoh7gcw9gp+b8DpE/Pjjr/S3yH7OBn7f8F?=
 =?us-ascii?Q?ormA9qAus3aq3d9CHgTKDZgCowRHS1RhfarDkE/G/2m99n54XP7S3dhe/InD?=
 =?us-ascii?Q?HaeV63yXWIx+KDWhusRCX+N5EBLtXkvKwvwcSlMreIoY5ibGVS3R1EX/8fO0?=
 =?us-ascii?Q?B4nTayXt8S03ruGS1xEpy95MU6R/IEEXcOkw1TBJUALQwYfOaUVnECOOU1CB?=
 =?us-ascii?Q?BzcztZYg9lnSYydiAvYK439Of2hSvvxdSVbQrVTdT3Q6ryFDrd/ZbKvOOVMW?=
 =?us-ascii?Q?cmxLgBY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DLn9V3SJYxsnl37XyyQAPobXfDcm43W3VsYu0+YaqLrsmqD/ayeQ8qHUTjot?=
 =?us-ascii?Q?9D59yxRn5Poj3DhX7mrL6pcMgVNljSca6NVMujmBW9LLsi+5x8DNLJ8yEjbz?=
 =?us-ascii?Q?aYDvaulNCDvY7ZqO/tnf7l2QzEQTNjCIEogzzjM+IzlLaVXYkfTbo46cKY/C?=
 =?us-ascii?Q?H26O0HSBFuU6k4e1umAbpAgVo2qHFh/B3iv2m4VJ9sG0CqpD5ApUERyGEwdU?=
 =?us-ascii?Q?UhJGauRYJ/iWFI4m47mtsrN8o/WVwYwTN74IX1m3K24W7YQzPDO+uYuT55Uk?=
 =?us-ascii?Q?SKYafvbtGSrU93sVP2HwfFHIw8O8HLtvtKxFfC9O7Uh/kzPc7Z//sa0kZK1x?=
 =?us-ascii?Q?heOs1fDDQsvPqVln1H4QN+9Jj2Ym6e3kdAQnu0gaHnGAXpfjJaRWfWPGZjs4?=
 =?us-ascii?Q?TqWzXA4dlcVI0iEkWPR2gMrBQCDQfq1QDoPHJRyJSjY7C+Gdtpw0l8teA/1e?=
 =?us-ascii?Q?46JrKIKLSm9+HVUnicoVybauObJ2eGKWNTZchlC08C3idOgUqgq4ZJEIXAex?=
 =?us-ascii?Q?RLwemisWKYCNrL3Dcu023SnTluQ8nMa4p2vVH0P70NLwIcOH9wVyaQZt9Q+R?=
 =?us-ascii?Q?BBwJGE0fSsVhm0kajxYwrySCFEh/iG0HXVgIhrcgDE0bW6jzB9E+mjufq8cI?=
 =?us-ascii?Q?V7bugr/LJRaOiRRnRP7w0Z7cF9h/3b2F3o1pb7v/7ZSNVwJGPb6IDU3vgsvx?=
 =?us-ascii?Q?FJAIniGlBO8mwZWFrn4zQITbcNBnR0njUmGqTsKHa15poI6mFSARMcDLJMAu?=
 =?us-ascii?Q?/GiG7y6fbxm03pj4RJSl8eMyWVNRGY7cbbdibOFdG6H2TIkdyd5oQTNFN3I0?=
 =?us-ascii?Q?3jJ/fHHgUcSRXiuxdbA37HCRxLTBxNGgzvRhpkGceYXNv4QCoMiJsyQc5rgG?=
 =?us-ascii?Q?hW4cGsrTlLy9yG0JdsjYxcvk0W7U4N8J08LDfFzAgCNOAl2I8RGd6d8G1TYd?=
 =?us-ascii?Q?uU+YnpI1pFnz1AUEnlyhNFcJ3b9oOYbkOhGTDPu1xYGhLKXCZSAhvWQ+Vqk5?=
 =?us-ascii?Q?UyIizVGFsqxRXrS/eBpncPGV9XBFwxqvPPNoIkcqhL2lW7/M1gcLKFzBvuw0?=
 =?us-ascii?Q?gUBo+trxIVybcTgqI8SIBHOdOFpveBeNNmFV9JX9zGJmXVaC0AlvPrqRJDWg?=
 =?us-ascii?Q?UIiSYPti9P1x3AN9HNXn8R8SaZNc81Lt15lqu8r1Kx2m1PvRdGDVO2eLKid0?=
 =?us-ascii?Q?FBJcfe5UB/e8keH+YDGhavPdIL6wEjxp1nKowzi7B13/ixMohgyBWCxg2jrD?=
 =?us-ascii?Q?9ADwQHbcrGPJRrXQ50LffnogW925FZ39SNhrzUXts+B7aufMdjsiOP5yhSRY?=
 =?us-ascii?Q?80jAVMmxF9sp4R8q0G89YtVauxp+xOhNJH1mGjnnHf2ZEmAYQ6+G1PvKbp87?=
 =?us-ascii?Q?MamjJ3dP8BSa3VtU3Wj5S79fFSmh+o31cD+GEG+t0ZLV3BGYDIG+pSE3Bp6A?=
 =?us-ascii?Q?RzpZKLSH1uJHjNpKLnuhNEPv5FDUOvRDKelggdcU+GNFcMrnmAkuGV6ZLyYe?=
 =?us-ascii?Q?VAY1GQVdUuvWflKklMPehttJTgQaZ2sa4CV0dCBesQXKVZsSNUL1ddr1jdij?=
 =?us-ascii?Q?By26Q7PnSVgeHdI6nW0sJ1m2WxKcRwiX8mnlfR8NJsGnbmC2JguAZaSZNJzK?=
 =?us-ascii?Q?+w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3637a1f-6c6d-4287-10a4-08dcffa8af05
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 03:51:53.7224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lilxKZTajH1nQpDuUgytFqXc8xJ0HfEzGgZ0cl7yfAZHKmM89S6REkZj7V+5JzWPuTEO46+4HmodN9sncX6Wkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6918
X-Proofpoint-GUID: iS-VRNDMmulK0xl1lPzyLquG57Ph2tg-
X-Authority-Analysis: v=2.4 cv=JoCjr94C c=1 sm=1 tr=0 ts=672d8add cx=c_pps a=H8RDR50mQ1szzU+C1Tr1+Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=n_Y_jjY3oyc-3krRzUQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: iS-VRNDMmulK0xl1lPzyLquG57Ph2tg-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-08_02,2024-11-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=843 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411080031
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Nov 2024 03:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113760

From: Chen Qi <Qi.Chen@windriver.com>

The gkt4 in DEPENDS has 'opengl' in its REQUIRED_DISTRO_FEATURES,
so libspelling also needs to set this.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-gnome/recipes-gnome/libspelling/libspelling_0.4.2.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.2.bb b/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.2.bb
index 833fe65c3..11ac08656 100644
--- a/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.2.bb
+++ b/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.2.bb
@@ -5,7 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "enchant2 gtk4 gtksourceview5 icu"
 
-inherit gnomebase pkgconfig gettext gi-docgen vala gobject-introspection
+inherit gnomebase pkgconfig gettext gi-docgen vala gobject-introspection features_check
+
+# reason: gtk4 requires opengl distro feature
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 GIR_MESON_OPTION = ''
 GIDOCGEN_MESON_OPTION = 'docs'
-- 
2.25.1


