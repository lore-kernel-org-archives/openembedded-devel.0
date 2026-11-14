Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3148.1794685069851442531
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 11:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GojzVQOp;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37d424f1ae8so190436eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 11:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794685069; x=1795289869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBzidRA7mwhTMY6EBCpsv6R2j0MoYdMWSDfQEESnyns=;
        b=GojzVQOpnxAx/O9Xkbv11Sv2NtSB0VeiU9axLgcHCAZcEGq/PbLPioMm+oCzoixM5Z
         XgqV1t051io9jMU1kZefS7g5fJd78h1rdg8rN8vohy/WW+tIwOD6k/F0iDNB1o4FM4Tv
         XLzbFQCZvCI6VzOnAQshDwzXV3DtIL9jyjz81UPFhhJfjDu89ves9YlvFGBk8/QyBF4A
         3NGCSLuZg55vIz9VlEwsWb3cGdiio0j/jLGE8mlVnYHtZCaL8TWKGUKfq/vQZyNeL3mm
         d6nPxcYT38qk82qeyOVuiTfBj8HNaDWS1baohmAP+SYoD72I70m4CJpR6/VOisnLmeHZ
         t+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794685069; x=1795289869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iBzidRA7mwhTMY6EBCpsv6R2j0MoYdMWSDfQEESnyns=;
        b=ecW8Kx8AsZfUvh3uPqO+8jWOv6i1WYbn7UVjJpTNA7C0zQbLHcx9PLGr31KUxnD7/P
         fdOSTzMBsYlN+EpKpfaQ0DfXkaE9P58B2omifKf3PyD68UQnad2QOl//UzXNOzp+Jp6y
         gd5zOMZxfDeUHbV5iWpuYgle9Hs3swMylka+nWreD7oTviXSV2MkOns5+koCsuTjOfZw
         7fzpMDytq5VOLzCksVQ0GLDuLDmCTY1qoQA+N75j5wws4hqzat+RNHdt5ObMhA4wDRs2
         xBO0MzX5tVNRDWuumIM5V7sxmuB00PvFc7mxISf+ozhSc4v2E6fmQFyFKoAYsNdhv5p2
         /JVg==
X-Gm-Message-State: APuU4Z9cw0H+/OCEYWX+H8eDMbVqAiUe3hmg9ujEe+s2TqGm2H84mRaG
	9/FoGjbVh0OULJuqoMt1snu2EQo8f29Y/ItS70keMzkZetGl0F7HyTJB5a2NFQBr
X-Gm-Gg: AYBFou2JSOqqON/qDAjrbwSlQiJGoOkU/0Sc6BP0fdh+Q2uLiZQeoTPaqoLcF0ur8e1
	YNhbUhfT6WuOXOnF1u/v+SukeZ6L5NXVFFzuM6cldfFY3E0ygoQmSv0LbmVE4BgZBQgz78Gnpzz
	CB13LQ/bjcOKatvWP6+diyd5YrFPK0TKqLEKlks/9aFYza2zE0ZX91eOHVtAZeHGVYKfpsL7jM7
	vbZ25GGzQY9u06buUIkbjcYQWfidLANVVdZ74uGJIP1X9PorRfjwXXm8ei6nj0CERab7v/mglFp
	cD0I8z4OJTjxSlhnkTgBgxK/+HDoKi6MBG056UczqrHqNwFNLANFf/Vuuyfq09UAaS4XzHMmlGQ
	v2yBSltoAklFiYbojHxvrvUKKxZQ3FofdXviCscG3M9of9YC66MeFoSHKSrx452nCLalR7OZIMD
	Hz24pPzSfCjl9lO+7AK5hQ5R6HJHgUNJrwA6HaN4C30dCYWvFHxH/eEgKgtv2LpBN0YFlf0S73z
	OGChyN0x5+Yf9AlF1q2Pxfrw/3vdTlI1LNG+Z4ukx5fDamo4ex3kkZ5phdQRIIGeh0SkrDw5tkz
	p5mFs0q2G/PHCM1HG0/+2I8+BVDvocKOnNgh+ZBKJA1kKeP9Eiwnp+Dl5XtJ5duRI5C1ryqEklX
	SE6sdtmdnjZeIBkZIXvVGW61LkoTh5FlVt9IhCqOJb4gANvLVUEE8YBSfRvW29mKxWehyjZzUdE
	vLqxeV3OM9/8ju2xQ1SMql0mBk/2REzJOeu85rhX2lvR7XP0LecEBSAzZDpi4SOoquxvGeOPvUs
	Q5yrg/bj+DsNaIRS0XSaNnEfslJSU8zdfsk42zuHeSfV7/AK74EipvJZF2PK6mPu75fwB+ZMUFK
	heOJsf9uTaX6t0rfaELFNZ7Ukg==
X-Received: by 2002:a05:7301:db0b:b0:36f:4354:608 with SMTP id 5a478bee46e88-37967cdd5e9mr5761134eec.37.1794685069150;
        Sat, 14 Nov 2026 11:37:49 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm16855164eec.4.2026.11.14.11.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:37:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 11/13] rdma-core: Do not export LFS64 wrappers in librspreload when not built
Date: Sat, 14 Nov 2026 11:37:31 -0800
Message-ID: <20261114193733.1743149-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
References: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 19:37:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132268
Content-Type: text/plain; charset="utf-8"

librspreload.map always exports fcntl64 and sendfile64, but preload.c
only defines them when the libc provides them, which is not the case on
musl, so lld fails with:

  error: version script assignment of 'global' to symbol 'fcntl64' failed: symbol not defined

Drop them from the version script when RDMA_PRELOAD_WRAP_LFS64 is off.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...librspreload-version-script-entries-.patch | 45 +++++++++++++++++++
 .../rdma-core/rdma-core_66.0.bb               |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0003-librdmacm-Allow-librspreload-version-script-entries-.patch

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0003-librdmacm-Allow-librspreload-version-script-entries-.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0003-librdmacm-Allow-librspreload-version-script-entries-.patch
new file mode 100644
index 0000000000..845a6ce37e
--- /dev/null
+++ b/meta-networking/recipes-support/rdma-core/rdma-core/0003-librdmacm-Allow-librspreload-version-script-entries-.patch
@@ -0,0 +1,45 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 10 Nov 2026 06:06:10 -0800
+Subject: [PATCH] librdmacm: Allow librspreload version script entries the libc
+ lacks
+
+librspreload.map exports fcntl, fcntl64, sendfile and sendfile64, but
+which of them preload.c ends up defining depends on the libc. On musl
+there are no LFS64 symbols, so the fcntl64() and sendfile64() wrappers
+are not built, while on glibc with _FILE_OFFSET_BITS=64 the fcntl() and
+sendfile() wrappers are emitted as fcntl64 and sendfile64. Linkers that
+check the version script, like lld, then fail, e.g. on musl:
+
+  error: version script assignment of 'global' to symbol 'fcntl64' failed: symbol not defined
+  error: version script assignment of 'global' to symbol 'sendfile64' failed: symbol not defined
+
+Pass --undefined-version for the preload module when the linker
+supports it, so whichever of these names are defined get exported.
+
+Upstream-Status: Submitted [https://github.com/linux-rdma/rdma-core/pull/1853]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ buildlib/rdma_functions.cmake | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/buildlib/rdma_functions.cmake b/buildlib/rdma_functions.cmake
+index 6e0c7d2e..95709537 100644
+--- a/buildlib/rdma_functions.cmake
++++ b/buildlib/rdma_functions.cmake
+@@ -131,6 +131,15 @@ function(rdma_rspreload_module DEST VERSION_SCRIPT)
+   set_target_properties(${DEST} PROPERTIES LINK_FLAGS ${CMAKE_SHARED_LINKER_FLAGS})
+   set_target_properties(${DEST} PROPERTIES LIBRARY_OUTPUT_DIRECTORY "${BUILD_LIB}")
+   rdma_set_library_map(${DEST} ${VERSION_SCRIPT})
++  # Which of fcntl/fcntl64 and sendfile/sendfile64 get defined depends on the
++  # libc: musl has no LFS64 symbols, while glibc with _FILE_OFFSET_BITS=64
++  # emits the plain wrappers under the 64 names. Let linkers that check the
++  # version script (lld) skip the names that do not exist.
++  RDMA_CHECK_C_LINKER_FLAG("-Wl,--undefined-version" SUPPORTS_UNDEFINED_VERSION)
++  if (SUPPORTS_UNDEFINED_VERSION)
++    set_property(TARGET ${DEST} APPEND_STRING PROPERTY
++      LINK_FLAGS " -Wl,--undefined-version")
++  endif()
+ endfunction()
+
+ # Create a special provider with exported symbols in it The shared provider
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_66.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_66.0.bb
index a5e9ba9f12..2725d77cb2 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_66.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_66.0.bb
@@ -8,6 +8,7 @@ RDEPENDS:${PN} = "bash perl"
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch \
            file://0002-mana-Link-with-libatomic-when-64-bit-atomics-need-it.patch \
+           file://0003-librdmacm-Allow-librspreload-version-script-entries-.patch \
 "
 SRCREV = "0fa90c60fbc274edb3495f30c1afd02b3f5fd38e"

