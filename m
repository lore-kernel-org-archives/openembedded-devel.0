Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713FCC71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 20:46:56 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.6])
 by mx.groups.io with SMTP id smtpd.web10.14977.1750538814598197521
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 13:46:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=YDNagRvz;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.70.6, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQQfdrtCmrJMLwCXwFLBN7w/ghD1twehxxeqiYdvtchg/fgoMQYS5BhqE0R3fOUQ6fI7jmlPNY54EmORbJvxm5oEyUI+RB9mh0SwvGO+0J2giGJYuksIGjmgyzJovNwX6jW+T/wLFbKeY9H5Uvqq1rBZgefsoiEOLcUGQhdSam5tRi6FPX8+mMXXPGyliLavIUEYbwv7n5uOfT7pb9Q6h2ExlhF+XT9maAAJdGLrngxUL69BXCpZHA3xf2HbP8vmz58Q5AZCdxVxt9g350fVfEjkbUwFGFD6HkH6g1pDgDU/8hU60TVd/Tt455e2eWsjPeZdtZpmRri6X7NOelZM4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dukNFNmsQC4ezRKIkfNopSovl2/wnPiObD5wXHI1Iso=;
 b=ySQDwo0UQdzvloVMcKyDiPY+TrV7D47ci88FWwLBBMYEWtyKPX1L4SuDez23qlZ30WW6wui+hTEgRBOd7PWkhGe8bUn7f80tUaHi8rUofAv5drU29cfRkf4GCc98AlGoiHfq1lpTulos7C5+fNYBg/pXhmLTiBxBy4bDq0j3cW7qI9UtLZwIIW7d9ybyZTdv9ybD35yQLVclaxuUsuyd+Dv4tnEs+uheXaDTSMDcG9sFwi14Q/Q/zWSL7X40R59jHJmFezCcCjQQdyxRyBPlTTxeW7qsOz3M4+ShasVX4UGe5Vlrxchz3aH0JBvoM7scY0H4WKizmqa1579nja2oZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=temperror action=none
 header.from=leica-geosystems.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dukNFNmsQC4ezRKIkfNopSovl2/wnPiObD5wXHI1Iso=;
 b=YDNagRvz46I+yVNuHlVOwYe0W2Y/B9rVOE13glDteyVMV5DSZ+irazt66nA+8OOFuxCzPKECzDPLB2nRVFb9r7ycvvY9DhLX75q0YVe5d/e5WFyshmu4bJ2BrsTKfKgf4NDVkKKFS3ove5dBBaNOgyQ5/rxvfHqkNXdFbAOCtn8=
Received: from AM0PR03CA0021.eurprd03.prod.outlook.com (2603:10a6:208:14::34)
 by OSKPR06MB10004.eurprd06.prod.outlook.com (2603:10a6:e10:9a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Sat, 21 Jun
 2025 20:46:48 +0000
Received: from AM4PEPF00027A6A.eurprd04.prod.outlook.com
 (2603:10a6:208:14:cafe::3e) by AM0PR03CA0021.outlook.office365.com
 (2603:10a6:208:14::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.27 via Frontend Transport; Sat,
 21 Jun 2025 20:46:48 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=leica-geosystems.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of leica-geosystems.com: DNS Timeout)
Received: from hexagon.com (193.8.40.94) by
 AM4PEPF00027A6A.mail.protection.outlook.com (10.167.16.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Sat, 21 Jun 2025 20:46:46 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sat, 21 Jun 2025 22:46:42 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Date: Sat, 21 Jun 2025 22:46:29 +0200
Subject: [PATCH meta-oe v2 2/3] classes: add discoverable disk image class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-discoverable-disk-image-v2-2-52df3053fc1f@leica-geosystems.com>
References: <20250621-discoverable-disk-image-v2-0-52df3053fc1f@leica-geosystems.com>
In-Reply-To: <20250621-discoverable-disk-image-v2-0-52df3053fc1f@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?utf-8?q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>, raj.khem@gmail.com, 
 mikko.rapeli@linaro.org, erik@riscstar.com, 
 bsp-development.geo@leica-geosystems.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.14.2
X-OriginalArrivalTime: 21 Jun 2025 20:46:42.0641 (UTC) FILETIME=[9836B410:01DBE2ED]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A6A:EE_|OSKPR06MB10004:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c9dd984-45c4-4f5e-4993-08ddb104bd35
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eEd5dnZvR2kwRE9oeXpROWhDZEhwT2tBZmFGZm9HU3dnV3dNTkdKc2tPSE9M?=
 =?utf-8?B?SkNITmlYcU5LR2xNMzV5aldSYnlFS1I4ZGZ3dUxYbWlvYTQxMUxIOUE3amh5?=
 =?utf-8?B?R1FVODFzc2wra3pqaDN4RnRYaVk4V3BncHU5a3hnU0JOdzBsTmFkaUFsWDds?=
 =?utf-8?B?YmI5bE1uRHFNR3pwRUdFQW9nL0F0Q1locjNhTURnaWl3bURxblFtT3cvMldC?=
 =?utf-8?B?bnBTcGhhanFXN2V1aFhpVk5zTi9WQVliRVFuM0lnL0xUR1lMaGJIbTdWZVoy?=
 =?utf-8?B?OWsvMUY3TG5scnhBMFFjYjZ5SEhYWHZvd1hObmdUR2dSUTVMYlpSTXF6dWNZ?=
 =?utf-8?B?Vi9DeEcyczRuNXBZcExNaTI2OW9Ma0JYczJ6TlAxRDJHbXJFbE1yWHR2QldS?=
 =?utf-8?B?Smd4NHZVNjR1b1h3bnM4cnNUbExsU0d4SUVEQy95c3VRalVJM2ZURFJsVjYy?=
 =?utf-8?B?cllOMEhjd05ZSVlxZEFJTGVZZjk3OExpdGNlYVdMcHFjTm5MNUNWYmZJdDV6?=
 =?utf-8?B?ZklzUmticjI3ZTU4RzRvVkJmVUtuUGtkNm5NNzg2NnYzVXVjZmZYNGt5M2hZ?=
 =?utf-8?B?RUFHZjc5ZmRLVmp5eHNMRTlVa0VPMzBYOFRYU0phS0NrSXVsNkliMlVaaG5x?=
 =?utf-8?B?NFIwbDJSd0Z4MWZMTHZPYjJTZlA1a0JZNkQ0c1Q2R0FyclliTVpMbWxkRldl?=
 =?utf-8?B?c2IvdXdJUHBkaEVWangrVjRURWt0bXRINTgzR0QxaW5QbFl4MWxvSlBNZnQy?=
 =?utf-8?B?d2ZWTGQwa0xDUmxFZXkrdTk4N1pSaXJsY3h1QytLdzNLT3gyTHlmZUp6ZG5t?=
 =?utf-8?B?cUtOeWlvVFF6VkpibGJZMWJnT010b0tveEJtS3I2bnNxTlZNdU16QXZNT3hu?=
 =?utf-8?B?QnRwOFF3ODY3b1BSMUZHeW9lR29zN2VOTnNqQUxPMURBaDRjdGlvSWF3U1RE?=
 =?utf-8?B?Y2xUZWF5eWlTTXh6OUdPZXpiWVhoc3YwRFRrR1dXNWE4MzI3Z0JLbHZxSFJh?=
 =?utf-8?B?TmU3dGpqd3lQTkh0U2dTdXJRZ0JtVXFJa3BDekFJU1VLN0NKOTVHUlpROHBD?=
 =?utf-8?B?TSs4M0dOYjRLSjR6WWpQczF4cER6SHhYOExEWWRPNmtyWHhrYU8rZjc3Sysy?=
 =?utf-8?B?S1RhWmMvcHFReS9nRjNwY0dKSWdDdVNEb3ExWG1GWFdLZG84Z0lRVUdFZk5T?=
 =?utf-8?B?RVphSDdSSDZZSDd3TTZsODVVekVUV0RmWTI4eTArQ01jeFVpUlZrc1F2bjM4?=
 =?utf-8?B?MEtQRklnYUp3Sm45TllnTW1iWVFSaXpkT2E5V2tvZFVCa3pOY0pWMGpRSUh5?=
 =?utf-8?B?RXRkNVVJQWM0U3FsQitKeERPc1dYUTRzeFFnWUU5d2J2WTlySXZPOFYvQmVO?=
 =?utf-8?B?dTNsa3lzZUdvN2V1bmRBSnpNdnA1MUJpSHd4Z2FjV3lMbFIyRWpwOEhDS2JT?=
 =?utf-8?B?RmZ6NnNHOUhTY09paTF2OHZrR1NQU1JZRVVKeEx6UkZqY3A2c3FZcDA3aDk1?=
 =?utf-8?B?NS94b3JqLzF4VGNLQVp6Z3l4Wkg2ZmhYUWd5VVF0UHBJaWE5c1FFdldVdFRs?=
 =?utf-8?B?NUppV3pTVlVlaGxWeElQWFJsRFhsZ1FMZG5BZEF5L3Z1Rm9zOUllQmxnSEhY?=
 =?utf-8?B?emVqK0xUVC9QL251d28xQ2MvRHB3cWkxZXprUjFUbUJhRmZsRThxZTBRMG1p?=
 =?utf-8?B?OHV5Z0hsakk4QmxRaXZnT0RPSTNoOHkweHpQbEhzTmRaSUdQWEhOd1FHMlpo?=
 =?utf-8?B?NDFiVnJaV0VkKzg2dDhZWlJHQisvWklGUlFMdUVDQjNlL3pCSHNYSFBQeFRI?=
 =?utf-8?B?TENvQndpWHNCSHpTcjl0SmJOcFVNZkRHQ3VMVnhRUUloYVd1Wmg1ejh3VkhY?=
 =?utf-8?B?MGFNWi9nUzNMaVZzOENkNk5lVFNWOVU5UGZORW5oeEtMaytQSHRQY0UrcTRE?=
 =?utf-8?B?NHRZdkFLWWw3UThZUkNMdUlkOUFzdEY2S3VUdzMxV1E4S3JteU9WTTZNbWlI?=
 =?utf-8?B?TWRiUC9aUVRRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 20:46:46.8507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9dd984-45c4-4f5e-4993-08ddb104bd35
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR06MB10004
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 20:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118016

Add a class to build discoverable disk images [1] through
systemd-repart(-native).

Note that systemd >= 256 is required for '--private-key-source'

The class was adapted from a patch [2] floating upstream.

Link: [1]: https://uapi-group.org/specifications/specs/discoverable_disk_image/
Link: [2]: https://lists.openembedded.org/g/openembedded-core/message/198724
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/discoverable-disk-image.bbclass | 137 ++++++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/meta-oe/classes/discoverable-disk-image.bbclass b/meta-oe/classes/discoverable-disk-image.bbclass
new file mode 100644
index 0000000000000000000000000000000000000000..1f3a7b08e153a34a37e859435574e6d577045832
--- /dev/null
+++ b/meta-oe/classes/discoverable-disk-image.bbclass
@@ -0,0 +1,137 @@
+##
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+#
+# Discoverable Disk Image (DDI)
+#
+# "DDIs (Discoverable Disk Images) are self-describing file system
+# images that follow the DPS ( Discoverable Partitions Specification),
+# wrapped in a GPT partition table, that may contain root (or /usr/)
+# filesystems for bootable OS images, system extensions, configuration
+# extensions, portable services, containers and more, and shall be
+# protected by signed dm-verity all combined into one. They are
+# designed to be composable and stackable, and provide security by
+# default."
+# https://uapi-group.org/specifications/specs/discoverable_disk_image/
+# https://uapi-group.org/specifications/specs/discoverable_partitions_specification/
+# https://www.freedesktop.org/software/systemd/man/latest/systemd.image-policy.html
+
+# To be able to use discoverable-disk-images with a
+# root-verity-sig or usr-verity-sig configuration:
+# - systemd needs to include the PACKAGECONFIG 'cryptsetup', and
+# - the kernel needs the following features enabled:
+#   CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG=y
+#   CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG_PLATFORM_KEYRING=y
+#   CONFIG_EROFS_FS=y
+#   CONFIG_EROFS_FS_XATTR=y
+#   CONFIG_EROFS_FS_ZIP=y
+#   CONFIG_EROFS_FS_ZIP_LZMA=y
+#   CONFIG_INTEGRITY_SIGNATURE=y
+#   CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
+#   CONFIG_INTEGRITY_PLATFORM_KEYRING=y
+#   CONFIG_SYSTEM_BLACKLIST_KEYRING=y
+#   CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
+#   CONFIG_SIGNATURE=y
+
+# To sign DDIs, a key and certificate need to be provided by setting
+# the variables:
+#   REPART_PRIVATE_KEY
+#     private key so sign the verity-hash
+#   REPART_PRIVATE_KEY_SOURCE
+#     optional, can be "engine:pkcs11" when using a (soft)hsm
+#   REPART_CERTIFICATE
+#     corresponding public certificate, in .pem format
+#
+
+# For signature verification, systemd-sysext expects the matching
+# certificate to reside in /etc/verity.d as PEM formated .crt file.
+#
+# To enforce loading of only signed extension images, an appropriate
+# image policy has to be passed to systemd-sysext, e.g.:
+# systemd-sysext --image-policy='root=signed+absent:usr=signed+absent:=unused+absent' merge
+
+# 'systemd-dissect' can be used to inspect, manually mount, ... a DDI.
+
+inherit image
+
+IMAGE_FSTYPES = "ddi"
+
+DEPENDS += " \
+    systemd-repart-native \
+    erofs-utils-native \
+    openssl-native \
+"
+
+# systemd-repart --make-ddi takes one of "sysext", "confext" or "portable",
+# which it then takes and looks up definitions in the host os; which we need
+# to divert to the sysroot-native by setting '--definitions=' instead.
+# The chosen DDI_TYPE influences which parts of the rootfs are copied into
+# the ddi by systemd-repart:
+#   sysext: /usr (and if it exists: /opt)
+#   confext: /etc
+#   portable: /
+# For details see systemd/repart/definitions/${REPART_DDI_TYPE}.repart.d/*
+REPART_DDI_TYPE ?= "sysext"
+
+REPART_DDI_EXTENSION ?= "ddi"
+
+# systemd-repart creates temporary directoryies under /var/tmp/.#repartXXXXXXX/,
+# to estimate partition size etc. Since files are copied there from the image/rootfs
+# folder - which are owned by pseudo-root - this temporary location has to be
+# added to the directories handled by pseudo; otherwise calls to e.g.
+# fchown(0,0) inside systemd git/src/shared/copy.c end up failing.
+PSEUDO_INCLUDE_PATHS .= ",/var/tmp/"
+
+oe_image_systemd_repart_make_ddi() {
+
+    local additional_args=""
+
+    if [ -n "${REPART_PRIVATE_KEY}" ]
+    then
+        if [ -n "${REPART_PRIVATE_KEY_SOURCE}" ]
+        then
+            additional_args="$additional_args --private-key-source=${REPART_PRIVATE_KEY_SOURCE}"
+        fi
+        additional_args="$additional_args --private-key=${REPART_PRIVATE_KEY}"
+    fi
+
+    if [ -n "${REPART_CERTIFICATE}" ]
+    then
+        additional_args="$additional_args --certificate=${REPART_CERTIFICATE}"
+    fi
+
+    # map architectures to systemd's expected values
+    local systemd_arch="${TARGET_ARCH}"
+    case "${systemd_arch}" in
+        aarch64)
+        systemd_arch=arm64
+        ;;
+        x86_64)
+        systemd_arch=x86-64
+        ;;
+    esac
+
+    # prepare system-repart configuration
+    mkdir -p ${B}/definitions.repart.d
+    cp ${STAGING_LIBDIR_NATIVE}/systemd/repart/definitions/${REPART_DDI_TYPE}.repart.d/* ${B}/definitions.repart.d/
+    # enable erofs compression
+    sed -i "/^Compression/d" ${B}/definitions.repart.d/10-root.conf
+    echo "Compression=lzma\nCompressionLevel=3" >> ${B}/definitions.repart.d/10-root.conf
+    # disable verity signature partition creation, if no key is provided
+    if [ -z "${REPART_PRIVATE_KEY}" ]; then
+        rm ${B}/definitions.repart.d/30-root-verity-sig.conf
+    fi
+
+    systemd-repart \
+        --definitions="${B}/definitions.repart.d/" \
+        --copy-source="${IMAGE_ROOTFS}" \
+        --empty=create --size=auto --dry-run=no --offline=yes \
+        --architecture="${systemd_arch}" \
+        --json=pretty --no-pager $additional_args \
+        "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${REPART_DDI_EXTENSION}"
+}
+
+IMAGE_CMD:ddi = "oe_image_systemd_repart_make_ddi"
+do_image_ddi[deptask] += "do_unpack"

-- 
2.34.1


