Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C077C77B7F
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 08:36:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3948.1750494960397686647
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 01:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82679d94d1=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L8Zqq5028682
	for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 08:35:59 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dhy2g70a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 08:35:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0T/6yl7EVEVEnjS7L3BN6xyl4lqCJu8qX6ZHMjSqr5Ip2EZrE1Sk6OY2efZUa+IPG62BbwFKe5dVgg00Fe+gcF8w9x6CgyCFK5/UBA6FZcCm6vBgZNNwNzOo6ui3bFOjS6il+zj8V/j3uTLH4GYacLuQOAvdzOO9NOWxTIaOCJGTOoZbarXfOLOp1s8OcTBFbBW+vW9CrnxYYCUAduucDuQj2aRHkuwK6KiFhpmtDsShdJ6+gwdhI/TeNnqeO48ArppP28hcN+ympgAyqjhISpNM1/0cUmwPE+4Lx1z61cxAdwZIsMicfskHHVGiuz3eJZfhU9czz8qW5VhapqTnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVUp7qAX1Kwhc1/GHZso2Jl6rHzu60XZedQi/4xoSiI=;
 b=flfnaW2ujJjP3DxqyrRLuOqhCgSb9nPK6fcbb2yj8x+weUidV75rWACuZt9ch6DDquQ2XQ9OeAE4JjOsegbCnZi4qgsbHmuoPvfOnyCXj192DR2Izl+p6MU5BGnlNc1FTGAZdzSGnxippKjttgzDXNVGrFHWAC7FYe59xGvPxv37wDeQsRuKBOA41HjKAVblkhkdBlUfGNowkX2WlRtxn5bAzMlIvuGagRoVKJBcHio26uOO0jTYzQHL69k7itG0yhDoyfffvqkgx9jGDR9bwCmgw4rafFLH+wcMiiEOxzW+lClrvr0DqXX7igUIHBr3xTqPaoIrCTClTu3VVbvRAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA1PR11MB6757.namprd11.prod.outlook.com (2603:10b6:806:25c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Sat, 21 Jun
 2025 08:35:57 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8857.025; Sat, 21 Jun 2025
 08:35:57 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH 2/2] yaffs2-utils: update to latest git rev
Date: Sat, 21 Jun 2025 16:35:37 +0800
Message-Id: <20250621083537.35947-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250621083537.35947-1-yi.zhao@windriver.com>
References: <20250621083537.35947-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0169.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::12) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA1PR11MB6757:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ce88ef-3e67-45c9-d070-08ddb09ea4e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EK3vmOkkAs7SsPNkRmgGgnaUU2BtmBq5lnw22TETRp7YDbAHxBEm1/NoLGb+?=
 =?us-ascii?Q?29GITlTYSjLE4flEh0gtpvgdcNCaGm8OwasiK50aP0QZxBy2hz93OJlUzumb?=
 =?us-ascii?Q?QOWErDrhqwAiJpnFgQlL1sFT8M1SWrGMsQ80Tzn/8OrWH76RDkvKZ3vWSzs1?=
 =?us-ascii?Q?UBusiekEimQjx9dW4AgdcG0oHDHMOy1vKdv4LgYE0S8Vd65JW7waQaSpAy1S?=
 =?us-ascii?Q?VDI9E1W69vVkTrgE7xuk1xsaRV5aHVdyWSKPohHrz6+onTE/LXQYBcTK8sqe?=
 =?us-ascii?Q?Z2AEv0hN4hnIesN7bN7ZCX9PrYrXV18xtUk0WbAfHNIJxcETNsYCZQAcrU6o?=
 =?us-ascii?Q?LXvjYLEJ14PhIjAxn6dXrpspXhryKxdNFK0twaCA+5F4cAaLuyghqG2Ugn4N?=
 =?us-ascii?Q?sY2YnieFRUwFkDxa+ZEWLKKMR7VWFUdxjNXQC323vKBYieQ6XhRBAue3ko/R?=
 =?us-ascii?Q?c7jRNMxb0hYVnd/aNOBxok8buDTEvkfGUH0exY2qZSX58CGiGk57cVRgoU/o?=
 =?us-ascii?Q?f39E8tMcfch3sTCTNAHNKxES8nunoJwYQhFCQ0KJ1YI+XmwpxbGtWoritfxc?=
 =?us-ascii?Q?zaWb2Dxb8HB49VY9eOZjcwP+JK6N+Valr/YnL/IBd9wr8UHoEPyg60gmUksQ?=
 =?us-ascii?Q?t/FN3hIc/2TK8nGyA0iHAagNuiY6Pga/pGOGQMelvJyvNAeqWuPKBatSP5tg?=
 =?us-ascii?Q?y99fv9eWSbrYLbKv04Ooh+f0OAi1hs72oZFhevBoncwyiH1GJyFkiAC2BRvO?=
 =?us-ascii?Q?hBc0/j1OSEop5owph41A5p+syWvyZl/5TC4Ef2CpBzqeLcO9cDbZTiNmLLwW?=
 =?us-ascii?Q?snKdq2PQ/fPdrscftSdDzSvGgWH2d/imeosF5UeldEiP9m10d+OFjRuz971c?=
 =?us-ascii?Q?cYMWmmHR0Qu5bsA3hHP/7gFWS+U/U3bIedEHRSgleDDWDAmmqFAJuYfU0wyY?=
 =?us-ascii?Q?XShm2e2O/u+FBdm3nqunEpTBhYWqoEgg10eoyvTYFh8CEm5OsOCqrRrQA3ct?=
 =?us-ascii?Q?8mqauOi1H7OY5OMDKd5L4iboWix+z5s9so+XrqOYa17r+qVtf+y/C2/sWWHo?=
 =?us-ascii?Q?zUbvn1+tfxEslOyQaXeo1dkwKGXyy10pM7oxAbPOSIw55TVcP5oFDT98kEE3?=
 =?us-ascii?Q?8cqU5T5u3czssJeol36ygE7V8N4BKrbCddvQm8kQ0aPHarA6KtxFYIRTw3Ij?=
 =?us-ascii?Q?HJMqNzO5BCjtH8qOhKEm1VPuzcsYZ1KQLvpe1c0dqrYbRvJ64oAYdSFOXrts?=
 =?us-ascii?Q?Gm6S0mWenHAObwtXDNnOpUMc283d/3uOwm/CbqawILNfCpMJYokWGTxli6Cq?=
 =?us-ascii?Q?3+rrTSLcOrR4wEmH7AVvZk9XLTMnay2aLZeDLlBVbmUOZR/EgrUNYw0O10VV?=
 =?us-ascii?Q?VqfDM7bBDr5ODMYuKnd80dXN/6Vng+peHXKRSU08HSKp7TL7ZfztUx26wGOO?=
 =?us-ascii?Q?2FZ6ssdpvacXVAng8q39qbxRPI/qpipJmYdptzj1ZaOxXudVgkKy4xo71QvE?=
 =?us-ascii?Q?sudFs7H3M4nAK84=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yk9ekQsDKHLMzfTKk01T5PrtBFnKzxtlU+F+bgdsRC+MdudFsxN82tpExa7R?=
 =?us-ascii?Q?2ZX/vIB19+nTu33+BgtJMo8EtLGbbkhrqkanr2cfjTBFJs8/a5mzr/J+Y1cE?=
 =?us-ascii?Q?ANTgYDf6Iezck5eqniWBwRBiZjH5gZd7cjSW+opxnxyWfXTXZxWOPPq0OPme?=
 =?us-ascii?Q?OZgTFX7iHLPtrzsKgNnuebWLaS9oj/fszL2H+6bVmwbtWcYZV7ZanIC0xWjp?=
 =?us-ascii?Q?PYZS/JEXZlZ65VyyBVO/1aTZwY/4TI+EktDsVlHGMNg1aJNZOn3iF8rcCkop?=
 =?us-ascii?Q?js9RZ0DUTQnJdzd02k2WRc4XPi/4RNSL+e5fIJG9wUMh0uDWS638hovg7jwA?=
 =?us-ascii?Q?DL6zi1sCWxNuXNZCEj48pUuax6TmTAl7NulRGhjgm2uYuHHESrNP3/6xnShe?=
 =?us-ascii?Q?kgzqtmNH7dsp8sSW5wG4E2yKUfZQm9IkO/Pw3VRw+E9Q9y+PpN6lhZJKmOo4?=
 =?us-ascii?Q?CbD3uE/A0UmHcKRApYL7BWrqkXEZwM9AfJ0HJDI+HkZNvwny7Icua0jvZqwC?=
 =?us-ascii?Q?GA4wIIdMDJRM8mD9lsMrDruYJM6ek0Hlxv/sDcpjh0x5CYx56x7/G4gvvv8t?=
 =?us-ascii?Q?AJ2MRlqCFOB6AbN8wuYdO8ozfl3slZfsRK2dz+6G/8bZGBkwun5gY8OZ2jB8?=
 =?us-ascii?Q?Pddz1cFLjfAnG3rufljWLmV5v/zkijkqJSEHbLYJEVQwP+XCsS0D1aWB/FmD?=
 =?us-ascii?Q?FqA4YZoRTQ454N9XnQlX5Y6ZtHzYyFBoZgegY03rglq7KpZepasFvhk4dSvi?=
 =?us-ascii?Q?7/330D62K1Z3rzoY/134eHHhkTpY+w1jJoLMCld3/WcNTAJpBxPFSUh345Ne?=
 =?us-ascii?Q?FR1u/5yigZXBz0ug+qHlN7MLKOvwYu1rCP4GpelqWliCJRpJ4+93s0SoMT4G?=
 =?us-ascii?Q?5llkes44qhjNkkdzDZF1XHT5v8vgNYoca6E6QGB5k/U1w3LZjoUGmPFFm7Mx?=
 =?us-ascii?Q?OHYmbFJ031BsPBRQui5ZLNDi63mNTONAJEQ0zME4S+cc4eel0nRzh4JccOP6?=
 =?us-ascii?Q?Sc1IHwPJJ0YCyg2wC7YkzBwOn22LbPRUoNvJ5+eOI48vFhjyujbrnC4MRLbV?=
 =?us-ascii?Q?KrSuCqFRVTkWYwMqPR5is5hSLt3nd9mQe3ouEKLVvyONPWPQHwBRoemOYA4p?=
 =?us-ascii?Q?i38E53aOyjrY27EDMkiHS4LMfBDQbT5SUDrBW9SsDIXNDZvERYQkk18G+6Rw?=
 =?us-ascii?Q?xifP4MwpffxsbmaDJRAqPd9LWB98JM2cAgKhByYzPIZz3vF6o1rvFtvirmSd?=
 =?us-ascii?Q?WGLxSbtef5b22FfiLxPBhRCpAdxrtvIvdDYcKbH1ePgm+iRHG2tVWaxtUF6U?=
 =?us-ascii?Q?K84QD0bkVn7QsmX21bxpy0HuqZxg3gBWFgbRAtPVuRdMhQF9JPvC6fWpyo5j?=
 =?us-ascii?Q?skFKQ/SGZFfYVw5bGfSa9OGvqbXuaLg++Ftstl3QtY/Ql5XDBw8AyZG2DVt2?=
 =?us-ascii?Q?Rc2CNkGIBqgytSubR41rz7uxyGiIXnBtiUw52utnjeK8oWOnLFhYubGVSvPg?=
 =?us-ascii?Q?u6a6oyNfL070UjJb0cOl2p96VoiZqXuYTZr2diwymDs+GsfAN4d8NfsM0owD?=
 =?us-ascii?Q?GQZmGdpH8UhXRKtGPyS3Qaa6/03IRp5kNE9lCUZ1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ce88ef-3e67-45c9-d070-08ddb09ea4e4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 08:35:57.5930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGmp4NdWRvYfsnD9XPE/LYPJ/FXDRl/hBnRc785lLWz/4ZEFwO0wZ/qIk8nwzNksxHz9BsqIwZSnFwolkflBwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6757
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA0OSBTYWx0ZWRfX996rD6crQWgS L0gBVmq5d/kRxoElUjnnandRuFCEcSwOE9aLvx0RgwgNTrd/fSoJa5wDS+tkPIEReQb3+r8GGgn LUcXajFBMix4kBQWZHa9yOz5NNaRBu3mRACAiPAs3vLD9F5InIaNFE1vMsKpEvQ5ZUbJ8fUnVm2
 nF+v0Kq2Qr/yQrq6mIJsKFIKvuaXbeTFclKx7dZU/B2zNfyEHbfQghXYKLvKzsxH+aFSM/+C/LN dLZKV0ExaL9aburVIlgjYZTVEsNScjAbeIPmzskFwtWHXKVuXtYpSTObMQ/sCZWV6OtYTpJWCJj Np2hO0G6gUXflsQ2cJcgmy++0mEtnYAKfslY3jrqCHEtZN9fzvYtrrOBFLc/DhQxOLDurVDXtaf
 keJY0mUc7syw9Z156dtSEfosJvqujSVmzIrSKXpyi8rBU1ayhuQ45nvxmlxdXFxtHmHvaUTK
X-Authority-Analysis: v=2.4 cv=Qblmvtbv c=1 sm=1 tr=0 ts=68566eef cx=c_pps a=JdlQBdRp28aqpLEMyktm7A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=eUwK0HixZ3KTWcKcw8QA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: W9b-yhaTRT3ZLmYOwAA5atO_oAOvAbjC
X-Proofpoint-GUID: W9b-yhaTRT3ZLmYOwAA5atO_oAOvAbjC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506210049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 08:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117990

* Refresh patches.
* Add a patch to fix build error.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ....patch => 0001-Makefile-add-LDFLAGS.patch} | 15 ++++++--
 ...efine-loff_t-if-not-already-defined.patch} | 20 +++++------
 ...fine-YTIME_T-if-not-already-defined.patch} | 16 ++++-----
 ...04-utils-Makefile-fix-symbolic-links.patch | 35 +++++++++++++++++++
 .../yaffs2/yaffs2-utils_git.bb                |  9 ++---
 5 files changed, 71 insertions(+), 24 deletions(-)
 rename meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/{makefile-add-ldflags.patch => 0001-Makefile-add-LDFLAGS.patch} (53%)
 rename meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/{0001-define-loff_t-if-not-already-defined.patch => 0002-define-loff_t-if-not-already-defined.patch} (61%)
 rename meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/{0001-yaffs_guts.h-define-YTIME_T-if-not-already-defined.patch => 0003-yaffs_guts.h-define-YTIME_T-if-not-already-defined.patch} (67%)
 create mode 100644 meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0004-utils-Makefile-fix-symbolic-links.patch

diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/makefile-add-ldflags.patch b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0001-Makefile-add-LDFLAGS.patch
similarity index 53%
rename from meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/makefile-add-ldflags.patch
rename to meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0001-Makefile-add-LDFLAGS.patch
index bb21899eb3..ac38115952 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/makefile-add-ldflags.patch
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0001-Makefile-add-LDFLAGS.patch
@@ -1,12 +1,20 @@
+From 8393f9d64b4cead722ee1a7674da1c41b33cfdcc Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 20 Jun 2025 15:08:19 +0800
+Subject: [PATCH] Makefile: add LDFLAGS
+
 Upstream-Status: Pending
 
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ utils/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/utils/Makefile b/utils/Makefile
-index 710ebbf..6259893 100644
+index a00fa13..13e91f7 100644
 --- a/utils/Makefile
 +++ b/utils/Makefile
-@@ -57,10 +57,10 @@ $(COMMONOBJS) $(MKYAFFSIMAGEOBJS) $(MKYAFFS2IMAGEOBJS) : %.o: %.c
+@@ -56,10 +56,10 @@ $(COMMONOBJS) $(MKYAFFSIMAGEOBJS) $(MKYAFFS2IMAGEOBJS) : %.o: %.c
  	$(CC) -c $(CFLAGS) $< -o $@
  
  mkyaffsimage: $(MKYAFFSIMAGEOBJS) $(COMMONOBJS)
@@ -19,3 +27,6 @@ index 710ebbf..6259893 100644
  
  
  clean:
+-- 
+2.34.1
+
diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0001-define-loff_t-if-not-already-defined.patch b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0002-define-loff_t-if-not-already-defined.patch
similarity index 61%
rename from meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0001-define-loff_t-if-not-already-defined.patch
rename to meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0002-define-loff_t-if-not-already-defined.patch
index 6cedc3cb4e..24d1eaa596 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0001-define-loff_t-if-not-already-defined.patch
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0002-define-loff_t-if-not-already-defined.patch
@@ -1,22 +1,22 @@
-From 848717da4a28d33f8aa8f889377e61e6b1b8ae67 Mon Sep 17 00:00:00 2001
+From 72f923440fef3b875e5570094e4cf398a201521f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 13 Jul 2017 18:29:52 -0700
 Subject: [PATCH] define loff_t if not already defined
 
 Helps to build with musl
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
- yaffs_guts.h | 4 ++++
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ core/yaffs_guts.h | 4 ++++
  1 file changed, 4 insertions(+)
 
-diff --git a/yaffs_guts.h b/yaffs_guts.h
-index 6bcf12d..4af17ce 100644
---- a/yaffs_guts.h
-+++ b/yaffs_guts.h
-@@ -18,6 +18,10 @@
+diff --git a/core/yaffs_guts.h b/core/yaffs_guts.h
+index 74ded0b..4bd2646 100644
+--- a/core/yaffs_guts.h
++++ b/core/yaffs_guts.h
+@@ -17,6 +17,10 @@
  
  #include "yportenv.h"
  
@@ -28,5 +28,5 @@ index 6bcf12d..4af17ce 100644
  #define YAFFS_FAIL  0
  
 -- 
-2.13.2
+2.34.1
 
diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0001-yaffs_guts.h-define-YTIME_T-if-not-already-defined.patch b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0003-yaffs_guts.h-define-YTIME_T-if-not-already-defined.patch
similarity index 67%
rename from meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0001-yaffs_guts.h-define-YTIME_T-if-not-already-defined.patch
rename to meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0003-yaffs_guts.h-define-YTIME_T-if-not-already-defined.patch
index 98c27d2654..5b67ceddff 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0001-yaffs_guts.h-define-YTIME_T-if-not-already-defined.patch
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0003-yaffs_guts.h-define-YTIME_T-if-not-already-defined.patch
@@ -1,4 +1,4 @@
-From 05cc2b958090f96d6fa128da43aa69669625e529 Mon Sep 17 00:00:00 2001
+From 75fe0fbe254f63fe58d22f2d6090e9a8b3a6fe41 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Tue, 5 Mar 2024 12:03:23 +0000
 Subject: [PATCH] yaffs_guts.h: define YTIME_T if not already defined
@@ -11,14 +11,14 @@ Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- yaffs_guts.h | 4 ++++
+ core/yaffs_guts.h | 4 ++++
  1 file changed, 4 insertions(+)
 
-diff --git a/yaffs_guts.h b/yaffs_guts.h
-index 74ded0b..598271b 100644
---- a/yaffs_guts.h
-+++ b/yaffs_guts.h
-@@ -487,6 +487,10 @@ struct yaffs_obj {
+diff --git a/core/yaffs_guts.h b/core/yaffs_guts.h
+index 4bd2646..507bf16 100644
+--- a/core/yaffs_guts.h
++++ b/core/yaffs_guts.h
+@@ -491,6 +491,10 @@ struct yaffs_obj {
  
  	YCHAR short_name[YAFFS_SHORT_NAME_LENGTH + 1];
  
@@ -30,5 +30,5 @@ index 74ded0b..598271b 100644
  	//these are always 64 bits
  	u32 win_ctime[2];
 -- 
-2.35.5
+2.34.1
 
diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0004-utils-Makefile-fix-symbolic-links.patch b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0004-utils-Makefile-fix-symbolic-links.patch
new file mode 100644
index 0000000000..a07725446c
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0004-utils-Makefile-fix-symbolic-links.patch
@@ -0,0 +1,35 @@
+From 8349d121e3595ac4d935169150984260f8b697b9 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 20 Jun 2025 15:20:05 +0800
+Subject: [PATCH] utils/Makefile: fix symbolic links
+
+Create correct symlinks to fix the following error:
+
+mkyaffsimage.c:29:10: fatal error: yaffs_ecc.h: No such file or directory
+   29 | #include "yaffs_ecc.h"
+      |          ^~~~~~~~~~~~~
+
+Upstream-Status: Submitted
+[https://github.com/Aleph-One-Ltd/yaffs2/pull/13]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ utils/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/utils/Makefile b/utils/Makefile
+index a00fa13..22c2fdb 100644
+--- a/utils/Makefile
++++ b/utils/Makefile
+@@ -45,7 +45,7 @@ ALL_LINKS = $(BASE_LINKS) $(DIRECT_LINKS)
+ all: mkyaffsimage mkyaffs2image
+ 
+ $(BASE_LINKS):
+-	ln -s ../$@ $@
++	ln -s ../core/$@ $@
+ 
+ $(DIRECT_LINKS):
+ 	ln -s ../direct/$@ $@
+-- 
+2.34.1
+
diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
index fbb10add68..eab7029403 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
@@ -15,12 +15,13 @@ PV = "20221209"
 DEPENDS = "mtd-utils"
 
 SRC_URI = "git://github.com/Aleph-One-Ltd/yaffs2;protocol=https;branch=master \
-           file://makefile-add-ldflags.patch \
-           file://0001-define-loff_t-if-not-already-defined.patch \
-           file://0001-yaffs_guts.h-define-YTIME_T-if-not-already-defined.patch \
+           file://0001-Makefile-add-LDFLAGS.patch \
+           file://0002-define-loff_t-if-not-already-defined.patch \
+           file://0003-yaffs_guts.h-define-YTIME_T-if-not-already-defined.patch \
+           file://0004-utils-Makefile-fix-symbolic-links.patch \
            "
 
-SRCREV = "613a901a229e8a701c18f003dd0aee18453e0670"
+SRCREV = "68030683543cccb4d942e3fedbcad1dc267e261c"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.34.1


