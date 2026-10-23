Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1652.1792738445024796332
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=B1AmKmv8;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a070781f63so275381b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738444; x=1793343244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gzwOpvJljEQM5YGsjVd0w9IQKEMz+Ug5/DmM5KPvl0M=;
        b=B1AmKmv85cEU0mwDxIvJnKdSOxOuqTuQ4HO66KLnqqini0R52VWP6GUrKPnLAQeC0Q
         BGj44NGwyicZz6ZVl9hRmYDytrE51pwVTXB4Kjxc3MCozBjTW+8j7pCqZP3ZOXYnGYeV
         6yaO4uQI2a5REFw6h0RLvKJ2CMC2bK94V+KibkE4G6SIQx5FnHnp7LR7P0leFJIIRLJa
         RS5NaTYrMResgWANKe6GWLDr+aRQspzLz0u4oU5bAdPTzb+S7K+nhlzM9hemPpH2Sqmb
         W+sL7CX6GhpKxwrz3Gw+vmvQhP3moQzs5s5X9XFHkdTkmooURL4rqmtFPw3e3Dp8a2b+
         SN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738444; x=1793343244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gzwOpvJljEQM5YGsjVd0w9IQKEMz+Ug5/DmM5KPvl0M=;
        b=XcX4lOoT4JmqbFErY9Np3IanDDohpS74SL4n+8qXUH/O3OvftgS4yEUAGOT7ZTL6NY
         Pkdi9gHlDZgwAoeTk0hoscoNyXyySqtYq/9Hm/jdaIKj+/vpUmsF9mkha1Zzvefr0Vey
         4TNWQnuX75zZTUptD4Q3ZBxt8Z/r3xfyDEuT7Pn3QpQuuyiXFgUdWAi9VhzfrjTqKAuR
         AX4nDg0rFmZhBLxvKqb76ym5roEjDx4mlxkbXRgfA41nfY9WAXhFk5n+Q4g8xiWZg0DX
         NGhhjGkxzLgWJKfpl+NUSbC9FZ8Q/20boHUs7nw3eKFD3Ip3GGJ3cNv4286e+/7CI4i6
         pxXw==
X-Gm-Message-State: AFq9FYJWGGMSt6cEv3TMVIVt6QM/NCYaWZY1yFUZiu9krk99e6deIEYR
	87QEl0JfZBTWvdfZ51n1LtNjkOG5CiypsB+O2ICRP7CLycrHCA5IBWeu5o2w/KKmk08=
X-Gm-Gg: AYBFou3E7sJUyEWgSgMqUVaX01vRjZlrkQ5y1rRjXnbV8CT7hW88DeY/xlBVnCyxbWF
	Qb6vwdTeOzVLCBdmRMfpuZHb95PfjbL/qC8Pg8czzAmtmqqRD5ALGDM6CZt1OXmwndBqC7UJK49
	OnocijPyAlsajTlKA1ciiq40FK/WLQP7gdCylzp4l1POzklicMdVnw1ioVOs6sCvphtahrs6GzR
	tKm1WD46brtSpK2o34tMjXItPbGkrtXzP7GndmoFyqO8RfH7HB/3vteHIWxgFjJYva7lFSzxssc
	ptKbaMHuk5G0ODH8yCl0FypjJPAYvCHqGv9mrjTbH44C8klu0eeriFulQPM8cmXUfBNPFO1qzge
	D+b9GLTJFHO5FDyokvdvpseKHuCuCVi7byYLtl2hH0pZyoxW5GVclgifJMtLFrw7z6N1WxJzq66
	cK6W+z+wuzDmq2eGS5yiF4dyfRPH0z7jG4H6XkiHsy2QkK1WRD4dadIvnPRM6/UySU8AV5hLSVa
	bx+7XFbayViSV34A/ox3VS9vfrrn7S3DL0Bb8tPedcBnyrr5l+vhh55qvwUgHgowBYALbKSNgAs
	sR1Ip6yMHDqsrA6wpUpEZcGZqzxw7twKqVG59d93Ix5WLLVgppmV3EfHfYWjIsE10NtU8Vf/4Mk
	WJlpV80abwjbw87iDnHJ9cdl4oKqdF4j4qx/iHLwvt4jFLDikHFoE4JY8vtL/F0QYtzyq1rl/3R
	BG9TME2cfzgVgi2auDhJ8mPNqZVgAOKEytum62PRxbu+ArKDSny4ZZYiLyDUIhiRcBe4w+RQQ6t
	FeZFqIm80SM+ybDDbjbz+dSx/+bqWM=
X-Received: by 2002:a05:6a00:3496:b0:89f:d254:7c74 with SMTP id d2e1a72fcca58-8a2c626f0e5mr1262068b3a.9.1792738444266;
        Thu, 22 Oct 2026 23:54:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:54:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 09/29] bit7z: Avoid 64-bit atomics in BufferQueue
Date: Thu, 22 Oct 2026 23:53:30 -0700
Message-ID: <20261023065350.3228996-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131333
Content-Type: text/plain; charset="utf-8"

BufferQueue keeps its memory usage counter in a std::atomic<uint64_t>,
which riscv32 lowers to __atomic_*_8 libcalls, so programs linking the
static libbit7z, such as the ptest binaries, fail to link:

  ld.lld: error: undefined symbol: __atomic_fetch_add_8
  ld.lld: error: undefined symbol: __atomic_fetch_sub_8
  ld.lld: error: undefined symbol: __atomic_load_8

Add a patch that uses a std::size_t counter instead. It sums the sizes
of in-memory buffers, so it always fits, and the atomic is lock-free on
every target, so no libatomic is needed.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-size_t-for-the-memory-usage-counter.patch | 46 +++++++++++++++++++
 meta-oe/recipes-extended/7zip/bit7z_4.1.0.bb  |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-extended/7zip/bit7z/0004-bufferqueue-Use-size_t-for-the-memory-usage-counter.patch

diff --git a/meta-oe/recipes-extended/7zip/bit7z/0004-bufferqueue-Use-size_t-for-the-memory-usage-counter.patch b/meta-oe/recipes-extended/7zip/bit7z/0004-bufferqueue-Use-size_t-for-the-memory-usage-counter.patch
new file mode 100644
index 0000000000..4dcc24f5b0
--- /dev/null
+++ b/meta-oe/recipes-extended/7zip/bit7z/0004-bufferqueue-Use-size_t-for-the-memory-usage-counter.patch
@@ -0,0 +1,46 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 21 Oct 2026 12:00:00 -0700
+Subject: [PATCH] bufferqueue: Use size_t for the memory usage counter
+
+BufferQueue::mMemoryUsage is a std::atomic<std::uint64_t>. On 32-bit
+targets without native 64-bit atomic instructions, such as riscv32, its
+operations become __atomic_*_8 libcalls, so every program linking the
+static libbit7z needs libatomic, and the tests fail to link:
+
+  ld.lld: error: undefined symbol: __atomic_fetch_add_8
+  >>> referenced by bufferqueue.cpp:21 (src/internal/bufferqueue.cpp:21)
+  ld.lld: error: undefined symbol: __atomic_fetch_sub_8
+  ld.lld: error: undefined symbol: __atomic_load_8
+
+The counter is the total size of the buffers currently held in the
+queue, i.e. a sum of std::vector::size() values of in-memory objects,
+so it always fits in a std::size_t. Use that type, which keeps the
+atomic lock-free on every target and removes the libatomic dependency.
+
+Upstream-Status: Submitted [https://github.com/rikyoz/bit7z/pull/344]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/internal/bufferqueue.hpp | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+--- a/src/internal/bufferqueue.hpp
++++ b/src/internal/bufferqueue.hpp
+@@ -13,6 +13,7 @@
+ #include "bittypes.hpp"
+ 
+ #include <atomic>
++#include <cstddef>
+ #include <condition_variable>
+ #include <queue>
+ #include <mutex>
+@@ -49,7 +50,9 @@
+         std::condition_variable mEmptyCondition;
+         std::condition_variable mFullCondition;
+         std::atomic_bool mFinished{ false };
+-        std::atomic< std::uint64_t > mMemoryUsage;
++        // Size of the queued in-memory buffers, so it always fits in a size_t,
++        // which keeps the atomic lock-free on 32-bit targets as well.
++        std::atomic< std::size_t > mMemoryUsage;
+         std::uint64_t mMaxMemoryUsage;
+ };
+ 
diff --git a/meta-oe/recipes-extended/7zip/bit7z_4.1.0.bb b/meta-oe/recipes-extended/7zip/bit7z_4.1.0.bb
index d0693cc5f1..77f82c743e 100644
--- a/meta-oe/recipes-extended/7zip/bit7z_4.1.0.bb
+++ b/meta-oe/recipes-extended/7zip/bit7z_4.1.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48a3fe23ed1353e0995dadfda05ffdb6"
 SRC_URI = " \
     git://github.com/rikyoz/bit7z.git;protocol=https;branch=master;tag=v${PV} \
     file://0003-internal-replace-glibc-LFS64-names-with-portable-PO.patch \
+    file://0004-bufferqueue-Use-size_t-for-the-memory-usage-counter.patch \
     ${@bb.utils.contains('PTEST_ENABLED', '1', d.getVar('SRC_URI_PTEST'), 'file://0001-cmake-disable-dependency-inclusion.patch', d)} \
 "
 
