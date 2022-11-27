Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D2BC4321E
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 20:18:45 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.100194.1669580321293887625
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 12:18:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout01.t-online.de (Postfix) with SMTP id C35E66427
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Nov 2022 21:18:38 +0100 (CET)
Received: from [192.168.178.83] ([79.219.231.234]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ozO6o-2UqSVE0; Sun, 27 Nov 2022 21:18:38 +0100
Date: Sun, 27 Nov 2022 21:18:33 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv4] mozjs: update 98 -> 102
To: openembedded-devel@lists.openembedded.org
Message-Id: <XEW0MR.L01V9G5UQRS23@t-online.de>
In-Reply-To: <172B8A3494A4E9EB.368@lists.openembedded.org>
References: <172B8A3494A4E9EB.368@lists.openembedded.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-aDGBhRmaDMTwaLqMTOFO"
X-TOI-EXPURGATEID: 150726::1669580318-4CC58B8C-F786E095/0/0 CLEAN NORMAL
X-TOI-MSGID: 397c781a-dd79-49e8-8406-e9843a52e865
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Nov 2022 20:18:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99785

--=-aDGBhRmaDMTwaLqMTOFO
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

This adds back the patch to avoid looking for llvm-objdump. I thought=20
this might be unneeded if providing llvm-native and on a first look=20
this did work. Since llvm-native will be needed for rust and librsvg=20
anyway, i thought that dependency wouldn't hurt to much. But it turned=20
out, that also clang-native is needed to build and that is not so nice,=20
because it would add a layer dependency on meta-clang and some=20
additional build time.

Am So, 27. Nov 2022 um 21:13:45 +0100 schrieb Markus Volk=20
<f_l_k@t-online.de>:
> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> ---
>  ...001-Cargo.toml-do-not-abort-on-panic.patch |  11 +-
>  ...-autoconf-s-config.sub-to-canonicali.patch |   7 +-
>  ...rewrite-cargo-host-linker-in-python3.patch |  10 +-
>  ...ix-one-occasionally-reproduced-confi.patch |  10 +-
>  ...nfigure-do-not-look-for-llvm-objdump.patch |  13 +-
>  ...o-not-try-to-find-a-suitable-upstrea.patch |   9 +-
>  .../0004-use-asm-sgidefs.h.patch              |   9 +-
>  .../mozjs/mozjs-102/fix-musl-build.patch      |  27 ++++
>  .../{mozjs-91 =3D> mozjs-102}/py-3.11.patch     | 128=20
> ++++--------------
>  .../{mozjs-91 =3D> mozjs-102}/riscv32.patch     |  27 +++-
>  ...zjs-91_91.13.0.bb =3D> mozjs-102_102.5.0.bb} |  12 +-
>  .../mozjs-91/0005-nojit-32bit-arch-fix.patch  |  21 ---
>  .../mozjs-91/0006-Fix-build-on-powerpc.patch  |  36 -----
>  .../mozjs/mozjs-91/fix-musl-build.patch       |  15 --
>  14 files changed, 118 insertions(+), 217 deletions(-)
>  rename meta-oe/recipes-extended/mozjs/{mozjs-91 =3D>=20
> mozjs-102}/0001-Cargo.toml-do-not-abort-on-panic.patch (74%)
>  rename meta-oe/recipes-extended/mozjs/{mozjs-91 =3D>=20
> mozjs-102}/0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patc=
h=20
> (84%)
>  rename meta-oe/recipes-extended/mozjs/{mozjs-91 =3D>=20
> mozjs-102}/0001-rewrite-cargo-host-linker-in-python3.patch (92%)
>  rename meta-oe/recipes-extended/mozjs/{mozjs-91 =3D>=20
> mozjs-102}/0001-util.configure-fix-one-occasionally-reproduced-confi.patc=
h=20
> (91%)
>  rename meta-oe/recipes-extended/mozjs/{mozjs-91 =3D>=20
> mozjs-102}/0002-moz.configure-do-not-look-for-llvm-objdump.patch (82%)
>  rename meta-oe/recipes-extended/mozjs/{mozjs-91 =3D>=20
> mozjs-102}/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patc=
h=20
> (91%)
>  rename meta-oe/recipes-extended/mozjs/{mozjs-91 =3D>=20
> mozjs-102}/0004-use-asm-sgidefs.h.patch (79%)
>  create mode 100644=20
> meta-oe/recipes-extended/mozjs/mozjs-102/fix-musl-build.patch
>  rename meta-oe/recipes-extended/mozjs/{mozjs-91 =3D>=20
> mozjs-102}/py-3.11.patch (59%)
>  rename meta-oe/recipes-extended/mozjs/{mozjs-91 =3D>=20
> mozjs-102}/riscv32.patch (56%)
>  rename meta-oe/recipes-extended/mozjs/{mozjs-91_91.13.0.bb =3D>=20
> mozjs-102_102.5.0.bb} (86%)
>  delete mode 100644=20
> meta-oe/recipes-extended/mozjs/mozjs-91/0005-nojit-32bit-arch-fix.patch
>  delete mode 100644=20
> meta-oe/recipes-extended/mozjs/mozjs-91/0006-Fix-build-on-powerpc.patch
>  delete mode 100644=20
> meta-oe/recipes-extended/mozjs/mozjs-91/fix-musl-build.patch
>=20
> diff --git=20
> a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-Cargo.toml-do-not-abort-on=
-panic.patch=20
> b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-Cargo.toml-do-not-abort-o=
n-panic.patch
> similarity index 74%
> rename from=20
> meta-oe/recipes-extended/mozjs/mozjs-91/0001-Cargo.toml-do-not-abort-on-p=
anic.patch
> rename to=20
> meta-oe/recipes-extended/mozjs/mozjs-102/0001-Cargo.toml-do-not-abort-on-=
panic.patch
> index e09848f40..0dd936197 100644
> ---=20
> a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-Cargo.toml-do-not-abort-on=
-panic.patch
> +++=20
> b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-Cargo.toml-do-not-abort-o=
n-panic.patch
> @@ -1,4 +1,4 @@
> -From 9e37248870b2b955293754933c789ca00bca06ef Mon Sep 17 00:00:00=20
> 2001
> +From bb46a8a729cc4d66ad36db40c17e36a5111f19c3 Mon Sep 17 00:00:00=20
> 2001
>  From: Alexander Kanavin <alex@linutronix.de=20
> <mailto:alex@linutronix.de>>
>  Date: Fri, 1 Oct 2021 13:00:24 +0200
>  Subject: [PATCH] Cargo.toml: do not abort on panic
> @@ -7,13 +7,16 @@ OE's rust is configured to unwind, and this setting=20
> clashes with it/
>=20
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex@linutronix.de=20
> <mailto:alex@linutronix.de>>
> +
>  ---
> - Cargo.toml | 3 +--
> - 1 file changed, 1 insertion(+), 2 deletions(-)
> + Cargo.toml | 2 --
> + 1 file changed, 2 deletions(-)
>=20
> +diff --git a/Cargo.toml b/Cargo.toml
> +index f576534bf3..5ecc17c319 100644
>  --- a/Cargo.toml
>  +++ b/Cargo.toml
> -@@ -51,13 +51,11 @@ opt-level =3D 1
> +@@ -56,13 +56,11 @@ opt-level =3D 1
>   rpath =3D false
>   lto =3D false
>   debug-assertions =3D true
> diff --git=20
> a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-build-do-not-use-autoconf-=
s-config.sub-to-canonicali.patch=20
> b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-build-do-not-use-autoconf=
-s-config.sub-to-canonicali.patch
> similarity index 84%
> rename from=20
> meta-oe/recipes-extended/mozjs/mozjs-91/0001-build-do-not-use-autoconf-s-=
config.sub-to-canonicali.patch
> rename to=20
> meta-oe/recipes-extended/mozjs/mozjs-102/0001-build-do-not-use-autoconf-s=
-config.sub-to-canonicali.patch
> index a2ccf6b91..fe905fe4d 100644
> ---=20
> a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-build-do-not-use-autoconf-=
s-config.sub-to-canonicali.patch
> +++=20
> b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-build-do-not-use-autoconf=
-s-config.sub-to-canonicali.patch
> @@ -1,4 +1,4 @@
> -From e5b95b3918588e2930c9af7ba304c57e871b2d55 Mon Sep 17 00:00:00=20
> 2001
> +From c860dcbe63b0e393c95bfb0131238f91aaac11d3 Mon Sep 17 00:00:00=20
> 2001
>  From: Alexander Kanavin <alex@linutronix.de=20
> <mailto:alex@linutronix.de>>
>  Date: Thu, 7 Oct 2021 12:44:18 +0200
>  Subject: [PATCH] build: do not use autoconf's config.sub to=20
> 'canonicalize'
> @@ -9,15 +9,16 @@ target definitions, and the build fails.
>=20
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex@linutronix.de=20
> <mailto:alex@linutronix.de>>
> +
>  ---
>   build/moz.configure/init.configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
>  diff --git a/build/moz.configure/init.configure=20
> b/build/moz.configure/init.configure
> -index 3a164c6558..99dfc9054a 100644
> +index 81f500a0b7..0b7a2ff60f 100644
>  --- a/build/moz.configure/init.configure
>  +++ b/build/moz.configure/init.configure
> -@@ -823,7 +823,7 @@ def help_host_target(help, host, target):
> +@@ -585,7 +585,7 @@ def help_host_target(help, host, target):
>=20
>   def config_sub(shell, triplet):
>       config_sub =3D os.path.join(os.path.dirname(__file__), "..",=20
> "autoconf", "config.sub")
> diff --git=20
> a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-rewrite-cargo-host-linker-=
in-python3.patch=20
> b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-rewrite-cargo-host-linker=
-in-python3.patch
> similarity index 92%
> rename from=20
> meta-oe/recipes-extended/mozjs/mozjs-91/0001-rewrite-cargo-host-linker-in=
-python3.patch
> rename to=20
> meta-oe/recipes-extended/mozjs/mozjs-102/0001-rewrite-cargo-host-linker-i=
n-python3.patch
> index 7b938179c..73bcffe94 100644
> ---=20
> a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-rewrite-cargo-host-linker-=
in-python3.patch
> +++=20
> b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-rewrite-cargo-host-linker=
-in-python3.patch
> @@ -1,4 +1,4 @@
> -From 9eceb43dd676afe2f675bd65ab369ba4d14f6537 Mon Sep 17 00:00:00=20
> 2001
> +From 8e318c4e7e732327dabf51027860de45b6fb731e Mon Sep 17 00:00:00=20
> 2001
>  From: Changqing Li <changqing.li@windriver.com=20
> <mailto:changqing.li@windriver.com>>
>  Date: Thu, 18 Nov 2021 07:16:39 +0000
>  Subject: [PATCH] Rewrite cargo-host-linker in python3
> @@ -18,12 +18,13 @@ rewrite cargo-host-linker in python3
>  Upstream-Status: Inappropriate [oe specific]
>=20
>  Signed-off-by: Changqing Li <changqing.li@windriver.com=20
> <mailto:changqing.li@windriver.com>>
> +
>  ---
> - build/cargo-host-linker | 24 +++++++---
> + build/cargo-host-linker | 24 +++++++++++++++++++++---
>   1 file changed, 21 insertions(+), 3 deletions(-)
>=20
>  diff --git a/build/cargo-host-linker b/build/cargo-host-linker
> -index cbd0472bf7..ccd8bffec1 100755
> +index cbd0472bf7..87d43ce9ec 100755
>  --- a/build/cargo-host-linker
>  +++ b/build/cargo-host-linker
>  @@ -1,3 +1,21 @@
> @@ -51,6 +52,3 @@ index cbd0472bf7..ccd8bffec1 100755
>  +        args=3D[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] +=20
> sys.argv[1:]
>  +
>  +os.execvp(binary, args)
> ---
> -2.33.1
> -
> diff --git=20
> a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-util.configure-fix-one-occ=
asionally-reproduced-confi.patch=20
> b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-util.configure-fix-one-oc=
casionally-reproduced-confi.patch
> similarity index 91%
> rename from=20
> meta-oe/recipes-extended/mozjs/mozjs-91/0001-util.configure-fix-one-occas=
ionally-reproduced-confi.patch
> rename to=20
> meta-oe/recipes-extended/mozjs/mozjs-102/0001-util.configure-fix-one-occa=
sionally-reproduced-confi.patch
> index 5472eddbb..d732fdaf6 100644
> ---=20
> a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-util.configure-fix-one-occ=
asionally-reproduced-confi.patch
> +++=20
> b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-util.configure-fix-one-oc=
casionally-reproduced-confi.patch
> @@ -1,4 +1,4 @@
> -From b13cad4abc53f816f64c8b0af70cb46820746c72 Mon Sep 17 00:00:00=20
> 2001
> +From 2a6f66f39b4e623428b6d282bd4cb72dde67c1a6 Mon Sep 17 00:00:00=20
> 2001
>  From: Changqing Li <changqing.li@windriver.com=20
> <mailto:changqing.li@windriver.com>>
>  Date: Thu, 11 Nov 2021 16:05:54 +0800
>  Subject: [PATCH] util.configure: fix one occasionally reproduced=20
> configure
> @@ -28,15 +28,16 @@ It should be another process that deleted this=20
> file by using
>  Upstream-Status: Submitted=20
> [<https://bugzilla.mozilla.org/show_bug.cgi?id=3D1740667>]
>=20
>  Signed-off-by: Changqing Li <changqing.li@windriver.com=20
> <mailto:changqing.li@windriver.com>>
> +
>  ---
>   build/moz.configure/util.configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
>  diff --git a/build/moz.configure/util.configure=20
> b/build/moz.configure/util.configure
> -index 8f35e89c73..84e256647d 100644
> +index 80c3a34522..0ac0c6b611 100644
>  --- a/build/moz.configure/util.configure
>  +++ b/build/moz.configure/util.configure
> -@@ -222,7 +222,7 @@ def try_invoke_compiler(compiler, language,=20
> source, flags=3DNone, onerror=3DNone):
> +@@ -216,7 +216,7 @@ def try_invoke_compiler(compiler, language,=20
> source, flags=3DNone, onerror=3DNone):
>           "C++": ".cpp",
>       }[language]
>=20
> @@ -45,6 +46,3 @@ index 8f35e89c73..84e256647d 100644
>       try:
>           source =3D source.encode("ascii", "replace")
>=20
> ---
> -2.17.1
> -
> diff --git=20
> a/meta-oe/recipes-extended/mozjs/mozjs-91/0002-moz.configure-do-not-look-=
for-llvm-objdump.patch=20
> b/meta-oe/recipes-extended/mozjs/mozjs-102/0002-moz.configure-do-not-look=
-for-llvm-objdump.patch
> similarity index 82%
> rename from=20
> meta-oe/recipes-extended/mozjs/mozjs-91/0002-moz.configure-do-not-look-fo=
r-llvm-objdump.patch
> rename to=20
> meta-oe/recipes-extended/mozjs/mozjs-102/0002-moz.configure-do-not-look-f=
or-llvm-objdump.patch
> index 6ff83e3bb..b3d3c1ffa 100644
> ---=20
> a/meta-oe/recipes-extended/mozjs/mozjs-91/0002-moz.configure-do-not-look-=
for-llvm-objdump.patch
> +++=20
> b/meta-oe/recipes-extended/mozjs/mozjs-102/0002-moz.configure-do-not-look=
-for-llvm-objdump.patch
> @@ -16,13 +16,13 @@ diff --git a/moz.configure b/moz.configure
>  index fc66b520d0..15de9a2ee0 100755
>  --- a/moz.configure
>  +++ b/moz.configure
> -@@ -994,15 +994,15 @@ def llvm_objdump(host_c_compiler, c_compiler,=20
> bindgen_config_paths):
> -     return (llvm_objdump,)
> +@@ -785,15 +785,15 @@
> +     return llvm_tool
>=20
>=20
>  -llvm_objdump =3D check_prog(
>  -    "LLVM_OBJDUMP",
> --    llvm_objdump,
> +-    llvm_tool("llvm-objdump"),
>  -    what=3D"llvm-objdump",
>  -    when=3D"--enable-compile-environment",
>  -    paths=3Dclang_search_path,
> @@ -31,13 +31,14 @@ index fc66b520d0..15de9a2ee0 100755
>  -add_old_configure_assignment("LLVM_OBJDUMP", llvm_objdump)
>  +#llvm_objdump =3D check_prog(
>  +#    "LLVM_OBJDUMP",
> -+#    llvm_objdump,
> ++#    llvm_tool("llvm-objdump"),
>  +#    what=3D"llvm-objdump",
>  +#    when=3D"--enable-compile-environment",
>  +#    paths=3Dclang_search_path,
>  +#)
> -+
> ++#
>  +#add_old_configure_assignment("LLVM_OBJDUMP", llvm_objdump)
>=20
>=20
> - option("--enable-dtrace", help=3D"Build with dtrace support")
> + @depends(llvm_tool("llvm-readelf"), toolchain_prefix)
> +
> diff --git=20
> a/meta-oe/recipes-extended/mozjs/mozjs-91/0003-rust.configure-do-not-try-=
to-find-a-suitable-upstrea.patch=20
> b/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-try=
-to-find-a-suitable-upstrea.patch
> similarity index 91%
> rename from=20
> meta-oe/recipes-extended/mozjs/mozjs-91/0003-rust.configure-do-not-try-to=
-find-a-suitable-upstrea.patch
> rename to=20
> meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-try-t=
o-find-a-suitable-upstrea.patch
> index c440bf178..e63b05356 100644
> ---=20
> a/meta-oe/recipes-extended/mozjs/mozjs-91/0003-rust.configure-do-not-try-=
to-find-a-suitable-upstrea.patch
> +++=20
> b/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-try=
-to-find-a-suitable-upstrea.patch
> @@ -1,4 +1,4 @@
> -From 749ba11fd6a69c8180945d4866415d16ae06a9c0 Mon Sep 17 00:00:00=20
> 2001
> +From 33ff25e2b126dd4135006139641d8b7f6e4da200 Mon Sep 17 00:00:00=20
> 2001
>  From: Alexander Kanavin <alex@linutronix.de=20
> <mailto:alex@linutronix.de>>
>  Date: Fri, 1 Oct 2021 13:02:17 +0200
>  Subject: [PATCH] rust.configure: do not try to find a suitable=20
> upstream target
> @@ -7,15 +7,16 @@ OE is using custom targets and so this is bound to=20
> fail.
>=20
>  Upstream-Status: Inapppropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex@linutronix.de=20
> <mailto:alex@linutronix.de>>
> +
>  ---
>   build/moz.configure/rust.configure | 34=20
> ++----------------------------
>   1 file changed, 2 insertions(+), 32 deletions(-)
>=20
>  diff --git a/build/moz.configure/rust.configure=20
> b/build/moz.configure/rust.configure
> -index cd77d72bb7..4b6481cbe3 100644
> +index e64dc5d5ec..edf21baca6 100644
>  --- a/build/moz.configure/rust.configure
>  +++ b/build/moz.configure/rust.configure
> -@@ -459,33 +459,7 @@ def assert_rust_compile(host_or_target,=20
> rustc_target, rustc):
> +@@ -471,33 +471,7 @@ def assert_rust_compile(host_or_target,=20
> rustc_target, rustc):
>   def rust_host_triple(
>       rustc, host, compiler_info, rustc_host, rust_supported_targets,=20
> arm_target
>   ):
> @@ -50,7 +51,7 @@ index cd77d72bb7..4b6481cbe3 100644
>=20
>=20
>   @depends(
> -@@ -495,11 +469,7 @@ def rust_host_triple(
> +@@ -507,11 +481,7 @@ def rust_host_triple(
>   def rust_target_triple(
>       rustc, target, compiler_info, rust_supported_targets, arm_target
>   ):
> diff --git=20
> a/meta-oe/recipes-extended/mozjs/mozjs-91/0004-use-asm-sgidefs.h.patch=20
> b/meta-oe/recipes-extended/mozjs/mozjs-102/0004-use-asm-sgidefs.h.patch
> similarity index 79%
> rename from=20
> meta-oe/recipes-extended/mozjs/mozjs-91/0004-use-asm-sgidefs.h.patch
> rename to=20
> meta-oe/recipes-extended/mozjs/mozjs-102/0004-use-asm-sgidefs.h.patch
> index b56f0b95b..ff28654b5 100644
> ---=20
> a/meta-oe/recipes-extended/mozjs/mozjs-91/0004-use-asm-sgidefs.h.patch
> +++=20
> b/meta-oe/recipes-extended/mozjs/mozjs-102/0004-use-asm-sgidefs.h.patch
> @@ -1,4 +1,4 @@
> -From 65acc8800dba7e10da882871d4648241805c47ce Mon Sep 17 00:00:00=20
> 2001
> +From 0ec73937b01869a701ed9b60a6a84469e035ded4 Mon Sep 17 00:00:00=20
> 2001
>  From: Andre McCurdy <amccurdy@gmail.com <mailto:amccurdy@gmail.com>>
>  Date: Sat, 30 Apr 2016 15:29:06 -0700
>  Subject: [PATCH] use <asm/sgidefs.h>
> @@ -18,13 +18,16 @@ Taken from:=20
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D21070]
>  Signed-off-by: Andre McCurdy <armccurdy@gmail.com=20
> <mailto:armccurdy@gmail.com>>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com=20
> <mailto:raj.khem@gmail.com>>
>  Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com=20
> <mailto:Vincent.Riera@imgtec.com>>
> +
>  ---
> - gdb/mips-linux-nat.c | 2 +-
> + mfbt/RandomNum.cpp | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> +diff --git a/mfbt/RandomNum.cpp b/mfbt/RandomNum.cpp
> +index 23381db0cd..7f127c0715 100644
>  --- a/mfbt/RandomNum.cpp
>  +++ b/mfbt/RandomNum.cpp
> -@@ -52,7 +52,7 @@ extern "C" BOOLEAN NTAPI RtlGenRandom(PV
> +@@ -52,7 +52,7 @@ extern "C" BOOLEAN NTAPI RtlGenRandom(PVOID=20
> RandomBuffer,
>   #  elif defined(__s390__)
>   #    define GETRANDOM_NR 349
>   #  elif defined(__mips__)
> diff --git=20
> a/meta-oe/recipes-extended/mozjs/mozjs-102/fix-musl-build.patch=20
> b/meta-oe/recipes-extended/mozjs/mozjs-102/fix-musl-build.patch
> new file mode 100644
> index 000000000..f847979ea
> --- /dev/null
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-102/fix-musl-build.patch
> @@ -0,0 +1,27 @@
> +From 1110483c6c06adf2d03ed9154a8957defc175c80 Mon Sep 17 00:00:00=20
> 2001
> +From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
> +Date: Wed, 20 Oct 2021 16:21:14 -0700
> +Subject: [PATCH] mozjs: Fix musl miscompiles with=20
> HAVE_THREAD_TLS_KEYWORD
> +
> +Upstream: No
> +Reason: mozjs60 miscompiles on musl if built with=20
> HAVE_THREAD_TLS_KEYWORD:
> +<https://github.com/void-linux/void-packages/issues/2598>
> +
> +---
> + js/src/old-configure.in | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/js/src/old-configure.in b/js/src/old-configure.in
> +index 8dfd75c63d..c82e580428 100644
> +--- a/js/src/old-configure.in
> ++++ b/js/src/old-configure.in
> +@@ -839,6 +839,9 @@ if test "$ac_cv_thread_keyword" =3D yes; then
> +     *-android*|*-linuxandroid*)
> +       :
> +       ;;
> ++    *-musl*)
> ++      :
> ++      ;;
> +     *)
> +       AC_DEFINE(HAVE_THREAD_TLS_KEYWORD)
> +       ;;
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/py-3.11.patch=20
> b/meta-oe/recipes-extended/mozjs/mozjs-102/py-3.11.patch
> similarity index 59%
> rename from meta-oe/recipes-extended/mozjs/mozjs-91/py-3.11.patch
> rename to meta-oe/recipes-extended/mozjs/mozjs-102/py-3.11.patch
> index 71da8225a..85af54709 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-91/py-3.11.patch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-102/py-3.11.patch
> @@ -1,3 +1,7 @@
> +From 1479dd9c75917d2be70ee840c9db141e59987e44 Mon Sep 17 00:00:00=20
> 2001
> +From: Alexander Kanavin <alex@linutronix.de=20
> <mailto:alex@linutronix.de>>
> +Date: Wed, 14 Sep 2022 14:03:10 +0200
> +Subject: [PATCH] mozjs-91: backport a python 3.11 compatibility patch
>=20
>  # HG changeset patch
>  # User ahochheiden <ahochheiden@mozilla.com=20
> <mailto:ahochheiden@mozilla.com>>
> @@ -19,15 +23,20 @@ Differential Revision:=20
> https://phabricator.services.mozilla.com/D147721
>  Upstream-Status: Backport=20
> [<https://hg.mozilla.org/mozilla-central/rev/f54162b2c1f2fe52c6137ab2c346=
9a1944f58b27>]
>  Signed-off-by: Alexander Kanavin <alex@linutronix.de=20
> <mailto:alex@linutronix.de>>
>=20
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
> - # file, You can obtain one at <http://mozilla.org/MPL/2.0/>.
> -
> - import collections
> - import re
> -
> +@@ -8,7 +8,7 @@ import re
>=20
>   def read_conf(conf_filename):
>       # Can't read/write from a single StringIO, so make a new one=20
> for reading.
> @@ -36,20 +45,11 @@ diff --git a/dom/base/usecounters.py=20
> b/dom/base/usecounters.py
>=20
>       def parse_counters(stream):
>           for line_num, line in enumerate(stream):
> -             line =3D line.rstrip("\n")
> -             if not line or line.startswith("//"):
> -                 # empty line or comment
> -                 continue
> -             m =3D re.match(r"method ([A-Za-z0-9]+)\.([A-Za-z0-9]+)$",=20
> line)
>  diff --git a/python/mozbuild/mozbuild/action/process_define_files.py=20
> b/python/mozbuild/mozbuild/action/process_define_files.py
> +index f1d401ac26..aca59d0f05 100644
>  --- a/python/mozbuild/mozbuild/action/process_define_files.py
>  +++ b/python/mozbuild/mozbuild/action/process_define_files.py
> -@@ -31,17 +31,17 @@ def process_define_file(output, input):
> -
> -     config =3D PartialConfigEnvironment(topobjdir)
> -
> -     if mozpath.basedir(
> -         path, [mozpath.join(topsrcdir, "js/src")]
> +@@ -36,7 +36,7 @@ def process_define_file(output, input):
>       ) and not config.substs.get("JS_STANDALONE"):
>           config =3D PartialConfigEnvironment(mozpath.join(topobjdir,=20
> "js", "src"))
>=20
> @@ -58,20 +58,11 @@ diff --git=20
> a/python/mozbuild/mozbuild/action/process_define_files.py b/python/mo
>           r =3D re.compile(
>              =20
> "^\s*#\s*(?P<cmd>[a-z]+)(?:\s+(?P<name>\S+)(?:\s+(?P<value>\S+))?)?",=20
> re.U
>           )
> -         for l in input:
> -             m =3D r.match(l)
> -             if m:
> -                 cmd =3D m.group("cmd")
> -                 name =3D m.group("name")
>  diff --git a/python/mozbuild/mozbuild/backend/base.py=20
> b/python/mozbuild/mozbuild/backend/base.py
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
>=20
>       @contextmanager
> @@ -80,20 +71,11 @@ diff --git=20
> a/python/mozbuild/mozbuild/backend/base.py b/python/mozbuild/mozbuild
>           """Context manager to write a file.
>=20
>           This is a glorified wrapper around FileAvoidWrite with=20
> integration to
> -         update the summary data on this instance.
> -
> -         Example usage:
> -
> -             with self._write_file('foo.txt') as fh:
>  diff --git a/python/mozbuild/mozbuild/preprocessor.py=20
> b/python/mozbuild/mozbuild/preprocessor.py
> +index f7820b9c91..857f1a6c9b 100644
>  --- a/python/mozbuild/mozbuild/preprocessor.py
>  +++ b/python/mozbuild/mozbuild/preprocessor.py
> -@@ -526,17 +526,17 @@ class Preprocessor:
> -             if not options.output:
> -                 raise Preprocessor.Error(
> -                     self, "--depend doesn't work with stdout", None
> -                 )
> -             depfile =3D get_output_file(options.depend)
> +@@ -531,7 +531,7 @@ class Preprocessor:
>=20
>           if args:
>               for f in args:
> @@ -102,17 +84,7 @@ diff --git=20
> a/python/mozbuild/mozbuild/preprocessor.py b/python/mozbuild/mozbuild
>                       self.processFile(input=3Dinput, output=3Dout)
>               if depfile:
>                   mk =3D Makefile()
> -                =20
> mk.create_rule([six.ensure_text(options.output)]).add_dependencies(
> -                     self.includes
> -                 )
> -                 mk.dump(depfile)
> -                 depfile.close()
> -@@ -855,17 +855,17 @@ class Preprocessor:
> -         self.checkLineNumbers =3D False
> -         if isName:
> -             try:
> -                 args =3D _to_text(args)
> -                 if filters:
> +@@ -860,7 +860,7 @@ class Preprocessor:
>                       args =3D self.applyFilters(args)
>                   if not os.path.isabs(args):
>                       args =3D os.path.join(self.curdir, args)
> @@ -121,17 +93,7 @@ diff --git=20
> a/python/mozbuild/mozbuild/preprocessor.py b/python/mozbuild/mozbuild
>               except Preprocessor.Error:
>                   raise
>               except Exception:
> -                 raise Preprocessor.Error(self, "FILE_NOT_FOUND",=20
> _to_text(args))
> -         self.checkLineNumbers =3D bool(
> -             re.search("\.(js|jsm|java|webidl)(?:\.in)?$", args.name)
> -         )
> -         oldFile =3D self.context["FILE"]
> -@@ -909,17 +909,17 @@ class Preprocessor:
> -
> -     def do_error(self, args):
> -         raise Preprocessor.Error(self, "Error: ", _to_text(args))
> -
> -
> +@@ -914,7 +914,7 @@ class Preprocessor:
>   def preprocess(includes=3D[sys.stdin], defines=3D{}, output=3Dsys.stdou=
t,=20
> marker=3D"#"):
>       pp =3D Preprocessor(defines=3Ddefines, marker=3Dmarker)
>       for f in includes:
> @@ -140,20 +102,11 @@ diff --git=20
> a/python/mozbuild/mozbuild/preprocessor.py b/python/mozbuild/mozbuild
>               pp.processFile(input=3Dinput, output=3Doutput)
>       return pp.includes
>=20
> -
> - # Keep this module independently executable.
> - if __name__ =3D=3D "__main__":
> -     pp =3D Preprocessor()
> -     pp.handleCommandLine(None, True)
>  diff --git a/python/mozbuild/mozbuild/util.py=20
> b/python/mozbuild/mozbuild/util.py
> +index b09f164698..4f1e0cdc5f 100644
>  --- a/python/mozbuild/mozbuild/util.py
>  +++ b/python/mozbuild/mozbuild/util.py
> -@@ -231,17 +231,17 @@ class FileAvoidWrite(BytesIO):
> -     enabled by default because it a) doesn't make sense for binary=20
> files b)
> -     could add unwanted overhead to calls.
> -
> -     Additionally, there is dry run mode where the file is not=20
> actually written
> -     out, but reports whether the file was existing and would have=20
> been updated
> +@@ -236,7 +236,7 @@ class FileAvoidWrite(BytesIO):
>       still occur, as well as diff capture if requested.
>       """
>=20
> @@ -162,20 +115,11 @@ diff --git a/python/mozbuild/mozbuild/util.py=20
> b/python/mozbuild/mozbuild/util.py
>           BytesIO.__init__(self)
>           self.name =3D filename
>           assert type(capture_diff) =3D=3D bool
> -         assert type(dry_run) =3D=3D bool
> -         assert "r" in readmode
> -         self._capture_diff =3D capture_diff
> -         self._write_to_file =3D not dry_run
> -         self.diff =3D None
>  diff --git a/python/mozbuild/mozpack/files.py=20
> b/python/mozbuild/mozpack/files.py
> +index 1d8a1ed2d8..a295a67b5a 100644
>  --- a/python/mozbuild/mozpack/files.py
>  +++ b/python/mozbuild/mozpack/files.py
> -@@ -549,17 +549,17 @@ class PreprocessedFile(BaseFile):
> -         self.defines =3D defines
> -         self.extra_depends =3D list(extra_depends or [])
> -         self.silence_missing_directive_warnings =3D=20
> silence_missing_directive_warnings
> -
> -     def inputs(self):
> +@@ -554,7 +554,7 @@ class PreprocessedFile(BaseFile):
>           pp =3D Preprocessor(defines=3Dself.defines, marker=3Dself.marke=
r)
>          =20
> pp.setSilenceDirectiveWarnings(self.silence_missing_directive_warnings)
>=20
> @@ -184,17 +128,7 @@ diff --git a/python/mozbuild/mozpack/files.py=20
> b/python/mozbuild/mozpack/files.py
>               with _open(os.devnull, "w") as output:
>                   pp.processFile(input=3Dinput, output=3Doutput)
>=20
> -         # This always yields at least self.path.
> -         return pp.includes
> -
> -     def copy(self, dest, skip_if_older=3DTrue):
> -         """
> -@@ -606,17 +606,17 @@ class PreprocessedFile(BaseFile):
> -             return False
> -
> -         deps_out =3D None
> -         if self.depfile:
> -             deps_out =3D FileAvoidWrite(self.depfile)
> +@@ -611,7 +611,7 @@ class PreprocessedFile(BaseFile):
>           pp =3D Preprocessor(defines=3Dself.defines, marker=3Dself.marke=
r)
>          =20
> pp.setSilenceDirectiveWarnings(self.silence_missing_directive_warnings)
>=20
> @@ -203,9 +137,3 @@ diff --git a/python/mozbuild/mozpack/files.py=20
> b/python/mozbuild/mozpack/files.py
>               pp.processFile(input=3Dinput, output=3Ddest,=20
> depfile=3Ddeps_out)
>=20
>           dest.close()
> -         if self.depfile:
> -             deps_out.close()
> -
> -         return True
> -
> -
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/riscv32.patch=20
> b/meta-oe/recipes-extended/mozjs/mozjs-102/riscv32.patch
> similarity index 56%
> rename from meta-oe/recipes-extended/mozjs/mozjs-91/riscv32.patch
> rename to meta-oe/recipes-extended/mozjs/mozjs-102/riscv32.patch
> index fe9c332a0..a6a0a9ede 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-91/riscv32.patch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-102/riscv32.patch
> @@ -1,11 +1,22 @@
> -Add RISCV32 support
> +From 81385fe53ffde5e1636e9ace0736d914da8dbc0f Mon Sep 17 00:00:00=20
> 2001
> +From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
> +Date: Sun, 24 Oct 2021 22:32:50 -0700
> +Subject: [PATCH] Add RISCV32 support
>=20
>  Upstream-Status: Pending
>  Signed-off-by: Khem Raj <raj.khem@gmail.com=20
> <mailto:raj.khem@gmail.com>>
>=20
> +---
> + build/moz.configure/init.configure                             | 3=20
> +++
> + python/mozbuild/mozbuild/configure/constants.py                | 2=20
> ++
> + .../mozbuild/test/configure/test_toolchain_configure.py        | 1 +
> + 3 files changed, 6 insertions(+)
> +
> +diff --git a/build/moz.configure/init.configure=20
> b/build/moz.configure/init.configure
> +index 0b7a2ff60f..54f8325b44 100644
>  --- a/build/moz.configure/init.configure
>  +++ b/build/moz.configure/init.configure
> -@@ -765,6 +765,9 @@ def split_triplet(triplet, allow_msvc=3DFa
> +@@ -524,6 +524,9 @@ def split_triplet(triplet, allow_msvc=3DFalse,=20
> allow_wasi=3DFalse):
>       elif cpu.startswith("aarch64"):
>           canonical_cpu =3D "aarch64"
>           endianness =3D "little"
> @@ -15,9 +26,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>       elif cpu in ("riscv64", "riscv64gc"):
>           canonical_cpu =3D "riscv64"
>           endianness =3D "little"
> +diff --git a/python/mozbuild/mozbuild/configure/constants.py=20
> b/python/mozbuild/mozbuild/configure/constants.py
> +index c71460cb20..15bef93e19 100644
>  --- a/python/mozbuild/mozbuild/configure/constants.py
>  +++ b/python/mozbuild/mozbuild/configure/constants.py
> -@@ -52,6 +52,7 @@ CPU_bitness =3D {
> +@@ -53,6 +53,7 @@ CPU_bitness =3D {
>       "mips64": 64,
>       "ppc": 32,
>       "ppc64": 64,
> @@ -25,17 +38,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>       "riscv64": 64,
>       "s390": 32,
>       "s390x": 64,
> -@@ -94,6 +95,7 @@ CPU_preprocessor_checks =3D OrderedDict(
> +@@ -95,6 +96,7 @@ CPU_preprocessor_checks =3D OrderedDict(
>           ("m68k", "__m68k__"),
>           ("mips64", "__mips64"),
>           ("mips32", "__mips__"),
>  +        ("riscv32", "__riscv && __riscv_xlen =3D=3D 32"),
>           ("riscv64", "__riscv && __riscv_xlen =3D=3D 64"),
> +         ("loongarch64", "__loongarch64"),
>           ("sh4", "__sh__"),
> -         ("wasm32", "__wasm32__"),
> +diff --git=20
> a/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py=20
> b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
> +index 059cde0139..4f9986eb31 100644
>  ---=20
> a/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
>  +++=20
> b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
> -@@ -1186,6 +1186,7 @@ class LinuxCrossCompileToolchainTest(Bas
> +@@ -1192,6 +1192,7 @@ class=20
> LinuxCrossCompileToolchainTest(BaseToolchainTest):
>           "m68k-unknown-linux-gnu": big_endian + {"__m68k__": 1},
>           "mips64-unknown-linux-gnuabi64": big_endian + {"__mips64":=20
> 1, "__mips__": 1},
>           "mips-unknown-linux-gnu": big_endian + {"__mips__": 1},
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91_91.13.0.bb=20
> b/meta-oe/recipes-extended/mozjs/mozjs-102_102.5.0.bb
> similarity index 86%
> rename from meta-oe/recipes-extended/mozjs/mozjs-91_91.13.0.bb
> rename to meta-oe/recipes-extended/mozjs/mozjs-102_102.5.0.bb
> index 4c1aa3447..a4d88a340 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-91_91.13.0.bb
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-102_102.5.0.bb
> @@ -11,15 +11,13 @@ SRC_URI =3D=20
> "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire
>             file://fix-musl-build.patch=20
> <file://fix-musl-build.patch/> \
>            =20
> file://0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch=20
> <file://0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch/>=
=20
> \
>             file://riscv32.patch <file://riscv32.patch/> \
> -           file://0005-nojit-32bit-arch-fix.patch=20
> <file://0005-nojit-32bit-arch-fix.patch/> \
> -           file://0006-Fix-build-on-powerpc.patch=20
> <file://0006-fix-build-on-powerpc.patch/> \
>            =20
> file://0001-util.configure-fix-one-occasionally-reproduced-confi.patch=20
> <file://0001-util.configure-fix-one-occasionally-reproduced-confi.patch/>=
=20
> \
>             file://0001-rewrite-cargo-host-linker-in-python3.patch=20
> <file://0001-rewrite-cargo-host-linker-in-python3.patch/>  \
>             file://py-3.11.patch <file://py-3.11.patch/> \
>             "
> -SRC_URI[sha256sum] =3D=20
> "53be2bcde0b5ee3ec106bd8ba06b8ae95e7d489c484e881dfbe5360e4c920762"
> +SRC_URI[sha256sum] =3D=20
> "017dd44b1285913f477074802707a4c76ed1a28270ec5a327bbb76574cc057d8"
>=20
> -S =3D "${WORKDIR}/firefox-${@d.getVar=20
> <mailto:firefox-${@d.getVar>("PV").replace("esr", "")}"
> +S =3D "${WORKDIR}/firefox-${PV}"
>=20
>  inherit pkgconfig perlnative python3native rust
>=20
> @@ -67,12 +65,12 @@ do_install() {
>=20
>  inherit multilib_script multilib_header
>=20
> -MULTILIB_SCRIPTS +=3D " ${PN}-dev:${bindir}/js91-config"
> +MULTILIB_SCRIPTS +=3D " ${PN}-dev:${bindir}/js102-config"
>=20
>  do_install:append() {
> -    oe_multilib_header mozjs-91/js-config.h
> +    oe_multilib_header mozjs-102/js-config.h
>      sed -e 's@${STAGING_DIR_HOST}@@g' \
> -        -i ${D}${bindir}/js91-config
> +        -i ${D}${bindir}/js102-config
>      rm -f ${D}${libdir}/libjs_static.ajs
>  }
>=20
> diff --git=20
> a/meta-oe/recipes-extended/mozjs/mozjs-91/0005-nojit-32bit-arch-fix.patch=
=20
> b/meta-oe/recipes-extended/mozjs/mozjs-91/0005-nojit-32bit-arch-fix.patch
> deleted file mode 100644
> index f308b4863..000000000
> ---=20
> a/meta-oe/recipes-extended/mozjs/mozjs-91/0005-nojit-32bit-arch-fix.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -Fix build when JIT is disabled on 32bit systems
> -
> -This fixes a compile time assert
> -js/src/wasm/WasmFrame.cpp:57:3: error: static_assert failed due to=20
> requirement '(__builtin_offsetof(js::wasm::DebugFrame, frame_) +=20
> sizeof(js::wasm::Frame)) % Alignment =3D=3D 0' "Aligned after pushing=20
> DebugFrame"
> -  static_assert((offsetof(DebugFrame, frame_) + sizeof(Frame)) %=20
> Alignment =3D=3D 0,
> -  ^            =20
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com=20
> <mailto:raj.khem@gmail.com>>
> -
> ---- a/js/src/wasm/WasmFrame.h
> -+++ b/js/src/wasm/WasmFrame.h
> -@@ -230,6 +230,8 @@ class DebugFrame {
> -   // Avoid -Wunused-private-field warnings.
> -  protected:
> - #if defined(JS_CODEGEN_MIPS32) || defined(JS_CODEGEN_ARM) || \
> -+    (defined(JS_CODEGEN_NONE) && \
> -+     (defined(__riscv) && __riscv_xlen =3D=3D 32) || defined(__mips__))=
=20
> || \
> -     defined(JS_CODEGEN_X86) || defined(__wasi__)
> -   // See alignmentStaticAsserts().  For MIPS32, ARM32 and X86=20
> DebugFrame is only
> -   // 4-byte aligned, so we add another word to get up to 8-byte
> diff --git=20
> a/meta-oe/recipes-extended/mozjs/mozjs-91/0006-Fix-build-on-powerpc.patch=
=20
> b/meta-oe/recipes-extended/mozjs/mozjs-91/0006-Fix-build-on-powerpc.patch
> deleted file mode 100644
> index 80bf746e4..000000000
> ---=20
> a/meta-oe/recipes-extended/mozjs/mozjs-91/0006-Fix-build-on-powerpc.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 0e0548e3f95e22a39db8d5b934afe0672a3f801b Mon Sep 17 00:00:00=20
> 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om=20
> <mailto:schnitzeltony@gmail.com>>
> -Date: Mon, 1 Nov 2021 08:13:29 +0100
> -Subject: [PATCH] Fix build on powerpc
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Another fix for (this time JIT enabled)
> -| <...>/irefox-91.2.0/js/src/wasm/WasmFrame.cpp:57:76: error: static=20
> assertion failed: Aligned after pushing DebugFrame
> -|    57 |   static_assert((offsetof(DebugFrame, frame_) +=20
> sizeof(Frame)) % Alignment =3D=3D 0,
> -|       |                =20
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Andreas M=FCller <schnitzeltony@gmail.com=20
> <mailto:schnitzeltony@gmail.com>>
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
> -      (defined(__riscv) && __riscv_xlen =3D=3D 32) || defined(__mips__))=
=20
> || \
> --    defined(JS_CODEGEN_X86) || defined(__wasi__)
> -+    defined(JS_CODEGEN_X86) || defined(__wasi__) ||=20
> defined(__powerpc__)
> -   // See alignmentStaticAsserts().  For MIPS32, ARM32 and X86=20
> DebugFrame is only
> -   // 4-byte aligned, so we add another word to get up to 8-byte
> -   // alignment.
> ---
> -2.31.1
> -
> diff --git=20
> a/meta-oe/recipes-extended/mozjs/mozjs-91/fix-musl-build.patch=20
> b/meta-oe/recipes-extended/mozjs/mozjs-91/fix-musl-build.patch
> deleted file mode 100644
> index c0834af58..000000000
> --- a/meta-oe/recipes-extended/mozjs/mozjs-91/fix-musl-build.patch
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Upstream: No
> -Reason: mozjs60 miscompiles on musl if built with=20
> HAVE_THREAD_TLS_KEYWORD:
> -<https://github.com/void-linux/void-packages/issues/2598>
> ---- a/js/src/old-configure.in
> -+++ b/js/src/old-configure.in
> -@@ -1072,6 +1072,9 @@ if test "$ac_cv_thread_keyword" =3D yes; t
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
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99784):=20
> <https://lists.openembedded.org/g/openembedded-devel/message/99784>
> Mute This Topic: <https://lists.openembedded.org/mt/95296113/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org=20
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-aDGBhRmaDMTwaLqMTOFO
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>This adds back the patch to avoid =
looking for llvm-objdump. I thought this might be unneeded if providing llv=
m-native and on a first look this did work. Since llvm-native will be neede=
d for rust and librsvg anyway, i thought that dependency wouldn't hurt to m=
uch. But it turned out, that also clang-native is needed to build and that =
is not so nice, because it would add a layer dependency on meta-clang and s=
ome additional build time.</div></div><div id=3D"geary-quote" dir=3D"auto">=
<br>Am So, 27. Nov 2022 um 21:13:45 +0100 schrieb Markus Volk &lt;f_l_k@t-o=
nline.de&gt;:<br><blockquote type=3D"cite"><div class=3D"plaintext" style=
=3D"white-space: break-spaces;">Signed-off-by: Markus Volk &lt;<a href=3D"m=
ailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...001-Cargo.toml-do-not-abort-on-panic.patch |  11 +-
 ...-autoconf-s-config.sub-to-canonicali.patch |   7 +-
 ...rewrite-cargo-host-linker-in-python3.patch |  10 +-
 ...ix-one-occasionally-reproduced-confi.patch |  10 +-
 ...nfigure-do-not-look-for-llvm-objdump.patch |  13 +-
 ...o-not-try-to-find-a-suitable-upstrea.patch |   9 +-
 .../0004-use-asm-sgidefs.h.patch              |   9 +-
 .../mozjs/mozjs-102/fix-musl-build.patch      |  27 ++++
 .../{mozjs-91 =3D&gt; mozjs-102}/py-3.11.patch     | 128 ++++-------------=
-
 .../{mozjs-91 =3D&gt; mozjs-102}/riscv32.patch     |  27 +++-
 ...zjs-91_91.13.0.bb =3D&gt; mozjs-102_102.5.0.bb} |  12 +-
 .../mozjs-91/0005-nojit-32bit-arch-fix.patch  |  21 ---
 .../mozjs-91/0006-Fix-build-on-powerpc.patch  |  36 -----
 .../mozjs/mozjs-91/fix-musl-build.patch       |  15 --
 14 files changed, 118 insertions(+), 217 deletions(-)
 rename meta-oe/recipes-extended/mozjs/{mozjs-91 =3D&gt; mozjs-102}/0001-Ca=
rgo.toml-do-not-abort-on-panic.patch (74%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-91 =3D&gt; mozjs-102}/0001-bu=
ild-do-not-use-autoconf-s-config.sub-to-canonicali.patch (84%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-91 =3D&gt; mozjs-102}/0001-re=
write-cargo-host-linker-in-python3.patch (92%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-91 =3D&gt; mozjs-102}/0001-ut=
il.configure-fix-one-occasionally-reproduced-confi.patch (91%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-91 =3D&gt; mozjs-102}/0002-mo=
z.configure-do-not-look-for-llvm-objdump.patch (82%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-91 =3D&gt; mozjs-102}/0003-ru=
st.configure-do-not-try-to-find-a-suitable-upstrea.patch (91%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-91 =3D&gt; mozjs-102}/0004-us=
e-asm-sgidefs.h.patch (79%)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-102/fix-musl-build=
.patch
 rename meta-oe/recipes-extended/mozjs/{mozjs-91 =3D&gt; mozjs-102}/py-3.11=
.patch (59%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-91 =3D&gt; mozjs-102}/riscv32=
.patch (56%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-91_91.13.0.bb =3D&gt; mozjs-1=
02_102.5.0.bb} (86%)
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-91/0005-nojit-32bi=
t-arch-fix.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-91/0006-Fix-build-=
on-powerpc.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-91/fix-musl-build.=
patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-Cargo.toml-do-not=
-abort-on-panic.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-Cargo=
.toml-do-not-abort-on-panic.patch
similarity index 74%
rename from meta-oe/recipes-extended/mozjs/mozjs-91/0001-Cargo.toml-do-not-=
abort-on-panic.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-102/0001-Cargo.toml-do-not-a=
bort-on-panic.patch
index e09848f40..0dd936197 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-Cargo.toml-do-not-abort-=
on-panic.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-Cargo.toml-do-not-abort=
-on-panic.patch
@@ -1,4 +1,4 @@
-From 9e37248870b2b955293754933c789ca00bca06ef Mon Sep 17 00:00:00 2001
+From bb46a8a729cc4d66ad36db40c17e36a5111f19c3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de">alex@lin=
utronix.de</a>&gt;
 Date: Fri, 1 Oct 2021 13:00:24 +0200
 Subject: [PATCH] Cargo.toml: do not abort on panic
@@ -7,13 +7,16 @@ OE's rust is configured to unwind, and this setting clash=
es with it/
=20
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
>alex@linutronix.de</a>&gt;
+
 ---
- Cargo.toml | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
+ Cargo.toml | 2 --
+ 1 file changed, 2 deletions(-)
=20
+diff --git a/Cargo.toml b/Cargo.toml
+index f576534bf3..5ecc17c319 100644
 --- a/Cargo.toml
 +++ b/Cargo.toml
-@@ -51,13 +51,11 @@ opt-level =3D 1
+@@ -56,13 +56,11 @@ opt-level =3D 1
  rpath =3D false
  lto =3D false
  debug-assertions =3D true
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-build-do-not-use-=
autoconf-s-config.sub-to-canonicali.patch b/meta-oe/recipes-extended/mozjs/=
mozjs-102/0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch
similarity index 84%
rename from meta-oe/recipes-extended/mozjs/mozjs-91/0001-build-do-not-use-a=
utoconf-s-config.sub-to-canonicali.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-102/0001-build-do-not-use-au=
toconf-s-config.sub-to-canonicali.patch
index a2ccf6b91..fe905fe4d 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-build-do-not-use-autocon=
f-s-config.sub-to-canonicali.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-build-do-not-use-autoco=
nf-s-config.sub-to-canonicali.patch
@@ -1,4 +1,4 @@
-From e5b95b3918588e2930c9af7ba304c57e871b2d55 Mon Sep 17 00:00:00 2001
+From c860dcbe63b0e393c95bfb0131238f91aaac11d3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de">alex@lin=
utronix.de</a>&gt;
 Date: Thu, 7 Oct 2021 12:44:18 +0200
 Subject: [PATCH] build: do not use autoconf's config.sub to 'canonicalize'
@@ -9,15 +9,16 @@ target definitions, and the build fails.
=20
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
>alex@linutronix.de</a>&gt;
+
 ---
  build/moz.configure/init.configure | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/build/moz.configure/init.configure b/build/moz.configure/init=
.configure
-index 3a164c6558..99dfc9054a 100644
+index 81f500a0b7..0b7a2ff60f 100644
 --- a/build/moz.configure/init.configure
 +++ b/build/moz.configure/init.configure
-@@ -823,7 +823,7 @@ def help_host_target(help, host, target):
+@@ -585,7 +585,7 @@ def help_host_target(help, host, target):
 =20
  def config_sub(shell, triplet):
      config_sub =3D os.path.join(os.path.dirname(__file__), "..", "autocon=
f", "config.sub")
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-rewrite-cargo-hos=
t-linker-in-python3.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-r=
ewrite-cargo-host-linker-in-python3.patch
similarity index 92%
rename from meta-oe/recipes-extended/mozjs/mozjs-91/0001-rewrite-cargo-host=
-linker-in-python3.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-102/0001-rewrite-cargo-host-=
linker-in-python3.patch
index 7b938179c..73bcffe94 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-rewrite-cargo-host-linke=
r-in-python3.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-rewrite-cargo-host-link=
er-in-python3.patch
@@ -1,4 +1,4 @@
-From 9eceb43dd676afe2f675bd65ab369ba4d14f6537 Mon Sep 17 00:00:00 2001
+From 8e318c4e7e732327dabf51027860de45b6fb731e Mon Sep 17 00:00:00 2001
 From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com">chang=
qing.li@windriver.com</a>&gt;
 Date: Thu, 18 Nov 2021 07:16:39 +0000
 Subject: [PATCH] Rewrite cargo-host-linker in python3
@@ -18,12 +18,13 @@ rewrite cargo-host-linker in python3
 Upstream-Status: Inappropriate [oe specific]
=20
 Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om">changqing.li@windriver.com</a>&gt;
+
 ---
- build/cargo-host-linker | 24 +++++++---
+ build/cargo-host-linker | 24 +++++++++++++++++++++---
  1 file changed, 21 insertions(+), 3 deletions(-)
=20
 diff --git a/build/cargo-host-linker b/build/cargo-host-linker
-index cbd0472bf7..ccd8bffec1 100755
+index cbd0472bf7..87d43ce9ec 100755
 --- a/build/cargo-host-linker
 +++ b/build/cargo-host-linker
 @@ -1,3 +1,21 @@
@@ -51,6 +52,3 @@ index cbd0472bf7..ccd8bffec1 100755
 +        args=3D[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + sys.ar=
gv[1:]
 +
 +os.execvp(binary, args)
---=20
-2.33.1
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-util.configure-fi=
x-one-occasionally-reproduced-confi.patch b/meta-oe/recipes-extended/mozjs/=
mozjs-102/0001-util.configure-fix-one-occasionally-reproduced-confi.patch
similarity index 91%
rename from meta-oe/recipes-extended/mozjs/mozjs-91/0001-util.configure-fix=
-one-occasionally-reproduced-confi.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-102/0001-util.configure-fix-=
one-occasionally-reproduced-confi.patch
index 5472eddbb..d732fdaf6 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-util.configure-fix-one-o=
ccasionally-reproduced-confi.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-util.configure-fix-one-=
occasionally-reproduced-confi.patch
@@ -1,4 +1,4 @@
-From b13cad4abc53f816f64c8b0af70cb46820746c72 Mon Sep 17 00:00:00 2001
+From 2a6f66f39b4e623428b6d282bd4cb72dde67c1a6 Mon Sep 17 00:00:00 2001
 From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com">chang=
qing.li@windriver.com</a>&gt;
 Date: Thu, 11 Nov 2021 16:05:54 +0800
 Subject: [PATCH] util.configure: fix one occasionally reproduced configure
@@ -28,15 +28,16 @@ It should be another process that deleted this file by =
using
 Upstream-Status: Submitted [<a href=3D"https://bugzilla.mozilla.org/show_b=
ug.cgi?id=3D1740667">https://bugzilla.mozilla.org/show_bug.cgi?id=3D1740667=
</a>]
=20
 Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om">changqing.li@windriver.com</a>&gt;
+
 ---
  build/moz.configure/util.configure | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/build/moz.configure/util.configure b/build/moz.configure/util=
.configure
-index 8f35e89c73..84e256647d 100644
+index 80c3a34522..0ac0c6b611 100644
 --- a/build/moz.configure/util.configure
 +++ b/build/moz.configure/util.configure
-@@ -222,7 +222,7 @@ def try_invoke_compiler(compiler, language, source, fl=
ags=3DNone, onerror=3DNone):
+@@ -216,7 +216,7 @@ def try_invoke_compiler(compiler, language, source, fl=
ags=3DNone, onerror=3DNone):
          "C++": ".cpp",
      }[language]
 =20
@@ -45,6 +46,3 @@ index 8f35e89c73..84e256647d 100644
      try:
          source =3D source.encode("ascii", "replace")
 =20
---=20
-2.17.1
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/0002-moz.configure-do-=
not-look-for-llvm-objdump.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/=
0002-moz.configure-do-not-look-for-llvm-objdump.patch
similarity index 82%
rename from meta-oe/recipes-extended/mozjs/mozjs-91/0002-moz.configure-do-n=
ot-look-for-llvm-objdump.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-102/0002-moz.configure-do-no=
t-look-for-llvm-objdump.patch
index 6ff83e3bb..b3d3c1ffa 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-91/0002-moz.configure-do-not-loo=
k-for-llvm-objdump.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102/0002-moz.configure-do-not-lo=
ok-for-llvm-objdump.patch
@@ -16,13 +16,13 @@ diff --git a/moz.configure b/moz.configure
 index fc66b520d0..15de9a2ee0 100755
 --- a/moz.configure
 +++ b/moz.configure
-@@ -994,15 +994,15 @@ def llvm_objdump(host_c_compiler, c_compiler, bindge=
n_config_paths):
-     return (llvm_objdump,)
+@@ -785,15 +785,15 @@
+     return llvm_tool
 =20
 =20
 -llvm_objdump =3D check_prog(
 -    "LLVM_OBJDUMP",
--    llvm_objdump,
+-    llvm_tool("llvm-objdump"),
 -    what=3D"llvm-objdump",
 -    when=3D"--enable-compile-environment",
 -    paths=3Dclang_search_path,
@@ -31,13 +31,14 @@ index fc66b520d0..15de9a2ee0 100755
 -add_old_configure_assignment("LLVM_OBJDUMP", llvm_objdump)
 +#llvm_objdump =3D check_prog(
 +#    "LLVM_OBJDUMP",
-+#    llvm_objdump,
++#    llvm_tool("llvm-objdump"),
 +#    what=3D"llvm-objdump",
 +#    when=3D"--enable-compile-environment",
 +#    paths=3Dclang_search_path,
 +#)
-+
++#
 +#add_old_configure_assignment("LLVM_OBJDUMP", llvm_objdump)
 =20
 =20
- option("--enable-dtrace", help=3D"Build with dtrace support")
+ @depends(llvm_tool("llvm-readelf"), toolchain_prefix)
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/0003-rust.configure-do=
-not-try-to-find-a-suitable-upstrea.patch b/meta-oe/recipes-extended/mozjs/=
mozjs-102/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch
similarity index 91%
rename from meta-oe/recipes-extended/mozjs/mozjs-91/0003-rust.configure-do-=
not-try-to-find-a-suitable-upstrea.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-n=
ot-try-to-find-a-suitable-upstrea.patch
index c440bf178..e63b05356 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-91/0003-rust.configure-do-not-tr=
y-to-find-a-suitable-upstrea.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-t=
ry-to-find-a-suitable-upstrea.patch
@@ -1,4 +1,4 @@
-From 749ba11fd6a69c8180945d4866415d16ae06a9c0 Mon Sep 17 00:00:00 2001
+From 33ff25e2b126dd4135006139641d8b7f6e4da200 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de">alex@lin=
utronix.de</a>&gt;
 Date: Fri, 1 Oct 2021 13:02:17 +0200
 Subject: [PATCH] rust.configure: do not try to find a suitable upstream ta=
rget
@@ -7,15 +7,16 @@ OE is using custom targets and so this is bound to fail.
=20
 Upstream-Status: Inapppropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
>alex@linutronix.de</a>&gt;
+
 ---
  build/moz.configure/rust.configure | 34 ++----------------------------
  1 file changed, 2 insertions(+), 32 deletions(-)
=20
 diff --git a/build/moz.configure/rust.configure b/build/moz.configure/rust=
.configure
-index cd77d72bb7..4b6481cbe3 100644
+index e64dc5d5ec..edf21baca6 100644
 --- a/build/moz.configure/rust.configure
 +++ b/build/moz.configure/rust.configure
-@@ -459,33 +459,7 @@ def assert_rust_compile(host_or_target, rustc_target,=
 rustc):
+@@ -471,33 +471,7 @@ def assert_rust_compile(host_or_target, rustc_target,=
 rustc):
  def rust_host_triple(
      rustc, host, compiler_info, rustc_host, rust_supported_targets, arm_t=
arget
  ):
@@ -50,7 +51,7 @@ index cd77d72bb7..4b6481cbe3 100644
 =20
 =20
  @depends(
-@@ -495,11 +469,7 @@ def rust_host_triple(
+@@ -507,11 +481,7 @@ def rust_host_triple(
  def rust_target_triple(
      rustc, target, compiler_info, rust_supported_targets, arm_target
  ):
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/0004-use-asm-sgidefs.h=
.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/0004-use-asm-sgidefs.h.pa=
tch
similarity index 79%
rename from meta-oe/recipes-extended/mozjs/mozjs-91/0004-use-asm-sgidefs.h.=
patch
rename to meta-oe/recipes-extended/mozjs/mozjs-102/0004-use-asm-sgidefs.h.p=
atch
index b56f0b95b..ff28654b5 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-91/0004-use-asm-sgidefs.h.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102/0004-use-asm-sgidefs.h.patch
@@ -1,4 +1,4 @@
-From 65acc8800dba7e10da882871d4648241805c47ce Mon Sep 17 00:00:00 2001
+From 0ec73937b01869a701ed9b60a6a84469e035ded4 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy &lt;<a href=3D"mailto:amccurdy@gmail.com">amccurdy@gma=
il.com</a>&gt;
 Date: Sat, 30 Apr 2016 15:29:06 -0700
 Subject: [PATCH] use &lt;asm/sgidefs.h&gt;
@@ -18,13 +18,16 @@ Taken from: https://sourceware.org/bugzilla/show_bug.cg=
i?id=3D21070]
 Signed-off-by: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com">ar=
mccurdy@gmail.com</a>&gt;
 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;
 Signed-off-by: Vicente Olivert Riera &lt;<a href=3D"mailto:Vincent.Riera@i=
mgtec.com">Vincent.Riera@imgtec.com</a>&gt;
+
 ---
- gdb/mips-linux-nat.c | 2 +-
+ mfbt/RandomNum.cpp | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
+diff --git a/mfbt/RandomNum.cpp b/mfbt/RandomNum.cpp
+index 23381db0cd..7f127c0715 100644
 --- a/mfbt/RandomNum.cpp
 +++ b/mfbt/RandomNum.cpp
-@@ -52,7 +52,7 @@ extern "C" BOOLEAN NTAPI RtlGenRandom(PV
+@@ -52,7 +52,7 @@ extern "C" BOOLEAN NTAPI RtlGenRandom(PVOID RandomBuffer=
,
  #  elif defined(__s390__)
  #    define GETRANDOM_NR 349
  #  elif defined(__mips__)
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102/fix-musl-build.patch =
b/meta-oe/recipes-extended/mozjs/mozjs-102/fix-musl-build.patch
new file mode 100644
index 000000000..f847979ea
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102/fix-musl-build.patch
@@ -0,0 +1,27 @@
+From 1110483c6c06adf2d03ed9154a8957defc175c80 Mon Sep 17 00:00:00 2001
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;
+Date: Wed, 20 Oct 2021 16:21:14 -0700
+Subject: [PATCH] mozjs: Fix musl miscompiles with HAVE_THREAD_TLS_KEYWORD
+
+Upstream: No
+Reason: mozjs60 miscompiles on musl if built with HAVE_THREAD_TLS_KEYWORD:
+<a href=3D"https://github.com/void-linux/void-packages/issues/2598">https:=
//github.com/void-linux/void-packages/issues/2598</a>
+
+---
+ js/src/old-configure.in | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/js/src/old-configure.in b/js/src/old-configure.in
+index 8dfd75c63d..c82e580428 100644
+--- a/js/src/old-configure.in
++++ b/js/src/old-configure.in
+@@ -839,6 +839,9 @@ if test "$ac_cv_thread_keyword" =3D yes; then
+     *-android*|*-linuxandroid*)
+       :
+       ;;
++    *-musl*)
++      :
++      ;;
+     *)
+       AC_DEFINE(HAVE_THREAD_TLS_KEYWORD)
+       ;;
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/py-3.11.patch b/meta-o=
e/recipes-extended/mozjs/mozjs-102/py-3.11.patch
similarity index 59%
rename from meta-oe/recipes-extended/mozjs/mozjs-91/py-3.11.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-102/py-3.11.patch
index 71da8225a..85af54709 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-91/py-3.11.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102/py-3.11.patch
@@ -1,3 +1,7 @@
+From 1479dd9c75917d2be70ee840c9db141e59987e44 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de">alex@lin=
utronix.de</a>&gt;
+Date: Wed, 14 Sep 2022 14:03:10 +0200
+Subject: [PATCH] mozjs-91: backport a python 3.11 compatibility patch
=20
 # HG changeset patch
 # User ahochheiden &lt;<a href=3D"mailto:ahochheiden@mozilla.com">ahochhei=
den@mozilla.com</a>&gt;
@@ -19,15 +23,20 @@ Differential Revision: https://phabricator.services.moz=
illa.com/D147721
 Upstream-Status: Backport [<a href=3D"https://hg.mozilla.org/mozilla-centr=
al/rev/f54162b2c1f2fe52c6137ab2c3469a1944f58b27">https://hg.mozilla.org/moz=
illa-central/rev/f54162b2c1f2fe52c6137ab2c3469a1944f58b27</a>]
 Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
>alex@linutronix.de</a>&gt;
=20
+---
+ dom/base/usecounters.py                                 | 2 +-
+ python/mozbuild/mozbuild/action/process_define_files.py | 2 +-
+ python/mozbuild/mozbuild/backend/base.py                | 2 +-
+ python/mozbuild/mozbuild/preprocessor.py                | 6 +++---
+ python/mozbuild/mozbuild/util.py                        | 2 +-
+ python/mozbuild/mozpack/files.py                        | 4 ++--
+ 6 files changed, 9 insertions(+), 9 deletions(-)
+
 diff --git a/dom/base/usecounters.py b/dom/base/usecounters.py
+index 780e3b32b2..7e2c7148ec 100644
 --- a/dom/base/usecounters.py
 +++ b/dom/base/usecounters.py
-@@ -3,17 +3,17 @@
- # file, You can obtain one at <a href=3D"http://mozilla.org/MPL/2.0/">htt=
p://mozilla.org/MPL/2.0/</a>.
-=20
- import collections
- import re
-=20
+@@ -8,7 +8,7 @@ import re
 =20
  def read_conf(conf_filename):
      # Can't read/write from a single StringIO, so make a new one for read=
ing.
@@ -36,20 +45,11 @@ diff --git a/dom/base/usecounters.py b/dom/base/usecoun=
ters.py
 =20
      def parse_counters(stream):
          for line_num, line in enumerate(stream):
-             line =3D line.rstrip("\n")
-             if not line or line.startswith("//"):
-                 # empty line or comment
-                 continue
-             m =3D re.match(r"method ([A-Za-z0-9]+)\.([A-Za-z0-9]+)$", lin=
e)
 diff --git a/python/mozbuild/mozbuild/action/process_define_files.py b/pyt=
hon/mozbuild/mozbuild/action/process_define_files.py
+index f1d401ac26..aca59d0f05 100644
 --- a/python/mozbuild/mozbuild/action/process_define_files.py
 +++ b/python/mozbuild/mozbuild/action/process_define_files.py
-@@ -31,17 +31,17 @@ def process_define_file(output, input):
-=20
-     config =3D PartialConfigEnvironment(topobjdir)
-=20
-     if mozpath.basedir(
-         path, [mozpath.join(topsrcdir, "js/src")]
+@@ -36,7 +36,7 @@ def process_define_file(output, input):
      ) and not config.substs.get("JS_STANDALONE"):
          config =3D PartialConfigEnvironment(mozpath.join(topobjdir, "js",=
 "src"))
 =20
@@ -58,20 +58,11 @@ diff --git a/python/mozbuild/mozbuild/action/process_de=
fine_files.py b/python/mo
          r =3D re.compile(
              "^\s*#\s*(?P&lt;cmd&gt;[a-z]+)(?:\s+(?P&lt;name&gt;\S+)(?:\s+=
(?P&lt;value&gt;\S+))?)?", re.U
          )
-         for l in input:
-             m =3D r.match(l)
-             if m:
-                 cmd =3D m.group("cmd")
-                 name =3D m.group("name")
 diff --git a/python/mozbuild/mozbuild/backend/base.py b/python/mozbuild/mo=
zbuild/backend/base.py
+index 7bc1986d86..b64a709468 100644
 --- a/python/mozbuild/mozbuild/backend/base.py
 +++ b/python/mozbuild/mozbuild/backend/base.py
-@@ -267,17 +267,17 @@ class BuildBackend(LoggingMixin):
-         If an exception is raised, |mach build| will fail with a
-         non-zero exit code.
-         """
-         self._write_purgecaches(config)
-=20
+@@ -272,7 +272,7 @@ class BuildBackend(LoggingMixin):
          return status
 =20
      @contextmanager
@@ -80,20 +71,11 @@ diff --git a/python/mozbuild/mozbuild/backend/base.py b=
/python/mozbuild/mozbuild
          """Context manager to write a file.
 =20
          This is a glorified wrapper around FileAvoidWrite with integratio=
n to
-         update the summary data on this instance.
-=20
-         Example usage:
-=20
-             with self._write_file('foo.txt') as fh:
 diff --git a/python/mozbuild/mozbuild/preprocessor.py b/python/mozbuild/mo=
zbuild/preprocessor.py
+index f7820b9c91..857f1a6c9b 100644
 --- a/python/mozbuild/mozbuild/preprocessor.py
 +++ b/python/mozbuild/mozbuild/preprocessor.py
-@@ -526,17 +526,17 @@ class Preprocessor:
-             if not options.output:
-                 raise Preprocessor.Error(
-                     self, "--depend doesn't work with stdout", None
-                 )
-             depfile =3D get_output_file(options.depend)
+@@ -531,7 +531,7 @@ class Preprocessor:
 =20
          if args:
              for f in args:
@@ -102,17 +84,7 @@ diff --git a/python/mozbuild/mozbuild/preprocessor.py b=
/python/mozbuild/mozbuild
                      self.processFile(input=3Dinput, output=3Dout)
              if depfile:
                  mk =3D Makefile()
-                 mk.create_rule([six.ensure_text(options.output)]).add_dep=
endencies(
-                     self.includes
-                 )
-                 mk.dump(depfile)
-                 depfile.close()
-@@ -855,17 +855,17 @@ class Preprocessor:
-         self.checkLineNumbers =3D False
-         if isName:
-             try:
-                 args =3D _to_text(args)
-                 if filters:
+@@ -860,7 +860,7 @@ class Preprocessor:
                      args =3D self.applyFilters(args)
                  if not os.path.isabs(args):
                      args =3D os.path.join(self.curdir, args)
@@ -121,17 +93,7 @@ diff --git a/python/mozbuild/mozbuild/preprocessor.py b=
/python/mozbuild/mozbuild
              except Preprocessor.Error:
                  raise
              except Exception:
-                 raise Preprocessor.Error(self, "FILE_NOT_FOUND", _to_text=
(args))
-         self.checkLineNumbers =3D bool(
-             re.search("\.(js|jsm|java|webidl)(?:\.in)?$", args.name)
-         )
-         oldFile =3D self.context["FILE"]
-@@ -909,17 +909,17 @@ class Preprocessor:
-=20
-     def do_error(self, args):
-         raise Preprocessor.Error(self, "Error: ", _to_text(args))
-=20
-=20
+@@ -914,7 +914,7 @@ class Preprocessor:
  def preprocess(includes=3D[sys.stdin], defines=3D{}, output=3Dsys.stdout,=
 marker=3D"#"):
      pp =3D Preprocessor(defines=3Ddefines, marker=3Dmarker)
      for f in includes:
@@ -140,20 +102,11 @@ diff --git a/python/mozbuild/mozbuild/preprocessor.py=
 b/python/mozbuild/mozbuild
              pp.processFile(input=3Dinput, output=3Doutput)
      return pp.includes
 =20
-=20
- # Keep this module independently executable.
- if __name__ =3D=3D "__main__":
-     pp =3D Preprocessor()
-     pp.handleCommandLine(None, True)
 diff --git a/python/mozbuild/mozbuild/util.py b/python/mozbuild/mozbuild/u=
til.py
+index b09f164698..4f1e0cdc5f 100644
 --- a/python/mozbuild/mozbuild/util.py
 +++ b/python/mozbuild/mozbuild/util.py
-@@ -231,17 +231,17 @@ class FileAvoidWrite(BytesIO):
-     enabled by default because it a) doesn't make sense for binary files =
b)
-     could add unwanted overhead to calls.
-=20
-     Additionally, there is dry run mode where the file is not actually wr=
itten
-     out, but reports whether the file was existing and would have been up=
dated
+@@ -236,7 +236,7 @@ class FileAvoidWrite(BytesIO):
      still occur, as well as diff capture if requested.
      """
 =20
@@ -162,20 +115,11 @@ diff --git a/python/mozbuild/mozbuild/util.py b/pytho=
n/mozbuild/mozbuild/util.py
          BytesIO.__init__(self)
          self.name =3D filename
          assert type(capture_diff) =3D=3D bool
-         assert type(dry_run) =3D=3D bool
-         assert "r" in readmode
-         self._capture_diff =3D capture_diff
-         self._write_to_file =3D not dry_run
-         self.diff =3D None
 diff --git a/python/mozbuild/mozpack/files.py b/python/mozbuild/mozpack/fi=
les.py
+index 1d8a1ed2d8..a295a67b5a 100644
 --- a/python/mozbuild/mozpack/files.py
 +++ b/python/mozbuild/mozpack/files.py
-@@ -549,17 +549,17 @@ class PreprocessedFile(BaseFile):
-         self.defines =3D defines
-         self.extra_depends =3D list(extra_depends or [])
-         self.silence_missing_directive_warnings =3D silence_missing_direc=
tive_warnings
-=20
-     def inputs(self):
+@@ -554,7 +554,7 @@ class PreprocessedFile(BaseFile):
          pp =3D Preprocessor(defines=3Dself.defines, marker=3Dself.marker)
          pp.setSilenceDirectiveWarnings(self.silence_missing_directive_war=
nings)
 =20
@@ -184,17 +128,7 @@ diff --git a/python/mozbuild/mozpack/files.py b/python=
/mozbuild/mozpack/files.py
              with _open(os.devnull, "w") as output:
                  pp.processFile(input=3Dinput, output=3Doutput)
 =20
-         # This always yields at least self.path.
-         return pp.includes
-=20
-     def copy(self, dest, skip_if_older=3DTrue):
-         """
-@@ -606,17 +606,17 @@ class PreprocessedFile(BaseFile):
-             return False
-=20
-         deps_out =3D None
-         if self.depfile:
-             deps_out =3D FileAvoidWrite(self.depfile)
+@@ -611,7 +611,7 @@ class PreprocessedFile(BaseFile):
          pp =3D Preprocessor(defines=3Dself.defines, marker=3Dself.marker)
          pp.setSilenceDirectiveWarnings(self.silence_missing_directive_war=
nings)
 =20
@@ -203,9 +137,3 @@ diff --git a/python/mozbuild/mozpack/files.py b/python/=
mozbuild/mozpack/files.py
              pp.processFile(input=3Dinput, output=3Ddest, depfile=3Ddeps_o=
ut)
 =20
          dest.close()
-         if self.depfile:
-             deps_out.close()
-=20
-         return True
-=20
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/riscv32.patch b/meta-o=
e/recipes-extended/mozjs/mozjs-102/riscv32.patch
similarity index 56%
rename from meta-oe/recipes-extended/mozjs/mozjs-91/riscv32.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-102/riscv32.patch
index fe9c332a0..a6a0a9ede 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-91/riscv32.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102/riscv32.patch
@@ -1,11 +1,22 @@
-Add RISCV32 support
+From 81385fe53ffde5e1636e9ace0736d914da8dbc0f Mon Sep 17 00:00:00 2001
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;
+Date: Sun, 24 Oct 2021 22:32:50 -0700
+Subject: [PATCH] Add RISCV32 support
=20
 Upstream-Status: Pending
 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;
=20
+---
+ build/moz.configure/init.configure                             | 3 +++
+ python/mozbuild/mozbuild/configure/constants.py                | 2 ++
+ .../mozbuild/test/configure/test_toolchain_configure.py        | 1 +
+ 3 files changed, 6 insertions(+)
+
+diff --git a/build/moz.configure/init.configure b/build/moz.configure/init=
.configure
+index 0b7a2ff60f..54f8325b44 100644
 --- a/build/moz.configure/init.configure
 +++ b/build/moz.configure/init.configure
-@@ -765,6 +765,9 @@ def split_triplet(triplet, allow_msvc=3DFa
+@@ -524,6 +524,9 @@ def split_triplet(triplet, allow_msvc=3DFalse, allow_w=
asi=3DFalse):
      elif cpu.startswith("aarch64"):
          canonical_cpu =3D "aarch64"
          endianness =3D "little"
@@ -15,9 +26,11 @@ Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;
      elif cpu in ("riscv64", "riscv64gc"):
          canonical_cpu =3D "riscv64"
          endianness =3D "little"
+diff --git a/python/mozbuild/mozbuild/configure/constants.py b/python/mozb=
uild/mozbuild/configure/constants.py
+index c71460cb20..15bef93e19 100644
 --- a/python/mozbuild/mozbuild/configure/constants.py
 +++ b/python/mozbuild/mozbuild/configure/constants.py
-@@ -52,6 +52,7 @@ CPU_bitness =3D {
+@@ -53,6 +53,7 @@ CPU_bitness =3D {
      "mips64": 64,
      "ppc": 32,
      "ppc64": 64,
@@ -25,17 +38,19 @@ Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;
      "riscv64": 64,
      "s390": 32,
      "s390x": 64,
-@@ -94,6 +95,7 @@ CPU_preprocessor_checks =3D OrderedDict(
+@@ -95,6 +96,7 @@ CPU_preprocessor_checks =3D OrderedDict(
          ("m68k", "__m68k__"),
          ("mips64", "__mips64"),
          ("mips32", "__mips__"),
 +        ("riscv32", "__riscv &amp;&amp; __riscv_xlen =3D=3D 32"),
          ("riscv64", "__riscv &amp;&amp; __riscv_xlen =3D=3D 64"),
+         ("loongarch64", "__loongarch64"),
          ("sh4", "__sh__"),
-         ("wasm32", "__wasm32__"),
+diff --git a/python/mozbuild/mozbuild/test/configure/test_toolchain_config=
ure.py b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.p=
y
+index 059cde0139..4f9986eb31 100644
 --- a/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
 +++ b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
-@@ -1186,6 +1186,7 @@ class LinuxCrossCompileToolchainTest(Bas
+@@ -1192,6 +1192,7 @@ class LinuxCrossCompileToolchainTest(BaseToolchainTe=
st):
          "m68k-unknown-linux-gnu": big_endian + {"__m68k__": 1},
          "mips64-unknown-linux-gnuabi64": big_endian + {"__mips64": 1, "__=
mips__": 1},
          "mips-unknown-linux-gnu": big_endian + {"__mips__": 1},
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91_91.13.0.bb b/meta-oe/r=
ecipes-extended/mozjs/mozjs-102_102.5.0.bb
similarity index 86%
rename from meta-oe/recipes-extended/mozjs/mozjs-91_91.13.0.bb
rename to meta-oe/recipes-extended/mozjs/mozjs-102_102.5.0.bb
index 4c1aa3447..a4d88a340 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-91_91.13.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102_102.5.0.bb
@@ -11,15 +11,13 @@ SRC_URI =3D "https://archive.mozilla.org/pub/firefox/re=
leases/${PV}esr/source/fire
            <a href=3D"file://fix-musl-build.patch">file://fix-musl-build.p=
atch</a> \
            <a href=3D"file://0001-build-do-not-use-autoconf-s-config.sub-t=
o-canonicali.patch">file://0001-build-do-not-use-autoconf-s-config.sub-to-c=
anonicali.patch</a> \
            <a href=3D"file://riscv32.patch">file://riscv32.patch</a> \
-           <a href=3D"file://0005-nojit-32bit-arch-fix.patch">file://0005-=
nojit-32bit-arch-fix.patch</a> \
-           <a href=3D"file://0006-Fix-build-on-powerpc.patch">file://0006-=
Fix-build-on-powerpc.patch</a> \
            <a href=3D"file://0001-util.configure-fix-one-occasionally-repr=
oduced-confi.patch">file://0001-util.configure-fix-one-occasionally-reprodu=
ced-confi.patch</a> \
            <a href=3D"file://0001-rewrite-cargo-host-linker-in-python3.pat=
ch">file://0001-rewrite-cargo-host-linker-in-python3.patch</a>  \
            <a href=3D"file://py-3.11.patch">file://py-3.11.patch</a> \
            "
-SRC_URI[sha256sum] =3D "53be2bcde0b5ee3ec106bd8ba06b8ae95e7d489c484e881dfb=
e5360e4c920762"
+SRC_URI[sha256sum] =3D "017dd44b1285913f477074802707a4c76ed1a28270ec5a327b=
bb76574cc057d8"
=20
-S =3D "${WORKDIR}/<a href=3D"mailto:firefox-${@d.getVar">firefox-${@d.getV=
ar</a>("PV").replace("esr", "")}"
+S =3D "${WORKDIR}/firefox-${PV}"
=20
 inherit pkgconfig perlnative python3native rust
=20
@@ -67,12 +65,12 @@ do_install() {
=20
 inherit multilib_script multilib_header
=20
-MULTILIB_SCRIPTS +=3D " ${PN}-dev:${bindir}/js91-config"
+MULTILIB_SCRIPTS +=3D " ${PN}-dev:${bindir}/js102-config"
=20
 do_install:append() {
-    oe_multilib_header mozjs-91/js-config.h
+    oe_multilib_header mozjs-102/js-config.h
     sed -e 's@${STAGING_DIR_HOST}@@g' \
-        -i ${D}${bindir}/js91-config
+        -i ${D}${bindir}/js102-config
     rm -f ${D}${libdir}/libjs_static.ajs
 }
=20
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/0005-nojit-32bit-arch-=
fix.patch b/meta-oe/recipes-extended/mozjs/mozjs-91/0005-nojit-32bit-arch-f=
ix.patch
deleted file mode 100644
index f308b4863..000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-91/0005-nojit-32bit-arch-fix.pat=
ch
+++ /dev/null
@@ -1,21 +0,0 @@
-Fix build when JIT is disabled on 32bit systems
-
-This fixes a compile time assert
-js/src/wasm/WasmFrame.cpp:57:3: error: static_assert failed due to require=
ment '(__builtin_offsetof(js::wasm::DebugFrame, frame_) + sizeof(js::wasm::=
Frame)) % Alignment =3D=3D 0' "Aligned after pushing DebugFrame"
-  static_assert((offsetof(DebugFrame, frame_) + sizeof(Frame)) % Alignment=
 =3D=3D 0,
-  ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;
-
---- a/js/src/wasm/WasmFrame.h
-+++ b/js/src/wasm/WasmFrame.h
-@@ -230,6 +230,8 @@ class DebugFrame {
-   // Avoid -Wunused-private-field warnings.
-  protected:
- #if defined(JS_CODEGEN_MIPS32) || defined(JS_CODEGEN_ARM) || \
-+    (defined(JS_CODEGEN_NONE) &amp;&amp; \
-+     (defined(__riscv) &amp;&amp; __riscv_xlen =3D=3D 32) || defined(__mi=
ps__)) || \
-     defined(JS_CODEGEN_X86) || defined(__wasi__)
-   // See alignmentStaticAsserts().  For MIPS32, ARM32 and X86 DebugFrame =
is only
-   // 4-byte aligned, so we add another word to get up to 8-byte
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/0006-Fix-build-on-powe=
rpc.patch b/meta-oe/recipes-extended/mozjs/mozjs-91/0006-Fix-build-on-power=
pc.patch
deleted file mode 100644
index 80bf746e4..000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-91/0006-Fix-build-on-powerpc.pat=
ch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 0e0548e3f95e22a39db8d5b934afe0672a3f801b Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D &lt;<a href=3D"mailto:sc=
hnitzeltony@gmail.com">schnitzeltony@gmail.com</a>&gt;
-Date: Mon, 1 Nov 2021 08:13:29 +0100
-Subject: [PATCH] Fix build on powerpc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Another fix for (this time JIT enabled)
-| &lt;...&gt;/irefox-91.2.0/js/src/wasm/WasmFrame.cpp:57:76: error: static=
 assertion failed: Aligned after pushing DebugFrame
-|    57 |   static_assert((offsetof(DebugFrame, frame_) + sizeof(Frame)) %=
 Alignment =3D=3D 0,
-|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~^~~~
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas M=FCller &lt;<a href=3D"mailto:schnitzeltony@gmail.=
com">schnitzeltony@gmail.com</a>&gt;
----
- js/src/wasm/WasmFrame.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/js/src/wasm/WasmFrame.h b/js/src/wasm/WasmFrame.h
-index 893762e..2d90656 100644
---- a/js/src/wasm/WasmFrame.h
-+++ b/js/src/wasm/WasmFrame.h
-@@ -232,7 +232,7 @@ class DebugFrame {
- #if defined(JS_CODEGEN_MIPS32) || defined(JS_CODEGEN_ARM) || \
-     (defined(JS_CODEGEN_NONE) &amp;&amp; \
-      (defined(__riscv) &amp;&amp; __riscv_xlen =3D=3D 32) || defined(__mi=
ps__)) || \
--    defined(JS_CODEGEN_X86) || defined(__wasi__)
-+    defined(JS_CODEGEN_X86) || defined(__wasi__) || defined(__powerpc__)
-   // See alignmentStaticAsserts().  For MIPS32, ARM32 and X86 DebugFrame =
is only
-   // 4-byte aligned, so we add another word to get up to 8-byte
-   // alignment.
---=20
-2.31.1
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/fix-musl-build.patch b=
/meta-oe/recipes-extended/mozjs/mozjs-91/fix-musl-build.patch
deleted file mode 100644
index c0834af58..000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-91/fix-musl-build.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream: No
-Reason: mozjs60 miscompiles on musl if built with HAVE_THREAD_TLS_KEYWORD:
-<a href=3D"https://github.com/void-linux/void-packages/issues/2598">https:=
//github.com/void-linux/void-packages/issues/2598</a>
---- a/js/src/old-configure.in
-+++ b/js/src/old-configure.in
-@@ -1072,6 +1072,9 @@ if test "$ac_cv_thread_keyword" =3D yes; t
-     *-android*|*-linuxandroid*)
-       :
-       ;;
-+    *-musl*)
-+      :
-+      ;;
-     *)
-       AC_DEFINE(HAVE_THREAD_TLS_KEYWORD)
-       ;;
<div>--=20
</div>2.34.1

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#99784): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/99784">https://lists.openembedded.org/g/openembedde=
d-devel/message/99784</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95296113/3618=
223">https://lists.openembedded.org/mt/95296113/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-aDGBhRmaDMTwaLqMTOFO--


