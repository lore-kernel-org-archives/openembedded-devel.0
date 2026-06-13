Return-Path: <patel.rajkumar@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17488CD8CA8
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 12:11:53 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.89947.1781352703708548590
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2026 05:11:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=fD56Ymdl;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=cGpmGFI6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: patel.rajkumar@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DAu53P2244786
	for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 12:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XoB2CZykjKn
	/86Dw4WsVQQFkwFDm2cinV7LsAm5EZfI=; b=fD56YmdlhQWCwmhPsR3rE8xvE8F
	Oun7EyqvgESSXXSe4N5RcoWG1XGpRldaV+Z9/Z9JUkr16yt6Ecp6TmO4Ah1GEjkb
	UbQQ6RTFXMTVf7Du+CRLBvrQvuNHLm8YquiunsGmcr8zE9lCl2SCuzIRAWQINA95
	cKl1ckwMcDPrxMqS1bcBxM7st9EvjuSrXAOUbJ2MaK5mEmFxr+nu6K8jTylJEfth
	Vwyqni79scJkpL7Zsl051ZF8aVuXAb34P8yUwe7Ad7bEElheG92sRzxDDew0Cf87
	xZYWzFbWNI3cwEhOQPKjwT5uFGPz0CqdP5TGcZlRgH4rtbrQhcvkvgqgTCA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9f90bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 12:11:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf1dece2ecso18951755ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 05:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781352703; x=1781957503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoB2CZykjKn/86Dw4WsVQQFkwFDm2cinV7LsAm5EZfI=;
        b=cGpmGFI6J05T0t2jtzIcV12dExNnfjX1A8KXM84IWx4ofgQny0szSTcb1ppKDKivkk
         rsUCzXdVEzaxYyn7Zt4RKzJCVgvGL9e5JVDMu7XHqi6P4o55QdmJEk/YhE1O3mwNf/mv
         QVqBxxVmtarRQt97ApKPK0Q32rltOQ45VC19LmIsrlN07QNPbhDhRJDVfOGEAjFF726C
         F/D141H/H7gcJy5huApg0tAuIoJaOpx5v/x2CNmtc+qxWhdzkHEv8rQkpwp7X2Lst+pi
         Ye2FRCtb+XnJqx9eSlx+vaSrY8HEJdOADT9uirsNQPMiIM0AofSpPPKD05M6J1iKzP73
         TrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781352703; x=1781957503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XoB2CZykjKn/86Dw4WsVQQFkwFDm2cinV7LsAm5EZfI=;
        b=VQCSzGXDmTi8k0jYsnEa4HWOQd6wk9JRXS8IUClknuByeLo3UhiWOnB4bbGHOpnQW2
         vMb8Uaf6x1ODUS+zU63JSSFHC6Crn+N+qnAGpY5Pj94YE0qn/zDk26CNNH+T86aCyixt
         20cxqyd6L5wJe5XpwjCemudA5ccIk2h8v47uWNoRVKh0FYU1bRYAW4sFmBQKxQegFBhv
         TCrYqC4MGOf2VATF1MrEl/S38VXActFdHisOXEsgbbIl8CfGnhIsZiSxchBmgrxhaHvq
         gHOlMEl4snEeKq44YlsDumeCcL5rKbQO5BacH5XY6KEDrfnrmRoEMp5jNMvnp8pn/Y5G
         g4FQ==
X-Gm-Message-State: AOJu0Yx4XImvejo8SmzpCAzj496HTt0SdNY2NvMHKh8PlFIljyUPNGp2
	U9993eEJit2nY6OtCtz0qtaxSTce9kcuc9topXqtGkQnGYMiqRxgkYHHx84phyE4fLoeRK3OFAf
	gSfRdQuyeWDTY0R4TWcuPEyhlth3V+dE5/h6o1AhBYFjTepzCYAEHV0a9N1ZzgN3fk5UY9kzIqG
	Qgod83nHd9OvAVvQeF
X-Gm-Gg: Acq92OGcnK3UrsNkLqOv50l4eAamRlgd06TP3imnlAZtQW3ow3p8VqEvWsUInY2tTs+
	5PK2YrDP4fngN3/V/E5RU/oIbPyVnIBGeC4Runap3aKkAvEFBIkcbV6tiXPQ9oKNYyurVe/roOv
	6I/sGlSSgNeF6qvpLv7euVYXN0Y9rHweLtLoyOv05U0tAVW6louW2cQ4Aa9XmAsfvqIxTJdZlhs
	VIcSzxtd02E9Pk3ihFegxWEDvrExOOTB8UzzdmGPI8O60I0az12H0SmJNKINsGhtKd47o1O5MO7
	LRpxrV63SLWEEehU+0w3L9Wp8m1/0Y6nV+n2vt8z98bi3iLQ7o5rkedkFBVC94xxpJ5VkNEEAYR
	i7xQsPkyByhvfum9f6j2nRfxWOTbK2d0WNjVFryQmMTOiWHP1j/z6ar4w
X-Received: by 2002:a17:902:d58b:b0:2c0:c14c:bf38 with SMTP id d9443c01a7336-2c664271b17mr39484325ad.24.1781352702581;
        Sat, 13 Jun 2026 05:11:42 -0700 (PDT)
X-Received: by 2002:a17:902:d58b:b0:2c0:c14c:bf38 with SMTP id d9443c01a7336-2c664271b17mr39484095ad.24.1781352702099;
        Sat, 13 Jun 2026 05:11:42 -0700 (PDT)
Received: from hu-rajkpate-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432d86501sm45389115ad.61.2026.06.13.05.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 05:11:41 -0700 (PDT)
From: Rajkumar Patel <patel.rajkumar@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com, Rajkumar Patel <patel.rajkumar@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/3] rtc-testbench: add recipe
Date: Sat, 13 Jun 2026 17:40:24 +0530
Message-Id: <20260613121024.2957723-3-patel.rajkumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260613121024.2957723-1-patel.rajkumar@oss.qualcomm.com>
References: <20260613121024.2957723-1-patel.rajkumar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDEyNCBTYWx0ZWRfX+ABhqzmmeVAL
 auUvNd69E7GLBjyA4XV6sZUKJoAs4+H31QTv/hbv2nf1xUGLA/ZmG33KSlgA4WzlbF2rPEafYcE
 5Fp8LRyIHkVNLUsuFR6hdORgEXnugUucK+SnJiNQ51MkoDKYubOgK+OTm+3mx1laQ5VdBe/xpXJ
 MOJYanuJi9iOP/S8PHBg6TE8c0AqH/wdFAUfqbCrnmI7FbSCxNEHyKN4T4QkaHPhiwnD6G1vToz
 iaLgnm/9JJsX1zVxnwxjYOKCsTKo59/d2r0y8pHsi/wZyeV8j3U7RdnJIAFBUMrrfIj/U/IPN2h
 acU4TU3nVlKe5HkHhzYDiAefJIEbSkz1eSuP2mbHVOFwG7NBm7o9QRSZgPqb6XjeJ/+N+m807i+
 hmibLstvYVEIRK5c0RiLn3WfYH83ipb67+MDMUL32eClkb21gFyxYqxFjRYSThPfAupcaiwhAZM
 DsVByYLX1Mzg1OS2xwQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDEyNCBTYWx0ZWRfX5l2wmhECPnM0
 YmdAbCLZFZHhem/myqFXpeDCglNPpOXNsygCzsQggLEJhO/tOgK78WIL17i4ftSF6V7HF8p6k1F
 WUH1RaYrEEFdIcbopHxE6wLWzBpMqEs=
X-Proofpoint-GUID: bcA_IcFg8L9kLZHKW-F0wlbj9J65Hssh
X-Proofpoint-ORIG-GUID: bcA_IcFg8L9kLZHKW-F0wlbj9J65Hssh
X-Authority-Analysis: v=2.4 cv=ULvt2ify c=1 sm=1 tr=0 ts=6a2d48ff cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=9X8c9XHnE1RMnE3JauMA:9 a=O8hF6Hzn-FEA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130124
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 12:11:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127572

Add recipe for rtc-testbench v5.4, a real-time and non-real-time traffic
validation tool for converged TSN networks from Linutronix. It validates
real-time performance and robustness of hardware, drivers, and the Linux
network stack on TSN-enabled Ethernet networks using AF_PACKET or AF_XDP
with eBPF, supporting protocols like PROFINET and OPC UA PubSub.

rtc-testbench depends on libxdp provided by xdp-tools.

Depends-on: xdp-tools: upgrade 1.2.10 -> 1.6.3

Signed-off-by: Rajkumar Patel <patel.rajkumar@oss.qualcomm.com>
---
 ...ake-BPF-clang-and-include-paths-conf.patch | 54 +++++++++++++++++++
 .../rtc-testbench/rtc-testbench_5.4.bb        | 40 ++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 meta-oe/recipes-test/rtc-testbench/files/0001-CMakeLists.txt-make-BPF-clang-and-include-paths-conf.patch
 create mode 100644 meta-oe/recipes-test/rtc-testbench/rtc-testbench_5.4.bb

diff --git a/meta-oe/recipes-test/rtc-testbench/files/0001-CMakeLists.txt-make-BPF-clang-and-include-paths-conf.patch b/meta-oe/recipes-test/rtc-testbench/files/0001-CMakeLists.txt-make-BPF-clang-and-include-paths-conf.patch
new file mode 100644
index 0000000000..da1ea3bb33
--- /dev/null
+++ b/meta-oe/recipes-test/rtc-testbench/files/0001-CMakeLists.txt-make-BPF-clang-and-include-paths-conf.patch
@@ -0,0 +1,54 @@
+From 53c57b337a51a47b0edca64d88ef9aaacce90044 Mon Sep 17 00:00:00 2001
+From: Rajkumar Patel <patel.rajkumar@oss.qualcomm.com>
+Date: Wed, 10 Jun 2026 11:39:40 +0530
+Subject: [PATCH] CMakeLists.txt: make BPF clang and include paths configurable
+ for cross-builds
+
+The upstream CMakeLists.txt hardcodes the clang binary name and
+derives the BPF include path from CMAKE_C_LIBRARY_ARCHITECTURE,
+which is empty in a cross-compilation environment. This causes
+the BPF kernel programs to be compiled with the host clang and
+-I /usr/include/ (the build host include path), which fails with:
+
+  fatal error: 'asm/types.h' file not found
+
+Fix by converting the hardcoded values to CMake CACHE variables
+so they can be overridden from the recipe via -DCLANG=,
+-DBPF_INCLUDE_DIRS=, and -DBPF_EXTRA_FLAGS=.
+
+Upstream-Status: Inappropriate [OE cross-compilation specific]
+
+Signed-off-by: Rajkumar Patel <patel.rajkumar@oss.qualcomm.com>
+---
+ CMakeLists.txt | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f782304..7f284f9 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -174,15 +174,21 @@ include_directories("${PROJECT_BINARY_DIR}")
+ #
+ # Add code for compiling XDP eBPF programes.
+ #
+-set(ASM_INCLUDE "/usr/include/${CMAKE_C_LIBRARY_ARCHITECTURE}")
++set(CLANG "clang" CACHE STRING "Clang binary used for BPF compilation")
++set(BPF_INCLUDE_DIRS "" CACHE STRING "Sysroot include path for BPF compilation")
++set(BPF_EXTRA_FLAGS "" CACHE STRING "Extra flags for BPF clang compilation (space-separated)")
++
++separate_arguments(BPF_EXTRA_FLAGS_LIST UNIX_COMMAND "${BPF_EXTRA_FLAGS}")
++
+ set(CLANG_FLAGS -Wall -O2 -fno-stack-protector
+-    -I ${ASM_INCLUDE}
++    ${BPF_EXTRA_FLAGS_LIST}
++    -I ${BPF_INCLUDE_DIRS}
+     -I ${PROJECT_BINARY_DIR}  # required for app_config.h
+ )
+ 
+ function(add_xdp_prog name)
+   add_custom_target(${name} ALL
+-    COMMAND clang ${CLANG_FLAGS} -target bpf -c -g -o ${CMAKE_BINARY_DIR}/${name}.o ${name}.c
++    COMMAND ${CLANG} ${CLANG_FLAGS} -target bpf -c -g -o ${CMAKE_BINARY_DIR}/${name}.o ${name}.c
+     DEPENDS reference
+     WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/src
+     SOURCES src/${name}.c
diff --git a/meta-oe/recipes-test/rtc-testbench/rtc-testbench_5.4.bb b/meta-oe/recipes-test/rtc-testbench/rtc-testbench_5.4.bb
new file mode 100644
index 0000000000..81a4d9d01b
--- /dev/null
+++ b/meta-oe/recipes-test/rtc-testbench/rtc-testbench_5.4.bb
@@ -0,0 +1,40 @@
+SUMMARY = "Real-time and non-real-time traffic validation tool for converged TSN networks"
+
+DESCRIPTION = "The Linux RealTime Communication Testbench validates real-time \
+performance and robustness of hardware, drivers, and the Linux network stack on \
+TSN-enabled Ethernet networks. It generates and mirrors cyclic traffic using \
+AF_PACKET or AF_XDP with eBPF, supporting protocols like PROFINET and OPC UA PubSub."
+
+HOMEPAGE = "https://github.com/Linutronix/RTC-Testbench"
+LICENSE = "BSD-2-Clause & (GPL-2.0-only | BSD-2-Clause)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE;md5=f39e57686080f8752e19c4cd3e04e351 \
+    file://LICENSES/BSD-2-Clause.txt;md5=9e16594a228301089d759b4f178db91f \
+    file://LICENSES/GPL-2.0-only.txt;md5=3d26203303a722dedc6bf909d95ba815 \
+"
+SRC_URI = " \
+    git://github.com/Linutronix/RTC-Testbench.git;tag=v${PV};nobranch=1;protocol=https \
+    file://0001-CMakeLists.txt-make-BPF-clang-and-include-paths-conf.patch \
+"
+SRCREV = "bf016fdf422094f1ef65c0d88f148f46663ebbd8"
+
+DEPENDS += " \
+    libyaml \
+    libbpf \
+    xdp-tools \
+    openssl \
+    clang-native \
+"
+
+inherit cmake pkgconfig
+
+EXTRA_OECMAKE += " \
+    -DRX_TIMESTAMP=ON \
+    -DTX_TIMESTAMP=ON \
+    -DCLANG=${STAGING_BINDIR_NATIVE}/clang \
+    -DBPF_INCLUDE_DIRS=${STAGING_INCDIR} \
+    -DBPF_EXTRA_FLAGS='-D__${TARGET_ARCH}__ -ffile-prefix-map=${S}=${TARGET_DBGSRC_DIR} -ffile-prefix-map=${STAGING_DIR_HOST}=' \
+"
+
+# Require bash since installed scripts use /bin/bash shebang
+RDEPENDS:${PN} += "bash"

