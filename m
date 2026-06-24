Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3F9CDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 17:30:42 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12908.1782322054265940885
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2026 10:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=swfWLTZS;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8EE5C4E407D5;
	Wed, 24 Jun 2026 17:27:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 63CF8601C5;
	Wed, 24 Jun 2026 17:27:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 93C6D106C8193;
	Wed, 24 Jun 2026 19:27:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782322052; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FIL91/yb16wK+SiVu4IjbRztBWt48GKSfcjpymxoeL0=;
	b=swfWLTZST9R7ec+v8tzYufnjqooDNpC0N7Kx81nd7a9lPR5Yly7JDsHtIaZpjpAyNirXb0
	SuLB4k9+3VQq+1TSU9efaIPhB2fhPDLs8E1WChLVWX/BDQaqK3CBQGdE1QsU/OXGgMCKIk
	r4StWOZLNF9TSZRB0jvCKUKxRiJF6jiNW2Nnj7UPIYTJSsnvWL0SZikEtZQi2Oa4puunkv
	YzwMODBkIea5BQZ6JCaeutKoazgxHVYwV+kFwO2I6bicdj44C4nQTv3JiRhAyMPxHHRpcr
	kbjh0xJwp1zJAhs2feVHHskheg5J0Shb4qq0XR7lgvstsnWp/Hk04RgTAsZTCw==
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 1/1] bpftrace: fix buildpaths QA issue in bpftrace-dbg and bpftrace-ptest
Date: Wed, 24 Jun 2026 19:27:08 +0200
Message-ID: <20260624172708.240536-2-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260624172708.240536-1-joaomarcos.costa@bootlin.com>
References: <20260624172708.240536-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 17:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127725

With the current version, I had the QA issues below:

WARNING: bpftrace-0.25.1-r0 do_package_qa: QA Issue:
File /usr/lib/bpftrace/ptest/tests/.debug/bpftrace_test in package bpftra=
ce-dbg contains reference to TMPDIR [buildpaths]

WARNING: bpftrace-0.25.1-r0 do_package_qa: QA Issue:
File /usr/lib/bpftrace/ptest/tests/bpftrace_test in package bpftrace-ptes=
t contains reference to TMPDIR [buildpaths]

A bit of find + grep + strings show that this originally comes from:

field_analyser.cpp.o: [my tmpdir...]/bpftrace/0.25.1/build/tests/data
field_analyser.cpp.o: [my tmpdir...]/bpftrace/0.25.1/sources/bpftrace-0.2=
5.1/tests/data/data_source.c
field_analyser.cpp.o: [my tmpdir...]/bpftrace/0.25.1/sources/bpftrace-0.2=
5.1/tests/data

The .rodata section is infected with these, and after some more digging,
the paths come from debug symbols (i.e., .debug_line_str) in
data_source.o:

build/tests/data/data_source.o: /src/update-2026.01/build/tmp/work/riscv6=
4.../bpftrace/0.25.1/build/tests/data
build/tests/data/data_source.o: /src/update-2026.01/build/tmp/work/riscv6=
4.../bpftrace/0.25.1/sources/bpftrace-0.25.1/tests/data/data_source.c
build/tests/data/data_source.o: /src/update-2026.01/build/tmp/work/riscv6=
4.../bpftrace/0.25.1/build/tests/data
build/tests/data/data_source.o: /src/update-2026.01/build/tmp/work/riscv6=
4.../bpftrace/0.25.1/sources/bpftrace-0.25.1/tests/data

I'm not familiar with the magic performed by BuildBPF.cmake, but as far
as I can tell, gcc is being invoked with "-g" and no prefix mapping,
so there is no way of stopping the source path(s) from ending in data_sou=
rce.o.

This patch adds a "bridge" between this .cmake file and bpftrace's
recipe, where I export DEBUG_PREFIX_MAP, so gcc is invoked with the
-ffile-prefix-map flags from OE Core.

The end result is:

$ strings ./build/tests/data/data_source.o | grep "debug\/bpftrace"
/usr/src/debug/bpftrace/0.25.1/tests/data/data_source.c
/usr/src/debug/bpftrace/0.25.1/tests/data
/usr/src/debug/bpftrace/0.25.1/tests/data
/usr/src/debug/bpftrace/0.25.1/tests/data

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 ...BPF.cmake-introduce-DEBUG_PREFIX_MAP.patch | 36 +++++++++++++++++++
 .../bpftrace/bpftrace_0.25.1.bb               |  3 ++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/b=
pftrace/bpftrace/0001-cmake-BuildBPF.cmake-introduce-DEBUG_PREFIX_MAP.pat=
ch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace=
/bpftrace/0001-cmake-BuildBPF.cmake-introduce-DEBUG_PREFIX_MAP.patch b/me=
ta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-=
cmake-BuildBPF.cmake-introduce-DEBUG_PREFIX_MAP.patch
new file mode 100644
index 0000000000..a889d018f8
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftra=
ce/0001-cmake-BuildBPF.cmake-introduce-DEBUG_PREFIX_MAP.patch
@@ -0,0 +1,36 @@
+From af36170841d9836926953e17d93e9562e594c9aa Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D <joaomarcos.cos=
ta@bootlin.com>
+Date: Wed, 24 Jun 2026 18:46:14 +0200
+Subject: [PATCH] cmake/BuildBPF.cmake: introduce DEBUG_PREFIX_MAP
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ cmake/BuildBPF.cmake | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/cmake/BuildBPF.cmake b/cmake/BuildBPF.cmake
+index cb8cd687..95ae1dc1 100644
+--- a/cmake/BuildBPF.cmake
++++ b/cmake/BuildBPF.cmake
+@@ -86,11 +86,12 @@ function(bpf NAME)
+     add_custom_target(${NAME}_gen_bitcode DEPENDS ${ARG_BITCODE})
+     add_dependencies(${NAME} ${NAME}_gen_bitcode)
+   endif()
++  separate_arguments(DEBUG_PREFIX_MAP_LIST NATIVE_COMMAND "$ENV{DEBUG_P=
REFIX_MAP}")
+   add_custom_command(
+     OUTPUT ${ARG_OBJECT}
+     DEPENDS ${ARG_SOURCE} ${ARG_DEPENDS}
+     # See above: fresh compilation and the use of `gcc`.
+-    COMMAND ${GCC} -Wno-attributes -g -I ${CMAKE_CURRENT_BINARY_DIR} -c=
 ${CMAKE_CURRENT_SOURCE_DIR}/${ARG_SOURCE} -o ${CMAKE_CURRENT_BINARY_DIR}=
/${ARG_OBJECT}
++    COMMAND ${GCC} -Wno-attributes -g ${DEBUG_PREFIX_MAP_LIST} -I ${CMA=
KE_CURRENT_BINARY_DIR} -c ${CMAKE_CURRENT_SOURCE_DIR}/${ARG_SOURCE} -o ${=
CMAKE_CURRENT_BINARY_DIR}/${ARG_OBJECT}
+     COMMAND cmake -E env LLVM_OBJCOPY=3D${LLVM_OBJCOPY} ${PAHOLE} -J ${=
CMAKE_CURRENT_BINARY_DIR}/${ARG_OBJECT}
+     VERBATIM
+   )
+--=20
+2.47.0
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace=
/bpftrace_0.25.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools=
/bpftrace/bpftrace_0.25.1.bb
index f28c1547db..62e0c17f9d 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftra=
ce_0.25.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftra=
ce_0.25.1.bb
@@ -18,11 +18,14 @@ DEPENDS +=3D "${@bb.utils.contains('PTEST_ENABLED', '=
1', 'pahole-native llvm-nativ
 SRC_URI =3D "git://github.com/iovisor/bpftrace;branch=3Drelease/0.25.x;p=
rotocol=3Dhttps;tag=3Dv${PV} \
            file://run-ptest \
            file://0002-CMakeLists.txt-allow-to-set-BISON_FLAGS-like-l.pa=
tch \
+           file://0001-cmake-BuildBPF.cmake-introduce-DEBUG_PREFIX_MAP.p=
atch \
 "
 SRCREV =3D "e491811e5d648288c01f42ce087967b271f504a0"
=20
 inherit bash-completion cmake ptest pkgconfig
=20
+export DEBUG_PREFIX_MAP
+
 PACKAGECONFIG ?=3D " \
         ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
         ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd", ""=
, d)} \
--=20
2.47.0


