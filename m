Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F01D216B7
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 14:30:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15030.1729002597713020677
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Oct 2024 07:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=00181c24c3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F5weUE004343
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 14:29:57 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4290r51n9c-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 14:29:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ffc1ChJInmwWStGyGDzQCkokWfdtjMjoZ0PB18tmXJs2Xl+FsSC8S7yiko8OK9M94VYPdpNElBHbib5ed058lEeSDgYdxuARnHkcc4L3GTLt8EGtHfD8U4Iz8REL+Bg4jC9yxQgYEj3MBgUzrij+KDNgFhomC8bkyPk8sXojLpbnvoeXzBXhyGowkHuN5E9XVJ+7mN2GOj3dtxJQWBCKXKuMnswJn0q1At7arcWsnRHeDab012dO9dRZZ+TAUa7XN6geJ7AmPMj6FaBNBW+Fbu3IA+adHoyYr7eZEtAE5Ktanc5jyq6f4/hLud1HRgDcHF94Mc2ONyjnvuawmJDFqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XDuCGaflIDduqk0Z1NNA6A40owZcw2NJ/+ndzpk1Ds=;
 b=vYwwlx7uT6wp2+20gd7ZF4leC7ptr24KrTJkb48FiwT58kyYw1LzM44Z1rsJd1s2Pne+05jYTSLOaaAHIlgBM2PYrj+VUkfTXr3RY0ragIbvHGFCqHyBmdH+EPreB3Ri4tGayWiN+IjBw6Xyth5orR8rhvukayISp0ZOmzs/o80KUX4NL06rKn+hjM6z2bKjj1itmQXUGE60GROVzQ5zpjTh+0zGeMb/deC17MovBbPoG5/y8u+dBhqNYHJycKB63nbKbEHwZ8J2ytdPLRdO2G6178Fyvsb+YeJz/IFMl3CeqK1L0yL0/kIisr8WkSwP1IaTavAqu8GKfiBtxVCeFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.27; Tue, 15 Oct 2024 14:29:51 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 14:29:50 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] rabbitmp-c: upgrade 0.13.0 -> 0.14.0
Date: Tue, 15 Oct 2024 22:29:37 +0800
Message-Id: <20241015142939.719707-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0272.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::7) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM6PR11MB4532:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d9ecc5c-1e86-4481-55ca-08dced25d3f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ccJH3eHGNAlGXRTSNJb0yap4Nh36z267ccaHfnNIghEf+mq4xSwKw/v4JXBT?=
 =?us-ascii?Q?6aAkWpOw4YuyggEgs3we1SqGpMSAkTz3PvEJnVr1yTeYZEXAWoE+hei3I3Vj?=
 =?us-ascii?Q?TJtVn6d8Ej+n7N3qFFqI3nHNk+BSFQiq8D5T2S9Wg/3ai54XAp35tbHJIKRE?=
 =?us-ascii?Q?DAU7nuDr0nWor/31n9LbpuBb0ON/eSrsCgQ7BPX1BGIMsAq6gHnt1qdbbcp/?=
 =?us-ascii?Q?pGKnJUXne0pK8aF6ScREG5FhB5y8VDO9oXqmjAOBszrMiI4vTMSdrnrx6AEe?=
 =?us-ascii?Q?0ANR5w5zyurJgtOvv2hXI2zqpfWqf8PUFHD3Ja/QxXn/QjP+CfFgapTkqpeu?=
 =?us-ascii?Q?U3CxMsq/KxVj+8HacWBxJ5ERdrND+Se0PJhnygjaItWw6XJb8hSsmXbTrVTS?=
 =?us-ascii?Q?bPmTkv+JuFU8unrbg/WT3sGjyYfXQsdpuoovef2d/lYxt3YUmnwIrJ/9wFkU?=
 =?us-ascii?Q?wXpT8OQ7yLFeWOTH+gngS1uWgFw5nqsFeQqeFy1o/bMQTUzG66ay7Pw1UY6/?=
 =?us-ascii?Q?D/nRlQdh3VF7vox7Qjvrzy916HTaL/VgQf9s3OkCI4Nisw4G1Ku4H1OETUpN?=
 =?us-ascii?Q?4VuW7sh9GsNw1aBEwFfzRIbepSSVKHeeurQUd9MNrfUmNBnl+OeOrtAavvQE?=
 =?us-ascii?Q?17Mz55QUTYDP2daw3GZ+UQ9LMuXH+I5M/dIpf5lLmKzcuYbcqMd8I+fGVkVi?=
 =?us-ascii?Q?eIMkkFV90wg36jafTRTgrof85ByEkBlPqHWYbATZQptHZtU/JlDsGi83otgA?=
 =?us-ascii?Q?iU/hS2Ev6q2z1wSpm2LjBLUmViJtuc+6C/mxg1t3+IpiZST0zMpSoBJHJb8j?=
 =?us-ascii?Q?QWZbjD8ojDVLtb7Ss63E9S36bYA/yNzANHUbj5Qs+QkK55xi4zb7TDr8W6hl?=
 =?us-ascii?Q?LlT3+Hc8Gq6eqa9Jhvp74C5J2zOLmkgNR//XYyzNozov4BU+x1AazC8NUYB+?=
 =?us-ascii?Q?GwKJH2dmd1PNsAqGXJ9Ol68jAGRNuDed/inM+8PMcZepu+a4kSvJGOgzNscU?=
 =?us-ascii?Q?2SRtv58/NbX7XrUlk6BEaZa7nKeFWi6RQas/eP9BcrJvZlQ+TuMBEE/H8o2N?=
 =?us-ascii?Q?P9WH5Vi4Mn7xgkftuNLjRsVZBgeJ6LSLPQtNSUhkrlI0j5A2cWm+G4fKdp58?=
 =?us-ascii?Q?LiDdGXHgnvL4Q94V8vYkMU0Qaqi4INPDe/QzJZ6xrKi+JpY/GYpX8iohBOur?=
 =?us-ascii?Q?tO7OIsxSXkhpan6CSCoUiToZf4/qXiIj+DUcYDOr6jhki5c1mGcrMfJzRtwx?=
 =?us-ascii?Q?0YXTyfja3QuL4zA/lMsc1N0DMDEBuQqrcptfkopFm/usj8D1Y4eHfpDsavtC?=
 =?us-ascii?Q?FTjINWHwbR3oL3fwG7AvQsYOSuosLRLHx756aW7CE7OpTg0ubfyx7jf9jJGJ?=
 =?us-ascii?Q?J3dxgHU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9bTyPfi+XODpuC6VtQo9yfnFPQZiOYdyGKKl2ZSO3vRjG9wQxD+OSh6uHMrL?=
 =?us-ascii?Q?YLyD/DMtXHaZAdImGg7ELuiz8ELyCVgobPB0+iWlVJIM6JzLtJX4Fd04Te+7?=
 =?us-ascii?Q?0yzjTE3FvjiiN8V7h82W5wLm5lVDCp6tNMg3JUuuQlkMgfKIe5H9wuJ88MS5?=
 =?us-ascii?Q?+M8HtkE3G1eDccfmbqtbMAz8pIZ0FEf4SOf02mBv3RyP34xcWFrpqyDBB6/5?=
 =?us-ascii?Q?l5yVz8BAlViiWF2PHx6fjvN/0FaibCwLfUqEc2nlYWUoPRKcRsu2HGY0TbQo?=
 =?us-ascii?Q?pFXFfZNnz+SzqNzep2R9c+/agfq2V9jC86GvKwelYOmghmuuvouY7w9GBSBF?=
 =?us-ascii?Q?7hqJyYY/u8s+L085xWI0MnDBVyUY9xE9fHWYNavdVakykYubGZQcDMwPtIoJ?=
 =?us-ascii?Q?/tO00MeaK51Cj3zmgJ+w961CmHxlxhK9cAYZ4JgrsJSRM0tNfD5z+BL0TIxh?=
 =?us-ascii?Q?usSOaEyc+RD169mt81fn4MICSRJISd0J9ZR6o8mYP/pNuCmmKi3eyLH9FEYT?=
 =?us-ascii?Q?wQM3Vmi0yySwaunlRo9Gn3FL+OKswqtnSSmkVcyj+dqlhOEpgNV1rGtcsK7G?=
 =?us-ascii?Q?WUgBjxARirEZvh5fdFusFCpB5HXOLdWwxu8o1JAtgh8AbuqhH/2sSBDpOskG?=
 =?us-ascii?Q?UToWUGD+DXqOvaee87RhTDKJ8eOTuSv+H4mIFieR/hmiUWAfRwZ8e4XUb/vo?=
 =?us-ascii?Q?W/3GhmuezlNwAPHCUcKTEW7NE2uGSSgMW00zFd/0cOW4lO+skZCWAfutE1QL?=
 =?us-ascii?Q?/YGKG+moBOondp/mij5G2/9X5kLCHCFSqu24ntf2fF7iKxtVKlL09yweQpUX?=
 =?us-ascii?Q?VFt+AR9tQoecDJPxJdGgw00CBY+awYUySA0eCjowAp9eyyZu7zG0VwvP5DjA?=
 =?us-ascii?Q?iZ+CSzA20A9XslUCaBPrEYJkeP3p+TjxTPD0Vjc6iyBcEyYXYAJs9nWqHPZJ?=
 =?us-ascii?Q?oh6ca4mrlcqwFwVik5fAMV20JjDnGxJ1LiQ24YwejjTkBs1vnni73S/uz1nM?=
 =?us-ascii?Q?oKqVYOnl3ESO7nAQL/rUI48SqjVMDrKHY5sMAflpo/dZv1CimO4u4G6zd+tx?=
 =?us-ascii?Q?3YTLjS25V3s/80IP1rZaqs2iJPLQonTFFz7YMZGH/r6uu1NRRyQK5NphIJ+L?=
 =?us-ascii?Q?Muuhra2sr2CndlhWeIpHL67Vcr8LXwMXzH7/6lywXGrme7s7UWNS1Llf77Ku?=
 =?us-ascii?Q?zVP1YZWvMOq2NtDT3KlUcW0L7+m2h4qhVO5/nG3n9He0ldxhs+x3yMQJfgOa?=
 =?us-ascii?Q?cBYCBrYNAaexagTSP6hOV8wKs+5unfJLqikexE0e01c+c+r4idhPap0o+qjN?=
 =?us-ascii?Q?Gs8oKm9sSgrsQ6KOlJO7wMHlRCmiuCtJkdqXpiYn8or5WO1fs0YorX5Iz7gH?=
 =?us-ascii?Q?408NxVNcKIofcamlXT82Br8haIOjsjZSQEhyTsxDKcp0XjvcTC4J8wVo6N/u?=
 =?us-ascii?Q?H8RgEERCinwWqL3NaOil7kGRPx5uWrfKg+dgec/MpObPM3bywrnV8ih5FnyE?=
 =?us-ascii?Q?+gb4vdJXmT+pK4fkWu40/KvnlphmVrDotEnfzbSmHBH1TzTI+wrvnTCLIdSy?=
 =?us-ascii?Q?DU6C7BwSXv4Ml9ztlxoBjRZBpeJQJL2pK20Tjt+K?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d9ecc5c-1e86-4481-55ca-08dced25d3f4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 14:29:50.8206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gYZ9C8LH+7UIKqAcndgdOV2c6iWFS/60n5WOrOtexhDvjsxrgzwDXmg+MkStlNu611f9zG6e6Slm9xZ8317cPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4532
X-Proofpoint-GUID: 7c4ueOCf1cnMU7m-loTxnfIpbKSkLsda
X-Proofpoint-ORIG-GUID: 7c4ueOCf1cnMU7m-loTxnfIpbKSkLsda
X-Authority-Analysis: v=2.4 cv=ceSArWDM c=1 sm=1 tr=0 ts=670e7c63 cx=c_pps a=6DIaztarb0XTwjBPIWoXxQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=QyXUC8HyAAAA:8
 a=hTmRzqaApGPwTaGWJ2MA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_09,2024-10-15_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410150099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 14:30:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112928

ChangeLog:
https://github.com/alanxz/rabbitmq-c/releases/tag/v0.14.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../rabbitmq-c/files/CVE-2023-35789.patch     | 131 ------------------
 ...bitmq-c_0.13.0.bb => rabbitmq-c_0.14.0.bb} |   4 +-
 2 files changed, 1 insertion(+), 134 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/rabbitmq-c/files/CVE-2023-35789.patch
 rename meta-oe/recipes-connectivity/rabbitmq-c/{rabbitmq-c_0.13.0.bb => rabbitmq-c_0.14.0.bb} (83%)

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/files/CVE-2023-35789.patch b/meta-oe/recipes-connectivity/rabbitmq-c/files/CVE-2023-35789.patch
deleted file mode 100644
index dfd1f9875..000000000
--- a/meta-oe/recipes-connectivity/rabbitmq-c/files/CVE-2023-35789.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-CVE: CVE-2023-35789
-Upstream-Status: Backport [ https://github.com/alanxz/rabbitmq-c/commit/463054383fbeef889b409a7f843df5365288e2a0 ]
-Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
-
-From 463054383fbeef889b409a7f843df5365288e2a0 Mon Sep 17 00:00:00 2001
-From: Christian Kastner <ckk@kvr.at>
-Date: Tue, 13 Jun 2023 14:21:52 +0200
-Subject: [PATCH] Add option to read username/password from file (#781)
-
-* Add option to read username/password from file
----
- tools/common.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 66 insertions(+)
-
-diff --git a/tools/common.c b/tools/common.c
-index 73b47e25..7efe557b 100644
---- a/tools/common.c
-+++ b/tools/common.c
-@@ -18,6 +18,11 @@
- #include "compat.h"
- #endif
- 
-+/* For when reading auth data from a file */
-+#define MAXAUTHTOKENLEN 128
-+#define USERNAMEPREFIX "username:"
-+#define PASSWORDPREFIX "password:"
-+
- void die(const char *fmt, ...) {
-   va_list ap;
-   va_start(ap, fmt);
-@@ -125,6 +130,7 @@ static char *amqp_vhost;
- static char *amqp_username;
- static char *amqp_password;
- static int amqp_heartbeat = 0;
-+static char *amqp_authfile;
- #ifdef WITH_SSL
- static int amqp_ssl = 0;
- static char *amqp_cacert = "/etc/ssl/certs/cacert.pem";
-@@ -147,6 +153,8 @@ struct poptOption connect_options[] = {
-      "the password to login with", "password"},
-     {"heartbeat", 0, POPT_ARG_INT, &amqp_heartbeat, 0,
-      "heartbeat interval, set to 0 to disable", "heartbeat"},
-+    {"authfile", 0, POPT_ARG_STRING, &amqp_authfile, 0,
-+     "path to file containing username/password for authentication", "file"},
- #ifdef WITH_SSL
-     {"ssl", 0, POPT_ARG_NONE, &amqp_ssl, 0, "connect over SSL/TLS", NULL},
-     {"cacert", 0, POPT_ARG_STRING, &amqp_cacert, 0,
-@@ -158,6 +166,50 @@ struct poptOption connect_options[] = {
- #endif /* WITH_SSL */
-     {NULL, '\0', 0, NULL, 0, NULL, NULL}};
- 
-+void read_authfile(const char *path) {
-+  size_t n;
-+  FILE *fp = NULL;
-+  char token[MAXAUTHTOKENLEN];
-+
-+  if ((amqp_username = malloc(MAXAUTHTOKENLEN)) == NULL ||
-+      (amqp_password = malloc(MAXAUTHTOKENLEN)) == NULL) {
-+    die("Out of memory");
-+  } else if ((fp = fopen(path, "r")) == NULL) {
-+    die("Could not read auth data file %s", path);
-+  }
-+
-+  if (fgets(token, MAXAUTHTOKENLEN, fp) == NULL ||
-+      strncmp(token, USERNAMEPREFIX, strlen(USERNAMEPREFIX))) {
-+    die("Malformed auth file (missing username)");
-+  }
-+  strncpy(amqp_username, &token[strlen(USERNAMEPREFIX)], MAXAUTHTOKENLEN);
-+  /* Missing newline means token was cut off */
-+  n = strlen(amqp_username);
-+  if (amqp_username[n - 1] != '\n') {
-+    die("Username too long");
-+  } else {
-+    amqp_username[n - 1] = '\0';
-+  }
-+
-+  if (fgets(token, MAXAUTHTOKENLEN, fp) == NULL ||
-+      strncmp(token, PASSWORDPREFIX, strlen(PASSWORDPREFIX))) {
-+    die("Malformed auth file (missing password)");
-+  }
-+  strncpy(amqp_password, &token[strlen(PASSWORDPREFIX)], MAXAUTHTOKENLEN);
-+  /* Missing newline means token was cut off */
-+  n = strlen(amqp_password);
-+  if (amqp_password[n - 1] != '\n') {
-+    die("Password too long");
-+  } else {
-+    amqp_password[n - 1] = '\0';
-+  }
-+
-+  (void)fgetc(fp);
-+  if (!feof(fp)) {
-+    die("Malformed auth file (trailing data)");
-+  }
-+}
-+
- static void init_connection_info(struct amqp_connection_info *ci) {
-   ci->user = NULL;
-   ci->password = NULL;
-@@ -237,6 +289,8 @@ static void init_connection_info(struct amqp_connection_info *ci) {
-   if (amqp_username) {
-     if (amqp_url) {
-       die("--username and --url options cannot be used at the same time");
-+    } else if (amqp_authfile) {
-+      die("--username and --authfile options cannot be used at the same time");
-     }
- 
-     ci->user = amqp_username;
-@@ -245,11 +299,23 @@ static void init_connection_info(struct amqp_connection_info *ci) {
-   if (amqp_password) {
-     if (amqp_url) {
-       die("--password and --url options cannot be used at the same time");
-+    } else if (amqp_authfile) {
-+      die("--password and --authfile options cannot be used at the same time");
-     }
- 
-     ci->password = amqp_password;
-   }
- 
-+  if (amqp_authfile) {
-+    if (amqp_url) {
-+      die("--authfile and --url options cannot be used at the same time");
-+    }
-+
-+    read_authfile(amqp_authfile);
-+    ci->user = amqp_username;
-+    ci->password = amqp_password;
-+  }
-+
-   if (amqp_vhost) {
-     if (amqp_url) {
-       die("--vhost and --url options cannot be used at the same time");
diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.13.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.14.0.bb
similarity index 83%
rename from meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.13.0.bb
rename to meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.14.0.bb
index ea80ec334..b0556ffc0 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.13.0.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.14.0.bb
@@ -4,10 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7e12f6e40e662e039e2f02b4893011ec"
 LICENSE = "MIT"
 
 SRC_URI = "git://github.com/alanxz/rabbitmq-c.git;branch=master;protocol=https \
-           file://CVE-2023-35789.patch \
 "
-# v0.13.0-master
-SRCREV = "974d71adceae6d742ae20a4c880d99c131f1460a"
+SRCREV = "124722b5045baa41a24ce2e2d7c52a47467e7ac0"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


