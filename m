Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617D31093183
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 07:41:41 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6278.1773985406973570499
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 22:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=cLU27dRE;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.6, mailfrom: git-patches@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qxnTQTRE1S5SXDSNa1h3w4w9UNwD5MHviL/NCRok7A8OvgZ7Hfh6PR4u6ryoHg1nXXtfWqnRZ2yUxitv2qL5TLyP/4YH8UVJ1HSQS8E315iiS+m6G8zHWeKHfXToEqiiHGK4b5yWzc/VSwJvne9l77QUc5cYVpuGqvR2g7/2mtx3EkNkXR2p0pjzJAdFiQ+c+PrdmJcVIunf4L7R0XxR2DdS0MCn3+JNlveEu+GbcOqvpfbiv5W5XcVxXZWf40veTbuZk4gDIBeeuFWOy30oPoaBPYMrxKZ2nJPQkCl8/wspZv68jHXoAspSn76N0EKwtubulVMQoMsk+vewY+YZcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+iPM/tKNiF8PshublR1o2LjBmjgf2FoesJ3WeW4iNU=;
 b=VYCd0TB3hCL121HsRrn+koVHBE4Z1ClAU0XZY/vDdJKn0fmQAQpqvjK6fT54uD+lqp1cRiGLwBZsZF1x0zLC3A19j+0T1oHNl/FYQQBHgZ5iP4r6+nbcsvSJNq+PkNW4Qj4kF07vrFly2eJ2X/6YL3qpxQrco48QSKmwrblMxNWTRKw8qXaE+kAFizgd4kkEriWbaUzXrsKs4uEXeyq2babQ988S3/bu8lInovoJnlxDWrL8IcG5lFJnAlKEI4GaYGaspZ/tsxyzfdP6lEVFxcz7vQCRcUQjnlR4qG/sNdUhuhbcCDs1qY+apd7BS4eS7pgpV0al60bzxSZ7y8IS+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+iPM/tKNiF8PshublR1o2LjBmjgf2FoesJ3WeW4iNU=;
 b=cLU27dRExUffzM6zfQRhFBvH7oSdmqkgxA90gTfvOdmuLFx1h9cJUVEUxA+KbuC4P3fOQi0s0Z4Qh2wXpE73/Z2zoMjH13V/SqoTmvfp3Sne17ZiLHC2iawc3u2jW3EuRKRdmZtJSgVYBWaV+DxoaHrsAJMnyLThOfUsX2Ja0LwBmu6Eh/2ZjVDMhnAEYaAQNCMkQ63A5Le83f65NJZIABGX+7HBAH4qIVBC+knETvSAbtSxeizfWV9hVAulfz18o7QyQ80fj1WxU3CBLFbz9x+6o8WHc9F600WPky3hG1wB+IX1kKS3IXGPOj38RTS2aKWp2MOfdykCxHlaQOMCPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1be::5)
 by PN6P287MB5306.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 05:28:26 +0000
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2]) by PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2%4]) with mapi id 15.20.9723.022; Fri, 20 Mar 2026
 05:28:26 +0000
From: Ashish Kumar Mishra <git-patches@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Ashish Kumar Mishra <git-patches@bmwtechworks.in>,
	AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Subject: [meta-oe][PATCH v1] image_types_sparse: switch ext* conversion to ext2simg_android
Date: Fri, 20 Mar 2026 10:58:13 +0530
Message-ID: <20260320052813.3323280-1-git-patches@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: PN5PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:261::17) To PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB1970:EE_|PN6P287MB5306:EE_
X-MS-Office365-Filtering-Correlation-Id: da83583e-ad36-4d33-7ca0-08de864182e6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|18002099003|56012099003|55112099003;
X-Microsoft-Antispam-Message-Info: 
	aF8Hdc8X0Ki5YMogKFn9dUrt/ZBTc2bL9eQpvQGbcQrfL+kZdcIyyzQbs0gVREfaOf//vTT2Gc88SeYNnqg51BIEhjjI0wq/WcZPO5oCsIJRno2K8JThaZ+ED/JiWP/3Dq2Z1Tfkbz3PAAX/7h9OwpJ6Vd9Vc9NKDiEJnkr+Ha0JG5BxNgOoItHeKtwxiVKyPFK7qbrXCr8jRFdjuDHN1Zh/TOa8fH4gcYPgKfxvb42S+ZAFlnitvVexo36Kd4Rndaj3JS2XKaY6AxIFOOXqEXIyC6mSy8vcgT3XbYJC5zpeZ+REu9KwUwfv/rASAtHT3hTsN/fKl/lcS31w0pVltvcwDyAVOJmYent2oSd2wzHE/TWw1bRh7s5MJa8yH7p1j33mQLH1eSVhOxOnQ12XDGp2ABuUheuDcEuVtJyn429wN7tfW7bOSHYUxoq/MfUp9RBrC8l3rFL8PQvETRoyc3JEabAsLmGtMMURcQDb5oqFuCV6Jn1uFpawutYvMrKrlB1Tg58Fq5sSjENkLVBkW8BmkX7XMBKxPeKQTCq5dCJ2kaP3IclyaB1rRnMPDpa5hqM+Y64+4YII5AKCCdIHBz9c6R2jErSD/Pq0xHufuMQsGOyPTXnqaDkHL8r2TOdCRMJZZcg8YpY7dLiFFh/sNa+LXLBqMsnDN7dAOMpGYtY2CLoy3TC+2fDk//mG2l4yrh5Dowd66zbhWdNzm6Vy5FCQ53FSZYRFBkvkbUwvDV4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB1970.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(18002099003)(56012099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MegLq2XnZLGBzVO1wAn7tcIvcdbqgpyqHfbCBS1rP1BWcQRRZgtSkHMOFlvk?=
 =?us-ascii?Q?pZ1UbJpbF2XMGMHlprWvM+CzJl5KCeTZqdtlW1VZZeg6nUkxqKynaUilAJfH?=
 =?us-ascii?Q?Z97VgdWe8pmT7LQN7Q3cIGDGNgfK5eB271Jm/Am+T7RozaREB1Da/sBM/Vd8?=
 =?us-ascii?Q?BsMkNczntRHNfldGJMRtzmsieSUE9g5n/K6RUJEYc9YrqdnaM5dqR+AyQ8Ju?=
 =?us-ascii?Q?Uj89jUXb/uFaAsS7gYsmxy/5VimxaVhMc4zSMbbsHGsKl8UtGFla/g6+LPYb?=
 =?us-ascii?Q?CMLjrsm9dfqObqHws3uCEgyUOZOtXsW9X7GD59Twg2lobWbURSNimHTYbwgt?=
 =?us-ascii?Q?GtdfBJGEOclpDwBgXXTEpMJQWHStKDdYLvQjP78FbqiLjt/YvFr+6ZeUsekl?=
 =?us-ascii?Q?n/i9KIqWYHDi8yquAZf2kl+AfoqD1HVOimZBqZweXG3GQxU6Y8L8ZaO084L5?=
 =?us-ascii?Q?SGjd5jM/XKn7ZsIwfH+ZHbN00LLMSUyT1sQRcMu5jSnV+eOO8QpjVyMXRblm?=
 =?us-ascii?Q?WWi1JfgeaB/uSO+c29K6UT8IcePQmRCCXo9TB+zs8TuHD9aQm8HSkDtdGhjr?=
 =?us-ascii?Q?k0+kOQsz1xz3fWb58sKRF3gnWLT0w/2xxVUw/UdKLBo9F3YbY8ZW+moOaZWH?=
 =?us-ascii?Q?G4N8YwrfJv2EhQD8WXfSkEwj9sKnLdrzWje/BRx7jO8kWVlGCGoNu6yuae/a?=
 =?us-ascii?Q?+4qGI0HVyKTt7j2s5Bv9GbkIrdHg6BBvsOQlNF8pWeTjwhTtZLC3yOnUUGl3?=
 =?us-ascii?Q?q3GVUN0IKVchZb+6xAcEeOoKB9VXRVhaB7kY0YQgOXFPBtZ6xKumG4hz/mEK?=
 =?us-ascii?Q?jPRHx6TdMI2zPLbtn/DOmr0upAFz5tdU60MlLukh8K5Pak9l2TdZ1APP1NBH?=
 =?us-ascii?Q?ZgyhvxuoOP/YQCJaU+mHxf2WNe9T8r+MVe3SRlm4ErOKj8b436xUQolrmcdB?=
 =?us-ascii?Q?MukzCTk1Tfp3P8/o9N4cC5zYASMo9TP/oSipDoCPxDxWJe13ArO/m2XB9MQV?=
 =?us-ascii?Q?+DlCXI+5PkjAEjSnSKHdwJaT9fLWoTQsVgfoPcRYsHMZtdm/5m97FCYm5k7Q?=
 =?us-ascii?Q?Wsn+jHF6UYa2CvO1kyK+q8p5S2P7BA4tMm+Niu1R0FGcBYvbFU27YOY/yK3J?=
 =?us-ascii?Q?u/Pd5djypDt/SyX9Q+fjfgIIYegeAJm/ei99hW3PIzZuMQEwlm1PEuL8dCZt?=
 =?us-ascii?Q?Ewc9ZkmjZm9NemTEze9c9fg7FucKAN0N1mDiBYgcmaLk/6V+LNFrf6lXpMWv?=
 =?us-ascii?Q?cHgxg3D5kQvT6FBGSNVnRKx2upENQmtMVnSIjP0X2yEu/oHC18ppuW02XYn6?=
 =?us-ascii?Q?Yrrb7E3OCCeLGxHbcse6jnCB6cD8jHjxW0oxgT0WaoxYj49PnyP7k5KAo7ig?=
 =?us-ascii?Q?qbbSTBdqUeiIEWUg+LHgu7JGw7l0Zj30ZlMM4exS+ZZe8qExFAw1rbgeYWH9?=
 =?us-ascii?Q?/LDtnOuKoj9ALmtC0IEZ992coPRetF1y0tSdLgyMG8B1VAeYpbDjT9I7jjFx?=
 =?us-ascii?Q?490WnLupKNOUd/P+MBYAqGJvym1+6ZdC/BP+Zxr9RaXUMkTBAPWXqOAxtm5u?=
 =?us-ascii?Q?U4GDg5OYkywtiF/eg0nLAq60K04POtwt34ohgT2GPWFIDDETcfNQ8nVpH+yp?=
 =?us-ascii?Q?j5ml8VumtUguFJFk9bOVy5BLbTFXnXMkUw0iDvl/8TS+IuCpqLonr0Q6GxX9?=
 =?us-ascii?Q?Kn87OcD1mFBgVACipFdIdlbel5vFM0XEh4JlM6HEyhYtuaokTH2LOBu/7GHm?=
 =?us-ascii?Q?11VtR1uYjEo6JnlpobY2tC8GBsS5O2w=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: da83583e-ad36-4d33-7ca0-08de864182e6
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 05:28:26.3628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5eFJ6hyGzDiuoGZIm5SST2682rcKPhrNx8uXh54mb8EpJgAUTK9z5lTNs9RxllRhhUXjnVt/9XzzDSP2q2CHAJIWhQ07UfHhj9yjhfxCXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN6P287MB5306
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 07:41:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125420

We have RFC discussion at
https://lists.openembedded.org/g/openembedded-devel/message/124499

Move ext* sparse image generation from 'img2simg' to ' ext2simg_android'
Summary of changes:
- android-tools: Export libsparse/libbase/liblog headers and libs to
  sysroot to allow external linking. Masked v5.1.1.

- image_types_sparse.bbclass: Update CONVERSION_CMD to use  ext2simg_androi=
d
  for ext* types

- layer.conf: Sync BBMASK and add dynamic-layer paths.

- Add a custom do_compile step to build the  ext2simg_android utility (ext2=
simg)
  when building for the native class.

- Added 'image_types_sparse' to IMAGE_CLASSES and enabled 'ext4.sparse'
  in IMAGE_FSTYPES.
  This allows the build system to generate Android-style sparse image

- Switch to using $ORIGIN/../${baselib}.
  $ORIGIN is a special variable recognized by the dynamic linker that repre=
sents
  the directory containing the executable.

Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
---
 meta-oe/classes/image_types_sparse.bbclass    | 15 +++-
 meta-oe/conf/layer.conf                       | 11 ++-
 .../android-tools/android-tools_29.0.6.r14.bb | 44 ++++++++++++
 .../e2fsprogs-ext4sparse.inc                  | 26 +++++++
 ...inode.c-Fix-for-file-larger-than-2GB.patch | 40 +++++++++++
 ...-missing-check-for-permission-denied.patch | 32 +++++++++
 .../e2fsprogs-ext4sparse/mkdir_p.patch        | 28 ++++++++
 .../e2fsprogs-ext4sparse/quiet-debugfs.patch  | 27 ++++++++
 .../remove.ldconfig.call.patch                | 41 +++++++++++
 .../e2fsprogs-ext4sparse_1.0.bb               | 68 +++++++++++++++++++
 10 files changed, 328 insertions(+), 4 deletions(-)
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
index 5416c2a019..75f0d00703 100644
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
+            bbwarn 'Running e2fsprogs-derived ext2simg_android..' ; \
+            ext2simg_android '${IMAGE_NAME}.${type}' '${IMAGE_NAME}.simg' =
|| bberror 'ext2simg_android failed' \
+            ;; \
+        *) \
+            bbwarn 'Generating sparse image for non-ext filesystem...'; \
+            img2simg -s '${IMAGE_NAME}.${type}' '${IMAGE_NAME}.${type}.spa=
rse' ${SPARSE_BLOCK_SIZE}; \
+            ;; \
+    esac; \
     if [ "${DELETE_RAWIMAGE_AFTER_SPARSE_CMD}" =3D "1" ]; then \
         rm -f ${IMAGE_NAME}.${type};\
         bbwarn "Raw file ${IMAGE_NAME}.${type} removed" ;\
     fi;\
  "
-
-CONVERSION_DEPENDS_sparse =3D "android-tools-native"
+CONVERSION_DEPENDS:sparse =3D "android-tools-native e2fsprogs-ext4sparse-n=
ative"
+do_image_ext4[depends] +=3D "e2fsprogs-ext4sparse-native:do_populate_sysro=
ot"
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 186ff9a488..0c6e937a42 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -12,7 +12,16 @@
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
+
+# Manually removing default android-tools recipes
+BBMASK +=3D "meta-openembedded/meta-oe/recipes-devtools/android-tools/andr=
oid-tools_5.1.1.r37.bb"
=20
 BBFILE_COLLECTIONS +=3D "openembedded-layer"
 BBFILE_PATTERN_openembedded-layer :=3D "^${LAYERDIR}/"
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
index 0000000000..96f1f08177
--- /dev/null
+++ b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse_1.=
0.bb
@@ -0,0 +1,68 @@
+require e2fsprogs-ext4sparse.inc
+
+inherit native
+
+SRC_URI +=3D "file://remove.ldconfig.call.patch \
+           file://mkdir_p.patch \
+           file://0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.pa=
tch \
+           "
+SRC_URI:append:class-native =3D " \
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
+DEPENDS +=3D "util-linux-native"
+
+# Fix e2fsprogs-native do_compile error with old kernel such as 5.10
+CACHED_CONFIGUREVARS:class-native =3D "ac_cv_header_linux_fsverity_h=3Dno"
+
+do_install () {
+}
+
+
+RDEPENDS:${PN} =3D ""
+RRECOMMENDS:${PN} =3D ""
+ALTERNATIVE:${PN} =3D ""
+
+PACKAGES =3D "${PN}"
+FILES:${PN} =3D "${bindir}/ext2simg_android"
+FILES:${PN}:class-native +=3D "${bindir}/ext2simg_android"
+
+DEPENDS:append:class-native =3D " android-tools-native "
+
+do_compile:append:class-native() {
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
+do_install:append:class-native() {
+    install -d ${D}${bindir}
+    install -m 0755 ${B}/ext2simg_android ${D}${bindir}/ext2simg_android
+}
+
+BUILD_LDFLAGS  +=3D "-Wl,-rpath,'\$ORIGIN/../${baselib}'"
+TARGET_LDFLAGS +=3D "-Wl,-rpath,'\$ORIGIN/../${baselib}'"
--=20
2.34.1


