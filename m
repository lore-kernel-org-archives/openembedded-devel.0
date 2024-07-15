Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B353BC52D74
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:06 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.33836.1721034184852008469
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r1eYvX9d;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034185; x=1752570185;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NUra9840rxVjIJXSRLIpvN7N0urSpJDGLa3ttfd8M3o=;
  b=r1eYvX9dAzIF2QiH9Yssq7c8BPB5pUs+LYR+uzMLOxzQCmi0E2i5ilO7
   BneJgq+hETAZubgv7b+q0CgDgRYHaTApiyHI61AelIwm2o3te2KYvo7yy
   waa749M30ylzUU8WyPCAml8WSq2xvLOxRkJeJiUQFIcR4tAfervSmQ0fh
   ux1B4k+wUbk7EnFeakW0RTUAbGMPYUHyX6W5hnu8B/Jx2zFGF4GP7uVnO
   iWMmnzizE/kfrqDsFx6i2NaPOCvocYSszkFFeeiiV4rYlr9O78PhG3AT9
   fnJjXyEvfR61dfR+IMmSTGPUq6Wb7y0pxNJPu5LgwAvVHwXGxZN/ihhtu
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="166909675"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="166909675"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:03:02 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 56A41D424F
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:03:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 74781BF3C8
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DF73320071A38
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A9AB61A000C;
	Mon, 15 Jul 2024 17:02:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 33/38] thin-provisioning-tools: upgrade 1.0.12 -> 1.0.13
Date: Mon, 15 Jul 2024 17:02:26 +0800
Message-Id: <1721034151-540-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.006
X-TMASE-Result: 10--3.833800-10.000000
X-TMASE-MatchedRID: AFiVwG0qm0+jz0nOeth/yUIIxwDaU5mrWDH2sIy8+j/fc2Xd6VJ+yv+Y
	Kp2Mb6xJOyC8lVmlV3v+LJ0LwPqg+/F/MFQDkAUUeXXhejkivZcXivwflisSrKwlYvWVD8zjeop
	14qUegYdnBd+7QItl3fmX6EkuUcFZaEsmopAJRAkyByMiwk6+3jbXuwFqSl0r31GU/N5W5BDW9n
	uzdghUMvu0HEWlaGvJxiiH+oQX+1WhhjsqgSuNbxF4zyLyne+ASMRbDC7vXmxeNs5tWYvjCb46Q
	N2xkiz7qkzC1nx45aYOe6UQgyI8eS0+EsApCrRRmOexU8E0y9F955Y1Xr69w9uykrHhg4Pdn0nC
	Iu+M0Obnk+PPhXCmbDoPt1QDXmUbr78SC5iivxwURSScn+QSXt0H8LFZNFG76sBnwpOylLMf6xh
	3k50OIpM5l8FLueI9hua+2WvARCYjF760BiZHZ9soQra2zjm56RfZVodo1hxagf7AuEAbzX7KHK
	IzMs3ni/XlM25JWiqIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111355

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Extend cache_check --clear-needs-check-flag to fix leaked blocks
- Suppress error messages from cache/era_dump on broken pipe error
- Add BTreeIterator
- Support listing the highest mapped block in thin_ls
- Support repairing device details tree from thin_repair
- Support vectored write in SyncIoEngine
- Fix missing version option in thin_explore
- Fix subcommand parsing in dev-tools

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../thin-provisioning-tools-crates.inc        | 206 +++++++++---------
 ...2.bb => thin-provisioning-tools_1.0.13.bb} |   2 +-
 2 files changed, 105 insertions(+), 103 deletions(-)
 rename meta-oe/recipes-support/thin-provisioning-tools/{thin-provisioning-tools_1.0.12.bb => thin-provisioning-tools_1.0.13.bb} (96%)

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
index d71aa442f..c5c059dd1 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
@@ -3,212 +3,214 @@
 # from Cargo.lock
 SRC_URI += " \
     crate://crates.io/adler/1.0.2 \
-    crate://crates.io/aho-corasick/1.1.2 \
-    crate://crates.io/anstyle/1.0.6 \
-    crate://crates.io/anyhow/1.0.80 \
+    crate://crates.io/aho-corasick/1.1.3 \
+    crate://crates.io/anstyle/1.0.7 \
+    crate://crates.io/anyhow/1.0.86 \
     crate://crates.io/atty/0.2.14 \
-    crate://crates.io/autocfg/1.1.0 \
-    crate://crates.io/base64/0.21.7 \
+    crate://crates.io/autocfg/1.3.0 \
+    crate://crates.io/base64/0.22.1 \
     crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bitflags/2.4.2 \
-    crate://crates.io/bytemuck/1.14.3 \
+    crate://crates.io/bitflags/2.6.0 \
+    crate://crates.io/bytemuck/1.16.1 \
     crate://crates.io/byteorder/1.5.0 \
     crate://crates.io/cassowary/0.3.0 \
     crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/clap/4.5.1 \
-    crate://crates.io/clap_builder/4.5.1 \
-    crate://crates.io/clap_lex/0.7.0 \
+    crate://crates.io/clap/4.5.9 \
+    crate://crates.io/clap_builder/4.5.9 \
+    crate://crates.io/clap_lex/0.7.1 \
     crate://crates.io/console/0.15.8 \
-    crate://crates.io/crc32c/0.6.5 \
-    crate://crates.io/crc32fast/1.4.0 \
-    crate://crates.io/data-encoding/2.5.0 \
+    crate://crates.io/crc32c/0.6.8 \
+    crate://crates.io/crc32fast/1.4.2 \
+    crate://crates.io/data-encoding/2.6.0 \
     crate://crates.io/downcast/0.11.0 \
     crate://crates.io/duct/0.13.7 \
     crate://crates.io/encode_unicode/0.3.6 \
     crate://crates.io/env_logger/0.8.4 \
-    crate://crates.io/errno/0.3.8 \
+    crate://crates.io/errno/0.3.9 \
     crate://crates.io/exitcode/1.1.2 \
-    crate://crates.io/fastrand/2.0.1 \
+    crate://crates.io/fastrand/2.1.0 \
     crate://crates.io/fixedbitset/0.4.2 \
-    crate://crates.io/flate2/1.0.28 \
+    crate://crates.io/flate2/1.0.30 \
     crate://crates.io/fragile/2.0.0 \
-    crate://crates.io/getrandom/0.2.12 \
+    crate://crates.io/getrandom/0.2.15 \
     crate://crates.io/hermit-abi/0.1.19 \
-    crate://crates.io/hermit-abi/0.3.6 \
+    crate://crates.io/hermit-abi/0.3.9 \
     crate://crates.io/indicatif/0.17.8 \
-    crate://crates.io/instant/0.1.12 \
+    crate://crates.io/instant/0.1.13 \
     crate://crates.io/iovec/0.1.4 \
-    crate://crates.io/lazy_static/1.4.0 \
-    crate://crates.io/libc/0.2.153 \
-    crate://crates.io/linux-raw-sys/0.4.13 \
-    crate://crates.io/log/0.4.20 \
-    crate://crates.io/memchr/2.7.1 \
+    crate://crates.io/lazy_static/1.5.0 \
+    crate://crates.io/libc/0.2.155 \
+    crate://crates.io/linux-raw-sys/0.4.14 \
+    crate://crates.io/log/0.4.22 \
+    crate://crates.io/memchr/2.7.4 \
     crate://crates.io/minimal-lexical/0.2.1 \
-    crate://crates.io/miniz_oxide/0.7.2 \
+    crate://crates.io/miniz_oxide/0.7.4 \
     crate://crates.io/mockall/0.12.1 \
     crate://crates.io/mockall_derive/0.12.1 \
     crate://crates.io/nom/7.1.3 \
     crate://crates.io/num-derive/0.4.2 \
-    crate://crates.io/num-traits/0.2.18 \
+    crate://crates.io/num-traits/0.2.19 \
     crate://crates.io/num_cpus/1.16.0 \
     crate://crates.io/number_prefix/0.4.0 \
     crate://crates.io/numtoa/0.1.0 \
     crate://crates.io/once_cell/1.19.0 \
-    crate://crates.io/os_pipe/1.1.5 \
+    crate://crates.io/os_pipe/1.2.0 \
     crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/ppv-lite86/0.2.17 \
     crate://crates.io/predicates/3.1.0 \
     crate://crates.io/predicates-core/1.0.6 \
     crate://crates.io/predicates-tree/1.0.9 \
-    crate://crates.io/proc-macro2/1.0.78 \
-    crate://crates.io/quick-xml/0.31.0 \
+    crate://crates.io/proc-macro2/1.0.86 \
+    crate://crates.io/quick-xml/0.36.0 \
     crate://crates.io/quickcheck/1.0.3 \
     crate://crates.io/quickcheck_macros/1.0.0 \
-    crate://crates.io/quote/1.0.35 \
+    crate://crates.io/quote/1.0.36 \
     crate://crates.io/rand/0.8.5 \
     crate://crates.io/rand_chacha/0.3.1 \
     crate://crates.io/rand_core/0.6.4 \
-    crate://crates.io/rangemap/1.5.0 \
+    crate://crates.io/rangemap/1.5.1 \
     crate://crates.io/redox_syscall/0.2.16 \
     crate://crates.io/redox_termios/0.1.3 \
-    crate://crates.io/regex/1.10.3 \
-    crate://crates.io/regex-automata/0.4.5 \
-    crate://crates.io/regex-syntax/0.8.2 \
-    crate://crates.io/roaring/0.10.3 \
+    crate://crates.io/regex/1.10.5 \
+    crate://crates.io/regex-automata/0.4.7 \
+    crate://crates.io/regex-syntax/0.8.4 \
+    crate://crates.io/roaring/0.10.6 \
     crate://crates.io/rustc_version/0.4.0 \
-    crate://crates.io/rustix/0.38.31 \
+    crate://crates.io/rustix/0.38.34 \
     crate://crates.io/safemem/0.3.3 \
-    crate://crates.io/semver/1.0.22 \
+    crate://crates.io/semver/1.0.23 \
     crate://crates.io/shared_child/1.0.0 \
-    crate://crates.io/strsim/0.11.0 \
+    crate://crates.io/strsim/0.11.1 \
     crate://crates.io/syn/1.0.109 \
-    crate://crates.io/syn/2.0.50 \
-    crate://crates.io/tempfile/3.10.0 \
+    crate://crates.io/syn/2.0.70 \
+    crate://crates.io/tempfile/3.10.1 \
     crate://crates.io/termion/1.5.6 \
     crate://crates.io/termtree/0.4.1 \
-    crate://crates.io/thiserror/1.0.57 \
-    crate://crates.io/thiserror-impl/1.0.57 \
+    crate://crates.io/thiserror/1.0.61 \
+    crate://crates.io/thiserror-impl/1.0.61 \
     crate://crates.io/threadpool/1.8.1 \
     crate://crates.io/tui/0.19.0 \
     crate://crates.io/unicode-ident/1.0.12 \
     crate://crates.io/unicode-segmentation/1.11.0 \
-    crate://crates.io/unicode-width/0.1.11 \
+    crate://crates.io/unicode-width/0.1.13 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
     crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
     crate://crates.io/windows-sys/0.52.0 \
-    crate://crates.io/windows-targets/0.52.3 \
-    crate://crates.io/windows_aarch64_gnullvm/0.52.3 \
-    crate://crates.io/windows_aarch64_msvc/0.52.3 \
-    crate://crates.io/windows_i686_gnu/0.52.3 \
-    crate://crates.io/windows_i686_msvc/0.52.3 \
-    crate://crates.io/windows_x86_64_gnu/0.52.3 \
-    crate://crates.io/windows_x86_64_gnullvm/0.52.3 \
-    crate://crates.io/windows_x86_64_msvc/0.52.3 \
+    crate://crates.io/windows-targets/0.52.6 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
+    crate://crates.io/windows_aarch64_msvc/0.52.6 \
+    crate://crates.io/windows_i686_gnu/0.52.6 \
+    crate://crates.io/windows_i686_gnullvm/0.52.6 \
+    crate://crates.io/windows_i686_msvc/0.52.6 \
+    crate://crates.io/windows_x86_64_gnu/0.52.6 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
+    crate://crates.io/windows_x86_64_msvc/0.52.6 \
 "
 
 SRC_URI[adler-1.0.2.sha256sum] = "f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe"
-SRC_URI[aho-corasick-1.1.2.sha256sum] = "b2969dcb958b36655471fc61f7e416fa76033bdd4bfed0678d8fee1e2d07a1f0"
-SRC_URI[anstyle-1.0.6.sha256sum] = "8901269c6307e8d93993578286ac0edf7f195079ffff5ebdeea6a59ffb7e36bc"
-SRC_URI[anyhow-1.0.80.sha256sum] = "5ad32ce52e4161730f7098c077cd2ed6229b5804ccf99e5366be1ab72a98b4e1"
+SRC_URI[aho-corasick-1.1.3.sha256sum] = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
+SRC_URI[anstyle-1.0.7.sha256sum] = "038dfcf04a5feb68e9c60b21c9625a54c2c0616e79b72b0fd87075a056ae1d1b"
+SRC_URI[anyhow-1.0.86.sha256sum] = "b3d1d046238990b9cf5bcde22a3fb3584ee5cf65fb2765f454ed428c7a0063da"
 SRC_URI[atty-0.2.14.sha256sum] = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8"
-SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
-SRC_URI[base64-0.21.7.sha256sum] = "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
+SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
+SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bitflags-2.4.2.sha256sum] = "ed570934406eb16438a4e976b1b4500774099c13b8cb96eec99f620f05090ddf"
-SRC_URI[bytemuck-1.14.3.sha256sum] = "a2ef034f05691a48569bd920a96c81b9d91bbad1ab5ac7c4616c1f6ef36cb79f"
+SRC_URI[bitflags-2.6.0.sha256sum] = "b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de"
+SRC_URI[bytemuck-1.16.1.sha256sum] = "b236fc92302c97ed75b38da1f4917b5cdda4984745740f153a5d3059e48d725e"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
 SRC_URI[cassowary-0.3.0.sha256sum] = "df8670b8c7b9dae1793364eafadf7239c40d669904660c5960d74cfd80b46a53"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[clap-4.5.1.sha256sum] = "c918d541ef2913577a0f9566e9ce27cb35b6df072075769e0b26cb5a554520da"
-SRC_URI[clap_builder-4.5.1.sha256sum] = "9f3e7391dad68afb0c2ede1bf619f579a3dc9c2ec67f089baa397123a2f3d1eb"
-SRC_URI[clap_lex-0.7.0.sha256sum] = "98cc8fbded0c607b7ba9dd60cd98df59af97e84d24e49c8557331cfc26d301ce"
+SRC_URI[clap-4.5.9.sha256sum] = "64acc1846d54c1fe936a78dc189c34e28d3f5afc348403f28ecf53660b9b8462"
+SRC_URI[clap_builder-4.5.9.sha256sum] = "6fb8393d67ba2e7bfaf28a23458e4e2b543cc73a99595511eb207fdb8aede942"
+SRC_URI[clap_lex-0.7.1.sha256sum] = "4b82cf0babdbd58558212896d1a4272303a57bdb245c2bf1147185fb45640e70"
 SRC_URI[console-0.15.8.sha256sum] = "0e1f83fc076bd6dd27517eacdf25fef6c4dfe5f1d7448bafaaf3a26f13b5e4eb"
-SRC_URI[crc32c-0.6.5.sha256sum] = "89254598aa9b9fa608de44b3ae54c810f0f06d755e24c50177f1f8f31ff50ce2"
-SRC_URI[crc32fast-1.4.0.sha256sum] = "b3855a8a784b474f333699ef2bbca9db2c4a1f6d9088a90a2d25b1eb53111eaa"
-SRC_URI[data-encoding-2.5.0.sha256sum] = "7e962a19be5cfc3f3bf6dd8f61eb50107f356ad6270fbb3ed41476571db78be5"
+SRC_URI[crc32c-0.6.8.sha256sum] = "3a47af21622d091a8f0fb295b88bc886ac74efcc613efc19f5d0b21de5c89e47"
+SRC_URI[crc32fast-1.4.2.sha256sum] = "a97769d94ddab943e4510d138150169a2758b5ef3eb191a9ee688de3e23ef7b3"
+SRC_URI[data-encoding-2.6.0.sha256sum] = "e8566979429cf69b49a5c740c60791108e86440e8be149bbea4fe54d2c32d6e2"
 SRC_URI[downcast-0.11.0.sha256sum] = "1435fa1053d8b2fbbe9be7e97eca7f33d37b28409959813daefc1446a14247f1"
 SRC_URI[duct-0.13.7.sha256sum] = "e4ab5718d1224b63252cd0c6f74f6480f9ffeb117438a2e0f5cf6d9a4798929c"
 SRC_URI[encode_unicode-0.3.6.sha256sum] = "a357d28ed41a50f9c765dbfe56cbc04a64e53e5fc58ba79fbc34c10ef3df831f"
 SRC_URI[env_logger-0.8.4.sha256sum] = "a19187fea3ac7e84da7dacf48de0c45d63c6a76f9490dae389aead16c243fce3"
-SRC_URI[errno-0.3.8.sha256sum] = "a258e46cdc063eb8519c00b9fc845fc47bcfca4130e2f08e88665ceda8474245"
+SRC_URI[errno-0.3.9.sha256sum] = "534c5cf6194dfab3db3242765c03bbe257cf92f22b38f6bc0c58d59108a820ba"
 SRC_URI[exitcode-1.1.2.sha256sum] = "de853764b47027c2e862a995c34978ffa63c1501f2e15f987ba11bd4f9bba193"
-SRC_URI[fastrand-2.0.1.sha256sum] = "25cbce373ec4653f1a01a31e8a5e5ec0c622dc27ff9c4e6606eefef5cbbed4a5"
+SRC_URI[fastrand-2.1.0.sha256sum] = "9fc0510504f03c51ada170672ac806f1f105a88aa97a5281117e1ddc3368e51a"
 SRC_URI[fixedbitset-0.4.2.sha256sum] = "0ce7134b9999ecaf8bcd65542e436736ef32ddca1b3e06094cb6ec5755203b80"
-SRC_URI[flate2-1.0.28.sha256sum] = "46303f565772937ffe1d394a4fac6f411c6013172fadde9dcdb1e147a086940e"
+SRC_URI[flate2-1.0.30.sha256sum] = "5f54427cfd1c7829e2a139fcefea601bf088ebca651d2bf53ebc600eac295dae"
 SRC_URI[fragile-2.0.0.sha256sum] = "6c2141d6d6c8512188a7891b4b01590a45f6dac67afb4f255c4124dbb86d4eaa"
-SRC_URI[getrandom-0.2.12.sha256sum] = "190092ea657667030ac6a35e305e62fc4dd69fd98ac98631e5d3a2b1575a12b5"
+SRC_URI[getrandom-0.2.15.sha256sum] = "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
 SRC_URI[hermit-abi-0.1.19.sha256sum] = "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33"
-SRC_URI[hermit-abi-0.3.6.sha256sum] = "bd5256b483761cd23699d0da46cc6fd2ee3be420bbe6d020ae4a091e70b7e9fd"
+SRC_URI[hermit-abi-0.3.9.sha256sum] = "d231dfb89cfffdbc30e7fc41579ed6066ad03abda9e567ccafae602b97ec5024"
 SRC_URI[indicatif-0.17.8.sha256sum] = "763a5a8f45087d6bcea4222e7b72c291a054edf80e4ef6efd2a4979878c7bea3"
-SRC_URI[instant-0.1.12.sha256sum] = "7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c"
+SRC_URI[instant-0.1.13.sha256sum] = "e0242819d153cba4b4b05a5a8f2a7e9bbf97b6055b2a002b395c96b5ff3c0222"
 SRC_URI[iovec-0.1.4.sha256sum] = "b2b3ea6ff95e175473f8ffe6a7eb7c00d054240321b84c57051175fe3c1e075e"
-SRC_URI[lazy_static-1.4.0.sha256sum] = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
-SRC_URI[libc-0.2.153.sha256sum] = "9c198f91728a82281a64e1f4f9eeb25d82cb32a5de251c6bd1b5154d63a8e7bd"
-SRC_URI[linux-raw-sys-0.4.13.sha256sum] = "01cda141df6706de531b6c46c3a33ecca755538219bd484262fa09410c13539c"
-SRC_URI[log-0.4.20.sha256sum] = "b5e6163cb8c49088c2c36f57875e58ccd8c87c7427f7fbd50ea6710b2f3f2e8f"
-SRC_URI[memchr-2.7.1.sha256sum] = "523dc4f511e55ab87b694dc30d0f820d60906ef06413f93d4d7a1385599cc149"
+SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
+SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
+SRC_URI[linux-raw-sys-0.4.14.sha256sum] = "78b3ae25bc7c8c38cec158d1f2757ee79e9b3740fbc7ccf0e59e4b08d793fa89"
+SRC_URI[log-0.4.22.sha256sum] = "a7a70ba024b9dc04c27ea2f0c0548feb474ec5c54bba33a7f72f873a39d07b24"
+SRC_URI[memchr-2.7.4.sha256sum] = "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
-SRC_URI[miniz_oxide-0.7.2.sha256sum] = "9d811f3e15f28568be3407c8e7fdb6514c1cda3cb30683f15b6a1a1dc4ea14a7"
+SRC_URI[miniz_oxide-0.7.4.sha256sum] = "b8a240ddb74feaf34a79a7add65a741f3167852fba007066dcac1ca548d89c08"
 SRC_URI[mockall-0.12.1.sha256sum] = "43766c2b5203b10de348ffe19f7e54564b64f3d6018ff7648d1e2d6d3a0f0a48"
 SRC_URI[mockall_derive-0.12.1.sha256sum] = "af7cbce79ec385a1d4f54baa90a76401eb15d9cab93685f62e7e9f942aa00ae2"
 SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
 SRC_URI[num-derive-0.4.2.sha256sum] = "ed3955f1a9c7c0c15e092f9c887db08b1fc683305fdf6eb6684f22555355e202"
-SRC_URI[num-traits-0.2.18.sha256sum] = "da0df0e5185db44f69b44f26786fe401b6c293d1907744beaa7fa62b2e5a517a"
+SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
 SRC_URI[num_cpus-1.16.0.sha256sum] = "4161fcb6d602d4d2081af7c3a45852d875a03dd337a6bfdd6e06407b61342a43"
 SRC_URI[number_prefix-0.4.0.sha256sum] = "830b246a0e5f20af87141b25c173cd1b609bd7779a4617d6ec582abaf90870f3"
 SRC_URI[numtoa-0.1.0.sha256sum] = "b8f8bdf33df195859076e54ab11ee78a1b208382d3a26ec40d142ffc1ecc49ef"
 SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
-SRC_URI[os_pipe-1.1.5.sha256sum] = "57119c3b893986491ec9aa85056780d3a0f3cf4da7cc09dd3650dbd6c6738fb9"
+SRC_URI[os_pipe-1.2.0.sha256sum] = "29d73ba8daf8fac13b0501d1abeddcfe21ba7401ada61a819144b6c2a4f32209"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[ppv-lite86-0.2.17.sha256sum] = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
 SRC_URI[predicates-3.1.0.sha256sum] = "68b87bfd4605926cdfefc1c3b5f8fe560e3feca9d5552cf68c466d3d8236c7e8"
 SRC_URI[predicates-core-1.0.6.sha256sum] = "b794032607612e7abeb4db69adb4e33590fa6cf1149e95fd7cb00e634b92f174"
 SRC_URI[predicates-tree-1.0.9.sha256sum] = "368ba315fb8c5052ab692e68a0eefec6ec57b23a36959c14496f0b0df2c0cecf"
-SRC_URI[proc-macro2-1.0.78.sha256sum] = "e2422ad645d89c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae"
-SRC_URI[quick-xml-0.31.0.sha256sum] = "1004a344b30a54e2ee58d66a71b32d2db2feb0a31f9a2d302bf0536f15de2a33"
+SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
+SRC_URI[quick-xml-0.36.0.sha256sum] = "4091e032efecb09d7b1f711f487b85ab925632a842627e3200fb088382cde32c"
 SRC_URI[quickcheck-1.0.3.sha256sum] = "588f6378e4dd99458b60ec275b4477add41ce4fa9f64dcba6f15adccb19b50d6"
 SRC_URI[quickcheck_macros-1.0.0.sha256sum] = "b22a693222d716a9587786f37ac3f6b4faedb5b80c23914e7303ff5a1d8016e9"
-SRC_URI[quote-1.0.35.sha256sum] = "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
+SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
 SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
 SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
-SRC_URI[rangemap-1.5.0.sha256sum] = "795915a3930a5d6bafd9053d37602fea3e61be2e5d4d788983a8ba9654c1c6f2"
+SRC_URI[rangemap-1.5.1.sha256sum] = "f60fcc7d6849342eff22c4350c8b9a989ee8ceabc4b481253e8946b9fe83d684"
 SRC_URI[redox_syscall-0.2.16.sha256sum] = "fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a"
 SRC_URI[redox_termios-0.1.3.sha256sum] = "20145670ba436b55d91fc92d25e71160fbfbdd57831631c8d7d36377a476f1cb"
-SRC_URI[regex-1.10.3.sha256sum] = "b62dbe01f0b06f9d8dc7d49e05a0785f153b00b2c227856282f671e0318c9b15"
-SRC_URI[regex-automata-0.4.5.sha256sum] = "5bb987efffd3c6d0d8f5f89510bb458559eab11e4f869acb20bf845e016259cd"
-SRC_URI[regex-syntax-0.8.2.sha256sum] = "c08c74e62047bb2de4ff487b251e4a92e24f48745648451635cec7d591162d9f"
-SRC_URI[roaring-0.10.3.sha256sum] = "a1c77081a55300e016cb86f2864415b7518741879db925b8d488a0ee0d2da6bf"
+SRC_URI[regex-1.10.5.sha256sum] = "b91213439dad192326a0d7c6ee3955910425f441d7038e0d6933b0aec5c4517f"
+SRC_URI[regex-automata-0.4.7.sha256sum] = "38caf58cc5ef2fed281f89292ef23f6365465ed9a41b7a7754eb4e26496c92df"
+SRC_URI[regex-syntax-0.8.4.sha256sum] = "7a66a03ae7c801facd77a29370b4faec201768915ac14a721ba36f20bc9c209b"
+SRC_URI[roaring-0.10.6.sha256sum] = "8f4b84ba6e838ceb47b41de5194a60244fac43d9fe03b71dbe8c5a201081d6d1"
 SRC_URI[rustc_version-0.4.0.sha256sum] = "bfa0f585226d2e68097d4f95d113b15b83a82e819ab25717ec0590d9584ef366"
-SRC_URI[rustix-0.38.31.sha256sum] = "6ea3e1a662af26cd7a3ba09c0297a31af215563ecf42817c98df621387f4e949"
+SRC_URI[rustix-0.38.34.sha256sum] = "70dc5ec042f7a43c4a73241207cecc9873a06d45debb38b329f8541d85c2730f"
 SRC_URI[safemem-0.3.3.sha256sum] = "ef703b7cb59335eae2eb93ceb664c0eb7ea6bf567079d843e09420219668e072"
-SRC_URI[semver-1.0.22.sha256sum] = "92d43fe69e652f3df9bdc2b85b2854a0825b86e4fb76bc44d945137d053639ca"
+SRC_URI[semver-1.0.23.sha256sum] = "61697e0a1c7e512e84a621326239844a24d8207b4669b41bc18b32ea5cbf988b"
 SRC_URI[shared_child-1.0.0.sha256sum] = "b0d94659ad3c2137fef23ae75b03d5241d633f8acded53d672decfa0e6e0caef"
-SRC_URI[strsim-0.11.0.sha256sum] = "5ee073c9e4cd00e28217186dbe12796d692868f432bf2e97ee73bed0c56dfa01"
+SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
 SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
-SRC_URI[syn-2.0.50.sha256sum] = "74f1bdc9872430ce9b75da68329d1c1746faf50ffac5f19e02b71e37ff881ffb"
-SRC_URI[tempfile-3.10.0.sha256sum] = "a365e8cd18e44762ef95d87f284f4b5cd04107fec2ff3052bd6a3e6069669e67"
+SRC_URI[syn-2.0.70.sha256sum] = "2f0209b68b3613b093e0ec905354eccaedcfe83b8cb37cbdeae64026c3064c16"
+SRC_URI[tempfile-3.10.1.sha256sum] = "85b77fafb263dd9d05cbeac119526425676db3784113aa9295c88498cbf8bff1"
 SRC_URI[termion-1.5.6.sha256sum] = "077185e2eac69c3f8379a4298e1e07cd36beb962290d4a51199acf0fdc10607e"
 SRC_URI[termtree-0.4.1.sha256sum] = "3369f5ac52d5eb6ab48c6b4ffdc8efbcad6b89c765749064ba298f2c68a16a76"
-SRC_URI[thiserror-1.0.57.sha256sum] = "1e45bcbe8ed29775f228095caf2cd67af7a4ccf756ebff23a306bf3e8b47b24b"
-SRC_URI[thiserror-impl-1.0.57.sha256sum] = "a953cb265bef375dae3de6663da4d3804eee9682ea80d8e2542529b73c531c81"
+SRC_URI[thiserror-1.0.61.sha256sum] = "c546c80d6be4bc6a00c0f01730c08df82eaa7a7a61f11d656526506112cc1709"
+SRC_URI[thiserror-impl-1.0.61.sha256sum] = "46c3384250002a6d5af4d114f2845d37b57521033f30d5c3f46c4d70e1197533"
 SRC_URI[threadpool-1.8.1.sha256sum] = "d050e60b33d41c19108b32cea32164033a9013fe3b46cbd4457559bfbf77afaa"
 SRC_URI[tui-0.19.0.sha256sum] = "ccdd26cbd674007e649a272da4475fb666d3aa0ad0531da7136db6fab0e5bad1"
 SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
 SRC_URI[unicode-segmentation-1.11.0.sha256sum] = "d4c87d22b6e3f4a18d4d40ef354e97c90fcb14dd91d7dc0aa9d8a1172ebf7202"
-SRC_URI[unicode-width-0.1.11.sha256sum] = "e51733f11c9c4f72aa0c160008246859e340b00807569a0da0e7a1079b27ba85"
+SRC_URI[unicode-width-0.1.13.sha256sum] = "0336d538f7abc86d282a4189614dfaa90810dfc2c6f6427eaf88e16311dd225d"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
 SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
-SRC_URI[windows-targets-0.52.3.sha256sum] = "d380ba1dc7187569a8a9e91ed34b8ccfc33123bbacb8c0aed2d1ad7f3ef2dc5f"
-SRC_URI[windows_aarch64_gnullvm-0.52.3.sha256sum] = "68e5dcfb9413f53afd9c8f86e56a7b4d86d9a2fa26090ea2dc9e40fba56c6ec6"
-SRC_URI[windows_aarch64_msvc-0.52.3.sha256sum] = "8dab469ebbc45798319e69eebf92308e541ce46760b49b18c6b3fe5e8965b30f"
-SRC_URI[windows_i686_gnu-0.52.3.sha256sum] = "2a4e9b6a7cac734a8b4138a4e1044eac3404d8326b6c0f939276560687a033fb"
-SRC_URI[windows_i686_msvc-0.52.3.sha256sum] = "28b0ec9c422ca95ff34a78755cfa6ad4a51371da2a5ace67500cf7ca5f232c58"
-SRC_URI[windows_x86_64_gnu-0.52.3.sha256sum] = "704131571ba93e89d7cd43482277d6632589b18ecf4468f591fbae0a8b101614"
-SRC_URI[windows_x86_64_gnullvm-0.52.3.sha256sum] = "42079295511643151e98d61c38c0acc444e52dd42ab456f7ccfd5152e8ecf21c"
-SRC_URI[windows_x86_64_msvc-0.52.3.sha256sum] = "0770833d60a970638e989b3fa9fd2bb1aaadcf88963d1659fd7d9990196ed2d6"
+SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
+SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
+SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
+SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
+SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
+SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
+SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
+SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
+SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.12.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.13.bb
similarity index 96%
rename from meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.12.bb
rename to meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.13.bb
index 51b4b3dcc..1d3c79724 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.12.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.13.bb
@@ -11,7 +11,7 @@ SRC_URI = " \
     git://github.com/jthornber/thin-provisioning-tools;branch=main;protocol=https \
     "
 
-SRCREV = "b2d57dad4c3378544d7b36f3fc61e60989c5c092"
+SRCREV = "116c05345bed5fe727992c3458311606d5443ff6"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 inherit cargo cargo-update-recipe-crates
-- 
2.34.1


