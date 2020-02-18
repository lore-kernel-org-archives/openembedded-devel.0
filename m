Return-Path: <leo.yan@linaro.org>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id B064461586
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 05:26:19 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id i6so10060951pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 21:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=RXQZyju8s/BCy9jl4jYBupEPem32BP8kTqnefLJNOQ0=;
	b=yj20Ilx8p6r1di1m9LgBr5pp/MJXoLI22ujVlXHCyVC3cDYUYpa9jIhZ3NaPp+UYi3
	qwfNKpNR7143wLdiaiCD+wevWD3mnXkYL0ET02Hvlaqq3LF/urvfoo0NXTXT4AzFpYHV
	MNR2N2pv5hjAZzNs0X2r84T++EehU05HqvpGoG5STKZvJj0hSwdSCnKW0M3zMIJv5pC7
	jv3SQvAwNkrtcC8Zf3GxTk0Asyt5pnA9UvyxcTP6WDI6bd/E0pOKAx1uN1VHBWyQsJXr
	0uSOEEBqaCD2UAkaFGTWYd/6QhkUA0pJhqmHdGfCWZtNNi0SvLTrBqS9ZZBEywkkbfdN
	9lTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=RXQZyju8s/BCy9jl4jYBupEPem32BP8kTqnefLJNOQ0=;
	b=fqKo7GMYLo7qVJc8EP1NiW0cMKQlbCYVRW8F05gH68XVyikq8srziMKUTHNrubhqv8
	ljlmEE429/lZ3QWmLGJzxR/kmmjdJDiBCpsuvKix7L/VxPhwswkUyApmdfDc0lVBFJ56
	caUmZsr7dBSgNIX89NWeOTzIz2LJz96dye41HnhM5rRDKKWeVjhgL3iWwpXJQmotpPvw
	Ew7gDsn0H5jNixlQsb1qD/KwdcYw9pAoeodcFgVwd7xktmtRIKLs/ZDpOShApfCaM2Ts
	qDbD2ylh2QfI5jMX2l9jHwLdtuaNSx79SYPVxS5I5ZPnhvJg0PCQKlfSXRbnrbSERkJz
	XLKg==
X-Gm-Message-State: APjAAAUjBYPHdQ5gmMiplzipFsRh3VswqNK8pdNzk7okcALbu8Oc4k7U
	Irh8LbY22pB090bPjZofprqBWiz1gs7wag==
X-Google-Smtp-Source: APXvYqzaTRYPLt3BwiYw0bPebXfwKM+76o5z6zELrHQcW/LR6Xf4YwZhN5vGezAOqJ4U3LbbTkrj4w==
X-Received: by 2002:a63:cf41:: with SMTP id b1mr20724348pgj.53.1582003580484; 
	Mon, 17 Feb 2020 21:26:20 -0800 (PST)
Received: from localhost.localdomain (li1441-214.members.linode.com.
	[45.118.134.214])
	by smtp.gmail.com with ESMTPSA id z4sm2214427pfn.42.2020.02.17.21.26.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 21:26:20 -0800 (PST)
From: Leo Yan <leo.yan@linaro.org>
To: openembedded-devel@lists.openembedded.org,
	Sumit Garg <sumit.garg@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>
Date: Tue, 18 Feb 2020 13:25:43 +0800
Message-Id: <20200218052544.9467-4-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218052544.9467-1-leo.yan@linaro.org>
References: <20200218052544.9467-1-leo.yan@linaro.org>
Subject: [meta-oe][PATCH v1 3/4] BCC: Add build recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Feb 2020 05:26:19 -0000

From: Sumit Garg <sumit.garg@linaro.org>

BPF Compiler Collection (BCC) is a toolkit for creating efficient kernel
tracing and manipulation programs, and includes versatile tools and
examples which based on eBPF.  This tool is very widely used on server
section, but we also can use it for embedded system, e.g. use its
function trace utilities (trace.py and argdist.py) to trace kernel
function parameters and return values.

This patch adds recipe for BCC version 0.12.0.  This patch also contains
a patch to change cmake file so can look for libraries and headers which
are installed in target sysroot-recipe path for cross compilation.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Co-developed-by: Leo Yan <leo.yan@linaro.org>
---
 ...-with-OE-LLVM-cross-compiled-package.patch | 32 ++++++++++++++++
 meta-oe/recipes-devtools/bcc/bcc_0.12.0.bb    | 37 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/bcc/bcc/0001-Allow-to-build-with-OE-LLVM-cross-compiled-package.patch
 create mode 100644 meta-oe/recipes-devtools/bcc/bcc_0.12.0.bb

diff --git a/meta-oe/recipes-devtools/bcc/bcc/0001-Allow-to-build-with-OE-LLVM-cross-compiled-package.patch b/meta-oe/recipes-devtools/bcc/bcc/0001-Allow-to-build-with-OE-LLVM-cross-compiled-package.patch
new file mode 100644
index 000000000..b5acadc1b
--- /dev/null
+++ b/meta-oe/recipes-devtools/bcc/bcc/0001-Allow-to-build-with-OE-LLVM-cross-compiled-package.patch
@@ -0,0 +1,32 @@
+From 93cf25ba663e68a6a6f4237fbe0ef8349b3f37ef Mon Sep 17 00:00:00 2001
+From: Sumit Garg <sumit.garg@linaro.org>
+Date: Fri, 14 Feb 2020 07:40:11 +0000
+Subject: [PATCH] Allow to build with OE LLVM cross compiled package
+
+The default LLVM cmake package requires all libraries, headers and tools
+to be present but in case of cross compilation, OE only provides
+target specific libraries and headers and requires native llvm tools.
+
+So instead of looking for a complete llvm package, look for libraries and
+headers which are installed in target sysroot-recipe path.
+
+Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
+---
+ CMakeLists.txt | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7bd0f3b2..6f1f12c0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -39,8 +39,6 @@ endif()
+ if(NOT PYTHON_ONLY AND ENABLE_CLANG_JIT)
+ find_package(BISON)
+ find_package(FLEX)
+-find_package(LLVM REQUIRED CONFIG)
+-message(STATUS "Found LLVM: ${LLVM_INCLUDE_DIRS} ${LLVM_PACKAGE_VERSION}")
+ find_package(LibElf REQUIRED)
+
+ # clang is linked as a library, but the library path searching is
+--
+2.17.1
diff --git a/meta-oe/recipes-devtools/bcc/bcc_0.12.0.bb b/meta-oe/recipes-devtools/bcc/bcc_0.12.0.bb
new file mode 100644
index 000000000..687fb64c7
--- /dev/null
+++ b/meta-oe/recipes-devtools/bcc/bcc_0.12.0.bb
@@ -0,0 +1,37 @@
+SUMMARY = "BPF Compiler Collection (BCC)"
+HOMEPAGE = "https://github.com/iovisor/bcc"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
+
+DEPENDS += "bison-native \
+            ninja-native \
+            elfutils-native \
+            flex-native \
+            ${MLPREFIX}elfutils \
+            ${MLPREFIX}binutils \
+            ${MLPREFIX}flex \
+            luajit \
+            clang \
+            "
+
+RDEPENDS_${PN} += "bash python"
+
+SRC_URI = "git://github.com/iovisor/bcc \
+           file://0001-Allow-to-build-with-OE-LLVM-cross-compiled-package.patch \
+           "
+SRCREV = "368a5b0714961953f3e3f61607fa16cb71449c1b"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE = " \
+    -DCMAKE_INSTALL_PREFIX=/usr \
+    -DENABLE_LLVM_SHARED=ON \
+    -DENABLE_CLANG_JIT=ON \
+    -DENABLE_MAN=OFF \
+    -DLLVM_PACKAGE_VERSION=${LLVMVERSION} \
+    -DPYTHON_CMD=python3 \
+"
+
+FILES_${PN} += "${libdir}/python*/dist-packages"
-- 
2.17.1


