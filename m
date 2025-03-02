Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11497C021B8
	for <webhook@archiver.kernel.org>; Sun,  2 Mar 2025 03:16:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.24332.1740885388569504678
 for <Openembedded-devel@lists.openembedded.org>;
 Sat, 01 Mar 2025 19:16:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51563d9d9c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5223GRal030026;
	Sun, 2 Mar 2025 03:16:27 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2045.outbound.protection.outlook.com [104.47.58.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 453qf10xsd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <Openembedded-devel@lists.openembedded.org>; Sun, 02 Mar 2025 03:16:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jF65ELOmJ+aGuH3uDt1zPuZUEE8vIwdnn3LKxBd0ZZNU2b2J3er/JuadqCpf8AAK8Ryjlb7UGiTQJMIHACvWjHWKHKl2mR/w/E74QV47VLd6q4H7QnrmsqapGDdKwDd7Bu8aCEbaq3dlLxIljGbdbvOfnqwvcthmFVVNN4CF+XaREroys1UXMDrSzLunfV4xW53xHHWegaOReXnrUG+dufwNjaBB1wao3JtGQ0n8EPFWSSYEB+pvgqP0pEA7nn0zYb/CptWtVITOLWlSV+AQ7DlTDjFSJogHyDlVF6zGBpLvx1IJsW6yufHOUH7ZthR+b/IO1TFwHHlSvY1hkpipaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yxbk9uHSg0zES1/YmrTiO2SQZaVgGmPpHCHqErOqPOg=;
 b=hXvCgdCALZgX29U5Hg62pcDf93yZ9gFikssa2Avq6qEvpWi+opwgoYcH9Aa7EMjz6OeGjAcLnomfeZQ6BfK9vxMf8KTrMcAaC23gnmBMHqE6aoiGOVU8LdewCaWNLTR3VXl4dzFXOypUrN2K0A1xcimw+TiZGKLydSV8OBuc8iomcWyQ6G0KyZ3Om/Waqtmt/rElTkAe0M/7FKC3jiyMtrnhnoRJVf6VN4bdnmuqjNlMHmOvBBXRUhVNBCeH2Tfw6hZm7QuqdYye1wRfTygdgsYK4LPf9dwXIzbzV6WjaBset9lbg2qWgqSETdoKmx0F5isy+Bh+EeMYirCBNdRhsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.25; Sun, 2 Mar 2025 03:16:22 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8489.025; Sun, 2 Mar 2025
 03:16:22 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: Openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] lvm2: upgrade 2.03.30 -> 2.03.31
Date: Sun,  2 Mar 2025 11:16:05 +0800
Message-Id: <20250302031605.243765-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:194::23) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CO1PR11MB5076:EE_
X-MS-Office365-Filtering-Correlation-Id: 52097c8d-c7e5-4b5e-4eb3-08dd59389ba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6OcmvP2fZzQNYjVmz3c290rziyZjjXJCrWUUeInzObpwtnSdAZWprBgcuvux?=
 =?us-ascii?Q?4OHd55JrqyblJzWDkUfbhDHzNgANlRRA9cvmBbsDv6BriChMT6f6lfCk3szz?=
 =?us-ascii?Q?gLxIvNW1/TmLw1zytG+/xOuT3yTWrd+KGbl8A7hlJ5nGsJqPptF82tT2/jE7?=
 =?us-ascii?Q?7YOVKexkPKcP6s5y63JomeU3WpIuIXDur/nQRMsLZ4ZkwXQB2pIZqhDlKRve?=
 =?us-ascii?Q?andCKOCtSLTfRKsdpq5Yd+FTSTG2RghN4iyJS0XWsS06HdrGjPbswHRj+UZY?=
 =?us-ascii?Q?YmRmh8IXXcQQQ5XHNYMaTPcZBJrxSxYAL+Sz1imN+NmWe2dnj9JPZyvAEpiC?=
 =?us-ascii?Q?6XcoQ/9D8yT+yd9M5nubAnXsV8m+KTaeBa7ESFylCz+d43z7qf3da5p0EVqx?=
 =?us-ascii?Q?irFln7sk2pRPfE3p/wwP0KX3tLQsq3UE8/HQ9716cw5aHOHZH5R3e3yCaJp6?=
 =?us-ascii?Q?btsgFh7Ci59IAKu+iixIvFvWSHUXAm4q8Lna2EoX0TOgxjJMaYXX4XStwTdf?=
 =?us-ascii?Q?vSc4XVojXmhHjLdol5TkMQLx4OsVSiUtyD/rlKXGY7oOVP8lSyXUepdIWmm9?=
 =?us-ascii?Q?SnZ/1uGI2Rk19BzWVkjRMC2EQL0gQ2M9rgcgNi0iNhoejUVfbuWA9lbjcoZ8?=
 =?us-ascii?Q?bXst7D0sTDOD3JkIVG5zN1eH2uLkP6dYUKkFO3jk1K6z+oYgRYbAyJoDeo2V?=
 =?us-ascii?Q?MSbWtYCaLEuqX2Di3GBKlztkj2/fq9O8bHO2Nws2uLpHCYT+9F8S5XI4J5qB?=
 =?us-ascii?Q?aOTqYy7rS9LCl7EI2djx2pmR+V7MvpJ1pVCqMqWtou0HYqMefk9vcdhjPQzy?=
 =?us-ascii?Q?Z98Cd/nqUNx9qGd6lNVIV75veUbFEOwyzhI8uNDyqCwAsL0v/DzgDIYsG+T5?=
 =?us-ascii?Q?5vuN0Cvvgy5JEaWbsUM4W5xro/PeIJbQoYNSZv/gg8EvaUtmZZ05nwmrqu9g?=
 =?us-ascii?Q?utb0KxSacawTi/lFoQvJTgm/AfZ8+TIsmxvdrGn/rYPvEH+42cBZAbyNHHAE?=
 =?us-ascii?Q?EvFM9d2pJelM6iZvI9mKLB+x/EpMs1Se3yw3MZmI0zpYV+Mxrnl3tQozfRKr?=
 =?us-ascii?Q?Eh/IaDBncxt5XWqlOqKmHD7RX9SuyzwTwX1gYqZVchK+8PYO4Lz4y/lJ6cx3?=
 =?us-ascii?Q?BJgD8mKVK9QvOciHzyh39uF0KW8umSodQj0kiwRyB2Vk/rpQBW2oPEbeVrfK?=
 =?us-ascii?Q?9qea9KeYQ9PpxrIdNGUoZpFt6sOs3c5axt6W6bLwcakieMzoqMcX/6UjwG0j?=
 =?us-ascii?Q?Gj3LGzFEgQMuyk/SYjycvZbVBfGigqM9cv49/NGBtA3h/Nht+dGVHxl0TYle?=
 =?us-ascii?Q?XltD85s/BcKc5dM5I2H4kqbqKL+0Mx1SNQH6QpMir0QDPVWjo7my3CQZZTZE?=
 =?us-ascii?Q?YW98RNqGHnh5C7NLCIcSK36/KvDehvfr7Ws5swJXA1H5XhmVlhkOzmsZKzWQ?=
 =?us-ascii?Q?iffR7Q30h6WH371tQ2J9zNLYlo7TCX7u?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ChTVcTCFSgRlfdTXwieVHOTfOg03iyPTKzEK4vx8QnVg9ipgLoS+8SSSep+f?=
 =?us-ascii?Q?DU0Hgiir9Oq4DQupzlaqD14AGd0zrwTeygTicNkQmSdH2TYh9NBEKAD9983S?=
 =?us-ascii?Q?awTuLt4a3sswQj2yf0OJean5CcN6UJzsN4foyUr2foSfqyzRHwYqCH2ziTB7?=
 =?us-ascii?Q?/kO/Xx7BUdfOC5XFUZQV+C0uAP6IqjCrNBY76wRrM9/mLXJJb2VYZOwuf7iw?=
 =?us-ascii?Q?CoOrUvYnJ7ckmXkn9sPcVTPjJv/g+559H+pbRZAlIo+Om44vs4oJonh9Y/gh?=
 =?us-ascii?Q?uWaWIjxhqum7j0LB10jo23jD/AQVKBuU3kbSAs30aIJtYTwBuIhUELYftqSW?=
 =?us-ascii?Q?f+UWWJkFx4AMU8bAIlVltWE+uZQjx84XZrhso8gZOt+Eju8opbcoTOQx0sJt?=
 =?us-ascii?Q?yu/FOn5U7VNzVSzhtx/rszG2tekJ46WujHf4J13vPBdCSn+m74fltSF2KiHt?=
 =?us-ascii?Q?VJ5UXatotlqD4uZoaYkYo4dOD5MSOhHSRjpbe31rzx1xug0C5tNCQmzZ0/u7?=
 =?us-ascii?Q?yDXwJzcglrd31twz+q7KWAyMUfJCNRDQXXp6bRVyoF3+mRJTokQcY5B50guA?=
 =?us-ascii?Q?sykXfLETIetfIfKRsjX+aibao+NN4UEvca5BUHFMZ4fafuT4UYpCkZn3LZv/?=
 =?us-ascii?Q?d826Ew55VI9ci/AASGjn+BFDXeHGfrAcQK14TxNzr/YrTlEoc8N449b1BT3P?=
 =?us-ascii?Q?cxDoIEQ7r+bnR6lJR+/vLykDF26g6udRxskjYnIlNjU/No7KfjL7CtYsbN4n?=
 =?us-ascii?Q?zFW9Ex93bT9hv2M60lkhielLp1KSJ3rTTZ+iWZxIgSWjUPQ7AwtR3Ju0RRrs?=
 =?us-ascii?Q?QnCFXRjIHZpxtcF4uUcJYeeBFIHfh1wsZl2sJgff+WbQGXsv/9GZ9Z3vdYR8?=
 =?us-ascii?Q?2jtKtyu7yWtkHbfB6SONgaQOm/KJLq4h3wWIOLr3swqf7clovh7KHmiFElKa?=
 =?us-ascii?Q?Xb+nNE17ehN96jJ39lL8yo+qn3r88H8Q9ydAFK17IwmAsPySyH4llOAIJuNF?=
 =?us-ascii?Q?834J+sbC0v0ETBOf0lwm+0qvV7TXEIfry2xyuIzZMVSlFje+KPpGi2nNBoha?=
 =?us-ascii?Q?6dCSkBfAqnccY2pqHrenRC9cNRx6OhsQ7G4qOvAqnrpkgHc8+jbXu/lOTZL7?=
 =?us-ascii?Q?vqFzHaMe/zuzWqOlZ7Y8ATt42lJFktrrzEN22HGRRFLs8Jw1i87cCQfHXQyj?=
 =?us-ascii?Q?5jTkd3fADq6rkISMqgc5k78xGOxvBHVMUcNXTMyBEW/QB+90j5mU3XAQoS4e?=
 =?us-ascii?Q?fukq/oRzkh/Vz0pB0qdFxmJjLhmknxDIgOrQgSmEDIkT+Rq7Y8kkuWQ+UoMJ?=
 =?us-ascii?Q?voreeTvT0SCpmP/g5OvibKkkOkrSbFw0S4aOEzyw6EAUots39cNKAiKhCXNI?=
 =?us-ascii?Q?ormWBjd5bceHZqORLr44n6GdUPC2R2RYM1RcEPUJ0zMYkAFDD4YAOjbmjF0o?=
 =?us-ascii?Q?9n4fwfqawPLjGG53pfVhqUVtc6W1eTgdJMGp8peGfBfvk9d8MN1fvA3jVnt5?=
 =?us-ascii?Q?0PgsWnq1J8awxDff1UK2ZGil06NBUdMB9xub1ZGTKwglwuF72KF3qXRzlD9Y?=
 =?us-ascii?Q?tiv86uaHIMWSj6nh9dn1/+mVYsro1QjjGHvbITZx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52097c8d-c7e5-4b5e-4eb3-08dd59389ba7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2025 03:16:22.2769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZGnaoRA99CAiPM5MnV06C5rciUTRByktfVz7QWXZNbi5YYBikgNi3H5OjN9GcW/YfdKWnVTl908qooVLmLwEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5076
X-Proofpoint-GUID: BzJhCUh5u23m4TzGSQJiYNvjRkzERdAQ
X-Authority-Analysis: v=2.4 cv=Yon1R5YX c=1 sm=1 tr=0 ts=67c3cd8b cx=c_pps a=Syk5hotmcjzKYaivvMT4gg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=CCpqsmhAAAAA:8 a=-BxfUYYB1eCO3DIVA4EA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-ORIG-GUID: BzJhCUh5u23m4TzGSQJiYNvjRkzERdAQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_10,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 phishscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503020023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Mar 2025 03:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115720

ChangeLog:
Version 2.03.31 - 27th February 2025
====================================
  Reduce 'mandoc -T lint' reported issues for man pages.
  Restore support for LVM_SUPPRESS_FD_WARNINGS (2.03.24).
  Fix uncache and split cache restoring original state of volume.
  Extend use of lockopt skip to more scenarios.
  Enhance error path resolving in polling code.
  Disallow shared activation of LV with CoW snapshot.
  Fix lvmlockd use in lvremove of CoW snapshot, VDO pool, and uncache.
  Improve mirror split with opened temporary volumes.
  Improve pvmove finish with opened temporary volumes.
  Fix backup limit for devices file, handle over 10,000 files.
  Ignore reported optimal_io_size not divisible by 4096.
  Fix busy-loop in config reading when read returned 0.
  Fix DM cache preserving logic (2.03.28).
  Improve use of lvmlockd for usecases involving thin volumes and pools.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../lvm2/files/0001-include-libgen.h-for-basename.patch   | 8 ++++----
 meta-oe/recipes-support/lvm2/lvm2.inc                     | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/files/0001-include-libgen.h-for-basename.patch b/meta-oe/recipes-support/lvm2/files/0001-include-libgen.h-for-basename.patch
index c57bff865a..2fcbc12b22 100644
--- a/meta-oe/recipes-support/lvm2/files/0001-include-libgen.h-for-basename.patch
+++ b/meta-oe/recipes-support/lvm2/files/0001-include-libgen.h-for-basename.patch
@@ -1,4 +1,4 @@
-From 4e2dc175e99792d84873a4785ff1524845267c3e Mon Sep 17 00:00:00 2001
+From c7a63e17fc841eab5874aa5dc4e848e2bf300bf0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 25 Mar 2024 13:07:28 -0700
 Subject: [PATCH] include libgen.h for basename
@@ -16,11 +16,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/lib/device/device_id.c b/lib/device/device_id.c
-index b3330f2ba..291bd5c73 100644
+index a3f341bfc..0c05eb151 100644
 --- a/lib/device/device_id.c
 +++ b/lib/device/device_id.c
-@@ -28,6 +28,7 @@
- #include "lib/activate/activate.h"
+@@ -27,6 +27,7 @@
+ #include "lib/display/display.h"
  #include "device_mapper/misc/dm-ioctl.h"
  
 +#include <libgen.h>
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 9ff7662a51..ffa6a9a15d 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,9 +18,9 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
            file://0001-include-libgen.h-for-basename.patch \
            "
 
-SRCREV = "9f81fccd65a29030bf70417e8aca659ae536e081"
+SRCREV = "3a6e221c569eb253fa38a772b15e53b5de65b5d1"
 S = "${WORKDIR}/git"
-PV = "2.03.30"
+PV = "2.03.31"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
 
-- 
2.25.1


