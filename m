Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27B5C369D7
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 10:21:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.36585.1745317283468946030
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 03:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6207b20df5=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M4QqoF004866
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 03:21:23 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4647442n5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 03:21:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pYSlNqLQwDCbz06KvRwRhUbniCmOc9t5c6rBMrudFsJ9XolrtfrAIp9Ooz9mS5lWiNbpuCWSd4T860aetVknJuLGMwhomiq4iq3uJsEwtAObIfadg/QWP8jepLFoCdZlYAqzeONHs2L7RZj3Bq4ftuMmLT63ZiAeG9m8D573TfmF9GqLU13yaj4kBS4gaNCItPIsC5NfcHCB1hEe5IArtFAAu9KhLDONlRAm5OUnxPVbIKV7Fk8BeeKgHYybbbib137EptdfiNIh83r6N9lH2mpYwcCXuzI/Yh7yDocWsGHkCrHZS/VhuMpMzH97BqbD1NEAvwM2/qzkU+U1YPasWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEPggevKdV/SwtZVRRTUTr4hZsAqFfZ+d304W2XFFK4=;
 b=QyrRZYPGQ3hynIRmQC3UiUljD7lKKDg/K24sPe9t+7NjPapGH+iCncwWJw+WNM2UMfdvlv8uzmzKOMl3Y2ZF2MngvDFQmjbB16MulIyCEkTdbljgfg8p4dUu4QjoPm2Qi3JMnyr59L7RSMjH5/pDoV5qxpXJq47oCMiSkdUDhN6N58CrIXHg/EuBMIGUIVHF5RNPws79/pp+GKLp1ue/UScmUlOIb4RkgS76I3R04aeMvu8K96P/XVExjn71g3+AYJJTMxFTwQyb+XX7YmU3+KFZYYkdzgIO6gVJxKDGM9EW8LqWoE71iMqEecLujjSS1VBc5xzgsJQsR8rMns8yjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by IA1PR11MB7942.namprd11.prod.outlook.com (2603:10b6:208:3fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 10:21:19 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8678.021; Tue, 22 Apr 2025
 10:21:19 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH] frr: fix CVE-2024-55553
Date: Tue, 22 Apr 2025 18:21:07 +0800
Message-Id: <20250422102107.80070-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0113.apcprd02.prod.outlook.com
 (2603:1096:4:92::29) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|IA1PR11MB7942:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e7ff9ed-c4bc-4011-5170-08dd81876c1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Lo+UDV2Jfpah6B1s/cYpznbWlyDVS16G6Zpfbxhf+DX+LMYiiHnb8FAbUumV?=
 =?us-ascii?Q?1JcQ7FV8yZ0HD+k8aSCqOEU39c+FhrqcxrKd+CIc4cpEyQ2+U1G2hRJEbf2N?=
 =?us-ascii?Q?AH5rtTlP0AO8uU/x/hZRLCAvjD3w2GOT9qTrxOmGgMIgPnlAw8kVpIUbMncy?=
 =?us-ascii?Q?0tbJ2ype/xsLjk/P7qKz3zfK8zdGycD+JOO+ikZ2w4XuDyW5ZU+XLv3FgzwB?=
 =?us-ascii?Q?axNNc32209V/knsgnY/f1DfMY0zAaGuCywakMjVH0LE5Sn1F7yKF5yTxNNcM?=
 =?us-ascii?Q?axdhtk5926LTFKOdr7eapr5k7uT7GK3evkvLrpoimRaC/UNhg8BwexQ1LfAJ?=
 =?us-ascii?Q?yQhGb/yuzDPMr9e3ekMdn2UQYLqknYX+LDFRWCjRRU1PtKi1FQb7WhhCqLhx?=
 =?us-ascii?Q?Zs25Q9l76R48lKEyBK/ZZgTRjsIh1xuCEssRLAX71jf9nx9QBBtqkxU7G1lt?=
 =?us-ascii?Q?ktVAi5KQcK4B46SQ84knmcfr7HUFQwWWGiKUnSGDfj6nsbcKOM7GzeEKHXug?=
 =?us-ascii?Q?M836B+2mQhI6EbQ9Jb707OsM1uZmCfOm05zn+kjGSMzXI2eO96JtzTB97gI9?=
 =?us-ascii?Q?jokOlXL+dqc9XNXIxYzn3/OyratGjw8lwvmI936gKKQWhPGeDOuihCZvOgLv?=
 =?us-ascii?Q?wbn++kkyPmJ54gaeqhYPSNcqVWNZfekbmhQpDFzarl638q20fOB5bDC7tKG0?=
 =?us-ascii?Q?r1MoLoXe9i71bO1kapDnG+ZOcgy/SyPrIcC/5n4X0guTphVj95Epm3+mdLak?=
 =?us-ascii?Q?+/I3iLdIgZD0lFKfUCLgufdRrRVGnIlppZ7R2Ys0LbB+ZNGDqAUnxQUcPrul?=
 =?us-ascii?Q?dgZPMaHhQfdSXBbY1OctLpPpw3lb20xd1ew3+zIKO5waOuJTtlGM0J+DaKxL?=
 =?us-ascii?Q?DSyQcHiFZ+djbWLXdd083XKzxshmWYPs6WcCl/+WLa+tiByO+5bJkpvInvv8?=
 =?us-ascii?Q?p5etFsbY2jJJfJ7FmQIsngvEVJnj2swdcbOt/N4CyhztuCAMPnfwYcn99WG7?=
 =?us-ascii?Q?ErU3jT9Q/Ce3UMSrqGE+4VtEgRu5j/u6O9eVMH3KuAu0Y3fl3/AxK7dOseq1?=
 =?us-ascii?Q?VjgPPRVqmg7DU2bfB/lktEMNpcEp1xuW6V01IAWXEP3JQQllepKYaG0RRE95?=
 =?us-ascii?Q?spZE+YvdsFiDEWZlvPy+C2eahqDKEQ5h60x/tvGReVDgSu81xkiN3/eTM3zn?=
 =?us-ascii?Q?wMUJbFFEg+MmvhML8msAUZcSLubg15IrNxvxyU+kbds+j3kkDPIBVazzGbOU?=
 =?us-ascii?Q?u7rI5YYeGyJPDqSqLJdkqmXKpujsDm9CH3fqylLx4gDbUAjQqCjEE/VvhapZ?=
 =?us-ascii?Q?TdBgYGPWU3/ANzLfVKJ0J1jPmJBJGOA6fzMxRz6oO9KrfsGtur/a9mEUEafx?=
 =?us-ascii?Q?IYyTIL8iWzZtWJKtxBhbk7Wt1tLL9HZrK7IU8PATilwQMCFw5pYeLgsRXe/R?=
 =?us-ascii?Q?BK/1ZfUz9GVvCji2yAqaK8hpAQTcXvvx?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?smKKH4oM702EdMXLpTdk0mXVfvsSvr1uKWu4r0UYzFGCkZys3uoDc3LukCJE?=
 =?us-ascii?Q?TTkYE5lVxuIMfb8+frwy8avOx1jOfdXfnYHPEjM6wdAtpSTS71bVqgjLne/B?=
 =?us-ascii?Q?IFaCGUDl2LuS1yOoOr8O1Nkvn88wxYQy4V9ERzrKyc5SRp+3Amfm6nZtgMwi?=
 =?us-ascii?Q?GlFauiYRUZu5d0odUHvY7EWmWl9bpVl397sLy0OuF8q3V9jwAjEuIWsXOf51?=
 =?us-ascii?Q?ub+NvU9TC717Qow+CeDpqkpo3mDyf6bGXDd9ZD9iGA+nw+OOHaS45J8Zff91?=
 =?us-ascii?Q?aV2ZwEbkibB0jHXj1kNhyI4YlGIFHT9lObyKcjq/GPi7OLRLdS46m64qWGIS?=
 =?us-ascii?Q?RAFklVCQLym8AxFxec/Zj8fFcL3t9tc27Xea1ZYF4VXWezSEgb//JyeoGqWP?=
 =?us-ascii?Q?fjyvcgYeHMzqMRHM2Dv5GiacB/+lf9gw2lPpEKef3T0icU1OYgjVeW/aDDuv?=
 =?us-ascii?Q?XaZunc3tZl66G1ZSZRsifafnIEuy8qKn6kmeuoEH//4HH3UkziGC/rHGisPc?=
 =?us-ascii?Q?8mw7UUEhxf3Gj6cyFrmjXnYhopO7rUg+1dBTKw87SKHWk/o2J44S1obaPVrs?=
 =?us-ascii?Q?3mIQHuFoAsd9pFOdqMLo7m634TJlFEG+3VYzoTbjMsfebuve7MyXYe7RnBCX?=
 =?us-ascii?Q?PKueAByD7YsInFEQoeTz6d1PoNv6fhD/d2+10pe7JDN52uezpOlWrrAsPsDE?=
 =?us-ascii?Q?f7hWoLNvmZNBKRoJGvVLLlhvSd7n38xZky7hVGME6WZ+FGSy5uiElvTZHgfT?=
 =?us-ascii?Q?HlFNGR7RHuoal00qIaXDKz0ZBUK8kAN6UyoZ2GWCeczNRqBIaVaED9qfND0a?=
 =?us-ascii?Q?UnAXHkuBMGguPL996CBLSE2n7ahdoLBK0eoCkBvil8udApvrcixXyR57id7C?=
 =?us-ascii?Q?mJEFTMTe2/YD2PaiLZBwus12FLpajN9Ki/1VlI1lpMAs5H4YxctDNuG0XZDy?=
 =?us-ascii?Q?QJ5hZ7X8TkNrxnw4he2Kmf+9y05G84QFkjiMEk3+ROYHoBYpXr6Lc1567Y7S?=
 =?us-ascii?Q?tyblkxpxMciptxCa5EDyFuFzhiYDzrGrZGnpxY6ud66+RLJSlCb9vK2YOORB?=
 =?us-ascii?Q?w5EfgHV606b1tjU/9llqh3s31iy6AK/dQ7ptUx7bRa3n3h3MPkKZp7TAsUr6?=
 =?us-ascii?Q?3AvgK7POcW/YOvPUEMJOTTEjak1QAzz8zjeyiMFxaPuYaf3jAgCRMOsYglWn?=
 =?us-ascii?Q?o1Ah6mXo6nx8Sgjt6G40zPatCaFb9+x0HZt4Ze0inREnZz4sdcqLDESQkoH0?=
 =?us-ascii?Q?Iv1Mlgu4vKbhn1f8nd4Al9fyAJXI2jZNrcdpZfb62dCzZNy0F+GZW4TVtd25?=
 =?us-ascii?Q?Rghuf2UynzkcXreDBanMLFtvGeodsIAwflody7JkSaar7+skIFCG4PGB+5bU?=
 =?us-ascii?Q?miXpb8wTeTC992pmREiDz2PPEcjENOQJIFZxqdfv4eL3G9aftradJsG1krWg?=
 =?us-ascii?Q?BeRaKPUE6YP6yvzKbEnb84dKGm75Fmk8ykj2a0gI7Q7+Sy5CYt+WWkNdE6Ba?=
 =?us-ascii?Q?W4YYdpfC9VXTV9q28Y7OgAutkAe7A+VeID3NcMHgUtcYHmEY0ozt7MooVGbX?=
 =?us-ascii?Q?xWbXtNZHJ4WqwplFs/FjWGKPBuib0EG59UbAvko1OfdqfYgOUPLTivls0ADJ?=
 =?us-ascii?Q?KA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7ff9ed-c4bc-4011-5170-08dd81876c1b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 10:21:19.6609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5oNZci9cr6kfszbgDKxVO2eWq2qRkD6YO90TjDTVK6Cw4ky+1y07drTkUW0t6SbTATlujyLdxgDwURWYrg/L6TEuEoZXnxdVPrZIOeFfkpo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7942
X-Proofpoint-ORIG-GUID: s4eGOhpoxQaMjcD6HE1kN9raH0pZpNLI
X-Authority-Analysis: v=2.4 cv=UpNjN/wB c=1 sm=1 tr=0 ts=68076da2 cx=c_pps a=OnljjeCONrlUuPUItWmgXA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=PYnjg3YJAAAA:8 a=vzvababfAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=87jn28RfAAAA:8 a=Y6xVacGfMrIn87lTZJIA:9 a=tmvDmIugkV10B7WISx2h:22 a=FdTzh2GWekK77mhwV6Dw:22 a=aVDrfO6s1PESLM1EhDzk:22
X-Proofpoint-GUID: s4eGOhpoxQaMjcD6HE1kN9raH0pZpNLI
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 mlxlogscore=852 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504220078
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 10:21:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117053

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-55553:
In FRRouting (FRR) before 10.3 from 6.0 onward, all routes are re-validated if the
total size of an update received via RTR exceeds the internal socket's buffer size,
default 4K on most OSes. An attacker can use this to trigger re-parsing of the RIB
for FRR routers using RTR by causing more than this number of updates during an update
interval (usually 30 minutes). Additionally, this effect regularly occurs organically.
Furthermore, an attacker can use this to trigger route validation continuously.
Given that routers with large full tables may need more than 30 minutes to fully
re-validate the table, continuous issuance/withdrawal of large numbers of ROA may be
used to impact the route handling performance of all FRR instances using RPKI globally.
Additionally, the re-validation will cause heightened BMP traffic to ingestors.
Fixed Versions: 10.0.3, 10.1.2, 10.2.1, >= 10.3.

Reference: [https://nvd.nist.gov/vuln/detail/CVE-2024-55553]
           [https://frrouting.org/security/cve-2024-55553/]

Upstream patch: backport [https://github.com/FRRouting/frr/commit/b0800bfdf04b4fcf48504737ebfe4ba7f05268d3]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../frr/frr/CVE-2024-55553.patch              | 304 ++++++++++++++++++
 .../recipes-protocols/frr/frr_8.2.2.bb        |   1 +
 2 files changed, 305 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-55553.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2024-55553.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2024-55553.patch
new file mode 100644
index 0000000000..1183b1e58b
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2024-55553.patch
@@ -0,0 +1,304 @@
+From fc6837ad68e9724d7c15db6cb01bf9bb5beea8e5 Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Tue, 21 Jan 2025 16:07:10 +0200
+Subject: [PATCH] bgpd: Validate only affected RPKI prefixes instead of a full
+ RIB
+
+This is backport of https://github.com/FRRouting/frr/commit/b0800bfdf04b4fcf48504737ebfe4ba7f05268d3 for 8.4.
+
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+
+CVE: CVE-2024-55553
+Upstream-Status: Backport [https://github.com/opensourcerouting/frr/commit/cc1c66a7e8dd31c681f396f6635192c0d60a543c]
+
+The original patch is adjusted to fit for the current version.(8.2.2)
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ bgpd/bgp_rpki.c | 184 +++++++++++++++++++++---------------------------
+ bgpd/bgpd.c     |   4 ++
+ bgpd/bgpd.h     |   1 +
+ 3 files changed, 87 insertions(+), 102 deletions(-)
+
+diff --git a/bgpd/bgp_rpki.c b/bgpd/bgp_rpki.c
+index 0a51269d9b..69c5f44fac 100644
+--- a/bgpd/bgp_rpki.c
++++ b/bgpd/bgp_rpki.c
+@@ -67,6 +67,12 @@ static struct thread *t_rpki;
+ 
+ DEFINE_MTYPE_STATIC(BGPD, BGP_RPKI_CACHE, "BGP RPKI Cache server");
+ DEFINE_MTYPE_STATIC(BGPD, BGP_RPKI_CACHE_GROUP, "BGP RPKI Cache server group");
++
++DEFINE_MTYPE_STATIC(BGPD, BGP_RPKI_REVALIDATE, "BGP RPKI Revalidation");
++
++#define RPKI_VALID 1
++#define RPKI_NOTFOUND 2
++#define RPKI_INVALID 3
+ 
+ #define POLLING_PERIOD_DEFAULT 3600
+ #define EXPIRE_INTERVAL_DEFAULT 7200
+@@ -129,7 +135,6 @@ static enum route_map_cmd_result_t route_match(void *rule,
+ 					       void *object);
+ static void *route_match_compile(const char *arg);
+ static void revalidate_bgp_node(struct bgp_dest *dest, afi_t afi, safi_t safi);
+-static void revalidate_all_routes(void);
+ 
+ static struct rtr_mgr_config *rtr_config;
+ static struct list *cache_list;
+@@ -339,10 +344,9 @@ inline int is_running(void)
+ 	return rtr_is_running;
+ }
+ 
+-static struct prefix *pfx_record_to_prefix(struct pfx_record *record)
++static void pfx_record_to_prefix(struct pfx_record *record,
++				 struct prefix *prefix)
+ {
+-	struct prefix *prefix = prefix_new();
+-
+ 	prefix->prefixlen = record->min_len;
+ 
+ 	if (record->prefix.ver == LRTR_IPV4) {
+@@ -353,75 +357,102 @@ static struct prefix *pfx_record_to_prefix(struct pfx_record *record)
+ 		ipv6_addr_to_network_byte_order(record->prefix.u.addr6.addr,
+ 						prefix->u.prefix6.s6_addr32);
+ 	}
+-
+-	return prefix;
+ }
+ 
+-static int bgpd_sync_callback(struct thread *thread)
+-{
++struct rpki_revalidate_prefix {
+ 	struct bgp *bgp;
+-	struct listnode *node;
+-	struct prefix *prefix;
+-	struct pfx_record rec;
+-	int retval;
+-	int socket = THREAD_FD(thread);
++	struct prefix prefix;
++	afi_t afi;
++	safi_t safi;
++};
+ 
+-	thread_add_read(bm->master, bgpd_sync_callback, NULL, socket, &t_rpki);
++static void rpki_revalidate_prefix(struct thread *thread)
++{
++	struct rpki_revalidate_prefix *rrp = THREAD_ARG(thread);
++	struct bgp_dest *match, *node;
+ 
+-	if (atomic_load_explicit(&rtr_update_overflow, memory_order_seq_cst)) {
+-		while (read(socket, &rec, sizeof(struct pfx_record)) != -1)
+-			;
++	match = bgp_table_subtree_lookup(rrp->bgp->rib[rrp->afi][rrp->safi],
++					 &rrp->prefix);
+ 
+-		atomic_store_explicit(&rtr_update_overflow, 0,
+-				      memory_order_seq_cst);
+-		revalidate_all_routes();
+-		return 0;
+-	}
++	node = match;
+ 
+-	retval = read(socket, &rec, sizeof(struct pfx_record));
+-	if (retval != sizeof(struct pfx_record)) {
+-		RPKI_DEBUG("Could not read from socket");
+-		return retval;
+-	}
++	while (node) {
++		if (bgp_dest_has_bgp_path_info_data(node)) {
++			revalidate_bgp_node(node, rrp->afi, rrp->safi);
++		}
+ 
+-	/* RTR-Server crashed/terminated, let's handle and switch
+-	 * to the second available RTR-Server according to preference.
+-	 */
+-	if (rec.socket && rec.socket->state == RTR_ERROR_FATAL) {
+-		reset(true);
+-		return 0;
++		node = bgp_route_next_until(node, match);
+ 	}
+ 
+-	prefix = pfx_record_to_prefix(&rec);
++	XFREE(MTYPE_BGP_RPKI_REVALIDATE, rrp);
++}
+ 
+-	afi_t afi = (rec.prefix.ver == LRTR_IPV4) ? AFI_IP : AFI_IP6;
++static void revalidate_single_prefix(struct prefix prefix, afi_t afi)
++{
++	struct bgp *bgp;
++	struct listnode *node;
+ 
+ 	for (ALL_LIST_ELEMENTS_RO(bm->bgp, node, bgp)) {
+ 		safi_t safi;
+ 
+ 		for (safi = SAFI_UNICAST; safi < SAFI_MAX; safi++) {
+-			if (!bgp->rib[afi][safi])
++			struct bgp_table *table = bgp->rib[afi][safi];
++			struct rpki_revalidate_prefix *rrp;
++
++			if (!table)
+ 				continue;
+ 
+-			struct bgp_dest *match;
+-			struct bgp_dest *node;
++			rrp = XCALLOC(MTYPE_BGP_RPKI_REVALIDATE, sizeof(*rrp));
++			rrp->bgp = bgp;
++			rrp->prefix = prefix;
++			rrp->afi = afi;
++			rrp->safi = safi;
++			thread_add_event(bm->master, rpki_revalidate_prefix,
++					 rrp, 0, &bgp->t_revalidate[afi][safi]);
++		}
++	}
++}
++
++static void bgpd_sync_callback(struct thread *thread)
++{
++	struct prefix prefix;
++	struct pfx_record rec;
++	afi_t afi;
++	int retval;
++
++	if (atomic_load_explicit(&rtr_update_overflow, memory_order_seq_cst)) {
++		ssize_t size = 0;
+ 
+-			match = bgp_table_subtree_lookup(bgp->rib[afi][safi],
+-							 prefix);
+-			node = match;
++		retval = read(rpki_sync_socket_bgpd, &rec,
++			      sizeof(struct pfx_record));
++		while (retval != -1) {
++			if (retval != sizeof(struct pfx_record))
++				break;
+ 
+-			while (node) {
+-				if (bgp_dest_has_bgp_path_info_data(node)) {
+-					revalidate_bgp_node(node, afi, safi);
+-				}
++			size += retval;
++			pfx_record_to_prefix(&rec, &prefix);
++			afi = (rec.prefix.ver == LRTR_IPV4) ? AFI_IP : AFI_IP6;
++			revalidate_single_prefix(prefix, afi);
+ 
+-				node = bgp_route_next_until(node, match);
+-			}
++			retval = read(rpki_sync_socket_bgpd, &rec,
++				      sizeof(struct pfx_record));
+ 		}
++
++		atomic_store_explicit(&rtr_update_overflow, 0,
++				      memory_order_seq_cst);
++		return;
+ 	}
+ 
+-	prefix_free(&prefix);
+-	return 0;
++	retval = read(rpki_sync_socket_bgpd, &rec, sizeof(struct pfx_record));
++	if (retval != sizeof(struct pfx_record)) {
++		RPKI_DEBUG("Could not read from rpki_sync_socket_bgpd");
++		return;
++	}
++	pfx_record_to_prefix(&rec, &prefix);
++
++	afi = (rec.prefix.ver == LRTR_IPV4) ? AFI_IP : AFI_IP6;
++
++	revalidate_single_prefix(prefix, afi);
+ }
+ 
+ static void revalidate_bgp_node(struct bgp_dest *bgp_dest, afi_t afi,
+@@ -446,63 +477,12 @@ static void revalidate_bgp_node(struct bgp_dest *bgp_dest, afi_t afi,
+ 	}
+ }
+ 
+-static void revalidate_all_routes(void)
+-{
+-	struct bgp *bgp;
+-	struct listnode *node;
+-	afi_t afi;
+-	safi_t safi;
+-
+-	for (ALL_LIST_ELEMENTS_RO(bm->bgp, node, bgp)) {
+-		struct peer *peer;
+-		struct listnode *peer_listnode;
+-
+-		for (ALL_LIST_ELEMENTS_RO(bgp->peer, peer_listnode, peer)) {
+-			FOREACH_AFI_SAFI (afi, safi) {
+-				if (!peer->afc_nego[afi][safi])
+-					continue;
+-
+-				if (!peer->bgp->rib[afi][safi])
+-					continue;
+-
+-				bgp_soft_reconfig_in(peer, afi, safi);
+-			}
+-		}
+-	}
+-}
+-
+-static void rpki_connection_status_cb(const struct rtr_mgr_group *group
+-				      __attribute__((unused)),
+-				      enum rtr_mgr_status status,
+-				      const struct rtr_socket *socket
+-				      __attribute__((unused)),
+-				      void *data __attribute__((unused)))
+-{
+-	struct pfx_record rec = {0};
+-	int retval;
+-
+-	if (rtr_is_stopping ||
+-	    atomic_load_explicit(&rtr_update_overflow, memory_order_seq_cst))
+-		return;
+-
+-	if (status == RTR_MGR_ERROR)
+-		rec.socket = socket;
+-
+-	retval = write(rpki_sync_socket_rtr, &rec, sizeof(rec));
+-	if (retval == -1 && (errno == EAGAIN || errno == EWOULDBLOCK))
+-		atomic_store_explicit(&rtr_update_overflow, 1,
+-				      memory_order_seq_cst);
+-
+-	else if (retval != sizeof(rec))
+-		RPKI_DEBUG("Could not write to rpki_sync_socket_rtr");
+-}
+-
+ static void rpki_update_cb_sync_rtr(struct pfx_table *p __attribute__((unused)),
+ 				    const struct pfx_record rec,
+ 				    const bool added __attribute__((unused)))
+ {
+-	if (rtr_is_stopping
+-	    || atomic_load_explicit(&rtr_update_overflow, memory_order_seq_cst))
++	if (rtr_is_stopping ||
++	    atomic_load_explicit(&rtr_update_overflow, memory_order_seq_cst))
+ 		return;
+ 
+ 	int retval =
+diff --git a/bgpd/bgpd.c b/bgpd/bgpd.c
+index 7e528b2191..bfe96f0f01 100644
+--- a/bgpd/bgpd.c
++++ b/bgpd/bgpd.c
+@@ -3579,6 +3579,10 @@ int bgp_delete(struct bgp *bgp)
+ 
+ 	hook_call(bgp_inst_delete, bgp);
+ 
++	THREAD_OFF(bgp->t_condition_check);
++	FOREACH_AFI_SAFI (afi, safi)
++		THREAD_OFF(bgp->t_revalidate[afi][safi]);
++
+ 	THREAD_OFF(bgp->t_startup);
+ 	THREAD_OFF(bgp->t_maxmed_onstartup);
+ 	THREAD_OFF(bgp->t_update_delay);
+diff --git a/bgpd/bgpd.h b/bgpd/bgpd.h
+index 8b93c450e8..45db4752f4 100644
+--- a/bgpd/bgpd.h
++++ b/bgpd/bgpd.h
+@@ -426,6 +426,7 @@ struct bgp {
+ 	/* BGP update delay on startup */
+ 	struct thread *t_update_delay;
+ 	struct thread *t_establish_wait;
++	struct thread *t_revalidate[AFI_MAX][SAFI_MAX];
+ 	uint8_t update_delay_over;
+ 	uint8_t main_zebra_update_hold;
+ 	uint8_t main_peers_update_hold;
+-- 
+2.35.5
+
diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
index facc655e29..975607f5af 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
@@ -34,6 +34,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.2 \
            file://CVE-2024-31950.patch \
            file://CVE-2024-31951.patch \
            file://CVE-2024-31948.patch \
+           file://CVE-2024-55553.patch \
 	      "
 
 SRCREV = "79188bf710e92acf42fb5b9b0a2e9593a5ee9b05"
-- 
2.34.1


