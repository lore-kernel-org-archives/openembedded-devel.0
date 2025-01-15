Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B811C02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 07:24:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15860.1736925885279071292
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 23:24:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3110a90dd8=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F5fnom004599
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 23:24:45 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443s1pkjj0-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 23:24:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIDxaASKvPioALwztmh8P/wYmt18NvG/IKd+jJvdvwoNHS3YrfKugdfL5RqXb2nsmLS6I7R1M5aDD0TntJqbJ4zWxj0Kc1mMiXZepo3oCX8lAr3+In1a1rZOwEm91K6yai0quC4NVjTN8I1D3VZc2pb1hbjMk00d4H/4qkMqa69sJlvbMKsa+Y3gFh95zy6wU3z3e1LNsoa/aF6EpiFCoFYgEnX2c4E2zbLBCGNQ+UupsRQ/DaxQpLwheA5UdMGocILDf15ZQriH+MtAo9q5P2S2FbB02aiELYm0IONTNsM2eFO5fkou4CWHl4hCVRVaW/D7LvYKNNAfUkok6r3UZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3ReJpwNiwdpvzzFwTl9AgjEckmPe7+sFK/4itGYSAM=;
 b=YmLxyTd+0/NosXb4XIQe9ydb0rgV0EKeYe/dOpi9ZOjxjHA/WEyL9TQcmZV8KP2Odfvyw0aNilJA1Wkdw8O9gaVPeLLqKQjv4iZl66ZsT6eamf9L9GLhHAmaEcxcvCSR1roV4Qarhr/R16tboDaDg81Es78ohjO0V/AxlphCuaeowDRYr6Z9pMsWXlCu6MPod8WEdHOLPDRvDxOcGoqngx8r+gfNpd4BV4htGx5D2kRdZgJhACSThgtH4UewyxD+kiNCX6wIcL4XL465ivQVeKC8B589vVE2H0l/ji2JizqlTLgn2I7o86SDPo1g4iD0KP/dhiVe48vgAgr9yraIvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 07:24:42 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 07:24:42 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/8] opensc: fix CVE-2024-45615
Date: Wed, 15 Jan 2025 15:24:23 +0800
Message-Id: <20250115072428.3667416-3-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250115072428.3667416-1-peng.zhang1.cn@windriver.com>
References: <20250115072428.3667416-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0112.apcprd02.prod.outlook.com
 (2603:1096:4:92::28) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|SA3PR11MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 331a3543-719e-417c-3a8d-08dd3535adba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/hnZmBEr79f06Q5lWdic0ULUSuHtT6kec0M7GqxfxfYlLvEsp8PBtqoiKr0T?=
 =?us-ascii?Q?bTgZvGk72ZuBUao6tkiTgZSpZIjJnl8hHfmCi7NEPs0dGkBzRQRRimhpQvyy?=
 =?us-ascii?Q?ETmuvLlASsP/vUdP+5eJrFINRhyqOv+UjsH2Rx8FekaVjEsatnw0xYg8Cuvh?=
 =?us-ascii?Q?VBVBs6gFlzZM+0e3V1dQOdTJr5/XQS4HQBtuc32GeNF18ZBEkSbqLZRF928Y?=
 =?us-ascii?Q?t3yGUWjhHMmoH2IYNvqTQKV3tBp7yrIkLF+OaNfs+Vbydbz4eAPdomZbAX9B?=
 =?us-ascii?Q?+BpusuyfN4+h9eMukT3aChehHYp+Z5s7Ru8i4KpdwEKL/kcKHu4PbDHgc8Hh?=
 =?us-ascii?Q?uyScmMlFl/d5mnRwvq7xkuXoEziR1praY0ELyZgNntsH4U3CJ6vGX5EKy6HQ?=
 =?us-ascii?Q?I6yjxK8VjAZdfUNYmQufy8xuMpuYjKDEGpTLaEnXYz5Y1Uoi/jQdMCI432LA?=
 =?us-ascii?Q?dRQ8Chi9OzocXofv5feeGEoJyryPEWZfP3G3I5Y7gXy3lmhEJSTGGjIDt/Lv?=
 =?us-ascii?Q?2giboXjsSRbCMzTO6sB0Xk8peJ5cwbAMLwSYFjPYVVxV9JckuVWd2NPc8pJM?=
 =?us-ascii?Q?7yM2yoHA0CfZDR17SSCCyroko5kze92rq+Ab+C59IrWmq2wESOljL8OUN2vU?=
 =?us-ascii?Q?PnvjWOhtVnijBUZUqksGdt8RlN6xuUqcPMHbQy0OgOAv8EyRnsxd1r6rlx0H?=
 =?us-ascii?Q?PH+7dtEWdiZLZE1/TI8p1ud0+UgfkTPhpBpX1pVmQovOm7edJFcqKwvMEqVD?=
 =?us-ascii?Q?9N5dVpyoKPOY+PUlYAdr//cCFO0mhLdYYVbDyKpqVvjuHk1JafdnMNSSCRJv?=
 =?us-ascii?Q?gfwdp99WRWLeTCRT+xdP61ycyzWvK/jzVYZZnDu8iOsXhvYriPysvUBaPdLS?=
 =?us-ascii?Q?1pQ6zowatjqyU+3RKnUd1K4QDs6ZzE3bxgghK2rH9R+1j1tfJECmU2pKQv+5?=
 =?us-ascii?Q?GYc/1tz3iwT8v0V4y00tE8P+bLLzc9VcAabePyno00oDrNewBXInmEmifdnk?=
 =?us-ascii?Q?xpFsZ9+CiBFDuQoL0K4GZEN71e1+8rxBKQ/dj1EB5MYhmVm2E3aGGJn1YYHH?=
 =?us-ascii?Q?NWfJJVk6pjo2aO2C43h3Nc1FT7QmHoNAbYNWSz8lhKhcTdZWM+hbFIcmxGfm?=
 =?us-ascii?Q?1tvHeLp6L6GPoV1Nmzd0oXVMTAIsDVSylf5xaC/+8+wKMg9fB2ryuahaMuF7?=
 =?us-ascii?Q?u2rtQD2yap+ep18ETxNdXvK59yQAt4TsUya/0D5Lriz12es6FLTHS8RTgIrj?=
 =?us-ascii?Q?bJMYesgma8uKuHwhliVKhPIUnI/SASuH7fNOPuSDjwLL6ndNsbuTpEMehcqi?=
 =?us-ascii?Q?nyy3d7hhjwaJ5tIlo+yYd5VWxn4tAU1a7GrAweY2jqT5YwDvz3LEMw/I6mGr?=
 =?us-ascii?Q?Utzu4HAw7F2N3It7qqsBRfODxR/dvQhE4oHNU3VfyyWMVW7VaQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PupQ86JzewwoZeCTbZI2VgarSa9PKhP/V5uO6Nne2JPC3POewaTjyofeTgy6?=
 =?us-ascii?Q?3GnDBjQ0mzQ5HBcksgclUo2sTOeYKo66J3Jq8UTLIEZdc6d7uVayW0jvONI0?=
 =?us-ascii?Q?jNsvAZm1W67L+aZWty0+TFhn6M0Qd8kDOGXtcH6ERZqqEkacj0Sxos3k4bMC?=
 =?us-ascii?Q?G0dxj9gnmSXK+YlturVMl/wvmEwQPjYxRmQhvHQIiH9uEQKzKUbHsIx7x6UB?=
 =?us-ascii?Q?o0BjAhUXlhsgVFbNUl19IiKuN+jxLLeJTkVfJ/bnYU4n/ruf3ahO0kj+Gl9L?=
 =?us-ascii?Q?gNpxE//XvHYLDQUoY92LC59i48xkdWY6RNP3umC7RaqL9XAV/BGw+a/+SVet?=
 =?us-ascii?Q?wyNdYtmsaBIPITyqanoCV5WnUDDPglwrCDeQ6QGKJQm67vKhdOW4q8z+YKLs?=
 =?us-ascii?Q?h2ix3+MNDL7R92xuCBd1FESX6o+c8xiOgHX7+5de9pPHBFmGGVlhdIDTGPoJ?=
 =?us-ascii?Q?WSlnwxvaborn23tLxAsf5BJHPqjHkGKcs/puH/+hGI6wl44liI5C9gSgPE8d?=
 =?us-ascii?Q?yGDTj7mnY/qgRxW/oyO6GLvjvdaVuhJCi1ZO+yMMlS+/aceOrySVxgAsT+G4?=
 =?us-ascii?Q?a1gwE/4ch4ktPf4oVyviGBKKDWS3h7qck7lar5xy0xANCsVs1wtFBlEXnvpU?=
 =?us-ascii?Q?IwFV1NUTXvU3CfszIJD59LXrx8dtmXOBtCCggNy6ZWlIXVUqghLmCWNJ2eqN?=
 =?us-ascii?Q?Lje4r18qUmQAA7+fWKm02I57gq5kXYZNGniYJa56XafM9HSlA5aVX1V7gwN6?=
 =?us-ascii?Q?O7vFWXDlIH1Znd6ovuYcvZ1ePuDszYoaXwDh3haIO+tkwA7U0/EWuzB34c6m?=
 =?us-ascii?Q?lmBq6EP78f5hC7mk66aFZxMJHYhau2FELSCx0aOniBTGUDC2c4YX0OOw+ovb?=
 =?us-ascii?Q?YY+TMXpE/RFiF2FTmD8ynKqRoZ9LzsRCLtkl/Ym+UCJfUuI29nrQzFiDgo/P?=
 =?us-ascii?Q?8YA4n8KWaOqk48wOiBay85NgiofyWB0wq0WIRsLkJVSk6BEi/d/LmttoEyDD?=
 =?us-ascii?Q?Ez3d4iJytKSy2Rwig05tvPRRK18yo8w8NzvuXqUjNr6hRKBYzgVl26O3DDz0?=
 =?us-ascii?Q?Pn3msoTxUg28UoLL9icYLh/XXuPCmqp0X20qDXkvT0cQs6Kbw8Nj4HY2ltY1?=
 =?us-ascii?Q?7t//ZqPERapMeM7dcT44+XGtuqSixXN5q5dCnSc7KuQjXdnBbUKy1IlO7WpX?=
 =?us-ascii?Q?YOQfsOmFsXhSDWAzCpaiBOGF5HS/BX5qjPjYiza91HnXKbmHMqz9y+eP2z2+?=
 =?us-ascii?Q?FrV9Ea35zr3QyZ7tD8JCWpLqopgQ/KN55jFFm+uXTJ43GXb40oZ8oKRjzPiR?=
 =?us-ascii?Q?8jmXTkhGgO4qFhWfJPgqEAbtPMn/C7Zw5r1cpXSgsgCb74fx50lu7i/hv2Nf?=
 =?us-ascii?Q?wl484QyB/DvnAQCMisI/yuwZGCPFg7fnUd1+FJnJ+MQzk+95a/aJpv1M9boc?=
 =?us-ascii?Q?ue7lgXUzvDoSSD3QDMn+vpTIdiN7j5AmYp5Hvbhhp3Hko62ThNc/4FxVjsnn?=
 =?us-ascii?Q?st1W5RegLlvQklOs2WOn0/IkzdGK3g3DAFHtW9V5bX/hN9TBRFQfjqALkVu4?=
 =?us-ascii?Q?3lP6KE6oLWP6LtnDPXjx+MIoSP03A5l4kSJteh6bVZeGZQgzv1S4Y4m/gPDA?=
 =?us-ascii?Q?dw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331a3543-719e-417c-3a8d-08dd3535adba
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 07:24:42.4234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 080enWK77cEuXvCxWL02f0Q5sXtqoV8zX599wH3AWwTzIBJxpJiq6oWTKdXphzvLPKd0MDuflrSQiFaSoAOGetk4AWEnL53VYYC00Ta/2Q8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8046
X-Authority-Analysis: v=2.4 cv=DdLtqutW c=1 sm=1 tr=0 ts=678762bc cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=voaiVwKxfI1YsTQl_r8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Es2q7STI-mwsfhJd3o7vaGHw66W3CfeU
X-Proofpoint-ORIG-GUID: Es2q7STI-mwsfhJd3o7vaGHw66W3CfeU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_02,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501150054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 07:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114887

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-45615:
A vulnerability was found in OpenSC, OpenSC tools, PKCS#11 module, minidriver, and CTK.
The problem is missing initialization of variables expected to be initialized
(as arguments to other functions, etc.).

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-45615]

Upstream patches:
[https://github.com/OpenSC/OpenSC/commit/5e4f26b510b04624386c54816bf26aacea0fe4a1]
[https://github.com/OpenSC/OpenSC/commit/7d68a7f442e38e16625270a0fdc6942c9e9437e6]
[https://github.com/OpenSC/OpenSC/commit/bb3dedb71e59bd17f96fd4e807250a5cf2253cb7]
[https://github.com/OpenSC/OpenSC/commit/42d718dfccd2a10f6d26705b8c991815c855fa3b]
[https://github.com/OpenSC/OpenSC/commit/bde991b0fe4f0250243b0e4960978b1043c13b03]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../opensc/files/CVE-2024-45615-0001.patch    | 67 +++++++++++++++++++
 .../opensc/files/CVE-2024-45615-0002.patch    | 36 ++++++++++
 .../opensc/files/CVE-2024-45615-0003.patch    | 35 ++++++++++
 .../opensc/files/CVE-2024-45615-0004.patch    | 36 ++++++++++
 .../opensc/files/CVE-2024-45615-0005.patch    | 34 ++++++++++
 .../recipes-support/opensc/opensc_0.22.0.bb   |  5 ++
 6 files changed, 213 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45615-0001.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45615-0002.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45615-0003.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45615-0004.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45615-0005.patch

diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45615-0001.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45615-0001.patch
new file mode 100644
index 000000000..badb301b1
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45615-0001.patch
@@ -0,0 +1,67 @@
+From 5e4f26b510b04624386c54816bf26aacea0fe4a1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Thu, 11 Jul 2024 14:58:25 +0200
+Subject: [PATCH] cac: Fix uninitialized values
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_card/1,fuzz_pkcs11/6
+CVE: CVE-2024-45615
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/5e4f26b510b04624386c54816bf26aacea0fe4a1]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/card-cac.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/libopensc/card-cac.c b/src/libopensc/card-cac.c
+index 1d1b616c8..4c3bc89bd 100644
+--- a/src/libopensc/card-cac.c
++++ b/src/libopensc/card-cac.c
+@@ -255,7 +255,7 @@ static int cac_apdu_io(sc_card_t *card, int ins, int p1, int p2,
+ 	size_t * recvbuflen)
+ {
+ 	int r;
+-	sc_apdu_t apdu;
++	sc_apdu_t apdu = {0};
+ 	u8 rbufinitbuf[CAC_MAX_SIZE];
+ 	u8 *rbuf;
+ 	size_t rbuflen;
+@@ -392,13 +392,13 @@ fail:
+ static int cac_read_file(sc_card_t *card, int file_type, u8 **out_buf, size_t *out_len)
+ {
+ 	u8 params[2];
+-	u8 count[2];
++	u8 count[2] = {0};
+ 	u8 *out = NULL;
+-	u8 *out_ptr;
++	u8 *out_ptr = NULL;
+ 	size_t offset = 0;
+ 	size_t size = 0;
+ 	size_t left = 0;
+-	size_t len;
++	size_t len = 0;
+ 	int r;
+ 
+ 	params[0] = file_type;
+@@ -461,7 +461,7 @@ static int cac_read_binary(sc_card_t *card, unsigned int idx,
+ 	const u8 *tl_ptr, *val_ptr, *tl_start;
+ 	u8 *tlv_ptr;
+ 	const u8 *cert_ptr;
+-	size_t tl_len, val_len, tlv_len;
++	size_t tl_len = 0, val_len = 0, tlv_len;
+ 	size_t len, tl_head_len, cert_len;
+ 	u8 cert_type, tag;
+ 
+@@ -1528,7 +1528,7 @@ static int cac_parse_CCC(sc_card_t *card, cac_private_data_t *priv, const u8 *tl
+ static int cac_process_CCC(sc_card_t *card, cac_private_data_t *priv, int depth)
+ {
+ 	u8 *tl = NULL, *val = NULL;
+-	size_t tl_len, val_len;
++	size_t tl_len = 0, val_len = 0;
+ 	int r;
+ 
+ 	if (depth > CAC_MAX_CCC_DEPTH) {
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45615-0002.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45615-0002.patch
new file mode 100644
index 000000000..7e02df383
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45615-0002.patch
@@ -0,0 +1,36 @@
+From 7d68a7f442e38e16625270a0fdc6942c9e9437e6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Tue, 16 Jul 2024 15:51:51 +0200
+Subject: [PATCH] card-piv: Initialize variables for tag and CLA
+
+In case they are not later initialize later by
+sc_asn1_read_tag() function.
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_pkcs11/21
+
+CVE: CVE-2024-45615
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/7d68a7f442e38e16625270a0fdc6942c9e9437e6]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/card-piv.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libopensc/card-piv.c b/src/libopensc/card-piv.c
+index 6bf740221..0f07b2529 100644
+--- a/src/libopensc/card-piv.c
++++ b/src/libopensc/card-piv.c
+@@ -2241,7 +2241,7 @@ static int piv_get_challenge(sc_card_t *card, u8 *rnd, size_t len)
+ 	const u8 *p;
+ 	size_t out_len = 0;
+ 	int r;
+-	unsigned int tag, cla;
++	unsigned int tag = 0, cla = 0;
+ 	piv_private_data_t * priv = PIV_DATA(card);
+ 
+ 	LOG_FUNC_CALLED(card->ctx);
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45615-0003.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45615-0003.patch
new file mode 100644
index 000000000..3f57ca336
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45615-0003.patch
@@ -0,0 +1,35 @@
+From bb3dedb71e59bd17f96fd4e807250a5cf2253cb7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Fri, 12 Jul 2024 14:35:47 +0200
+Subject: [PATCH] pkcs15-cert.c: Initialize OID length
+
+In case it is not set later.
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_pkcs11/7
+
+CVE: CVE-2024-45615
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/bb3dedb71e59bd17f96fd4e807250a5cf2253cb7]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/pkcs15-cert.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libopensc/pkcs15-cert.c b/src/libopensc/pkcs15-cert.c
+index 1777a85835..5e2dbb89d0 100644
+--- a/src/libopensc/pkcs15-cert.c
++++ b/src/libopensc/pkcs15-cert.c
+@@ -169,7 +169,7 @@ sc_pkcs15_get_name_from_dn(struct sc_context *ctx, const u8 *dn, size_t dn_len,
+ 	for (next_ava = rdn, next_ava_len = rdn_len; next_ava_len; ) {
+ 		const u8 *ava, *dummy, *oidp;
+ 		struct sc_object_id oid;
+-		size_t ava_len, dummy_len, oid_len;
++		size_t ava_len = 0, dummy_len, oid_len = 0;
+ 
+ 		/* unwrap the set and point to the next ava */
+ 		ava = sc_asn1_skip_tag(ctx, &next_ava, &next_ava_len, SC_ASN1_TAG_SET | SC_ASN1_CONS, &ava_len);
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45615-0004.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45615-0004.patch
new file mode 100644
index 000000000..a477bb07e
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45615-0004.patch
@@ -0,0 +1,36 @@
+From 42d718dfccd2a10f6d26705b8c991815c855fa3b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Tue, 16 Jul 2024 16:32:45 +0200
+Subject: [PATCH] pkcs15-sc-hsm: Initialize variables for tag and CLA
+
+In case they are not later initialize later by
+sc_asn1_read_tag() function.
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_pkcs15_crypt/12
+
+CVE: CVE-2024-45615
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/42d718dfccd2a10f6d26705b8c991815c855fa3b]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/pkcs15-sc-hsm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libopensc/pkcs15-sc-hsm.c b/src/libopensc/pkcs15-sc-hsm.c
+index 315cd74482..acdbee7054 100644
+--- a/src/libopensc/pkcs15-sc-hsm.c
++++ b/src/libopensc/pkcs15-sc-hsm.c
+@@ -277,7 +277,7 @@ int sc_pkcs15emu_sc_hsm_decode_cvc(sc_pkcs15_card_t * p15card,
+ 	struct sc_asn1_entry asn1_cvcert[C_ASN1_CVCERT_SIZE];
+ 	struct sc_asn1_entry asn1_cvc_body[C_ASN1_CVC_BODY_SIZE];
+ 	struct sc_asn1_entry asn1_cvc_pubkey[C_ASN1_CVC_PUBKEY_SIZE];
+-	unsigned int cla,tag;
++	unsigned int cla = 0, tag = 0;
+ 	size_t taglen;
+ 	size_t lenchr = sizeof(cvc->chr);
+ 	size_t lencar = sizeof(cvc->car);
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45615-0005.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45615-0005.patch
new file mode 100644
index 000000000..7826f7e71
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45615-0005.patch
@@ -0,0 +1,34 @@
+From bde991b0fe4f0250243b0e4960978b1043c13b03 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Mon, 20 May 2024 21:31:38 +0200
+Subject: [PATCH] pkcs15init: Avoid using uninitialized memory
+
+Thanks Matteo Marini for report
+
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-h5f7-rjr5-vx54
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+
+CVE: CVE-2024-45615
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/bde991b0fe4f0250243b0e4960978b1043c13b03]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/pkcs15init/profile.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/pkcs15init/profile.c b/src/pkcs15init/profile.c
+index 74fbdcec1..16c2ddfea 100644
+--- a/src/pkcs15init/profile.c
++++ b/src/pkcs15init/profile.c
+@@ -1807,7 +1807,7 @@ do_pin_storedlength(struct state *cur, int argc, char **argv)
+ static int
+ do_pin_flags(struct state *cur, int argc, char **argv)
+ {
+-	unsigned int	flags;
++	unsigned int	flags = 0;
+ 	int		i, r;
+ 
+ 	if (cur->pin->pin.auth_type != SC_PKCS15_PIN_AUTH_TYPE_PIN)
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
index 822e0ab97..9446237a0 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
@@ -26,6 +26,11 @@ SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
            file://CVE-2024-1454.patch \
            file://CVE-2024-8443-0001.patch \
            file://CVE-2024-8443-0002.patch \
+           file://CVE-2024-45615-0001.patch \
+           file://CVE-2024-45615-0002.patch \
+           file://CVE-2024-45615-0003.patch \
+           file://CVE-2024-45615-0004.patch \
+           file://CVE-2024-45615-0005.patch \
           "
 
 # CVE-2021-34193 is a duplicate CVE covering the 5 individual
-- 
2.34.1


