Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4013C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 08:22:16 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.67])
 by mx.groups.io with SMTP id smtpd.web08.35522.1656663731775507795
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 01:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=gytbYcmS;
 spf=pass (domain: kpit.com, ip: 40.107.239.67,
 mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBB9Prl7dqGPXiKaQNwebkumDRo+78oi9fwSosCn6YOkD8v+XOuWtfUGaP9p3V7t/aXyntMNN/xpNRCymS35Z2+KllQmFyxhdr2oSt5yrREds24WADR8bcBjDw7zbM9jG9DiPz8ut2LHX/FoTJmQDFqNnJJ2YYq2xMzTMI2CcDi1L1NttH0QKnRopHlD9WIM0WHSSxJJBPfEPJCRv6egZab8LqyDPXUJi7X//nAeR36w2uGFL7dAr6ZtecbC4wZTEeGxXgBMXJ5qfLFAzJO6IzOOhCP8pnUTiox/6aagagX74gTHkEoYHVgJdW3hLQYZKr3/SWeJ+/Ps5H5ztAlptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6rJVDMBSj49NUcvYNPIToVQYNO+mZnK3SrFVIdsHPQ=;
 b=KWWxOsV+MwdE0uHxbbBoGnBd/JQu5A4PQX6uKkVZaBQVt8V0ODhuNdrcwBHEk5gQtXeplIqbGXhgLhN914PEEwVIe0UdqnQHOTpY+vfqYkompKdeSBlkm0G7spMA0neiKlBg1BJGI2MCkdZz037aPnTlqzQLtHZOAwa11qhdt/aTyWvBjk7g6j09FpRqV0d4iKiZFm+MCvWniNAWlJXQGjeTDsOrxr5X8IF/suO7xj8WPnIj3Yv9lBN+OHzpHCTgTi8+6aaB+sG/wUfPOcZMJRG1EwVjzFBlaVDHr5Iira/tClgin4JQXsNTSnpSgI+aAcYtyEbYCj1LUN1RDCGbDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6rJVDMBSj49NUcvYNPIToVQYNO+mZnK3SrFVIdsHPQ=;
 b=gytbYcmSAgIo5PqD2QS+Q20F8nbwt7VM2NSauXC9UOCQ15yPSJ0MXPEfnsIhYrUMRtvH37LZlom4Dmdz588socguoYjuQVCSHUFxoSsw2QKli87CZNFSqybDmUxp9TM/l5GYhXMR0QBwgFPu1Tce2bBt1a6Gj//b6u/IydRWjoA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8d::14)
 by BM1PR01MB1044.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 08:22:07 +0000
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c183:fc86:d69b:a1e]) by PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c183:fc86:d69b:a1e%4]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 08:22:07 +0000
From: Ranjith Rathod <ranjitsinh.rathod@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	omkar.patil@kpit.com
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [oe][meta-filesystems][dunfell][PATCH 5/8] ntfs-3g-ntfsprogs: Add
 Patch For Multiple CVE
Date: Fri,  1 Jul 2022 13:50:59 +0530
Message-Id: <20220701082102.17835-6-ranjitsinh.rathod@kpit.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220701082102.17835-1-ranjitsinh.rathod@kpit.com>
References: <20220701082102.17835-1-ranjitsinh.rathod@kpit.com>
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::35) To PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:8d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f42de716-e818-4e2f-9294-08da5b3ac940
X-MS-TrafficTypeDiagnostic: BM1PR01MB1044:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lMKe26p7StmpZrQtaCnkzypp4OhEPSYUvgxCrYXa3U2AVHlyGAe1EhOJGb68vjbJVt1lE/QrrIRT52LORoerFmbu7WnCTEFAqIs0okYBVh2GeaxEFySkC+NkxDIoich60R8BNsM1pR9OrCzsIxGeL5LrLtsD12wkI+8XTE8VS87rs2i637qdQBBz0Ow//K66O7TDS7oG3AsOt+t+nEOd0DunWeiTYn/8OAjdVYWb+WwVWXWNvxGR6YfIynR/XMshP/B9wU81epmmTLYPl9IdEUl/ebbfBYUcRdqj1MO6Q4UQBKR9kVThO2MtivgWpm3GxJ0tw792dcPq4hSGqcSqBy73jh4o7swunsZGqiX1wAyFz+vd/Vkmx+LY8fKMZST/1jzva/6ug/2zs2dGPP2wbJU83wTDVGSY61l7E1BF8TPfP7zCmjtV2pKAVgG9gPnRzbmIVdbeo+uN0/UtjFelzVbZRJNB/Pvr2mM9DBMcBvKTdKNUgMePa4kq7JJr5GDqArlPsL6vvWZOCXofJsCOi+69/JAxgAym37QsmYBIxb+SBqDTDLdmlnPRvLhNQIsfH7Hqd9PHGLluD4QoKBFGszlhtT76fBgf+mpK3n+qiTjHRxVTO/cKk/TKpG5ZjyQIdq+YeKVK1ZB9c4jgZ3TkD72hcx2gcXqLVtHBkDAfklILI3sG0UcJSKi5jBd0cIR86nlW0QboUY/g21ftBrLjl2LO8+WsNvIQ6Z9u5u0wWDelEWcJIwyXPvbzsyj1UJMoDmlhtwuJ9oSUZukRbVEVFg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(186003)(66574015)(83380400001)(1076003)(66946007)(316002)(6636002)(6666004)(66556008)(8676002)(86362001)(36756003)(4326008)(6512007)(52116002)(107886003)(5660300002)(8936002)(2616005)(6506007)(66476007)(478600001)(6486002)(41300700001)(2906002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hdj1inLyQsHOAwWj8GXcDHzTt/6bHxZB+E0i+Yd/owCL49qxexqvHxc4jGes?=
 =?us-ascii?Q?p6Cp+ybh4M+xekHTvrjCt8KeYWjfBSZmbnWZ96Vy9XB2M5tO/KplLWmvNzRv?=
 =?us-ascii?Q?XEh5OTI7I3VgcBSGrCuPnrkaa6sfcyHQqvtE7hT3cQBK5R6rOpjAZHmVE9ak?=
 =?us-ascii?Q?zt8ji2NmiIBYD68F9Ndj0IcZ/FzAvf7Z+VncaRrjzyBrxvhclcjFTlQvkIRJ?=
 =?us-ascii?Q?+du3f4BlNBGHXBMEq+OECyaLW+2FteDgz1PAzXBDH2FXwcAncm5uN11r4Vfu?=
 =?us-ascii?Q?DyghDtjyu/rPfJOyT5+DqGhV1nwOndx5BL4coy71IIvL8cOnjQ73671t1euj?=
 =?us-ascii?Q?nBE9ggmfLT2U/613eVo+RgPcRzoLVxqfrrsphqkziePT43zKKB+Ob6qYmatZ?=
 =?us-ascii?Q?iVMpuLQ8SyxI1e8F4IwCrW9RskJYmCG7PWrsyzIFWy9wb8FmGQLxze1P80UE?=
 =?us-ascii?Q?ADW1jTsZVaRmKWdrptonStJQPFh+ItMzdnfJ7pYw3B8DEkS/N552hXTrmgbj?=
 =?us-ascii?Q?ZjPeF/Bqf0ggOO7qE5ivJflcPy+mng8L6q9+iw3cyr4KNOtB7osz1xwH1wAI?=
 =?us-ascii?Q?B6hM/o13fcH13a0Yz7Ivfv5bUqyNStubeXE9uPQ8HnBv7Zj6IfhoMlo82htC?=
 =?us-ascii?Q?2gJiG8dTLaRcNKiBSJtCREOICk4kbAkB9GgNFouSDW3qezCoCRhvYb0GzAZz?=
 =?us-ascii?Q?lMb/tvFUIieFBxKYxPtF7qvvxZkY/H+nEKbYsCi3T2MaLNn7DkO+Uz/davCP?=
 =?us-ascii?Q?r2ZWgiuC9CJWYmKtAgGJL436zSb8bMQJdNcZsylhqkK6EH18P1t8FakhzpA6?=
 =?us-ascii?Q?eSJqRpxBbDbfb4j7f+5GLML+GHMOGPxoBC0mesy/Pholc4HIjKmVIfCI9IDn?=
 =?us-ascii?Q?DRRhy30XtMqexmAYevafygHyktUi4l4GQ5tdbNV+R0uH9vBWlftCxPJvZAIi?=
 =?us-ascii?Q?7xufdyAntMkFPV9EUzqQmstK0b3RjEdVm3FCeKTi7z3Gkf/f2b4nVLijozQw?=
 =?us-ascii?Q?CL5BId+MrZua/Rcc3B9lCST0LWc9NcAADv+NWvQ5FNRcdXWCbIieXhXEorC6?=
 =?us-ascii?Q?qGEisEf2blRyBMAdIdAvtckBjzABrQ2JuHSIRkSWnKj0/3Ur49BwBnW2hMYd?=
 =?us-ascii?Q?eZtjoCP0L4DOQiGukdOkNt3Y9UZ/AfEpx45cXVX8IegWX/o1byCBkf6I+WDN?=
 =?us-ascii?Q?q8uNXM2b/Z5mdg3Cix48i5I4as5durALRBk5N1X54HlVjL5lTmz+7NsnnHiQ?=
 =?us-ascii?Q?3vu7IzlBzpZ1u3+V9PYTymxMQIRSoKd99lOx0Zj2T+WlM6UITfvvvdE2HhX7?=
 =?us-ascii?Q?/AzmrI+b6QUd05vVH8sW1dzW8CZeDkzm/m4xRMUig9IxZMPn7xHpaKaRJNk8?=
 =?us-ascii?Q?ZgI8kNMTEFyRQTsr5DzQRq35fEkvDOjvVwxVsxyd17e/PhrPzlSp6tXgYtJm?=
 =?us-ascii?Q?/geWpJw+b6k2h2Ha33ze+rP4TIK+9fxjC7ygtz0Oda88eb1YgUvaEcJCN5wm?=
 =?us-ascii?Q?CJFl9ytEeKaBTeIfuwXSSFWMsXBbniWjT40MGokUVcuJNw6sLJKHjCLeVf3f?=
 =?us-ascii?Q?a/fzY+LWqNRleIL+qMGrfH21JgzcIK4V5sBfnCsURgz7S9ie7tk11EJxu/Bu?=
 =?us-ascii?Q?TFWJpfN+bP3dJx2Ns6KANxUstrZEKu8TijCU5Rvo2e1EkloXXMUMN76iDfG9?=
 =?us-ascii?Q?sDTs2g=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f42de716-e818-4e2f-9294-08da5b3ac940
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 08:22:07.1373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cyspS2sv36iYw+WhHJNc8ZMauyNpOQXxwD3noyLeLizpZMvWOrw3nnN2r8lsdVVJNl7I5/roelLkKwraIgLodQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB1044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 08:22:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97656

From: Omkar Patil <omkar.patil@kpit.com>

Fixed CVE's:
CVE-2022-30785
CVE-2022-30787

Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
---
 .../CVE-2022-30785_30787.patch                | 32 +++++++++++++++++++
 .../ntfs-3g-ntfsprogs_2021.8.22.bb            |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/=
ntfs-3g-ntfsprogs/CVE-2022-30785_30787.patch

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g=
-ntfsprogs/CVE-2022-30785_30787.patch b/meta-filesystems/recipes-filesystem=
s/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs/CVE-2022-30785_30787.patch
new file mode 100644
index 000000000..ae71e8ccf
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs/CVE-2022-30785_30787.patch
@@ -0,0 +1,32 @@
+From fb28eef6f1c26170566187c1ab7dc913a13ea43c Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jean-Pierre=3D20Andr=3DC3=3DA9?=3D <jean-pierre.andre@wa=
nadoo.fr>
+Date: Tue, 10 May 2022 10:48:18 +0200
+Subject: [PATCH] Hardened the checking of directory offset requested by a
+ readdir
+
+When asked for the next directory entries, make sure the chunk offset
+is within valid values, otherwise return no more entries in chunk.
+
+CVE: CVE-2022-30785
+CVE: CVE-2022-30787
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/n/nt=
fs-3g/ntfs-3g_2021.8.22-3ubuntu1.1.debian.tar.xz]
+Comment: No change in any hunk
+Signed-off-by: Omkar Patil <Omkar.Patil@kpit.com>
+
+---
+ libfuse-lite/fuse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libfuse-lite/fuse.c b/libfuse-lite/fuse.c
+index 6f9242b7..3d653e63 100644
+--- a/libfuse-lite/fuse.c
++++ b/libfuse-lite/fuse.c
+@@ -2223,7 +2223,7 @@ static void fuse_lib_readdir(fuse_req_t req, fuse_in=
o_t ino, size_t size,
+         }
+     }
+     if (dh->filled) {
+-        if (off < dh->len) {
++        if ((off >=3D 0) && (off < dh->len)) {
+             if (off + size > dh->len)
+                 size =3D dh->len - off;
+         } else
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g=
-ntfsprogs_2021.8.22.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfs=
progs/ntfs-3g-ntfsprogs_2021.8.22.bb
index 9e233e127..ea8607e6d 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2021.8.22.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2021.8.22.bb
@@ -11,6 +11,7 @@ SRC_URI =3D "http://tuxera.com/opensource/ntfs-3g_ntfspro=
gs-${PV}.tgz \
            file://CVE-2021-46790.patch \
            file://CVE-2022-30783.patch \
            file://CVE-2022-30784.patch \
+           file://CVE-2022-30785_30787.patch \
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

