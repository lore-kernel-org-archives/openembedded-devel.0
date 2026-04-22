Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A8D1F9B61A
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 10:54:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.79931.1776855259243475249
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 03:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8572cb5ccd=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5KviI2962142
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 03:54:18 -0700
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012027.outbound.protection.outlook.com [52.101.48.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dpenxrtp7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 03:54:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rvat5q7brLj9i5MuZwl5wMJ4Kd/SqyVU9vntO13PGK9+2lGyzAkbJz0qI9uqUcTvXUeGpkn9ImROtrU0e3jm9qQINZb+G8cZx9BpSseJkm2FMt0Y/tcr92k7Dz7bZ7oG6EmOJ5mM4g7jrRURmkh22PeO5mFARpVpUa7jQEYd89YXbxkNJYHN2ydDjgALSKFlzjP3wpFH6bSkyKbW9AUjjEN4EVCnlqSIMXWZbKEr62y54EB+Zk6KL/OQYRfifsx+rT1V8tnuPWrOUw3FNahPl36aT+0DDUN4rDPp5nrzgagb3CbiKFbdQk9Fqprsky3Rup9ZVuGEmXvCENjcwOGFYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOoHMLP111HvR1N/e+OEp29YoIKlG6e1HNudGUd2Grk=;
 b=Xr3IpBJkqhd4GQaJQ5UgSrVx9kC0elf539dTQg8q9rjQW2LN86hphl+DFly8Jku3bxD0voMHrBAZprh/8M7A6Rnuw2cvuPW8lmI4Pg7aKHgF3TxLO1JZp5qHoLxNMPQcZrpelLyFIyN6C4Pme6fbzYuzYOtxyQ4MVCLCL4NQ2E1Rf0N5FFhJB7xfq1Vs+CUpDSU1HNhZV+op8goOwzgSl3vtYRRzjrdZncsz4jxenPi0JY8jXyvlaFO9tqkLz4c2cm7BS+TFZy5H81Aslila31YVF1qTlqPb5VgMSAHFlsdWx6y/jEISuuceewwN6rcoWWQNgAUEdwCIefHOOT09CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from DS4PPF641CF4859.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::26) by PH7PR11MB6548.namprd11.prod.outlook.com
 (2603:10b6:510:210::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 10:54:15 +0000
Received: from DS4PPF641CF4859.namprd11.prod.outlook.com
 ([fe80::794e:2099:77b9:92f6]) by DS4PPF641CF4859.namprd11.prod.outlook.com
 ([fe80::794e:2099:77b9:92f6%6]) with mapi id 15.20.9818.017; Wed, 22 Apr 2026
 10:54:14 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] pahole: upgrade 1.25 -> 1.29
Date: Wed, 22 Apr 2026 18:54:03 +0800
Message-Id: <20260422105403.1815154-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0170.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::12) To DS4PPF641CF4859.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF641CF4859:EE_|PH7PR11MB6548:EE_
X-MS-Office365-Filtering-Correlation-Id: 6373dd5f-9b06-4c77-000d-08dea05d7e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	ntRoHDEj2wUpfMGuPwSNjU9OB4rKjZQ83s12ccw9PaIE2KpbFIEW+0ouhHDzR3mKgM4oqbZ5rGKlzXJGIAul39zu7Bdu59RF1qug77CJ7TCwN3fmVGJ+w6V9xc5iKuy8iYh+Esp6FnQxE8IDuVKQJo0/bNp6Lh300UpY2smHp3GhK6XmzEGgflOT7yYMgQn9q2VvxTq8XxapsW+fnZU+jIIzzxMevrl0GWE5VyrfZCbKZghvLUOsOS+K/PYgmw0ftsWGulypWnRD046iM8zqixsdgXAgDw1NHgPvOxfPb4/Dzzs7+625Is2ZLAWXz1DpfqNAalY+EOZG53M5QmjqugdTVfsj1DmhSe5smFunVm8wRVUEvV4mlxQcMd3ilOnFcigpQogONULlUNlf60Ab0Jo0WNAuSyZE5e0hg7vy4f4FwRdnx4ARmSDdjX9D8OoxuAVDKa3On8AeB8kGRyf0NgUC0NhR7w1bIBujDBI2X5WIrw5XP5BExRqRVZ6Hg+E8wB2SPClIfMBzaBMDoJMcNlluncKYyPMw8iTs88g5rrqmq+EP9zq2Vqh/Wy/meYz2LP+MyXWIE7UsYx2D4sn8aZDaRHzCmpb0DSGqobrzlws0k5sJHK1x4Zg5F74VHliNu7DPFTJBbZdTjsPO2sSBz6JXUxzEOluBG/bsNxZLgXja9pIUlL9Ui/NHcTOfnS2y05ZpUdR/M+wJ9Pgs5gLxj8EFALCOYNhJyXd4TMBET0ZNIig+v8VeHbnv5VUVSv1t
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF641CF4859.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7XqCmYHF0GZ0pKUfILEeHU0khgVlFDKIVsgpT4NjrbIXNDXDRsfOZjqWuwdb?=
 =?us-ascii?Q?x08ap4sGvqC6rh9LvK2TukCVugpgIuz/jN+Xw/B8GmLL1ewlqorqbFxmh+JW?=
 =?us-ascii?Q?RGcGF7W1fXOBRvdHW7luaIU90LkkEd3QWP0knTA7gClGIWeAvdD3t2D2foxD?=
 =?us-ascii?Q?UA4ynjbbYhotnQH1UXPmDMLmDZjDdIgU9n5vXPX93ZYutBgUjplvdEuz/bq/?=
 =?us-ascii?Q?3iFbyoJuSgI/ovXWtikEYW/fWNXbKYduX7HJXWws/5s0FqEN0BxY/FatwTit?=
 =?us-ascii?Q?NW+T6po58IIC7Mb6uzXxHGfk3fG6wkIu2b3RYNGOrcHaEgJsbSn+IyxXAGMX?=
 =?us-ascii?Q?/ihwsFmCE668awq4IxaAsuJfKoqB1qCSkMPB6YfnFSOqvE8lnTeDQL2qShCY?=
 =?us-ascii?Q?D/cVjD2bDC0UyGOyDRusESv3+f+ShIet8IE/OB+upw5GYj8GuNxVL3+2GVav?=
 =?us-ascii?Q?q+NhCvHWmnF7BG/OR9Q0XMeT6p8liwrtD9eApTpuzNrL60q7n4cZKSLaZFW7?=
 =?us-ascii?Q?XMavfDq2bdryw6rreNfQOo4rO2k5rofXzjW73KSXErEiUVAbzAFS8Joae1Fa?=
 =?us-ascii?Q?sfXwEC+zW2KfoJUlDV/jUsr4PffhGTGtDlL67J9oxJgGFtiUBvn1lNxJ6D5r?=
 =?us-ascii?Q?fZ4Z9vk1VbYif2JjMVNaYA9AqcGxwrKBQ+amAl+5HKuMkRgH3KEXP6gMeKi+?=
 =?us-ascii?Q?aAswFdBn3vOkm6NTDltWAcWwQfWd2SxlrkRcPD8b+DfSL+E6MYnxfQ+LHEp/?=
 =?us-ascii?Q?SocbK78d2rR2I7c6Yl4rAmGCxrH0vRGs8rEFC3Rw7w+LdqwhZYWmUk4dNT3B?=
 =?us-ascii?Q?/biJDLizbK6JmTMMVI56kPNOj09WAf5zFoGRtszWp12+UhJ2DSzCCuwYsX/q?=
 =?us-ascii?Q?G1eNAa9H3b2DWtcWUxf1GcKBm8FQT6zjSgfIDp8FT4v2EjURNAPdRyHCA1Xv?=
 =?us-ascii?Q?VWlu1R9YOHUtFeREQ45TBlyvNwUmzfefzyh+KXSVE7ZPB/WzIi+8jkqEiRdL?=
 =?us-ascii?Q?oR9lSfW0QuaXXrtfcJVQxnt748llSV5jqMzUKWTztbX9IbNJ1G74hAo+rkKc?=
 =?us-ascii?Q?FwAdqxzpTTpmAn668dOA8a41DDaJZjSqDv6V8Ke0RmdtKCs/YQr7mVrLkkI+?=
 =?us-ascii?Q?jG7nsWtMhufJq6egULPfRousiQx17Ayqbkn7GBqHxAec8aNHF1VIeV3HvCoJ?=
 =?us-ascii?Q?2Fj2mtOMaQT4x7qxg0Aqcjk9hMAobUU/g/yk2JxHdota/5Q9kymOKJ07ei+G?=
 =?us-ascii?Q?9Cgno1sFrN3ahMUBMz7gkssvZSARdYiFzdmllUvF/yjKzTn8mnMH+5yB6VOK?=
 =?us-ascii?Q?NoK1uwPsrNX+V9FQYXj3Sxf8oan/HmY1uUYt+4a0yHHJHimtEJn3O++53fFS?=
 =?us-ascii?Q?p0MM32ZD1g14YKLAtIpm9xyJ6X3BoFlbaYne++BB81JuhotyRVZrXRycVS2F?=
 =?us-ascii?Q?jyBhz2BYq9dJro7/xeuW3CcTGGiiqmD9+TUARxC80TMHWP2y8iiylmq1gsoc?=
 =?us-ascii?Q?k2VumivK7OZgjkemd1wH+teXp9y4VPJAQlV9tSd9kHoDmm1N1i61Mdg6F0jc?=
 =?us-ascii?Q?JJiDUxsMEp3o/yoldmm0u4Tl2wP1CnKjMoHeJotSeh2JNryBcojzbBAKtfJc?=
 =?us-ascii?Q?YM9NyraA2H50tIrKnZFHxcAbImYP9fFbFXvP1Qzxv4yr+v0lto7RrkxbDvNo?=
 =?us-ascii?Q?TbQz8KGaN+z0PasOF1c/0lkyZhUZs3s29iRyw5k41Y7zAss4ZVe7TAIJNRFN?=
 =?us-ascii?Q?ZJ3QdWIMZTkL49mc/nUux7Mia2byAoI=3D?=
X-Exchange-RoutingPolicyChecked: 
	euoaGX98qdqDi+EjaNiqg830zZnYqjKadbY2PW1NMZoERzkaSehAzpEbnOg833pbNJYYizk5MZ0hjdh3KJd/b3DOgBOlJz1C59ukpUrt/0uMnEMWGGTmPaXkyLcDnROxGDLPelbDqkZ8j25X5zQYSAQqVsNF+24qz7OvVD50OH1gc6KVLmmBnk83lDByrFibPGS4Xiz0E7d9oCvJxqJJLW+3UYHeQVAZLe/q5lTkignd2rzWlG5MJ9i+1YREhMpwQ4unAqNHzZZkPZsTnzzXm2i0pepzkbPvl3U0HS3jYm5ga/hkOK93bnfA9d89BZVbi9lUSljpe+RYWHzFzJKuDQ==
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6373dd5f-9b06-4c77-000d-08dea05d7e71
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF641CF4859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 10:54:14.9300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 16yxczFnGrupEHb6JSnyhs6aI6AnNVSkg7Rgw7nH4O1KEt3h/kzEleEVeBHd/0hwss4pCLtKD50f/mDY4d3TUYrtifp4kko2ZMP6Z639DZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6548
X-Authority-Analysis: v=2.4 cv=dcqwG3Xe c=1 sm=1 tr=0 ts=69e8a8da cx=c_pps
 a=ijphbjn0GKEIB6My7LrvAw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=yMhMjlubAAAA:8 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8
 a=phSrvZsk4bRkOxLkj6gA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: BFcKi4OC9EjlwKzPPQdzfjNsRH4p2O8p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwNCBTYWx0ZWRfXw9K9+JqQmPX9
 PTfwxOeX+Di8cJWHvyaa9g70D7NENNns+XO1y1PbOtV+GUuTQg7PHpiLSXZ9scYxmAdLMXNQcnG
 AG+8cYgN641punLOMOAtX+DtN04gvflVJHSu2N/qs8hRdTSxYMNbJtSC1q93+KF6Ux266JEKSHP
 9cHGv94nhJGGrcd+wCejmjdk7PWXXscugAcR4ubTnj6yqE0DoMcGi0VoG31XHlceUhJD0MiYDyL
 bU6Sx1mMW/hZW8LPhMNwizCIAnEm4QTntSLoYKuO+QGpRUSWbXnb6k8rihfej/Qg/q6U1VKoycz
 ajG99J0+XQ/g9XlxHXnMPvmNvSSy4gYVYDDzEkF1dmuHJAadonuEc7PwN21siBIUC1taLg6a1oZ
 5suXlxQxmeXTnrW3iPTHr0WzBvsYYfU1kFo3Lyhbfvy5dVRUN60qFpoVzf71m4vXb4SpKay42BI
 I0LkLo7JSZ8vM6uqOLg==
X-Proofpoint-ORIG-GUID: BFcKi4OC9EjlwKzPPQdzfjNsRH4p2O8p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220104
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 10:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126549

pahole v1.25 in scarthgap non-deterministic BTF type ID ordering when using
its parallel mode (-j).
The kernel build system (scripts/pahole-flags.sh) automatically passes -j to
pahole for versions >= 1.22. This means two builds from identical source produce
different vmlinux binaries with different .BTF sections, even though the bitBake
task hash is the same.

It was fixed in pahole v1.29 (Jan 2025, commit 4c916259) which made reproducible
builds always-on by default.

Since Scarthgap is a stable release, the current v1.25 is retained to support
users who require the older version. Users can revert to it by setting
PREFERRED_VERSION_pahole = "1.25".

Additionally, the patches:
0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
are backported from Walnasacar to resolve specific issues in v1.29.

Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
---
 ...python3-instead-of-just-usr-bin-pyth.patch | 34 ++++++++++++
 ...r-Fix-elf_functions-cleanup-on-error.patch | 55 +++++++++++++++++++
 .../recipes-devtools/pahole/pahole_1.29.bb    | 33 +++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/pahole/files/0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
 create mode 100644 meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
 create mode 100644 meta-oe/recipes-devtools/pahole/pahole_1.29.bb

diff --git a/meta-oe/recipes-devtools/pahole/files/0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch b/meta-oe/recipes-devtools/pahole/files/0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
new file mode 100644
index 0000000000..7dc18d7aa2
--- /dev/null
+++ b/meta-oe/recipes-devtools/pahole/files/0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
@@ -0,0 +1,34 @@
+From 436163ab845c263312cf3d4717a43727cf5f0747 Mon Sep 17 00:00:00 2001
+From: Matteo Croce <mcroce@microsoft.com>
+Date: Wed, 15 Sep 2021 17:54:01 +0200
+Subject: [PATCH] Use /usr/bin/env python3 instead of just /usr/bin/python3
+
+Upstream-Status: Inappropriate [OE specific]
+---
+ ostra/ostra-cg        | 2 +-
+ ostra/python/ostra.py | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ostra/ostra-cg b/ostra/ostra-cg
+index 52c902e..8142e67 100755
+--- a/ostra/ostra-cg
++++ b/ostra/ostra-cg
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python3
++#!/usr/bin/env python3
+ # ostra-cg - generate callgraphs from encoded trace
+ #
+ # Arnaldo Carvalho de Melo <acme@redhat.com>
+diff --git a/ostra/python/ostra.py b/ostra/python/ostra.py
+index 86fe079..9bb5ad1 100755
+--- a/ostra/python/ostra.py
++++ b/ostra/python/ostra.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python3
++#!/usr/bin/env python3
+ #
+ # Copyright (C) 2005, 2006, 2007 Arnaldo Carvalho de Melo
+ #
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch b/meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
new file mode 100644
index 0000000000..fb779481d8
--- /dev/null
+++ b/meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
@@ -0,0 +1,55 @@
+From 6fa2b7de3e647e64c5d693aea7f3bacbfa964f53 Mon Sep 17 00:00:00 2001
+From: Ihor Solodari <ihor.solodrai@linux.dev>
+Date: Wed, 20 Aug 2025 09:00:03 +0100
+Subject: [PATCH] btf_encoder: Fix elf_functions cleanup on error
+
+When elf_functions__new() errors out and jumps to
+elf_functions__delete(), pahole segfaults on attempt to list_del() the
+elf_functions instance from a list, to which it was never added.
+
+Fix this by moving list_del() call out of elf_functions__delete().
+Remove from the list only on normal cleanup in
+elf_functions_list__clear().
+
+v1:
+https://lore.kernel.org/dwarves/979a1ac4-21d3-4384-8ce4-d10f41887088@linux.dev/
+
+Closes:
+https://lore.kernel.org/dwarves/24bcc853-533c-42ab-bc37-0c13e0baa217@windriver.com/
+Reported-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
+Reviewed-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+Link: https://lore.kernel.org/dwarves/acef4a0e-7d3b-4e05-b3ca-1007580f2754@linux.dev/
+Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/devel/pahole/pahole.git/commit/?h=next&id=fe6738f4b46b63dcdc5b15b252a014b3eaba16a4]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ btf_encoder.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/btf_encoder.c b/btf_encoder.c
+index 511c1ea..2f8c6bb 100644
+--- a/btf_encoder.c
++++ b/btf_encoder.c
+@@ -162,7 +162,6 @@ static inline void elf_functions__delete(struct elf_functions *funcs)
+ 		free(funcs->entries[i].alias);
+ 	free(funcs->entries);
+ 	elf_symtab__delete(funcs->symtab);
+-	list_del(&funcs->node);
+ 	free(funcs);
+ }
+ 
+@@ -204,6 +203,7 @@ static inline void elf_functions_list__clear(struct list_head *elf_functions_lis
+ 
+ 	list_for_each_safe(pos, tmp, elf_functions_list) {
+ 		funcs = list_entry(pos, struct elf_functions, node);
++		list_del(&funcs->node);
+ 		elf_functions__delete(funcs);
+ 	}
+ }
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.29.bb b/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
new file mode 100644
index 0000000000..b5110d05f5
--- /dev/null
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Shows and manipulates data structure layout"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "elfutils zlib libbpf"
+
+# Depends on MACHINE_ARCH libbpf
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"
+
+SRCREV = "b9cc7963051b2099795129450f9b70c81950d02f"
+SRC_URI = "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=master \
+           file://0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch \
+           file://0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+PACKAGECONFIG[python3] = ",,python3,python3-core"
+
+EXTRA_OECMAKE = "-D__LIB=${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix') + '/')} -DCMAKE_BUILD_TYPE=Release -DLIBBPF_EMBEDDED=OFF"
+
+FILES:${PN} =  "${bindir}/pahole \
+		${libdir}/libdwarves.so* \
+		${libdir}/libdwarves_reorganize.so*"
+
+PACKAGES += "${PN}-extra"
+FILES:${PN}-extra = "${datadir} ${bindir} ${libdir}/libdwarves_emit.so*"
+RDEPENDS:${PN}-extra += "bash python3-core"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


