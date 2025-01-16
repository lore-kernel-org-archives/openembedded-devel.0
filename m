Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ECAEC02180
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 13:45:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.49357.1737035114694235768
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jan 2025 05:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3111d49cac=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GD2q3R021049
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jan 2025 05:45:14 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443mt75e1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jan 2025 05:45:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgkjQeCDJ2/59W8OSohPnerZ9LXjy9a1Xy1wugSjmz0DQk/kcKJsDj1rYj53KigwXWeEaXx7Y0ceVCTafbsHURmFejoioZqQIPS8jGnqS2vyolAs/O9/XdI7u6bNHZtg2TiO8MZrZDtGbB70FOHgb8CqaO24FGcZl/He30SHJYpJXWufz5GA6M5HK7muJERuL14s8SDUC0in0AGfMlBYc1cW4wup+l/sAVf8MGBXiNFbTMbymAXm+FAFYs6BQ/B0ezhZKIoBIvexatV79MxHGPZRBveCKy8XGu2joCYBMUpmu/Pol0ZvOALovCD5RHoNfcPT6RzdO+eNqDFNi3qa0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwrZgxYkC+rgvaxy2Y/woLQqW1jaUDRpTk2pa0zNCiw=;
 b=M3nDey7Q4IMKOepeYjiza9lCZsnOItZJ+nGnfeYcxqopGCKJwQkdbol3Vxz2rBEza9OVtWIHCoaFc6JNY/lTMmNo95yddpy3R90g2FHaBl+buwI8tSY90xxPsgIgptSy593cgNhfwgSIkqIq+CbQ/rdT6HZkNt13IXd/WJzABkxSrTp2bfi85xCkEbccGCwAOvU443LZ1SjOkjBj3Nn3Elyq0+SFqSH7/Jn4Us+BjdT9Lq0lrl1VCGzceoiDwLwhtOAWngzkgZL6q7aHOg4yNOs30JHho4oX7FbrJcaYKTI5XrKWJfkTRPVIRzUmJtXVnt5d84qK3sRdwLRv7QGXOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS0PR11MB7444.namprd11.prod.outlook.com (2603:10b6:8:146::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 16 Jan
 2025 13:45:11 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 13:45:11 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 1/2] glade: fix CVE-2020-36774
Date: Thu, 16 Jan 2025 21:45:00 +0800
Message-Id: <20250116134501.348974-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR06CA0024.apcprd06.prod.outlook.com
 (2603:1096:404:42::36) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS0PR11MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d706857-bd25-43b7-b587-08dd3633ff27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zvNqPwCibm3lpa1xP3acwsM023Vomm7IpCJsTg9TFkBK0M9H5UxZMZHbTr9l?=
 =?us-ascii?Q?bB0YydGYHgCzn7Ia7fF3fgXwD4HfXiZXjmqC6agjWgMrjx38wS7/K41JzT+H?=
 =?us-ascii?Q?vwOsMeOD+X5cSb0h1UAPBBGQhozSB1ptolF1mBtKRFoVLC0zia64CnwzPuNX?=
 =?us-ascii?Q?RVVtdWiXSPgit1FU9WWUVRnlwsnhU9nPcrAShQjkuj+3JMB+MqFOIz2/e2fC?=
 =?us-ascii?Q?D1nJangDBvyyXOu0z8x696wIWaMsbkTm7C7cAxGuNAJXuB7FCydJzG3Q2xft?=
 =?us-ascii?Q?3yFr0+F++bwLdhY5ogAWcSG3o8gZ087PdXRO6QIFn6nT+e897fDFq3WbBwyc?=
 =?us-ascii?Q?kcxQF8FwBf89NiP8DfH85BlCG/rqdfcBHotNmJkWjg/jDgQS9BZfPS4kCnAP?=
 =?us-ascii?Q?VnmtlHNNcJF+/CJuERWezV+px4q3rEQF+yGeOjtZ4/Y9VVjJROtUAylWjdXv?=
 =?us-ascii?Q?/gbT1nfO5bo+5G7Yy0sdsB+360uMRY/d8Xct87urPqPgB3/A15AyvsGWhI9G?=
 =?us-ascii?Q?kKsAtqnOnuVGxP4bDT1O1B4UWoCiEDNutyE4M9S1PP+6ZiVscdaMXkgSLczz?=
 =?us-ascii?Q?HjX0okfD9+QjqnuQZlTv5IvYSoT6Iw3b8I0pGmqETm+sn3dct7q+TktwKC79?=
 =?us-ascii?Q?JlmCoyExYlPnMwlBrsv1aU5Bsf+KwYj6PmmEj6WXpKHFNe2mBLVX9HgQXYuj?=
 =?us-ascii?Q?bVVTpLHVrtcSOV48NF+xtMD5Ajqpacx1TU7XVXFdJ6W/6+enmQtPUkrgtGRs?=
 =?us-ascii?Q?p8K5KuppFL5yH1YqdRGyW0ynt/yq6eP2JqPAuoPse6fO7/ZH5WC5YVVxM048?=
 =?us-ascii?Q?ra1bHIcqTJtJBDc/Jnwsh5vWbsjwwLOQlnktE2rKI1fvvxdAOvpJI2Y+bSMn?=
 =?us-ascii?Q?/2+QnotZVWJkp2uocPLkWk8mdU6ER7j2fYod/0syHV+Y+aakvhp9lsc33/qr?=
 =?us-ascii?Q?84L1b/scSFeZS35mQ1rfliSgfeUFMqnDcnrW+Cm5MYXojAYIBXNCGsQ8MZGF?=
 =?us-ascii?Q?bms0AtL3ZGY0CxWtmm6y2YEy1FArNDD7WsQb11xid8/BfZL7iNwZk+LMQ47p?=
 =?us-ascii?Q?CwK02GdBmmLJpBvD1+T2pWXjDcxNBZx9SJ6MYPjGvA5T7oLrbySSpOfmh9LO?=
 =?us-ascii?Q?WLIwI1pljDHTCcTzPIeOIJGm+8j2cLiOQXH0HgQz/9a8jc0WeBsEsoiotvcd?=
 =?us-ascii?Q?wedEdWZHs85w5NJwklgLtKC79nUIQfLsrHC8N7kynY5oaChSXNjI0yRU0uCs?=
 =?us-ascii?Q?1I9iUd8M72cjqLEdYLPm4knmmEga/gnwGi+CHg2WE3gboHIjyuMOwv9xVTLa?=
 =?us-ascii?Q?Hz+AhaOW7IpQcQlVg3OenqAZUlxXyAenu6mRSD1BVHiD4XR4Yd2alXznVhgk?=
 =?us-ascii?Q?VG+NSdnk0owvWnMYnRWThc/yaBAxt2KUk8GojMAdC7ONqbFxaQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U5/waQF/uqs2NW+4qGbQ0o51vHuMdFWVfs1ttup0o1uG4YCi1VRJ66C8SSIs?=
 =?us-ascii?Q?RlE/I9rsht9mhyNeRqdOo7xBy0tcj3ht/rh/gTJGFBrMbY7AJp7kdUSM+sJJ?=
 =?us-ascii?Q?aUkVFsq7NrRU+eEtHHYJiPZV4p6WJttrcFzruf3ECxsCULUwWPy8V/+Lic/+?=
 =?us-ascii?Q?A9HWHmcnPyhxFjR71aNCPEv7eH+i3WTxQRvS956cWATKyfvgQrN3QxV2fRZc?=
 =?us-ascii?Q?BuUZNtyIm8YXyBPiqPPMwCSxpj/QA2yzQnbKz16mcqhTD6PEV13tcREkBV3+?=
 =?us-ascii?Q?aMuwYijDUCfQSjZLleX6JbnwjQe5CXY5huXCUkGsPTV3A0teK8TAInUv3P6a?=
 =?us-ascii?Q?s5gWL0NYTPcpI6+7/omdVvwXx37u4z3YWDVGFh1OXYFs52sUsB9MWem7g1rJ?=
 =?us-ascii?Q?RmOovlzt7bttB/MTzu091yZ55Q6V87642GYYmRMlTLVGxRmWdQgYjcKFI3Ow?=
 =?us-ascii?Q?7wA4bHS3gSX7H8mx8/X6joPUZCiajZlkcGVlYQF8R+9lVW9SeYDjil7fCKPp?=
 =?us-ascii?Q?ZWLHxbYggC9Nb2SL1jAq0LvnrCzgRfxaG7324NhdwLSYF4DZIzLl5o5P0WvO?=
 =?us-ascii?Q?Ae7lA//g35fC6+Z3A13M8tFWdf325Q7Zo3en6MyrILIHyY46OWWYcw1om7ok?=
 =?us-ascii?Q?sYwKMcJZq7cVMXLS6nPI7OGj8ipfUKKqG0ZsYK25vQUO50unk6AHZDBeBuE9?=
 =?us-ascii?Q?+0rGEXBp4PVq7Wd4EHJ1/MJaAGyPphvMBm9mjpt3kdADf5+pNqOXPDn8kPKI?=
 =?us-ascii?Q?1H4QiGjgWctnadCyOKP95IfmvWbwScT0p6WbFZLwhdyJokzkzkUFIlaGIX8T?=
 =?us-ascii?Q?FQpzCa1wb8cMfcd1TR6/DawlYvX9X9xGMLgqYMlSYUejOAPTm0hV7w1OCM0J?=
 =?us-ascii?Q?wJh89ILdOl8+wwPHubrlhLqtDNYKYlbUmNrLt11N+ZDYxUtmlLQ+VCBIl1CT?=
 =?us-ascii?Q?AC9vVhmf5R/2L+kuxFOb4kLQs2CgHyZE0rDdYb40QJ3i8Vborsefb4LCFN5F?=
 =?us-ascii?Q?Vcs2FpYQjROYhP5F0+kXtBNdGWsVAm1i7zxNhFcj47ojEiZhNqiHVJaffdux?=
 =?us-ascii?Q?1KppNLnL5ZLK4qEUu0yn73Q2O0Orf0WULg6+mtnbbLjR06jQqWRwGJzs0oaX?=
 =?us-ascii?Q?A8Sf+7njmDq+XLvYkzkuXweMxkteoOeYZCH7Q15y6AgGT7P+vu45Mb8R4gBU?=
 =?us-ascii?Q?tXVV65G/4Gh6OoeA+s/CtfgBCdXAj0EqJOxzBWzaMak6Q0I48fc0oyWBGQBp?=
 =?us-ascii?Q?PtpTfIuv1Pr4SxbYB1QysztOyD/pOwq0DdppLnYbtfKaUOxsgwnkX0ezX9Rz?=
 =?us-ascii?Q?vvaFD4CpRobmttEtIqUH7OqP/u6Zwke/JKGy4uIjTpfpcXDyC1mmUQuHLPet?=
 =?us-ascii?Q?CCkgfbK5856ZmLpRkKpB8Ste4VchU76sQ5cvcCrkErNwqd8/P5h3gVoDN2pu?=
 =?us-ascii?Q?T1MinJvNp4CtHfgSJc4LOw9LDCPo3qim4NaHeBZAeCCJts/YvsSqMp99aTG+?=
 =?us-ascii?Q?xj1mwK36Pfkck+DjR6J/QYbgF5pZT9d8DDuWqUR3rzM7hKqXnvIrAIgDiRoJ?=
 =?us-ascii?Q?VolyQmY7HUzhcrlK4bWbcxKWr7/T2QEIyqriZpRioc42vwhJiT765GxX+uNP?=
 =?us-ascii?Q?2A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d706857-bd25-43b7-b587-08dd3633ff27
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 13:45:11.0142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RIciFZXYp8DspGMKdLJS7fJM3mJr6+wsNVN8KUXMNp17UDz/wkxK+tHDEKdCvRkOckV0npJ5sLP8YArChJdyjIODk9350Gg+VbcFXHcT+LM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7444
X-Proofpoint-ORIG-GUID: KBuxbdFoKmKbu9GweMeadHEMiK4ZrdFX
X-Authority-Analysis: v=2.4 cv=SeoNduRu c=1 sm=1 tr=0 ts=67890d6a cx=c_pps a=+kc2f53xTGsvuL7uaCOpcA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=PYnjg3YJAAAA:8
 a=GHR8O2WEAAAA:20 a=n1dRnMMuAAAA:20 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Vw2-W0St5DFLPkctPREA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: KBuxbdFoKmKbu9GweMeadHEMiK4ZrdFX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_05,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501160104
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jan 2025 13:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114913

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2020-36774:
plugins/gtk+/glade-gtk-box.c in GNOME Glade before 3.38.1 and 3.39.x
before 3.40.0 mishandles widget rebuilding for GladeGtkBox, leading to a
denial of service (application crash).

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2020-36774]

Upstream patches:
[https://gitlab.gnome.org/GNOME/glade/-/commit/7acdd3c6f6934f47b8974ebc2190a59ea5d2ed17]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../glade/glade/CVE-2020-36774.patch          | 54 +++++++++++++++++++
 .../recipes-devtools/glade/glade_3.22.2.bb    |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch

diff --git a/meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch b/meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch
new file mode 100644
index 000000000..5049b44e5
--- /dev/null
+++ b/meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch
@@ -0,0 +1,54 @@
+From 7acdd3c6f6934f47b8974ebc2190a59ea5d2ed17 Mon Sep 17 00:00:00 2001
+From: Juan Pablo Ugarte <juanpablougarte@gmail.com>
+Date: Fri, 2 Oct 2020 16:08:23 -0300
+Subject: [PATCH] GladeGtkBox: fix glade_gtk_box_post_create
+
+Some widgets with contruct properties like GtkMessageDialog get
+rebuilt right after they are created on project loading so we need
+to check glade_project_is_loading() intead of GLADE_CREATE_LOAD
+and use the object ad the connect data to make sure it gets disconected
+if it was the object being rebuilt
+
+Fix issue #479 "Glade 3.36.0 segfaults when opening a file"
+
+CVE: CVE-2020-36774
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glade/-/commit/7acdd3c6f6934f47b8974ebc2190a59ea5d2ed17]
+
+Signed-off-by: Peng Zhang <peng.zhang1.cn@windriver.com>
+---
+ plugins/gtk+/glade-gtk-box.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/plugins/gtk+/glade-gtk-box.c b/plugins/gtk+/glade-gtk-box.c
+index 0c157a6d..a0252b6a 100644
+--- a/plugins/gtk+/glade-gtk-box.c
++++ b/plugins/gtk+/glade-gtk-box.c
+@@ -58,9 +58,9 @@ glade_gtk_box_create_editable (GladeWidgetAdaptor *adaptor,
+ }
+ 
+ static void
+-glade_gtk_box_parse_finished (GladeProject * project, GladeWidget *gbox)
++glade_gtk_box_parse_finished (GladeProject *project, GObject *box)
+ {
+-  GObject *box = glade_widget_get_object (gbox);
++  GladeWidget *gbox = glade_widget_get_from_gobject (box);
+ 
+   glade_widget_property_set (gbox, "use-center-child",
+                              gtk_box_get_center_widget (GTK_BOX (box)) != NULL);
+@@ -87,11 +87,11 @@ glade_gtk_box_post_create (GladeWidgetAdaptor *adaptor,
+   g_signal_connect (G_OBJECT (gwidget), "configure-end",
+                     G_CALLBACK (glade_gtk_box_configure_end), container);
+ 
+-  if (reason == GLADE_CREATE_LOAD)
++  if (glade_project_is_loading (project))
+     {
+       g_signal_connect_object (project, "parse-finished",
+                                G_CALLBACK (glade_gtk_box_parse_finished),
+-                               gwidget, 0);
++                               container, 0);
+     }
+ }
+ 
+-- 
+GitLab
+
diff --git a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb b/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
index d11751a4b..4a1c5fc8a 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
@@ -17,6 +17,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade/3.22/glade-${PV}.tar.xz \
            file://remove-yelp-help-rules-var.patch \
+           file://CVE-2020-36774.patch \
           "
 SRC_URI[md5sum] = "c074fa378c8f1ad80d20133c4ae6f42d"
 SRC_URI[sha256sum] = "edefa6eb24b4d15bd52589121dc109bc08c286157c41288deb74dd9cc3f26a21"
-- 
2.34.1


