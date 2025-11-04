Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05CE8CCFA07
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 16:08:34 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19758.1762268160328776502
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 06:56:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@philips.com header.s=selector1 header.b=jjm+on7i;
 spf=pass (domain: bbl.ms.philips.com, ip: 40.107.159.52, mailfrom: tgiulian@bbl.ms.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txsZf0R7VjRiBhFDx42BXPhXqCnNEMg355BGBM0bPjPH2Se65QDBdtmD3/QqXj1gIO0qKbdK8EwUw6fQ8KTCQE4aHUz3u/mV1PnRDrkLHtSwxDomX7zWdUAbS+p18Zubg1t7CPJn0E6OeU8WGkOx1Xjt8MOHGICMmjqJZvzKjposa1VbmkQYjIjere/3l21VIKmEk07RNBzeZ8hPMQOnTnZbTtV1I8lam0sBVc1ix3WrjFSm0tVriIn5vWmwNqOkzkXUqLEfbXPhqGJy0s+YtBJXM3eGculLp5wPP8CKk24AXcdjA+sfpg7GhHx+pLXmxa+kx2FuQi/ZKNoVm9BW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqLC7HLsM8wrgOcTLTTaXbFzL9HOvBxv6TZIQk2yKLw=;
 b=RcDx9RhSFea0AqpAE4rpJFjbhTWYZc7led9ocyV74mFprZ4Cdevd6JIp/ZLevTzARzgPv7ka2Hixiccm77OSP2Hk5zxnOh2Hi/SImyAuxIgAF0hBMmY4XakRT60+QSCXXdF8TEF8dc6jzH8hjpR8gJu9DX6HcnnMjphiT3OYI2bcPSytFKzrj4vMCUN8bKhGYl21PbyQmsongH0sRZ7E53jSXHQsFuro5cF8MH1qxo/9/f1azpeAvBDdSVT92MGQXap5wvEU8ZwFUG/Sb18CXj0jIznTUJ4+l4r8tCZQ7zxc6qYpwvMMo2sXIx5ZYrzZoUKAzJRsLpYepxiKAGEpmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 3.248.88.141) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=philips.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=philips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqLC7HLsM8wrgOcTLTTaXbFzL9HOvBxv6TZIQk2yKLw=;
 b=jjm+on7i3RG6CvR1I/dvOAOi1n9aVdhCFSO2EEQ3hxvz0YJb1sv4pl8dja4/niVGjKs2Ysnn/6TQihQsgtKd9cRCfzm7LhFfCFF4PaxnxBL+ORHXsn7j0cMXGkJ75rleNeWSO02M+xMatQljJsHTTsGRfd02sE562nBJW3RdjIA=
Received: from AM9P250CA0026.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::31)
 by VI1P122MB0237.EURP122.PROD.OUTLOOK.COM (2603:10a6:800:173::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 14:55:53 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:20b:21c:cafe::cc) by AM9P250CA0026.outlook.office365.com
 (2603:10a6:20b:21c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 14:55:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 3.248.88.141)
 smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=philips.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 3.248.88.141 as permitted sender) receiver=protection.outlook.com;
 client-ip=3.248.88.141; helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (3.248.88.141) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 14:55:52 +0000
Received: from smtprelay-eur1.philips.com ([130.138.84.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTPS
	id G45Pvk4T1tKtZGIRsv9zA8; Tue, 04 Nov 2025 15:55:52 +0100
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id GIRsvPHUNIHN7GIRsvbIc7; Tue, 04 Nov 2025 15:55:52 +0100
Received: from bbl2xbm1.bbl.ms.philips.com (bbl2xbm1.bbl.ms.philips.com [130.143.220.186])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id A07671847A7;
	Tue,  4 Nov 2025 15:55:52 +0100 (CET)
Received: by bbl2xbm1.bbl.ms.philips.com (Postfix, from userid 2462)
	id 99C23300108; Tue,  4 Nov 2025 15:55:52 +0100 (CET)
From: Timotheus Giuliani <timotheus.giuliani@philips.com>
To: openembedded-devel@lists.openembedded.org
CC: Timotheus Giuliani <timotheus.giuliani@philips.com>
Subject: [oe] [meta-oe][PATCH v2] fluentbit: add support for in-ebpf plugin
Date: Tue,  4 Nov 2025 15:55:41 +0100
Message-ID: <20251104145541.2177979-1-timotheus.giuliani@philips.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000048:EE_|VI1P122MB0237:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e177cdc-81be-4842-6970-08de1bb2404d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YsWZN3ydokabJjFkI+gtvpbDmpm/TWHO7ZFF6pWjfebtIwWOWDlfGTMm2Qr+?=
 =?us-ascii?Q?0h7tBfDd4iEDd2uJief7sizFc2Lr5QPanFtSHS8eyxmMX9iR3tnSrL9QsDxy?=
 =?us-ascii?Q?KYSE9TJpiIFFLwkPNSn1iokE3cs1d85fzdTnxkQ+5120UYKKCjaCfiFpmFI4?=
 =?us-ascii?Q?vtzntiHOI/+tEcxDq6dcylkY0sFMaZiAAyZyKzdNV5Ojxp7exiJ6i2tRHAZQ?=
 =?us-ascii?Q?6YhImHhDJauK7wRYnh0Bf8NaIKVklREyQ/NTIQEovCYeyExdO6tQYjpLV4pm?=
 =?us-ascii?Q?rEdUe/fgu6i7pDg5um8Fr1YMR1Ft5kBVCK7c6227wgvm8D011stfSEpo1pq7?=
 =?us-ascii?Q?JOH18EKEhOISBvq9Ki5Z5GNb71paBAVdm66BZtZSSYeghFE9uAptW/xQka0u?=
 =?us-ascii?Q?n9SqzvGHzujvqhRmJcMbJu9LUmHHqXdtR7i1zEpQxIdpPs+769JuB3IykJnY?=
 =?us-ascii?Q?XldXQFichJcQARsBFgrOJukeJLvEjBIofgVtOxBqaci7x5HhMOM7ebY97oSf?=
 =?us-ascii?Q?gZMfKTMJVQQ/u6AK36oAyZXkGaN+3qDUxrX4b80U8apjDPYpIlT640pev0Hj?=
 =?us-ascii?Q?ulMSMwr5QOBV7OI3Cb7yPVUbrNUgrkDve2DrjgdhNA4Biymn49psLUEAdAP9?=
 =?us-ascii?Q?Dl2+FubVI35avaUN7PUUjowJdzcCyLgrLBqdlRTC231P+v0++roMnG5ZsLOS?=
 =?us-ascii?Q?iFude8VAacSBA4KoNorthmWPXMDtyF+IuszpJ8NeYMCWIDuM6aedmh7wEl4a?=
 =?us-ascii?Q?VvN8gfyPpJCinnWlG1jRTJaDvTxN851Our5bOQxdWCfdAMh6Bu4cVz1pyEt2?=
 =?us-ascii?Q?Brmgo/Aku0WHU6qBpSUnJtDRRH4WLrGOOO1Uv2jzt/OrxU641yV0/lKNSemB?=
 =?us-ascii?Q?8ss7970lZnmWv8p1N3SwlP2fhFR9Y3l91XWhkTDI6maLNlfZryjcD/KelA8O?=
 =?us-ascii?Q?P5VfcshtvNZJdTc3oguAioc48kexuuaK16MRGvzrtwBFmizyTUVnmuEkUVe7?=
 =?us-ascii?Q?Tf5xFQSQYgpp8IRqI9ufztaTScF4dGD/Ap9vIGunU3DFl47JQmOHwdwvLLul?=
 =?us-ascii?Q?xshLbLstuuNScpyWpo0rR/vjXGMl/lI7NvnK59Zb5Ig+p7bQoEzPP/Owbnet?=
 =?us-ascii?Q?gQRYCIgIONfm7Gz7JqQUaQWL9Xq/bKKBBwo7Mtj9Zv/nZ41WVuwpD5PeY2QS?=
 =?us-ascii?Q?Tw5oIWx0ysAy9urXDbya63CZXsi6/568POjdC9b0usXOHU5P+9p+VPH5Zotg?=
 =?us-ascii?Q?V4HknXeCplc6NOMpQ7F5IKnOJkymGOWWTNSo0uceeaLuG52dIG0LMqvORTEp?=
 =?us-ascii?Q?uVY0mLE1BCko7mtAjR2pFfeqh7HkZ6F12lS6+RP4e4A9v8kJaDsr7kmrQTeV?=
 =?us-ascii?Q?Amgy7X7XOiWvJPB0NAQQN6NbmgLmIwzS11eJf8yC937uuslB5lEQWwYRrha5?=
 =?us-ascii?Q?dBJEL2d5k85KKTaeuNXzSnEGVDBqrHAfXjnRFSWa1JLUuTL8xy+FRREeoi29?=
 =?us-ascii?Q?+QhW0wX7ucK/LC1GWTQGkRJ6/BBMkc1orm+jjVD2OP9Y1onY1N+9whbm0dPS?=
 =?us-ascii?Q?DxFQRvOPHx0pug/tNxk=3D?=
X-Forefront-Antispam-Report: 
	CIP:3.248.88.141;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 14:55:52.9571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e177cdc-81be-4842-6970-08de1bb2404d
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[3.248.88.141];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P122MB0237
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 16:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121300

Introduce support for the in-ebpf plugin in the Fluent Bit recipe,
which was added as an experimental feature in Fluent Bit version 4.0.
The new PACKAGECONFIG option enables building the eBPF input plugin
when explicitly configured, adding the necessary build dependencies
including bpftool-native, clang-native, and libbpf.
The recipe also configures the LIBC_PATH for compilation environments
to ensure to point to the correct target system's C library when the
eBPF plugin is enabled.

Signed-off-by: Timotheus Giuliani <timotheus.giuliani@philips.com>
---
 ...root-include-path-for-system-headers.patch | 33 ++++++++
 ...coded-target-architecture-definition.patch | 56 ++++++++++++++
 ...tting-LIBC_PATH-from-external-config.patch | 75 +++++++++++++++++++
 .../fluentbit/fluentbit_4.0.1.bb              |  7 ++
 4 files changed, 171 insertions(+)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0006-cmake=
-add-recipe-sysroot-include-path-for-system-headers.patch
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0007-bpf-r=
emove-hardcoded-target-architecture-definition.patch
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0008-cmake=
-allow-setting-LIBC_PATH-from-external-config.patch

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0006-cmake-add-re=
cipe-sysroot-include-path-for-system-headers.patch b/meta-oe/recipes-extend=
ed/fluentbit/fluentbit/0006-cmake-add-recipe-sysroot-include-path-for-syste=
m-headers.patch
new file mode 100644
index 0000000000..e7b912bf33
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0006-cmake-add-recipe-sy=
sroot-include-path-for-system-headers.patch
@@ -0,0 +1,33 @@
+From 9f47cc69683a842efdf6c31ea25b7b423ba3fc7e Mon Sep 17 00:00:00 2001
+From: Timotheus Giuliani <timotheus.giuliani@philips.com>
+Date: Tue, 7 Oct 2025 17:33:14 +0200
+Subject: [PATCH 1/3] cmake: add recipe sysroot include path for system hea=
ders
+
+The CMakeLists.txt was missing the recipe sysroot include path, which
+prevented the build system from finding required system headers during
+compilation. This commit adds the recipe sysroot directory to the
+include path so that headers provided by the sysroot, such as
+BPF headers and other system dependencies, can be properly located and
+included during the build process.
+Without this change, the build would fail to find essential headers
+when building in compilation environment.
+
+Upstream-Status: Inappropriate [Not suitable for upstream, OE-specific cha=
nge]
+
+Signed-off-by: Timotheus Giuliani <timotheus.giuliani@philips.com>
+---
+ plugins/in_ebpf/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/plugins/in_ebpf/CMakeLists.txt b/plugins/in_ebpf/CMakeLists.t=
xt
+index 476c07774..216b2ffce 100644
+--- a/plugins/in_ebpf/CMakeLists.txt
++++ b/plugins/in_ebpf/CMakeLists.txt
+@@ -91,6 +91,7 @@ foreach(TRACE_C_FILE ${TRACE_C_FILES})
+             -I${CMAKE_SOURCE_DIR}/plugins/in_ebpf/traces/includes/externa=
l
+             -I${CMAKE_SOURCE_DIR}/plugins/in_ebpf/traces/includes
+             -I${VMLINUX_PATH}         # Include the correct vmlinux.h bas=
ed on architecture
++            --sysroot=3D${CMAKE_SYSROOT}  # Add yocto recipe sysroot to f=
ind "system headers"
+             -c ${TRACE_C_FILE}
+             -o ${TRACE_OBJ_FILE}
+     DEPENDS ${TRACE_C_FILE} ebpf-generated-directory
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0007-bpf-remove-h=
ardcoded-target-architecture-definition.patch b/meta-oe/recipes-extended/fl=
uentbit/fluentbit/0007-bpf-remove-hardcoded-target-architecture-definition.=
patch
new file mode 100644
index 0000000000..b2ab2e4006
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0007-bpf-remove-hardcode=
d-target-architecture-definition.patch
@@ -0,0 +1,56 @@
+From df05870068f0d1fe092650bb1ba0a518fb540550 Mon Sep 17 00:00:00 2001
+From: Timotheus Giuliani <timotheus.giuliani@philips.com>
+Date: Tue, 7 Oct 2025 17:34:28 +0200
+Subject: [PATCH 2/3] bpf: remove hardcoded target architecture definition
+
+The BPF programs was hardcoding the TARGET_ARCH_x86 definition, which
+prevented successful builds on other architectures such as ARM64.
+This commit removes the hardcoded architecture definition from the bpf
+source files, allowing the CMake build system to properly set the
+target architecture based on the actual build environment.
+
+Upstream-Status: Inappropriate [Contribution not planned]
+
+Signed-off-by: Timotheus Giuliani <timotheus.giuliani@philips.com>
+---
+ plugins/in_ebpf/traces/bind/bpf.c      | 2 --
+ plugins/in_ebpf/traces/malloc/bpf.c.in | 3 ---
+ plugins/in_ebpf/traces/signal/bpf.c    | 2 --
+ 3 files changed, 7 deletions(-)
+
+diff --git a/plugins/in_ebpf/traces/bind/bpf.c b/plugins/in_ebpf/traces/bi=
nd/bpf.c
+index 1712bf67e..da9d7c3f1 100644
+--- a/plugins/in_ebpf/traces/bind/bpf.c
++++ b/plugins/in_ebpf/traces/bind/bpf.c
+@@ -2,8 +2,6 @@
+ /* Copyright (c) 2021 Hengqi Chen */
+ /* Copyright (c) 2024 The Inspektor Gadget authors */
+=20
+-#define __TARGET_ARCH_x86
+-
+ #include <vmlinux.h>
+=20
+ #define _LINUX_TYPES_H        // Prevent redefinition of linux/types.h
+diff --git a/plugins/in_ebpf/traces/malloc/bpf.c.in b/plugins/in_ebpf/trac=
es/malloc/bpf.c.in
+index c37d3952a..ace4acdbe 100644
+--- a/plugins/in_ebpf/traces/malloc/bpf.c.in
++++ b/plugins/in_ebpf/traces/malloc/bpf.c.in
+@@ -1,6 +1,3 @@
+-#define __TARGET_ARCH_x86
+-
+-
+ #include <vmlinux.h>
+=20
+ #define _LINUX_TYPES_H        // Prevent redefinition of linux/types.h
+diff --git a/plugins/in_ebpf/traces/signal/bpf.c b/plugins/in_ebpf/traces/=
signal/bpf.c
+index 7d4503c22..3f017b325 100644
+--- a/plugins/in_ebpf/traces/signal/bpf.c
++++ b/plugins/in_ebpf/traces/signal/bpf.c
+@@ -1,7 +1,5 @@
+ // SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause)
+ /* Copyright (c) 2021~2022 Hengqi Chen */
+-#define __TARGET_ARCH_x86_64
+-
+ #include <vmlinux.h>
+=20
+ #define _LINUX_TYPES_H        // Prevent redefinition of linux/types.h
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0008-cmake-allow-=
setting-LIBC_PATH-from-external-config.patch b/meta-oe/recipes-extended/flu=
entbit/fluentbit/0008-cmake-allow-setting-LIBC_PATH-from-external-config.pa=
tch
new file mode 100644
index 0000000000..242036f5fc
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0008-cmake-allow-setting=
-LIBC_PATH-from-external-config.patch
@@ -0,0 +1,75 @@
+From ab01dffe9bf2f1208ec4cea0a1582196cfbc0f87 Mon Sep 17 00:00:00 2001
+From: Timotheus Giuliani <timotheus.giuliani@philips.com>
+Date: Wed, 8 Oct 2025 14:24:36 +0200
+Subject: [PATCH 3/3] cmake: allow setting LIBC_PATH from external
+ configuration
+
+The CMakeLists.txt file was automatically detecting the libc library
+path based on the system distribution. This change allows the LIBC_PATH
+to be set externally through build configuration, which is useful for
+compilation environments where the library path is known in advance.
+The auto-detection logic is kept as a fallback when LIBC_PATH is not
+provided from external configuration.
+
+Upstream-Status: Inappropriate [Contribution not planned]
+
+Signed-off-by: Timotheus Giuliani <timotheus.giuliani@philips.com>
+---
+ plugins/in_ebpf/CMakeLists.txt | 43 ++++++++++++++++++----------------
+ 1 file changed, 23 insertions(+), 20 deletions(-)
+
+diff --git a/plugins/in_ebpf/CMakeLists.txt b/plugins/in_ebpf/CMakeLists.t=
xt
+index 216b2ffce..1c5e55785 100644
+--- a/plugins/in_ebpf/CMakeLists.txt
++++ b/plugins/in_ebpf/CMakeLists.txt
+@@ -25,27 +25,30 @@ include_directories(
+ add_library(gadget INTERFACE)
+ target_include_directories(gadget INTERFACE ${CMAKE_SOURCE_DIR}/plugins/i=
n_ebpf/traces/includes/external/gadget)
+=20
+-set(LIBC_PATH "/lib64/libc.so.6")
+=20
+-find_program(LSB_RELEASE_EXEC lsb_release)
+-if (LSB_RELEASE_EXEC)
+-  execute_process(COMMAND ${LSB_RELEASE_EXEC} -i
+-      OUTPUT_VARIABLE LSB_RELEASE_ID_SHORT
+-      OUTPUT_STRIP_TRAILING_WHITESPACE
+-  )
+-
+-  message(STATUS "##### lsb_release -i -- ${LSB_RELEASE_ID_SHORT}")
+-
+-  if (LSB_RELEASE_ID_SHORT MATCHES "Ubuntu" OR
+-      LSB_RELEASE_ID_SHORT MATCHES "Debian" OR
+-      LSB_RELEASE_ID_SHORT MATCHES "LinuxMint")
+-    # Just added for the future enhancement
+-    if (CMAKE_SYSTEM_PROCESSOR MATCHES "^(arm64|aarch64)")
+-      set(LIBC_PATH "/usr/lib/aarch64-linux-gnu/libc.so.6")
+-    elseif (CMAKE_SIZEOF_VOID_P EQUAL 8)
+-      set(LIBC_PATH "/usr/lib/x86_64-linux-gnu/libc.so.6")
+-    elseif (CMAKE_SIZEOF_VOID_P EQUAL 4)
+-      set(LIBC_PATH "/usr/lib/i386-linux-gnu/libc.so.6")
++if(NOT DEFINED LIBC_PATH OR LIBC_PATH STREQUAL "")
++  set(LIBC_PATH "/lib64/libc.so.6")
++
++  find_program(LSB_RELEASE_EXEC lsb_release)
++  if (LSB_RELEASE_EXEC)
++    execute_process(COMMAND ${LSB_RELEASE_EXEC} -i
++        OUTPUT_VARIABLE LSB_RELEASE_ID_SHORT
++        OUTPUT_STRIP_TRAILING_WHITESPACE
++    )
++
++    message(STATUS "##### lsb_release -i -- ${LSB_RELEASE_ID_SHORT}")
++
++    if (LSB_RELEASE_ID_SHORT MATCHES "Ubuntu" OR
++        LSB_RELEASE_ID_SHORT MATCHES "Debian" OR
++        LSB_RELEASE_ID_SHORT MATCHES "LinuxMint")
++      # Just added for the future enhancement
++      if (CMAKE_SYSTEM_PROCESSOR MATCHES "^(arm64|aarch64)")
++        set(LIBC_PATH "/usr/lib/aarch64-linux-gnu/libc.so.6")
++      elseif (CMAKE_SIZEOF_VOID_P EQUAL 8)
++        set(LIBC_PATH "/usr/lib/x86_64-linux-gnu/libc.so.6")
++      elseif (CMAKE_SIZEOF_VOID_P EQUAL 4)
++        set(LIBC_PATH "/usr/lib/i386-linux-gnu/libc.so.6")
++      endif()
+     endif()
+   endif()
+ endif()
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb b/meta-o=
e/recipes-extended/fluentbit/fluentbit_4.0.1.bb
index 05e4fd937f..5f7fa7bb21 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
@@ -23,6 +23,9 @@ SRC_URI =3D "\
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch=
 \
     file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch=
 \
     file://0003-CMakeLists.txt-Revise-init-manager-deduction.patch \
+    file://0006-cmake-add-recipe-sysroot-include-path-for-system-headers.p=
atch \
+    file://0007-bpf-remove-hardcoded-target-architecture-definition.patch =
\
+    file://0008-cmake-allow-setting-LIBC_PATH-from-external-config.patch \
 "
 SRC_URI:append:libc-musl =3D "\
     file://0004-chunkio-Link-with-fts-library-with-musl.patch \
@@ -111,6 +114,10 @@ PACKAGECONFIG[minimal] =3D "-DFLB_MINIMAL=3DYes,-DFLB_=
MINIMAL=3DNo"
 PACKAGECONFIG[in-kafka] =3D "-DFLB_KAFKA=3DON -DFLB_IN_KAFKA=3DON,-DFLB_KA=
FKA=3DOFF -DFLB_IN_KAFKA=3DOFF,librdkafka curl"
 PACKAGECONFIG[out-kafka] =3D "-DFLB_KAFKA=3DON -DFLB_OUT_KAFKA=3DON,-DFLB_=
KAFKA=3DOFF -DFLB_OUT_KAFKA=3DOFF,librdkafka curl"
=20
+# Add ebpf input
+PACKAGECONFIG[in-ebpf] =3D "-DFLB_IN_EBPF=3DYes,-DFLB_IN_EBPF=3DNo, bpftoo=
l-native clang-native libbpf"
+EXTRA_OECMAKE:append =3D " ${@bb.utils.contains('PACKAGECONFIG', 'in-ebpf'=
, '-DLIBC_PATH=3D${libdir}/libc.so.6', '', d)}"
+
 SYSTEMD_SERVICE:${PN} =3D "fluent-bit.service"
=20
 inherit cmake systemd pkgconfig
--=20
2.43.0


