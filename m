Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E14DC352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 16:35:33 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.52713.1670344528845970723
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Dec 2022 08:35:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KGm7gZAL;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7E40C24000B;
	Tue,  6 Dec 2022 16:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670344527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8VBBmnaUVigotGC0Hq2Ne/zMNeEww06FtvZTSeOYUh0=;
	b=KGm7gZALHc/H43uJc3wxk5/VcxFRePoDgce70YUp8npPtjxA+P+PFCqDhOPaoiBD3r8euQ
	uOhBMsnjoaNNlxaHiPtY32eFST7/EXsRLMh9QLBBsyrAvGpjJuvHPqyW9y+bxvIlQ4paNY
	1VpSkvwEQF8nUUU0G+/xdjpTRtxQEmajohAwFiq6vSuioCMcMGAOo8dfpKsUqogzhLNMhU
	kMXcpDzO7p32fg4ieOooYVrx1qsoh7QAmbM7wfPOZuS6HzcQz8mwCiifmEnlEAf+rTxkxV
	wvosv7o/CoLfqeisR8o2QFgpmFDsnheI187t1PgI4uxtBZ7C4yP7tjiBo+pokg==
Date: Tue, 6 Dec 2022 17:35:26 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCHv4] mozjs: update 98 -> 102
Message-ID: <Y49vTjhk0Q1Szfkj@mail.local>
References: <20221127201345.23605-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221127201345.23605-1-f_l_k@t-online.de>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Dec 2022 16:35:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99960

Hello,

Without this update, meta-oe fails check-layer-nightly:

ERROR: Nothing PROVIDES 'mozjs-102' (but /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-openembedded/meta-gnome/recipes-gnome/gjs/gjs_1.75.1.bb DEPENDS on or otherwise requires it). Close matches:
  mozjs-91
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gjs', 'mozjs-102']

On 27/11/2022 21:13:45+0100, Markus Volk wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...001-Cargo.toml-do-not-abort-on-panic.patch |  11 +-
>  ...-autoconf-s-config.sub-to-canonicali.patch |   7 +-
>  ...rewrite-cargo-host-linker-in-python3.patch |  10 +-
>  ...ix-one-occasionally-reproduced-confi.patch |  10 +-
>  ...nfigure-do-not-look-for-llvm-objdump.patch |  13 +-
>  ...o-not-try-to-find-a-suitable-upstrea.patch |   9 +-
>  .../0004-use-asm-sgidefs.h.patch              |   9 +-
>  .../mozjs/mozjs-102/fix-musl-build.patch      |  27 ++++
>  .../{mozjs-91 => mozjs-102}/py-3.11.patch     | 128 ++++--------------
>  .../{mozjs-91 => mozjs-102}/riscv32.patch     |  27 +++-
>  ...zjs-91_91.13.0.bb => mozjs-102_102.5.0.bb} |  12 +-
>  .../mozjs-91/0005-nojit-32bit-arch-fix.patch  |  21 ---
>  .../mozjs-91/0006-Fix-build-on-powerpc.patch  |  36 -----
>  .../mozjs/mozjs-91/fix-musl-build.patch       |  15 --
>  14 files changed, 118 insertions(+), 217 deletions(-)
>  rename meta-oe/recipes-extended/mozjs/{mozjs-91 => mozjs-102}/0001-Cargo.toml-do-not-abort-on-panic.patch (74%)
>  rename meta-oe/recipes-extended/mozjs/{mozjs-91 => mozjs-102}/0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch (84%)
>  rename meta-oe/recipes-extended/mozjs/{mozjs-91 => mozjs-102}/0001-rewrite-cargo-host-linker-in-python3.patch (92%)
>  rename meta-oe/recipes-extended/mozjs/{mozjs-91 => mozjs-102}/0001-util.configure-fix-one-occasionally-reproduced-confi.patch (91%)
>  rename meta-oe/recipes-extended/mozjs/{mozjs-91 => mozjs-102}/0002-moz.configure-do-not-look-for-llvm-objdump.patch (82%)
>  rename meta-oe/recipes-extended/mozjs/{mozjs-91 => mozjs-102}/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch (91%)
>  rename meta-oe/recipes-extended/mozjs/{mozjs-91 => mozjs-102}/0004-use-asm-sgidefs.h.patch (79%)
>  create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-102/fix-musl-build.patch
>  rename meta-oe/recipes-extended/mozjs/{mozjs-91 => mozjs-102}/py-3.11.patch (59%)
>  rename meta-oe/recipes-extended/mozjs/{mozjs-91 => mozjs-102}/riscv32.patch (56%)
>  rename meta-oe/recipes-extended/mozjs/{mozjs-91_91.13.0.bb => mozjs-102_102.5.0.bb} (86%)
>  delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-91/0005-nojit-32bit-arch-fix.patch
>  delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-91/0006-Fix-build-on-powerpc.patch
>  delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-91/fix-musl-build.patch
> 
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-Cargo.toml-do-not-abort-on-panic.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-Cargo.toml-do-not-abort-on-panic.patch
> similarity index 74%
> rename from meta-oe/recipes-extended/mozjs/mozjs-91/0001-Cargo.toml-do-not-abort-on-panic.patch
> rename to meta-oe/recipes-extended/mozjs/mozjs-102/0001-Cargo.toml-do-not-abort-on-panic.patch
> index e09848f40..0dd936197 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-Cargo.toml-do-not-abort-on-panic.patch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-Cargo.toml-do-not-abort-on-panic.patch
> @@ -1,4 +1,4 @@
> -From 9e37248870b2b955293754933c789ca00bca06ef Mon Sep 17 00:00:00 2001
> +From bb46a8a729cc4d66ad36db40c17e36a5111f19c3 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex@linutronix.de>
>  Date: Fri, 1 Oct 2021 13:00:24 +0200
>  Subject: [PATCH] Cargo.toml: do not abort on panic
> @@ -7,13 +7,16 @@ OE's rust is configured to unwind, and this setting clashes with it/
>  
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +
>  ---
> - Cargo.toml | 3 +--
> - 1 file changed, 1 insertion(+), 2 deletions(-)
> + Cargo.toml | 2 --
> + 1 file changed, 2 deletions(-)
>  
> +diff --git a/Cargo.toml b/Cargo.toml
> +index f576534bf3..5ecc17c319 100644
>  --- a/Cargo.toml
>  +++ b/Cargo.toml
> -@@ -51,13 +51,11 @@ opt-level = 1
> +@@ -56,13 +56,11 @@ opt-level = 1
>   rpath = false
>   lto = false
>   debug-assertions = true
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch
> similarity index 84%
> rename from meta-oe/recipes-extended/mozjs/mozjs-91/0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch
> rename to meta-oe/recipes-extended/mozjs/mozjs-102/0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch
> index a2ccf6b91..fe905fe4d 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch
> @@ -1,4 +1,4 @@
> -From e5b95b3918588e2930c9af7ba304c57e871b2d55 Mon Sep 17 00:00:00 2001
> +From c860dcbe63b0e393c95bfb0131238f91aaac11d3 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex@linutronix.de>
>  Date: Thu, 7 Oct 2021 12:44:18 +0200
>  Subject: [PATCH] build: do not use autoconf's config.sub to 'canonicalize'
> @@ -9,15 +9,16 @@ target definitions, and the build fails.
>  
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +
>  ---
>   build/moz.configure/init.configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
>  diff --git a/build/moz.configure/init.configure b/build/moz.configure/init.configure
> -index 3a164c6558..99dfc9054a 100644
> +index 81f500a0b7..0b7a2ff60f 100644
>  --- a/build/moz.configure/init.configure
>  +++ b/build/moz.configure/init.configure
> -@@ -823,7 +823,7 @@ def help_host_target(help, host, target):
> +@@ -585,7 +585,7 @@ def help_host_target(help, host, target):
>   
>   def config_sub(shell, triplet):
>       config_sub = os.path.join(os.path.dirname(__file__), "..", "autoconf", "config.sub")
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-rewrite-cargo-host-linker-in-python3.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-rewrite-cargo-host-linker-in-python3.patch
> similarity index 92%
> rename from meta-oe/recipes-extended/mozjs/mozjs-91/0001-rewrite-cargo-host-linker-in-python3.patch
> rename to meta-oe/recipes-extended/mozjs/mozjs-102/0001-rewrite-cargo-host-linker-in-python3.patch
> index 7b938179c..73bcffe94 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-rewrite-cargo-host-linker-in-python3.patch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-rewrite-cargo-host-linker-in-python3.patch
> @@ -1,4 +1,4 @@
> -From 9eceb43dd676afe2f675bd65ab369ba4d14f6537 Mon Sep 17 00:00:00 2001
> +From 8e318c4e7e732327dabf51027860de45b6fb731e Mon Sep 17 00:00:00 2001
>  From: Changqing Li <changqing.li@windriver.com>
>  Date: Thu, 18 Nov 2021 07:16:39 +0000
>  Subject: [PATCH] Rewrite cargo-host-linker in python3
> @@ -18,12 +18,13 @@ rewrite cargo-host-linker in python3
>  Upstream-Status: Inappropriate [oe specific]
>  
>  Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +
>  ---
> - build/cargo-host-linker | 24 +++++++---
> + build/cargo-host-linker | 24 +++++++++++++++++++++---
>   1 file changed, 21 insertions(+), 3 deletions(-)
>  
>  diff --git a/build/cargo-host-linker b/build/cargo-host-linker
> -index cbd0472bf7..ccd8bffec1 100755
> +index cbd0472bf7..87d43ce9ec 100755
>  --- a/build/cargo-host-linker
>  +++ b/build/cargo-host-linker
>  @@ -1,3 +1,21 @@
> @@ -51,6 +52,3 @@ index cbd0472bf7..ccd8bffec1 100755
>  +        args=[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + sys.argv[1:]
>  +
>  +os.execvp(binary, args)
> --- 
> -2.33.1
> -
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-util.configure-fix-one-occasionally-reproduced-confi.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-util.configure-fix-one-occasionally-reproduced-confi.patch
> similarity index 91%
> rename from meta-oe/recipes-extended/mozjs/mozjs-91/0001-util.configure-fix-one-occasionally-reproduced-confi.patch
> rename to meta-oe/recipes-extended/mozjs/mozjs-102/0001-util.configure-fix-one-occasionally-reproduced-confi.patch
> index 5472eddbb..d732fdaf6 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-util.configure-fix-one-occasionally-reproduced-confi.patch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-util.configure-fix-one-occasionally-reproduced-confi.patch
> @@ -1,4 +1,4 @@
> -From b13cad4abc53f816f64c8b0af70cb46820746c72 Mon Sep 17 00:00:00 2001
> +From 2a6f66f39b4e623428b6d282bd4cb72dde67c1a6 Mon Sep 17 00:00:00 2001
>  From: Changqing Li <changqing.li@windriver.com>
>  Date: Thu, 11 Nov 2021 16:05:54 +0800
>  Subject: [PATCH] util.configure: fix one occasionally reproduced configure
> @@ -28,15 +28,16 @@ It should be another process that deleted this file by using
>  Upstream-Status: Submitted [https://bugzilla.mozilla.org/show_bug.cgi?id=1740667]
>  
>  Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +
>  ---
>   build/moz.configure/util.configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
>  diff --git a/build/moz.configure/util.configure b/build/moz.configure/util.configure
> -index 8f35e89c73..84e256647d 100644
> +index 80c3a34522..0ac0c6b611 100644
>  --- a/build/moz.configure/util.configure
>  +++ b/build/moz.configure/util.configure
> -@@ -222,7 +222,7 @@ def try_invoke_compiler(compiler, language, source, flags=None, onerror=None):
> +@@ -216,7 +216,7 @@ def try_invoke_compiler(compiler, language, source, flags=None, onerror=None):
>           "C++": ".cpp",
>       }[language]
>   
> @@ -45,6 +46,3 @@ index 8f35e89c73..84e256647d 100644
>       try:
>           source = source.encode("ascii", "replace")
>   
> --- 
> -2.17.1
> -
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/0002-moz.configure-do-not-look-for-llvm-objdump.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/0002-moz.configure-do-not-look-for-llvm-objdump.patch
> similarity index 82%
> rename from meta-oe/recipes-extended/mozjs/mozjs-91/0002-moz.configure-do-not-look-for-llvm-objdump.patch
> rename to meta-oe/recipes-extended/mozjs/mozjs-102/0002-moz.configure-do-not-look-for-llvm-objdump.patch
> index 6ff83e3bb..b3d3c1ffa 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-91/0002-moz.configure-do-not-look-for-llvm-objdump.patch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-102/0002-moz.configure-do-not-look-for-llvm-objdump.patch
> @@ -16,13 +16,13 @@ diff --git a/moz.configure b/moz.configure
>  index fc66b520d0..15de9a2ee0 100755
>  --- a/moz.configure
>  +++ b/moz.configure
> -@@ -994,15 +994,15 @@ def llvm_objdump(host_c_compiler, c_compiler, bindgen_config_paths):
> -     return (llvm_objdump,)
> +@@ -785,15 +785,15 @@
> +     return llvm_tool
>   
>   
>  -llvm_objdump = check_prog(
>  -    "LLVM_OBJDUMP",
> --    llvm_objdump,
> +-    llvm_tool("llvm-objdump"),
>  -    what="llvm-objdump",
>  -    when="--enable-compile-environment",
>  -    paths=clang_search_path,
> @@ -31,13 +31,14 @@ index fc66b520d0..15de9a2ee0 100755
>  -add_old_configure_assignment("LLVM_OBJDUMP", llvm_objdump)
>  +#llvm_objdump = check_prog(
>  +#    "LLVM_OBJDUMP",
> -+#    llvm_objdump,
> ++#    llvm_tool("llvm-objdump"),
>  +#    what="llvm-objdump",
>  +#    when="--enable-compile-environment",
>  +#    paths=clang_search_path,
>  +#)
> -+
> ++#
>  +#add_old_configure_assignment("LLVM_OBJDUMP", llvm_objdump)
>   
>   
> - option("--enable-dtrace", help="Build with dtrace support")
> + @depends(llvm_tool("llvm-readelf"), toolchain_prefix)
> +
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch
> similarity index 91%
> rename from meta-oe/recipes-extended/mozjs/mozjs-91/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch
> rename to meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch
> index c440bf178..e63b05356 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-91/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch
> @@ -1,4 +1,4 @@
> -From 749ba11fd6a69c8180945d4866415d16ae06a9c0 Mon Sep 17 00:00:00 2001
> +From 33ff25e2b126dd4135006139641d8b7f6e4da200 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex@linutronix.de>
>  Date: Fri, 1 Oct 2021 13:02:17 +0200
>  Subject: [PATCH] rust.configure: do not try to find a suitable upstream target
> @@ -7,15 +7,16 @@ OE is using custom targets and so this is bound to fail.
>  
>  Upstream-Status: Inapppropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +
>  ---
>   build/moz.configure/rust.configure | 34 ++----------------------------
>   1 file changed, 2 insertions(+), 32 deletions(-)
>  
>  diff --git a/build/moz.configure/rust.configure b/build/moz.configure/rust.configure
> -index cd77d72bb7..4b6481cbe3 100644
> +index e64dc5d5ec..edf21baca6 100644
>  --- a/build/moz.configure/rust.configure
>  +++ b/build/moz.configure/rust.configure
> -@@ -459,33 +459,7 @@ def assert_rust_compile(host_or_target, rustc_target, rustc):
> +@@ -471,33 +471,7 @@ def assert_rust_compile(host_or_target, rustc_target, rustc):
>   def rust_host_triple(
>       rustc, host, compiler_info, rustc_host, rust_supported_targets, arm_target
>   ):
> @@ -50,7 +51,7 @@ index cd77d72bb7..4b6481cbe3 100644
>   
>   
>   @depends(
> -@@ -495,11 +469,7 @@ def rust_host_triple(
> +@@ -507,11 +481,7 @@ def rust_host_triple(
>   def rust_target_triple(
>       rustc, target, compiler_info, rust_supported_targets, arm_target
>   ):
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/0004-use-asm-sgidefs.h.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/0004-use-asm-sgidefs.h.patch
> similarity index 79%
> rename from meta-oe/recipes-extended/mozjs/mozjs-91/0004-use-asm-sgidefs.h.patch
> rename to meta-oe/recipes-extended/mozjs/mozjs-102/0004-use-asm-sgidefs.h.patch
> index b56f0b95b..ff28654b5 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-91/0004-use-asm-sgidefs.h.patch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-102/0004-use-asm-sgidefs.h.patch
> @@ -1,4 +1,4 @@
> -From 65acc8800dba7e10da882871d4648241805c47ce Mon Sep 17 00:00:00 2001
> +From 0ec73937b01869a701ed9b60a6a84469e035ded4 Mon Sep 17 00:00:00 2001
>  From: Andre McCurdy <amccurdy@gmail.com>
>  Date: Sat, 30 Apr 2016 15:29:06 -0700
>  Subject: [PATCH] use <asm/sgidefs.h>
> @@ -18,13 +18,16 @@ Taken from: https://sourceware.org/bugzilla/show_bug.cgi?id=21070]
>  Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> +
>  ---
> - gdb/mips-linux-nat.c | 2 +-
> + mfbt/RandomNum.cpp | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
> +diff --git a/mfbt/RandomNum.cpp b/mfbt/RandomNum.cpp
> +index 23381db0cd..7f127c0715 100644
>  --- a/mfbt/RandomNum.cpp
>  +++ b/mfbt/RandomNum.cpp
> -@@ -52,7 +52,7 @@ extern "C" BOOLEAN NTAPI RtlGenRandom(PV
> +@@ -52,7 +52,7 @@ extern "C" BOOLEAN NTAPI RtlGenRandom(PVOID RandomBuffer,
>   #  elif defined(__s390__)
>   #    define GETRANDOM_NR 349
>   #  elif defined(__mips__)
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102/fix-musl-build.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/fix-musl-build.patch
> new file mode 100644
> index 000000000..f847979ea
> --- /dev/null
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-102/fix-musl-build.patch
> @@ -0,0 +1,27 @@
> +From 1110483c6c06adf2d03ed9154a8957defc175c80 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 20 Oct 2021 16:21:14 -0700
> +Subject: [PATCH] mozjs: Fix musl miscompiles with HAVE_THREAD_TLS_KEYWORD
> +
> +Upstream: No
> +Reason: mozjs60 miscompiles on musl if built with HAVE_THREAD_TLS_KEYWORD:
> +https://github.com/void-linux/void-packages/issues/2598
> +
> +---
> + js/src/old-configure.in | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/js/src/old-configure.in b/js/src/old-configure.in
> +index 8dfd75c63d..c82e580428 100644
> +--- a/js/src/old-configure.in
> ++++ b/js/src/old-configure.in
> +@@ -839,6 +839,9 @@ if test "$ac_cv_thread_keyword" = yes; then
> +     *-android*|*-linuxandroid*)
> +       :
> +       ;;
> ++    *-musl*)
> ++      :
> ++      ;;
> +     *)
> +       AC_DEFINE(HAVE_THREAD_TLS_KEYWORD)
> +       ;;
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/py-3.11.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/py-3.11.patch
> similarity index 59%
> rename from meta-oe/recipes-extended/mozjs/mozjs-91/py-3.11.patch
> rename to meta-oe/recipes-extended/mozjs/mozjs-102/py-3.11.patch
> index 71da8225a..85af54709 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-91/py-3.11.patch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-102/py-3.11.patch
> @@ -1,3 +1,7 @@
> +From 1479dd9c75917d2be70ee840c9db141e59987e44 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Wed, 14 Sep 2022 14:03:10 +0200
> +Subject: [PATCH] mozjs-91: backport a python 3.11 compatibility patch
>  
>  # HG changeset patch
>  # User ahochheiden <ahochheiden@mozilla.com>
> @@ -19,15 +23,20 @@ Differential Revision: https://phabricator.services.mozilla.com/D147721
>  Upstream-Status: Backport [https://hg.mozilla.org/mozilla-central/rev/f54162b2c1f2fe52c6137ab2c3469a1944f58b27]
>  Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>  
> +---
> + dom/base/usecounters.py                                 | 2 +-
> + python/mozbuild/mozbuild/action/process_define_files.py | 2 +-
> + python/mozbuild/mozbuild/backend/base.py                | 2 +-
> + python/mozbuild/mozbuild/preprocessor.py                | 6 +++---
> + python/mozbuild/mozbuild/util.py                        | 2 +-
> + python/mozbuild/mozpack/files.py                        | 4 ++--
> + 6 files changed, 9 insertions(+), 9 deletions(-)
> +
>  diff --git a/dom/base/usecounters.py b/dom/base/usecounters.py
> +index 780e3b32b2..7e2c7148ec 100644
>  --- a/dom/base/usecounters.py
>  +++ b/dom/base/usecounters.py
> -@@ -3,17 +3,17 @@
> - # file, You can obtain one at http://mozilla.org/MPL/2.0/.
> - 
> - import collections
> - import re
> - 
> +@@ -8,7 +8,7 @@ import re
>   
>   def read_conf(conf_filename):
>       # Can't read/write from a single StringIO, so make a new one for reading.
> @@ -36,20 +45,11 @@ diff --git a/dom/base/usecounters.py b/dom/base/usecounters.py
>   
>       def parse_counters(stream):
>           for line_num, line in enumerate(stream):
> -             line = line.rstrip("\n")
> -             if not line or line.startswith("//"):
> -                 # empty line or comment
> -                 continue
> -             m = re.match(r"method ([A-Za-z0-9]+)\.([A-Za-z0-9]+)$", line)
>  diff --git a/python/mozbuild/mozbuild/action/process_define_files.py b/python/mozbuild/mozbuild/action/process_define_files.py
> +index f1d401ac26..aca59d0f05 100644
>  --- a/python/mozbuild/mozbuild/action/process_define_files.py
>  +++ b/python/mozbuild/mozbuild/action/process_define_files.py
> -@@ -31,17 +31,17 @@ def process_define_file(output, input):
> - 
> -     config = PartialConfigEnvironment(topobjdir)
> - 
> -     if mozpath.basedir(
> -         path, [mozpath.join(topsrcdir, "js/src")]
> +@@ -36,7 +36,7 @@ def process_define_file(output, input):
>       ) and not config.substs.get("JS_STANDALONE"):
>           config = PartialConfigEnvironment(mozpath.join(topobjdir, "js", "src"))
>   
> @@ -58,20 +58,11 @@ diff --git a/python/mozbuild/mozbuild/action/process_define_files.py b/python/mo
>           r = re.compile(
>               "^\s*#\s*(?P<cmd>[a-z]+)(?:\s+(?P<name>\S+)(?:\s+(?P<value>\S+))?)?", re.U
>           )
> -         for l in input:
> -             m = r.match(l)
> -             if m:
> -                 cmd = m.group("cmd")
> -                 name = m.group("name")
>  diff --git a/python/mozbuild/mozbuild/backend/base.py b/python/mozbuild/mozbuild/backend/base.py
> +index 7bc1986d86..b64a709468 100644
>  --- a/python/mozbuild/mozbuild/backend/base.py
>  +++ b/python/mozbuild/mozbuild/backend/base.py
> -@@ -267,17 +267,17 @@ class BuildBackend(LoggingMixin):
> -         If an exception is raised, |mach build| will fail with a
> -         non-zero exit code.
> -         """
> -         self._write_purgecaches(config)
> - 
> +@@ -272,7 +272,7 @@ class BuildBackend(LoggingMixin):
>           return status
>   
>       @contextmanager
> @@ -80,20 +71,11 @@ diff --git a/python/mozbuild/mozbuild/backend/base.py b/python/mozbuild/mozbuild
>           """Context manager to write a file.
>   
>           This is a glorified wrapper around FileAvoidWrite with integration to
> -         update the summary data on this instance.
> - 
> -         Example usage:
> - 
> -             with self._write_file('foo.txt') as fh:
>  diff --git a/python/mozbuild/mozbuild/preprocessor.py b/python/mozbuild/mozbuild/preprocessor.py
> +index f7820b9c91..857f1a6c9b 100644
>  --- a/python/mozbuild/mozbuild/preprocessor.py
>  +++ b/python/mozbuild/mozbuild/preprocessor.py
> -@@ -526,17 +526,17 @@ class Preprocessor:
> -             if not options.output:
> -                 raise Preprocessor.Error(
> -                     self, "--depend doesn't work with stdout", None
> -                 )
> -             depfile = get_output_file(options.depend)
> +@@ -531,7 +531,7 @@ class Preprocessor:
>   
>           if args:
>               for f in args:
> @@ -102,17 +84,7 @@ diff --git a/python/mozbuild/mozbuild/preprocessor.py b/python/mozbuild/mozbuild
>                       self.processFile(input=input, output=out)
>               if depfile:
>                   mk = Makefile()
> -                 mk.create_rule([six.ensure_text(options.output)]).add_dependencies(
> -                     self.includes
> -                 )
> -                 mk.dump(depfile)
> -                 depfile.close()
> -@@ -855,17 +855,17 @@ class Preprocessor:
> -         self.checkLineNumbers = False
> -         if isName:
> -             try:
> -                 args = _to_text(args)
> -                 if filters:
> +@@ -860,7 +860,7 @@ class Preprocessor:
>                       args = self.applyFilters(args)
>                   if not os.path.isabs(args):
>                       args = os.path.join(self.curdir, args)
> @@ -121,17 +93,7 @@ diff --git a/python/mozbuild/mozbuild/preprocessor.py b/python/mozbuild/mozbuild
>               except Preprocessor.Error:
>                   raise
>               except Exception:
> -                 raise Preprocessor.Error(self, "FILE_NOT_FOUND", _to_text(args))
> -         self.checkLineNumbers = bool(
> -             re.search("\.(js|jsm|java|webidl)(?:\.in)?$", args.name)
> -         )
> -         oldFile = self.context["FILE"]
> -@@ -909,17 +909,17 @@ class Preprocessor:
> - 
> -     def do_error(self, args):
> -         raise Preprocessor.Error(self, "Error: ", _to_text(args))
> - 
> - 
> +@@ -914,7 +914,7 @@ class Preprocessor:
>   def preprocess(includes=[sys.stdin], defines={}, output=sys.stdout, marker="#"):
>       pp = Preprocessor(defines=defines, marker=marker)
>       for f in includes:
> @@ -140,20 +102,11 @@ diff --git a/python/mozbuild/mozbuild/preprocessor.py b/python/mozbuild/mozbuild
>               pp.processFile(input=input, output=output)
>       return pp.includes
>   
> - 
> - # Keep this module independently executable.
> - if __name__ == "__main__":
> -     pp = Preprocessor()
> -     pp.handleCommandLine(None, True)
>  diff --git a/python/mozbuild/mozbuild/util.py b/python/mozbuild/mozbuild/util.py
> +index b09f164698..4f1e0cdc5f 100644
>  --- a/python/mozbuild/mozbuild/util.py
>  +++ b/python/mozbuild/mozbuild/util.py
> -@@ -231,17 +231,17 @@ class FileAvoidWrite(BytesIO):
> -     enabled by default because it a) doesn't make sense for binary files b)
> -     could add unwanted overhead to calls.
> - 
> -     Additionally, there is dry run mode where the file is not actually written
> -     out, but reports whether the file was existing and would have been updated
> +@@ -236,7 +236,7 @@ class FileAvoidWrite(BytesIO):
>       still occur, as well as diff capture if requested.
>       """
>   
> @@ -162,20 +115,11 @@ diff --git a/python/mozbuild/mozbuild/util.py b/python/mozbuild/mozbuild/util.py
>           BytesIO.__init__(self)
>           self.name = filename
>           assert type(capture_diff) == bool
> -         assert type(dry_run) == bool
> -         assert "r" in readmode
> -         self._capture_diff = capture_diff
> -         self._write_to_file = not dry_run
> -         self.diff = None
>  diff --git a/python/mozbuild/mozpack/files.py b/python/mozbuild/mozpack/files.py
> +index 1d8a1ed2d8..a295a67b5a 100644
>  --- a/python/mozbuild/mozpack/files.py
>  +++ b/python/mozbuild/mozpack/files.py
> -@@ -549,17 +549,17 @@ class PreprocessedFile(BaseFile):
> -         self.defines = defines
> -         self.extra_depends = list(extra_depends or [])
> -         self.silence_missing_directive_warnings = silence_missing_directive_warnings
> - 
> -     def inputs(self):
> +@@ -554,7 +554,7 @@ class PreprocessedFile(BaseFile):
>           pp = Preprocessor(defines=self.defines, marker=self.marker)
>           pp.setSilenceDirectiveWarnings(self.silence_missing_directive_warnings)
>   
> @@ -184,17 +128,7 @@ diff --git a/python/mozbuild/mozpack/files.py b/python/mozbuild/mozpack/files.py
>               with _open(os.devnull, "w") as output:
>                   pp.processFile(input=input, output=output)
>   
> -         # This always yields at least self.path.
> -         return pp.includes
> - 
> -     def copy(self, dest, skip_if_older=True):
> -         """
> -@@ -606,17 +606,17 @@ class PreprocessedFile(BaseFile):
> -             return False
> - 
> -         deps_out = None
> -         if self.depfile:
> -             deps_out = FileAvoidWrite(self.depfile)
> +@@ -611,7 +611,7 @@ class PreprocessedFile(BaseFile):
>           pp = Preprocessor(defines=self.defines, marker=self.marker)
>           pp.setSilenceDirectiveWarnings(self.silence_missing_directive_warnings)
>   
> @@ -203,9 +137,3 @@ diff --git a/python/mozbuild/mozpack/files.py b/python/mozbuild/mozpack/files.py
>               pp.processFile(input=input, output=dest, depfile=deps_out)
>   
>           dest.close()
> -         if self.depfile:
> -             deps_out.close()
> - 
> -         return True
> - 
> -
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/riscv32.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/riscv32.patch
> similarity index 56%
> rename from meta-oe/recipes-extended/mozjs/mozjs-91/riscv32.patch
> rename to meta-oe/recipes-extended/mozjs/mozjs-102/riscv32.patch
> index fe9c332a0..a6a0a9ede 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-91/riscv32.patch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-102/riscv32.patch
> @@ -1,11 +1,22 @@
> -Add RISCV32 support
> +From 81385fe53ffde5e1636e9ace0736d914da8dbc0f Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 24 Oct 2021 22:32:50 -0700
> +Subject: [PATCH] Add RISCV32 support
>  
>  Upstream-Status: Pending
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  
> +---
> + build/moz.configure/init.configure                             | 3 +++
> + python/mozbuild/mozbuild/configure/constants.py                | 2 ++
> + .../mozbuild/test/configure/test_toolchain_configure.py        | 1 +
> + 3 files changed, 6 insertions(+)
> +
> +diff --git a/build/moz.configure/init.configure b/build/moz.configure/init.configure
> +index 0b7a2ff60f..54f8325b44 100644
>  --- a/build/moz.configure/init.configure
>  +++ b/build/moz.configure/init.configure
> -@@ -765,6 +765,9 @@ def split_triplet(triplet, allow_msvc=Fa
> +@@ -524,6 +524,9 @@ def split_triplet(triplet, allow_msvc=False, allow_wasi=False):
>       elif cpu.startswith("aarch64"):
>           canonical_cpu = "aarch64"
>           endianness = "little"
> @@ -15,9 +26,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>       elif cpu in ("riscv64", "riscv64gc"):
>           canonical_cpu = "riscv64"
>           endianness = "little"
> +diff --git a/python/mozbuild/mozbuild/configure/constants.py b/python/mozbuild/mozbuild/configure/constants.py
> +index c71460cb20..15bef93e19 100644
>  --- a/python/mozbuild/mozbuild/configure/constants.py
>  +++ b/python/mozbuild/mozbuild/configure/constants.py
> -@@ -52,6 +52,7 @@ CPU_bitness = {
> +@@ -53,6 +53,7 @@ CPU_bitness = {
>       "mips64": 64,
>       "ppc": 32,
>       "ppc64": 64,
> @@ -25,17 +38,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>       "riscv64": 64,
>       "s390": 32,
>       "s390x": 64,
> -@@ -94,6 +95,7 @@ CPU_preprocessor_checks = OrderedDict(
> +@@ -95,6 +96,7 @@ CPU_preprocessor_checks = OrderedDict(
>           ("m68k", "__m68k__"),
>           ("mips64", "__mips64"),
>           ("mips32", "__mips__"),
>  +        ("riscv32", "__riscv && __riscv_xlen == 32"),
>           ("riscv64", "__riscv && __riscv_xlen == 64"),
> +         ("loongarch64", "__loongarch64"),
>           ("sh4", "__sh__"),
> -         ("wasm32", "__wasm32__"),
> +diff --git a/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
> +index 059cde0139..4f9986eb31 100644
>  --- a/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
>  +++ b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
> -@@ -1186,6 +1186,7 @@ class LinuxCrossCompileToolchainTest(Bas
> +@@ -1192,6 +1192,7 @@ class LinuxCrossCompileToolchainTest(BaseToolchainTest):
>           "m68k-unknown-linux-gnu": big_endian + {"__m68k__": 1},
>           "mips64-unknown-linux-gnuabi64": big_endian + {"__mips64": 1, "__mips__": 1},
>           "mips-unknown-linux-gnu": big_endian + {"__mips__": 1},
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91_91.13.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-102_102.5.0.bb
> similarity index 86%
> rename from meta-oe/recipes-extended/mozjs/mozjs-91_91.13.0.bb
> rename to meta-oe/recipes-extended/mozjs/mozjs-102_102.5.0.bb
> index 4c1aa3447..a4d88a340 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-91_91.13.0.bb
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-102_102.5.0.bb
> @@ -11,15 +11,13 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire
>             file://fix-musl-build.patch \
>             file://0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch \
>             file://riscv32.patch \
> -           file://0005-nojit-32bit-arch-fix.patch \
> -           file://0006-Fix-build-on-powerpc.patch \
>             file://0001-util.configure-fix-one-occasionally-reproduced-confi.patch \
>             file://0001-rewrite-cargo-host-linker-in-python3.patch  \
>             file://py-3.11.patch \
>             "
> -SRC_URI[sha256sum] = "53be2bcde0b5ee3ec106bd8ba06b8ae95e7d489c484e881dfbe5360e4c920762"
> +SRC_URI[sha256sum] = "017dd44b1285913f477074802707a4c76ed1a28270ec5a327bbb76574cc057d8"
>  
> -S = "${WORKDIR}/firefox-${@d.getVar("PV").replace("esr", "")}"
> +S = "${WORKDIR}/firefox-${PV}"
>  
>  inherit pkgconfig perlnative python3native rust
>  
> @@ -67,12 +65,12 @@ do_install() {
>  
>  inherit multilib_script multilib_header
>  
> -MULTILIB_SCRIPTS += " ${PN}-dev:${bindir}/js91-config"
> +MULTILIB_SCRIPTS += " ${PN}-dev:${bindir}/js102-config"
>  
>  do_install:append() {
> -    oe_multilib_header mozjs-91/js-config.h
> +    oe_multilib_header mozjs-102/js-config.h
>      sed -e 's@${STAGING_DIR_HOST}@@g' \
> -        -i ${D}${bindir}/js91-config
> +        -i ${D}${bindir}/js102-config
>      rm -f ${D}${libdir}/libjs_static.ajs
>  }
>  
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/0005-nojit-32bit-arch-fix.patch b/meta-oe/recipes-extended/mozjs/mozjs-91/0005-nojit-32bit-arch-fix.patch
> deleted file mode 100644
> index f308b4863..000000000
> --- a/meta-oe/recipes-extended/mozjs/mozjs-91/0005-nojit-32bit-arch-fix.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -Fix build when JIT is disabled on 32bit systems
> -
> -This fixes a compile time assert
> -js/src/wasm/WasmFrame.cpp:57:3: error: static_assert failed due to requirement '(__builtin_offsetof(js::wasm::DebugFrame, frame_) + sizeof(js::wasm::Frame)) % Alignment == 0' "Aligned after pushing DebugFrame"
> -  static_assert((offsetof(DebugFrame, frame_) + sizeof(Frame)) % Alignment == 0,
> -  ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ---- a/js/src/wasm/WasmFrame.h
> -+++ b/js/src/wasm/WasmFrame.h
> -@@ -230,6 +230,8 @@ class DebugFrame {
> -   // Avoid -Wunused-private-field warnings.
> -  protected:
> - #if defined(JS_CODEGEN_MIPS32) || defined(JS_CODEGEN_ARM) || \
> -+    (defined(JS_CODEGEN_NONE) && \
> -+     (defined(__riscv) && __riscv_xlen == 32) || defined(__mips__)) || \
> -     defined(JS_CODEGEN_X86) || defined(__wasi__)
> -   // See alignmentStaticAsserts().  For MIPS32, ARM32 and X86 DebugFrame is only
> -   // 4-byte aligned, so we add another word to get up to 8-byte
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/0006-Fix-build-on-powerpc.patch b/meta-oe/recipes-extended/mozjs/mozjs-91/0006-Fix-build-on-powerpc.patch
> deleted file mode 100644
> index 80bf746e4..000000000
> --- a/meta-oe/recipes-extended/mozjs/mozjs-91/0006-Fix-build-on-powerpc.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 0e0548e3f95e22a39db8d5b934afe0672a3f801b Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
> -Date: Mon, 1 Nov 2021 08:13:29 +0100
> -Subject: [PATCH] Fix build on powerpc
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Another fix for (this time JIT enabled)
> -| <...>/irefox-91.2.0/js/src/wasm/WasmFrame.cpp:57:76: error: static assertion failed: Aligned after pushing DebugFrame
> -|    57 |   static_assert((offsetof(DebugFrame, frame_) + sizeof(Frame)) % Alignment == 0,
> -|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Andreas M�ller <schnitzeltony@gmail.com>
> ----
> - js/src/wasm/WasmFrame.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/js/src/wasm/WasmFrame.h b/js/src/wasm/WasmFrame.h
> -index 893762e..2d90656 100644
> ---- a/js/src/wasm/WasmFrame.h
> -+++ b/js/src/wasm/WasmFrame.h
> -@@ -232,7 +232,7 @@ class DebugFrame {
> - #if defined(JS_CODEGEN_MIPS32) || defined(JS_CODEGEN_ARM) || \
> -     (defined(JS_CODEGEN_NONE) && \
> -      (defined(__riscv) && __riscv_xlen == 32) || defined(__mips__)) || \
> --    defined(JS_CODEGEN_X86) || defined(__wasi__)
> -+    defined(JS_CODEGEN_X86) || defined(__wasi__) || defined(__powerpc__)
> -   // See alignmentStaticAsserts().  For MIPS32, ARM32 and X86 DebugFrame is only
> -   // 4-byte aligned, so we add another word to get up to 8-byte
> -   // alignment.
> --- 
> -2.31.1
> -
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/fix-musl-build.patch b/meta-oe/recipes-extended/mozjs/mozjs-91/fix-musl-build.patch
> deleted file mode 100644
> index c0834af58..000000000
> --- a/meta-oe/recipes-extended/mozjs/mozjs-91/fix-musl-build.patch
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Upstream: No
> -Reason: mozjs60 miscompiles on musl if built with HAVE_THREAD_TLS_KEYWORD:
> -https://github.com/void-linux/void-packages/issues/2598
> ---- a/js/src/old-configure.in
> -+++ b/js/src/old-configure.in
> -@@ -1072,6 +1072,9 @@ if test "$ac_cv_thread_keyword" = yes; t
> -     *-android*|*-linuxandroid*)
> -       :
> -       ;;
> -+    *-musl*)
> -+      :
> -+      ;;
> -     *)
> -       AC_DEFINE(HAVE_THREAD_TLS_KEYWORD)
> -       ;;
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99784): https://lists.openembedded.org/g/openembedded-devel/message/99784
> Mute This Topic: https://lists.openembedded.org/mt/95296113/3617179
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

