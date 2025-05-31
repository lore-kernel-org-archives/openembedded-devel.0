Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF37C5B556
	for <webhook@archiver.kernel.org>; Sat, 31 May 2025 11:00:44 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.31])
 by mx.groups.io with SMTP id smtpd.web10.3725.1748689242393863809
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 May 2025 04:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=qufW0sQ2;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.84.31, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hos3AT5v6RRFKduNv388ryDTz9tH0UAnhakef2XHW/e+T1q+fT0yS9PWs22Jsj4whKWhSA425dZ40bm/IyG+TmAyn3Ht/8UifI9gfB0KJjuprB3cwlzVgJyFYggL6ZIV0rZRG+8H3lGKEArpLXUFg/HXx7vSsQRA/v/MXH5J1+3Nm9DNQZ9PpAXhaw28jWvcwHSiZV5aUhoH9/TmaIWS5AYOpRh0DSDx0YEzExoH1RfTRCUDtZKzuRKILcL5KafVn0PBYY2fwn/JuHiVHbkUaJBHlNynczshfwgq4AVeolDTQqe9R6ca65xJ4ngnFcGr8/NOYKi10UXRyFX0u/V7mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5h9IvqyI4NBPDC4gxMdQhlyYw21euYgm4a6FxJrSLQ=;
 b=eeVo65WM03kPeXia3Kzsw5SWypy7+D4BdzftqI5YKnC9s0q2eguFE+FlcmhhzMnDrFR+ZA4BU8bfFCv4Rl1k401jTY+DybyHRZC4htIHL8pOJX4NgAOGjXm11u4T0dMSENHS8YI/zJjZ+ZxetBGBXShAelSZVmHodbbdPqTeEh48/a0A74nsa6gMHw/2A/Whs4aoNxrmhPDhEwzNHfy6lnn+dkpCz6zDLBcsriRFVp7sQvcrgaAu6O6J/VxwcP5yivm0ZSH1qch9/Lk9+bXE3q+dx/n4UcpC22S+UzhVEZsxElKNe63yQIUPi7FhWsv+puRXRBmI8q1apsv0GS/z0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5h9IvqyI4NBPDC4gxMdQhlyYw21euYgm4a6FxJrSLQ=;
 b=qufW0sQ2IxjryBOvjmATFbgztuAj9jYoCGSdZRL5k8yfKlIsSO4xwH2e08/TcpLmD+aQRGmfZr6IB+AM9bkw/vd3iX9mmJxlr81r10scb06QaH07M+mH2MsprL/sC3wN9wUIE8TbJseCgBBkTzza6fkUhFNWJc/wmNkO/fpNUZc=
Received: from DU7P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::33)
 by VI1PR06MB6576.eurprd06.prod.outlook.com (2603:10a6:800:128::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Sat, 31 May
 2025 11:00:34 +0000
Received: from DB1PEPF00039230.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::b6) by DU7P189CA0028.outlook.office365.com
 (2603:10a6:10:552::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.27 via Frontend Transport; Sat,
 31 May 2025 11:00:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DB1PEPF00039230.mail.protection.outlook.com (10.167.8.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Sat, 31 May 2025 11:00:32 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sat, 31 May 2025 13:00:31 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com,
	mikko.rapeli@linaro.org,
	erik@riscstar.com
CC: bsp-development.geo@leica-geosystems.com,
	Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-oe][PATCH v1 2/3] classes: add discoverable disk image class
Date: Sat, 31 May 2025 13:00:21 +0200
Message-ID: <20250531110022.3843938-3-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250531110022.3843938-1-johannes.schneider@leica-geosystems.com>
References: <20250531110022.3843938-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 31 May 2025 11:00:31.0574 (UTC) FILETIME=[39F30760:01DBD21B]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039230:EE_|VI1PR06MB6576:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 52de995c-efe8-4276-4186-08dda0325d47
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VcfgC9TnAQHB/rh7YV9SLOOtemihfMFs+gJk0HgOUjmhA7x5mmDbnWZqZrCi?=
 =?us-ascii?Q?GZEiP2fIzBtk1q7lkIq5F1zuJGzHEDuKcu012sdLUNpHKY8TvJ7pxK4Gu0mB?=
 =?us-ascii?Q?SKwe8qfmogsUsXBEgNvz5etJYBPj9OjDJ8y+NgfunFH9pXBeo3E5Q/KtPubB?=
 =?us-ascii?Q?OutZSShS3rooNdF0TnSK8/sp6BHozXgIQqfu3xZJqZGE+GGPtrZtAxBaxPea?=
 =?us-ascii?Q?OPvWnWrQfc1ZpmIFpB17C7N1pHEluowxOcn8T2ruHON0hvoKdqgzBLABKRLB?=
 =?us-ascii?Q?OTlz7SpyBfupqMOU6y4XHkVrpdwT/zXPvwFT5DvItmo2Ue7wvh26GXqI57sJ?=
 =?us-ascii?Q?1oRYaE5Q1xgJQqWegm2BH5APOfm38iSV6IWjzBPg1PaEdN/MirGTkWTAKjzL?=
 =?us-ascii?Q?vQwwiu4yP5VmThywTZh9SVACNTmb6n0jaVAIhpziwkDDJiUEd8b/f5fNZ7cs?=
 =?us-ascii?Q?sJ55yNRagFGUe1yjLhjQ7QRq1bcSg5UvvZGp4z6VCE4e8g8u23IAcv8ahv36?=
 =?us-ascii?Q?OI1BELOPjinYEA4ZrkyYauLuOxvnoa6g5HnLQyqHpClEjDzRxnmucC53OmdV?=
 =?us-ascii?Q?jZf8l+9e1kD1Xh361qWXKoKwWi7jf/ubXZNL/sUkn6JEbvNxTVyVu6ppvBhF?=
 =?us-ascii?Q?2itDYP7Ieiffc4iGNl9HMayUtU1NTW0o6q+lr3l3gP+k2kLqanmke3OOctpK?=
 =?us-ascii?Q?laTL2Y269LQcNkIHAYpaxaVx7lnkeLVNL+QJ1n8JRbnr4Io3IhP6F8dLB91G?=
 =?us-ascii?Q?h1hv1KwzjpWiY7k5a1BR2maYh+w68K58PGwXrbcmQEx+k1R9BPZjozEedoia?=
 =?us-ascii?Q?I1i1jwsY7nzD94XcaxYeOFuMN1SWXScK1t/VbxfXNm7zCM1mHGbgnntFEo6A?=
 =?us-ascii?Q?7cU6Trd+mbC3iq0hQv3MF6pc0vLCjxPCOr6K/2IryDSaSpMiF9IkzaX5sIY3?=
 =?us-ascii?Q?XCTbJvxtjUJGVmv23jrgfufH3/SVzh5wsBUaoPfpefGFXZPFNK1Ht3k69pYW?=
 =?us-ascii?Q?YIXNyt/GkZzt+nmlCXLorqA5OXHF2oT3i5yjJyZ2Dua5RwaiHIlDE6gggdvy?=
 =?us-ascii?Q?BJribuWEMTm4HYFXHylv1uGQL26WUbALPJRIn5zKF+aiFt+s2RFxMFjQe6nZ?=
 =?us-ascii?Q?/67XewY94AllnzA5nbScBlH4bEgNOMtUISG3XDGrN8qEnEJLpVmYlLihKJFk?=
 =?us-ascii?Q?UmYP+BPIGj6I9O7BL1NQZjj4uJwGvxsJv3Ztl7F/MzDZO+896u/8q73uepN5?=
 =?us-ascii?Q?WIe5ojbsur/kCdyedQUoIBB6RqSUtmFAOGwHe5Ap81WvWplxfNMl+KiPJwyj?=
 =?us-ascii?Q?3RgYReDuzWgTbN24y+s21di0FflxbkH8ttdgYXHHxG+BweUU0ra3JXOXSb8t?=
 =?us-ascii?Q?WW9VgMIfLRu6mJGo4erUpp4MPn9VORnf/KbStARHJhXSCBM62WUJ3UrUx639?=
 =?us-ascii?Q?meFDdaM8+V491BO6YbI8izoOhafBRtn40SGBeqSu0q9fgWIeqbNhtQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 11:00:32.9609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52de995c-efe8-4276-4186-08dda0325d47
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB6576
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 May 2025 11:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117681

Add a class to build discoverable disk images [1] through
systemd-repart(-native).

Note that systemd >=3D 256 is required for '--private-key-source'

The class was adapted from a patch [2] floating upstream.

Link: [1]: https://uapi-group.org/specifications/specs/discoverable_disk_im=
age/
Link: [2]: https://lists.openembedded.org/g/openembedded-core/message/19872=
4
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 .../classes/discoverable-disk-image.bbclass   | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 meta-oe/classes/discoverable-disk-image.bbclass

diff --git a/meta-oe/classes/discoverable-disk-image.bbclass b/meta-oe/clas=
ses/discoverable-disk-image.bbclass
new file mode 100644
index 0000000000..e601bf452f
--- /dev/null
+++ b/meta-oe/classes/discoverable-disk-image.bbclass
@@ -0,0 +1,132 @@
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
+# https://uapi-group.org/specifications/specs/discoverable_partitions_spec=
ification/
+# https://www.freedesktop.org/software/systemd/man/latest/systemd.image-po=
licy.html
+
+# To be able to use discoverable-disk-images with a
+# root-verity-sig or usr-verity-sig configuration:
+# - systemd needs to include the PACKAGECONFIG 'cryptsetup', and
+# - the kernel needs the following features enabled:
+#   CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG=3Dy
+#   CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG_PLATFORM_KEYRING=3Dy
+#   CONFIG_EROFS_FS=3Dy
+#   CONFIG_EROFS_FS_XATTR=3Dy
+#   CONFIG_EROFS_FS_ZIP=3Dy
+#   CONFIG_EROFS_FS_ZIP_LZMA=3Dy
+#   CONFIG_INTEGRITY_SIGNATURE=3Dy
+#   CONFIG_INTEGRITY_ASYMMETRIC_KEYS=3Dy
+#   CONFIG_INTEGRITY_PLATFORM_KEYRING=3Dy
+#   CONFIG_SYSTEM_BLACKLIST_KEYRING=3Dy
+#   CONFIG_SYSTEM_BLACKLIST_HASH_LIST=3D""
+#   CONFIG_SIGNATURE=3Dy
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
+# systemd-sysext --image-policy=3D'root=3Dsigned+absent:usr=3Dsigned+absen=
t:=3Dunused+absent' merge
+
+# 'systemd-dissect' can be used to inspect, manually mount, ... a DDI.
+
+inherit image
+
+IMAGE_FSTYPES =3D "ddi"
+
+DEPENDS +=3D " \
+    systemd-repart-native \
+    erofs-utils-native \
+    openssl-native \
+"
+
+# systemd-repart --make-ddi takes one of "sysext", "confext" or "portable"=
,
+# which it then takes and looks up definitions in the host os; which we ne=
ed
+# to divert to the sysroot-native by setting '--definitions=3D' instead.
+#
+REPART_DDI_TYPE ?=3D "sysext"
+
+REPART_DDI_EXTENSION ?=3D "ddi"
+
+# systemd-repart creates temporary directoryies under /var/tmp/.#repartXXX=
XXXX/,
+# to estimate partition size etc. Since files are copied there from the im=
age/rootfs
+# folder - which are owned by pseudo-root - this temporary location has to=
 be
+# added to the directories handled by pseudo; otherwise calls to e.g.
+# fchown(0,0) inside systemd git/src/shared/copy.c end up failing.
+PSEUDO_INCLUDE_PATHS .=3D ",/var/tmp/"
+
+oe_image_systemd_repart_make_ddi() {
+
+    local additional_args=3D""
+
+    if [ -n "${REPART_PRIVATE_KEY}" ]
+    then
+        if [ -n "${REPART_PRIVATE_KEY_SOURCE}" ]
+        then
+            additional_args=3D"$additional_args --private-key-source=3D${R=
EPART_PRIVATE_KEY_SOURCE}"
+        fi
+        additional_args=3D"$additional_args --private-key=3D${REPART_PRIVA=
TE_KEY}"
+    fi
+
+    if [ -n "${REPART_CERTIFICATE}" ]
+    then
+        additional_args=3D"$additional_args --certificate=3D${REPART_CERTI=
FICATE}"
+    fi
+
+    # map architectures to systemd's expected values
+    local systemd_arch=3D"${TARGET_ARCH}"
+    case "${systemd_arch}" in
+        aarch64)
+        systemd_arch=3Darm64
+        ;;
+        x86_64)
+        systemd_arch=3Dx86-64
+        ;;
+    esac
+
+    # prepare system-repart configuration
+    mkdir -p ${B}/definitions.repart.d
+    cp ${STAGING_LIBDIR_NATIVE}/systemd/repart/definitions/${REPART_DDI_TY=
PE}.repart.d/* ${B}/definitions.repart.d/
+    # enable erofs compression
+    sed -i "/^Compression/d" ${B}/definitions.repart.d/10-root.conf
+    echo "Compression=3Dlzma\nCompressionLevel=3D3" >> ${B}/definitions.re=
part.d/10-root.conf
+    # disable verity signature partition creation, if no key is provided
+    if [ -z "${REPART_PRIVATE_KEY}" ]; then
+        rm ${B}/definitions.repart.d/30-root-verity-sig.conf
+    fi
+
+    systemd-repart \
+        --definitions=3D"${B}/definitions.repart.d/" \
+        --copy-source=3D"${IMAGE_ROOTFS}" \
+        --empty=3Dcreate --size=3Dauto --dry-run=3Dno --offline=3Dyes \
+        --architecture=3D"${systemd_arch}" \
+        --json=3Dpretty --no-pager $additional_args \
+        "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${REPART_DDI_EX=
TENSION}"
+}
+
+IMAGE_CMD:ddi =3D "oe_image_systemd_repart_make_ddi"
+do_image_ddi[deptask] +=3D "do_unpack"
--=20
2.34.1


