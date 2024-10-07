Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8F5CFB45F
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 20:10:08 +0000 (UTC)
Received: from qs51p00im-qukt01071902.me.com (qs51p00im-qukt01071902.me.com [17.57.155.9])
 by mx.groups.io with SMTP id smtpd.web10.1685.1728331803829261941
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Oct 2024 13:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=ItoHINtp;
 spf=pass (domain: subset.ch, ip: 17.57.155.9, mailfrom: patrick@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1728331803; bh=Vt2Ts7TbRqSEF2QseJB2Cd4jbTNfhKpkXTzYlblDT74=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ItoHINtpEbiYF2Gng3L55zls1S76CkWM0GoxSxvaAH+VtGC39eXUoxqN3eYfbRasw
	 IKQExWswkPNhVpsANul4OxqvPMpg4f29wUkHL6F6AhvTOzEPf+PKbOrpikmr7ExoKT
	 UK0QmKQeg1SzXBb6Hm1wdNA2Y/DWsf8pX21orI14o9ZHxzUBrJS196zea58thlQxsY
	 rM/3IA3MC3H4dwqBuywYfGn1Y1V0GOBOEhFStFtvIAGdKBjTH3S9LCzH+4xjFIAX4s
	 pjRNutuhns04ShpuNr4EFuSlBfGFsb2L9H0RHwH35MCT0O8q/kL18KcUl01oSWlDez
	 sLRE93P9BjLBQ==
Received: from thinkpad.. (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
	by qs51p00im-qukt01071902.me.com (Postfix) with ESMTPSA id 6C0935EC067C;
	Mon,  7 Oct 2024 20:10:01 +0000 (UTC)
From: patrick@subset.ch
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [meta-oe][PATCH] fluentbit: fix building with wasm support
Date: Mon,  7 Oct 2024 22:09:46 +0200
Message-ID: <20241007200946.414276-1-patrick@subset.ch>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Proofpoint-GUID: _BZa7QCmOkHs6SkMMU3PPxmNhD_BTgPm
X-Proofpoint-ORIG-GUID: _BZa7QCmOkHs6SkMMU3PPxmNhD_BTgPm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-07_13,2024-10-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1030 mlxscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2410070139
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Oct 2024 20:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112701

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
index e88b5e91a..9eccb8d0b 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
@@ -19,6 +19,7 @@ SRCREV =3D "431fa79ae27edaef8d050a7af6f038f4400193a1"
 SRC_URI =3D "\
     git://github.com/fluent/fluent-bit.git;branch=3D3.1;protocol=3Dhttps=
 \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.pat=
ch \
+    file://0002-wasm-avoid-cmake-try_run-when-cross-compiling.patch \
     file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.pat=
ch \
 "
=20
--=20
2.46.2


