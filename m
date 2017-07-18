Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id A07AD77F7D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 10:05:47 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id p11so1264229lfd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=UcPAZtD9juRzaTIjkllW2A57EpOLdAjnkGIqUT/bi+c=;
	b=tFyY3/Q8ccmrO/0LnmVYJNdMCEoE5BDm6Mf0C8pYnvyPGKDDHisQj+LFF5tqKfcEnt
	+A+ppiBTCz5KZN9RDnF1zhck/vELDj88zyXc9yR0XONP0E64LJMR8BjgxW4a7QxGtcQ2
	SJa0GtxRbJsO02Mol9vLzUXXvPaIVjdfVAItHw1Ow1+rHtrsMLW4U3QDPVcIBU0OFlT2
	vQLMq0RiWyq/2zXXRQwx8D7jwMDDP96EomNRtTXVm1j8HjKDcfeUIjzO2J6Gl6BqL4aS
	wSOk9HdVwCKRpyNbNvy5MdXeLhrxcZ+MQTLiCsikpuhjXWWIuSxP1LHvMYqHz4jXDcpT
	kyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UcPAZtD9juRzaTIjkllW2A57EpOLdAjnkGIqUT/bi+c=;
	b=C5kDkzOZQjoGNowi77QEJOBnuV+ivK3ejFJAc0jv21R3QxqRRbof5alteFDAKju0YS
	Q6pfDL3ecHuGrVpRUMIXqiuY7NE5eVya6tAAYJDfeIewNnubo5CEwrhuQ8EtpaLXvlyW
	uoWfEPPFm05aefdci9AS5fMYRY/3jJKKZnYutqCY01vsxXjjOM0sbF+z9V5yk518JVf8
	zuKtWrRcSHL2+u9N7lzTEy/kyfXL1wVG+CmUub/xY3f8dgsPtl8r1nLlAZdUV/WOJTuJ
	5tnS8PMau6XARk7coeN3Jvw+ZWorCAAFK5/WQHQd7JAAb5o2dgCJuEc2WuBnSDs09+IG
	bQEA==
X-Gm-Message-State: AIVw111X6vNz7HWGdLSY8mD5REV1QTbsObGsACXWXXft5QJ0KwwOcLZn
	Y6Kzyy1xSz6Zhbb7IHU=
X-Received: by 10.46.0.170 with SMTP id e42mr408100lji.25.1500372347914;
	Tue, 18 Jul 2017 03:05:47 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id j12sm455132lfh.23.2017.07.18.03.05.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jul 2017 03:05:46 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jul 2017 12:05:38 +0200
Message-Id: <20170718100541.2916-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-clang][PATCH] clang: Allow user to add extra build target on class_target
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
X-List-Received-Date: Tue, 18 Jul 2017 10:05:47 -0000

Originally TARGETS_TO_BUILD was limited to the target architecture,
which is not enough to build code for heterogenous systems such as (in
my case) AMDGPU.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 recipes-devtools/clang/clang_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-devtools/clang/clang_git.bb b/recipes-devtools/clang/clang_git.bb
index 01ad644a01a5..6c7de15c480b 100644
--- a/recipes-devtools/clang/clang_git.bb
+++ b/recipes-devtools/clang/clang_git.bb
@@ -62,6 +62,9 @@ PACKAGECONFIG[libcplusplus] = "-DCLANG_DEFAULT_CXX_STDLIB=libc++,,libcxx"
 LLVM_TARGETS_TO_BUILD ?= "AArch64;ARM;Mips;PowerPC;X86"
 LLVM_TARGETS_TO_BUILD_append = ";${@get_clang_host_arch(bb, d)};${@get_clang_target_arch(bb, d)}"
 
+LLVM_TARGETS_TO_BUILD_TARGET ?= ""
+LLVM_TARGETS_TO_BUILD_TARGET_append ?= "${@get_clang_target_arch(bb, d)}"
+
 EXTRA_OECMAKE="-DLLVM_ENABLE_RTTI=True \
                -DLLVM_ENABLE_EH=True \
                -DLLVM_ENABLE_FFI=False \
@@ -84,7 +87,7 @@ EXTRA_OECMAKE_append_class-target = "\
                -DLLVM_ENABLE_PIC=ON \
                -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
                -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
-               -DLLVM_TARGETS_TO_BUILD=${@get_clang_target_arch(bb, d)} \
+               -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS_TO_BUILD_TARGET}' \
                -DLLVM_TARGET_ARCH=${@get_clang_target_arch(bb, d)} \
                -DLLVM_DEFAULT_TARGET_TRIPLE=${TARGET_SYS} \
 "
-- 
2.13.2


