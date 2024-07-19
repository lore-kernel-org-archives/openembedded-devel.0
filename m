Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB916C3DA59
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 08:51:13 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.14765.1721379071875987550
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jul 2024 01:51:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout10.t-online.de (Postfix) with SMTP id 68744124A9
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jul 2024 10:51:09 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.70]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sUjKW-0xf3tx0; Fri, 19 Jul 2024 10:51:08 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-clang][PATCH] bindgen-cli: update 0.64.0 -> 0.69.4
Date: Fri, 19 Jul 2024 10:52:18 +0200
Message-ID: <20240719085218.3058914-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1721379068-267FA850-FAA0F42E/0/0 CLEAN NORMAL
X-TOI-MSGID: 7431eacf-3322-4f9a-a698-a6fbca862515
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jul 2024 08:51:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111413

mesa requires at least bindgen-cli_0.65.0
https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/gallium/frontend=
s/rusticl/meson.build#L111

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../bindgen-cli/bindgen-cli-crates.inc        | 204 +++++++++---------
 ...en-cli_0.64.0.bb =3D> bindgen-cli_0.69.4.bb} |   5 +-
 2 files changed, 98 insertions(+), 111 deletions(-)
 rename recipes-devtools/bindgen-cli/{bindgen-cli_0.64.0.bb =3D> bindgen-=
cli_0.69.4.bb} (78%)

diff --git a/recipes-devtools/bindgen-cli/bindgen-cli-crates.inc b/recipe=
s-devtools/bindgen-cli/bindgen-cli-crates.inc
index 5bf5faf..aeae96e 100644
--- a/recipes-devtools/bindgen-cli/bindgen-cli-crates.inc
+++ b/recipes-devtools/bindgen-cli/bindgen-cli-crates.inc
@@ -2,197 +2,185 @@
=20
 # from Cargo.lock
 SRC_URI +=3D " \
-    crate://crates.io/aho-corasick/0.5.3 \
     crate://crates.io/aho-corasick/0.7.20 \
-    crate://crates.io/ansi_term/0.12.1 \
-    crate://crates.io/atty/0.2.14 \
+    crate://crates.io/annotate-snippets/0.9.1 \
     crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.2.1 \
     crate://crates.io/block/0.1.6 \
     crate://crates.io/cc/1.0.78 \
     crate://crates.io/cexpr/0.6.0 \
     crate://crates.io/cfg-if/1.0.0 \
     crate://crates.io/clang-sys/1.4.0 \
-    crate://crates.io/clap/2.34.0 \
     crate://crates.io/clap/4.1.4 \
+    crate://crates.io/clap_complete/4.2.0 \
     crate://crates.io/clap_derive/4.1.0 \
     crate://crates.io/clap_lex/0.3.1 \
-    crate://crates.io/diff/0.1.13 \
     crate://crates.io/either/1.8.1 \
-    crate://crates.io/env_logger/0.3.5 \
-    crate://crates.io/env_logger/0.9.3 \
-    crate://crates.io/errno/0.2.8 \
+    crate://crates.io/env_logger/0.10.0 \
+    crate://crates.io/env_logger/0.8.4 \
     crate://crates.io/errno-dragonfly/0.1.2 \
+    crate://crates.io/errno/0.3.1 \
     crate://crates.io/fastrand/1.8.0 \
-    crate://crates.io/fuchsia-cprng/0.1.1 \
+    crate://crates.io/getrandom/0.2.8 \
     crate://crates.io/glob/0.3.1 \
     crate://crates.io/heck/0.4.0 \
-    crate://crates.io/hermit-abi/0.1.19 \
-    crate://crates.io/hermit-abi/0.2.6 \
+    crate://crates.io/hermit-abi/0.3.2 \
     crate://crates.io/humantime/2.1.0 \
     crate://crates.io/instant/0.1.12 \
     crate://crates.io/io-lifetimes/1.0.4 \
-    crate://crates.io/is-terminal/0.4.2 \
-    crate://crates.io/kernel32-sys/0.2.2 \
-    crate://crates.io/lazy_static/1.4.0 \
-    crate://crates.io/lazycell/1.3.0 \
-    crate://crates.io/libc/0.2.139 \
-    crate://crates.io/libloading/0.6.7 \
+    crate://crates.io/is-terminal/0.4.7 \
+    crate://crates.io/itertools/0.13.0 \
+    crate://crates.io/libc/0.2.154 \
     crate://crates.io/libloading/0.7.4 \
     crate://crates.io/linux-raw-sys/0.1.4 \
-    crate://crates.io/log/0.3.9 \
+    crate://crates.io/linux-raw-sys/0.3.8 \
     crate://crates.io/log/0.4.17 \
     crate://crates.io/malloc_buf/0.0.6 \
-    crate://crates.io/memchr/0.1.11 \
     crate://crates.io/memchr/2.5.0 \
     crate://crates.io/minimal-lexical/0.2.1 \
     crate://crates.io/nom/7.1.3 \
     crate://crates.io/objc/0.2.7 \
     crate://crates.io/once_cell/1.17.0 \
     crate://crates.io/os_str_bytes/6.4.1 \
-    crate://crates.io/peeking_take_while/0.1.2 \
-    crate://crates.io/proc-macro-error/1.0.4 \
+    crate://crates.io/owo-colors/3.5.0 \
+    crate://crates.io/prettyplease/0.2.7 \
     crate://crates.io/proc-macro-error-attr/1.0.4 \
-    crate://crates.io/proc-macro2/1.0.50 \
-    crate://crates.io/quickcheck/0.4.1 \
-    crate://crates.io/quote/1.0.23 \
-    crate://crates.io/rand/0.3.23 \
-    crate://crates.io/rand/0.4.6 \
-    crate://crates.io/rand_core/0.3.1 \
-    crate://crates.io/rand_core/0.4.2 \
-    crate://crates.io/rdrand/0.4.0 \
+    crate://crates.io/proc-macro-error/1.0.4 \
+    crate://crates.io/proc-macro2/1.0.60 \
+    crate://crates.io/quickcheck/1.0.3 \
+    crate://crates.io/quote/1.0.28 \
+    crate://crates.io/rand/0.8.5 \
+    crate://crates.io/rand_core/0.6.4 \
     crate://crates.io/redox_syscall/0.2.16 \
-    crate://crates.io/regex/0.1.80 \
-    crate://crates.io/regex/1.7.1 \
-    crate://crates.io/regex-syntax/0.3.9 \
     crate://crates.io/regex-syntax/0.6.28 \
-    crate://crates.io/remove_dir_all/0.5.3 \
+    crate://crates.io/regex/1.7.1 \
     crate://crates.io/rustc-hash/1.1.0 \
-    crate://crates.io/rustix/0.36.7 \
-    crate://crates.io/shlex/1.1.0 \
-    crate://crates.io/strsim/0.8.0 \
+    crate://crates.io/rustix/0.36.16 \
+    crate://crates.io/rustix/0.37.3 \
+    crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/similar/2.2.1 \
     crate://crates.io/strsim/0.10.0 \
     crate://crates.io/syn/1.0.107 \
-    crate://crates.io/tempdir/0.3.7 \
-    crate://crates.io/tempfile/3.3.0 \
+    crate://crates.io/syn/2.0.18 \
+    crate://crates.io/tempfile/3.4.0 \
     crate://crates.io/termcolor/1.2.0 \
-    crate://crates.io/textwrap/0.11.0 \
-    crate://crates.io/thread-id/2.0.0 \
-    crate://crates.io/thread_local/0.2.7 \
     crate://crates.io/unicode-ident/1.0.6 \
     crate://crates.io/unicode-width/0.1.10 \
-    crate://crates.io/utf8-ranges/0.1.3 \
-    crate://crates.io/vec_map/0.8.2 \
     crate://crates.io/version_check/0.9.4 \
-    crate://crates.io/which/4.4.0 \
-    crate://crates.io/winapi/0.2.8 \
-    crate://crates.io/winapi/0.3.9 \
-    crate://crates.io/winapi-build/0.1.1 \
+    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
     crate://crates.io/winapi-util/0.1.5 \
     crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi/0.3.9 \
     crate://crates.io/windows-sys/0.42.0 \
-    crate://crates.io/windows_aarch64_gnullvm/0.42.1 \
-    crate://crates.io/windows_aarch64_msvc/0.42.1 \
-    crate://crates.io/windows_i686_gnu/0.42.1 \
-    crate://crates.io/windows_i686_msvc/0.42.1 \
-    crate://crates.io/windows_x86_64_gnu/0.42.1 \
-    crate://crates.io/windows_x86_64_gnullvm/0.42.1 \
-    crate://crates.io/windows_x86_64_msvc/0.42.1 \
+    crate://crates.io/windows-sys/0.45.0 \
+    crate://crates.io/windows-sys/0.48.0 \
+    crate://crates.io/windows-targets/0.42.2 \
+    crate://crates.io/windows-targets/0.48.1 \
+    crate://crates.io/windows_aarch64_gnullvm/0.42.2 \
+    crate://crates.io/windows_aarch64_gnullvm/0.48.0 \
+    crate://crates.io/windows_aarch64_msvc/0.42.2 \
+    crate://crates.io/windows_aarch64_msvc/0.48.0 \
+    crate://crates.io/windows_i686_gnu/0.42.2 \
+    crate://crates.io/windows_i686_gnu/0.48.0 \
+    crate://crates.io/windows_i686_msvc/0.42.2 \
+    crate://crates.io/windows_i686_msvc/0.48.0 \
+    crate://crates.io/windows_x86_64_gnu/0.42.2 \
+    crate://crates.io/windows_x86_64_gnu/0.48.0 \
+    crate://crates.io/windows_x86_64_gnullvm/0.42.2 \
+    crate://crates.io/windows_x86_64_gnullvm/0.48.0 \
+    crate://crates.io/windows_x86_64_msvc/0.42.2 \
+    crate://crates.io/windows_x86_64_msvc/0.48.0 \
+    crate://crates.io/yansi-term/0.1.2 \
 "
=20
-SRC_URI[aho-corasick-0.5.3.sha256sum] =3D "ca972c2ea5f742bfce5687b9aef75=
506a764f61d37f8f649047846a9686ddb66"
 SRC_URI[aho-corasick-0.7.20.sha256sum] =3D "cc936419f96fa211c1b9166887b3=
8e5e40b19958e5b895be7c1f93adec7071ac"
-SRC_URI[ansi_term-0.12.1.sha256sum] =3D "d52a9bb7ec0cf484c551830a7ce27bd=
20d67eac647e1befb56b0be4ee39a55d2"
-SRC_URI[atty-0.2.14.sha256sum] =3D "d9b39be18770d11421cdb1b9947a45dd3f37=
e93092cbf377614828a319d5fee8"
+SRC_URI[annotate-snippets-0.9.1.sha256sum] =3D "c3b9d411ecbaf79885c6df4d=
75fff75858d5995ff25385657a28af47e82f9c36"
 SRC_URI[bitflags-1.3.2.sha256sum] =3D "bef38d45163c2f1dde094a7dfd33ccf59=
5c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bitflags-2.2.1.sha256sum] =3D "24a6904aef64d73cf10ab17ebace7befb=
918b82164785cb89907993be7f83813"
 SRC_URI[block-0.1.6.sha256sum] =3D "0d8c1fef690941d3e7788d328517591fecc6=
84c084084702d6ff1641e993699a"
 SRC_URI[cc-1.0.78.sha256sum] =3D "a20104e2335ce8a659d6dd92a51a767a0c0625=
99c73b343fd152cb401e828c3d"
 SRC_URI[cexpr-0.6.0.sha256sum] =3D "6fac387a98bb7c37292057cffc56d62ecb62=
9900026402633ae9160df93a8766"
 SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee58=
2ebb74b53b4efbf79117bd2da40fd"
 SRC_URI[clang-sys-1.4.0.sha256sum] =3D "fa2e27ae6ab525c3d369ded447057bca=
5438d86dc3a68f6faafb8269ba82ebf3"
-SRC_URI[clap-2.34.0.sha256sum] =3D "a0610544180c38b88101fecf2dd634b174a6=
2eef6946f84dfc6a7127512b381c"
 SRC_URI[clap-4.1.4.sha256sum] =3D "f13b9c79b5d1dd500d20ef541215a6423c758=
29ef43117e1b4d17fd8af0b5d76"
+SRC_URI[clap_complete-4.2.0.sha256sum] =3D "01c22dcfb410883764b29953103d=
9ef7bb8fe21b3fa1158bc99986c2067294bd"
 SRC_URI[clap_derive-4.1.0.sha256sum] =3D "684a277d672e91966334af371f1a7b=
5833f9aa00b07c84e92fbce95e00208ce8"
 SRC_URI[clap_lex-0.3.1.sha256sum] =3D "783fe232adfca04f90f56201b26d79682=
d4cd2625e0bc7290b95123afe558ade"
-SRC_URI[diff-0.1.13.sha256sum] =3D "56254986775e3233ffa9c4d7d3faaf6d36a2=
c09d30b20687e9f88bc8bafc16c8"
 SRC_URI[either-1.8.1.sha256sum] =3D "7fcaabb2fef8c910e7f4c7ce9f67a1283a1=
715879a7c230ca9d6d1ae31f16d91"
-SRC_URI[env_logger-0.3.5.sha256sum] =3D "15abd780e45b3ea4f76b4e9a26ff484=
3258dd8a3eed2775a0e7368c2e7936c2f"
-SRC_URI[env_logger-0.9.3.sha256sum] =3D "a12e6657c4c97ebab115a42dcee7722=
5f7f482cdd841cf7088c657a42e9e00e7"
-SRC_URI[errno-0.2.8.sha256sum] =3D "f639046355ee4f37944e44f60642c6f3a7ef=
a3cf6b78c78a0d989a8ce6c396a1"
+SRC_URI[env_logger-0.10.0.sha256sum] =3D "85cdab6a89accf66733ad5a1693a4d=
cced6aeff64602b634530dd73c1f3ee9f0"
+SRC_URI[env_logger-0.8.4.sha256sum] =3D "a19187fea3ac7e84da7dacf48de0c45=
d63c6a76f9490dae389aead16c243fce3"
 SRC_URI[errno-dragonfly-0.1.2.sha256sum] =3D "aa68f1b12764fab894d2755d25=
18754e71b4fd80ecfb822714a1206c2aab39bf"
+SRC_URI[errno-0.3.1.sha256sum] =3D "4bcfec3a70f97c962c307b2d2c56e358cf1d=
00b558d74262b5f929ee8cc7e73a"
 SRC_URI[fastrand-1.8.0.sha256sum] =3D "a7a407cfaa3385c4ae6b23e84623d48c2=
798d06e3e6a1878f7f59f17b3f86499"
-SRC_URI[fuchsia-cprng-0.1.1.sha256sum] =3D "a06f77d526c1a601b7c4cdd98f54=
b5eaabffc14d5f2f0296febdc7f357c6d3ba"
+SRC_URI[getrandom-0.2.8.sha256sum] =3D "c05aeb6a22b8f62540c194aac980f211=
5af067bfe15a0734d7277a768d396b31"
 SRC_URI[glob-0.3.1.sha256sum] =3D "d2fabcfbdc87f4758337ca535fb41a6d701b6=
5693ce38287d856d1674551ec9b"
 SRC_URI[heck-0.4.0.sha256sum] =3D "2540771e65fc8cb83cd6e8a237f70c319bd5c=
29f78ed1084ba5d50eeac86f7f9"
-SRC_URI[hermit-abi-0.1.19.sha256sum] =3D "62b467343b94ba476dcb2500d242da=
dbb39557df889310ac77c5d99100aaac33"
-SRC_URI[hermit-abi-0.2.6.sha256sum] =3D "ee512640fe35acbfb4bb779db6f0d80=
704c2cacfa2e39b601ef3e3f47d1ae4c7"
+SRC_URI[hermit-abi-0.3.2.sha256sum] =3D "443144c8cdadd93ebf52ddb4056d257=
f5b52c04d3c804e657d19eb73fc33668b"
 SRC_URI[humantime-2.1.0.sha256sum] =3D "9a3a5bfb195931eeb336b2a7b4d761da=
ec841b97f947d34394601737a7bba5e4"
 SRC_URI[instant-0.1.12.sha256sum] =3D "7a5bbe824c507c5da5956355e86a746d8=
2e0e1464f65d862cc5e71da70e94b2c"
 SRC_URI[io-lifetimes-1.0.4.sha256sum] =3D "e7d6c6f8c91b4b9ed43484ad1a938=
e393caf35960fce7f82a040497207bd8e9e"
-SRC_URI[is-terminal-0.4.2.sha256sum] =3D "28dfb6c8100ccc63462345b67d1bbc=
3679177c75ee4bf59bf29c8b1d110b8189"
-SRC_URI[kernel32-sys-0.2.2.sha256sum] =3D "7507624b29483431c0ba2d82aece8=
ca6cdba9382bff4ddd0f7490560c056098d"
-SRC_URI[lazy_static-1.4.0.sha256sum] =3D "e2abad23fbc42b3700f2f279844dc8=
32adb2b2eb069b2df918f455c4e18cc646"
-SRC_URI[lazycell-1.3.0.sha256sum] =3D "830d08ce1d1d941e6b30645f1a0eb5643=
013d835ce3779a5fc208261dbe10f55"
-SRC_URI[libc-0.2.139.sha256sum] =3D "201de327520df007757c1f0adce6e827fe8=
562fbc28bfd9c15571c66ca1f5f79"
-SRC_URI[libloading-0.6.7.sha256sum] =3D "351a32417a12d5f7e82c368a66781e3=
07834dae04c6ce0cd4456d52989229883"
+SRC_URI[is-terminal-0.4.7.sha256sum] =3D "adcf93614601c8129ddf72e2d5633d=
f827ba6551541c6d8c59520a371475be1f"
+SRC_URI[itertools-0.13.0.sha256sum] =3D "413ee7dfc52ee1a4949ceeb7dbc8a33=
f2d6c088194d9f922fb8318faf1f01186"
+SRC_URI[libc-0.2.154.sha256sum] =3D "ae743338b92ff9146ce83992f766a31066a=
91a8c84a45e0e9f21e7cf6de6d346"
 SRC_URI[libloading-0.7.4.sha256sum] =3D "b67380fd3b2fbe7527a606e18729d21=
c6f3951633d0500574c4dc22d2d638b9f"
 SRC_URI[linux-raw-sys-0.1.4.sha256sum] =3D "f051f77a7c8e6957c0696eac88f2=
6b0117e54f52d3fc682ab19397a8812846a4"
-SRC_URI[log-0.3.9.sha256sum] =3D "e19e8d5c34a3e0e2223db8e060f9e8264aeeb5=
c5fc64a4ee9965c062211c024b"
+SRC_URI[linux-raw-sys-0.3.8.sha256sum] =3D "ef53942eb7bf7ff43a617b3e2c1c=
4a5ecf5944a7c1bc12d7ee39bbb15e5c1519"
 SRC_URI[log-0.4.17.sha256sum] =3D "abb12e687cfb44aa40f41fc3978ef76448f9b=
6038cad6aef4259d3c095a2382e"
 SRC_URI[malloc_buf-0.0.6.sha256sum] =3D "62bb907fe88d54d8d9ce32a3cceab42=
18ed2f6b7d35617cafe9adf84e43919cb"
-SRC_URI[memchr-0.1.11.sha256sum] =3D "d8b629fb514376c675b98c1421e80b151d=
3817ac42d7c667717d282761418d20"
 SRC_URI[memchr-2.5.0.sha256sum] =3D "2dffe52ecf27772e601905b7522cb4ef790=
d2cc203488bbd0e2fe85fcb74566d"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] =3D "68354c5c6bd36d73ff3feceb05=
efa59b6acb7626617f4962be322a825e61f79a"
 SRC_URI[nom-7.1.3.sha256sum] =3D "d273983c5a657a70a3e8f2a01329822f3b8c81=
72b73826411a55751e404a0a4a"
 SRC_URI[objc-0.2.7.sha256sum] =3D "915b1b472bc21c53464d6c8461c9d3af805ba=
1ef837e1cac254428f4a77177b1"
 SRC_URI[once_cell-1.17.0.sha256sum] =3D "6f61fba1741ea2b3d6a1e3178721804=
bb716a68a6aeba1149b5d52e3d464ea66"
 SRC_URI[os_str_bytes-6.4.1.sha256sum] =3D "9b7820b9daea5457c9f21c6944890=
5d723fbd21136ccf521748f23fd49e723ee"
-SRC_URI[peeking_take_while-0.1.2.sha256sum] =3D "19b17cddbe7ec3f8bc80088=
7bab5e717348c95ea2ca0b1bf0837fb964dc67099"
-SRC_URI[proc-macro-error-1.0.4.sha256sum] =3D "da25490ff9892aab3fcf7c36f=
08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
+SRC_URI[owo-colors-3.5.0.sha256sum] =3D "c1b04fb49957986fdce4d6ee7a65027=
d55d4b6d2265e5848bbb507b58ccfdb6f"
+SRC_URI[prettyplease-0.2.7.sha256sum] =3D "43ded2b5b204571f065ab8540367d=
738dfe1b3606ab9eb669dcfb5e7a3a07501"
 SRC_URI[proc-macro-error-attr-1.0.4.sha256sum] =3D "a1be40180e52ecc98ad8=
0b184934baf3d0d29f979574e439af5a55274b35f869"
-SRC_URI[proc-macro2-1.0.50.sha256sum] =3D "6ef7d57beacfaf2d8aee5937dab7b=
7f28de3cb8b1828479bb5de2a7106f2bae2"
-SRC_URI[quickcheck-0.4.1.sha256sum] =3D "02c2411d418cea2364325b18a205664=
f9ef8252e06b2e911db97c0b0d98b1406"
-SRC_URI[quote-1.0.23.sha256sum] =3D "8856d8364d252a14d474036ea1358d63c9e=
6965c8e5c1885c18f73d70bff9c7b"
-SRC_URI[rand-0.3.23.sha256sum] =3D "64ac302d8f83c0c1974bf758f6b041c6c8ad=
a916fbb44a609158ca8b064cc76c"
-SRC_URI[rand-0.4.6.sha256sum] =3D "552840b97013b1a26992c11eac34bdd778e46=
4601a4c2054b5f0bff7c6761293"
-SRC_URI[rand_core-0.3.1.sha256sum] =3D "7a6fdeb83b075e8266dcc8762c22776f=
6877a63111121f5f8c7411e5be7eed4b"
-SRC_URI[rand_core-0.4.2.sha256sum] =3D "9c33a3c44ca05fa6f1807d8e6743f382=
4e8509beca625669633be0acbdf509dc"
-SRC_URI[rdrand-0.4.0.sha256sum] =3D "678054eb77286b51581ba43620cc911abf0=
2758c91f93f479767aed0f90458b2"
+SRC_URI[proc-macro-error-1.0.4.sha256sum] =3D "da25490ff9892aab3fcf7c36f=
08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
+SRC_URI[proc-macro2-1.0.60.sha256sum] =3D "dec2b086b7a862cf4de201096214f=
a870344cf922b2b30c167badb3af3195406"
+SRC_URI[quickcheck-1.0.3.sha256sum] =3D "588f6378e4dd99458b60ec275b4477a=
dd41ce4fa9f64dcba6f15adccb19b50d6"
+SRC_URI[quote-1.0.28.sha256sum] =3D "1b9ab9c7eadfd8df19006f1cf1a4aed1354=
0ed5cbc047010ece5826e10825488"
+SRC_URI[rand-0.8.5.sha256sum] =3D "34af8d1a0e25924bc5b7c43c079c942339d8f=
0a8b57c39049bef581b46327404"
+SRC_URI[rand_core-0.6.4.sha256sum] =3D "ec0be4795e2f6a28069bec0b5ff3e2ac=
9bafc99e6a9a7dc3547996c5c816922c"
 SRC_URI[redox_syscall-0.2.16.sha256sum] =3D "fb5a58c1855b4b6819d59012155=
603f0b22ad30cad752600aadfcb695265519a"
-SRC_URI[regex-0.1.80.sha256sum] =3D "4fd4ace6a8cf7860714a2c2280d6c1f7e6a=
413486c13298bbc86fd3da019402f"
-SRC_URI[regex-1.7.1.sha256sum] =3D "48aaa5748ba571fb95cd2c85c09f629215d3=
a6ece942baa100950af03a34f733"
-SRC_URI[regex-syntax-0.3.9.sha256sum] =3D "f9ec002c35e86791825ed294b5000=
8eea9ddfc8def4420124fbc6b08db834957"
 SRC_URI[regex-syntax-0.6.28.sha256sum] =3D "456c603be3e8d448b072f410900c=
09faf164fbce2d480456f50eea6e25f9c848"
-SRC_URI[remove_dir_all-0.5.3.sha256sum] =3D "3acd125665422973a33ac9d3dd2=
df85edad0f4ae9b00dafb1a05e43a9f5ef8e7"
+SRC_URI[regex-1.7.1.sha256sum] =3D "48aaa5748ba571fb95cd2c85c09f629215d3=
a6ece942baa100950af03a34f733"
 SRC_URI[rustc-hash-1.1.0.sha256sum] =3D "08d43f7aa6b08d49f382cde6a798204=
7c3426db949b1424bc4b7ec9ae12c6ce2"
-SRC_URI[rustix-0.36.7.sha256sum] =3D "d4fdebc4b395b7fbb9ab11e462e20ed905=
1e7b16e42d24042c776eca0ac81b03"
-SRC_URI[shlex-1.1.0.sha256sum] =3D "43b2853a4d09f215c24cc5489c992ce46052=
d359b5109343cbafbf26bc62f8a3"
-SRC_URI[strsim-0.8.0.sha256sum] =3D "8ea5119cdb4c55b55d432abb513a0429384=
878c15dde60cc77b1c99de1a95a6a"
+SRC_URI[rustix-0.36.16.sha256sum] =3D "6da3636faa25820d8648e0e31c5d519bb=
b01f72fdf57131f0f5f7da5fed36eab"
+SRC_URI[rustix-0.37.3.sha256sum] =3D "62b24138615de35e32031d041a09032ef3=
487a616d901ca4db224e7d557efae2"
+SRC_URI[shlex-1.3.0.sha256sum] =3D "0fda2ff0d084019ba4d7c6f371c95d8fd75c=
e3524c3cb8fb653a3023f6323e64"
+SRC_URI[similar-2.2.1.sha256sum] =3D "420acb44afdae038210c99e69aae24109f=
32f15500aa708e81d46c9f29d55fcf"
 SRC_URI[strsim-0.10.0.sha256sum] =3D "73473c0e59e6d5812c5dfe2a064a644494=
9f089e20eec9a2e5506596494e4623"
 SRC_URI[syn-1.0.107.sha256sum] =3D "1f4064b5b16e03ae50984a5a8ed5d4f8803e=
6bc1fd170a3cda91a1be4b18e3f5"
-SRC_URI[tempdir-0.3.7.sha256sum] =3D "15f2b5fb00ccdf689e0149d1b1b3c03fea=
d81c2b37735d812fa8bddbbf41b6d8"
-SRC_URI[tempfile-3.3.0.sha256sum] =3D "5cdb1ef4eaeeaddc8fbd371e501705706=
4af0911902ef36b39801f67cc6d79e4"
+SRC_URI[syn-2.0.18.sha256sum] =3D "32d41677bcbe24c20c52e7c70b0d8db04134c=
5d1066bf98662e2871ad200ea3e"
+SRC_URI[tempfile-3.4.0.sha256sum] =3D "af18f7ae1acd354b992402e9ec5864359=
d693cd8a79dcbef59f76891701c1e95"
 SRC_URI[termcolor-1.2.0.sha256sum] =3D "be55cf8942feac5c765c2c9934228068=
43c9a9a45d4d5c407ad6dd2ea95eb9b6"
-SRC_URI[textwrap-0.11.0.sha256sum] =3D "d326610f408c7a4eb6f51c37c330e496=
b08506c9457c9d34287ecc38809fb060"
-SRC_URI[thread-id-2.0.0.sha256sum] =3D "a9539db560102d1cef46b8b78ce737ff=
0bb64e7e18d35b2a5688f7d097d0ff03"
-SRC_URI[thread_local-0.2.7.sha256sum] =3D "8576dbbfcaef9641452d5cf0df9b0=
e7eeab7694956dd33bb61515fb8f18cfdd5"
 SRC_URI[unicode-ident-1.0.6.sha256sum] =3D "84a22b9f218b40614adcb3f4ff08=
b703773ad44fa9423e4e0d346d5db86e4ebc"
 SRC_URI[unicode-width-0.1.10.sha256sum] =3D "c0edd1e5b14653f783770bce4a4=
dabb4a5108a5370a5f5d8cfe8710c361f6c8b"
-SRC_URI[utf8-ranges-0.1.3.sha256sum] =3D "a1ca13c08c41c9c3e04224ed9ff804=
61d97e121589ff27c753a16cb10830ae0f"
-SRC_URI[vec_map-0.8.2.sha256sum] =3D "f1bddf1187be692e79c5ffeab891132dfb=
0f236ed36a43c7ed39f1165ee20191"
 SRC_URI[version_check-0.9.4.sha256sum] =3D "49874b5167b65d7193b8aba1567f=
5c7d93d001cafc34600cee003eda787e483f"
-SRC_URI[which-4.4.0.sha256sum] =3D "2441c784c52b289a054b7201fc93253e288f=
094e2f4be9058343127c4226a269"
-SRC_URI[winapi-0.2.8.sha256sum] =3D "167dc9d6949a9b857f3451275e911c3f442=
55842c1f7a76f33c55103a909087a"
-SRC_URI[winapi-0.3.9.sha256sum] =3D "5c839a674fcd7a98952e593242ea400abe9=
3992746761e38641405d28b00f419"
-SRC_URI[winapi-build-0.1.1.sha256sum] =3D "2d315eee3b34aca4797b2da6b13ed=
88266e6d612562a0c46390af8299fc699bc"
+SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] =3D "9c8d87e72b64a=
3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D "ac3b87c63620426=
dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
 SRC_URI[winapi-util-0.1.5.sha256sum] =3D "70ec6ce85bb158151cae5e5c87f95a=
8e97d2c0c4b001223f33a334e3ce5de178"
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D "712e227841d05=
7c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[winapi-0.3.9.sha256sum] =3D "5c839a674fcd7a98952e593242ea400abe9=
3992746761e38641405d28b00f419"
 SRC_URI[windows-sys-0.42.0.sha256sum] =3D "5a3e1820f08b8513f676f7ab6c1f9=
9ff312fb97b553d30ff4dd86f9f15728aa7"
-SRC_URI[windows_aarch64_gnullvm-0.42.1.sha256sum] =3D "8c9864e83243fdec7=
fc9c5444389dcbbfd258f745e7853198f365e3c4968a608"
-SRC_URI[windows_aarch64_msvc-0.42.1.sha256sum] =3D "4c8b1b673ffc16c47a9f=
f48570a9d85e25d265735c503681332589af6253c6c7"
-SRC_URI[windows_i686_gnu-0.42.1.sha256sum] =3D "de3887528ad530ba7bdbb1fa=
a8275ec7a1155a45ffa57c37993960277145d640"
-SRC_URI[windows_i686_msvc-0.42.1.sha256sum] =3D "bf4d1122317eddd6ff351aa=
852118a2418ad4214e6613a50e0191f7004372605"
-SRC_URI[windows_x86_64_gnu-0.42.1.sha256sum] =3D "c1040f221285e17ebccbc2=
591ffdc2d44ee1f9186324dd3e84e99ac68d699c45"
-SRC_URI[windows_x86_64_gnullvm-0.42.1.sha256sum] =3D "628bfdf232daa22b0d=
64fdb62b09fcc36bb01f05a3939e20ab73aaf9470d0463"
-SRC_URI[windows_x86_64_msvc-0.42.1.sha256sum] =3D "447660ad36a13288b1db4=
d4248e857b510e8c3a225c822ba4fb748c0aafecffd"
+SRC_URI[windows-sys-0.45.0.sha256sum] =3D "75283be5efb2831d37ea142365f00=
9c02ec203cd29a3ebecbc093d52315b66d0"
+SRC_URI[windows-sys-0.48.0.sha256sum] =3D "677d2418bec65e3338edb076e806b=
c1ec15693c5d0104683f2efe857f61056a9"
+SRC_URI[windows-targets-0.42.2.sha256sum] =3D "8e5180c00cd44c9b1c88adb36=
93291f1cd93605ded80c250a75d472756b4d071"
+SRC_URI[windows-targets-0.48.1.sha256sum] =3D "05d4b17490f70499f20b9e791=
dcf6a299785ce8af4d709018206dc5b4953e95f"
+SRC_URI[windows_aarch64_gnullvm-0.42.2.sha256sum] =3D "597a5118570b68bc0=
8d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8"
+SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] =3D "91ae572e1b79dba88=
3e0d315474df7305d12f569b400fcf90581b06062f7e1bc"
+SRC_URI[windows_aarch64_msvc-0.42.2.sha256sum] =3D "e08e8864a60f06ef0d0f=
f4ba04124db8b0fb3be5776a5cd47641e942e58c4d43"
+SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] =3D "b2ef27e0d7bdfcfc7b86=
8b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"
+SRC_URI[windows_i686_gnu-0.42.2.sha256sum] =3D "c61d927d8da41da96a81f029=
489353e68739737d3beca43145c8afec9a31a84f"
+SRC_URI[windows_i686_gnu-0.48.0.sha256sum] =3D "622a1962a7db830d6fd0a696=
83c80a18fda201879f0f447f065a3b7467daa241"
+SRC_URI[windows_i686_msvc-0.42.2.sha256sum] =3D "44d840b6ec649f480a41c8d=
80f9c65108b92d89345dd94027bfe06ac444d1060"
+SRC_URI[windows_i686_msvc-0.48.0.sha256sum] =3D "4542c6e364ce21bf45d69fd=
d2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"
+SRC_URI[windows_x86_64_gnu-0.42.2.sha256sum] =3D "8de912b8b8feb55c064867=
cf047dda097f92d51efad5b491dfb98f6bbb70cb36"
+SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] =3D "ca2b8a661f7628cbd23440=
e50b05d705db3686f894fc9580820623656af974b1"
+SRC_URI[windows_x86_64_gnullvm-0.42.2.sha256sum] =3D "26d41b46a36d453748=
aedef1486d5c7a85db22e56aff34643984ea85514e94a3"
+SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] =3D "7896dbc1f41e08872e=
9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
+SRC_URI[windows_x86_64_msvc-0.42.2.sha256sum] =3D "9aec5da331524158c6d1a=
4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0"
+SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] =3D "1a515f5799fe4961cb532=
f983ce2b23082366b898e52ffbce459c86f67c8378a"
+SRC_URI[yansi-term-0.1.2.sha256sum] =3D "fe5c30ade05e61656247b2e334a031d=
fd0cc466fadef865bdcdea8d537951bf1"
diff --git a/recipes-devtools/bindgen-cli/bindgen-cli_0.64.0.bb b/recipes=
-devtools/bindgen-cli/bindgen-cli_0.69.4.bb
similarity index 78%
rename from recipes-devtools/bindgen-cli/bindgen-cli_0.64.0.bb
rename to recipes-devtools/bindgen-cli/bindgen-cli_0.69.4.bb
index 7c0b739..e85a649 100644
--- a/recipes-devtools/bindgen-cli/bindgen-cli_0.64.0.bb
+++ b/recipes-devtools/bindgen-cli/bindgen-cli_0.69.4.bb
@@ -6,9 +6,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0b9a98cb3dcdef=
cceb145324693fda9b"
=20
 inherit rust cargo cargo-update-recipe-crates
=20
-SRCREV =3D "ae6817256ac557981906e93a1f866349db85053e"
-SRC_URI =3D "git://github.com/rust-lang/rust-bindgen;protocol=3Dhttps;br=
anch=3Dmain"
-
+SRC_URI +=3D "git://github.com/rust-lang/rust-bindgen.git;protocol=3Dhtt=
ps;branch=3Dmain"
+SRCREV =3D "7600bf8097fd47d61f91948f2b36be6ea41f7d89"
 S =3D "${WORKDIR}/git"
=20
 require ${BPN}-crates.inc
--=20
2.45.1


