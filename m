Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDEB2CCA479
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 08:22:26 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.55])
 by mx.groups.io with SMTP id smtpd.web11.35476.1656663739705233754
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 01:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=qdyZ+ajP;
 spf=pass (domain: kpit.com, ip: 40.107.239.55,
 mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnRnOKZz6KJ2rSX1YQNB7XwM4l5hPMWsL0uy+uo1KASWVon0C4+P1ZBo5FsU/Jo70tdenG0gIz+VQEtyMKaR0yTqDzupr7wEnoGwrwRnUr7G/wkO2RnNCctaQuFDvEI8xAfJGBkmxkGGMyM0UjnH2JlpwJIh5cWwGwOh1n5ZzMjpjUVycwYlyOOGpUmJe2T9IobVUobWzupi1FAHho4d7Hd9CWb6RhDDhofOEokgRsnvbJgBmJtycLMwAMRTBsoupL1ZqMsSHitTYxWuRYaEl+lFTw1ovt5bjxkWVt63gMRiovZoLfqLMrCDu+H88u/wwRO9FTm5SWY6BZ7dU92MPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDK5rCcmAR/DgIY9m3CMInzUpGifVF9Ma+w0BXsRTHw=;
 b=KWNOdMtU2knK1z1xOwTN31HNdwYDkfWowdG46x8WNIKg0cn+Xy6SoO9l13k4o3gvSqe+JfFaJ5sxd4dtGFJVwckAwzWB4XZTxFa1pZ0gcEJVJTnZ5fbxjOqsvAvd5KnqQYXp6Lu0pmpkg5BRcT1qvFmZOvGnCRom2sJLrIeCdKJ3cOKIX7ZTe1W8oIika2O++suDfzMKIULJyRHyJGeLFxIoome45ncu3NBFs0NDPcR2Wv2yWlVBEAg4bL3R+q1ejzewhQXayxFzYMqjFq+/IftfVSuoMeKutT9RWDIFvkIEeprpk+eglUpf7c4OqPwKBubbE80MBwnM0anrOGsGdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDK5rCcmAR/DgIY9m3CMInzUpGifVF9Ma+w0BXsRTHw=;
 b=qdyZ+ajP9OGrPhsdX6FmT2r7cSdwLkE0O6Ex/HRAFSv0hT5J8QKDUZmFPIcUTazgh2PJlf6CbwjdaRTbEhUSw959HzA/e9Gv2WfhYn8wwa6GjTWuq3pqeg3WYLZO0F3jQYYc/Q9Ysst9jYEhclONnKe4TbCIUZvYmwCeUh42ahc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8d::14)
 by MA1PR0101MB1190.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:24::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Fri, 1 Jul
 2022 08:22:10 +0000
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c183:fc86:d69b:a1e]) by PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c183:fc86:d69b:a1e%4]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 08:22:10 +0000
From: Ranjith Rathod <ranjitsinh.rathod@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	omkar.patil@kpit.com
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [oe][meta-filesystems][dunfell][PATCH 7/8] ntfs-3g-ntfsprogs: Fix
 CVE-2022-30788
Date: Fri,  1 Jul 2022 13:51:01 +0530
Message-Id: <20220701082102.17835-8-ranjitsinh.rathod@kpit.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220701082102.17835-1-ranjitsinh.rathod@kpit.com>
References: <20220701082102.17835-1-ranjitsinh.rathod@kpit.com>
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::35) To PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:8d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd278f43-7eb9-4dff-f049-08da5b3acb46
X-MS-TrafficTypeDiagnostic: MA1PR0101MB1190:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BSBI/ClNGKD+GA4xQhXATWA+FJeOaT4mnvDMv8ajlUJe29a7wvfWudVFixPh6ecxcznXEl8z0sdk7/B301Wz4ew7sLJtNxNtEnelkVNUgNNqt6LMXXKAoFkAda4lNcOk2/5OZ71ALjUE3K05T+Ud/gxvtCNtt50NIeKMbdxW/TrdWjIYbKDp9fQHn8/pB7ZI3Bv2XjEzLGWumBAcf+RZaPHOSZb2c5umpfPJaHCFNv4matxmibyeU83CW9ZQZFFgppD46hkP8BKXkEDGABmKVSXUIjRNS3HoWdp1O3tv2ajk9v43HIwG2Tr7DAjvFVqOxW53YRM6VAeE0VXufJVZ5j96kYasg91NiZ9rrinl3gkGRew4e6TthArU/rTceqBMTom/7XUe2BzSr2Y0T9YZXdazt9tmPBqcsz1jNeYXG+UAklugWQ9gk9mSyCB5fosI/oRvt/T6JS29J5J6yi9Yn/bQEXZalDSX7zTGbNxjNpnSLyRpE1A+vOEadpLm/dIleI8TP5MzeFQO48C7ttJ/SZBohXPaN1mkDftq+75kzjGeYe2qbaxJXVY+db//HY4YeqajmUxzWRfaBoF22NkphSvrYuZnhQO9PtwFtWu5Q8of1MgL0lMgEWnabBDRUkTQwBLeR29H82lG78S7Y6Ow1c4pstQfOjhH7yFhY0GjEL+P4BRat3uPQ2OvIfx0oaqVqMXk4/TrZcj3CRBybN617WPlreAMqVZovRhqZZ9dO2tv1HvuD0MQCHxSSjMcxuWcUBW7IdDK2IkfJ0uhZlScDOjF3FLKcZT1p1/pgrcbPTiE4KVfDcHGwprxNsOj0buTtwtuiPaBprD+NzPVRUGgpQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(6666004)(2906002)(6506007)(2616005)(107886003)(41300700001)(83380400001)(52116002)(66574015)(1076003)(36756003)(6512007)(4326008)(66476007)(6486002)(8936002)(66556008)(478600001)(86362001)(6636002)(8676002)(5660300002)(38100700002)(186003)(316002)(66946007)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bbgEgP39QfRDRp7dNKrkfUZ5UkIzuEd8m3eEwn+A2UlBxb0oxRgNLy5TGlmH?=
 =?us-ascii?Q?p+205Rqp9XUyG54cnblC5ZtpR7UN3Y9YjM04sAggFmvcENN2nmwFQvEKj/7w?=
 =?us-ascii?Q?uKyhIR8VkMVebLlQLpz4o+0TdGJJygUUUOGQTG4lpbvpMCIeScOmN9MK2YVx?=
 =?us-ascii?Q?Raf6+5txVt6gRSY610/sVtNIuq64QEHN4M8ELkaGc1YPqVdWyu6RftU6FqLo?=
 =?us-ascii?Q?yOa1PsbCnAexPMcNPSjZwMSNF4P1UhHbvltRG8TVxL/FpuhTnOZFDVjHdt/N?=
 =?us-ascii?Q?oADU7i2kzzqjZvfxBtj/L/4dd5Kqtz3x1wRyMTys9X70GRuNXYy0aHHolwUB?=
 =?us-ascii?Q?WKGoeooR7OdisL42sCoO/ItMNqRDRTrShww9NooRQAdNan2b3rTBARoGkj47?=
 =?us-ascii?Q?ijnRinvk3b+JAIE5jCzAU7Y3NKBnriR2b/4hVnVvIMcTy39yqiZFPlriblSc?=
 =?us-ascii?Q?0wE4YgzbKLt7D8VCtFz3q6QJXYTYigAwZeALo42bh0E436Z1knI1Ufw2VTZS?=
 =?us-ascii?Q?Dmp55wH5xyyvgy8w+kc3WoV6YidvWbeQmpTabndbq1FWy/rtHgcw2TsYuHcG?=
 =?us-ascii?Q?UBri2PZz3ehek9/oiQxle2ZMuR3fXyxG8HAq5+uOkJN8alTYJfPsvJ0do0Be?=
 =?us-ascii?Q?uHcFRFmsEP1ElkaGFlTfi+YegCKGdmXjUv2RjiqZ+HbV8LSQaPExxsvgrmjl?=
 =?us-ascii?Q?YgcHjyvKl5b2lSzwEdxClNyABjGYzx1t8sWoxJxofDOKOcmqDYFzOD8u2T0I?=
 =?us-ascii?Q?TFRr/MONVpo9fwT3OvIR26QSuzWDdTn8boyM/pdRcXtlZgG3+eEej9s4p7ZL?=
 =?us-ascii?Q?/9J+iErL0I9B1AQMrzsCoRmrPgkp+P/uW0OX9mF6VWFfx6shPkE6g8WjFvuq?=
 =?us-ascii?Q?BVzLwRjom6xh48MO16yD3i4lU9YyJPs5vu1ukS8Zt6aazgCqBnM5+LKH6Lpy?=
 =?us-ascii?Q?3CT5Vw9P1FiJDRfFoXQBCkob1Kupxn2HBs0LoWjnrS2WY1ifCZNXmh6giAd5?=
 =?us-ascii?Q?eFv9AA9v/FrNQzSDkriWWTw7yb206s/jWPT0GBXM8aSDfsXqZOiMDKzjeyK8?=
 =?us-ascii?Q?v+AbEYPzGUYDiuBfgGRYqfrXm/74xwb46cQAC9CWVvCG9cFSyUVBEg7B5T0e?=
 =?us-ascii?Q?h/enpYcDLX84Zw257qDzA24goSk9JoamZyoHRA+hI8f+BVbLOsI0f+4/cMPM?=
 =?us-ascii?Q?xB4OwTAZJLZehQOdb5nqATFlQqlla3EcOEnZgOJO+4dH1G7043ffjVh4BvIy?=
 =?us-ascii?Q?l2YBbzy4eC//cDlWJdHCEElLi0WPz7aPc2cmhVgaQzqWYW/ZLsQGhRdmJEGm?=
 =?us-ascii?Q?9EkdPo5/JryjsDQaR8wMbhHm5hNXBOPtuHdnbkDcW1jKTAtBJFPfT1wsQNvV?=
 =?us-ascii?Q?oTKiF+C/2+8yxBTjKSbdG7pIpX1iJA87OHBhw+zfCBtO4yris9ORDzfVti6L?=
 =?us-ascii?Q?t2hrt0MCR28YuxJYfz790KGIx2tDN11BVBu9cHQyp2uxLY0Hh/WDDPxUmx5M?=
 =?us-ascii?Q?nNlgrL5a443B1N5O6ROLClAPURvj8s3NygakMn023dC3ThugnMViq0cAYH4I?=
 =?us-ascii?Q?YQ35BvBaeC6i484N9A5C1G+CST01ztc7yvDWbK0jVB5UGCJ/q3FryJ/ciuLR?=
 =?us-ascii?Q?SpCebUlwpYkhh2EJWa10DaQajZY07D74eUoBd867rXsEyxHwZk008Ul/NkbV?=
 =?us-ascii?Q?+Pig0Q=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bd278f43-7eb9-4dff-f049-08da5b3acb46
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 08:22:10.5032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aspIr9sQkTdpTYR4fQVl9jZn68PUojFRTja3T0Z5zByYBVavI/BTofp6xP58Yvd6gIwN895Eezk3Hjw03U9M2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR0101MB1190
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 08:22:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97658

From: Omkar Patil <omkar.patil@kpit.com>

CVE: CVE-2022-30788

Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
---
 .../ntfs-3g-ntfsprogs/CVE-2022-30788-1.patch  | 51 +++++++++++++++++++
 .../ntfs-3g-ntfsprogs/CVE-2022-30788-2.patch  | 30 +++++++++++
 .../ntfs-3g-ntfsprogs_2021.8.22.bb            |  2 +
 3 files changed, 83 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/=
ntfs-3g-ntfsprogs/CVE-2022-30788-1.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/=
ntfs-3g-ntfsprogs/CVE-2022-30788-2.patch

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g=
-ntfsprogs/CVE-2022-30788-1.patch b/meta-filesystems/recipes-filesystems/nt=
fs-3g-ntfsprogs/ntfs-3g-ntfsprogs/CVE-2022-30788-1.patch
new file mode 100644
index 000000000..fc10af53f
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs/CVE-2022-30788-1.patch
@@ -0,0 +1,51 @@
+From a8818cf779d3a32f2f52337c6f258c16719625a3 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jean-Pierre=3D20Andr=3DC3=3DA9?=3D <jean-pierre.andre@wa=
nadoo.fr>
+Date: Tue, 21 Sep 2021 10:53:16 +0200
+Subject: [PATCH] Used a default usn when the former one cannot be retrieve=
d
+
+When creating a new MFT record, the former seq_no and usn are retrieved
+to avoid the new one to be mistaken for the former one.
+This may not be possible when the record is used for the first time
+or after some bad error. In such situation use default values.
+
+CVE: CVE-2022-30788
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/n/nt=
fs-3g/ntfs-3g_2021.8.22-3ubuntu1.1.debian.tar.xz]
+Comment: No change in any hunk
+Signed-off-by: Omkar Patil <Omkar.Patil@kpit.com>
+
+---
+ libntfs-3g/mft.c | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/libntfs-3g/mft.c b/libntfs-3g/mft.c
+index d0a601ff..5052d1ec 100644
+--- a/libntfs-3g/mft.c
++++ b/libntfs-3g/mft.c
+@@ -5,7 +5,7 @@
+  * Copyright (c) 2004-2005 Richard Russon
+  * Copyright (c) 2004-2008 Szabolcs Szakacsits
+  * Copyright (c)      2005 Yura Pakhuchiy
+- * Copyright (c) 2014-2018 Jean-Pierre Andre
++ * Copyright (c) 2014-2021 Jean-Pierre Andre
+  *
+  * This program/include file is free software; you can redistribute it an=
d/or
+  * modify it under the terms of the GNU General Public License as publish=
ed
+@@ -1529,8 +1529,17 @@ ntfs_inode *ntfs_mft_rec_alloc(ntfs_volume *vol, BO=
OL mft_data)
+               goto undo_mftbmp_alloc;
+       }
+
++              /*
++               * Retrieve the former seq_no and usn so that the new recor=
d
++               * cannot be mistaken for the former one.
++               * However the original record may just be garbage, so
++               * use some sensible value when they cannot be retrieved.
++               */
+       seq_no =3D m->sequence_number;
+-      usn =3D *(le16*)((u8*)m + le16_to_cpu(m->usa_ofs));
++      if (le16_to_cpu(m->usa_ofs) <=3D (NTFS_BLOCK_SIZE - 2))
++              usn =3D *(le16*)((u8*)m + le16_to_cpu(m->usa_ofs & -2));
++      else
++              usn =3D const_cpu_to_le16(1);
+       if (ntfs_mft_record_layout(vol, bit, m)) {
+               ntfs_log_error("Failed to re-format mft record.\n");
+               free(m);
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g=
-ntfsprogs/CVE-2022-30788-2.patch b/meta-filesystems/recipes-filesystems/nt=
fs-3g-ntfsprogs/ntfs-3g-ntfsprogs/CVE-2022-30788-2.patch
new file mode 100644
index 000000000..4759296a2
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs/CVE-2022-30788-2.patch
@@ -0,0 +1,30 @@
+From bce5734a757fd59d70a52f4d4fe9abe260629b3a Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jean-Pierre=3D20Andr=3DC3=3DA9?=3D <jean-pierre.andre@wa=
nadoo.fr>
+Date: Tue, 10 May 2022 10:40:17 +0200
+Subject: [PATCH] Fixed operation on little endian data
+
+Forcing an even usa_of, in a recent security patch, must be made on cpu
+endian data.
+
+CVE: CVE-2022-30788
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/n/nt=
fs-3g/ntfs-3g_2021.8.22-3ubuntu1.1.debian.tar.xz]
+Comment: No change in any hunk
+Signed-off-by: Omkar Patil <Omkar.Patil@kpit.com>
+
+---
+ libntfs-3g/mft.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libntfs-3g/mft.c b/libntfs-3g/mft.c
+index 5052d1ec..aefbb5f1 100644
+--- a/libntfs-3g/mft.c
++++ b/libntfs-3g/mft.c
+@@ -1537,7 +1537,7 @@ ntfs_inode *ntfs_mft_rec_alloc(ntfs_volume *vol, BOO=
L mft_data)
+                */
+       seq_no =3D m->sequence_number;
+       if (le16_to_cpu(m->usa_ofs) <=3D (NTFS_BLOCK_SIZE - 2))
+-              usn =3D *(le16*)((u8*)m + le16_to_cpu(m->usa_ofs & -2));
++              usn =3D *(le16*)((u8*)m + (le16_to_cpu(m->usa_ofs) & -2));
+       else
+               usn =3D const_cpu_to_le16(1);
+       if (ntfs_mft_record_layout(vol, bit, m)) {
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g=
-ntfsprogs_2021.8.22.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfs=
progs/ntfs-3g-ntfsprogs_2021.8.22.bb
index f74e91c93..0da80f8ff 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2021.8.22.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2021.8.22.bb
@@ -14,6 +14,8 @@ SRC_URI =3D "http://tuxera.com/opensource/ntfs-3g_ntfspro=
gs-${PV}.tgz \
            file://CVE-2022-30785_30787.patch \
            file://CVE-2022-30786-1.patch \
            file://CVE-2022-30786-2.patch \
+           file://CVE-2022-30788-1.patch \
+           file://CVE-2022-30788-2.patch \
           "

 S =3D "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

