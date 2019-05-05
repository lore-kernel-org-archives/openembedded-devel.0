Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id ADE496BA93
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 May 2019 20:27:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44xy8X0FNPz4x
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 May 2019 22:27:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557088028;
	bh=ZuOuifBFK7EuSQcRBgLN8hNL+hhax6lyx786cxZgULE=;
	h=From:To:Subject:Date:From;
	b=sXIF6xgvDBHCz8PI8bh9Xplh8JVN12WqKUyOUW8yrDGRx4RkoI31DjhJY31up6sMA
	v01Bpfl3Hq+KBVUYWQupFH8yVX2kTi9Q6MW7/AaR6QwJkj8MvRR3BrtVCEsDw8LmRA
	/RbO4J3bVUCOVCjUBniYCpaak106wmBrFMof9o73WODFU/dnaWtmtHy1N8WlV+9YjM
	PX3PEqCIvqACWeY9iLwXTuezUFqpO6xrdcP3yjEskZ6JWzq47IK5Zm2mbbd1xHLYbI
	HaY1D6aV/x2pFmAoQ9I8qy3AUSB6Ve7ZPrHe9J+xs/C+M13qDUZXXOM8nkG9jzJkuK
	xEUl9r4Qb1jS1hv8chI1vUxyGsauSW1eW/Ws6yqBY1vAg6ZyU7kyPCnbGsqiZfTXJd
	GPJ9Ny2DVdGWAFBf2jqmpwgDBjSubA+soXn4Ky0vbnDI8Oh22t+txthM9RpWelwraM
	dUx10zs5Jx0V0eIv3xL8o1rreleCtVA/CT7TFAJH94/VT+pJ6i9sEW4gb6JmEXRs3m
	wGADCb+7K91UZLSpKBgW1UAZtjhMwbyeTGe9sfkPpM0OfMaZQqwQbVg3dyU7fIalB5
	FJ4xkXsx7GNVkX4WTlJHqW1HZWOp6FrcJc9/zf7Jx5UYrWuC3EVRk+xlVbbCeNtflQ
	aOL3hfVUcIC36G3BPzsrpwWI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 May 2019 23:27:07 +0300
Message-Id: <20190505202707.25756-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] efivars: Drop workaround patch for host gcc < 4.7
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
X-List-Received-Date: Sun, 05 May 2019 20:27:08 -0000

The -flto change already disappeared in an earlier update.

-std=gnu11 and -Wmaybe-uninitialized are supported by gcc >= 4.7,
which covers all host distributions that are still supported.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...ix-compile-failure-with-host-gcc-4.6.patch | 43 -------------------
 meta-oe/recipes-bsp/efivar/efivar_37.bb       |  2 -
 2 files changed, 45 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch

diff --git a/meta-oe/recipes-bsp/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch b/meta-oe/recipes-bsp/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch
deleted file mode 100644
index dbc9a5755..000000000
--- a/meta-oe/recipes-bsp/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 3edce6a0019bcb90febc1f654b5b2e2bad5c59bd Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 26 May 2016 21:50:01 -0400
-Subject: [PATCH] fix compile failure with older host gcc (<=4.6)
-
-While host gcc version is 4.6.3 in ubuntu 1204, it
-did not recognize -std=gnu11 and -Wmaybe-uninitialized.
-
-While host gcc version is 4.4.7 in centos6, it
-did not recognize -std=gnu11, -Wmaybe-uninitialized,
-and -flto.
-
-For native build, use -std=gnu99 to replace -std=gnu11,
-and directly remove -Wmaybe-uninitialized and -flto.
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- gcc.specs | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gcc.specs b/gcc.specs
-index 45d43d1..f1c6944 100644
---- a/gcc.specs
-+++ b/gcc.specs
-@@ -2,13 +2,13 @@
- + -D_GNU_SOURCE
- 
- *efivar_cpp_options:
-- -Werror -Wall -std=gnu11 -Wextra
-+ -Werror -Wall -std=gnu99 -Wextra
- 
- *cpp_options:
- + %(efivar_cpp_options)
- 
- *cc1_options:
--+ %(efivar_cpp_options) -Wmaybe-uninitialized -fno-merge-constants -fvisibility=hidden %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}}
-++ %(efivar_cpp_options) -fno-merge-constants -fvisibility=hidden %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}}
- 
- *self_spec:
- + %{!shared:%{!static:%{!r:-pie}}} %{static:-Wl,-no-fatal-warnings -Wl,-static -static -Wl,-z,relro,-z,now}
diff --git a/meta-oe/recipes-bsp/efivar/efivar_37.bb b/meta-oe/recipes-bsp/efivar/efivar_37.bb
index 8a56e7adc..87f5df423 100644
--- a/meta-oe/recipes-bsp/efivar/efivar_37.bb
+++ b/meta-oe/recipes-bsp/efivar/efivar_37.bb
@@ -19,8 +19,6 @@ SRC_URI = "git://github.com/rhinstaller/efivar.git \
 SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch \
                                 ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'file://0004-fix-unknow-option-for-gold-linker.patch', '', d)} \
                               "
-SRC_URI_append_class-native = " file://fix-compile-failure-with-host-gcc-4.6.patch \
-                              "
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


