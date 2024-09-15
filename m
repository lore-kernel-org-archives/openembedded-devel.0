Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F20C35FEC
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 12:52:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.113924.1726404739633843612
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 05:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9988d41e42=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48FCYMsa018016
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 12:52:19 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41myq1s1y6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 12:52:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZGWoFb6i5Eo4FbTYWOrzq9YucO4tG87h3UuqUVtJnK7XtjlBYZCch2vUvNw9eWtA3hi9QeuGu+EZJhfl9fvrxyAqmBN5B7nlgcsfhTn1uCajGHFQAwvZSnda9c+WChcXHu0P79t2watjp0+BrON5dfK8MWZd8JuadMWmh9zHSV606iwLAANcOHUsxxiIvw5Yb87vd+VjJ1ArNxnxu9XHHSFEiZx+4VJoKLL0H9rv7y+sx+uTztRo4OZ8xLZE+BGLBStVYx01wQmczR1RNPDCJAs1iIx/Hi9t092EiF1Nn1XDl+n347v5ybF5lNM8viwM7WzYD+OpWTI9dKZAVWqcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAJsp+gsYVDp1H5hXjhHj9wLf9nrWrux63IcpEmDM7U=;
 b=UbGiiBevqyDr0VCjOAcjzJYYYzLhce/7qDipUvwo2ZFNm19GQ2Ts8ETu38vFWVIDMPdcTFFCJk4vU7HsYJhozxtcxANspMOQk/4V0Yo8uJ/4FuhSqolMEgjLPQFyOZM4YQFoA5Mv79NFnpvoixVge3KgO4iiWQk8GljDyKVxA329BKGOtKhT8eww78I48Ik97qZ0uDIIuuqKIxrFYyx8E2lskhJgalQ5ADtoBBRw047GiBQjb+ir2WKqqo0zCXryM5PaTHidAjUuPimDfGB5zXqKPGJRZnhdX9U8OuzDfY3GFxCO256jABd6BSLVSWjGk7+MsPAdvSDm2lRxZC0ZyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 BL3PR11MB6314.namprd11.prod.outlook.com (2603:10b6:208:3b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Sun, 15 Sep
 2024 12:52:10 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7962.022; Sun, 15 Sep 2024
 12:52:10 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/6] netplan: upgrade 1.0.1 -> 1.1
Date: Sun, 15 Sep 2024 20:51:50 +0800
Message-Id: <20240915125153.2940806-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240915125153.2940806-1-yi.zhao@windriver.com>
References: <20240915125153.2940806-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::19) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|BL3PR11MB6314:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b4c99c0-138f-487f-93b9-08dcd5853672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XvuXSM4M5ysoGf3EF/NY96JRHhshTUB4534qNrphK+TIeWAfepHSGtpeRIzP?=
 =?us-ascii?Q?z8ARgDCXshzwdAqxk0IsAQKkqokzGBm9gJtQ5XqLZJkAQSpXc8liyKkg/VqN?=
 =?us-ascii?Q?DbJoKxJZzM9r9tWAaQbPBGRKXXHxLA8buQNoESkyyiprBwiNRknJ/aqbnyeH?=
 =?us-ascii?Q?7+ZvAffAFaG36Ak5PBmcO5kdLdE9D8sc6ZJJMflMMzr/ZIg9N/23jIip7/28?=
 =?us-ascii?Q?0Nxyc4ayTlM3P8clngikmKlCqw8uo8IPy1PVKQpHXlrmKviBQapd50I8XK4y?=
 =?us-ascii?Q?IL9CzMDdyy4ucTlFIMjKj2Z9dCKwoHYKK2RnYToBb/WSuiQwvCHY2pA0Xpos?=
 =?us-ascii?Q?F/oEL8hJ+kWXqI8bBtVl5WvBBrtzSsWakNzt4ZDOxAE2dTEVn6nUreOAQEKq?=
 =?us-ascii?Q?MVTr2u31AU5SkjWBPjwGZ3O6S7M8Wzw2lzUVU4HQEC4O6rv1e+Gw2VBUO7pf?=
 =?us-ascii?Q?PY4AJk4thsURIrW4I+/mVQXh1KFRm91KjaIx+xee4zfVfioJYDGhMn6gPgyx?=
 =?us-ascii?Q?Q2ZktjJnP6mFzO6bOufZfQB3L0WP3u37GoAvCEhUxOleRSLfl2FRIXPTbybq?=
 =?us-ascii?Q?3X+t/5aXX8mNMNfAhdLPc3C3QzEUSfXlykZbSobIrLunaOrBEXtkB9oYPrwv?=
 =?us-ascii?Q?DJ0K/esYkZH7fimbUAYuwobBcFxxW/Y4sRzXODyMIsPq3Qe3uIqBejQA7Kgv?=
 =?us-ascii?Q?p62HMmQ4BNOrj4/opgXp+3U32p+pb4UuwsuyEOChktENtJr0qtox9dcOZBlj?=
 =?us-ascii?Q?zKa701mw1Sca9gFvgZVMh6SCNFNHoGey19p4HYgvL28c7aHXI4pW51MNSLMK?=
 =?us-ascii?Q?pu0t5ORImpl8+vRBEMnJoVp79G9BiiZku2aC39bO4Xf8K4YA/We4cK/kxmDz?=
 =?us-ascii?Q?/OFa95OMmvUDPQT//6vd0/Wk9CmuKD1Nc4qYJExJIWxT0qKD+0WZkxRitZJM?=
 =?us-ascii?Q?BhIEhbR8/xJeaFBCU4IkT3oJQ1FLrxBKhAbHweUgFoPfkzUlU8m7HbZOmIja?=
 =?us-ascii?Q?fh3BTVUUtJ6sllV77hPoyCBWIsPRXPAtPOyh6w+Ul1lnuPbDOLLqCBloYVGX?=
 =?us-ascii?Q?H7hXEiU0WP5Agjy1tVcIDQfXWQsBrz7KryfuI/MrIOadGGmO0aDGEQShHwpf?=
 =?us-ascii?Q?HTyNj/pIHwIHF+AkNr+OJMIO0HHDhIaVN8sSBEZJxGFz5KE9lejah6Qe2nRi?=
 =?us-ascii?Q?WGEQYuxPQGl76GgYVgxLJAjZWJooHGtgnx6ub80n3e123hwwfcx0/cHvQRPR?=
 =?us-ascii?Q?otEsn57fJbu1lpV2F4Nr4rL97dbAoE/1voi5lZ3L5gaBd/cUGyi98cNo18lK?=
 =?us-ascii?Q?cM82ZSRWQcDsObqW5vtXEjhmPAVbNH/cxas8iROGDOFr6E4u68rmEGoQi33k?=
 =?us-ascii?Q?/WcP9nU3ogQyx/fbN8Sj9Txl/adi3UCRWvj/AMHXWVQoHwI+Mw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?icO4wXLJkF7XmhgaUnGIFjiCz7EIozvJOC0Ww4Gpx6YRgr/0bhkJFBZ6FIpH?=
 =?us-ascii?Q?q7Tm4/NQ3DvWj1mqB4aWGDs5wLYmG8qx5e7bwobmzdJpulOQqZiRIA5jxJr2?=
 =?us-ascii?Q?dn1+QxA/h3+yNzrh8v/Vcod5SWwmHXdXzgMzA+S6GAv1cW575fxOYwQCtfJU?=
 =?us-ascii?Q?ouyvnpF0O2SCuUjRgMPBbKsA/K/DkRTv4Xj0Np7Dl81nGkmAaQYfjEwPVMT2?=
 =?us-ascii?Q?pXXuyjPttdGEYvebkf4JW3pDjWbiZbqsTumpzCvVSkStLwfaoB/ZafIt2kCK?=
 =?us-ascii?Q?S1+S0Q6Mqkizi7U13PvF1fSdsnVVeKSdW5i8x7/Uley5rnpDnr6FGbMrlYl8?=
 =?us-ascii?Q?1pWtcIysrym0R8uwv8jJ2wJnUC9HM4+946ESFgwcqpCc1PE7ziKc44W6G4vO?=
 =?us-ascii?Q?EJm+TQMdGGr/xQmzlk1BQ4cOFBUV5s9YjACbBEbPSqzm3PAKPyzv5UI08CuI?=
 =?us-ascii?Q?2qFtnBCIAlXdKVPHh0VMx9Ulxj4TWRQ5kee33LJu3iJLT/yJeKt/lsDFshGh?=
 =?us-ascii?Q?Dg3Y48P/LFlROyCV0FpGBbkW7vKPyLZXOpeGPrGy7TQa8wxHZW0lFG9TDGoL?=
 =?us-ascii?Q?cdq2iu/LPrQWwzU5nH5sldz5yoZk9R+7+pBfwUXHwqu1V3QDZ9JfPGwnS+ym?=
 =?us-ascii?Q?+sEn7TD7YiY3+guFTY0Brjv8tRBhz0b2SPZvQA38PrpsrpB4eUggnA5u8XUU?=
 =?us-ascii?Q?Tpj072jhFR/MmkhW1MVIbLbi6VJVS+l5ofdvyL9Zb7El5XIk0qXbSIlqpX71?=
 =?us-ascii?Q?4jC8jevuFxW4LHZSJnIB40hxZ6+R1XX+1e2CSCXhGpJMHQGuqFqhZ8pEqyo+?=
 =?us-ascii?Q?tZKQIxE2hpu3ioulgBjJTtGtSYgnFWytMT44QBDS6tIszhRPr2cc6AGLUxEK?=
 =?us-ascii?Q?KtWlYFGyvvJXDAbErh6p3kWvi0ipLQy3Og6D6g0hf/omeUwG97WyXBmz8+VQ?=
 =?us-ascii?Q?Bc+MCA2qxt1L/hI6mdt2DKTf2LQnKWe2t1P9+ZUdhMpfa/WnGz3z/CgMa7mo?=
 =?us-ascii?Q?AGVZ/mIUAciRdH/nTeFv4ZbOwXtc77/5GgX98M0DqEtWku1SuT9IrQCwkAGi?=
 =?us-ascii?Q?jTqBrwytTQRnNSx8e8yirRo4f+0cUnI+297NrjjMOCwTD0l19Iyp0xtT2hQm?=
 =?us-ascii?Q?Zjh+E3S20cxtYxKQaRSovsnghpFd7CvEHcuMZD6oyymNgech67FSrxD3ce0H?=
 =?us-ascii?Q?/D/7rsTHfQCIb9pA70Q7hhur7lbvX0d+7aMV8AzX26wBvjVIioDm4anfy9Yz?=
 =?us-ascii?Q?cOJfo7QzlmcJuWSZuC1HAMRwk4TBGdzOfFXs4wEwoeDAcmkxk7wAVEW12jGi?=
 =?us-ascii?Q?ZrwN/bH0rldHDYZstIK5itJHrKWu+p/wVmqhME9BK8/MFWlny5XbielUOxkX?=
 =?us-ascii?Q?qBQQvsqx3kai/M668WjNlYgidzZfVIX3WXEjuBV9ZRJAfRXN4615XmBgNU1r?=
 =?us-ascii?Q?K7FmiKAwLCoJLNTqtzO3bicrh1wGZgjW571UsJTgrsMRALtK34u2OKpWlpqx?=
 =?us-ascii?Q?w6BFp0uyxFxK6jPPkkS919Uwkxd6218z1XAjgDTmY/TBP1ouTd3nN08quB+k?=
 =?us-ascii?Q?CFLR5p2MMpnmuMpozI8I8lOYlOaOyGipFNtAkwEH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4c99c0-138f-487f-93b9-08dcd5853672
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2024 12:52:10.2268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFDl3DGuy4gZNOHtJzQn5Z6AJQ5anAvoeopU1z7CfVH4Iga3mjZY8RbHC14DPoUpwHjgCZF0bzaR1sY3nAk4pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6314
X-Authority-Analysis: v=2.4 cv=MYM+uI/f c=1 sm=1 tr=0 ts=66e6d882 cx=c_pps a=Dwc0YCQp5x8Ajc78WMz93g==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=uPZiAMpXAAAA:8
 a=ov4endMs8s_DVNq50VAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: lhbKBpFCbTsoOEjISXnqYsU9wD4nAwua
X-Proofpoint-ORIG-GUID: lhbKBpFCbTsoOEjISXnqYsU9wD4nAwua
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-15_04,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409150098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 12:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112294

ChangeLog:
https://github.com/canonical/netplan/releases/tag/1.1

* Drop the following patches as the issues have been fixed upstream:
  0001-meson.build-drop-unnecessary-build-dependencies.patch
  0001-networkd.c-define-scope-specific-to-case-statement.patch

* Set build option -Dtesting=false to skip testing.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ... 0001-meson.build-do-not-use-Werror.patch} |  0
 ...-drop-unnecessary-build-dependencies.patch | 58 -------------------
 ...ine-scope-specific-to-case-statement.patch | 47 ---------------
 .../{netplan_1.0.1.bb => netplan_1.1.bb}      | 10 ++--
 4 files changed, 4 insertions(+), 111 deletions(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/{0002-meson.build-do-not-use-Werror.patch => 0001-meson.build-do-not-use-Werror.patch} (100%)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-meson.build-drop-unnecessary-build-dependencies.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-networkd.c-define-scope-specific-to-case-statement.patch
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/{netplan_1.0.1.bb => netplan_1.1.bb} (78%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0002-meson.build-do-not-use-Werror.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-meson.build-do-not-use-Werror.patch
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0002-meson.build-do-not-use-Werror.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-meson.build-do-not-use-Werror.patch
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-meson.build-drop-unnecessary-build-dependencies.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-meson.build-drop-unnecessary-build-dependencies.patch
deleted file mode 100644
index 860451d97..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-meson.build-drop-unnecessary-build-dependencies.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 6a1a24eb0f30002a4b0049d6cf38d3f2bc3c0209 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Wed, 6 Mar 2024 19:27:15 +0800
-Subject: [PATCH] meson.build: drop unnecessary build dependencies
-
-The pytest and pycoverage are required by meson test but not for
-building. Mark them as 'required: false' to get rid of unnecessary
-build dependencies.
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- meson.build | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index b29174de..09421d99 100644
---- a/meson.build
-+++ b/meson.build
-@@ -25,8 +25,8 @@ bash_completions_dir = completions.get_variable(pkgconfig: 'completionsdir', def
- # Order: Fedora/Mageia/openSUSE || Debian/Ubuntu
- pyflakes = find_program('pyflakes-3', 'pyflakes3', required: false)
- pycodestyle = find_program('pycodestyle-3', 'pycodestyle', 'pep8', required: false)
--pytest = find_program('pytest-3', 'pytest3')  # also requires the pytest-cov plugin
--pycoverage = find_program('coverage-3', 'python3-coverage')
-+pytest = find_program('pytest-3', 'pytest3', required: false)  # also requires the pytest-cov plugin
-+pycoverage = find_program('coverage-3', 'python3-coverage', required: false)
- pandoc = find_program('pandoc', required: false)
- find = find_program('find')
- 
-@@ -75,6 +75,7 @@ if get_option('unit_testing')
- endif
- 
- #FIXME: exclude doc/env/
-+if pyflakes.found() and pycodestyle.found()
- test('linting',
-      pyflakes,
-      timeout: 100,
-@@ -91,7 +92,9 @@ test('legacy-tests',
-      find_program('tests/cli_legacy.py'),
-      timeout: 900,
-      env: test_env)
-+endif
- #TODO: split out dbus tests into own test() instance, to run in parallel
-+if pycoverage.found()
- test('unit-tests',
-      pycoverage,
-      args: ['run', '-a', '-m', 'pytest', '-s', '-v', '--cov-append', meson.current_source_dir()],
-@@ -143,4 +146,5 @@ if get_option('b_coverage')
-          priority: -99, # run last
-          is_parallel: false)
- endif
-+endif
- 
--- 
-2.25.1
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-networkd.c-define-scope-specific-to-case-statement.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-networkd.c-define-scope-specific-to-case-statement.patch
deleted file mode 100644
index 9f01108a2..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-networkd.c-define-scope-specific-to-case-statement.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 6e3dd61bf90a7ca8c36c5b95943cbff7c1ad3c2d Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Wed, 6 Mar 2024 16:12:31 +0800
-Subject: [PATCH] networkd.c: define scope specific to case statement
-
-Per [1], define a scope specific to case statement to fix build with
-clang.
-
-Fixes:
-../git/src/networkd.c:544:13: error: expected expression
-  544 |             gchar* first = g_strcmp0(def->id, def->veth_peer_link->id) < 0 ? def->id : def->veth_peer_link->id;
-      |             ^
-../git/src/networkd.c:545:17: error: use of undeclared identifier 'first'
-  545 |             if (first != def->id) {
-      |                 ^
-
-[1] https://stackoverflow.com/questions/92396/why-cant-variables-be-declared-in-a-switch-statement
-
-Upstream-Status: Pending
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/networkd.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/networkd.c b/src/networkd.c
-index 25121c48..5eb9c0fe 100644
---- a/src/networkd.c
-+++ b/src/networkd.c
-@@ -541,12 +541,14 @@ write_netdev_file(const NetplanNetDefinition* def, const char* rootdir, const ch
-              * and, if the selected name is the name of the netdef being written, we generate
-              * the .netdev file. Otherwise we skip the netdef.
-              */
-+        {
-             gchar* first = g_strcmp0(def->id, def->veth_peer_link->id) < 0 ? def->id : def->veth_peer_link->id;
-             if (first != def->id) {
-                 g_string_free(s, TRUE);
-                 return;
-             }
-             g_string_append_printf(s, "Kind=veth\n\n[Peer]\nName=%s\n", def->veth_peer_link->id);
-+        }
-             break;
- 
-         case NETPLAN_DEF_TYPE_TUNNEL:
--- 
-2.25.1
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.bb
similarity index 78%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.1.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.bb
index 2b1a4ffda..40d72caa0 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.bb
@@ -14,15 +14,13 @@ inherit meson pkgconfig systemd python3targetconfig features_check
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 
-SRC_URI = "git://github.com/CanonicalLtd/netplan.git;branch=stable/1.0;protocol=https \
-           file://0001-meson.build-drop-unnecessary-build-dependencies.patch \
-           file://0002-meson.build-do-not-use-Werror.patch \
+SRC_URI = "git://github.com/CanonicalLtd/netplan.git;branch=main;protocol=https \
+           file://0001-meson.build-do-not-use-Werror.patch \
           "
 
 SRC_URI:append:libc-musl = " file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch"
-SRC_URI:append:toolchain-clang = " file://0001-networkd.c-define-scope-specific-to-case-statement.patch"
 
-SRCREV = "3a7516aadaf864ee9d04727977d3d9fd1bccbbda"
+SRCREV = "d27f32305f7f06de449b32239a89969e6ff2be31"
 
 S = "${WORKDIR}/git"
 
@@ -30,7 +28,7 @@ DEPENDS = "glib-2.0 libyaml util-linux-libuuid \
            systemd python3-cffi-native \
           "
 
-EXTRA_OEMESON = "-Dunit_testing=false"
+EXTRA_OEMESON = "-Dtesting=false -Dunit_testing=false"
 
 RDEPENDS:${PN} = "python3-core python3-netifaces python3-pyyaml \
                   python3-dbus python3-rich python3-cffi \
-- 
2.25.1


