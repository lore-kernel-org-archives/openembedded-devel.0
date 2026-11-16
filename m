Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4799.1794866445129174533
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 14:00:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jN7cJu8g;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38133db970bso310129eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 14:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794866444; x=1795471244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A4WigBY1mSvw4gX6H1U9nT2An8VzMzyiA5wl+l+X4HU=;
        b=jN7cJu8gY0kKiySaUwJjGfE75fm3zqzkZ6hvSt8iU8+b27UqBW96rJmHF+MnqkrXw9
         RY0wkd7Q9N27HJXXufW7HvGX9Iv5jFowalXpT9X7obtQuklYb6gpjBxdrD5my89OzH7z
         SwoCV0aGvQerzsSt4cUGsVTToRWODxlsasImnS+nuHkbljyMDalxTKZyY+v1Gb7J5ol+
         mE0SEfbETy1i23y8yLrbHy1Xky2gULjwWuNiHEbFGiHlX9O3iobJmoTllIP9gh7+slNO
         cKk9p/0EY6DeGKDBJDu601MxMYUY+8n5XsGu3emgh51KaA5rYnEQLudPhN5gAhPBZHbe
         BKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866444; x=1795471244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A4WigBY1mSvw4gX6H1U9nT2An8VzMzyiA5wl+l+X4HU=;
        b=2mWQHk7f4y4uWAousG1MsewcKccRm65PZJDfZNzbfpvBf8qyCXNmU4FnnB6VC61hp9
         BOWTXzABD/s6qB69DPy9Lh4ljJNoh+zIPu3br05zXBx/pZOJnXyj1FZC0xMNUc4aYF0J
         0uDN3TPPgzhk4aJOT4p9i19ULfIVH6lWoVxdbnVyp64uee/XPSA0/5CCODMmkIPq+s8r
         zJQY3kTnSYSLYhIFuNSgdxBIqEhVc/7M1r72ZL9DuvLLDL9wcejYtf211EnADJ5yL5Ut
         fscZ+PEEcAT730TYbZ07JR45BGB2sDxwK1xQaLu94CKpLZ/c1M4At2qom86WhXTpUH7t
         U1vQ==
X-Gm-Message-State: APuU4Z8VU2FCjF7WtlKqADjRNMUWPQDEzzN3vLxAYgNR9Pf7PvnKGvTR
	K6S3HfQjJXSK+1i2z0akouWMeHIQUD+/UvkGUdE1gW99g9/haqpU/VsOmJEXoRJo
X-Gm-Gg: AZFdTZeZNkHbxhdgDa4YtRlBbEG8vZVo+ieaSumGciqAkvuAWAjZ5IvdhraNBNYIIsu
	+7iKky8Ui499aomF9MlO1Bz52gZKxSFslpdLyDEnbdH5CzOnrPjh9f/9qcJvAKxJmPod7TT5kUW
	mVisOEd45oLhlmFMZNnRCoh/qPV8WnK92xy2veyYJK7w8FRp1VcRZ2mzN7T8vKqmDjJZrUq40GK
	Cq5KVOeDLJNo7E1zSDCISZWWercO2U8qE5/pSJD+NIwi43mifu0/EE4mKG9AaImU6/uYqvkJNfW
	ZzGtlljKhHfWkQB7aG0DZRaO5BfsRCjjgQuB2eF2Sk/ZFelqwkPyaV74JGWy0Xwc7iizbNIvtac
	orN9tqkwf7tUkeIgeMGH1LNX9bG8LPHwZDwn5P0ICzSq4we1gQtfj8IvWfpMItkMo9peXiSDacB
	0OyJXN5nbTQxXYaQD1kW1aYTlVjTyyz51XXcfJ43y8CE4A36BGr0NZzicthJf7q7wr6BY9AQIzF
	PrN3hkWyh3spG2lr+nrOZilw6VnZbRd8l+zV14UhjGiP5CXkTiWeM/B5B7SStH7AKeBq/r8WrUa
	Yj/xMrr4izRwjs5jvwLAhGFUw00gmoR72as8lpiUSalCbu7xkGzaumBf6qtdK1TeqBKtvdWgZ+5
	m3aNlcynk9OpLcVjYa0+OVWTuhykGUpOiYpCiSdNJEt6sLeiElXH2rW6OCX8o+ewrmbxqfujPR7
	J6B/ME8+0UG/hJCW7LlBUyU/EzmRtbohvO65dJw49yTCVy17Mc+pA0HxX4iZcidWrUDntj7fkER
	9XvdOZ9us29Nbh2K4e/XocdXF/Bj4brec2EadqijO5UD6WfI62G/JqIi1qQNeq9ipNVL6zU1vdi
	ZiI2
X-Received: by 2002:a05:693c:83cf:10b0:36a:79e7:2fd with SMTP id 5a478bee46e88-379684b838cmr12940594eec.40.1794866444106;
        Mon, 16 Nov 2026 14:00:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38115cfdd6esm1221905eec.5.2026.11.16.14.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:00:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/5] kernel-selftest: Fix building the net selftests
Date: Mon, 16 Nov 2026 14:00:36 -0800
Message-ID: <20261116220039.1807391-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116220039.1807391-1-khem.raj@oss.qualcomm.com>
References: <20261116220039.1807391-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 22:00:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132566
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
 
