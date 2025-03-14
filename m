Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8858C282DE
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 01:58:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4332.1741917508521406160
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 18:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51681d0977=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E1ms1g002631
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 18:58:28 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45bgat1rwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 18:58:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uuWq9JV9NtMBXTGRJM+ityjik46rhW34qmK0yjbhH+/7mxLkB+v8EowRRgIBKVbqxL/MBQ0gwtcSz/trQmytigq5B626G7lCA8dx+T3/5yiEaza+urC59cU8VQWGbbRgGThfcVrQqb4GpZG1VygbTBAer9BqgQGhKDHizwrbjQBl7zexae1jXsstUM77cOwPtwDbpRptg8z7Yer1OMdfseIRg90I/h7rSoukab+cVbydYRuggsVNcx0mWw9sgPdSEvbPo0DunYSKbypYGULBZBLTsXvrISNXHvY0h7ueSzCs8Jhozgj+F/rX0gp3+k9YzF14qU8YN7cnhKI9Qs/F+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xk7Epd986V+vAdEVRF7QfC9kYmrHfr0uriVi4Np+jmU=;
 b=VOUZFXzK5foMBFZvL6btb4pY1z8Xq5D5nDa+ejXYTL239HPUmlxYl8Yd4g/p8FYas2VP7Wb1vLRhxq7VKUzoH2HBmh9aiWkTHHHfRmYMmFISFe2fx0UPm7ToK7cQ+IGvHVyojYF8mfSeKWMxjhetZRonFSVdkxz1imFChq6vRSIVZtdu176eEUIgyyikqAJdv8QunNVCzNyQkyi2R9gHB3zfHVkovQiBeIcTNxny2woJMOkRs2fyQ6PeSQtOM24BBfpLb+Uip90Al5ffJXAycQiFe38pXwCMs/bug51vkyEyOb30r8eunEBEENO+BE7FrsJvGvnFXzChtxXOpX57TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5605.namprd11.prod.outlook.com (2603:10b6:8:26::11) by
 PH0PR11MB4776.namprd11.prod.outlook.com (2603:10b6:510:30::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.28; Fri, 14 Mar 2025 01:58:24 +0000
Received: from DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a]) by DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a%3]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 01:58:24 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 2/2] php: upgrade from 8.2.26 to 8.4.4
Date: Thu, 13 Mar 2025 18:58:09 -0700
Message-Id: <20250314015809.3587400-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250314015809.3587400-1-Qi.Chen@windriver.com>
References: <20250314015809.3587400-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0377.namprd03.prod.outlook.com
 (2603:10b6:408:f7::22) To DM8PR11MB5605.namprd11.prod.outlook.com
 (2603:10b6:8:26::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5605:EE_|PH0PR11MB4776:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c4dee78-a114-48c0-2c5b-08dd629bb3d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Pu6F09jZUpzwPt3TNeKW6TPd7ShxWcv2qgljLB0q/lMYAIXZ2DTqoE1r7roy?=
 =?us-ascii?Q?QjiTXzIuj0yUa+rgdD5C+G3D45BL1MFn9Npni58qDSTj6BDTMOF3bD/kxgUZ?=
 =?us-ascii?Q?VGrihZAm/GWn+JV3qfAsNb7qvAdqUtESxIdaLL0MjLkPEHs1mAFeBA+zv/de?=
 =?us-ascii?Q?7E0Svwh+WcnJmYQavH+5izjaaI0SnMEzmc2B8+yijw+rqrQY7yDJKJvTYdXd?=
 =?us-ascii?Q?j+PnoFurHpgpXf0tVydNJf7Cu+lwCAUph9cZxP77gkhYrX80Zo8MJMvIx+ig?=
 =?us-ascii?Q?gRx5Re5nH1xfh+Oqd+CQ/CE4EEl44foF9AcVW5En1cVSuZO4Z5WzSU3K8OB5?=
 =?us-ascii?Q?4v5+ed0kCeKoezkNbrln9W7qrYE/vy5DF0mAHFPpeOv5wkJ88AgEYeS3IZhK?=
 =?us-ascii?Q?LLiGrn2mv51ckEBfj/+wXGdCe5YJ1jXzOzupa3tubb/XRyipMvqu570z3Eql?=
 =?us-ascii?Q?sLqBR8yCCNQ3xJkOMsPtZB4aF7zmj1sOif+YREvIZxVYe35y40MTsgPVxOFw?=
 =?us-ascii?Q?Cr7ta84Q5DHC3njordcGPvD4T34H4QQkBAyHtSQ5B+fn/PS4A+lVWwdLkLuG?=
 =?us-ascii?Q?8oaDC+ImvZYnwp+8HYusXgx5IP10QAZirf9lQ0XxMnjgveRikB8zrdtrblYh?=
 =?us-ascii?Q?xH5MWBtZQ6I4VFlSUTMPkY/B04xD7FtnfcUDs15DO1w1kk/0FXljKmRvh6Ll?=
 =?us-ascii?Q?GVfcQFAEXoqi54GG2vnZ9HVz7r6e5canPUfxj3uaJlVHqf6frRAotvkHOnXf?=
 =?us-ascii?Q?RlK8DCeus7Q1m6Dks0+dzMEIYkFF39apkBo6UdVIQcEqBpBPu8+nIt3II4wn?=
 =?us-ascii?Q?hLwT88Bp7VWNyiS5w7J0KP8plvCIaUJYtsdwJaZHthg2OIogcM7TSPMrIaFr?=
 =?us-ascii?Q?ax8lpbrO/NOGiwO1ep1yF+yrOVbisZqlXJ5khUeI1mSxE+0blm+berT3bvRv?=
 =?us-ascii?Q?PBdZcdjDoEZTcZPvd4V7frlqrKibqmMQGwBqd7qfVWCfU+pIDVI65j8n4HuO?=
 =?us-ascii?Q?cCGuwG1UqRNaHBxFSeHzzw53g1dhzI6CcP2p6vct6/lDtl8wekZ7qe21H5jN?=
 =?us-ascii?Q?nJtADK91wUWA2ykKKHvs8KBQBcb+wKyzkMSiBgNN7sHR/RA+mLjZ0YcL/mzi?=
 =?us-ascii?Q?YvRg6poL6TEQjm6l6n8N0+YqMSZWsNiVdT14nzaZ+AJ0rzb4vZgE2iRC6tR0?=
 =?us-ascii?Q?uxFUgv/CZSLXM6nCXU0C99dSDkVHUmcd292xqPZjXTFPPvGnXHi3ECv4K8RU?=
 =?us-ascii?Q?s77ZtofDpxh482vatnT2mxJ8EvSox/+WsbHVZW2uCHrRbeZEahCf0s6mU7jA?=
 =?us-ascii?Q?b4nFpFifdt0eOmiOe7caGAYITxZtOtNcLhnvW01vhPcfN6XX/XOB9jza/2v9?=
 =?us-ascii?Q?CdWbxHEGrfBZocniP/yWGPYEKLVmiRleDwUZsZoI5+uY5S0+Mw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5605.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+/nYvOlqsQi6XpQO2B3ACUbWrnyxMSxPUUn0qTpA063tXlzsdgNSmnpMCHXG?=
 =?us-ascii?Q?9FbjXBeRqgp80l6KgE7cKr1CZMac4vgxq3x1Pgi3w+T096CVB4oQOAab2Rkw?=
 =?us-ascii?Q?4hKT62xtx0mexSBWsk0W0EaF1bFG/wobR0PIW3C+P0+9FLt7EAjDafJSsTK8?=
 =?us-ascii?Q?4EYcjAPxnqZNB7zFIhNcMR1JtKEQ6a5xdaR0zp1YhMgJjSPeT9GeurG8rVvW?=
 =?us-ascii?Q?ro8E/+2U+zgjeHRBpy100XbLAz4EbsQvFq8HkJuX5jYBfWS+ca/fo8J70Ma5?=
 =?us-ascii?Q?m/M4s3bW3Gl69Durzr/1P+V714zj9UPHK5uxVceb1GIyhkeALjTjDlWDGy5P?=
 =?us-ascii?Q?5vo7sS3ESKfj0mzF+3UWTOWnXCnNVJCUuBvdESD2ZNrM/BlRaiSUEPAmH/yg?=
 =?us-ascii?Q?3wHDPvL4xJHTw9aJgHKXZTWt97lVPf5iUJyV7NlXOcq0JxA6wohBgsmQxJur?=
 =?us-ascii?Q?fv/pEoyzLljqVjyNj7enBjaPrePM3EU0LST3uPEyN50rTxncfWk3AjO7T9AH?=
 =?us-ascii?Q?RqD6QVh/66GcFKX2SWC+Yp0hfWFUpYc2Dr3rIRfYdfy+0PgQWGyY2oPS7mKX?=
 =?us-ascii?Q?iZt05Tr3176MFC7PuAieb/HgIaABfmOH2ET6f16DHFtyhyEUVYebA1IXTESL?=
 =?us-ascii?Q?SVwJ1Vugx6R0A0KaX/XLKmBsuUnxSW1iCXC84WfaZFxB4FunRqBF/Tip4L7i?=
 =?us-ascii?Q?iilUR8vgkU9nnB5Hg7t5YDr9q5g6GDm093LzlL/8EBJ2/PTqqWURcu8fPuss?=
 =?us-ascii?Q?KZALanC3lgm2Fc8YHl7thysGipY2aZsWIpGdI6AAQd3/wGr5kDo3GTGolNkc?=
 =?us-ascii?Q?BLrZh8tMi8RdT+LVKe3GGCJ4CyfKSseV1zPoT4rGSK2Bkn+4asyhwQPus0l9?=
 =?us-ascii?Q?xR8JvIyhnESBti5hVdv/R7ByHXnjcCCkxulKPj5mq+RGzweGPr7o5RYNkhBn?=
 =?us-ascii?Q?FPHZMCPH/HI3sbP5pcwXHz7p2szSDzaao3hinX37J1oNPVo/KlvHwY4ILrWB?=
 =?us-ascii?Q?Szw8PSeH4m0kfjWOr36KossLkNiBhwVUCfydG8f+73I4s/0IYqOH1BXEhdya?=
 =?us-ascii?Q?PdFAdd/KjsWjkGGWVJc4ze0mWiWNpqR1Sq/v45hLN6Huj+rZOmw1iFVOJM9u?=
 =?us-ascii?Q?Snaxti8/C82+JcX1d58SrdPQd0qExOfByFXBbF77F2/CiU4qZXbdRTZJ17I/?=
 =?us-ascii?Q?lEsaDvbNEtrFELBzldg4SCjsQhuS6j4iFNhWdIEuUxECCaLEQ/9XflZ2v4VP?=
 =?us-ascii?Q?ZljEIQ4Abcb4KUEM/yLB0xhGWc+bVuouLkVwF/ympd/6iQI/fnjNy5NoQfRP?=
 =?us-ascii?Q?F54ZrT+pCxLQcgbh187vhTk3RIjPjbgCywhN8niS9+jFCacaaw5QdXvAv8Go?=
 =?us-ascii?Q?PTQb212hVjo9NEwB4KmUShIawnlXBSW/VuukZw+y0k3Z6ltAirmp9UV/GDgg?=
 =?us-ascii?Q?HaF+II1Fkzweyw4/kimwllMJZLqVQKn5hbHUxXDiTBLvn0LmUndDJ1+cGRxI?=
 =?us-ascii?Q?5wL/qemV8LLXjbwG4WMYTCzCi4im++gIcDvHq8/cKcxMLos/kw2QSqSfRQdr?=
 =?us-ascii?Q?SimZMllE35RkLV1rOCdthgDQah65C04iev/HBGIG7twmJdR2anMEtNRuQCb5?=
 =?us-ascii?Q?9A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4dee78-a114-48c0-2c5b-08dd629bb3d9
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 01:58:23.9559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RpWX2864t4rNTWCPLavpKtLX39eFUGcr89Dz3lkV0El0eOa2EN+A4678JstQ3UapX1ktKWICfQo2rz9LzhV8qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4776
X-Authority-Analysis: v=2.4 cv=VYX3PEp9 c=1 sm=1 tr=0 ts=67d38d43 cx=c_pps a=tyvwN2z/Y66O58r8mq/nTQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=67BIL_jfAAAA:8 a=t7CeM3EgAAAA:8 a=svO6gwnVAAAA:8 a=QyXUC8HyAAAA:8 a=GNEw3xDRAAAA:8 a=wPoE8IefmiOdgoJ25d0A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=5awQwY9Y38-QVGG67zo_:22 a=Gbt7yw0KH3r5R2uzA50C:22
X-Proofpoint-ORIG-GUID: UuINQgg7tvuYxVBZ4IkVReAS2encpCoa
X-Proofpoint-GUID: UuINQgg7tvuYxVBZ4IkVReAS2encpCoa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_01,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 clxscore=1011
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503140014
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Mar 2025 01:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115982

From: Chen Qi <Qi.Chen@windriver.com>

0001-ext-opcache-config.m4-enable-opcache.patch is dropped.
This patch could be dropped because the new version now uses
AC_CACHE_CHECK, and we can just pass ac_cv_xxx to it instead of
using a local patch.

0008-ext-imap-config.m4-fix-include-paths.patch is dropped.
ext/imap has been removed from php in this new version. See
https://github.com/php/php-src/pull/13190. As a result of this
removal, the corresponding PACKAGECONFIG is removed from this new
version.

0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch is
dropped. It has been merged in this new version.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...o-inline-XXH3_hashLong_withSecret-to.patch |  93 -------
 ...e.ac-don-t-include-build-libtool.m4.patch} |   6 +-
 ...ext-opcache-config.m4-enable-opcache.patch | 254 ------------------
 ...ar-Makefile.frag-Fix-phar-packaging.patch} |   9 +-
 ...n.patch => 0003-iconv-fix-detection.patch} |  19 +-
 ...04-pear-fix-Makefile.frag-for-Yocto.patch} |  10 +-
 ...i-cli-config.m4-fix-build-directory.patch} |  17 +-
 ...ext-imap-config.m4-fix-include-paths.patch |  45 ----
 .../php/{php_8.2.26.bb => php_8.4.4.bb}       |  24 +-
 9 files changed, 45 insertions(+), 432 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/php/php/0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch
 rename meta-oe/recipes-devtools/php/php/{0004-configure.ac-don-t-include-build-libtool.m4.patch => 0001-configure.ac-don-t-include-build-libtool.m4.patch} (83%)
 delete mode 100644 meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
 rename meta-oe/recipes-devtools/php/php/{0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch => 0002-ext-phar-Makefile.frag-Fix-phar-packaging.patch} (91%)
 rename meta-oe/recipes-devtools/php/php/{0010-iconv-fix-detection.patch => 0003-iconv-fix-detection.patch} (64%)
 rename meta-oe/recipes-devtools/php/php/{0005-pear-fix-Makefile.frag-for-Yocto.patch => 0004-pear-fix-Makefile.frag-for-Yocto.patch} (86%)
 rename meta-oe/recipes-devtools/php/php/{0007-sapi-cli-config.m4-fix-build-directory.patch => 0005-sapi-cli-config.m4-fix-build-directory.patch} (63%)
 delete mode 100644 meta-oe/recipes-devtools/php/php/0008-ext-imap-config.m4-fix-include-paths.patch
 rename meta-oe/recipes-devtools/php/{php_8.2.26.bb => php_8.4.4.bb} (93%)

diff --git a/meta-oe/recipes-devtools/php/php/0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch b/meta-oe/recipes-devtools/php/php/0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch
deleted file mode 100644
index 5b8c76209a..0000000000
--- a/meta-oe/recipes-devtools/php/php/0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 1eeb59366d6140a799f6051fb9f57d988b81fd5b Mon Sep 17 00:00:00 2001
-From: easyaspi314 <easyaspi314@users.noreply.github.com>
-Date: Wed, 12 Apr 2023 13:33:07 +0800
-Subject: [PATCH] Change whether to inline XXH3_hashLong_withSecret to a config
- option
-
-Change whether to inline XXH3_hashLong_withSecret to a config option to fix
-GCC 12 -Og.
-
-Upstream-Status: Submitted [https://github.com/php/php-src/pull/11062]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- ext/hash/xxhash/xxhash.h | 35 +++++++++++++++++++++++++++++++++--
- 1 file changed, 33 insertions(+), 2 deletions(-)
-
-diff --git a/ext/hash/xxhash/xxhash.h b/ext/hash/xxhash/xxhash.h
-index b5bd2864..8e816c05 100644
---- a/ext/hash/xxhash/xxhash.h
-+++ b/ext/hash/xxhash/xxhash.h
-@@ -1375,6 +1375,23 @@ XXH3_128bits_reset_withSecretandSeed(XXH3_state_t* statePtr,
-  */
- #  define XXH_NO_INLINE_HINTS 0
- 
-+/*!
-+ * @def XXH3_INLINE_SECRET
-+ * @brief Determines whether to inline the XXH3 withSecret code.
-+ *
-+ * When the secret size is known, the compiler can improve the performance
-+ * of XXH3_64bits_withSecret() and XXH3_128bits_withSecret().
-+ *
-+ * However, if the secret size is not known, it doesn't have any benefit. This
-+ * happens when xxHash is compiled into a global symbol. Therefore, if
-+ * @ref XXH_INLINE_ALL is *not* defined, this will be defined to 0.
-+ *
-+ * Additionally, this defaults to 0 on GCC 12+, which has an issue with function pointers
-+ * that are *sometimes* force inline on -Og, and it is impossible to automatically
-+ * detect this optimization level.
-+ */
-+#  define XXH3_INLINE_SECRET 0
-+
- /*!
-  * @def XXH32_ENDJMP
-  * @brief Whether to use a jump for `XXH32_finalize`.
-@@ -1439,6 +1456,15 @@ XXH3_128bits_reset_withSecretandSeed(XXH3_state_t* statePtr,
- #  endif
- #endif
- 
-+#ifndef XXH3_INLINE_SECRET
-+#  if (defined(__GNUC__) && !defined(__clang__) && __GNUC__ >= 12) \
-+     || !defined(XXH_INLINE_ALL)
-+#    define XXH3_INLINE_SECRET 0
-+#  else
-+#    define XXH3_INLINE_SECRET 1
-+#  endif
-+#endif
-+
- #ifndef XXH32_ENDJMP
- /* generally preferable for performance */
- #  define XXH32_ENDJMP 0
-@@ -1515,6 +1541,11 @@ static void* XXH_memcpy(void* dest, const void* src, size_t size)
- #  define XXH_NO_INLINE static
- #endif
- 
-+#if XXH3_INLINE_SECRET
-+#  define XXH3_WITH_SECRET_INLINE XXH_FORCE_INLINE
-+#else
-+#  define XXH3_WITH_SECRET_INLINE XXH_NO_INLINE
-+#endif
- 
- 
- /* *************************************
-@@ -4465,7 +4496,7 @@ XXH3_hashLong_64b_internal(const void* XXH_RESTRICT input, size_t len,
-  * so that the compiler can properly optimize the vectorized loop.
-  * This makes a big performance difference for "medium" keys (<1 KB) when using AVX instruction set.
-  */
--XXH_FORCE_INLINE XXH64_hash_t
-+XXH3_WITH_SECRET_INLINE XXH64_hash_t
- XXH3_hashLong_64b_withSecret(const void* XXH_RESTRICT input, size_t len,
-                              XXH64_hash_t seed64, const xxh_u8* XXH_RESTRICT secret, size_t secretLen)
- {
-@@ -5263,7 +5294,7 @@ XXH3_hashLong_128b_default(const void* XXH_RESTRICT input, size_t len,
-  * It's important for performance to pass @secretLen (when it's static)
-  * to the compiler, so that it can properly optimize the vectorized loop.
-  */
--XXH_FORCE_INLINE XXH128_hash_t
-+XXH3_WITH_SECRET_INLINE XXH128_hash_t
- XXH3_hashLong_128b_withSecret(const void* XXH_RESTRICT input, size_t len,
-                               XXH64_hash_t seed64,
-                               const void* XXH_RESTRICT secret, size_t secretLen)
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php/0004-configure.ac-don-t-include-build-libtool.m4.patch b/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch
similarity index 83%
rename from meta-oe/recipes-devtools/php/php/0004-configure.ac-don-t-include-build-libtool.m4.patch
rename to meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch
index 19a8bf8e4f..fae8697fd4 100644
--- a/meta-oe/recipes-devtools/php/php/0004-configure.ac-don-t-include-build-libtool.m4.patch
+++ b/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch
@@ -1,7 +1,7 @@
-From 41ef1121682c245b10df7de4b78c45baf9114c04 Mon Sep 17 00:00:00 2001
+From 6da78888b934dc10720a6e0e520536077cc2aac2 Mon Sep 17 00:00:00 2001
 From: Claude Bing <cbing@cybernetics.com>
 Date: Tue, 9 Nov 2021 13:03:46 -0500
-Subject: [PATCH 04/11] configure.ac: don't include build/libtool.m4
+Subject: [PATCH 1/5] configure.ac: don't include build/libtool.m4
 
 we delete build/libtool.m4 before do_configure,
 we will use libtool.m4 under ACLOCALDIR
@@ -17,7 +17,7 @@ Signed-off-by: Claude Bing <cbing@cybernetics.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 90c94323aa..161e7c3f53 100644
+index 9d79720a2..9353e2f6e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -6,7 +6,6 @@ dnl ----------------------------------------------------------------------------
diff --git a/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
deleted file mode 100644
index 009d4d650f..0000000000
--- a/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
+++ /dev/null
@@ -1,254 +0,0 @@
-From 889583912ddd7abc628f2703892ec4884db6419a Mon Sep 17 00:00:00 2001
-From: Soumya Sambu <soumya.sambu@windriver.com>
-Date: Tue, 7 May 2024 08:39:16 +0000
-Subject: [PATCH 01/11] ext/opcache/config.m4: enable opcache
-
-We can't use AC_TRY_RUN to run programs in a cross compile
-environment. Set the variables directly instead since we know
-that we'd be running on latest enough linux kernel.
-
-Upstream-Status: Inappropriate [Configuration]
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-
-update patch to version 7.4.4
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
-update patch to version 8.0.12
-fix issue linking with librt
-Signed-off-by: Claude Bing <cbing@cybernetics.com>
-
-update patch to version 8.1.0
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-
-update patch to version 8.2.18
-Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
----
- ext/opcache/config.m4 | 204 ++----------------------------------------
- 1 file changed, 8 insertions(+), 196 deletions(-)
-
-diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
-index 6bf07ad3..5d645b86 100644
---- a/ext/opcache/config.m4
-+++ b/ext/opcache/config.m4
-@@ -113,209 +113,21 @@ if test "$PHP_OPCACHE" != "no"; then
-   AC_CHECK_FUNCS([mprotect])
- 
-   AC_MSG_CHECKING(for sysvipc shared memory support)
--  AC_RUN_IFELSE([AC_LANG_SOURCE([[
--#include <sys/types.h>
--#include <sys/wait.h>
--#include <sys/ipc.h>
--#include <sys/shm.h>
--#include <unistd.h>
--#include <string.h>
--
--int main(void) {
--  pid_t pid;
--  int status;
--  int ipc_id;
--  char *shm;
--  struct shmid_ds shmbuf;
--
--  ipc_id = shmget(IPC_PRIVATE, 4096, (IPC_CREAT | SHM_R | SHM_W));
--  if (ipc_id == -1) {
--    return 1;
--  }
--
--  shm = shmat(ipc_id, NULL, 0);
--  if (shm == (void *)-1) {
--    shmctl(ipc_id, IPC_RMID, NULL);
--    return 2;
--  }
--
--  if (shmctl(ipc_id, IPC_STAT, &shmbuf) != 0) {
--    shmdt(shm);
--    shmctl(ipc_id, IPC_RMID, NULL);
--    return 3;
--  }
--
--  shmbuf.shm_perm.uid = getuid();
--  shmbuf.shm_perm.gid = getgid();
--  shmbuf.shm_perm.mode = 0600;
--
--  if (shmctl(ipc_id, IPC_SET, &shmbuf) != 0) {
--    shmdt(shm);
--    shmctl(ipc_id, IPC_RMID, NULL);
--    return 4;
--  }
--
--  shmctl(ipc_id, IPC_RMID, NULL);
--
--  strcpy(shm, "hello");
--
--  pid = fork();
--  if (pid < 0) {
--    return 5;
--  } else if (pid == 0) {
--    strcpy(shm, "bye");
--    return 6;
--  }
--  if (wait(&status) != pid) {
--    return 7;
--  }
--  if (!WIFEXITED(status) || WEXITSTATUS(status) != 6) {
--    return 8;
--  }
--  if (strcmp(shm, "bye") != 0) {
--    return 9;
--  }
--  return 0;
--}
--]])],[have_shm_ipc=yes],[have_shm_ipc=no],[have_shm_ipc=no])
--  if test "$have_shm_ipc" = "yes"; then
--    AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
--  fi
-+  AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
-+  have_shm_ipc=yes
-   AC_MSG_RESULT([$have_shm_ipc])
- 
-   AC_MSG_CHECKING(for mmap() using MAP_ANON shared memory support)
--  AC_RUN_IFELSE([AC_LANG_SOURCE([[
--#include <sys/types.h>
--#include <sys/wait.h>
--#include <sys/mman.h>
--#include <unistd.h>
--#include <string.h>
--
--#ifndef MAP_ANON
--# ifdef MAP_ANONYMOUS
--#  define MAP_ANON MAP_ANONYMOUS
--# endif
--#endif
--#ifndef MAP_FAILED
--# define MAP_FAILED ((void*)-1)
--#endif
--
--int main(void) {
--  pid_t pid;
--  int status;
--  char *shm;
--
--  shm = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
--  if (shm == MAP_FAILED) {
--    return 1;
--  }
--
--  strcpy(shm, "hello");
--
--  pid = fork();
--  if (pid < 0) {
--    return 5;
--  } else if (pid == 0) {
--    strcpy(shm, "bye");
--    return 6;
--  }
--  if (wait(&status) != pid) {
--    return 7;
--  }
--  if (!WIFEXITED(status) || WEXITSTATUS(status) != 6) {
--    return 8;
--  }
--  if (strcmp(shm, "bye") != 0) {
--    return 9;
--  }
--  return 0;
--}
--]])],[have_shm_mmap_anon=yes],[have_shm_mmap_anon=no],[
--  case $host_alias in
--    *linux*)
--      have_shm_mmap_anon=yes
--      ;;
--    *)
--      have_shm_mmap_anon=no
--      ;;
--  esac
--])
--  if test "$have_shm_mmap_anon" = "yes"; then
--    AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
--  fi
-+  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
-+  have_shm_mmap_anon=yes
-   AC_MSG_RESULT([$have_shm_mmap_anon])
- 
-   PHP_CHECK_FUNC_LIB(shm_open, rt, root)
-   AC_MSG_CHECKING(for mmap() using shm_open() shared memory support)
--  AC_RUN_IFELSE([AC_LANG_SOURCE([[
--#include <sys/types.h>
--#include <sys/wait.h>
--#include <sys/mman.h>
--#include <sys/stat.h>
--#include <fcntl.h>
--#include <unistd.h>
--#include <string.h>
--#include <stdlib.h>
--#include <stdio.h>
--
--#ifndef MAP_FAILED
--# define MAP_FAILED ((void*)-1)
--#endif
--
--int main(void) {
--  pid_t pid;
--  int status;
--  int fd;
--  char *shm;
--  char tmpname[4096];
--
--  sprintf(tmpname,"/opcache.test.shm.%dXXXXXX", getpid());
--  if (mktemp(tmpname) == NULL) {
--    return 1;
--  }
--  fd = shm_open(tmpname, O_RDWR | O_CREAT, S_IRUSR | S_IWUSR);
--  if (fd == -1) {
--    return 2;
--  }
--  if (ftruncate(fd, 4096) < 0) {
--    close(fd);
--    shm_unlink(tmpname);
--    return 3;
--  }
--
--  shm = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
--  if (shm == MAP_FAILED) {
--    return 4;
--  }
--  shm_unlink(tmpname);
--  close(fd);
--
--  strcpy(shm, "hello");
--
--  pid = fork();
--  if (pid < 0) {
--    return 5;
--  } else if (pid == 0) {
--    strcpy(shm, "bye");
--    return 6;
--  }
--  if (wait(&status) != pid) {
--    return 7;
--  }
--  if (!WIFEXITED(status) || WEXITSTATUS(status) != 6) {
--    return 8;
--  }
--  if (strcmp(shm, "bye") != 0) {
--    return 9;
--  }
--  return 0;
--}
--]])],[have_shm_mmap_posix=yes],[have_shm_mmap_posix=no],[have_shm_mmap_posix=no])
--  if test "$have_shm_mmap_posix" = "yes"; then
--    AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
--    PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
--  fi
--  AC_MSG_RESULT([$have_shm_mmap_posix])
-+  AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
-+  AC_MSG_RESULT([yes])
-+  have_shm_mmap_posix=yes
-+  PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
- 
-   AX_CHECK_COMPILE_FLAG([-Wno-implicit-fallthrough],
-     [PHP_OPCACHE_CFLAGS="$PHP_OPCACHE_CFLAGS -Wno-implicit-fallthrough"],,
--- 
-2.40.0
-
diff --git a/meta-oe/recipes-devtools/php/php/0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch b/meta-oe/recipes-devtools/php/php/0002-ext-phar-Makefile.frag-Fix-phar-packaging.patch
similarity index 91%
rename from meta-oe/recipes-devtools/php/php/0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch
rename to meta-oe/recipes-devtools/php/php/0002-ext-phar-Makefile.frag-Fix-phar-packaging.patch
index 04bd40f4ff..b2c4f8840f 100644
--- a/meta-oe/recipes-devtools/php/php/0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch
+++ b/meta-oe/recipes-devtools/php/php/0002-ext-phar-Makefile.frag-Fix-phar-packaging.patch
@@ -1,7 +1,7 @@
-From eab5babdadea487bbbef025068c553f5ba741774 Mon Sep 17 00:00:00 2001
+From f7724d7ccd157058630e6a887798ab6d3e34c6b7 Mon Sep 17 00:00:00 2001
 From: Claude Bing <cbing@cybernetics.com>
 Date: Tue, 9 Nov 2021 13:07:25 -0500
-Subject: [PATCH 06/11] ext/phar/Makefile.frag: Fix phar packaging
+Subject: [PATCH 2/5] ext/phar/Makefile.frag: Fix phar packaging
 
 Inherited from OE-Classic, with some additions to fix host paths leaking
 into the target package.
@@ -19,7 +19,7 @@ Signed-off-by: Claude Bing <cbing@cybernetics.com>
  1 file changed, 3 insertions(+), 14 deletions(-)
 
 diff --git a/ext/phar/Makefile.frag b/ext/phar/Makefile.frag
-index 7a867dd7..4dbcafd4 100644
+index cedde76df..09d577d73 100644
 --- a/ext/phar/Makefile.frag
 +++ b/ext/phar/Makefile.frag
 @@ -10,20 +10,9 @@ pharcmd: $(builddir)/phar.php $(builddir)/phar.phar
@@ -46,3 +46,6 @@ index 7a867dd7..4dbcafd4 100644
  
  $(builddir)/phar/phar.inc: $(srcdir)/phar/phar.inc
  	-@test -d $(builddir)/phar || mkdir $(builddir)/phar
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/php/php/0010-iconv-fix-detection.patch b/meta-oe/recipes-devtools/php/php/0003-iconv-fix-detection.patch
similarity index 64%
rename from meta-oe/recipes-devtools/php/php/0010-iconv-fix-detection.patch
rename to meta-oe/recipes-devtools/php/php/0003-iconv-fix-detection.patch
index 49fb3a5886..46505cd329 100644
--- a/meta-oe/recipes-devtools/php/php/0010-iconv-fix-detection.patch
+++ b/meta-oe/recipes-devtools/php/php/0003-iconv-fix-detection.patch
@@ -1,7 +1,7 @@
-From a04aabc5b80371e579fbaffdd417627390d22722 Mon Sep 17 00:00:00 2001
+From 35ac74fce1a60025f8d126783b8aa7014eefdf53 Mon Sep 17 00:00:00 2001
 From: Claude Bing <cbing@cybernetics.com>
 Date: Tue, 9 Nov 2021 13:10:33 -0500
-Subject: [PATCH 10/11] iconv: fix detection
+Subject: [PATCH 3/5] iconv: fix detection
 
 Upstream-Status: Pending
 
@@ -12,23 +12,26 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
 update patch to version 8.0.12
 Signed-off-by: Claude Bing <cbing@cybernetics.com>
+
+update patch to version 8.4.4
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
  build/php.m4 | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/build/php.m4 b/build/php.m4
-index 93551d9ca7..dba50825fb 100644
+index e45b22b76..1bd3ccceb 100644
 --- a/build/php.m4
 +++ b/build/php.m4
-@@ -1945,7 +1945,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
-   unset ICONV_DIR
+@@ -1820,7 +1820,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
+     [Define to 1 if you have the 'libiconv' function.])
  
    dnl Check libc first if no path is provided in --with-iconv.
--  if test "$PHP_ICONV" = "yes"; then
+-  AS_VAR_IF([PHP_ICONV], [yes], [
 +  dnl must check against no, not against yes as PHP_ICONV can also include a path, which implies yes
-+  if test "$PHP_ICONV" != "no"; then
++  AS_VAR_IF([PHP_ICONV], [no], [], [
      dnl Reset LIBS temporarily as it may have already been included -liconv in.
-     LIBS_save="$LIBS"
+     LIBS_save=$LIBS
      LIBS=
 -- 
 2.25.1
diff --git a/meta-oe/recipes-devtools/php/php/0005-pear-fix-Makefile.frag-for-Yocto.patch b/meta-oe/recipes-devtools/php/php/0004-pear-fix-Makefile.frag-for-Yocto.patch
similarity index 86%
rename from meta-oe/recipes-devtools/php/php/0005-pear-fix-Makefile.frag-for-Yocto.patch
rename to meta-oe/recipes-devtools/php/php/0004-pear-fix-Makefile.frag-for-Yocto.patch
index 37752ef949..23641be2c6 100644
--- a/meta-oe/recipes-devtools/php/php/0005-pear-fix-Makefile.frag-for-Yocto.patch
+++ b/meta-oe/recipes-devtools/php/php/0004-pear-fix-Makefile.frag-for-Yocto.patch
@@ -1,20 +1,20 @@
-From f22958b4c1348eec3bb4c0f2cbe2d22676e0ad23 Mon Sep 17 00:00:00 2001
+From 35d7d40ac49c96b7a9a19b2f6593abb9f18ade2b Mon Sep 17 00:00:00 2001
 From: Claude Bing <cbing@cybernetics.com>
 Date: Tue, 9 Nov 2021 13:04:29 -0500
-Subject: [PATCH 05/11] pear: fix Makefile.frag for Yocto
+Subject: [PATCH 4/5] pear: fix Makefile.frag for Yocto
+
+Upstream-Status: Pending
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 
 update patch to 8.0.12
 Signed-off-by: Claude Bing <cbing@cybernetics.com>
 ---
-Upstream-Status: Pending
-
  pear/Makefile.frag | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pear/Makefile.frag b/pear/Makefile.frag
-index 9408757a3a..69072f39e0 100644
+index 9408757a3..69072f39e 100644
 --- a/pear/Makefile.frag
 +++ b/pear/Makefile.frag
 @@ -10,7 +10,7 @@ PEAR_SUFFIX = -ds a$(program_suffix)
diff --git a/meta-oe/recipes-devtools/php/php/0007-sapi-cli-config.m4-fix-build-directory.patch b/meta-oe/recipes-devtools/php/php/0005-sapi-cli-config.m4-fix-build-directory.patch
similarity index 63%
rename from meta-oe/recipes-devtools/php/php/0007-sapi-cli-config.m4-fix-build-directory.patch
rename to meta-oe/recipes-devtools/php/php/0005-sapi-cli-config.m4-fix-build-directory.patch
index 9776e7f6db..e551f19a48 100644
--- a/meta-oe/recipes-devtools/php/php/0007-sapi-cli-config.m4-fix-build-directory.patch
+++ b/meta-oe/recipes-devtools/php/php/0005-sapi-cli-config.m4-fix-build-directory.patch
@@ -1,7 +1,7 @@
-From 03aa51625e0d1aa156c2f7cd71503b1f435d35a4 Mon Sep 17 00:00:00 2001
+From 581751f8b612c381a4a7914a33bfc4130853d305 Mon Sep 17 00:00:00 2001
 From: Claude Bing <cbing@cybernetics.com>
 Date: Tue, 9 Nov 2021 13:08:06 -0500
-Subject: [PATCH 07/11] sapi/cli/config.m4: fix build directory
+Subject: [PATCH 5/5] sapi/cli/config.m4: fix build directory
 
 Upstream-Status: Inappropriate
 
@@ -10,23 +10,26 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
 update patch to version 8.0.12
 Signed-off-by: Claude Bing <cbing@cybernetics.com>
+
+update patch for version 8.4.4
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
  sapi/cli/config.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sapi/cli/config.m4 b/sapi/cli/config.m4
-index d17d531683..f2f87f9164 100644
+index 76c2d64e8..0c7436fd9 100644
 --- a/sapi/cli/config.m4
 +++ b/sapi/cli/config.m4
-@@ -47,7 +47,7 @@ if test "$PHP_CLI" != "no"; then
-   esac
+@@ -50,7 +50,7 @@ if test "$PHP_CLI" != "no"; then
+     ])
  
    dnl Set executable for tests.
 -  PHP_EXECUTABLE="\$(top_builddir)/\$(SAPI_CLI_PATH)"
 +  PHP_EXECUTABLE="${PHP_NATIVE_DIR}/php"
-   PHP_SUBST(PHP_EXECUTABLE)
  
-   dnl Expose to Makefile.
+   PHP_SUBST([PHP_EXECUTABLE])
+   PHP_SUBST([SAPI_CLI_PATH])
 -- 
 2.25.1
 
diff --git a/meta-oe/recipes-devtools/php/php/0008-ext-imap-config.m4-fix-include-paths.patch b/meta-oe/recipes-devtools/php/php/0008-ext-imap-config.m4-fix-include-paths.patch
deleted file mode 100644
index a1b93a2369..0000000000
--- a/meta-oe/recipes-devtools/php/php/0008-ext-imap-config.m4-fix-include-paths.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From c3c20db4415e0f6c4a601d6f9da1f3746a96b301 Mon Sep 17 00:00:00 2001
-From: Claude Bing <cbing@cybernetics.com>
-Date: Tue, 9 Nov 2021 13:08:58 -0500
-Subject: [PATCH 08/11] ext/imap/config.m4: fix include paths
-
-Upstream-Status: Pending
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
-update patch to version 8.0.12
-Signed-off-by: Claude Bing <cbing@cybernetics.com>
----
- ext/imap/config.m4 | 10 ++--------
- 1 file changed, 2 insertions(+), 8 deletions(-)
-
-diff --git a/ext/imap/config.m4 b/ext/imap/config.m4
-index 5086a312d0..0e938bd544 100644
---- a/ext/imap/config.m4
-+++ b/ext/imap/config.m4
-@@ -122,7 +122,7 @@ if test "$PHP_IMAP" != "no"; then
-     PHP_NEW_EXTENSION(imap, php_imap.c, $ext_shared,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
-     AC_DEFINE(HAVE_IMAP,1,[ ])
- 
--    for i in $PHP_IMAP /usr/local /usr; do
-+    for i in $PHP_IMAP $PHP_IMAP/usr /usr/local /usr; do
-       IMAP_INC_CHK()
-       el[]IMAP_INC_CHK(/include/c-client)
-       el[]IMAP_INC_CHK(/include/imap)
-@@ -211,13 +211,7 @@ if test "$PHP_IMAP" != "no"; then
-       AC_MSG_ERROR(Cannot find rfc822.h. Please check your c-client installation.)
-     fi
- 
--    if test ! -r "$IMAP_DIR/c-client/libc-client.a" && test -r "$IMAP_DIR/c-client/c-client.a" ; then
--      ln -s "$IMAP_DIR/c-client/c-client.a" "$IMAP_DIR/c-client/libc-client.a" >/dev/null 2>&1
--    elif test ! -r "$IMAP_DIR/$PHP_LIBDIR/libc-client.a" && test -r "$IMAP_DIR/$PHP_LIBDIR/c-client.a"; then
--      ln -s "$IMAP_DIR/$PHP_LIBDIR/c-client.a" "$IMAP_DIR/$PHP_LIBDIR/libc-client.a" >/dev/null 2>&1
--    fi
--
--    for lib in c-client4 c-client imap; do
-+    for lib in /usr/lib c-client4 c-client imap; do
-       IMAP_LIB=$lib
-       IMAP_LIB_CHK($PHP_LIBDIR)
-       IMAP_LIB_CHK(c-client)
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php_8.2.26.bb b/meta-oe/recipes-devtools/php/php_8.4.4.bb
similarity index 93%
rename from meta-oe/recipes-devtools/php/php_8.2.26.bb
rename to meta-oe/recipes-devtools/php/php_8.4.4.bb
index 1f1b91b22f..c49780a2a4 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.26.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.4.bb
@@ -13,17 +13,14 @@ DEPENDS:class-native = "zlib-native libxml2-native"
 PHP_MAJOR_VERSION = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
-           file://0004-configure.ac-don-t-include-build-libtool.m4.patch \
-           file://0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch \
-           file://0010-iconv-fix-detection.patch \
-           file://0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch \
+           file://0001-configure.ac-don-t-include-build-libtool.m4.patch \
+           file://0002-ext-phar-Makefile.frag-Fix-phar-packaging.patch \
           "
 
 SRC_URI:append:class-target = " \
-            file://0001-ext-opcache-config.m4-enable-opcache.patch \
-            file://0005-pear-fix-Makefile.frag-for-Yocto.patch \
-            file://0007-sapi-cli-config.m4-fix-build-directory.patch \
-            file://0008-ext-imap-config.m4-fix-include-paths.patch \
+            file://0003-iconv-fix-detection.patch \
+            file://0004-pear-fix-Makefile.frag-for-Yocto.patch \
+            file://0005-sapi-cli-config.m4-fix-build-directory.patch \
             file://php-fpm.conf \
             file://php-fpm-apache.conf \
             file://70_mod_php${PHP_MAJOR_VERSION}.conf \
@@ -32,7 +29,7 @@ SRC_URI:append:class-target = " \
 
 S = "${WORKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "be57c347d451c905bcb4336832a864d9928dd0e20989b872705fea0ba6476c6b"
+SRC_URI[sha256sum] = "192a325fd3ca09b6c528dd6014ee07d803c3162514d4bb0d3e0981d00ac700ec"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
@@ -74,6 +71,9 @@ EXTRA_OECONF = "--enable-mbstring \
                 ${COMMON_EXTRA_OECONF} \
 "
 
+# Set these values directly to avoid AC_RUN_IFELSE which does not work in cross compilation environment
+CACHED_CONFIGUREVARS += "ac_cv_php_cv_shm_ipc=yes ac_cv_php_cv_shm_mmap_anon=yes ac_cv_php_cv_shm_mmap_posix=yes"
+
 EXTRA_OECONF:append:riscv64 = " --with-pcre-jit=no"
 EXTRA_OECONF:append:riscv32 = " --with-pcre-jit=no"
 # Needs fibers assembly implemented for rv32
@@ -87,7 +87,7 @@ EXTRA_OECONF:class-native = " \
                 ${COMMON_EXTRA_OECONF} \
 "
 
-PACKAGECONFIG ??= "mysql sqlite3 imap opcache openssl \
+PACKAGECONFIG ??= "mysql sqlite3 opcache openssl \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)} \
 "
 PACKAGECONFIG:class-native = ""
@@ -107,10 +107,6 @@ PACKAGECONFIG[pgsql] = "--with-pgsql=${STAGING_DIR_TARGET}${exec_prefix},--witho
 PACKAGECONFIG[soap] = "--enable-soap, --disable-soap, libxml2"
 PACKAGECONFIG[apache2] = "--with-apxs2=${STAGING_BINDIR_CROSS}/apxs,,apache2-native apache2"
 PACKAGECONFIG[pam] = ",,libpam"
-PACKAGECONFIG[imap] = "--with-imap=${STAGING_DIR_HOST} \
-                       --with-imap-ssl=${STAGING_DIR_HOST} \
-                       ,--without-imap --without-imap-ssl \
-                       ,uw-imap"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[opcache] = "--enable-opcache,--disable-opcache"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
-- 
2.25.1


