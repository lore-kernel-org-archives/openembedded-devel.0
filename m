Return-Path: <patel.rajkumar@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A7ACD98C5
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 12:11:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.89936.1781352679467301584
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2026 05:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=n8TPV2/I;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=R/R1o3p4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: patel.rajkumar@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DBPmM92318765
	for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 12:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+uUzLUAR8TczmLUryKhnJwNk0uyI1x6le+d
	as1FlYtI=; b=n8TPV2/IjQRAqKisKfT/Yo4vL/ST25AFOyOUtuXNPercjzUkgcJ
	excZYcnXHTgzSFvkSlHAEmPQn8kWvAzpU1xGsUQTqQW+ZA8nB1m1iI1qNXY0VaBV
	iBymw3fQ8MqbsVwNR/mPHwPATUSc4Ozt+B8M6XrotSXVhayKYUZ9e4w62bQ993LR
	PIL8AwoVimo16paQ6KAaClPNeH2QMYBT6iMjEyHdHLVDawtbBcUbkI5gHoR1q1vB
	ENHsG8p2mfuhT8RkG8EmMp5Z9i0No7hICXu6MUX7w42rskXPaOGiLB6BLLEcVqZg
	h6k1EqhLDzipUKvxRWzB5uS3R6FEcLgXrew==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye10xx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 12:11:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf08c2a24bso18031515ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 05:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781352678; x=1781957478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+uUzLUAR8TczmLUryKhnJwNk0uyI1x6le+das1FlYtI=;
        b=R/R1o3p44mgZQ1x6IJ+hwvTxDh+l5IN8PXg77T9dlkOlCVOLmmqtTYNtXrOi8MLr26
         c7aCnWpS86E9ZXcNHKKSL2wdG7+EitOp60Y1y+/wFRfqKs/tTR0yt1FOO0g/vP47gZ5H
         FzQSXXrNE5Bb8kwqiGZ2dmG+G6/dmCxqAm1BQ/XNiFv0hUWIKUGv3A1nv64OhiocTRuU
         0DdHNNgo0lJPwdcJqjUiv6nqGm73+oQ9nDnD8lDY/G9uLLIAjbMtAQQPF1G07hwv1rrW
         LYvjMGKvpJm4VlbYIKgJ2XVoOhCB55d3mCHhnrSSYKaRI2pHkITRHWFVmfEpMINRc8Kl
         pubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781352678; x=1781957478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uUzLUAR8TczmLUryKhnJwNk0uyI1x6le+das1FlYtI=;
        b=tWS9nQ4HxDtOII19rJ2VZ62pwssy/Xhg0IbAaqeSfI/aXVd88FZczKV2oYCGkAAvhx
         fVPA0nBD4QCwaA4lJB5KQ3wwhHDrsarAw+kOabVDF3Rxzo4HGnLQut/O2G/QESwSxi77
         EL3O8UxkbIU7lDQ+ziIjYV4V3M0tMpsSxB8ShA3Onnrox1BcHDGOoAwAK75HIsqQ6hHx
         tC8IDjvhNao/CP+kFhyHmZ7V4C+XrYt2X8AojexrswbQTuOcFxQEG4w+nY598+jPiNCF
         DVD72ravAs+IjrlVVImTZZsAr+XvapdMegSW0Ri8yGBf/KD/u3pASz5VX4vtifLmFFXY
         HnnQ==
X-Gm-Message-State: AOJu0YwOy3mtL847JsRv9y0n2TrYVnVJKWQzl5OC6SaoCnI7+CK3tlIi
	Db9B8du+FXWSa39+JoYZXg9uMqrKrRyS2Z31Bq7wdw4XFXEJFwYopxbLrJan6rQSNBaMBDrkiSB
	oh3qxVkHSzS3f+Jmuv2npChBLHPQpWHmrUClEKvSBQldn/elTu4h3GEbp7mP1iYXnmijasqLSek
	dlIYhsMzr3L4CyhMAS
X-Gm-Gg: Acq92OE3A990zYzLiJu/XuIE/ZWMJPGqyBWfpCSYbrCFP4fnJFozG747gCeYIcf+//X
	i1uedtMhR8DNoVCwetC1rRJsRM/gjeJ1VwTOCUvcCoApj3SlIJ84XLFSrksUyRshWHBH+nRXAKl
	opWjrgpwRftKMMyYWD8Qov/2H6xd0NX3TLRySBZHq2ICHiJGXTQw+7r1hMu/0nF/4mAG3eNmZsA
	kwzOGNo69RkUnCM7/KKUBC97qcljLeXwChSEAGiTaOXL+WL53FF0vJ/sDuJbyWbdzGcAJpruqBp
	szOTOjD+5x3sDF3S9rVXQtYlKt/+rejfRoLDlVOdTFx8dDqwVNMSiDse1fIqkemrJ+ZwK2sVRcL
	9kZkRswdIEoliETuml9C85XnL6O5oorWZtsjBeF9m5cTiDILpE7kTeQx9
X-Received: by 2002:a17:903:198e:b0:2bd:8395:fedd with SMTP id d9443c01a7336-2c412b30fabmr75401945ad.37.1781352677813;
        Sat, 13 Jun 2026 05:11:17 -0700 (PDT)
X-Received: by 2002:a17:903:198e:b0:2bd:8395:fedd with SMTP id d9443c01a7336-2c412b30fabmr75401525ad.37.1781352677194;
        Sat, 13 Jun 2026 05:11:17 -0700 (PDT)
Received: from hu-rajkpate-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432d86501sm45389115ad.61.2026.06.13.05.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 05:11:16 -0700 (PDT)
From: Rajkumar Patel <patel.rajkumar@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com, Rajkumar Patel <patel.rajkumar@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/3] xdp-tools: add recipe
Date: Sat, 13 Jun 2026 17:40:22 +0530
Message-Id: <20260613121024.2957723-1-patel.rajkumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eYvm_IQWUOhS3WuJcBKPUhZsxJX4AD1_
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2d48e6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=6qJXKjYvFISdBsgvcNcA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDEyNCBTYWx0ZWRfX2PW7eNo+Cvjb
 ZqWS7EEcRIC0qXUqaLMdO1ilLyihUomkvmUBz8z8YcDKcuBf9waivCVoz+BIZTyxqkjmW9+DrsU
 tGW4bJZdprrEYlvY3jVh6Qada0g2fDQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDEyNCBTYWx0ZWRfX1QSJOE9bAa2n
 3agL7/Ttkr2LlmB2SQMXUfnRGhq+zzSPxGlB2sB/CK210fc+Bb+bdhs/qIWC2jj/P1IXXjiUUAe
 U6crmM4y5CGsgxFqSCCvdPWPwJnwbI0L79dQhMaOFFHQoYNW5IWWLckKVscYG5Gsun+WJSYEAsj
 5HbC0fsaWXg76dkxsqo9kcvcUiiZL5z34e+CYOg7MxMKqLF9ONNLMuWvp8X3Apksk0kJIw+GVxJ
 M8lYloW8LBElDefb/OpMU/7vzMqy8lnpRC1gsgDL0oX93HBZbeh6HXUsQC6YB6mJP5daWmm+Cgx
 NVhxfdlSjSKT8KqtHjO4s21gorrOUZQQ4J92AlQSkEK11Sy9QDwYzS9PUNlN1fGbvGZuZfgllFp
 2jRI6lTgGBTu2WRtbnMoGtnfE4vvqfhGIA+xbXYIcyzo6ep4v4x9bvMLGj5dQtyQx1kCyOhw8Q7
 xSfgFUzCAy2OjNxmFFw==
X-Proofpoint-ORIG-GUID: eYvm_IQWUOhS3WuJcBKPUhZsxJX4AD1_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130124
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 12:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127570

Import xdp-tools recipe from meta-dpdk to meta-oe.

xdp-tools provides a set of utilities and helpers for working
with XDP (eXpress Data Path) and eBPF-based packet processing
in the Linux networking stack.

Although currently available in meta-dpdk, xdp-tools is a
standalone utility with no direct dependency on DPDK, and is
generally useful for networking and XDP-based workflows.
Adding it to meta-oe makes it available without requiring
the meta-dpdk layer.

Signed-off-by: Rajkumar Patel <patel.rajkumar@oss.qualcomm.com>
---
 ...0001-configure-skip-toolchain-checks.patch | 44 +++++++++++++++++++
 ...-not-detect-libbpf-header-from-sysro.patch | 44 +++++++++++++++++++
 .../0003-Makefile-fix-KeyError-failure.patch  | 31 +++++++++++++
 .../0004-Makefile-fix-libxdp.pc-error.patch   | 34 ++++++++++++++
 .../xdp-tools/xdp-tools_1.2.10.bb             | 36 +++++++++++++++
 5 files changed, 189 insertions(+)
 create mode 100644 meta-oe/recipes-support/xdp-tools/xdp-tools/0001-configure-skip-toolchain-checks.patch
 create mode 100644 meta-oe/recipes-support/xdp-tools/xdp-tools/0002-Makefile-It-does-not-detect-libbpf-header-from-sysro.patch
 create mode 100644 meta-oe/recipes-support/xdp-tools/xdp-tools/0003-Makefile-fix-KeyError-failure.patch
 create mode 100644 meta-oe/recipes-support/xdp-tools/xdp-tools/0004-Makefile-fix-libxdp.pc-error.patch
 create mode 100644 meta-oe/recipes-support/xdp-tools/xdp-tools_1.2.10.bb

diff --git a/meta-oe/recipes-support/xdp-tools/xdp-tools/0001-configure-skip-toolchain-checks.patch b/meta-oe/recipes-support/xdp-tools/xdp-tools/0001-configure-skip-toolchain-checks.patch
new file mode 100644
index 0000000000..0c891528cb
--- /dev/null
+++ b/meta-oe/recipes-support/xdp-tools/xdp-tools/0001-configure-skip-toolchain-checks.patch
@@ -0,0 +1,44 @@
+From 9c9dce2e5f04de65b7b00321f96fff6071546ea1 Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Mon, 17 Oct 2022 15:44:16 +0800
+Subject: [PATCH] configure: skip toolchain checks
+
+Current logic fetch full command line along with the tool. i.e
+gcc -m64 -march=skylake -mtune=generic ...
+
+Which throws ERROR: Cannot find tool -m64
+
+So need to re-write for loop, so it can work in cross-compilation
+environment too.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+
+---
+ configure | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/configure b/configure
+index b4e824f..10618fc 100755
+--- a/configure
++++ b/configure
+@@ -69,12 +69,12 @@ check_toolchain()
+     CLANG=$(find_tool clang "$CLANG")
+     LLC=$(find_tool llc "$LLC")
+ 
+-    for TOOL in $PKG_CONFIG $CC $LD $OBJCOPY $CLANG $LLC $M4; do
+-        if [ ! $(command -v ${TOOL} 2>/dev/null) ]; then
+-            echo "*** ERROR: Cannot find tool ${TOOL}" ;
+-            exit 1;
+-        fi;
+-    done
++    #for TOOL in $PKG_CONFIG $CC $LD $OBJCOPY $CLANG $LLC $M4; do
++    #    if [ ! $(command -v ${TOOL} 2>/dev/null) ]; then
++    #        echo "*** ERROR: Cannot find tool ${TOOL}" ;
++    #        exit 1;
++    #    fi;
++    #done
+ 
+     clang_version=$($CLANG --version | grep -Po '(?<=clang version )[[:digit:]]+')
+     if [ "$?" -ne "0" ]; then
diff --git a/meta-oe/recipes-support/xdp-tools/xdp-tools/0002-Makefile-It-does-not-detect-libbpf-header-from-sysro.patch b/meta-oe/recipes-support/xdp-tools/xdp-tools/0002-Makefile-It-does-not-detect-libbpf-header-from-sysro.patch
new file mode 100644
index 0000000000..2e66783692
--- /dev/null
+++ b/meta-oe/recipes-support/xdp-tools/xdp-tools/0002-Makefile-It-does-not-detect-libbpf-header-from-sysro.patch
@@ -0,0 +1,44 @@
+From 2840cf0b89497f545fae2eed7ece3f3c5fc558e3 Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Mon, 17 Oct 2022 15:50:34 +0800
+Subject: [PATCH 2/4] Makefile: It does not detect libbpf header from sysroot
+
+So adding sysroot headers path.
+
+Upstream-Status: OE-Specific
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ lib/common.mk       | 2 +-
+ lib/libxdp/Makefile | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/common.mk b/lib/common.mk
+index 56c0406..ab0bad8 100644
+--- a/lib/common.mk
++++ b/lib/common.mk
+@@ -55,7 +55,7 @@ LIBXDP_SOURCES := $(wildcard $(LIBXDP_DIR)/*.[ch] $(LIBXDP_DIR)/*.in)
+ KERN_USER_H ?= $(wildcard common_kern_user.h)
+ 
+ CFLAGS += -I$(HEADER_DIR) -I$(LIB_DIR)/util $(ARCH_INCLUDES)
+-BPF_CFLAGS += -I$(HEADER_DIR) $(ARCH_INCLUDES)
++BPF_CFLAGS += -I$(HEADER_DIR) $(ARCH_INCLUDES) -I${STAGING_INCDIR}/
+ 
+ BPF_HEADERS := $(wildcard $(HEADER_DIR)/bpf/*.h) $(wildcard $(HEADER_DIR)/xdp/*.h)
+ 
+diff --git a/lib/libxdp/Makefile b/lib/libxdp/Makefile
+index 358b751..8f459d8 100644
+--- a/lib/libxdp/Makefile
++++ b/lib/libxdp/Makefile
+@@ -30,7 +30,7 @@ PC_FILE := $(OBJDIR)/libxdp.pc
+ TEMPLATED_SOURCES := xdp-dispatcher.c
+ 
+ CFLAGS += -I$(HEADER_DIR)
+-BPF_CFLAGS += -I$(HEADER_DIR)
++BPF_CFLAGS += -I$(HEADER_DIR) -I${STAGING_INCDIR}/
+ 
+ 
+ ifndef BUILD_STATIC_ONLY
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/xdp-tools/xdp-tools/0003-Makefile-fix-KeyError-failure.patch b/meta-oe/recipes-support/xdp-tools/xdp-tools/0003-Makefile-fix-KeyError-failure.patch
new file mode 100644
index 0000000000..41c57f6eb2
--- /dev/null
+++ b/meta-oe/recipes-support/xdp-tools/xdp-tools/0003-Makefile-fix-KeyError-failure.patch
@@ -0,0 +1,31 @@
+From 157546fbc4f18751c52b3c8788879c05cf253331 Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Mon, 17 Oct 2022 16:02:46 +0800
+Subject: [PATCH 3/4] Makefile: fix KeyError failure
+
+Error:
+Exception: KeyError: 'getpwuid(): uid not found: 11857215'
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ lib/libxdp/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/libxdp/Makefile b/lib/libxdp/Makefile
+index 8f459d8..9a340a3 100644
+--- a/lib/libxdp/Makefile
++++ b/lib/libxdp/Makefile
+@@ -55,7 +55,7 @@ install: all
+ 	$(Q)install -d -m 0755 $(DESTDIR)$(BPF_OBJECT_DIR)
+ 	$(Q)install -m 0644 $(LIB_HEADERS) $(DESTDIR)$(HDRDIR)/
+ 	$(Q)install -m 0644 $(PC_FILE) $(DESTDIR)$(LIBDIR)/pkgconfig/
+-	$(Q)cp -fpR $(SHARED_LIBS) $(STATIC_LIBS) $(DESTDIR)$(LIBDIR)
++	$(Q)cp -fpR --no-preserve=ownership $(SHARED_LIBS) $(STATIC_LIBS) $(DESTDIR)$(LIBDIR)
+ 	$(Q)install -m 0755 $(XDP_OBJS) $(DESTDIR)$(BPF_OBJECT_DIR)
+ 	$(if $(MAN_FILES),$(Q)install -m 0755 -d $(DESTDIR)$(MANDIR)/man3)
+ 	$(if $(MAN_FILES),$(Q)install -m 0644 $(MAN_FILES) $(DESTDIR)$(MANDIR)/man3)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/xdp-tools/xdp-tools/0004-Makefile-fix-libxdp.pc-error.patch b/meta-oe/recipes-support/xdp-tools/xdp-tools/0004-Makefile-fix-libxdp.pc-error.patch
new file mode 100644
index 0000000000..b1e15e5216
--- /dev/null
+++ b/meta-oe/recipes-support/xdp-tools/xdp-tools/0004-Makefile-fix-libxdp.pc-error.patch
@@ -0,0 +1,34 @@
+From 46b3ff797135574aa0ee42f633a281d44f48da95 Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Mon, 17 Oct 2022 16:05:15 +0800
+Subject: [PATCH 4/4] Makefile: fix libxdp.pc error
+
+Error:
+do_populate_sysroot: QA Issue: libxdp.pc failed sanity test (tmpdir) in
+path ... xdp-tools/1.2.8-r0/sysroot-destdir/usr/lib/pkgconfig [pkgconfig]
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ lib/libxdp/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/libxdp/Makefile b/lib/libxdp/Makefile
+index 9a340a3..bc39177 100644
+--- a/lib/libxdp/Makefile
++++ b/lib/libxdp/Makefile
+@@ -76,8 +76,8 @@ $(OBJDIR)/libxdp.so.$(LIBXDP_VERSION): $(SHARED_OBJS)
+ 		      $^ $(LDFLAGS) $(LDLIBS) -o $@
+ 
+ $(OBJDIR)/libxdp.pc:
+-	$(Q)sed -e "s|@PREFIX@|$(PREFIX)|" \
+-			-e "s|@LIBDIR@|$(LIBDIR)|" \
++	$(Q)sed -e "s|@PREFIX@|$(prefix)|" \
++			-e "s|@LIBDIR@|$(libdir)|" \
+ 			-e "s|@VERSION@|$(TOOLS_VERSION)|" \
+ 			< libxdp.pc.template > $@
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/xdp-tools/xdp-tools_1.2.10.bb b/meta-oe/recipes-support/xdp-tools/xdp-tools_1.2.10.bb
new file mode 100644
index 0000000000..4a06124caf
--- /dev/null
+++ b/meta-oe/recipes-support/xdp-tools/xdp-tools_1.2.10.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Utilities and example programs for use with XDP"
+HOMEPAGE = "https://github.com/xdp-project/xdp-tools"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9ee53f8d06bbdb4c11b1557ecc4f8cd5 \
+                    file://LICENSES/GPL-2.0;md5=994331978b428511800bfbd17eea3001 \
+                    file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd \
+                    file://LICENSES/BSD-2-Clause;md5=5d6306d1b08f8df623178dfd81880927"
+
+DEPENDS += " libbpf clang-native zlib elfutils libpcap"
+
+SRC_URI = "git://github.com/xdp-project/xdp-tools.git;branch=v1.2;protocol=https \
+            file://0001-configure-skip-toolchain-checks.patch \
+            file://0002-Makefile-It-does-not-detect-libbpf-header-from-sysro.patch \
+            file://0003-Makefile-fix-KeyError-failure.patch \
+            file://0004-Makefile-fix-libxdp.pc-error.patch \
+          "
+
+SRCREV = "57a139f9bf6ef644f9c1deb4f7df4bb4c76d6179"
+
+
+inherit pkgconfig
+
+EXTRA_OEMAKE += "PREFIX=${D}${prefix} LIBDIR=${D}${libdir} BUILD_STATIC_ONLY=1 PRODUCTION=1"
+
+CFLAGS += "-fPIC"
+
+export STAGING_INCDIR
+
+do_install () {
+    oe_runmake install
+
+    # Remove object files *.o
+    rm -rf ${D}/${libdir}/bpf
+}
+
+RDEPENDS:${PN} += "bash"

