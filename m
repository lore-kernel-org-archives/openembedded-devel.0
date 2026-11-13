Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7451.1794562164755827940
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 01:29:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=lauEFyT2;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout02.t-online.de (Postfix) with SMTP id 93560DEF4
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 10:27:47 +0100 (CET)
Received: from localhost.localdomain ([79.219.233.205]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xRnZM-2DfB2O0; Fri, 13 Nov 2026 10:27:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 09/16] gnome-commander: upgrade 2.0.3 -> 2.2.3
Date: Fri, 13 Nov 2026 10:27:24 +0100
Message-ID: <20261113092732.3895896-9-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113092732.3895896-1-f_l_k@t-online.de>
References: <20261113092732.3895896-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1794562060-537FD82B-BE248F74/0/0 CLEAN NORMAL
X-TOI-MSGID: 92387c44-34d9-47de-b0b8-0e53b88a8dd2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1794562067; i=f_l_k@t-online.de;
	bh=q++aj5NuSiAQCG0RsegDlTgFT8vMbkY/NisZ38FkO/A=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=lauEFyT27HwjBJoXtAWaB17Sq3C8yqpCLoqnFg1uXDjdgjeliQ8iT0YZp03tK+Swx
	 XFxFrl6DhoVv7EUcLf5wSkZ1lT01CkeNv4QZMh7+I6Xh2qGXuEQ8UJidO/nhYc2Esj
	 MlQhJuAQcI/kewwAXCoJmG7ED2u4C6uvV/a7KQ3tqap2MnENXfran0+l/prThDU4VL
	 tQaGiQFnFRfYKYK/OAIq5tPO6K14ZBUp4BvZMKvN2yOIc9+xRIxrqpEMlYXI8AaFSF
	 f4FdtlW+lzOubyvqsJpI9XQeRlBsMZdBDYdSXkev4HW+mkrboJvWT1jW0sI5AbO2S9
	 A+hHpB+3nMOBw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 09:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132243
Content-Type: text/plain; charset="utf-8"

gnome-commander is written in Rust entirely now: the C++ parts,
libgcmd and the exiv2, taglib, libgsf and poppler options are gone, so
drop the CXXFLAGS, the PACKAGECONFIGs, the libgcmd packaging and the
chrpath call. Rework
0001-meson-Support-cross-compilation-via-a-rust_target-cr.patch for
the new gnome-commander/meson.build (Upstream-Status: Pending) and drop
0002-weak_ref-Use-a-Mutex-for-the-object-id-counter.patch, the code it
changed is gone. Regenerate gnome-commander-crates.inc.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-commander-crates.inc                | 130 +++++++++++++-----
 ...oss-compilation-via-a-rust_target-cr.patch |  51 ++++---
 ...se-a-Mutex-for-the-object-id-counter.patch |  59 --------
 ...nder_2.0.3.bb =3D> gnome-commander_2.2.3.bb} |  22 +--
 4 files changed, 120 insertions(+), 142 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-commander/gnome-comman=
der/0002-weak_ref-Use-a-Mutex-for-the-object-id-counter.patch
 rename meta-gnome/recipes-gnome/gnome-commander/{gnome-commander_2.0.3.b=
b =3D> gnome-commander_2.2.3.bb} (64%)

diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander-cra=
tes.inc b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander-crates=
.inc
index b98b1fab06..cc0fef8da6 100644
--- a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander-crates.inc
+++ b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander-crates.inc
@@ -3,24 +3,38 @@
 # from Cargo.lock
 SRC_URI +=3D " \
     crate://crates.io/aho-corasick/1.1.3 \
+    crate://crates.io/async-attributes/1.1.2 \
+    crate://crates.io/async-broadcast/0.7.2 \
+    crate://crates.io/async-channel/1.9.0 \
     crate://crates.io/async-channel/2.5.0 \
+    crate://crates.io/async-executor/1.14.0 \
+    crate://crates.io/async-global-executor/2.4.1 \
+    crate://crates.io/async-io/2.6.0 \
+    crate://crates.io/async-lock/3.4.2 \
+    crate://crates.io/async-process/2.5.0 \
     crate://crates.io/async-recursion/1.1.1 \
+    crate://crates.io/async-signal/0.2.14 \
+    crate://crates.io/async-std/1.13.2 \
+    crate://crates.io/async-task/4.7.1 \
+    crate://crates.io/atomic-waker/1.1.2 \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/bimap/0.6.3 \
     crate://crates.io/bitflags/2.11.1 \
     crate://crates.io/block/0.1.6 \
-    crate://crates.io/bstr/1.12.1 \
+    crate://crates.io/blocking/1.6.2 \
+    crate://crates.io/bumpalo/3.20.3 \
     crate://crates.io/cairo-rs/0.22.0 \
     crate://crates.io/cairo-sys-rs/0.22.0 \
     crate://crates.io/cc/1.2.37 \
     crate://crates.io/cfg-expr/0.20.2 \
     crate://crates.io/cfg-if/1.0.3 \
     crate://crates.io/concurrent-queue/2.5.0 \
+    crate://crates.io/const_format/0.2.36 \
+    crate://crates.io/const_format_proc_macros/0.2.34 \
     crate://crates.io/crossbeam-utils/0.8.21 \
-    crate://crates.io/encoding_rs/0.8.35 \
-    crate://crates.io/encoding_rs_io/0.1.7 \
     crate://crates.io/equivalent/1.0.2 \
     crate://crates.io/errno/0.3.14 \
+    crate://crates.io/event-listener/2.5.3 \
     crate://crates.io/event-listener/5.4.1 \
     crate://crates.io/event-listener-strategy/0.5.4 \
     crate://crates.io/fastrand/2.3.0 \
@@ -32,6 +46,7 @@ SRC_URI +=3D " \
     crate://crates.io/futures-core/0.3.31 \
     crate://crates.io/futures-executor/0.3.31 \
     crate://crates.io/futures-io/0.3.31 \
+    crate://crates.io/futures-lite/2.6.1 \
     crate://crates.io/futures-macro/0.3.31 \
     crate://crates.io/futures-sink/0.3.31 \
     crate://crates.io/futures-task/0.3.31 \
@@ -49,16 +64,10 @@ SRC_URI +=3D " \
     crate://crates.io/glib-macros/0.22.6 \
     crate://crates.io/glib-sys/0.22.6 \
     crate://crates.io/glob/0.3.3 \
-    crate://crates.io/globset/0.4.18 \
+    crate://crates.io/gloo-timers/0.3.0 \
     crate://crates.io/gobject-sys/0.22.6 \
     crate://crates.io/graphene-rs/0.22.0 \
     crate://crates.io/graphene-sys/0.22.0 \
-    crate://crates.io/grep/0.4.1 \
-    crate://crates.io/grep-cli/0.1.12 \
-    crate://crates.io/grep-matcher/0.1.8 \
-    crate://crates.io/grep-printer/0.3.1 \
-    crate://crates.io/grep-regex/0.1.14 \
-    crate://crates.io/grep-searcher/0.1.16 \
     crate://crates.io/gsk4/0.11.1 \
     crate://crates.io/gsk4-sys/0.11.1 \
     crate://crates.io/gtk4/0.11.3 \
@@ -66,9 +75,14 @@ SRC_URI +=3D " \
     crate://crates.io/gtk4-sys/0.11.3 \
     crate://crates.io/hashbrown/0.15.5 \
     crate://crates.io/heck/0.5.0 \
+    crate://crates.io/hermit-abi/0.5.2 \
     crate://crates.io/indexmap/2.11.1 \
     crate://crates.io/io-lifetimes/2.0.4 \
     crate://crates.io/itoa/1.0.17 \
+    crate://crates.io/js-sys/0.3.99 \
+    crate://crates.io/konst/0.2.20 \
+    crate://crates.io/konst_macro_rules/0.2.19 \
+    crate://crates.io/kv-log-macro/1.0.7 \
     crate://crates.io/lazy_static/1.5.0 \
     crate://crates.io/libc/0.2.175 \
     crate://crates.io/linux-raw-sys/0.11.0 \
@@ -76,7 +90,6 @@ SRC_URI +=3D " \
     crate://crates.io/log/0.4.29 \
     crate://crates.io/malloc_buf/0.0.6 \
     crate://crates.io/memchr/2.8.0 \
-    crate://crates.io/memmap2/0.9.8 \
     crate://crates.io/memoffset/0.9.1 \
     crate://crates.io/objc/0.2.7 \
     crate://crates.io/objc-foundation/0.1.1 \
@@ -87,44 +100,58 @@ SRC_URI +=3D " \
     crate://crates.io/parking/2.2.1 \
     crate://crates.io/pin-project-lite/0.2.16 \
     crate://crates.io/pin-utils/0.1.0 \
+    crate://crates.io/piper/0.2.5 \
     crate://crates.io/pkg-config/0.3.32 \
+    crate://crates.io/polling/3.11.0 \
     crate://crates.io/proc-macro-crate/3.3.0 \
-    crate://crates.io/proc-macro2/1.0.101 \
+    crate://crates.io/proc-macro2/1.0.106 \
     crate://crates.io/quick-error/1.2.3 \
-    crate://crates.io/quote/1.0.40 \
+    crate://crates.io/quote/1.0.45 \
     crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/regex/1.11.2 \
-    crate://crates.io/regex-automata/0.4.10 \
-    crate://crates.io/regex-syntax/0.8.6 \
+    crate://crates.io/regex-automata/0.4.18 \
+    crate://crates.io/regex-cursor/0.1.5 \
+    crate://crates.io/regex-syntax/0.8.11 \
     crate://crates.io/rustc_version/0.4.1 \
     crate://crates.io/rustix/1.1.2 \
+    crate://crates.io/rustversion/1.0.22 \
     crate://crates.io/rusty-fork/0.3.0 \
+    crate://crates.io/same-file/1.0.6 \
     crate://crates.io/semver/1.0.27 \
-    crate://crates.io/serde/1.0.223 \
-    crate://crates.io/serde_core/1.0.223 \
-    crate://crates.io/serde_derive/1.0.223 \
+    crate://crates.io/serde/1.0.228 \
+    crate://crates.io/serde_core/1.0.228 \
+    crate://crates.io/serde_derive/1.0.228 \
     crate://crates.io/serde_json/1.0.149 \
     crate://crates.io/serde_spanned/0.6.9 \
     crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/signal-hook-registry/1.4.8 \
     crate://crates.io/slab/0.4.11 \
     crate://crates.io/smallvec/1.15.1 \
+    crate://crates.io/syn/1.0.109 \
     crate://crates.io/syn/2.0.117 \
     crate://crates.io/system-deps/7.0.5 \
     crate://crates.io/target-lexicon/0.13.2 \
     crate://crates.io/temp-dir/0.1.16 \
     crate://crates.io/tempfile/3.22.0 \
-    crate://crates.io/termcolor/1.4.1 \
     crate://crates.io/toml/0.8.23 \
     crate://crates.io/toml_datetime/0.6.11 \
     crate://crates.io/toml_edit/0.22.27 \
     crate://crates.io/unicode-ident/1.0.19 \
     crate://crates.io/unicode-segmentation/1.12.0 \
+    crate://crates.io/unicode-xid/0.2.6 \
+    crate://crates.io/value-bag/1.12.0 \
     crate://crates.io/version-compare/0.2.0 \
     crate://crates.io/vte4/0.10.0 \
     crate://crates.io/vte4-sys/0.10.0 \
     crate://crates.io/wait-timeout/0.2.1 \
+    crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.14.5+wasi-0.2.4 \
     crate://crates.io/wasip2/1.0.0+wasi-0.2.4 \
+    crate://crates.io/wasm-bindgen/0.2.122 \
+    crate://crates.io/wasm-bindgen-futures/0.4.72 \
+    crate://crates.io/wasm-bindgen-macro/0.2.122 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.122 \
+    crate://crates.io/wasm-bindgen-shared/0.2.122 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
     crate://crates.io/winapi-util/0.1.11 \
@@ -137,24 +164,38 @@ SRC_URI +=3D " \
 "
=20
 SRC_URI[aho-corasick-1.1.3.sha256sum] =3D "8e60d3430d3a69478ad0993f19238=
d2df97c507009a52b3c10addcd7f6bcb916"
+SRC_URI[async-attributes-1.1.2.sha256sum] =3D "a3203e79f4dd9bdda415ed03c=
f14dae5a2bf775c683a00f94e9cd1faf0f596e5"
+SRC_URI[async-broadcast-0.7.2.sha256sum] =3D "435a87a52755b8f27fcf321ac4=
f04b2802e337c8c4872923137471ec39c37532"
+SRC_URI[async-channel-1.9.0.sha256sum] =3D "81953c529336010edd6d8e358f88=
6d9581267795c61b19475b71314bffa46d35"
 SRC_URI[async-channel-2.5.0.sha256sum] =3D "924ed96dd52d1b75e9c1a3e62757=
15fd320f5f9439fb5a4a11fa51f4221158d2"
+SRC_URI[async-executor-1.14.0.sha256sum] =3D "c96bf972d85afc50bf5ab8fe2d=
54d1586b4e0b46c97c50a0c9e71e2f7bcd812a"
+SRC_URI[async-global-executor-2.4.1.sha256sum] =3D "05b1b633a2115cd122d7=
3b955eadd9916c18c8f510ec9cd1686404c60ad1c29c"
+SRC_URI[async-io-2.6.0.sha256sum] =3D "456b8a8feb6f42d237746d4b3e9a17849=
4627745c3c56c6ea55d92ba50d026fc"
+SRC_URI[async-lock-3.4.2.sha256sum] =3D "290f7f2596bd5b78a9fec8088ccd891=
80d7f9f55b94b0576823bbbdc72ee8311"
+SRC_URI[async-process-2.5.0.sha256sum] =3D "fc50921ec0055cdd8a16de48773b=
feec5c972598674347252c0399676be7da75"
 SRC_URI[async-recursion-1.1.1.sha256sum] =3D "3b43422f69d8ff38f95f1b2bb7=
6517c91589a924d1559a0e935d7c8ce0274c11"
+SRC_URI[async-signal-0.2.14.sha256sum] =3D "52b5aaafa020cf5053a01f2a60e8=
ff5dccf550f0f77ec54a4e47285ac2bab485"
+SRC_URI[async-std-1.13.2.sha256sum] =3D "2c8e079a4ab67ae52b7403632e46188=
15d6db36d2a010cfe41b02c1b1578f93b"
+SRC_URI[async-task-4.7.1.sha256sum] =3D "8b75356056920673b02621b35afd0f7=
dda9306d03c79a30f5c56c44cf256e3de"
+SRC_URI[atomic-waker-1.1.2.sha256sum] =3D "1505bd5d3d116872e7271a6d4e16d=
81d0c8570876c8de68093a09ac269d8aac0"
 SRC_URI[autocfg-1.5.0.sha256sum] =3D "c08606f8c3cbf4ce6ec8e28fb0014a2c08=
6708fe954eaa885384a6165172e7e8"
 SRC_URI[bimap-0.6.3.sha256sum] =3D "230c5f1ca6a325a32553f8640d31ac9b49f2=
411e901e427570154868b46da4f7"
 SRC_URI[bitflags-2.11.1.sha256sum] =3D "c4512299f36f043ab09a583e57bceb5a=
5aab7a73db1805848e8fef3c9e8c78b3"
 SRC_URI[block-0.1.6.sha256sum] =3D "0d8c1fef690941d3e7788d328517591fecc6=
84c084084702d6ff1641e993699a"
-SRC_URI[bstr-1.12.1.sha256sum] =3D "63044e1ae8e69f3b5a92c736ca6269b8d12f=
a7efe39bf34ddb06d102cf0e2cab"
+SRC_URI[blocking-1.6.2.sha256sum] =3D "e83f8d02be6967315521be875afa792a3=
16e28d57b5a2d401897e2a7921b7f21"
+SRC_URI[bumpalo-3.20.3.sha256sum] =3D "72f5acc6cb2ba439de613abc23857ec3d=
78374d8ed5ac84e9d11336e87da8649"
 SRC_URI[cairo-rs-0.22.0.sha256sum] =3D "5cc8d9aa793480744cd9a0524fef1a2e=
197d9eaa0f739cde19d16aba530dcb95"
 SRC_URI[cairo-sys-rs-0.22.0.sha256sum] =3D "f8b4985713047f5faee02b8db6a6=
ef32bbb50269ff53c1aee716d1d195b76d54"
 SRC_URI[cc-1.2.37.sha256sum] =3D "65193589c6404eb80b450d618eaf9a2cafaaaf=
d57ecce47370519ef674a7bd44"
 SRC_URI[cfg-expr-0.20.2.sha256sum] =3D "c8d458d63f0f0f482c8da9b7c8b76c21=
bd885a02056cc94c6404d861ca2b8206"
 SRC_URI[cfg-if-1.0.3.sha256sum] =3D "2fd1289c04a9ea8cb22300a459a72a385d7=
c73d3259e2ed7dcb2af674838cfa9"
 SRC_URI[concurrent-queue-2.5.0.sha256sum] =3D "4ca0197aee26d1ae37445ee53=
2fefce43251d24cc7c166799f4d46817f1d3973"
+SRC_URI[const_format-0.2.36.sha256sum] =3D "4481a617ad9a412be3b97c5d403f=
ef8ed023103368908b9c50af598ff467cc1e"
+SRC_URI[const_format_proc_macros-0.2.34.sha256sum] =3D "1d57c2eccfb16dba=
c1f4e61e206105db5820c9d26c3c472bc17c774259ef7744"
 SRC_URI[crossbeam-utils-0.8.21.sha256sum] =3D "d0a5c400df2834b80a4c3327b=
3aad3a4c4cd4de0629063962b03235697506a28"
-SRC_URI[encoding_rs-0.8.35.sha256sum] =3D "75030f3c4f45dafd7586dd6780965=
a8c7e8e285a5ecb86713e63a79c5b2766f3"
-SRC_URI[encoding_rs_io-0.1.7.sha256sum] =3D "1cc3c5651fb62ab8aa3103998da=
de57efdd028544bd300516baa31840c252a83"
 SRC_URI[equivalent-1.0.2.sha256sum] =3D "877a4ace8713b0bcf2a4e7eec82529c=
029f1d0619886d18145fea96c3ffe5c0f"
 SRC_URI[errno-0.3.14.sha256sum] =3D "39cab71617ae0d63f51a36d69f866391735=
b51691dbda63cf6f96d042b63efeb"
+SRC_URI[event-listener-2.5.3.sha256sum] =3D "0206175f82b8d6bf6652ff7d71a=
1e27fd2e4efde587fd368662814d6ec1d9ce0"
 SRC_URI[event-listener-5.4.1.sha256sum] =3D "e13b66accf52311f30a0db42147=
dadea9850cb48cd070028831ae5f5d4b856ab"
 SRC_URI[event-listener-strategy-0.5.4.sha256sum] =3D "8be9f3dfaaffdae297=
2880079a491a1a8bb7cbed0b8dd7a347f668b4150a3b93"
 SRC_URI[fastrand-2.3.0.sha256sum] =3D "37909eebbb50d72f9059c3b6d82c0463f=
2ff062c9e95845c43a6c9c0355411be"
@@ -166,6 +207,7 @@ SRC_URI[futures-channel-0.3.31.sha256sum] =3D "2dff15=
bf788c671c1934e366d07e30c1814
 SRC_URI[futures-core-0.3.31.sha256sum] =3D "05f29059c0c2090612e8d742178b=
0580d2dc940c837851ad723096f87af6663e"
 SRC_URI[futures-executor-0.3.31.sha256sum] =3D "1e28d1d997f585e54aebc3f9=
7d39e72338912123a67330d723fdbb564d646c9f"
 SRC_URI[futures-io-0.3.31.sha256sum] =3D "9e5c1b78ca4aae1ac06c48a526a655=
760685149f0d465d21f37abfe57ce075c6"
+SRC_URI[futures-lite-2.6.1.sha256sum] =3D "f78e10609fe0e0b3f4157ffab1876=
319b5b0db102a2c60dc4626306dc46b44ad"
 SRC_URI[futures-macro-0.3.31.sha256sum] =3D "162ee34ebcb7c64a8abebc059ce=
0fee27c2262618d7b60ed8faf72fef13c3650"
 SRC_URI[futures-sink-0.3.31.sha256sum] =3D "e575fab7d1e0dcb8d0c7bcf9a63e=
e213816ab51902e6d244a95819acacf1d4f7"
 SRC_URI[futures-task-0.3.31.sha256sum] =3D "f90f7dce0722e95104fcb0955859=
10c0977252f286e354b5e3bd38902cd99988"
@@ -183,16 +225,10 @@ SRC_URI[glib-0.22.7.sha256sum] =3D "c207e04e51605dc=
f7b2924c41591b3a10e1438eaac5bcf
 SRC_URI[glib-macros-0.22.6.sha256sum] =3D "506d23499707c7142898429757e8d=
9a3871d965239a2cb66dfa05052be6d6f19"
 SRC_URI[glib-sys-0.22.6.sha256sum] =3D "5f7fbac234ed5bc2a28359b7bde8e1b9=
cdf1441cc2d7f068e4824672d7db9445"
 SRC_URI[glob-0.3.3.sha256sum] =3D "0cc23270f6e1808e30a928bdc84dea0b9b413=
6a8bc82338574f23baf47bbd280"
-SRC_URI[globset-0.4.18.sha256sum] =3D "52dfc19153a48bde0cbd630453615c815=
1bce3a5adfac7a0aebfbf0a1e1f57e3"
+SRC_URI[gloo-timers-0.3.0.sha256sum] =3D "bbb143cf96099802033e0d4f4963b1=
9fd2e0b728bcf076cd9cf7f6634f092994"
 SRC_URI[gobject-sys-0.22.6.sha256sum] =3D "22a861859b887a79cf461359c192c=
97a57d8fb0229dd291232e57aa11f6fa72c"
 SRC_URI[graphene-rs-0.22.0.sha256sum] =3D "c7d1b7881f96869f49808b6adfe90=
6a93a57a34204952253444d68c3208d71f1"
 SRC_URI[graphene-sys-0.22.0.sha256sum] =3D "517f062f3fd6b7fd3e57a3f038a7=
4b3c23ca32f51199ff028aa704609943f79c"
-SRC_URI[grep-0.4.1.sha256sum] =3D "309217bc53e2c691c314389c7fa91f9cd1a99=
8cda19e25544ea47d94103880c3"
-SRC_URI[grep-cli-0.1.12.sha256sum] =3D "cf32d263c5d5cc2a23ce587097f5ddaf=
db188492ba2e6fb638eaccdc22453631"
-SRC_URI[grep-matcher-0.1.8.sha256sum] =3D "36d7b71093325ab22d780b40d7df3=
066ae4aebb518ba719d38c697a8228a8023"
-SRC_URI[grep-printer-0.3.1.sha256sum] =3D "fd76035e87871f51c1ee5b793e321=
22b3ccf9c692662d9622ef1686ff5321acb"
-SRC_URI[grep-regex-0.1.14.sha256sum] =3D "0ce0c256c3ad82bcc07b812c15a45e=
c1d398122e8e15124f96695234db7112ef"
-SRC_URI[grep-searcher-0.1.16.sha256sum] =3D "ac63295322dc48ebb20a2534814=
7905d816318888e64f531bfc2a2bc0577dc34"
 SRC_URI[gsk4-0.11.1.sha256sum] =3D "53c912dfcbd28acace5fc99c40bb9f25e1dc=
b73efb1f2608327f66a99acdcb62"
 SRC_URI[gsk4-sys-0.11.1.sha256sum] =3D "d7d54bbc7a9d8b6ffe4f0c95eede15cc=
fb365c8bf521275abe6bcfb57b18fb8a"
 SRC_URI[gtk4-0.11.3.sha256sum] =3D "7181b837f04cbe93f79441475f7a00560a92=
cba7a72e38cc1a68b6f8b78eaae2"
@@ -200,9 +236,14 @@ SRC_URI[gtk4-macros-0.11.0.sha256sum] =3D "3581b242b=
a62fdff122ebb626ea641582ec3260
 SRC_URI[gtk4-sys-0.11.3.sha256sum] =3D "20ba8e695e2640455561274e65e45f0a=
151619e450746007667f4b23ceae4e1b"
 SRC_URI[hashbrown-0.15.5.sha256sum] =3D "9229cfe53dfd69f0609a49f65461bd9=
3001ea1ef889cd5529dd176593f5338a1"
 SRC_URI[heck-0.5.0.sha256sum] =3D "2304e00983f87ffb38b55b444b5e3b60a884b=
5d30c0fca7d82fe33449bbe55ea"
+SRC_URI[hermit-abi-0.5.2.sha256sum] =3D "fc0fef456e4baa96da950455cd02c08=
1ca953b141298e41db3fc7e36b1da849c"
 SRC_URI[indexmap-2.11.1.sha256sum] =3D "206a8042aec68fa4a62e8d3f7aa4ceb5=
08177d9324faf261e1959e495b7a1921"
 SRC_URI[io-lifetimes-2.0.4.sha256sum] =3D "06432fb54d3be7964ecd3649233cd=
df80db2832f47fec34c01f65b3d9d774983"
 SRC_URI[itoa-1.0.17.sha256sum] =3D "92ecc6618181def0457392ccd0ee51198e06=
5e016d1d527a7ac1b6dc7c1f09d2"
+SRC_URI[js-sys-0.3.99.sha256sum] =3D "142bc4740e452c1e57ade0cbc129f139c9=
093e354346f0872ef985f4f5cf5f11"
+SRC_URI[konst-0.2.20.sha256sum] =3D "128133ed7824fcd73d6e7b17957c5eb7bac=
b885649bd8c69708b2331a10bcefb"
+SRC_URI[konst_macro_rules-0.2.19.sha256sum] =3D "a4933f3f57a8e9d9da04db2=
3fb153356ecaf00cbd14aee46279c33dc80925c37"
+SRC_URI[kv-log-macro-1.0.7.sha256sum] =3D "0de8b303297635ad57c9f5059fd9c=
ee7a47f8e8daa09df0fcd07dd39fb22977f"
 SRC_URI[lazy_static-1.5.0.sha256sum] =3D "bbd2bcb4c963f2ddae06a2efc7e9f3=
591312473c50c6685e1f298068316e66fe"
 SRC_URI[libc-0.2.175.sha256sum] =3D "6a82ae493e598baaea5209805c49bbf2ea7=
de956d50d7da0da1164f9c6d28543"
 SRC_URI[linux-raw-sys-0.11.0.sha256sum] =3D "df1d3c3b53da64cf5760482273a=
98e575c651a67eec7f77df96b5b642de8f039"
@@ -210,7 +251,6 @@ SRC_URI[locale_config-0.3.0.sha256sum] =3D "08d2c35b1=
6f4483f6c26f0e4e9550717a2f657
 SRC_URI[log-0.4.29.sha256sum] =3D "5e5032e24019045c762d3c0f28f5b6b8bbf38=
563a65908389bf7978758920897"
 SRC_URI[malloc_buf-0.0.6.sha256sum] =3D "62bb907fe88d54d8d9ce32a3cceab42=
18ed2f6b7d35617cafe9adf84e43919cb"
 SRC_URI[memchr-2.8.0.sha256sum] =3D "f8ca58f447f06ed17d5fc4043ce1b10dd20=
5e060fb3ce5b979b8ed8e59ff3f79"
-SRC_URI[memmap2-0.9.8.sha256sum] =3D "843a98750cd611cc2965a8213b53b43e71=
5f13c37a9e096c6408e69990961db7"
 SRC_URI[memoffset-0.9.1.sha256sum] =3D "488016bfae457b036d996092f6cb4486=
77611ce4449e970ceaf42695203f218a"
 SRC_URI[objc-0.2.7.sha256sum] =3D "915b1b472bc21c53464d6c8461c9d3af805ba=
1ef837e1cac254428f4a77177b1"
 SRC_URI[objc-foundation-0.1.1.sha256sum] =3D "1add1b659e36c9607c7aab864a=
76c7a4c2760cd0cd2e120f3fb8b952c7e22bf9"
@@ -221,44 +261,58 @@ SRC_URI[pango-sys-0.22.0.sha256sum] =3D "bbd111a20c=
a90fedf03e09c59783c679c00900f1d
 SRC_URI[parking-2.2.1.sha256sum] =3D "f38d5652c16fde515bb1ecef450ab0f6a2=
19d619a7274976324d5e377f7dceba"
 SRC_URI[pin-project-lite-0.2.16.sha256sum] =3D "3b3cff922bd51709b605d9ea=
d9aa71031d81447142d828eb4a6eba76fe619f9b"
 SRC_URI[pin-utils-0.1.0.sha256sum] =3D "8b870d8c151b6f2fb93e84a13146138f=
05d02ed11c7e7c54f8826aaaf7c9f184"
+SRC_URI[piper-0.2.5.sha256sum] =3D "c835479a4443ded371d6c535cbfd8d31ad92=
c5d23ae9770a61bc155e4992a3c1"
 SRC_URI[pkg-config-0.3.32.sha256sum] =3D "7edddbd0b52d732b21ad9a5fab5c70=
4c14cd949e5e9a1ec5929a24fded1b904c"
+SRC_URI[polling-3.11.0.sha256sum] =3D "5d0e4f59085d47d8241c88ead0f274e8a=
0cb551f3625263c05eb8dd897c34218"
 SRC_URI[proc-macro-crate-3.3.0.sha256sum] =3D "edce586971a4dfaa28950c6f1=
8ed55e0406c1ab88bbce2c6f6293a7aaba73d35"
-SRC_URI[proc-macro2-1.0.101.sha256sum] =3D "89ae43fd86e4158d6db51ad8e2b8=
0f313af9cc74f5c0e03ccb87de09998732de"
+SRC_URI[proc-macro2-1.0.106.sha256sum] =3D "8fd00f0bb2e90d81d1044c2b3261=
7f68fcb9fa3bb7640c23e9c748e53fb30934"
 SRC_URI[quick-error-1.2.3.sha256sum] =3D "a1d01941d82fa2ab50be1e79e67142=
89dd7cde78eba4c074bc5a4374f650dfe0"
-SRC_URI[quote-1.0.40.sha256sum] =3D "1885c039570dc00dcb4ff087a89e185fd56=
bae234ddc7f056a945bf36467248d"
+SRC_URI[quote-1.0.45.sha256sum] =3D "41f2619966050689382d2b44f664f4bc593=
e129785a36d6ee376ddf37259b924"
 SRC_URI[r-efi-5.3.0.sha256sum] =3D "69cdb34c158ceb288df11e18b4bd39de994f=
6657d83847bdffdbd7f346754b0f"
 SRC_URI[regex-1.11.2.sha256sum] =3D "23d7fd106d8c02486a8d64e778353d1cffe=
08ce79ac2e82f540c86d0facf6912"
-SRC_URI[regex-automata-0.4.10.sha256sum] =3D "6b9458fa0bfeeac22b5ca447c6=
3aaf45f28439a709ccd244698632f9aa6394d6"
-SRC_URI[regex-syntax-0.8.6.sha256sum] =3D "caf4aa5b0f434c91fe5c7f1ecb6a5=
ece2130b02ad2a590589dda5146df959001"
+SRC_URI[regex-automata-0.4.18.sha256sum] =3D "ad8553b9b26413251cbf30e620=
595c7a41b3887f03da04579c0e6b0d6a06b4b2"
+SRC_URI[regex-cursor-0.1.5.sha256sum] =3D "0497c781d2f982ae8284d2932aee6=
a877e58a4541daa5e8fadc18cc75c23a61d"
+SRC_URI[regex-syntax-0.8.11.sha256sum] =3D "d6f6ff9a378485b298a5286656da=
665ba74413d36db0979633275d2e708145d4"
 SRC_URI[rustc_version-0.4.1.sha256sum] =3D "cfcb3a22ef46e85b45de6ee7e79d=
063319ebb6594faafcf1c225ea92ab6e9b92"
 SRC_URI[rustix-1.1.2.sha256sum] =3D "cd15f8a2c5551a84d56efdc1cd049089e40=
9ac19a3072d5037a17fd70719ff3e"
+SRC_URI[rustversion-1.0.22.sha256sum] =3D "b39cdef0fa800fc44525c84ccb54a=
029961a8215f9619753635a9c0d2538d46d"
 SRC_URI[rusty-fork-0.3.0.sha256sum] =3D "cb3dcc6e454c328bb824492db107ab7=
c0ae8fcffe4ad210136ef014458c1bc4f"
+SRC_URI[same-file-1.0.6.sha256sum] =3D "93fc1dc3aaa9bfed95e02e6eadabb4ba=
f7e3078b0bd1b4d7b6b0b68378900502"
 SRC_URI[semver-1.0.27.sha256sum] =3D "d767eb0aabc880b29956c35734170f26ed=
551a859dbd361d140cdbeca61ab1e2"
-SRC_URI[serde-1.0.223.sha256sum] =3D "a505d71960adde88e293da5cb5eda57093=
379f64e61cf77bf0e6a63af07a7bac"
-SRC_URI[serde_core-1.0.223.sha256sum] =3D "20f57cbd357666aa7b3ac84a90b4e=
a328f1d4ddb6772b430caa5d9e1309bb9e9"
-SRC_URI[serde_derive-1.0.223.sha256sum] =3D "3d428d07faf17e306e699ec1e91=
996e5a165ba5d6bce5b5155173e91a8a01a56"
+SRC_URI[serde-1.0.228.sha256sum] =3D "9a8e94ea7f378bd32cbbd37198a4a91436=
180c5bb472411e48b5ec2e2124ae9e"
+SRC_URI[serde_core-1.0.228.sha256sum] =3D "41d385c7d4ca58e59fc732af25c39=
83b67ac852c1a25000afe1175de458b67ad"
+SRC_URI[serde_derive-1.0.228.sha256sum] =3D "d540f220d3187173da220f885ab=
66608367b6574e925011a9353e4badda91d79"
 SRC_URI[serde_json-1.0.149.sha256sum] =3D "83fc039473c5595ace860d8c4fafa=
220ff474b3fc6bfdb4293327f1a37e94d86"
 SRC_URI[serde_spanned-0.6.9.sha256sum] =3D "bf41e0cfaf7226dca15e8197172c=
295a782857fcb97fad1808a166870dee75a3"
 SRC_URI[shlex-1.3.0.sha256sum] =3D "0fda2ff0d084019ba4d7c6f371c95d8fd75c=
e3524c3cb8fb653a3023f6323e64"
+SRC_URI[signal-hook-registry-1.4.8.sha256sum] =3D "c4db69cba1110affc0e9f=
7bcd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b"
 SRC_URI[slab-0.4.11.sha256sum] =3D "7a2ae44ef20feb57a68b23d846850f861394=
c2e02dc425a50098ae8c90267589"
 SRC_URI[smallvec-1.15.1.sha256sum] =3D "67b1b7a3b5fe4f1376887184045fcf45=
c69e92af734b7aaddc05fb777b6fbd03"
+SRC_URI[syn-1.0.109.sha256sum] =3D "72b64191b275b66ffe2469e8af2c1cfe3baf=
a67b529ead792a6d0160888b4237"
 SRC_URI[syn-2.0.117.sha256sum] =3D "e665b8803e7b1d2a727f4023456bbbbe74da=
67099c585258af0ad9c5013b9b99"
 SRC_URI[system-deps-7.0.5.sha256sum] =3D "e4be53aa0cba896d2dc615bd42bbc1=
30acdcffa239e0a2d965ea5b3b2a86ffdb"
 SRC_URI[target-lexicon-0.13.2.sha256sum] =3D "e502f78cdbb8ba4718f566c418=
c52bc729126ffd16baee5baa718cf25dd5a69a"
 SRC_URI[temp-dir-0.1.16.sha256sum] =3D "83176759e9416cf81ee66cb6508dbfe9=
c96f20b8b56265a39917551c23c70964"
 SRC_URI[tempfile-3.22.0.sha256sum] =3D "84fa4d11fadde498443cca10fd3ac23c=
951f0dc59e080e9f4b93d4df4e4eea53"
-SRC_URI[termcolor-1.4.1.sha256sum] =3D "06794f8f6c5c898b3275aebefa6b8a1c=
b24cd2c6c79397ab15774837a0bc5755"
 SRC_URI[toml-0.8.23.sha256sum] =3D "dc1beb996b9d83529a9e75c17a1686767d14=
8d70663143c7854d8b4a09ced362"
 SRC_URI[toml_datetime-0.6.11.sha256sum] =3D "22cddaf88f4fbc13c51aebbf5f8=
eceb5c7c5a9da2ac40a13519eb5b0a0e8f11c"
 SRC_URI[toml_edit-0.22.27.sha256sum] =3D "41fe8c660ae4257887cf66394862d2=
1dbca4a6ddd26f04a3560410406a2f819a"
 SRC_URI[unicode-ident-1.0.19.sha256sum] =3D "f63a54548129113891057512948=
6daeaf8ac54aee4387fe7906919f7830c7d9d"
 SRC_URI[unicode-segmentation-1.12.0.sha256sum] =3D "f6ccf251212114b54433=
ec949fd6a7841275f9ada20dddd2f29e9ceea4501493"
+SRC_URI[unicode-xid-0.2.6.sha256sum] =3D "ebc1c04c71510c7f702b52b7c35073=
4c9ff1295c464a03335b00bb84fc54f853"
+SRC_URI[value-bag-1.12.0.sha256sum] =3D "7ba6f5989077681266825251a52748b=
8c1d8a4ad098cc37e440103d0ea717fc0"
 SRC_URI[version-compare-0.2.0.sha256sum] =3D "852e951cb7832cb45cb1169900=
d19760cfa39b82bc0ea9c0e5a14ae88411c98b"
 SRC_URI[vte4-0.10.0.sha256sum] =3D "c61732974d4915c5112a82506cdc86e19a83=
d786497c2c8bcd80d065825c695d"
 SRC_URI[vte4-sys-0.10.0.sha256sum] =3D "bd99766524f740945b1b3fc516dc2ee7=
6311be2efa8d7a1238f35f04330b9afd"
 SRC_URI[wait-timeout-0.2.1.sha256sum] =3D "09ac3b126d3914f9849036f826e05=
4cbabdc8519970b8998ddaf3b5bd3c65f11"
+SRC_URI[walkdir-2.5.0.sha256sum] =3D "29790946404f91d9c5d06f9874efddea1d=
c06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.14.5+wasi-0.2.4.sha256sum] =3D "a4494f6290a82f5fe584817a6=
76a34b9d6763e8d9d18204009fb31dceca98fd4"
 SRC_URI[wasip2-1.0.0+wasi-0.2.4.sha256sum] =3D "03fa2761397e5bd52002cd7e=
73110c71af2109aca4e521a9f40473fe685b0a24"
+SRC_URI[wasm-bindgen-0.2.122.sha256sum] =3D "3ed04576f974d2b2fba0f38c51d=
bc5518011e38c36bf1143164be765528fd409"
+SRC_URI[wasm-bindgen-futures-0.4.72.sha256sum] =3D "9473dbd2991ae90b6291=
c3c32c30c6187ac49aa32f9905d1cce280ec1e110b0f"
+SRC_URI[wasm-bindgen-macro-0.2.122.sha256sum] =3D "916151b09da36bd82f661=
5cbf3a419e2f0ba23a03c6160e8e92eb6bd4aa1dec6"
+SRC_URI[wasm-bindgen-macro-support-0.2.122.sha256sum] =3D "299047362ccbf=
ce148b67ab7e73349f77748e00c8296f9542adfad2ad82c5c5e"
+SRC_URI[wasm-bindgen-shared-0.2.122.sha256sum] =3D "9a929b2c61f11ba3e9bc=
35b50c1f25cb38e0e892c0c231ae2b8cf78d5dad4437"
 SRC_URI[winapi-0.3.9.sha256sum] =3D "5c839a674fcd7a98952e593242ea400abe9=
3992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D "ac3b87c63620426=
dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
 SRC_URI[winapi-util-0.1.11.sha256sum] =3D "c2a7b1c03c876122aa43f3020e6c3=
c3ee5c05081c9a00739faf7503aeba10d22"
diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander/000=
1-meson-Support-cross-compilation-via-a-rust_target-cr.patch b/meta-gnome=
/recipes-gnome/gnome-commander/gnome-commander/0001-meson-Support-cross-c=
ompilation-via-a-rust_target-cr.patch
index 0d22ed5409..5de28cc13b 100644
--- a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander/0001-meson=
-Support-cross-compilation-via-a-rust_target-cr.patch
+++ b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander/0001-meson=
-Support-cross-compilation-via-a-rust_target-cr.patch
@@ -1,61 +1,60 @@
 From 5547db8b4824facd025ae0df54bef300cb92c501 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
-Date: Tue, 20 Oct 2026 21:41:48 +0200
+Date: Fri, 13 Nov 2026 09:30:00 +0100
 Subject: [PATCH] meson: Support cross-compilation via a rust_target cros=
s
  property
=20
 cargo is always invoked without --target and the binary is copied from
-the native artifact layout (src/<profile>/), so gnome-commander cannot
+the native artifact layout (gnome-commander/<profile>/), so it cannot
 be cross-compiled. Read the rust target triple from the cross file's
 [properties] (rust_target); when set, pass it as --target and read the
 binary from the per-target subdirectory cargo writes to.
=20
-RUSTFLAGS is set in the cargo environment and replaces any RUSTFLAGS
-from the caller, which drops the flags a cross build needs (e.g. the
-target sysroot). Prepend the optional rust_flags cross property.
+cargo does not get the RUSTFLAGS a cross build needs (e.g. the target
+sysroot) from the caller; pass the optional rust_flags cross property.
=20
 When neither property is set the build is unchanged.
=20
 AI-Generated: Uses Claude Code (Claude Opus 5.5)
 Upstream-Status: Pending
 ---
- src/meson.build | 13 +++++++++++--
- 1 file changed, 11 insertions(+), 2 deletions(-)
+ gnome-commander/meson.build | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
=20
-diff --git a/src/meson.build b/src/meson.build
-index a81a723..b551583 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -23,6 +23,14 @@ cargo_options =3D [
-   '--target-dir', meson.project_build_root() / 'src',
+--- a/gnome-commander/meson.build
++++ b/gnome-commander/meson.build
+@@ -11,6 +11,14 @@
+   '--target-dir', meson.project_build_root() / 'gnome-commander',
  ]
 =20
 +cargo_build_target =3D meson.get_external_property('rust_target', '')
 +if cargo_build_target !=3D ''
 +  cargo_options +=3D [ '--target', cargo_build_target ]
-+  cargo_artifact_dir =3D 'src' / cargo_build_target
++  cargo_artifact_dir =3D 'gnome-commander' / cargo_build_target
 +else
-+  cargo_artifact_dir =3D 'src'
++  cargo_artifact_dir =3D 'gnome-commander'
 +endif
 +
  if profile =3D=3D 'debug'
    rust_target =3D 'debug'
    message('Building in debug mode')
-@@ -34,7 +42,8 @@ endif
+@@ -26,6 +34,11 @@
+   'GLOBAL_PLUGIN_DIR=3D' + plugin_dir,
+ ]
 =20
- cargo_env =3D [
-   'CARGO_HOME=3D' + meson.project_build_root() / 'cargo-home',
--  'RUSTFLAGS=3D-L ' + (meson.project_build_root() / 'src')
-+  'RUSTFLAGS=3D' + meson.get_external_property('rust_flags', '')
-+        + ' -L ' + (meson.project_build_root() / 'src')
-         + ' -L ' + (meson.project_build_root() / 'libgcmd')
-         + ' -lgcmd'
-         + ' -C link-arg=3D-Wl,-rpath=3D' + rpath,
-@@ -59,7 +68,7 @@ commander =3D custom_target(
++cargo_rust_flags =3D meson.get_external_property('rust_flags', '')
++if cargo_rust_flags !=3D ''
++  cargo_env +=3D [ 'RUSTFLAGS=3D' + cargo_rust_flags ]
++endif
++
+ libgmcddialogs_dep =3D declare_dependency(
+   include_directories: [include_directories('.')],
+ )
+@@ -44,7 +57,7 @@
      cargo_env,
      cargo, 'build', cargo_options,
      '&&',
--    'cp', 'src' / rust_target / meson.project_name(), '@OUTPUT@',
+-    'cp', 'gnome-commander' / rust_target / meson.project_name(), '@OUT=
PUT@',
 +    'cp', cargo_artifact_dir / rust_target / meson.project_name(), '@OU=
TPUT@',
    ]
  )
diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander/000=
2-weak_ref-Use-a-Mutex-for-the-object-id-counter.patch b/meta-gnome/recip=
es-gnome/gnome-commander/gnome-commander/0002-weak_ref-Use-a-Mutex-for-th=
e-object-id-counter.patch
deleted file mode 100644
index eb253d9dc4..0000000000
--- a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander/0002-weak_=
ref-Use-a-Mutex-for-the-object-id-counter.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Thu, 22 Oct 2026 20:00:00 -0700
-Subject: [PATCH] weak_ref: Use a Mutex for the object id counter
-
-std only provides AtomicU64 on targets with 64-bit atomics, so
-gnome-commander fails to build for e.g. riscv32:
-
-  error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
-   --> src/weak_ref.rs:8:14
-
-The counter hands out the ids IdentityWeakRef uses for equality and
-hashing, so it has to stay 64-bit and must not wrap. Keep it in a
-Mutex<u64>, which works on every target. Ids are only allocated when an
-object gets its first weak reference, so the lock is uncontended in
-practice.
-
-Upstream-Status: Inappropriate [the code was removed upstream after 2.0.=
3]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- src/weak_ref.rs | 16 ++++++++++------
- 1 file changed, 10 insertions(+), 6 deletions(-)
-
---- a/src/weak_ref.rs
-+++ b/src/weak_ref.rs
-@@ -3,10 +3,7 @@
- // SPDX-License-Identifier: GPL-3.0-or-later
-=20
- use gtk::{glib, glib::prelude::*};
--use std::sync::{
--    LazyLock,
--    atomic::{AtomicU64, Ordering},
--};
-+use std::sync::{LazyLock, Mutex};
-=20
- #[derive(Clone, Debug)]
- pub struct IdentityWeakRef<T: ObjectType> {
-@@ -24,13 +21,20 @@
- }
-=20
- fn set_object_id<T: ObjectType>(obj: &T) -> u64 {
--    static SEQ: AtomicU64 =3D AtomicU64::new(1);
-+    // A Mutex rather than an AtomicU64, which std only provides on tar=
gets
-+    // with 64-bit atomics. The id has to stay 64-bit so it does not wr=
ap.
-+    static SEQ: Mutex<u64> =3D Mutex::new(1);
-=20
-     unsafe {
-         match obj.qdata::<u64>(*ID_QUARK) {
-             Some(existing_id) =3D> *(existing_id.as_ref()),
-             None =3D> {
--                let new_id =3D SEQ.fetch_add(1, Ordering::SeqCst);
-+                let new_id =3D {
-+                    let mut seq =3D SEQ.lock().unwrap();
-+                    let id =3D *seq;
-+                    *seq +=3D 1;
-+                    id
-+                };
-                 obj.set_qdata(*ID_QUARK, new_id);
-                 new_id
-             }
diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_2.0=
.3.bb b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_2.2.3.bb
similarity index 64%
rename from meta-gnome/recipes-gnome/gnome-commander/gnome-commander_2.0.=
3.bb
rename to meta-gnome/recipes-gnome/gnome-commander/gnome-commander_2.2.3.=
bb
index c4c674b421..b679e2e029 100644
--- a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_2.0.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_2.2.3.bb
@@ -15,18 +15,14 @@ DEPENDS +=3D " \
     vte \
 "
=20
-CXXFLAGS +=3D "-D_LIBCPP_ENABLE_CXX17_REMOVED_AUTO_PTR"
-
 inherit cargo_common cargo-update-recipe-crates gnomebase itstool gettex=
t gnome-help features_check meson gtk-icon-cache mime-xdg gobject-introsp=
ection
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl gobject-introspection-data"
=20
 GIR_MESON_OPTION =3D ""
=20
-SRC_URI[archive.sha256sum] =3D "e51178f3256de45324ffd928a4a144fa859a8656=
62bf295129f0188d8d243b57"
-SRC_URI +=3D "file://0001-meson-Support-cross-compilation-via-a-rust_tar=
get-cr.patch \
-            file://0002-weak_ref-Use-a-Mutex-for-the-object-id-counter.p=
atch \
-"
+SRC_URI[archive.sha256sum] =3D "2b2d091bec52345dab27d72b04828f89a134f946=
bc0a9cbdb3a2b0d055a5e032"
+SRC_URI +=3D "file://0001-meson-Support-cross-compilation-via-a-rust_tar=
get-cr.patch"
=20
 require ${BPN}-crates.inc
=20
@@ -48,20 +44,8 @@ do_compile:prepend() {
 	install -m 0644 ${CARGO_HOME}/config.toml ${B}/cargo-home/config.toml
 }
=20
-do_install:append() {
-	chrpath --delete ${D}${bindir}/gnome-commander
-}
-
 export CARGO_NET_OFFLINE =3D "1"
 export CARGO_BUILD_JOBS =3D "${@oe.utils.cpu_count()}"
 export CARGO_PROFILE_RELEASE_STRIP =3D "false"
=20
-PACKAGECONFIG ??=3D "exiv2 taglib libgsf poppler"
-PACKAGECONFIG[exiv2] =3D "-Dexiv2=3Denabled,-Dexiv2=3Ddisabled,exiv2"
-PACKAGECONFIG[taglib] =3D "-Dtaglib=3Denabled,-Dtaglib=3Ddisabled,taglib=
"
-PACKAGECONFIG[libgsf] =3D "-Dlibgsf=3Denabled,-Dlibgsf=3Ddisabled,libgsf=
"
-PACKAGECONFIG[poppler] =3D "-Dpoppler=3Denabled,-Dpoppler=3Ddisabled,pop=
pler"
-
-FILES_SOLIBSDEV =3D ""
-FILES:${PN} +=3D "${libdir}/libgcmd.so ${datadir}/metainfo"
-INSANE_SKIP:${PN} +=3D "dev-so"
+FILES:${PN} +=3D "${datadir}/metainfo"
--=20
2.56.0

