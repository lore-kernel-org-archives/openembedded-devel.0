Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id E6B6F7FCEF
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Nov 2019 01:01:48 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id q26so8120346pfn.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2019 18:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lJefjT0JqEGekG5ppVmNLIMl6xIogQC2fWKRXIp61mw=;
	b=GearqNv1FcNbMCvXm6hw0XWzRIdpaZ1c7+GvXBOb3G+rq1Us8IjP/cQ3j8VNBMau0B
	hLSTL3s0W1PiDPpkB+T3VSIBvIBao2qR1ZiJfL1lOoDtiXop6OqsQ5eZm2kdTU1tDW61
	P8viGcdRp56IM+gML+doJ/kdVNlT0+6AbuClHEQmjU5eAVE5m2HXenkKE9h74nei6Ceh
	00DoRPZ7aR+vBjhn4ho0gnMk5w9UNJRBkCnOOkJzEGnn9vI6x5Gvu/k00yFQr0bPsquf
	DmZfVdLVQIAsmI4Cdb3S+8rya2DGGQyFzSY+9GhXiIJp5v6VOCTCFwQZAwPxfQylF/Bj
	T2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lJefjT0JqEGekG5ppVmNLIMl6xIogQC2fWKRXIp61mw=;
	b=ZiEdlyZnF88jEzPgwxG8hs829wRbE4ZRJRIx8cdCRnd1xlhMoZsciIjPj19ZXxCEaX
	/H40qcp8gSZ24nvVfUgzhqFeqjpoATIMYSC0Qj5BEJtivSGXqCixjVMCw9S0Qja5LKxJ
	VZYxMRwJIaJTH0e+qeto+gqI2pP7rNz+W9//1MyfXxd9i7gSfizYGYJMlavsEB/8ispt
	B1UW3EnncVygK9QLChwXNQeenlVWTkMj4BnqetdTIX6rcuuzTMVzjQVBWIJPv0yweIDR
	dX3HERFyLfefCpXyKVbzxWrmlkc+aWLU9UK5ElVAACOf+h1UyRMTMqfDvbEvqf0WSJiN
	rr6g==
X-Gm-Message-State: APjAAAUbHJVfFdPl2BCxPUL8TxSfcOzk6pWYGVzRvTY3QyzdjDgTaymU
	eYnpeuWU40Cqk73FQjivLlrI0N0WgDM=
X-Google-Smtp-Source: APXvYqw4tV8tj1ToU3rUzKCZAL+p9aGF/Ai/og9sv7kabc899GnZVZVfJGR2X4tx++OflnKXq+ESng==
X-Received: by 2002:a63:69c9:: with SMTP id
	e192mr17260834pgc.271.1572656509141; 
	Fri, 01 Nov 2019 18:01:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::f974])
	by smtp.gmail.com with ESMTPSA id
	d2sm2416862pfo.106.2019.11.01.18.01.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 01 Nov 2019 18:01:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Nov 2019 18:01:34 -0700
Message-Id: <20191102010134.3797423-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] poco: Fix build on risc-v
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
X-List-Received-Date: Sat, 02 Nov 2019 01:01:49 -0000
Content-Transfer-Encoding: 8bit

Patch fixes following error

TOPDIR/build/tmp/work/riscv64-yoe-linux-musl/poco/1.9.4-r0/git/Foundation/src/utils.h:76:2: error: Target architecture was not detected as supported by Double-Conversion.
 ^
1 error generated.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ble-operations-when-using-double-flo.patch | 28 +++++++++++++++++++
 meta-oe/recipes-support/poco/poco_1.9.4.bb    |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/poco/poco/0001-riscv-Enable-double-operations-when-using-double-flo.patch

diff --git a/meta-oe/recipes-support/poco/poco/0001-riscv-Enable-double-operations-when-using-double-flo.patch b/meta-oe/recipes-support/poco/poco/0001-riscv-Enable-double-operations-when-using-double-flo.patch
new file mode 100644
index 0000000000..c0de32dafe
--- /dev/null
+++ b/meta-oe/recipes-support/poco/poco/0001-riscv-Enable-double-operations-when-using-double-flo.patch
@@ -0,0 +1,28 @@
+From 589a5442a841b156a1890bc2d26e7a5103e2f672 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 1 Nov 2019 17:53:50 -0700
+Subject: [PATCH] riscv: Enable double operations when using double float abi
+
+Upstream-Status: Submitted [https://github.com/pocoproject/poco/pull/2825]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Foundation/src/utils.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Foundation/src/utils.h b/Foundation/src/utils.h
+index 69cea1aca..ff7a5c9ce 100644
+--- a/Foundation/src/utils.h
++++ b/Foundation/src/utils.h
+@@ -63,7 +63,8 @@
+     defined(__SH4__) || defined(__alpha__) || \
+     defined(_MIPS_ARCH_MIPS32R2) || \
+     defined(__AARCH64EL__) || \
+-    defined(nios2) || defined(__nios2) || defined(__nios2__)
++    defined(nios2) || defined(__nios2) || defined(__nios2__) || \
++    (defined(__riscv) && defined(__riscv_float_abi_double))
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
+ #if defined(_WIN32)
+-- 
+2.23.0
+
diff --git a/meta-oe/recipes-support/poco/poco_1.9.4.bb b/meta-oe/recipes-support/poco/poco_1.9.4.bb
index 212abe29bb..c854481de3 100644
--- a/meta-oe/recipes-support/poco/poco_1.9.4.bb
+++ b/meta-oe/recipes-support/poco/poco_1.9.4.bb
@@ -11,6 +11,7 @@ DEPENDS = "libpcre zlib"
 SRC_URI = " \
     git://github.com/pocoproject/poco.git;branch=poco-${PV} \
     file://0001-Don-t-try-to-install-non-existing-Encodings-testsuit.patch \
+    file://0001-riscv-Enable-double-operations-when-using-double-flo.patch \
     file://run-ptest \
    "
 SRCREV = "b95393dcc3640807838e8323b4e600e54d2e8116"
-- 
2.23.0


