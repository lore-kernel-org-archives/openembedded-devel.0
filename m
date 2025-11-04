Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5620BCCFA06
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 11:24:22 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14188.1762249531427928457
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 01:45:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@philips.com header.s=selector1 header.b=FjFAQkrn;
 spf=pass (domain: bbl.ms.philips.com, ip: 40.107.162.33, mailfrom: tgiulian@bbl.ms.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1IVdHKBuDmNQcmop3Z49no+65vkSFtAbHyAWaokFp+1anz2jrYQCFybiTRKqwFWgRYTfdHomGY15oSaU8iVM7rPkoKoAD/j0oLwxLiLu2G6vmcIZic2dYJGxPKAhyjIv0jRo3Q/BFukzxKaitrmIbUSSRQPEIx6UFhNTY9TVXAdeW+i5TvNMDkDzsOIi/4/38Nq3+B6j/9MPMriLmE/u4tdh1hVA7YcWskwR2qmDAHPI99V8J2DbMSxV0VZzBGuCXlv4D2RuoweJmU+GOTmqDXrqU2HldCJhh6z0T25/M8/Eu/lQTlZU69cIy4QqNM/OA3v11ye7cdjewfrbZzmUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDMeWkQZzteeIOOFoc0ImB0cVMfq2CkcvByg+yFcTdI=;
 b=qtM+3ZkP4K+XDt+qtE4zO3/kWUxZuizyhIETryCtee4s5KNFQeklL3NQpD3h/4IiDZAXLeVe3U59Dsiw58iPPQ/+kEqDkeIx6IxlQuUZ+ymuFSAHtd1TStLRaPFJoelfJt1915pQnUIm4FpVDnxnxk16Y5N8jjrJyK5fnZ8NnOq/PBtl+fKySNLj3RHACjcDli+u5dPR9OekDV2qL27CoIxdkOTCjXsUL1ElgUifxZzL+MzohFPgKrP11fTrSIEEo/4qSa2EzLsk3hrYQLCfVJ6Kn8Pkh9LIBBsloldrOUBPbU7/YJLdMpO7f4mDSG+OVHhVXeB9qyJJqyC3g42frg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 3.248.88.141) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=philips.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=philips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDMeWkQZzteeIOOFoc0ImB0cVMfq2CkcvByg+yFcTdI=;
 b=FjFAQkrnvqup9/2e8cDQgvcuPZ7vpLKoeFug+UaeRl4itaKIvgdg0rLT3NSGc3l4iVqhhc+/OuhcyQa1C3qK0qrsNxX1xGGS0jyyg0ADBgr92waNOj+eLwBVEKe5vCkIKLi/gDT1AcTV97v86MS0A88TdytzPfWvNM3Ne3dPsW4=
Received: from AS4PR10CA0028.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::13)
 by PA6P122MB0388.EURP122.PROD.OUTLOOK.COM (2603:10a6:102:508::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 09:30:29 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::d8) by AS4PR10CA0028.outlook.office365.com
 (2603:10a6:20b:5d8::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Tue, 4
 Nov 2025 09:30:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 3.248.88.141)
 smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=philips.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 3.248.88.141 as permitted sender) receiver=protection.outlook.com;
 client-ip=3.248.88.141; helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (3.248.88.141) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 09:30:28 +0000
Received: from smtprelay-eur1.philips.com ([130.138.84.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTPS
	id G8grvkEbEtKtZGDMyv9Fls; Tue, 04 Nov 2025 10:30:28 +0100
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id GDMyvOuECIHN7GDMyvacfa; Tue, 04 Nov 2025 10:30:28 +0100
Received: from bbl2xbm1.bbl.ms.philips.com (bbl2xbm1.bbl.ms.philips.com [130.143.220.186])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id 93A9F184885;
	Tue,  4 Nov 2025 10:30:28 +0100 (CET)
Received: by bbl2xbm1.bbl.ms.philips.com (Postfix, from userid 2462)
	id 90845300108; Tue,  4 Nov 2025 10:30:28 +0100 (CET)
From: Timotheus Giuliani <timotheus.giuliani@philips.com>
To: openembedded-devel@lists.openembedded.org
CC: Timotheus Giuliani <timotheus.giuliani@philips.com>
Subject: [meta-oe][PATCH 2/2] fluentbit: add support for in-ebpf plugin
Date: Tue,  4 Nov 2025 10:30:17 +0100
Message-ID: <20251104093017.474084-2-timotheus.giuliani@philips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104093017.474084-1-timotheus.giuliani@philips.com>
References: <20251104093017.474084-1-timotheus.giuliani@philips.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA2:EE_|PA6P122MB0388:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b3df34-19fe-4fc7-7b00-08de1b84cb0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jJtyASy/EYPqexDlXz7n2X2RkBCQQrCuY/OcVdNP7+FptgJ7e4rDDljsC+UQ?=
 =?us-ascii?Q?jnWcvSojqC1ohvPdGN3IKchkXgcIWhxm/KzTF7s7Zd4Zid6IFTACnNRo76oz?=
 =?us-ascii?Q?//I63ev81pGzb6UAwZ3WfHqiRzi8uYDBcvXwy7GFNLfE5j/JvBx1SAAAc+mc?=
 =?us-ascii?Q?Av8a5XN3QEPNOvLkWydY9UpBi26qfOXvcWG7/McbS8PbGyMovf/leDPZE2aA?=
 =?us-ascii?Q?/XhN3hr1ise4mVqSaIqCJZAsVfDbG20Yob21gShVI3wt9dm6WlPaW6B+CppZ?=
 =?us-ascii?Q?q1y4Yrg34+Fy9oURUilDzachWRVbnIIR1ymkCP2n3+t8Yvz9O1+tzp7gq2Ig?=
 =?us-ascii?Q?YGYroDHZgCweeDJyI5EGzLPMrJ2KR26rMUl42yZiA4c3ZIwZ1zvdEY0oXd70?=
 =?us-ascii?Q?hlfOgpdKUZuax9N63WtiBsRzCHEwUU2aYrSYIpxwFO0JDYC2cHJNRgjU4r77?=
 =?us-ascii?Q?vreRCokwQFcoW12O7d/80omIsciH+Cmvrd4od8P8fgO0+SCQfcJOgAu0V09I?=
 =?us-ascii?Q?l8h0WBS/6roDYN3on2XVg2kd9wpXlLJZv8tyXGFF4/rgYP/DHmUZGrzjmZpF?=
 =?us-ascii?Q?t1m218empekArpyvOQBdoA288qQuF7wa6DJ74KvFLbRAcrU77qjm5qnHYTON?=
 =?us-ascii?Q?kc6yDL5n0WU087PkHDO/vNLldwn/n9tYU/oxUfUJ70l6fVj2orYOlmwSwLXl?=
 =?us-ascii?Q?f2Ew4bvvdthWU6qwxiW1hBMElPg/9fO8IbbH6iDnSjIMwwwUDwa7anGoZ6Ps?=
 =?us-ascii?Q?MjRJ1XDLiFGTt5oEgWuUliRici4wiSgVZqaGnMBnvWy9U2BuLZJLavSHPzzw?=
 =?us-ascii?Q?wuhgSbAktuVGeYFV8T6k5pELskRsj0sCKMZYEzhFyPBVe1O11JovY8kXW3Qn?=
 =?us-ascii?Q?/wAFx4BYOdO1OrENIMsrHuP58MnTsQyMZ9CJQALDItLEckgW0wLxOnTmC4MM?=
 =?us-ascii?Q?KtRo6nQTc0WvMLtcS7bouzDkvZCTDYgxGpo6maamQyLWS6lqoAnJAjoN5Wfd?=
 =?us-ascii?Q?NhtM126Bh1MAZs0ZXhLVNGTxkmGeQIvrZ6PFsfERJHFYZ08lOTNhdFOm6UmG?=
 =?us-ascii?Q?xc5zTiM9qmfSpwmowx3XM2Z6v5n/WxjsbXHvE3DsjYubvrai4I2sBQSlTBkC?=
 =?us-ascii?Q?TPJecGE25+HcOjqDmvbMMMdMIjOU1eWgVyghcBhDpmwnQL+QsZIy5501ozYy?=
 =?us-ascii?Q?K4R8LIxEorTWrKPe/CjTemvmS51Lx8cOqp6W9WIy4iqWDgA1atx3CC16r3N8?=
 =?us-ascii?Q?S9xMaE919UgYSkZilB8RwZA0Ik5XAME6moMxg97muI+R/TWGnYhastJA5MRH?=
 =?us-ascii?Q?1KE1DXUKET2iJ+cRyw3YIdhV0zH21994lGuAgoGdDONtuqam7jpWXsbwcDM1?=
 =?us-ascii?Q?LiXGxAAIAAAU6uuOfTSN5288KqOtFw+JR4x7YCVdkwLiHpZG48ISoNIQeuBy?=
 =?us-ascii?Q?a//kyW/6IjXFniJ6lB//LlFridrWSWp5I8Qr+TkhGVLTStE8V5WMfy6rOIl4?=
 =?us-ascii?Q?A8lGVHb3Zg8ejBeQUojAVQrdxC6i/whObHOT8aQVB7OY1mhn+x8XHwt51qOK?=
 =?us-ascii?Q?Iy7V+PDwuFZ5oZuflpE=3D?=
X-Forefront-Antispam-Report: 
	CIP:3.248.88.141;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 09:30:28.9022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b3df34-19fe-4fc7-7b00-08de1b84cb0f
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[3.248.88.141];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6P122MB0388
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 11:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121292

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
 ...root-include-path-for-system-headers.patch | 31 ++++++++
 ...coded-target-architecture-definition.patch | 54 ++++++++++++++
 ...tting-LIBC_PATH-from-external-config.patch | 73 +++++++++++++++++++
 .../fluentbit/fluentbit_4.0.1.bb              |  7 ++
 4 files changed, 165 insertions(+)
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
index 0000000000..2b73f48334
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0006-cmake-add-recipe-sy=
sroot-include-path-for-system-headers.patch
@@ -0,0 +1,31 @@
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
index 0000000000..f30005e986
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0007-bpf-remove-hardcode=
d-target-architecture-definition.patch
@@ -0,0 +1,54 @@
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
index 0000000000..57f4d899cd
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0008-cmake-allow-setting=
-LIBC_PATH-from-external-config.patch
@@ -0,0 +1,73 @@
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
index 4d82abc783..05dcd2cca7 100644
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
@@ -112,6 +115,10 @@ PACKAGECONFIG[minimal] =3D "-DFLB_MINIMAL=3DYes,-DFLB_=
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

