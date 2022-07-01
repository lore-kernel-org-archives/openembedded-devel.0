Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE38C3F2D4
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 08:22:26 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.88])
 by mx.groups.io with SMTP id smtpd.web08.35523.1656663738806520300
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 01:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=onNv1/OD;
 spf=pass (domain: kpit.com, ip: 40.107.239.88,
 mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CridyaApnreN0zTXaKQ6LWRfVVhaUlB3ojlmZm1AxF40pjRDTRFmD6F0/KtSE8GaixzFyYs7OtyoxnuUBPmOCdLWwsU4eTCpnZ/djW3W37sRMNcsdJsAW2g4dR2g4XjzMlgObqz/JfA+SfC97VDBvjkq9xfeXqL4vls6hwEmtMEJR5WHOj/kCGgJqI0xB1pGbEIlwBOWKjGKQL3TUeOBcsv8G93scftZ2BQYTDQiyiAC5jSKqR3hjLrkNWBcFSosVSDbPGlG5helALFtx3i+9Kxt38/DO0ojfHxgaMhQe124XuPpcq85M054jCmqI0raQTFKCY2QT85j59KJGYmmqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1h5763+gsj7GhBwEXoqYVbcqBvZXMITmb/CyXLssBi0=;
 b=ogJgIMZY+YxYYp7pZFFiTZhCMR45lPlPuxNeqQzliPnX+eDdHbqbfmlpDQvNeQ87bFfvU/veLrSO7cwctn5StiP1Fs4yLUZIJdLWe+xBSstiYhiQVqXxalK8mfQOqEyBagKNK903UlqYjAxDwtHVXyNQDulGyE+dnOxED/v2+rZDy2WK8kWMByUgCHcrCZ2JcDze4RAab+b5hB3qX5mfgQnPpy4jNKGo0tzugk1x8AN2aakrFk/g6RpLTZLHvTwjGIaZocSZR7MELQAbGSxLeMCwJiBDN5Q3inioZTf7B4dkJr/2Bgmp3/iPmwhSL84psdY5CNpnKTm8Oji4uAsSOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1h5763+gsj7GhBwEXoqYVbcqBvZXMITmb/CyXLssBi0=;
 b=onNv1/ODOvhiWH63OHRc5XUbfSIMu77Yixw0hN4Zb88QNIk97Ch/bjAyEUCCxv/724MWrOr7eR8GCX2k+EabdUK5GXXAHKS4DWgTyGv1uk65Zq2d+dijCPaORelqUhw4teqdORmvbmwncgac/bLRb7xMm2mln6Gx0lpRvfRFV+s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8d::14)
 by BM1PR01MB1044.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 08:22:08 +0000
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c183:fc86:d69b:a1e]) by PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c183:fc86:d69b:a1e%4]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 08:22:08 +0000
From: Ranjith Rathod <ranjitsinh.rathod@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	omkar.patil@kpit.com
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [oe][meta-filesystems][dunfell][PATCH 6/8] ntfs-3g-ntfsprogs: Fix
 CVE-2022-30786
Date: Fri,  1 Jul 2022 13:51:00 +0530
Message-Id: <20220701082102.17835-7-ranjitsinh.rathod@kpit.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220701082102.17835-1-ranjitsinh.rathod@kpit.com>
References: <20220701082102.17835-1-ranjitsinh.rathod@kpit.com>
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::35) To PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:8d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3eb96a2-894a-4ed0-ec4a-08da5b3aca23
X-MS-TrafficTypeDiagnostic: BM1PR01MB1044:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FsQmjiPvHbqEGZFsEKUdwobbBtRy8Ia+98xVNa8bqrabUBuRUC3iByMmD1Bpl55Lom0IgPzI3t2ni3yxHcFNOzInh2M/NDKf5vo76U8MrlhaAD50hOWS/gLcni1nUbCSk8Epmb/4XPsJgzfMoHQJhfLbHu930S3JBRKGzGiP9rfNLsOnWsDJJCfRrhPwH2vShVseXt8GmSCP9177c8eSsxDzvjR2bI3WWd7DudfVRqEz0ySBNSJO1fbJUm5CCg/oNl2E1KUXybcTA91iG0T57CFXrsSufRXBh62WSeiXeIVDjE2xAgTvFzckpFJVf+LjbA4gD9glHSGoygX0OzqrqIqB9blx8q3YP+LdqG5OBEFNZgCVomMs9gMmEj8PqNzfqy0Gs6iHrAaOBUf9UVf5Gh4oYn7P2JzAuTCyvcULdcl5EJhXV+VB9xyUCiq+qiA3cm8xwi9B/WYk5nBD8NN5t9TZhzE1Pbpbms5S1sY8s7bbCHxxiiwwb6TI8wPnp1+BnaI75Lfp0kjJf1KOEct8K1egeXVMphOJDJyop2ZA0IXp/MFzUbHX3avF8+mBJd8WX5V/RTEHecZUJs9LW4i7Q5E0i8rACoxoxaI535N9q2t0UVS7ZXmR9iT0XLDF0psNEwhEQqTb6UjtMXzPhYOewNLjS+I8khTPeC/bbq81avyH/POj6vMeHwnryNlfFRD8cNPSUNY7CotXr1rqr2mUGAbm3zmhxMYbfbFE9d+SVuFTZyQ4/ljcUsYpOkK0K9EbCRFM5J3VgkPpfJ5/E6YjNrYV7AQ4yE+zeels7sngwMo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(186003)(66574015)(83380400001)(1076003)(66946007)(316002)(6636002)(6666004)(66556008)(8676002)(86362001)(36756003)(4326008)(6512007)(52116002)(107886003)(5660300002)(8936002)(2616005)(6506007)(66476007)(478600001)(6486002)(41300700001)(2906002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wDj53iTX+7vZ1+6Br55USVReUEJRmgQVOHphjbER6mZFqFFSkKDv6ra6xal6?=
 =?us-ascii?Q?AXFaX8X4Rc7XowTkGW+QSyJMI3YogAn44N2J075rhZeqcmH/CLAvTZzcCfpN?=
 =?us-ascii?Q?iwSEvTyYpzqn764Rbo0MGlvNKZJ6vvQFZQuKIIqyF5nWsvZOv1dQZcAF8ZRP?=
 =?us-ascii?Q?2rXMmCPCFyXr2ZVB3P9tvjl+S2RpbYHQtzDX3cIRDoJIQhvJ1AwPu86NBvmr?=
 =?us-ascii?Q?/SogQHsZrGvEZ9d3mQ/nL3akTMFi+DozapCSu2aM8/C59yIfHIIPLzmCy9M7?=
 =?us-ascii?Q?D6qeN8rrQctWwhkF0Jpn4C9zqwvk81pCdTHrPM2gBqbnwTu0tOBEFVsrNW3e?=
 =?us-ascii?Q?1bVHJpnkbjsYT/lX0L2nXJm/P/tDUUapjmgoREFOq3WA5WzPFNz+BntCCSj+?=
 =?us-ascii?Q?kQStNtT/djDspCC/sNouDi0FOpvKam/ItF38hCFceRAt/O4jzEtizUD/8OTo?=
 =?us-ascii?Q?zwgjdiDhljpX0PYke82BLLdfzfBVHjmKW80quUw1myZEU641Ol/ABoffRQWC?=
 =?us-ascii?Q?Ap6yYiXiNyIdTpZWyoVmwwUvXSLLGm7eD5yoHlV4myW+bDY3rwuVqOKgZQzP?=
 =?us-ascii?Q?+IbeDLtxArOdrE+wpWwGjOW3XiVpqcQBVPjTSv//F6FzMVdo1C0cGHLD3FDh?=
 =?us-ascii?Q?K+O6xpDBWvA3CeVV3BY7LNBDitRYIUCBhG9qeBFiFwxOvGuVwBxg2CsZ6544?=
 =?us-ascii?Q?IMokcplAhEH0H9m8XCKMez/EQeb1Qcwbc2Ew5ypl5ltfZB33/3WZYJfqb6e1?=
 =?us-ascii?Q?W8zCT2uvqpw9r4ts7sO8IpPh8TioRclraEdpA0ONOtOXP5wEghWEALbukfEf?=
 =?us-ascii?Q?wMSpoRzKHR/9WrC+cPUbdvwY+11eCCeL4SVsNB+EugzgQ05EyLemmkSTXojS?=
 =?us-ascii?Q?TTLNsgr3kuBrQGMHI2MD17rhRSqVstXxCVj1fSiyWOds1X6re072OyCHz9Lh?=
 =?us-ascii?Q?c/mmombiQJ4Ce1leHMgf9dhJyZddskcbuzWf6wePKGxThx4nvLtVBFWNrhqD?=
 =?us-ascii?Q?ju8Hpv3aTsXzurm3SCvhktKzN1Zvbewok9N11j2QQh79Kmtx1E23ohU+i2yb?=
 =?us-ascii?Q?bMp4RIA/qNz/B8rvYpyyeVmHHAwkmdbbWNpZkqbbv0tfBfgEOml1vOGqohlZ?=
 =?us-ascii?Q?TSt8LJFk3j1aWN8ikHDR2fJ7Jg+lnH2WijPKeg9fFBjaMuMP3Y0EiW2qtueg?=
 =?us-ascii?Q?QnIzEjsoFK0FBnA+tWrr6LIbvn033hF/OI/HvkDkSWUueGudwiQAWTIat7fn?=
 =?us-ascii?Q?SBr60SK5RzvamW8ooCdq+XSTN5Sm8ZYh5EySPe/8MHOvh4RfNuB2bFGkc0Bc?=
 =?us-ascii?Q?3N1l1gseqGn3l96jg2qgOriqfZpPBy1IdZULCuMyBXqAo7W/sB4I0Xyfc5Qd?=
 =?us-ascii?Q?iBGaUGLGAj2EAe8aJxqFGAAZOlD3Ts162Psix7l/aXmBsqo6h3jaKI9pm1rb?=
 =?us-ascii?Q?lkju6bUdf0shpcz1kg7G3NP3dtmoAry9omPJy8IGuIAK8/OnSTpJdKT/ICkX?=
 =?us-ascii?Q?RP3gH0HUDRBxaFNHl5i+bk24qfi1UC3oXwQG+SGBWUunwChKE7YacBIlO8+p?=
 =?us-ascii?Q?BLpHSC7O1rL/wd4yYH8+yGCOruYCrJSdn1tG+zG8ArW2bFe0NQkGuT10Kwa0?=
 =?us-ascii?Q?pxLRbuazLp4bM+/BpfINRxP7vfW3lwMrS3gKAz3UZ8kS56UGEzu9L3CF4hMO?=
 =?us-ascii?Q?uAVWrA=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b3eb96a2-894a-4ed0-ec4a-08da5b3aca23
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 08:22:08.6428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YAKznCSgZFFT+xy9Z/sA0HGAfZ4VBW6fLf0Ozn+E8ksKoqD+NMJiGajeGGibWmcAHgkcXrHMOLSuWqqE6WsSQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB1044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 08:22:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97659

From: Omkar Patil <omkar.patil@kpit.com>

CVE: CVE-2022-30786

Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
---
 .../ntfs-3g-ntfsprogs/CVE-2022-30786-1.patch  | 36 +++++++++++++++
 .../ntfs-3g-ntfsprogs/CVE-2022-30786-2.patch  | 45 +++++++++++++++++++
 .../ntfs-3g-ntfsprogs_2021.8.22.bb            |  2 +
 3 files changed, 83 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/=
ntfs-3g-ntfsprogs/CVE-2022-30786-1.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/=
ntfs-3g-ntfsprogs/CVE-2022-30786-2.patch

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g=
-ntfsprogs/CVE-2022-30786-1.patch b/meta-filesystems/recipes-filesystems/nt=
fs-3g-ntfsprogs/ntfs-3g-ntfsprogs/CVE-2022-30786-1.patch
new file mode 100644
index 000000000..9d485fed8
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs/CVE-2022-30786-1.patch
@@ -0,0 +1,36 @@
+From 838b6e35b43062353998853eab50cd0675201ed7 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jean-Pierre=3D20Andr=3DC3=3DA9?=3D <jean-pierre.andre@wa=
nadoo.fr>
+Date: Tue, 21 Sep 2021 10:54:50 +0200
+Subject: [PATCH] Made sure there is no null character in an attribute name
+
+When copying an attribute name which contains a null, it is truncated
+and this may lead to accessing non-allocated bytes when relying on the
+expected name length. Such names must therefore be rejected.
+
+CVE: CVE-2022-30786
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/n/nt=
fs-3g/ntfs-3g_2021.8.22-3ubuntu1.1.debian.tar.xz]
+Comment: No change in any hunk
+Signed-off-by: Omkar Patil <Omkar.Patil@kpit.com>
+
+---
+ libntfs-3g/attrib.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+--- a/libntfs-3g/attrib.c
++++ b/libntfs-3g/attrib.c
+@@ -426,7 +426,15 @@ ntfs_attr *ntfs_attr_open(ntfs_inode *ni
+       na =3D ntfs_calloc(sizeof(ntfs_attr));
+       if (!na)
+               goto out;
++      if (!name_len)
++              name =3D (ntfschar*)NULL;
+       if (name && name !=3D AT_UNNAMED && name !=3D NTFS_INDEX_I30) {
++              /* A null char leads to a short name and unallocated bytes =
*/
++              if (ntfs_ucsnlen(name, name_len) !=3D name_len) {
++                      ntfs_log_error("Null character in attribute name"
++                              " of inode %lld\n",(long long)ni->mft_no);
++                      goto err_out;
++              }
+               name =3D ntfs_ucsndup(name, name_len);
+               if (!name)
+                       goto err_out;
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g=
-ntfsprogs/CVE-2022-30786-2.patch b/meta-filesystems/recipes-filesystems/nt=
fs-3g-ntfsprogs/ntfs-3g-ntfsprogs/CVE-2022-30786-2.patch
new file mode 100644
index 000000000..85a2971b4
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs/CVE-2022-30786-2.patch
@@ -0,0 +1,45 @@
+From 5ce8941bf47291cd6ffe7cdb1797253f1cc3a86f Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jean-Pierre=3D20Andr=3DC3=3DA9?=3D <jean-pierre.andre@wa=
nadoo.fr>
+Date: Fri, 5 Nov 2021 08:41:20 +0100
+Subject: [PATCH] Made sure there is no null character in an attribute name
+ (bis)
+
+When copying an attribute name which contains a null, it is truncated
+and this may lead to accessing non-allocated bytes when relying on the
+expected name length. Such (illegal) names must therefore be rejected.
+
+CVE: CVE-2022-30786
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/n/nt=
fs-3g/ntfs-3g_2021.8.22-3ubuntu1.1.debian.tar.xz]
+Comment: No change in any hunk
+Signed-off-by: Omkar Patil <Omkar.Patil@kpit.com>
+
+---
+ libntfs-3g/attrib.c | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/libntfs-3g/attrib.c b/libntfs-3g/attrib.c
+index 51c8536f..efb91943 100644
+--- a/libntfs-3g/attrib.c
++++ b/libntfs-3g/attrib.c
+@@ -452,8 +452,19 @@ ntfs_attr *ntfs_attr_open(ntfs_inode *ni, const ATTR_=
TYPES type,
+
+       if (!name) {
+               if (a->name_length) {
+-                      name =3D ntfs_ucsndup((ntfschar*)((u8*)a + le16_to_=
cpu(
+-                                      a->name_offset)), a->name_length);
++                      ntfschar *attr_name;
++
++                      attr_name =3D (ntfschar*)((u8*)a
++                                      + le16_to_cpu(a->name_offset));
++                      /* A null character leads to illegal memory access =
*/
++                      if (ntfs_ucsnlen(attr_name, a->name_length)
++                                              !=3D a->name_length) {
++                              ntfs_log_error("Null character in attribute=
"
++                                      " name in inode %lld\n",
++                                      (long long)ni->mft_no);
++                              goto put_err_out;
++                      }
++                      name =3D ntfs_ucsndup(attr_name, a->name_length);
+                       if (!name)
+                               goto put_err_out;
+                       newname =3D name;
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g=
-ntfsprogs_2021.8.22.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfs=
progs/ntfs-3g-ntfsprogs_2021.8.22.bb
index ea8607e6d..f74e91c93 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2021.8.22.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2021.8.22.bb
@@ -12,6 +12,8 @@ SRC_URI =3D "http://tuxera.com/opensource/ntfs-3g_ntfspro=
gs-${PV}.tgz \
            file://CVE-2022-30783.patch \
            file://CVE-2022-30784.patch \
            file://CVE-2022-30785_30787.patch \
+           file://CVE-2022-30786-1.patch \
+           file://CVE-2022-30786-2.patch \
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

