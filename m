Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1642.1792738440091656266
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=h8A//gEp;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a058f74a54so217894b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738439; x=1793343239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5K1mCmUg8UObwcuCBIi6BeQb2BVKbuIPAzwVXyr8TVY=;
        b=h8A//gEpCBu0EcOVyWixd9V3t1pRnikVVWihtcDa3HIym7HGC7dMbzDA9uP/+is4de
         1WAODny1qK63H3PRPf/x+iK/kYA7MsKcG6EnkfY+WWG8nPh6O8/ts4SO79MX0a7Spr5p
         UIGre2knKj8kmedTecMSH/Ef7uMpzaNrGObpC8bzCV4yL4hxG/iR0j1mOjuEz3djTBxI
         DBYETem+l4CH02dS4dQOUa9aPFY5aszVRUX1zWQ9Zol9NdzVsu5ycQCLqiB5azRdFeaR
         NVkaBwG53QY+fE7EzNH0BgSKHG0zel1ShfpjoHT/YjLXCPBCk/zRLj0rMxs6ybJTWBJc
         463A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738439; x=1793343239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5K1mCmUg8UObwcuCBIi6BeQb2BVKbuIPAzwVXyr8TVY=;
        b=fQ4Z1ESwue4e80njJPFUAGl3CE4lvCnOarZFNYjFIFWz9uKhx+/uvZ003uMyMRzXu/
         njsyF5D9D2uprCGNWI7MbkiALf1bp1q9IkJlPnDqgMTrdKGuvFXTHlRUDP6xLftzkD2h
         QUmXtWmqCULuoCnriKe+39GVxUwZVgURto1nGS40vwitMlTkSiuEJ1boKeG+lSCTQBl6
         NF8zB7dEeCB1t95c5aLC0CfyUXoMYM5di2uSrTv9wZsLpaQ1GwqTxSJO/m3T0n/7LQa0
         7PdioMY9tjUB46u/X0rHCkPr34ouqy/bR4DJVhlPtM1g+15r26KulLv/570cuiux57LH
         b8tQ==
X-Gm-Message-State: AFq9FYI8Zbhm3qBXKB0CVfl9J+yR6LR0fv9Tms6DRzDGyI8kHJpnAAfW
	zBHSQ0AKP2+lg1nMB04l8ccQwWCqEzcCdrkbAzgv1GHIyhlR7cxAGcR9cWPbD59eiFI=
X-Gm-Gg: AYBFou23hSCMTfCdgQoEiJ3ZB8lMx6Q7zSNApx//vGLMXw/P+tLLyI1GYOHzwdfdW4m
	JW2KzxIrXDX817FvmqSL3QQ2DboLjaTtbo0OZPBvsvnvrU/TSoU2T18NnLgBJkMMvE+boJfqM+M
	yndZgwYNY6/X+wOtgZi4+ldf8QPfSLrFgun+bMo4PtzZ9y1sMqelSsHI1YfQS/wX0nTMo4/JmkH
	VDES+CTwXWqYBdsyQAg9SVDRm9CE/7pZGQSR9VGceOeOFiXLIJvA7Gu4WG45TZzp8sVkqG03wfy
	6lSSqg71tF+Ar+orNnKN/GvFefST/fv/qLc/EzU+mOPKDBrBuHkVltwcRiC9+cY0ca3uLMe6luz
	ND721W78uOHYapOvlyi7ixeMae4ZI6mA+fY/fZwscFWe7RMc2qLShhw76H+k5dVyGJPxoLG5aLk
	ba/04dw2tl1wsiv0DSIW7PLGBKlGluhmFTi/4pHlaCBNj96zB4wRi4/NvA8CvfuBQI/cieOByvZ
	WhiwmRYX0v14HeYOIJa/06aMKdiwy7XUdvhCz9XTQEwFpoHqN0S0ulC6wN0+l2frpCKRZFMNKuf
	BeWR5t60gLvUSt8lqxJE5sQQnj6Vc5CqvKM6EK7yl8fAuEuP405/VGWnUYLRxkQVr2i0Zzr+HMt
	V1cqOxmJrPeCc4bZiiXSMmndJyKxmiUoEvgq7uaUzour8QTq5u+dhjOn7r+ln17bswXZMvHnuFx
	LL06Jm9MvIBjtQHQVNW0mg7bkHeCIEB2idadC1SAzJeVryIcsHamZt4/Iloqmj8OflUY5d0z0OB
	WtfW6nhQAfwXZLxool5wMbZgInN3ZU=
X-Received: by 2002:a05:6a20:d529:b0:3e2:59b5:a68d with SMTP id adf61e73a8af0-3e37675088cmr1095072637.67.1792738439428;
        Thu, 22 Oct 2026 23:53:59 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:53:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 05/29] poco: Fix libatomic detection with optimized builds
Date: Thu, 22 Oct 2026 23:53:26 -0700
Message-ID: <20261023065350.3228996-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131329
Content-Type: text/plain; charset="utf-8"

CheckAtomic.cmake tests whether libatomic is needed with a program that
loads from a local std::atomic. With -O2 clang folds the load away, so
the check passes on riscv32 even though 64-bit atomics need libatomic,
and linking fails later:

  ld.lld: error: undefined reference: __atomic_fetch_add_8
  ld.lld: error: undefined symbol: __atomic_load_8

Add a patch that makes the test programs use a global atomic with a
read-modify-write operation so they cannot be optimized away.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-atomic-test-programs-from-being-opt.patch | 62 +++++++++++++++++++
 meta-oe/recipes-support/poco/poco_1.15.4.bb   |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-support/poco/poco/0004-CheckAtomic-Keep-atomic-test-programs-from-being-opt.patch

diff --git a/meta-oe/recipes-support/poco/poco/0004-CheckAtomic-Keep-atomic-test-programs-from-being-opt.patch b/meta-oe/recipes-support/poco/poco/0004-CheckAtomic-Keep-atomic-test-programs-from-being-opt.patch
new file mode 100644
index 0000000000..0cc17d7dbb
--- /dev/null
+++ b/meta-oe/recipes-support/poco/poco/0004-CheckAtomic-Keep-atomic-test-programs-from-being-opt.patch
@@ -0,0 +1,62 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 20 Oct 2026 23:30:00 -0700
+Subject: [PATCH] CheckAtomic: Keep atomic test programs from being optimized
+ away
+
+The libatomic checks load from a local std::atomic that never escapes.
+When CMAKE_CXX_FLAGS contain -O2, as distro builds usually do, clang
+folds the load to a constant, so the test program links without
+libatomic even on targets that need it for 64-bit atomics, such as
+riscv32. Poco_ATOMIC_LIBRARIES then stays empty and the build fails
+later when linking against PocoFoundation:
+
+  ld.lld: error: undefined reference: __atomic_fetch_add_8
+  ld.lld: error: undefined symbol: __atomic_load_8
+
+Make the atomic variables global and modify them with a
+read-modify-write operation that depends on argc, so the compiler has
+to emit the atomic operations at any optimization level.
+
+Upstream-Status: Submitted [https://github.com/pocoproject/poco/pull/5585]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ cmake/CheckAtomic.cmake | 18 ++++++++++++------
+ 1 file changed, 12 insertions(+), 6 deletions(-)
+
+--- a/cmake/CheckAtomic.cmake
++++ b/cmake/CheckAtomic.cmake
+@@ -8,12 +8,17 @@
+
+ # MSVC and Apple don't ship/need a separate libatomic.
+ if(NOT MSVC AND NOT APPLE)
++    # The atomic variables in the test programs are global and modified with
++    # a read-modify-write operation, otherwise the compiler can fold them away
++    # when optimizing and the check passes even though libatomic is needed.
++
+     # 1) 32-bit atomics
+     check_cxx_source_compiles("
+ 	#include <atomic>
+-	int main() {
+-	    std::atomic<int> x(0);
+-	    return x.load(std::memory_order_relaxed);
++	std::atomic<int> x(0);
++	int main(int argc, char **) {
++	    x.fetch_add(argc);
++	    return x.load();
+ 	}
+     " POCO_HAVE_CXX_ATOMICS32)
+
+@@ -28,9 +33,10 @@
+     check_cxx_source_compiles("
+ 	#include <atomic>
+ 	#include <cstdint>
+-	int main() {
+-	    std::atomic<uint64_t> x(0);
+-	    return (int)x.load(std::memory_order_relaxed);
++	std::atomic<uint64_t> x(0);
++	int main(int argc, char **) {
++	    x.fetch_add(static_cast<uint64_t>(argc));
++	    return static_cast<int>(x.load());
+ 	}
+     " POCO_HAVE_CXX_ATOMICS64)
+
diff --git a/meta-oe/recipes-support/poco/poco_1.15.4.bb b/meta-oe/recipes-support/poco/poco_1.15.4.bb
index f4c572d4ae..0751165267 100644
--- a/meta-oe/recipes-support/poco/poco_1.15.4.bb
+++ b/meta-oe/recipes-support/poco/poco_1.15.4.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/pocoproject/poco.git;branch=poco-${PV};protocol=http
            file://0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch \
            file://0002-DataTest-disable-testSQLChannel-test.patch \
            file://0003-quill-rdtsc-fallback-for-32-bit-powerpc.patch \
+           file://0004-CheckAtomic-Keep-atomic-test-programs-from-being-opt.patch \
            file://run-ptest \
            "
 SRCREV = "6a5667f432e1c5fe5591025ab03a2f8df37116b4"
