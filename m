Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4934677ECB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 09:50:58 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id t72so1240901lff.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 02:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=UcPAZtD9juRzaTIjkllW2A57EpOLdAjnkGIqUT/bi+c=;
	b=iuPFXACF5XUtMUliIqlwprV6ZK0SSqiqwEAlxTzerEZkllTw+dCJCmsXt7279Nx5Dg
	/23MAfAj1kwX35V7Pc+BHkjkgAm7bP1wuf/xopbDbubkVadt3TlUBOyKmCdq++o5030p
	vAI1BlgiasfzuWBlzc4skgagGu9XXae/UW7TJxY2BtJ5S2l4eDkUm9j7Rw3uH/d0ALFu
	0Y6+MyUC84xCrCK3HHcXo3LfVLLbBWx5SQDZfgyAw8ukUsGkKhLymV3kty6Zf4vVBcM5
	HVIi8dSXBwqjy4Fv7bTS5Bka2PTJf+K2PPxNo04+F9wJXq+j5QmbaJ4PgKp53wUqc21W
	pBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UcPAZtD9juRzaTIjkllW2A57EpOLdAjnkGIqUT/bi+c=;
	b=gx7XPnE9YNy4z1aYEUQ6Ct3vozdmuinafrCLiAYuO/TVLAQKbygFipaEo2M8M1hu2U
	sgzQ4cpLAwkQHC9dAdnWcHYklAGXcGKMGnw4Dd6pXsC/WtMFjH1h6//kXJrR1kxbuhCl
	BjAlF9WCIW4dNWWuVdB9dhn9YAzrTCSJrgZ9n6txS8h5EYbf8HyJhoKi3VC+wAWKN6H5
	G3VZ8sgRyzFHerNwvVKMU+pPYiLHGP+MR335d+yWfCtg59Ylj+w3A4LFfw4PwYkO4xvS
	gFQEIxyGNPeFZn58714PFfWvvJAbFvCliwojrdOUt0mOiSluG4+bZvAt2rQDnq93Uztw
	/9mg==
X-Gm-Message-State: AIVw110s8YsKp9IpEplTkhuMpC7RgKGvClBqSPxOux8sHN4pL+csHGME
	XKF+AOeYMnrvWMjFU00=
X-Received: by 10.46.77.197 with SMTP id c66mr328389ljd.71.1500371459358;
	Tue, 18 Jul 2017 02:50:59 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id x62sm441459lfa.13.2017.07.18.02.50.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jul 2017 02:50:58 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jul 2017 11:50:52 +0200
Message-Id: <20170718095055.32249-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH] clang: Allow user to add extra build target on class_target
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
X-List-Received-Date: Tue, 18 Jul 2017 09:50:59 -0000

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


