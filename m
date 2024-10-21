Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF4DD17141
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 21:37:10 +0000 (UTC)
Received: from ci74p00im-qukt09090101.me.com (ci74p00im-qukt09090101.me.com [17.57.156.18])
 by mx.groups.io with SMTP id smtpd.web11.4202.1729546627854979705
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Oct 2024 14:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=Hi/IpmPK;
 spf=pass (domain: subset.ch, ip: 17.57.156.18, mailfrom: patrick@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1729546627; bh=8gzAGcH1Qtgc/L/u4lUVCRN6+ZUQi79mKkZ1nePxTrk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Hi/IpmPKqKkZSPiqpYDRu3OMrcRAEd6EVZXJiGF76PQZWVIFtoKXhA3EYUixuKY4T
	 emD+9J9c22L0KbVWLFiaxIIKiYIvic/XySAQ4JvZfRyn4qoBI0s1v+akbainBzTolp
	 B5qO/64XfoiMwQnpRerMOIr1dh0D5Nr4cha7oZsGQGhZumEFQ+TN2Ypjmp65Spe4jY
	 TDIL+Uvl+pUbeleqWIHCl0oBM5j94+XemXA3DbmGIWod2BaboFgPFm5CMRnQLQfP0Q
	 Sdo8U6XsVixNYbKmYfhJwj0E4GzSUgEXjMC+0KfP4DWVHuUBgQHRB6P0rng1uWGyUp
	 U4NSNMM6zoG4g==
Received: from localhost.localdomain (ci77p00im-dlb-asmtp-mailmevip.me.com [17.57.156.26])
	by ci74p00im-qukt09090101.me.com (Postfix) with ESMTPSA id C607535C0140;
	Mon, 21 Oct 2024 21:37:05 +0000 (UTC)
From: patrick@subset.ch
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [meta-oe][PATCH v3] fluentbit: fix building with wasm support
Date: Mon, 21 Oct 2024 23:36:25 +0200
Message-ID: <20241021213625.2564398-1-patrick@subset.ch>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: lOGsssDjEWi3EieHNliYftXiYit614cT
X-Proofpoint-GUID: lOGsssDjEWi3EieHNliYftXiYit614cT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-21_22,2024-10-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxscore=0 spamscore=0 clxscore=1030 adultscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2410210154
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Oct 2024 21:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113084

From: Patrick Wicki <patrick.wicki@siemens.com>

Patch the cmake config of the wasm micro runtime dependency. This fixes
the build for x86 by avoiding the cmake try_run() which cannot be
invoked in cross-compiling mode.

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 ...d-cmake-try_run-when-cross-compiling.patch | 42 +++++++++++++++++++
 .../fluentbit/fluentbit_3.1.9.bb              |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0004-was=
m-avoid-cmake-try_run-when-cross-compiling.patch

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-wasm-avoid=
-cmake-try_run-when-cross-compiling.patch b/meta-oe/recipes-extended/flue=
ntbit/fluentbit/0004-wasm-avoid-cmake-try_run-when-cross-compiling.patch
new file mode 100644
index 000000000..419e85903
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0004-wasm-avoid-cmake-=
try_run-when-cross-compiling.patch
@@ -0,0 +1,42 @@
+From 5b6d274664f92a6c6083f4d27a1b1604a326f22c Mon Sep 17 00:00:00 2001
+From: Patrick Wicki <patrick.wicki@siemens.com>
+Date: Sat, 5 Oct 2024 21:36:12 +0200
+Subject: [PATCH] wasm: avoid cmake try_run when cross-compiling for x86
+
+This fixes building the wasm micro runtime used when enabling wasm
+support in fluentbit.
+cmake try_run does not work when cross-compiling because the test progra=
m
+cannot be executed:
+
+| CMake Error: try_run() invoked in cross-compiling mode, please set the=
 following cache variables appropriately:
+|    TEST_WRGSBASE_RESULT (advanced)
+| For details see .../fluentbit/3.1.9/build/TryRunResults.cmake
+|      Write linear memory base addr to x86 GS register disabled
+| -- Configuring incomplete, errors occurred!
+
+Since we cannot run the test program, assume that the instruction is not
+available and disable the option.
+
+This patch is no longer needed once fluentbit updates WAMR, as it's been
+fixed in https://github.com/bytecodealliance/wasm-micro-runtime/pull/306=
6.
+
+Upstream-Status: Pending [https://github.com/fluent/fluent-bit/pull/8744=
]
+
+Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
+---
+ .../build-scripts/config_common.cmake                           | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/wasm-micro-runtime-WAMR-1.3.0/build-scripts/config_comm=
on.cmake b/lib/wasm-micro-runtime-WAMR-1.3.0/build-scripts/config_common.=
cmake
+index e73ebc85f..c2504e007 100644
+--- a/lib/wasm-micro-runtime-WAMR-1.3.0/build-scripts/config_common.cmak=
e
++++ b/lib/wasm-micro-runtime-WAMR-1.3.0/build-scripts/config_common.cmak=
e
+@@ -408,7 +408,7 @@ if (WAMR_BUILD_STATIC_PGO EQUAL 1)
+   add_definitions (-DWASM_ENABLE_STATIC_PGO=3D1)
+   message ("     AOT static PGO enabled")
+ endif ()
+-if (WAMR_DISABLE_WRITE_GS_BASE EQUAL 1)
++if (WAMR_DISABLE_WRITE_GS_BASE EQUAL 1 OR CMAKE_CROSSCOMPILING)
+   add_definitions (-DWASM_DISABLE_WRITE_GS_BASE=3D1)
+   message ("     Write linear memory base addr to x86 GS register disab=
led")
+ elseif (WAMR_BUILD_TARGET STREQUAL "X86_64"
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb b/meta=
-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
index f96e1a7ed..a70534e91 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
@@ -23,6 +23,7 @@ SRC_URI =3D "\
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.pat=
ch \
     file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.pat=
ch \
     file://0003-CMakeLists.txt-Revise-init-manager-deduction.patch \
+    file://0004-wasm-avoid-cmake-try_run-when-cross-compiling.patch \
 "
 SRC_URI:append:libc-musl =3D "\
     file://0004-chunkio-Link-with-fts-library-with-musl.patch \
--=20
2.47.0


