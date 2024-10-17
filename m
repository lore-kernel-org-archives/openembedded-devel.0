Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DB0D2F7F7
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 07:09:13 +0000 (UTC)
Received: from st43p00im-ztdg10063201.me.com (st43p00im-ztdg10063201.me.com [17.58.63.182])
 by mx.groups.io with SMTP id smtpd.web10.42961.1729148943202468011
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Oct 2024 00:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=BCgqanqh;
 spf=pass (domain: subset.ch, ip: 17.58.63.182, mailfrom: patrick@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1729148942; bh=Ha6F7nytj7BDh0Gp8LdBUsKn0umgOd9OvgDIhQiFBb4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=BCgqanqhGhib0DfjxIe0b4LHVMiRAd1CAKFTcfwnwfS45OLJXas6hNxgHDZRMXSOo
	 tTP027uvtoNDO7dOoSCVaW8T4+zR3of6ONUqa8ngGP3uEXtYLATImwIWreHLghl9aC
	 qS+m3Z/w209dtcEeQrkLpL4pQht7PWpxVXdaNvaK3quD/3ejP+wPgy983fh4S2aS8w
	 vQ5XAC6RRNB2aMa7ZMqdn6s6MHmGlyrW/0gYPGSvg7mwhHsE/rUj4xVYZgucdGQHoK
	 yHds6TfNSadiIJq73+ecsWXs3PXrcj/W2Uh+8Zk2SgMUsOi5s1lZkJ6eitl730m2AH
	 VXtf4jrCCr4cQ==
Received: from localhost.localdomain (st43p00im-dlb-asmtp-mailmevip.me.com [17.42.251.41])
	by st43p00im-ztdg10063201.me.com (Postfix) with ESMTPSA id 39ADC9800DF;
	Thu, 17 Oct 2024 07:08:59 +0000 (UTC)
From: patrick@subset.ch
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [meta-oe][PATCH v2] fluentbit: fix building with wasm support
Date: Thu, 17 Oct 2024 09:08:39 +0200
Message-ID: <20241017070839.39476-1-patrick@subset.ch>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: V0OlAVzgKeKWjChvLUPd6Mh36-hXlb6m
X-Proofpoint-GUID: V0OlAVzgKeKWjChvLUPd6Mh36-hXlb6m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-17_06,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1030 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2410170047
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 07:09:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112961

From: Patrick Wicki <patrick.wicki@siemens.com>

Add patch for the wasm runtime that fixes building for x86.

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 ...d-cmake-try_run-when-cross-compiling.patch | 42 +++++++++++++++++++
 .../fluentbit/fluentbit_3.1.9.bb              |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0002-was=
m-avoid-cmake-try_run-when-cross-compiling.patch

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-wasm-avoid=
-cmake-try_run-when-cross-compiling.patch b/meta-oe/recipes-extended/flue=
ntbit/fluentbit/0002-wasm-avoid-cmake-try_run-when-cross-compiling.patch
new file mode 100644
index 000000000..419e85903
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-wasm-avoid-cmake-=
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
index fc67236d3..d42a9a964 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
@@ -21,6 +21,7 @@ SRCREV =3D "431fa79ae27edaef8d050a7af6f038f4400193a1"
 SRC_URI =3D "\
     git://github.com/fluent/fluent-bit.git;branch=3D3.1;protocol=3Dhttps=
 \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.pat=
ch \
+    file://0002-wasm-avoid-cmake-try_run-when-cross-compiling.patch \
     file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.pat=
ch \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0003-=
Disable-installing-systemd-service-file.patch', d)} \
 "
--=20
2.47.0


