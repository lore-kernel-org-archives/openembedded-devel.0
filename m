Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id C28DE60859
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 02:41:03 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id m7so1800106pjs.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Feb 2020 18:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kSUdzmNjH2oN9PGu6KC1Zltv71wZuBTVx/RefMDpEfo=;
	b=MNY9+wy5fncDOZ7h0uUdTIt1VfjxRpxovjU1c0RbBPorf43swklabhikr5E0TTj5BY
	P2z+Wglnb3ts0bprVJgc022LRPYv7cGVk37O8rTPWnG4LrZviPDrq3FGhUTpiAWgEAqC
	/25XGG0S+vFhDHyKvaRcCLVLUW+16mg6UdQOUZ5FzC6KJNMqJwcRHhyLMMC1U2ohR04q
	c6G0hPkNmQpX+lYxcFe6Aog0G/qigyDcjLLwMfPiKMIo6FujSu20MQiQIKaS2CM0+kt1
	1AD46dxGnLKNEP09SfpfUppxYx//vb7DyFyGK/yIOA/kWmIN7k0cdznTq5rCGhzWGP2i
	Dy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kSUdzmNjH2oN9PGu6KC1Zltv71wZuBTVx/RefMDpEfo=;
	b=bJN7SogFZR6/nrEBPGIIp6WqpQiBQFkH9Ds+zjax6+DXb1P6SAiZD5q/Y8jscSf3eL
	b9M5fntLsKKoXPj4rd71KYko9j6k8mP5I/8PRGNLGjURECLtAoL0nILDQeYW2irSBjVO
	ahMQ+DMjAcLz6Ny4+yopEIaM3hjqBkAKJkmormjmPv3yAN5wy/8uCR11R31+jqYTkz2h
	VdlEbc063ULAJI27ZwqTzsthLkQiy/s7YzzfkjGUSQXoq7J3XrbMpX0hhYerIlPP+krS
	dIyJw/bDXsq8uyoirZVypWabWKd2dgtrzR3rEBXk5foHaDdE13GmBmAig4qa4ktgz/TO
	EY4g==
X-Gm-Message-State: APjAAAUb+2HDeRXEZheiCvMzVjh/XCcL0vACDjw8E49f++z5GBu+Yqr3
	culK39VXP1E+jDimWV5s6PyY5SdxmeI=
X-Google-Smtp-Source: APXvYqwMpu0nq1y3Kn3CVUEtRb8pxPApQ7a6hOqGWcw2bkMG44vov1biYIAq8cB2BBZ04ezk15AaCg==
X-Received: by 2002:a17:902:aa98:: with SMTP id
	d24mr14347667plr.106.1581907264447; 
	Sun, 16 Feb 2020 18:41:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	p16sm14308250pgi.50.2020.02.16.18.41.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 18:41:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Feb 2020 18:41:05 -0800
Message-Id: <20200217024105.1105597-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] abseil-cpp: Fix build on risc-v
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
X-List-Received-Date: Mon, 17 Feb 2020 02:41:03 -0000
Content-Transfer-Encoding: 8bit

Port GetProgramCounter to support risc-v program counter

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d-RISCV-support-to-GetProgramCounter.patch | 29 +++++++++++++++++++
 .../abseil-cpp/abseil-cpp_git.bb              |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Add-RISCV-support-to-GetProgramCounter.patch

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Add-RISCV-support-to-GetProgramCounter.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Add-RISCV-support-to-GetProgramCounter.patch
new file mode 100644
index 0000000000..95ec070f6c
--- /dev/null
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Add-RISCV-support-to-GetProgramCounter.patch
@@ -0,0 +1,29 @@
+From 983eeae0792946fe5c090f95164c892ec6db5cc4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 16 Feb 2020 16:22:53 -0800
+Subject: [PATCH] Add RISCV support to GetProgramCounter()
+
+Identify PC register from signal context
+
+Upstream-Status: Submitted [https://github.com/abseil/abseil-cpp/pull/621]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ absl/debugging/internal/examine_stack.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/absl/debugging/internal/examine_stack.cc b/absl/debugging/internal/examine_stack.cc
+index 4739fbc..fb77450 100644
+--- a/absl/debugging/internal/examine_stack.cc
++++ b/absl/debugging/internal/examine_stack.cc
+@@ -53,6 +53,8 @@ void* GetProgramCounter(void* vuc) {
+     return reinterpret_cast<void*>(context->uc_mcontext.gp_regs[32]);
+ #elif defined(__powerpc__)
+     return reinterpret_cast<void*>(context->uc_mcontext.regs->nip);
++#elif defined(__riscv)
++    return reinterpret_cast<void*>(context->uc_mcontext.__gregs[REG_PC]);
+ #elif defined(__s390__) && !defined(__s390x__)
+     return reinterpret_cast<void*>(context->uc_mcontext.psw.addr & 0x7fffffff);
+ #elif defined(__s390__) && defined(__s390x__)
+-- 
+2.25.0
+
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index 77afba8de9..4d1636107e 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH}                \
            file://0001-Remove-maes-option-from-cross-compilation.patch        \
            file://0002-Add-forgotten-ABSL_HAVE_VDSO_SUPPORT-conditional.patch \
            file://0003-Add-fPIC-option.patch                                  \
+           file://0001-Add-RISCV-support-to-GetProgramCounter.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.25.0


