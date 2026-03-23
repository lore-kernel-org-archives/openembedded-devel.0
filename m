Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B24EC01BE
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 10:13:01 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13111.1774258289388513271
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 02:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=qDcukcVC;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.19, mailfrom: git-patches@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzcHp4SUDUaIYsRZDYyHuIz6iYXlXfLyfAntbcwEzdh5/YSyZ/llPt53PFgm2m32ymGvVdAFVkm0UbGBz3Hfda1vrqe5lWGizV3v0kGZH8DXCoJ2dZaABF3jc4negtYvx/aIhfaTuRX7te4WI4YNYFp9NtBdqNGwjBAoRgC0nlq7X2jVaJARVcE9OET9mhrbm57SESIO0in1BjxwLmnutPX7wC4ebTuU41+EW31CuMKyIvm+xqo1JSQYH2tO2YgZG8U2A0VvaOXWST7/EOPGOFLE1boRHv+JmgCy3ZufAdwWTNcT/plrzuHeZbXPjz+rwpH2G8+94zxAu8TS8Xe3qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5m9oVEoc5dQN4Czybf+WXj1NWgPV4i1NJV6xz6QY9I=;
 b=erMvAIDZJ8e9eN/oZLePzECtylrG6YevEqNjw90nfyw23Dq3UqHe4yK1CycISe/jnWXQmLwGBvT2g8ltFhNRYXjijjQXWIance7bnWCMi+JN7YawqZubyqa/so/pI0LIi1mOSRdl62S04E3lmWC5bifS1TmIiAAOCeKKkzDMrp9KWyfKpOFgIAtFdsloJP8V/wQXOBUuQX8alylisHpJQ6aCUsnOzXpLBLUCF23qR2cWPArYNAUxuZBtM7ZRraG3hUBRI/L7H3MCzcZReIyWhnNL+AJABOCV2m7UL1TeB/r+f8i6Ve8w2ciVQpossLMvIkmsAOQBI532KmWLEgCHUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5m9oVEoc5dQN4Czybf+WXj1NWgPV4i1NJV6xz6QY9I=;
 b=qDcukcVCu+ZWFLieNG3HkRTiktPMpDMb9VhSTkAzVLykb7mxyofvtdDbXhllItoLNelQVOoaBBr+CIRT6/n5gAbHChVCvRCFVj585S3OMs0265EgeRPxvZCw130TwLXtoblgerK1lrpkL+SR+6NZHaPXVJpANpBGLEu8v3cRMA2W/uYUgvl4Ydd2Mqe1t34lM+P/MEvsYRGbVlWwEY2Rkb6Iwm5/PYKPaeXvRPbWCG/+nj7iaoeLa9Qy0QSJWXXqQ/Rkij3lUK3E4HGvBVNQrGaNB4UN7HtSe5AAkloAwYO87gAdybcwknzJDAVsQ4kerQZGVZfefI3vXzq2FCp7tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1be::5)
 by PN0P287MB0818.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:145::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 09:15:17 +0000
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2]) by PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2%4]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 09:15:16 +0000
From: Ashish Kumar Mishra <git-patches@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Ashish Kumar Mishra <git-patches@bmwtechworks.in>,
	AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Subject: [meta-oe][PATCH v2] image_types_sparse: switch ext* conversion to ext2simg_android
Date: Mon, 23 Mar 2026 14:45:00 +0530
Message-ID: <20260323091500.1196198-1-git-patches@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: PN3PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::22) To PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB1970:EE_|PN0P287MB0818:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c30638-2edd-43e6-cac5-08de88bcb2b6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|55112099003|13003099007|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	2rbdIYnGGT+xlpr+mkTeWEj4anmXQk69dFfkb/JG73s+brAnnI5dC2EEI2SXKXLZtrEFRNd4wXPa5KnlJS8myNXV8TPuoPyNC3VHGH9vjC/XROyaORCRKYuKAApt10UJ9Q2TWjcZOJ/D4uLud+pzWFwbY8NZK0H+AdPQuG2x2Obw7WoezXqHbko84+32rU5wxCH/Ay+qzQQ7Hjc+gagr0ynxKZOz0/ktH10xNtwNFyfaDrSLL/YBWRk3GUQ/Y07J3jDGmuMUJP+Y6qF0/qp3VrpVp3k52snFf31vdnac+jmzImFqmrMqiHGkN1sgsGCPE65S2pm+xPC8NQAFntKCFGpYS/1yv1qTVXnc6SNVENgcC/d51RB7kpidrmOl+jVbh39L3jBR1CjOOJjxbmPiGHgOZ+9PCdLMejR/n2iPlSq+Fb4/37lSmSTxrbBc5QIFtBdltpwPTJi/RXlhVCLcWFgZt39DfAIBWZMQwxVwd44TLOzY4UTmTq6YVF07WYsBMgyTIWhQpNciaUrTIjlMU4xx6zQqRca7auwL2YsVOiVF3EE3rj9mtZA9AmJ3HlZY80l32fll5BHiBGcYUl5qf0Bri7Vf70J/fvuoNALPI4wMn7tYREzw/QtlXJv5CrsmSBy896McxghabBs1GOKZXeU2hM+/QV08T7yE4FlbPpCBhXKV1Jcvnls2SVrJb1Zk//2QnELsppXt3o2gPymf+9LnSq+nDGbTXPcHjKpqA0M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB1970.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(55112099003)(13003099007)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1nR6ijmas7zHHBT9CXB6EiMs7zSqFv/k+rFM1IbabzVW5dwhWXE72QUPzB3a?=
 =?us-ascii?Q?2OJJg0sGqUobQ7bvdz6ixLn7EcE3YBWyXOFbNBDa9B1dZFkFQeOekOv2K4ur?=
 =?us-ascii?Q?X5U5i+aoYQ1AwqcCeFYQh35/1JAVEfWtOf/rXNQtN9gf8TskUCWz3gL4bCU5?=
 =?us-ascii?Q?5TgOWGGzRX56kpBpeS4fgjqPf1AA8tpQCkHZgOsK8ArnGn+FC8nnJtBYGboO?=
 =?us-ascii?Q?DR0XMvT0v0fZZUUIfrvVHMIGNlW79C59tkEDJYc0zJvjyrVBupfdOsjKCf8d?=
 =?us-ascii?Q?JK/3+FG1FV96NEDm07/+mM9kIci3iqHYeI0Wj5eRk/N8cPCd1xRwBoRuflMx?=
 =?us-ascii?Q?GWOiMdr5uxjBQdi1FeF2JBvEV78F5vdLfBLEWmQeeKS3j4e4d0VlFliSOVsM?=
 =?us-ascii?Q?F1JrVp7sG+X7P4vcgY5F/DoN3kEzcxb/OMKwa2O/DFFE31Ejp2HngjJlJ84B?=
 =?us-ascii?Q?XjEe+m1u5BBtfH8Xarx+wg8IaWN9gS9b3l6iMtvTdVWOEE54HZROBVecqrBE?=
 =?us-ascii?Q?WsU5+i++yjOnMWdNwFllbhRMp7kr6VXAo0OFPL+/3t3AW1oMRlSaBl/S4cYm?=
 =?us-ascii?Q?6FWDwg0Ngcs/GwlzXlIv5WqiZcv0cloMEI2IT43HhFrOOdLmM4SgMkJe9TQH?=
 =?us-ascii?Q?jQwB7CjqWxZW19yTRflLpcQN3fXlnaCadg0UGd0Ea90WH7auFHW7OYDsczcK?=
 =?us-ascii?Q?PwBzQDn6P0G1vvfbaan//mCZDEq0NTxjWTW8lSVtqcOUqeeOcr592miDqzN0?=
 =?us-ascii?Q?S7DKKV0tcUQW2vEIIOtLWP3wzsRT1qlO5FGHG6J5/Emf+wkZuz/7315LobGh?=
 =?us-ascii?Q?gqfITMGBWSfSWp3JPn7ul5tcCDnIIxy362mDIFSXK+FnzL45ljK6NnRniqgB?=
 =?us-ascii?Q?bZMPDZ9ww1CYAnVeg0qOLMlnkR/jiai6xp9q1oePKEAbcqfIu+aw1yr7qfvj?=
 =?us-ascii?Q?iZYud4tKdb7FZka1jDu1lL/e73wodJxtD7cdqL8uzj48Bl577DORar1f9iqO?=
 =?us-ascii?Q?dyH0q/nay7uG41in0VcwcYAeHyQgZmvt6jyXiP3LtUH47Pq9DP0dzdLbVS5u?=
 =?us-ascii?Q?JRR8Iuvci2p5nW/S99/5eowXZojtH4QJNv/SAzdvt8GawKtMZeS3N8vu0ngM?=
 =?us-ascii?Q?woO9gUIIz54gf+ItggLJSokSSx8L3PM0NBJjXP4Bg/3PiFxnF0yWVym0NBC0?=
 =?us-ascii?Q?qCNfT1KlIETfbkO0bHw31eY/0axowFA5PP1P7PKTEfYYfoBLXbDSWRua8i07?=
 =?us-ascii?Q?qVHWXRdN4L1mh4mK6bOVL8kAboOuvL28xRoyZc72bPLWiq3RL87cHdhWcfst?=
 =?us-ascii?Q?MysfSGcJ6vDFwIUTktfwAtpnoUqL6iaetTSSPixaki40Ux2pIOabQ1zJWiAV?=
 =?us-ascii?Q?pC6Uxde+bV0QkPaw23CYigBuBHBY2BCTO3kFctAoUPdRzFmS1nWYavr1Ng+M?=
 =?us-ascii?Q?F52Plc5AIYXzH1XWBaoAxgVXSfIgwUCCQ2aIbTcwexV3SPfMb2k6R+O86Vyv?=
 =?us-ascii?Q?uPuwBnvh0lJ8eR2PAGwNFsrk/QaQBD7GcjnvcEwb9BduSGT+9HE1XNf1X04L?=
 =?us-ascii?Q?t3+qqEOgy/z4IRGKIBk7LiMyIinflI/gzjZKo34W0i6XsffUyfGOFEmsuuhk?=
 =?us-ascii?Q?ubYKy5TxCs+KsW+PHXsx/7rgJ4oLtbhU1pew/N+UNkyz8mmBvorfRT/wICSF?=
 =?us-ascii?Q?K4Rfw5DBls4Rkyjx3D+i6j88n0V31iMFtuXVkdpS25WQ8Zz+PMSGZgPCcD7s?=
 =?us-ascii?Q?FKHU0ffKrw=3D=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c30638-2edd-43e6-cac5-08de88bcb2b6
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 09:15:16.9142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jCflNFXhIiNe7MFEk/EKvmQWZVqjCijLh+UfEVt623nTjXWdfuAxJkjHNCxF/3OYq5ArOqLRmYb5L0FawXfKACJKbbRLkrnHHmD5TxvklEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0818
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 10:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125497

We have RFC discussion at
https://lists.openembedded.org/g/openembedded-devel/message/124499

Move ext* sparse image generation from 'img2simg' to ' ext2simg_android'
Summary of changes:
- android-tools: Export libsparse/libbase/liblog headers and libs to
  sysroot to allow external linking. Masked v5.1.1.

- image_types_sparse.bbclass: Update CONVERSION_CMD to use  ext2simg_androi=
d
  for ext* types

- Add a custom do_compile step to build the  ext2simg_android utility (ext2=
simg)
  when building for the native class.

- Added 'image_types_sparse' to IMAGE_CLASSES and enabled 'ext4.sparse'
  in IMAGE_FSTYPES.
  This allows the build system to generate Android-style sparse image

Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
---
v2:
    - e2fsprogs-ext4sparse:=20
      Dropped redundant class-native overrides where the recipe
      Added comment on usage of $ORIGIN/../${baselib}:=20
    - image_types_sparse:=20
      Replaced informational bbwarn usage with bbnote (kept bberror for fai=
lures).
    - layer.conf:=20
      Dropped layer-level BBMASK and switched to PREFERRED_VERSION=20
      for android-tools recipe selection.
v1:
    - Initial implementation as per RFC=20
      https://lists.openembedded.org/g/openembedded-devel/message/124499=20

 meta-oe/classes/image_types_sparse.bbclass    | 17 +++--
 meta-oe/conf/layer.conf                       | 10 ++-
 .../android-tools/android-tools_29.0.6.r14.bb | 44 +++++++++++++
 .../e2fsprogs-ext4sparse.inc                  | 26 ++++++++
 ...inode.c-Fix-for-file-larger-than-2GB.patch | 40 ++++++++++++
 ...-missing-check-for-permission-denied.patch | 32 ++++++++++
 .../e2fsprogs-ext4sparse/mkdir_p.patch        | 28 +++++++++
 .../e2fsprogs-ext4sparse/quiet-debugfs.patch  | 27 ++++++++
 .../remove.ldconfig.call.patch                | 41 ++++++++++++
 .../e2fsprogs-ext4sparse_1.0.bb               | 62 +++++++++++++++++++
 10 files changed, 322 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs=
-ext4sparse.inc
 create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs=
-ext4sparse/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
 create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs=
-ext4sparse/e2fsprogs-fix-missing-check-for-permission-denied.patch
 create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs=
-ext4sparse/mkdir_p.patch
 create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs=
-ext4sparse/quiet-debugfs.patch
 create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs=
-ext4sparse/remove.ldconfig.call.patch
 create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs=
-ext4sparse_1.0.bb

diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/i=
mage_types_sparse.bbclass
index 5416c2a019..ee9eefebb3 100644
--- a/meta-oe/classes/image_types_sparse.bbclass
+++ b/meta-oe/classes/image_types_sparse.bbclass
@@ -13,11 +13,20 @@ DELETE_RAWIMAGE_AFTER_SPARSE_CMD ??=3D "0"
=20
 CONVERSION_CMD:sparse =3D " \
     truncate --no-create --size=3D%${SPARSE_BLOCK_SIZE} "${IMAGE_NAME}.${t=
ype}"; \
-    img2simg -s "${IMAGE_NAME}.${type}" "${IMAGE_NAME}.${type}.sparse" ${S=
PARSE_BLOCK_SIZE}; \
+    case '${type}' in \
+        ext*) \
+            bbnote 'Running e2fsprogs-derived ext2simg_android..' ; \
+            ext2simg_android '${IMAGE_NAME}.${type}' '${IMAGE_NAME}.simg' =
|| bberror 'ext2simg_android failed' \
+            ;; \
+        *) \
+            bbnote 'Generating sparse image for non-ext filesystem...'; \
+            img2simg -s '${IMAGE_NAME}.${type}' '${IMAGE_NAME}.${type}.spa=
rse' ${SPARSE_BLOCK_SIZE}; \
+            ;; \
+    esac; \
     if [ "${DELETE_RAWIMAGE_AFTER_SPARSE_CMD}" =3D "1" ]; then \
         rm -f ${IMAGE_NAME}.${type};\
-        bbwarn "Raw file ${IMAGE_NAME}.${type} removed" ;\
+        bbnote "Raw file ${IMAGE_NAME}.${type} removed" ;\
     fi;\
  "
-
-CONVERSION_DEPENDS_sparse =3D "android-tools-native"
+CONVERSION_DEPENDS:sparse =3D "android-tools-native e2fsprogs-ext4sparse-n=
ative"
+do_image_ext4[depends] +=3D "e2fsprogs-ext4sparse-native:do_populate_sysro=
ot"
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 186ff9a488..b7ab46f12b 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -12,8 +12,16 @@
 BBPATH .=3D ":${LAYERDIR}"
=20
 # We have a recipes directory, add to BBFILES
-BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbapp=
end"
+# Adding dynamic layers recipes
+BBFILES +=3D "\
+    ${LAYERDIR}/recipes-*/*/*.bb \
+    ${LAYERDIR}/recipes-*/*/*.bbappend \
+    ${LAYERDIR}/dynamic-layers/selinux/recipes-*/*/*.bb \
+    ${LAYERDIR}/dynamic-layers/selinux/recipes-*/*/*.bbappend \
+"
=20
+# Prefer android-tools from selinux dynamic layer (29.0.6) over the older =
version (5.1.1)
+PREFERRED_VERSION:pn-android-tools =3D "29.0.6.r14%"
 BBFILE_COLLECTIONS +=3D "openembedded-layer"
 BBFILE_PATTERN_openembedded-layer :=3D "^${LAYERDIR}/"
=20
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/a=
ndroid-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool=
/android-tools/android-tools_29.0.6.r14.bb
index 74928ed171..39b8ef5fe8 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-=
tools_29.0.6.r14.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-=
tools_29.0.6.r14.bb
@@ -166,6 +166,37 @@ do_install() {
         install -d ${D}${bindir}
         install -m0755 ${B}/mkbootimg/mkbootimg ${D}${bindir}
     fi
+
+    # e2fsprogs expecting headers in sparse/ subdirectory
+    # to resolve the "Multiple shlib providers" conflict.
+    rm -f ${D}${libdir}/android/libsparse.so*
+    rm -f ${D}${libdir}/android/libbase.so*
+    rm -f ${D}${libdir}/android/liblog.so*
+
+    if [ -d "${S}/system/core/libsparse/include/sparse" ]; then
+        install -d ${D}${includedir}/sparse
+        cp -r ${S}/system/core/libsparse/include/sparse/* ${D}${includedir=
}/sparse/
+    else
+        bberror "Sparse headers not found in ${S}/system/core/libsparse/in=
clude/sparse"
+    fi
+
+    install -d ${D}${libdir}
+    for lib in libsparse libbase liblog; do
+        if [ -f "${S}/debian/out/system/core/${lib}.so" ]; then
+            bbwarn "Installing ${lib} to sysroot"
+            install -m 0755 ${S}/debian/out/system/core/${lib}.so ${D}${li=
bdir}/${lib}.so.0
+            ln -sf ${lib}.so.0 ${D}${libdir}/${lib}.so
+        fi
+    done
+
+    install -d ${D}${libdir}/android
+    for lib in libsparse libbase liblog; do
+        if [ -f "${D}${libdir}/${lib}.so.0" ]; then
+            ln -sf ../${lib}.so.0 ${D}${libdir}/android/${lib}.so.0
+            ln -sf ../${lib}.so ${D}${libdir}/android/${lib}.so
+        fi
+    done
+
 }
=20
 PACKAGES =3D+ "${PN}-fstools ${PN}-adbd"
@@ -190,3 +221,16 @@ FILES:${PN}-fstools =3D "\
 FILES:${PN} +=3D "${libdir}/android ${libdir}/android/*"
=20
 BBCLASSEXTEND =3D "native"
+
+FILES:${PN}-dev +=3D " \
+    ${includedir}/sparse \
+    ${libdir}/lib*.so \
+    ${libdir}/android/lib*.so \
+"
+
+FILES:${PN} +=3D " \
+    ${libdir}/lib*.so.* \
+    ${libdir}/android/lib*.so.* \
+"
+
+SYSROOT_DIRS:append:class-native =3D " ${includedir} ${libdir}"
diff --git a/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sp=
arse.inc b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4spar=
se.inc
new file mode 100644
index 0000000000..80c283ef4a
--- /dev/null
+++ b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse.in=
c
@@ -0,0 +1,26 @@
+SUMMARY =3D "Ext2 Filesystem Utilities"
+DESCRIPTION =3D "The Ext2 Filesystem Utilities (e2fsprogs) contain all of =
the standard utilities for creating, \
+fixing, configuring , and debugging ext2 filesystems."
+HOMEPAGE =3D "http://e2fsprogs.sourceforge.net/"
+
+LICENSE =3D "GPL-2.0-only & LGPL-2.0-only & BSD-3-Clause & MIT"
+LICENSE:e2fsprogs-dumpe2fs =3D "GPL-2.0-only"
+LICENSE:e2fsprogs-e2fsck =3D "GPL-2.0-only"
+LICENSE:e2fsprogs-mke2fs =3D "GPL-2.0-only"
+LICENSE:e2fsprogs-tune2fs =3D "GPL-2.0-only"
+LICENSE:e2fsprogs-badblocks =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://NOTICE;md5=3Dd50be0580c0b0a7fbc7a4830bbe6c12b=
 \
+                      file://lib/ext2fs/ext2fs.h;beginline=3D1;endline=3D9=
;md5=3D596a8dedcb4e731c6b21c7a46fba6bef \
+                      file://lib/e2p/e2p.h;beginline=3D1;endline=3D7;md5=
=3D8a74ade8f9d65095d70ef2d4bf48e36a \
+                      file://lib/uuid/uuid.h.in;beginline=3D1;endline=3D32=
;md5=3Ddbb8079e114a5f841934b99e59c8820a \
+                      file://lib/uuid/COPYING;md5=3D58dcd8452651fc8b07d1f6=
5ce07ca8af \
+                      file://lib/et/et_name.c;beginline=3D1;endline=3D11;m=
d5=3Dead236447dac7b980dbc5b4804d8c836 \
+                      file://lib/ss/ss.h;beginline=3D1;endline=3D20;md5=3D=
6e89ad47da6e75fecd2b5e0e81e1d4a6"
+SECTION =3D "base"
+DEPENDS =3D "util-linux attr autoconf-archive-native"
+
+SRC_URI =3D "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=3Dm=
aster;protocol=3Dhttps"
+
+inherit autotools gettext texinfo pkgconfig multilib_header update-alterna=
tives=20
+
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sp=
arse/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch b/meta-oe/=
recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/0001-misc-create=
_inode.c-Fix-for-file-larger-than-2GB.patch
new file mode 100644
index 0000000000..1c578022fb
--- /dev/null
+++ b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/00=
01-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
@@ -0,0 +1,40 @@
+From 6359e0ec8ef249d202dbb8583a6e430f20c5b1a0 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sun, 30 Nov 2025 21:47:50 +0800
+Subject: [PATCH] misc/create_inode.c: Fix for file larger than 2GB
+
+Fixed:
+$ dd if=3D/dev/zero of=3D../image.ext4 bs=3D1M count=3D4k
+$ dd if=3D/dev/random of=3D../rootfs/largefile bs=3D1M count=3D3k
+$ ./misc/mke2fs -t ext4 -d ../rootfs/ ../image.ext4
+__populate_fs: Ext2 file too big while writing file "largefile"
+mke2fs: Ext2 file too big while populating file system
+
+This was because the offset is overflow, use __u64 to fix the problem.
+
+Another code which uses ext2_off_t is copy_fs_verity_data(), but it only c=
opies
+the metadata, so it should be enough large for it, just leave it there.
+
+Upstream-Status: Submitted [https://github.com/tytso/e2fsprogs/pull/258]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ misc/create_inode.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/misc/create_inode.c b/misc/create_inode.c
+index 624efc03..14273534 100644
+--- a/misc/create_inode.c
++++ b/misc/create_inode.c
+@@ -414,7 +414,7 @@ static ssize_t my_pread(int fd, void *buf, size_t coun=
t, off_t offset)
+ }
+ #endif /* !defined HAVE_PREAD64 && !defined HAVE_PREAD */
+=20
+-static errcode_t write_all(ext2_file_t e2_file, ext2_off_t off, const cha=
r *buf, unsigned int n_bytes) {
++static errcode_t write_all(ext2_file_t e2_file, __u64 off, const char *bu=
f, unsigned int n_bytes) {
+ 	errcode_t err =3D ext2fs_file_llseek(e2_file, off, EXT2_SEEK_SET, NULL);
+ 	if (err)
+ 		return err;
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sp=
arse/e2fsprogs-fix-missing-check-for-permission-denied.patch b/meta-oe/reci=
pes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/e2fsprogs-fix-missin=
g-check-for-permission-denied.patch
new file mode 100644
index 0000000000..4cd1098597
--- /dev/null
+++ b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/e2=
fsprogs-fix-missing-check-for-permission-denied.patch
@@ -0,0 +1,32 @@
+From 1c7078fda6d23f1d80b0d95ac3e908364749e188 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Wed, 10 Aug 2016 11:19:44 +0800
+Subject: [PATCH] Fix missing check for permission denied.
+
+If the path to "ROOT_SYSCONFDIR/mke2fs.conf" has a permission denied probl=
em,
+then the get_dirlist() call will return EACCES. But the code in profile_in=
it
+will treat that as a fatal error and all executions will fail with:
+      Couldn't init profile successfully (error: 13).
+
+Upstream-Status: Pending
+
+Written-by: Henrik Wallin <henrik.b.wallin@ericsson.com>
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ lib/support/profile.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/support/profile.c b/lib/support/profile.c
+index bdb14b17..1bd62406 100644
+--- a/lib/support/profile.c
++++ b/lib/support/profile.c
+@@ -335,7 +335,7 @@ profile_init(const char * const *files, profile_t *ret=
_profile)
+ 				*last =3D new_file;
+ 				last =3D &new_file->next;
+ 			}
+-		} else if ((retval !=3D ENOTDIR) &&
++		} else if ((retval !=3D ENOTDIR) && (retval !=3D EACCES) &&
+ 			   strcmp(*fs, default_filename))
+ 			goto errout;
+=20
diff --git a/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sp=
arse/mkdir_p.patch b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprog=
s-ext4sparse/mkdir_p.patch
new file mode 100644
index 0000000000..2dbeba1095
--- /dev/null
+++ b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/mk=
dir_p.patch
@@ -0,0 +1,28 @@
+From e143a900199c5bb10b28f3fc8f4d36bbb6ffdd5f Mon Sep 17 00:00:00 2001
+From: Joe Slater <jslater@windriver.com>
+Date: Tue, 7 Mar 2017 14:53:19 -0800
+Subject: [PATCH] e2fsprogs: expand @mkdir_p@
+
+Add AC_SUBST to configure.ac.  @mkdir_p@ is currently
+not expanded so no locale data is written into usr/share/locale.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <jslater@windriver.com>
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 131caef3..ca448d97 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -938,6 +938,8 @@ AC_SUBST(PACKAGE)
+ AC_SUBST(VERSION)
+=20
+ AM_GNU_GETTEXT([external])
++dnl @MKDIR_P@ is expanded in AM_GNU_GETTEXT
++AC_SUBST([mkdir_p],['$(MKDIR_P)'])
+ dnl
+ dnl End of configuration options
+ dnl
diff --git a/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sp=
arse/quiet-debugfs.patch b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2=
fsprogs-ext4sparse/quiet-debugfs.patch
new file mode 100644
index 0000000000..4ba150e27d
--- /dev/null
+++ b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/qu=
iet-debugfs.patch
@@ -0,0 +1,27 @@
+From b66c973e004e0c458ef275b41ac2d8d9ff33d29f Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Mon, 23 Dec 2013 13:38:34 +0000
+Subject: [PATCH] e2fsprogs: silence debugfs
+
+When executing a script don't echo every command, as we do this for entire
+filesystems at rootfs time.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ debugfs/debugfs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
+index 909c1df3..0842369e 100644
+--- a/debugfs/debugfs.c
++++ b/debugfs/debugfs.c
+@@ -2529,7 +2529,7 @@ static int source_file(const char *cmd_file, int ss_=
idx)
+ 		cp =3D strchr(buf, '\r');
+ 		if (cp)
+ 			*cp =3D 0;
+-		printf("debugfs: %s\n", buf);
++		/*printf("debugfs: %s\n", buf);*/
+ 		retval =3D ss_execute_line(ss_idx, buf);
+ 		if (retval) {
+ 			ss_perror(ss_idx, retval, buf);
diff --git a/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sp=
arse/remove.ldconfig.call.patch b/meta-oe/recipes-devtools/e2fsprogs-ext4sp=
arse/e2fsprogs-ext4sparse/remove.ldconfig.call.patch
new file mode 100644
index 0000000000..307088d42b
--- /dev/null
+++ b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse/re=
move.ldconfig.call.patch
@@ -0,0 +1,41 @@
+From 972086935d6c7f6e603004fd7f94bd13a65f470c Mon Sep 17 00:00:00 2001
+From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
+Date: Wed, 30 Jan 2013 15:22:04 +0200
+Subject: [PATCH] When /etc/ld.so.cache is writeable by user running bitbak=
e
+ then it creates invalid cache (in my case libstdc++.so cannot be found af=
ter
+ building zlib(-native) and I have to call touch */libstdc++.so &&
+ /sbin/ldconfig to fix it.
+
+So remove ldconfig call from make install-libs
+
+Patch authored by Martin Jansa.
+
+Upstream-Status: Inappropriate [disable feature]
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
+---
+ lib/Makefile.elf-lib | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/lib/Makefile.elf-lib b/lib/Makefile.elf-lib
+index f850f3dd..cc1e6a70 100644
+--- a/lib/Makefile.elf-lib
++++ b/lib/Makefile.elf-lib
+@@ -50,8 +50,6 @@ install-shlibs install:: $(ELF_LIB) installdirs-elf-lib =
$(DEP_INSTALL_SYMLINK)
+ 	$(E) "	SYMLINK $(libdir)/$(ELF_IMAGE).so"
+ 	$(Q) $(INSTALL_SYMLINK) $(ELF_INSTALL_DIR)/$(ELF_SONAME) \
+ 		$(libdir)/$(ELF_IMAGE).so $(DESTDIR)
+-	$(E) "	LDCONFIG"
+-	$(Q) -$(LDCONFIG)
+=20
+ install-strip: install
+ 	$(E) "	STRIP-LIB $(ELF_INSTALL_DIR)/$(ELF_LIB)"
+@@ -67,7 +65,6 @@ uninstall-shlibs uninstall::
+ 	$(RM) -f $(DESTDIR)$(ELF_INSTALL_DIR)/$(ELF_LIB) \
+ 		$(DESTDIR)$(ELF_INSTALL_DIR)/$(ELF_SONAME) \
+ 		$(DESTDIR)$(libdir)/$(ELF_IMAGE).so
+-	-$(LDCONFIG)
+=20
+ clean::
+ 	$(RM) -rf elfshared
diff --git a/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sp=
arse_1.0.bb b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4s=
parse_1.0.bb
new file mode 100644
index 0000000000..477b49cbda
--- /dev/null
+++ b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse_1.=
0.bb
@@ -0,0 +1,62 @@
+#=20
+# This recipe is based on openembedded-core/meta/recipes-devtools/e2fsprog=
s/e2fsprogs_1.47.3.bb
+# We are stripping the refernce recipe and keeping only the bare minimum t=
o get the ext2simg.c compiled
+#
+require e2fsprogs-ext4sparse.inc
+
+inherit native
+
+SRC_URI +=3D "file://remove.ldconfig.call.patch \
+           file://mkdir_p.patch \
+           file://0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.pa=
tch \
+           file://e2fsprogs-fix-missing-check-for-permission-denied.patch =
\
+           file://quiet-debugfs.patch \
+           "
+
+SRCREV =3D "da631e117dcf8797bfda0f48bdaa05ac0fbcf7af"
+
+EXTRA_OECONF =3D " \
+    --libdir=3D${base_libdir} \
+    --sbindir=3D${base_sbindir} \
+    --enable-elf-shlibs \
+    --enable-largefile \
+    --disable-libuuid \
+    --disable-libblkid \
+    --disable-uuidd \
+    --disable-fuse2fs \
+    --with-crond-dir=3Dno \
+"
+
+# Fix do_compile error with old kernel such as 5.10
+CACHED_CONFIGUREVARS =3D "ac_cv_header_linux_fsverity_h=3Dno"
+
+PACKAGES =3D "${PN}"
+FILES:${PN} =3D "${bindir}/ext2simg_android"
+
+DEPENDS +=3D "util-linux-native android-tools-native"
+
+do_compile () {
+    oe_runmake -C ${B}/lib/et
+    oe_runmake -C ${B}/lib/ext2fs
+
+    # Source directory for ext2simg.c in the e2fsprogs tree
+    SRC_EXT2SIMG=3D"${S}/contrib/android"
+
+    INCLUDES=3D"-I${S}/lib -I${B}/lib -I${SRC_EXT2SIMG}/lib"
+
+    # STAGING_LIBDIR_NATIVE: where android-tools-native installed libspars=
e
+    LIBS=3D"-L${B}/lib -L${STAGING_LIBDIR_NATIVE} -lsparse -lext2fs -lz -l=
com_err"
+
+    ${CC} ${CFLAGS} ${LDFLAGS} -o "${B}/ext2simg_android" "${SRC_EXT2SIMG}=
/ext2simg.c" ${INCLUDES} ${LIBS}
+}
+
+do_install () {
+    install -d ${D}${bindir}
+    install -m 0755 ${B}/ext2simg_android ${D}${bindir}/ext2simg_android
+}
+
+# Use RPATH to embed the path to libsparse (from android-tools-native) dir=
ectly into the binary
+# $ORIGIN allows the binary to locate its dependencies relative to its own=
 location
+# ensuring it works in any build environment without LD_LIBRARY_PATH manip=
ulation
+BUILD_LDFLAGS  +=3D "-Wl,-rpath,'\$ORIGIN/../${baselib}'"
+TARGET_LDFLAGS +=3D "-Wl,-rpath,'\$ORIGIN/../${baselib}'"
--=20
2.34.1


