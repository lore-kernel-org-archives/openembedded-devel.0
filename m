Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.697.1793419081459947918
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 20:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ebGfBdmg;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-369f33df08eso2772647eec.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 20:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793419081; x=1794023881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A4WigBY1mSvw4gX6H1U9nT2An8VzMzyiA5wl+l+X4HU=;
        b=ebGfBdmg5Zn2cSPRd0zCmf/a6uDKrZdk4w3ruWCUSL2rUvcdc9dBa1LlDl4bW/hFyf
         fg4XpGbJOkEHCUaNyAIppFhuKXcwlQE2oCDlojjtnoUqbNwc87/PkYxpGBAyM3g75P61
         +SMdEGVDCsB51pECJ30RmAt1iC7ruiGHaYZnO6bE+y0OgwdRd84SkaK3l0Kfp2DmFAw1
         AYKeLvQVdFoErF11rLMUiF8J6XPA8fcAOpgTeCmskD6Z/Qk2NCt29mGsxWBi9RoBt75g
         BZtq4gldIRwDCeJB29SXYuCV/4i+5V+5wwqRQp7hjrmPKZwO41RG454BJsZeRoqFRSXZ
         VFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793419081; x=1794023881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A4WigBY1mSvw4gX6H1U9nT2An8VzMzyiA5wl+l+X4HU=;
        b=WB5tTrZgEbeBbVr8rQA4mJCZPeuH+loR18fmjECFA75QEhpitZfphESNgxjmskxo1H
         ShZyLtavEW8AQJsp6Ao1stMu9NBvy1cL11vOrutexWv1aU+6hOLPyFp1q4mCvf0088ta
         nnxKUcNluTkxLm3eT6shtA8qEL0E6TxNdzGo7klUugcXwTUW9DtYdzEzzvNlRJsuFCDA
         ypWGn2+qkJIOWkNhmGhe8Pd9fmHQi3LyJCLcm4XRLbuAaCfp3CDPRdZCb+NK4Zg8aUqr
         3PvlYcf/usOgn6hfViiGszA6Nq5a86u99uFV0i2C563j6EZCJbyDv3ke5SU3sNMAqNFJ
         7H9w==
X-Gm-Message-State: AFq9FYLohOfnnXW8T62AS4Lj8xN5frLTqGpUCZ2kpgZnmAdiMLj3ypr5
	crSqOEX/AyQgegfb5Ig8sQnfxAX/2k3bW72PLYAGEB/huWpzpimDygQkgn8yCE02/nA=
X-Gm-Gg: AYBFou2x+8nOqplYHjvF0KBDs1ie13FmhaktZaCujUojPFFraXvL5WhFtf3q5V3JS6N
	mNJN5Fz450fmeVjJWsScgz6MeR8arMr/c/AdbCTWFtuVUFj6fAbUkOQTcOYy9Kf9uifpiXnDvoD
	erhhfCWDLHTcujFuaHtmEiCTr+Y89TfLYsdsmu8I3fh8EYeY6A+Sgz354oFZqXh8JwFZggqI5J5
	DOVu/ba+fNFILlQUsKdeaoUs7HKWXb2GIfX+UMyiOGIXN263Q0uc5LqVnKh/s5qtPS5H/OFkdQL
	fJIezWqpgNcccBQsl0Khz0s3cacPECQ3K1yXProwTVosFDzx1oNDBkTEctbERAnG6cSMkNEL20b
	9suW5NKnEMgoXPLu0W1DDcYzTA7LNfEJLWrV1u2mqiH1olAvWDzM0R56jW+K+BT/zM+Wclz0869
	g030lG6TR/NnqpOcaLeGxRHdUR+WGAbXqF9FR5qM+lNT+vLp4+SsZTnQ6aLiKjrJs4WKU9EX8ai
	VsVNfkC6P3A74oXyAreoSDdJJy2A7OcuuK61Oo89PyBKffJ/K7O3/R/zLG/qiQkevUHXMlseZqu
	4YNX9SzS72JCIVtGyGBNZJPmC702ZJxa8L7soj/61LhkWDOzPxHC9hsMxZl7Wgrr28T+rfmyoDc
	JpZ5uYRhHNy9K5ur3z1lKchdpbQwQoT0nzq+psH4+sOrwLx1tVRVAL/V917mAz4G8swiZUVEy36
	a8z4RMoBjpSAzOCX2j8wC1fJn53+/YbxhObNm7ZDYIC+67yNXvM7LJrFcDg9b1oRlZI4mTtY1dg
	4lKju2P9DJg36KTTTMcO4QF7kTOExgGigRb1mvS7qs+NaQQffHbWKDF9PjVDj1F2E7NTRCzWifN
	J/ze
X-Received: by 2002:a05:7301:f09:b0:35c:ba31:6fef with SMTP id 5a478bee46e88-36a424438d2mr6122875eec.36.1793419080431;
        Fri, 30 Oct 2026 20:58:00 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm13687837eec.23.2026.10.30.20.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:57:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 07/10] kernel-selftest: Fix building the net selftests
Date: Fri, 30 Oct 2026 20:57:44 -0700
Message-ID: <20261031035748.2130261-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261031035748.2130261-1-khem.raj@oss.qualcomm.com>
References: <20261031035748.2130261-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 31 Oct 2026 03:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131717
Content-Type: text/plain; charset="utf-8"

The net selftests generate their netlink code with tools/net/ynl, which
needs the netlink specs from Documentation/netlink, python3 with pyyaml
and jsonschema, and the top-level MAINTAINERS file: ynl_gen_c.py finds
the kernel root by walking up until it sees MAINTAINERS and loops
forever when it is not there. libbpf needs elfutils and zlib,
reuseport_bpf_numa numactl and tcp_mmap openssl.

net/lib installs the whole ynl tree, so drop its build artifacts and
bytecode, which trip the staticdev and buildpaths QA checks, and pass
the prefix maps to clang so the BPF objects don't carry build paths
either.

The python tests load the netlink specs at runtime, so add pyyaml there
as well.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../kernel-selftest/kernel-selftest.bb         | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 018ac74b85..4254eccfd6 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -5,6 +5,9 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"

 DEPENDS = "rsync-native llvm-native libcap"
+# net: libbpf (elfutils, zlib), YNL code generation (python3-pyyaml-native,
+# python3-jsonschema-native), reuseport_bpf_numa (numactl) and tcp_mmap (openssl)
+DEPENDS += "elfutils numactl openssl python3-jsonschema-native python3-pyyaml-native zlib"

 S = "${UNPACKDIR}"

@@ -49,7 +52,7 @@ PACKAGECONFIG[mm] = ",,libcap liburing numactl, libgcc bash"
 do_patch[depends] += "virtual/kernel:do_shared_workdir"
 do_compile[depends] += "virtual/kernel:do_install"

-inherit module-base kernel-arch ptest siteinfo
+inherit module-base kernel-arch ptest python3native siteinfo

 DEBUG_PREFIX_MAP:remove = "-fcanon-prefix-map"

@@ -123,7 +126,7 @@ EXTRA_OEMAKE = '\
     CC="${CC} ${DEBUG_PREFIX_MAP}" \
     AR="${AR}" \
     LD="${LD}" \
-    CLANG="clang -fno-stack-protector -target ${TARGET_ARCH} ${TOOLCHAIN_OPTIONS} -isystem ${S} -D__WORDSIZE=\'64\' -Wno-error=unused-command-line-argument" \
+    CLANG="clang -fno-stack-protector -target ${TARGET_ARCH} ${TOOLCHAIN_OPTIONS} ${DEBUG_PREFIX_MAP} -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=/usr/src/kernel -isystem ${S} -D__WORDSIZE=\'64\' -Wno-error=unused-command-line-argument" \
     DESTDIR="${D}" \
     V=1 \
 '
@@ -136,6 +139,8 @@ EXTRA_OEMAKE:append:toolchain-clang = "\
 CLEANBROKEN = "1"

 KERNEL_SELFTEST_SRC ?= "Makefile \
+                        Documentation/netlink \
+                        MAINTAINERS \
                         include \
                         kernel \
                         lib \
@@ -187,6 +192,13 @@ do_install() {
     if [ -e ${D}/usr/kernel-selftest/bpf/test_offload.py ]; then
         sed -i -e '1s,#!.*python3,#! /usr/bin/env python3,' ${D}/usr/kernel-selftest/bpf/test_offload.py
     fi
+    # net/lib installs the whole tools/net/ynl tree, including its build
+    # artifacts and the bytecode from running it at build time; only the
+    # python library is used at runtime.
+    if [ -d ${D}/usr/kernel-selftest/net/lib/ynl ]; then
+        find ${D}/usr/kernel-selftest/net/lib/ynl \( -name '*.a' -o -name '*.o' -o -name '*.d' \) -delete
+        find ${D}/usr/kernel-selftest/net/lib/ynl -name __pycache__ -type d -prune -exec rm -rf {} +
+    fi
     chown root:root  -R ${D}/usr/kernel-selftest
 }

@@ -227,6 +239,8 @@ FILES:${PN} += "/usr/kernel-selftest"
 # needs to enforce per-test timeouts; busybox has no timeout applet by default.
 # mount_setattr_test creates an ext4 image with mkfs.ext4.
 RDEPENDS:${PN} += "python3 perl perl-module-io-handle bash libcap libgcc coreutils e2fsprogs-mke2fs"
+# The net python tests load netlink specs with the YNL library.
+RDEPENDS:${PN} += "python3-pyyaml"

 INSANE_SKIP:${PN} += "libdir"

