Return-Path: <li.zhou@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FF9EDB7D2
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 08:49:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76580.1775551739099552067
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2026 01:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=d5SYk7dY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=85575bf804=li.zhou@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376LvJM2986663
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Apr 2026 08:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ZVXi9Ll4j0BqJdmz+5u8
	HW16kt602R/RAf6REa9X9VE=; b=d5SYk7dYdCyl/SahU4H4tRxGM69mhckJHPb+
	cZLDzxCAtX9ZhqWcDQG8j3NFfIT2MxNgRBdvP4IlbD+DRwku98d7NNSdQz0fhTi0
	JTkfHy6cq9/kuY+8hASB4DgNNkuyfw77YdBLQmT640qD/qZJ5eKiGhsNCdaYOp06
	9WSELoWQFFrApjtYFB/JMECm+ACyPF4jm1avl9lLmfwQytm35q2cqOcdvqksOySp
	lJZuWCYLBxTCDd0jq+adqjlVuWLV+aQATh9X5NRy+MJXXP4WUnfo1k/OR71MAF2x
	LFmor0r5QBcs5M7Op0GxeJ4pW1fFE0o5R1IJV/X46ak1c/tsFA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011036.outbound.protection.outlook.com [52.101.62.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrqgerg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 08:48:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHRotSk57D/9Jyb26pTsmpSh/hdREoO0V2Yo1LrSaNAkZ4rR53qhIoL1df1iocClWW4VWM8wp2IwQIl3gkDidLUIlMlmVkGEeS0GCMHuN/6IteR/ju09swfqdN87/i7zytpMTFlKGanvSu1pXthPYT4SNJE7PzppRany4XlWskmbUPbRhnerI1WP8g8dEOrKqvkpXhatSzST3I5Qw8ae5jiPBzSM7AIgeQMbBiefFFPRrcy7S0xVlAgqYS3toPaV8Y9S7UszYOaURTv/v2IhbzBU6eMxADMmMmCaXXQJVJRpXVnnhfXRY8ekHLjHJjFDfKTfmFhFG6JINq85XP9mmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVXi9Ll4j0BqJdmz+5u8HW16kt602R/RAf6REa9X9VE=;
 b=O21EgJg15BM72EQb+xOIIpA00zx0eHR7sIil4x/5qb2J6h7M56Ut93KS87scGzvcje/mVNp/rwzADZnDbPAiZ1rtsTne7dp08XO3WtuEPje/uJBDwODy/QunnRBCsOAaeTsiYTtmmT83xjmA3h/5JLzN21kzZoYB47rXr9rlsY/egXtsuLoWYx1THY3hbQbXwI18wWa1fiTm+iYilkRzjFfFpJxa654cnB8RQcPvF25chofLjX2paPltPca7wL2Dy/SXtIX39K0DAXh+4IwrJPvNSSg0tS7pEDtpAqp1zCd8LMxWV3Z/jsMcM53mu/FrJUZ+ComP1+VCtv/lasg46A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19)
 by DS3PR11MB9796.namprd11.prod.outlook.com (2603:10b6:8:363::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Tue, 7 Apr
 2026 08:48:55 +0000
Received: from SJ2PR11MB7453.namprd11.prod.outlook.com
 ([fe80::3198:3bc6:ec3e:b2ae]) by SJ2PR11MB7453.namprd11.prod.outlook.com
 ([fe80::3198:3bc6:ec3e:b2ae%5]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 08:48:55 +0000
From: Li Zhou <li.zhou@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-pytest-runner: remove using pkg_resources
Date: Tue,  7 Apr 2026 16:48:20 +0800
Message-ID: <20260407084825.332202-1-li.zhou@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::11) To SJ2PR11MB7453.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7453:EE_|DS3PR11MB9796:EE_
X-MS-Office365-Filtering-Correlation-Id: f59e6db6-94f2-4926-c8d4-08de94828045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	9xWpnuA6l9ZMbj9vHp4m/nZRFdjbNN4xNIuUxekgzIudKoJoaAmW8VWYV+EeiEyZQI0KfOM+dj8vNzakCcyvpmjkRAY6noTo0eS8j9tltC/cNYs8KSQD8KpQngvlAUNaT6Setr3ODZxXHy4aRa+uoE7K57ICJupGlLNZ6QCngRj7aRgCDaWg3P/F/JDOaYBM5/gKGvnd6KiOfw3ir7/L6TS/UyqjNlADIGf7ZEb4qBC54berxr5IXzxi4oYHVsH7DJTGPWcp2dmbycQuSJ++sDD3Ui8UUA47ntduhcfbGFpy8erYxVVY5iJn7yRP+0JEQW+Yzq8lUZcGPZF23QYsSKY21X7FeaAFCFHYpSCuu3QSByVPNXQcusE9AaHm6Y+1lwFNRa5Vi32cfNUj8ZsY2O1uFa/BUNqhhFFNNfYGjwSNPe2qHeRYU8b0dnk92mCSoKnxpnaVQoSiDp71jXk8kuxr3662qxQYRT1G1gC+kZx7OPbK7wjkK9B4yvPrFNCR7mM0B/BvE/WQX0Cj4tHE1Er8hPpwJIIneGtrpQz+8SbETmIVvp/Ux63CmSBMegWM5x/dWYqjKIYK5Nl1fSEQ/n7itpJnPPTfGe7FKyec65DR/kDcH29oXvq1bR/qu4+5vyAl8BcxHYoG4qvL//NTODvmScyJfDy5I/pldEDs2j6M2v4dKEB+kXxQ8Trj8j2+GFHBqN/EdPbWJr3jaBAp1PyKNCPA6fk7b9hIRGs0Vap6LIw38OrtvWPKLv0QiIZ90XtgeOYCrVIHMQVFFgohNvjAPEz6pwJfIe6hjGCwrxY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7453.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zWMgGBohJoylH9LfHJNlC5EHBg5IZJ3CRVCJRB1xEn+GRjzYU3j5BbQm5Pp8?=
 =?us-ascii?Q?5RrWtKBF4Cc+OzbB/eMs7iIc80LW8dLhnuJKHIysb+Us0hzlECIGyq+Z96fM?=
 =?us-ascii?Q?+qvqU1/NgHNtus04djKsYeveR2qVIrcPABTQ5SFRqDnI7P+kvDHwvRkRLgq7?=
 =?us-ascii?Q?2Z0Gi3p8vFMYA6ens9KDaHiNW7LC0kwirTSUpUjyjrzDE+MoIe0USIkiMdH2?=
 =?us-ascii?Q?oB544oZoJf9F3p58axtAKBxyWKYKcUWez7S9pXtORlOrwMqXPSRNOIaDGGZk?=
 =?us-ascii?Q?Y44u/1pNopBF6hPs1iEPVMFOMj573UhKNe8/4xjZYWhPEK4pHvvOIIH5NDFU?=
 =?us-ascii?Q?D8SONqXePh2H8xoFvaBzUqh7ZQRD21gL9cZYg7ZyrN5iIwnhMhnGilnvVhb3?=
 =?us-ascii?Q?8BcJRs763DEDA0QogESrzlIzIGQx9G0oe/1wbXQWuRsUtLRVGF+Cy2xTF5bE?=
 =?us-ascii?Q?dGJqbwYZha12TEpsvxq9r78YQo73CTUJwRtUIH3BnhZvm/7+R1Q2TNjeINxB?=
 =?us-ascii?Q?Ut/W72RbBy58faP/eDFy761tXUeMTwMbUqzuK4fSPhZzLqr7VA6WcjcVEL47?=
 =?us-ascii?Q?KHs0Lr1BqFYQF+UoiZrnv0BAaXQJg2NRTTNxaXCCZXtib9OdBwuBsd9HUF4h?=
 =?us-ascii?Q?whDGCgDvWElwpEcAdZ8SVv+2dHzz5QO9IXwGuli+sPl0LV7eKNlB2K2+vnfS?=
 =?us-ascii?Q?WgPGl/p2diOtmzYmMMj8CEOlrhO7D9Ecddt1CF3Fzk7Ya0Mqu5WcQNMLOU3u?=
 =?us-ascii?Q?IG0uloJmEnJDBAfdYW4jXGynPLcyUuFzqCqCFMl7pAZyHIzsRB/39f8A7ghe?=
 =?us-ascii?Q?/uLKit6Abfv2VCHh5gEvOw0tkv1aZba/Q4QaCkSZVtilrD5JJDKqQEUzRZRB?=
 =?us-ascii?Q?wZ389tDZWtXksl4SyipPl3bPsSEowQB2P2BVvHbuKgWZ+ylPg1CW1xuAlZEY?=
 =?us-ascii?Q?x9wmx4tDi0KKre1YORQMAtyDBwGj54NEJOu6EwkIY54ApOQVbOi683IJ+0Ut?=
 =?us-ascii?Q?XxEkjg6I45Zlw+5wuyoe6Ck4KwVnD15deB0zKS5WnZX5g63vr1mC2nvpErAF?=
 =?us-ascii?Q?TOGW+Q5KhrVqbqM3KiXKdlGdDMxrJhbLlZmNTMmRPZQYe7B3ylMqsbzkNmAC?=
 =?us-ascii?Q?wpKgkBanFD+jazdDGnQJ+rROxHY0msvlLHY65SnC3IyL0JAICuxGkOXtAr8Y?=
 =?us-ascii?Q?xKrSGKXE29RIo9pT8wst8g3g5z8aRb52BU+9T5tcoVkFhswrQLFSXVnd4nxk?=
 =?us-ascii?Q?2gXAF8Z4HAZ3J8q4gjgTeIlPzknZgxRTL3VdzWuL11CjWucN8J2QakAMCy5/?=
 =?us-ascii?Q?TKM9wLBDzFBLvf8QmAisuuCQciURolWOhJFultr1wggoMSTMW3lrGDQavMQr?=
 =?us-ascii?Q?W378WBjskrcmtVc1ah5aWSm2S7SPRz4uovyz/au4wN/worzjGI9gaPHff6CK?=
 =?us-ascii?Q?gZ9oKJjNvhRi+qOx6qGzBaTKslZaxNwXhbPx3lk1a9dZd9o/1sXFd/+nrjZH?=
 =?us-ascii?Q?nOnB/MhcB01VYSforM/yzpNwr2jf5bcSZLggGlFpfvzXZF07EqvmRwN5RuQC?=
 =?us-ascii?Q?FtaWiW8uYCbZjmHGUmNfrBSU2i+MYuh26pTKtTNDcL7eVGWmHHLJSV5B4Tx0?=
 =?us-ascii?Q?pIeuBJCApO1YuBoaFGi14X0rQVl+f04lxgQJb+kcn3R445tOcDsNZQcK3NZ2?=
 =?us-ascii?Q?uewE6aUPwnZZBkESMavLLFyopqdCSI4n5HOBka5iYeX2azgn/mk8LlwnZQax?=
 =?us-ascii?Q?SABMrOph2g=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	L50sQ9m+Je+hSUrSDH0CatJijlv0cj8w40aAAI5+/m27Ul4/VE6focR91zkAvT5MLkWgskQRkUUKLT7vI5VhCTEo3HU6SSKtkfmCy+3a3hUMBCqsak4+DkH9D2DcabllM0fZbWZ+y+m1sMjs8g2S3LtqCwO0qYtHghNAhLCp0nQeJbOGZ4QINFbxTEXFuTGlLbTkNRUU0pEbbuLuZfeqbSJQ8QzEM+ZQnfcS/VZdUFoF9traSszQ72pDm4azTPV02x5kahcX4G7vapDOAPbfMw1pk7qcizzyM5FCJd67qBG6mBbi3QtX0f6OtCkJEAiV3uOoIXm6EQ3e0VRpdWl/Lw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f59e6db6-94f2-4926-c8d4-08de94828045
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7453.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 08:48:55.3245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IksvPeCgpgDdcRgy5ZYjbROP8rA9qLtnogv9tLt8sdOvSwOqenfbRgjvurGN2KziQpmEvz+7lvbrBmDJDZLrAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9796
X-Authority-Analysis: v=2.4 cv=RPCD2Yi+ c=1 sm=1 tr=0 ts=69d4c4f9 cx=c_pps
 a=QuE5qaevU/mtxJv9VH5uOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=hrgX2PPgKUUTNDS4NTcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: _YGggIw_NYkFxbxGVfwSlR7nyXg7aLgb
X-Proofpoint-GUID: _YGggIw_NYkFxbxGVfwSlR7nyXg7aLgb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4MCBTYWx0ZWRfX5VKpV7koC4gI
 +yooXLY1ZiTH6VCU1WJzqz+eKMZNA3peNyNCbAk+7pQ+o5LChqBhM5OVhO4JSUONUT+O7UI55ak
 vCRTQOWjVdqECOGcDK2FqKmXTvUp/upJ1F7Mz+CBNw51zPHA73yk/yZhs/Gz99QYUHv/EGLvrUB
 8z6Aa18BzoamDok9eVDSDHEeJQDOuRKGncRFL5g0gIbWu1lcDA/coN4YGZPF7ffqeTgJT8AocGk
 6+5iirC05RinN61p56XF6eThGiPhYOLXDnXcwMrDM7oDSMqCVcH6WUtqEBYZfEt/x8TkVrnJ1Ts
 i0RwCuROCkELNdrCK2T/luL8/1XkhE5okn7LjgCxRm9U0DadOpHJvsjxkxwwiqcN267dk8adTTa
 1tx2FuMLZOs4Er4Y2t0DgB4pBcAy0VA7uO3wGVIiGn3GprfV0b+dTx8Hubv/wHlp/o3vJPr9LEu
 phWPBngVPRJDMoGPNmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 clxscore=1011 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070080
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 08:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126077

The python3 setuptools 82 dropped pkg_resources module by now.
To avoid the failure "No module named 'pkg_resources'", replace the
functions from this module with other functions from modules
packaging and importlib.metadata.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...unctions-from-pkg_resources-any-more.patch | 77 +++++++++++++++++++
 .../python/python3-pytest-runner_6.0.1.bb     |  4 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-runner/0001-Not-use-functions-from-pkg_resources-any-more.patch

diff --git a/meta-python/recipes-devtools/python/python3-pytest-runner/0001-Not-use-functions-from-pkg_resources-any-more.patch b/meta-python/recipes-devtools/python/python3-pytest-runner/0001-Not-use-functions-from-pkg_resources-any-more.patch
new file mode 100644
index 0000000000..20c1c121fb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-runner/0001-Not-use-functions-from-pkg_resources-any-more.patch
@@ -0,0 +1,77 @@
+From 81b0218e390e36aa2c3d1bdaa124d8af175e9cbb Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Thu, 2 Apr 2026 15:44:18 +0800
+Subject: [PATCH] Not use functions from pkg_resources any more
+
+The python3 setuptools 82 dropped pkg_resources module by now.
+To avoid the failure "No module named 'pkg_resources'", replace the
+functions from this module with other functions from modules
+packaging and importlib.metadata.
+
+Upstream-Status: Inactive-Upstream [lastcommit: 2023]
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ ptr/__init__.py | 23 +++++++++++++----------
+ 1 file changed, 13 insertions(+), 10 deletions(-)
+
+diff --git a/ptr/__init__.py b/ptr/__init__.py
+index 41192fa..5186059 100644
+--- a/ptr/__init__.py
++++ b/ptr/__init__.py
+@@ -10,10 +10,12 @@ import operator as _operator
+ import itertools as _itertools
+ import warnings as _warnings
+ 
+-import pkg_resources
+ import setuptools.command.test as orig
+ from setuptools import Distribution
+ 
++from importlib.metadata import version
++from packaging.version import Version
++from packaging.markers import Marker, InvalidMarker
+ 
+ @_contextlib.contextmanager
+ def _save_argv(repl=None):
+@@ -121,7 +123,8 @@ class PyTest(orig.test):
+         instead of declaring the dependency in the package
+         metadata, assert the requirement at run time.
+         """
+-        pkg_resources.require('setuptools>=27.3')
++        if Version(version('setuptools')) < Version('27.3'):
++            raise RuntimeError("setuptools >= 27.3 is required")
+ 
+     def finalize_options(self):
+         if self.addopts:
+@@ -133,11 +136,12 @@ class PyTest(orig.test):
+         Given an environment marker, return True if the marker is valid
+         and matches this environment.
+         """
+-        return (
+-            not marker
+-            or not pkg_resources.invalid_marker(marker)
+-            and pkg_resources.evaluate_marker(marker)
+-        )
++        if not marker:
++            return True
++        try:
++            return Marker(marker).evaluate()
++        except InvalidMarker:
++            return False
+ 
+     def install_dists(self, dist):
+         """
+@@ -175,9 +179,8 @@ class PyTest(orig.test):
+             "please upgrade to setuptools 30.4 or later or pin to "
+             "pytest-runner < 5."
+         )
+-        ver_str = pkg_resources.get_distribution('setuptools').version
+-        ver = pkg_resources.parse_version(ver_str)
+-        if ver < pkg_resources.parse_version('30.4'):
++        ver = Version(version('setuptools'))
++        if ver < Version('30.4'):
+             _warnings.warn(msg)
+ 
+     def run(self):
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-pytest-runner_6.0.1.bb b/meta-python/recipes-devtools/python/python3-pytest-runner_6.0.1.bb
index e5e5e048bd..dd3a8d0234 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-runner_6.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-runner_6.0.1.bb
@@ -5,6 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
 SRC_URI[sha256sum] = "70d4739585a7008f37bf4933c013fdb327b8878a5a69fcbb3316c88882f0f49b"
 
+SRC_URI += " \
+           file://0001-Not-use-functions-from-pkg_resources-any-more.patch \
+           "
+
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += " \
-- 
2.43.0


