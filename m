Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86090C83F1A
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 13:42:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18216.1753018971076618721
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Jul 2025 06:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9296bc4a83=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56KCjQnH3632837
	for <openembedded-devel@lists.openembedded.org>; Sun, 20 Jul 2025 13:42:50 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4802b5s2c3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 20 Jul 2025 13:42:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7vDzYQ567bsCKS/LVneJcmocmEUjcxK6/r+IlITwt2KWJDDEUcxMk3LcxftV4b1NqeduRKl7KUsSa2VLGMk++6JJOzdb0tow+k4XYz3p01G0h7XLxFXIh52sfPFy6VOiecSVLF48XR2GXGerRr6SWtFAYUKXwKLI6rF+erGHEQZhsLAVLy757J6MEYUqaaa5Gwewixh2cbXa4VMC7IZaDtCnvreEe0gd/+4KQghuf6K/Y8MWUoiACO5jgsRt8hli+MO+SMKDmbn93fzZLs5+XGwryicvjB5ratF0BIXLz+VL1ecod+gZVrTa0MQL7uypkS0aY6Ihj5fWfcPlsrbhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vY2gxI/L9myb2CiGceapA+ZvbHtpqY+PnRWYY+uX8r4=;
 b=Tv141LoAZ7+QTgnM69u5aU7qQ7YAEHtHSpa70j+CK2veKZy/dyFm20xP6zQBy0ll6dBoLqoUBBzZpRFNnxrZd9fb2N9EmnPHoCKC1PqzrHkbkntC7QJcq5S4DFHDfNBGHKBNCmLAbop4cfDRreDfQ+cSZmpFvSR+uo4ZOoDNcFeV76Vf82m3Q8tHoainnL8643o72pG0AvW4XLMJM0AfufipGA9EgzZO2D3no7nWHopZeR+9+SQ141rnpczTU5wLjMydBndKKbtPX48NJmrjpATkZtssOGAyDEJQzc1CgA2y+Y4469nOHX+4QprWWU6XX9CM/v325V7GuuSyyybv1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH0PR11MB7563.namprd11.prod.outlook.com (2603:10b6:510:286::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Sun, 20 Jul
 2025 13:42:47 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8943.029; Sun, 20 Jul 2025
 13:42:47 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH] ufs-utils: fix crash for ufs-utils list_bsg
Date: Sun, 20 Jul 2025 21:42:14 +0800
Message-Id: <20250720134214.3791909-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0118.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::16) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH0PR11MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: 19ac9506-e2ab-4ab2-9f69-08ddc7935021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cPtvvfj8AfjuoNArrC5VMwPS8bIllvhupAQn5CuM789a0HkKacpUrnN8vOHR?=
 =?us-ascii?Q?sCjH3nz7faGgXcvSkkSaXj04bzc7jlzmY/DU5yA1LhfVMPVsGCrYIbF1S9pq?=
 =?us-ascii?Q?7UrZa7TMjVMv6v04xs2lP9ch3ER4iNsocaG9HTmJ7eDnWfPeu3F2Ahktc4GF?=
 =?us-ascii?Q?Gjt+OWEGMTVY9EXgGTg7cdZ1kopwsZFD3lPu15ZPiNyQqTdtsnBvwkfx8U1v?=
 =?us-ascii?Q?v409fv+govrW4lwGGCzTe48UUZndcUMTy4Zst31hjT+je2JaQbdvUluvU1V9?=
 =?us-ascii?Q?PRmiFbJcYdiMZCw48yZfHzcpR/927314M2Eej0n/3Z2BjSgFhMf+OfKJatlE?=
 =?us-ascii?Q?58/NIVmyweGyqa4Fi44zMAIMfxtrGLOZZmZuYLcOs5pzHPiytufWfY0gbcr6?=
 =?us-ascii?Q?SHR4wMEhnSQmWa4c7unaa4bzUjkkL5WTJx9SgCaYcYHo5dVRQTM6GS7VaJzB?=
 =?us-ascii?Q?R2if09rasKGSw67v2uD/oG0c1ZeJG+rJC2DgkxYaTqlbvs4vSdMnTWo6ijl3?=
 =?us-ascii?Q?70BqX7mGV8BszirbzvhOTEgARXxXyXBZz6uXxB0ZZmTasW5ReSMpWOLxhj6f?=
 =?us-ascii?Q?H9ZW2MJRfReUO7X70kua7NZBsdg4cBtk3gj9+KN7Wm3Ixz1whUfxUvwrqZ/P?=
 =?us-ascii?Q?lY6t2pkbn6pd59o+wHE7CFiMCzCI7uiV6YvsLDnVTwi9hNlsZIqsMx4BAhpY?=
 =?us-ascii?Q?ByRjEmnQ54XtKrPlcMy5GNpHQW/H4wQ5oQcv0BxXG+l61QgKH2Hur1HkCzlA?=
 =?us-ascii?Q?xObQE6/HvOz1nz2RS3opteIGJlKpqwUZeIXJDNifDG6W9wgAsYekWY3zsrYV?=
 =?us-ascii?Q?RS/ZoTu0WcmKTXGh510pE9Ab7oC7Ze8tl0tE7GqRceAGrKcDZgQ2x4Zr1Ldw?=
 =?us-ascii?Q?PUTOb9G04VzCp8E+9FVAy8okBb8045ocDSzKA4MrZSGqcfnydOxJ+sbDIK7M?=
 =?us-ascii?Q?OoOBxTGGYcSkqdEZN7DFFBwbnfFtHt/VfcwEJHOZBqbWs4SF9WGoqBbkH/nM?=
 =?us-ascii?Q?qaQm8e0cpO13Lge8hh2Li+0aDeMupquKMQYF5BdsNB+u6ZrT06TVw0ywJxG3?=
 =?us-ascii?Q?i6jxy8VhVbRmNA7Ai+PyskKXI3HgjacYaJ5cQRWH+Y1INImFR4ZGC9+hAEke?=
 =?us-ascii?Q?wcOSvcFx1SAg+XlEkZIA9FE0KL5h3ghrFT8+A889E5rem/zmfL+b375aODba?=
 =?us-ascii?Q?a1EOVn8Fy1kUP+BA9g6oOiri9LRebKHScRKB4HZIqsNd/PCXUy/Aallv3My9?=
 =?us-ascii?Q?E69Brp7RyO/9qOYn6dkk4CGaCp4wBQ4zCCtqxCxFAZ+OgoljQbd4P9OB4bT7?=
 =?us-ascii?Q?utso2wrA9MNVnoeUIuqOV02MRjY4L2jk9zVX/PZkSuctUhJngZY6aer6n75I?=
 =?us-ascii?Q?e7e9WnKENqpOoTzHX3Rz628yT/+MQy5BLbqKSwkckVpZlptww8DBiDRlBnDk?=
 =?us-ascii?Q?9aie4HaFdko+FnJO2/wZZyWDgQJaHbMLwnsC9oC6c3+1hVSazmH++LZW5rtL?=
 =?us-ascii?Q?OmSsBQ84I5GlYZs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DasfsyxIsQTTDYGhrHkT4Aw6et1PTLPvSW52ESTySQWhj0JobyezxGJFldHJ?=
 =?us-ascii?Q?jEG0dAmXhQ6tWrHQSgRGfvqFwxJjZodJI5ooymOaeHGxno/7h6GG6iz0hyeE?=
 =?us-ascii?Q?wEtk/JXekaZngmOh4eNzUjbP/4BcDeRJm5KIftNHmtz6rdzzqXGB5nfbM4gB?=
 =?us-ascii?Q?519OyAJeiM+nAcK3j53LZO5BXkOqoDUQ7QxsI3//iV7RinIwSMkKmNvLmfVa?=
 =?us-ascii?Q?QjDx3Q/1QEpwv30YwLC2YfcZ6iUJvUk4HCwJaEsjs66OFMBb7WalxLk08yEC?=
 =?us-ascii?Q?N2FTd4WG70pFp797A1zoHzz5LusixhLpMyyi9LWHrVMVvtLkxkzJlgYpAa0Z?=
 =?us-ascii?Q?fEwJWIU3/gFsLu99kqkCqVTtiCo/X0SzUJpkPFqj4KVxvMsonPVnzduQDBZy?=
 =?us-ascii?Q?iZ6m6vpx+Q7wzhznea2l39y4NMHBmE3e3bM7xdv23NQD42sOv0CksAn/A2MQ?=
 =?us-ascii?Q?k3ZiOysrOf+QXZnKhgPXQ8xcvJovIWXX0JAf3Y26I86wvl8sYWJehwUo3sf+?=
 =?us-ascii?Q?D0wa5p9PGYz2Djpg7UNV4WuPmhEdh7XNk+D/9Klz2bNM5N0uF2DrA4/giihm?=
 =?us-ascii?Q?QlSfpKbqNljfyXpzQVmvWWeU281N/b13ZTFKNk53NYd324Cxt01XK6+nmE81?=
 =?us-ascii?Q?EGlbp7f2ZNHT+mVelQ0EFkVMm8npt+mgSFYX6XoLhLo+Lm1JnpyHMl5ImIzo?=
 =?us-ascii?Q?f3e+oJZKCZMq7fUEqhtrOLnbU911l6kogMpoFbsz7op5RMXmnBswh472jAVs?=
 =?us-ascii?Q?he3rB1B5CTLfukgJaEtqfiMgKvznsEMOVCN2Qw+aaMm98BCEfsLqUWyPH4lP?=
 =?us-ascii?Q?ObYjuiu/+9iAE72r365MVR2zGzJkdemMecYxlEqFptmOn+2TIQaXqkBEb+6t?=
 =?us-ascii?Q?b0ZjxZDbejm7JyNPDMnvguTu2lZP8P15bnWKdjhYy0AuykZdccBZtbEFzC11?=
 =?us-ascii?Q?Xiz6nVSMk6qpN9VyY5z+1m7bOgh8qrk24to2HXk0hqmK7s3Rg92yVbDABC/P?=
 =?us-ascii?Q?nkYnyl4ZHmiaCVy3IJwATm+RRiJhQjKkxraZLE6/gFPbShvQRP2sWJzhEiaK?=
 =?us-ascii?Q?OqgqSlWpA9RwfgBFQt/fvir3ok9cq9u9vJ5QkwPZv8nbtW1i3BpCowXPNRl1?=
 =?us-ascii?Q?D0EPdODteGdaRA6kY/9wNN5RYeR67Zod9kPYSz1YkMpj4qDfXIvBWB1+9HyN?=
 =?us-ascii?Q?ERluPZBP/97C94TvLh2rB/PnE3gBMh+9PT1/DFAUMQZwWkOORNr/dX0bO/9f?=
 =?us-ascii?Q?UmiTb8wpM8ZnPTHb6PpRoCLhQI1kE/8tD9URP6dHeOKtaYHTxza8Z6aVlLvg?=
 =?us-ascii?Q?vN4UI6knTPwqS3sIjynw2v1O2GzUbVw1TU/0LtkzB/WoSpJpL2J1A2vANrrR?=
 =?us-ascii?Q?/ceiE60hnG3qVi8RC+4TLlMWmMf4bikuMMLjReu5f8Zp96S+0ZZiUyS951TM?=
 =?us-ascii?Q?PTitEqr2tkBEuqSVLQ2qYOUc8STAb5rHaq5nym67GgqWoJh8iFY6F0bFKzSz?=
 =?us-ascii?Q?KyU2+au8xuAQKZxukmpRq6VzzFX79cd8IDILb4cAH8Eer7qjUqmy5DWC6VuQ?=
 =?us-ascii?Q?zPp2ZZw/pXyHZiUqatdPcMaDPsGpSk4bs4v6kYKx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ac9506-e2ab-4ab2-9f69-08ddc7935021
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2025 13:42:47.6540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2OYRGhApWwjGLvw+zcn6OIiRd7WQA/bDL+KiuG59yMbwbWyAhlkKWMS7MsA2CgqpFdQAa/HYWNCcn69Y7vpoaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7563
X-Authority-Analysis: v=2.4 cv=b6Oy4sGx c=1 sm=1 tr=0 ts=687cf25a cx=c_pps
 a=QqSBEdqS7BUxypinyQlWrQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=qWDSxcjIN3VCs_WSRCkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: x4Qe56H0VCIQPBOj4NplM_BlGPDALgc-
X-Proofpoint-ORIG-GUID: x4Qe56H0VCIQPBOj4NplM_BlGPDALgc-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDAxOCBTYWx0ZWRfX/h3EHij0aLzZ
 71+yB3ksjA2hhx7Nm837iHzXtCPe6LplpnvOy2buvXy1MkDvnp8MofwG135dQ2CPDbvbheZMRRq
 U96Ok/5unFtwDKIDU1JhpqwDkwtYv3rxGze67uCVXYonmxT7+BHdxIP0dMOvzskI/VN0iaY6FNC
 YmlsuqpUt603+IYYaAiUzgOC5DtWhrrEBKHp+fUfTn5gWWUUfJrM9rTQ/NPdc21LnMZfOcpDsdd
 8kOOK0Ht2jssYkyfA+eVLpJbi/4tlj+1Wy0zkdZPJxi5kg9ufHyJ11DnSaaUePg1so40zvDBybc
 wbOYBXrvGemAAb8LvVMrIwM1y+Dz3ZtgkMRUYWpoJeaQK5WhRS9th0J6D8CJg7NSLiKO1eIZM9E
 EmycXhUl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-20_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2506270000 definitions=main-2507190018
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Jul 2025 13:42:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118638

The full_path buffer in find_bsg_device function consists of:
path + '/' + files->d_name + '\0'

So the buffer size should be: strlen(path) + strlen(files->d_name) + 2,
not: strlen(path) + strlen(files->d_name) + 1.

Backport a patch to fix crash when running 32-bit binary on 64-bit
system:
$ ufs-utils list_bsg
malloc(): invalid next size (unsorted)
Aborted (core dumped)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...l_path-buffer-size-in-find_bsg_devic.patch | 39 +++++++++++++++++++
 .../ufs-utils/ufs-utils_7.14.12.bb            |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/ufs-utils/files/0001-ufs_cmds-fix-full_path-buffer-size-in-find_bsg_devic.patch

diff --git a/meta-filesystems/recipes-utils/ufs-utils/files/0001-ufs_cmds-fix-full_path-buffer-size-in-find_bsg_devic.patch b/meta-filesystems/recipes-utils/ufs-utils/files/0001-ufs_cmds-fix-full_path-buffer-size-in-find_bsg_devic.patch
new file mode 100644
index 0000000000..7ae858a65e
--- /dev/null
+++ b/meta-filesystems/recipes-utils/ufs-utils/files/0001-ufs_cmds-fix-full_path-buffer-size-in-find_bsg_devic.patch
@@ -0,0 +1,39 @@
+From 989dcd297223d6896c5892532d14984326fa093d Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 18 Jul 2025 16:52:57 +0800
+Subject: [PATCH] ufs_cmds: fix full_path buffer size in find_bsg_device
+
+The full_path buffer consists of: path + '/' + files->d_name + '\0'
+So the buffer size should be: strlen(path) + strlen(files->d_name) + 2
+
+Fix crash when running 32-bit binary on 64-bit system:
+$ ufs-utils list_bsg
+malloc(): invalid next size (unsorted)
+Aborted (core dumped)
+
+Fix #58
+
+Upstream-Status: Backport
+[https://github.com/SanDisk-Open-Source/ufs-utils/commit/989dcd297223d6896c5892532d14984326fa093d]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ ufs_cmds.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ufs_cmds.c b/ufs_cmds.c
+index ddb037c..a6faa27 100644
+--- a/ufs_cmds.c
++++ b/ufs_cmds.c
+@@ -1520,7 +1520,7 @@ static int find_bsg_device(char* path, int *counter) {
+ 			if ((strcmp(files->d_name, ".") != 0) &&
+ 			    (strcmp(files->d_name, "..") != 0)) {
+ 				char *full_path = (char *)malloc(strlen(path) +
+-						   strlen(files->d_name) + 1);
++						   strlen(files->d_name) + 2);
+ 				sprintf(full_path, "%s/%s",
+ 					path, files->d_name);
+ 				rc = find_bsg_device(full_path, counter);
+-- 
+2.34.1
+
diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.12.bb b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.12.bb
index bcece228f5..0366654d7b 100644
--- a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.12.bb
+++ b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.12.bb
@@ -7,6 +7,7 @@ BRANCH ?= "dev"
 SRCREV = "dd2e655780424eadf7610de33e5966be19168a95"
 
 SRC_URI = "git://github.com/westerndigitalcorporation/ufs-utils.git;protocol=https;branch=${BRANCH} \
+           file://0001-ufs_cmds-fix-full_path-buffer-size-in-find_bsg_devic.patch \
           "
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.34.1


