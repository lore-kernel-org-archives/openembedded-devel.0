Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6060D44009
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:26 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.36716.1731922223235983363
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=H4BD3MF4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922223; x=1763458223;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ANHHn5e31KrRP5eP9CNMyrfkSWui7wo9DS2x8dgFSNA=;
  b=H4BD3MF4wXDnOwzhPn0g4z865XGS0kvILu9oQ9KlPJcClGpN6n1nfi2O
   wcUtj3i2Bb1siUdqNncI9AXda81yO9o+nhuX/dIOlPQGVeJMsED2kS1Dc
   qroWaELwjOTyj4I4MNSzDjqApufovbszvDSxacAatHfeHOnBkQCkuz4Sm
   qBQXWXz3+nyiQr2bh1FtLTT7KSAsgY04H/cElnBEcvKt1GU0D53YklWmV
   wY58oINILPU8VE5h1h6kfVDKbakB4J8DfTHHXRG98bXV2ant8cyGNyPDH
   wkH2UXLgX+VzOAAoRu6BHhi486QQmJON8Pdh18oId0JnqFD6eJYCsmAls
   g==;
X-CSE-ConnectionGUID: FPJPF0uuRCa1cdSpgsw2sg==
X-CSE-MsgGUID: EUm2JcSfRP6jnboRsG5GbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="180997140"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="180997140"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:20 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 98689DBB8F
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 13A6BD52B8
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 757ACE368F
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:17 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 186AD1A000B;
	Mon, 18 Nov 2024 17:30:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 32/32] uutils-coreutils: upgrade 0.0.27 -> 0.0.28
Date: Mon, 18 Nov 2024 17:29:55 +0800
Message-Id: <1731922195-5266-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10--11.209600-10.000000
X-TMASE-MatchedRID: mL9wGNQYBVujz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDtnf
	JrUSEbFDJMPD8FR5f58F1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054142zm1Zi+MJ3pJ
	MnxOYKHYDqYXoj9Hp5pQb4XCC7/DS1dDZHbsJnLOV4tc/M7dU0RboBQVvyK0aWm35/kmWgKNtyb
	9DJuQttzHgccZHokFHq5UJ2wehuDcSoHBmuXyfr9N9TX8X49szh6nwisY6+c2Qc9WQFO7fU1vG4
	HQ9aPmBuailLdwvzYW8O1FZRSMqGDWs2YGWPbxrwnkyfDvzh5iOVGny5q72hi6b3gMTeDNfskd6
	YQ6MPpSkzPslAxPGz+JkythGnwvAbpoisIUBhj1bUzvsaHW6BnybxFChjV90PRMMc6AcbA7nZk1
	RoPazlIdOZtIeEJUcPTS95t2DVulK72YegpDrEKDAJyS9PYxmguwtqyXlE6EfIGCZubTsxLWODd
	Z1PDmE/698fvxGSDyAMuqetGVetnyef22ep6XYkGUtrowrXLg=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113898

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/uutils/coreutils/releases/tag/0.0.28

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../uutils-coreutils-crates.inc               | 668 +++++++++++++-----
 ...s_0.0.27.bb => uutils-coreutils_0.0.28.bb} |   2 +-
 2 files changed, 475 insertions(+), 195 deletions(-)
 rename meta-oe/recipes-core/uutils-coreutils/{uutils-coreutils_0.0.27.bb => uutils-coreutils_0.0.28.bb} (98%)

diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
index e5bde3d04..162b60182 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
@@ -4,7 +4,7 @@
 SRC_URI += " \
     crate://crates.io/adler/1.0.2 \
     crate://crates.io/ahash/0.8.11 \
-    crate://crates.io/aho-corasick/1.0.4 \
+    crate://crates.io/aho-corasick/1.1.3 \
     crate://crates.io/allocator-api2/0.2.18 \
     crate://crates.io/android-tzdata/0.1.1 \
     crate://crates.io/android_system_properties/0.1.5 \
@@ -18,24 +18,26 @@ SRC_URI += " \
     crate://crates.io/arrayref/0.3.6 \
     crate://crates.io/arrayvec/0.7.4 \
     crate://crates.io/autocfg/1.1.0 \
-    crate://crates.io/bigdecimal/0.4.5 \
+    crate://crates.io/bigdecimal/0.4.6 \
     crate://crates.io/binary-heap-plus/0.5.0 \
     crate://crates.io/bincode/1.3.3 \
-    crate://crates.io/bindgen/0.69.4 \
+    crate://crates.io/bindgen/0.70.1 \
+    crate://crates.io/bit-set/0.5.3 \
+    crate://crates.io/bit-vec/0.6.3 \
     crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bitflags/2.5.0 \
+    crate://crates.io/bitflags/2.6.0 \
     crate://crates.io/bitvec/1.0.1 \
     crate://crates.io/blake2b_simd/1.0.2 \
-    crate://crates.io/blake3/1.5.1 \
+    crate://crates.io/blake3/1.5.4 \
     crate://crates.io/block-buffer/0.10.3 \
-    crate://crates.io/bstr/1.9.1 \
+    crate://crates.io/bstr/1.10.0 \
     crate://crates.io/bumpalo/3.11.1 \
     crate://crates.io/bytecount/0.6.8 \
     crate://crates.io/byteorder/1.5.0 \
-    crate://crates.io/cc/1.0.79 \
+    crate://crates.io/cc/1.1.13 \
     crate://crates.io/cexpr/0.6.0 \
     crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/cfg_aliases/0.1.1 \
+    crate://crates.io/cfg_aliases/0.2.1 \
     crate://crates.io/chrono/0.4.38 \
     crate://crates.io/clang-sys/1.4.0 \
     crate://crates.io/clap/4.4.2 \
@@ -65,7 +67,7 @@ SRC_URI += " \
     crate://crates.io/crossterm_winapi/0.9.1 \
     crate://crates.io/crunchy/0.2.2 \
     crate://crates.io/crypto-common/0.1.6 \
-    crate://crates.io/ctrlc/3.4.4 \
+    crate://crates.io/ctrlc/3.4.5 \
     crate://crates.io/data-encoding/2.6.0 \
     crate://crates.io/data-encoding-macro/0.1.15 \
     crate://crates.io/data-encoding-macro-internal/0.1.13 \
@@ -76,35 +78,34 @@ SRC_URI += " \
     crate://crates.io/displaydoc/0.2.4 \
     crate://crates.io/dlv-list/0.5.0 \
     crate://crates.io/dns-lookup/2.0.4 \
-    crate://crates.io/dunce/1.0.4 \
+    crate://crates.io/dunce/1.0.5 \
     crate://crates.io/either/1.8.0 \
     crate://crates.io/encode_unicode/0.3.6 \
-    crate://crates.io/env_logger/0.8.4 \
     crate://crates.io/equivalent/1.0.1 \
     crate://crates.io/errno/0.3.8 \
     crate://crates.io/exacl/0.12.0 \
-    crate://crates.io/fastrand/2.0.1 \
+    crate://crates.io/fastrand/2.1.1 \
     crate://crates.io/file_diff/1.0.0 \
     crate://crates.io/filedescriptor/0.8.2 \
-    crate://crates.io/filetime/0.2.23 \
+    crate://crates.io/filetime/0.2.25 \
     crate://crates.io/flate2/1.0.28 \
     crate://crates.io/fnv/1.0.7 \
     crate://crates.io/fs_extra/1.3.0 \
     crate://crates.io/fsevent-sys/4.1.0 \
-    crate://crates.io/fts-sys/0.2.9 \
-    crate://crates.io/fundu/2.0.0 \
-    crate://crates.io/fundu-core/0.3.0 \
+    crate://crates.io/fts-sys/0.2.11 \
+    crate://crates.io/fundu/2.0.1 \
+    crate://crates.io/fundu-core/0.3.1 \
     crate://crates.io/funty/2.0.0 \
-    crate://crates.io/futures/0.3.28 \
-    crate://crates.io/futures-channel/0.3.28 \
-    crate://crates.io/futures-core/0.3.28 \
-    crate://crates.io/futures-executor/0.3.28 \
-    crate://crates.io/futures-io/0.3.28 \
-    crate://crates.io/futures-macro/0.3.28 \
-    crate://crates.io/futures-sink/0.3.28 \
-    crate://crates.io/futures-task/0.3.28 \
-    crate://crates.io/futures-timer/3.0.2 \
-    crate://crates.io/futures-util/0.3.28 \
+    crate://crates.io/futures/0.3.30 \
+    crate://crates.io/futures-channel/0.3.31 \
+    crate://crates.io/futures-core/0.3.31 \
+    crate://crates.io/futures-executor/0.3.30 \
+    crate://crates.io/futures-io/0.3.31 \
+    crate://crates.io/futures-macro/0.3.31 \
+    crate://crates.io/futures-sink/0.3.31 \
+    crate://crates.io/futures-task/0.3.31 \
+    crate://crates.io/futures-timer/3.0.3 \
+    crate://crates.io/futures-util/0.3.31 \
     crate://crates.io/gcd/2.3.0 \
     crate://crates.io/generic-array/0.14.6 \
     crate://crates.io/getrandom/0.2.9 \
@@ -117,13 +118,11 @@ SRC_URI += " \
     crate://crates.io/hostname/0.4.0 \
     crate://crates.io/iana-time-zone/0.1.53 \
     crate://crates.io/iana-time-zone-haiku/0.1.2 \
-    crate://crates.io/indexmap/2.2.6 \
-    crate://crates.io/indicatif/0.17.8 \
+    crate://crates.io/indexmap/2.5.0 \
+    crate://crates.io/indicatif/0.17.9 \
     crate://crates.io/inotify/0.9.6 \
     crate://crates.io/inotify-sys/0.1.5 \
-    crate://crates.io/instant/0.1.12 \
     crate://crates.io/io-lifetimes/1.0.11 \
-    crate://crates.io/itertools/0.12.1 \
     crate://crates.io/itertools/0.13.0 \
     crate://crates.io/itoa/1.0.4 \
     crate://crates.io/js-sys/0.3.64 \
@@ -131,41 +130,43 @@ SRC_URI += " \
     crate://crates.io/kqueue/1.0.7 \
     crate://crates.io/kqueue-sys/1.0.3 \
     crate://crates.io/lazy_static/1.4.0 \
-    crate://crates.io/lazycell/1.3.0 \
-    crate://crates.io/libc/0.2.155 \
+    crate://crates.io/libc/0.2.161 \
     crate://crates.io/libloading/0.7.4 \
     crate://crates.io/libm/0.2.7 \
+    crate://crates.io/libredox/0.1.3 \
     crate://crates.io/linux-raw-sys/0.3.8 \
-    crate://crates.io/linux-raw-sys/0.4.12 \
+    crate://crates.io/linux-raw-sys/0.4.14 \
     crate://crates.io/lock_api/0.4.9 \
     crate://crates.io/log/0.4.20 \
     crate://crates.io/lru/0.12.3 \
-    crate://crates.io/lscolors/0.16.0 \
+    crate://crates.io/lscolors/0.20.0 \
     crate://crates.io/md-5/0.10.6 \
     crate://crates.io/memchr/2.7.4 \
-    crate://crates.io/memmap2/0.9.4 \
+    crate://crates.io/memmap2/0.9.5 \
     crate://crates.io/minimal-lexical/0.2.1 \
     crate://crates.io/miniz_oxide/0.7.2 \
     crate://crates.io/mio/0.8.11 \
-    crate://crates.io/nix/0.28.0 \
+    crate://crates.io/nix/0.29.0 \
     crate://crates.io/nom/7.1.3 \
     crate://crates.io/notify/6.0.1 \
-    crate://crates.io/nu-ansi-term/0.49.0 \
-    crate://crates.io/num-bigint/0.4.5 \
+    crate://crates.io/nu-ansi-term/0.50.0 \
+    crate://crates.io/num-bigint/0.4.6 \
     crate://crates.io/num-conv/0.1.0 \
     crate://crates.io/num-integer/0.1.46 \
     crate://crates.io/num-modular/0.5.1 \
     crate://crates.io/num-prime/0.4.4 \
     crate://crates.io/num-traits/0.2.19 \
+    crate://crates.io/num_enum/0.7.3 \
+    crate://crates.io/num_enum_derive/0.7.3 \
     crate://crates.io/num_threads/0.1.6 \
     crate://crates.io/number_prefix/0.4.0 \
-    crate://crates.io/once_cell/1.19.0 \
+    crate://crates.io/once_cell/1.20.2 \
     crate://crates.io/onig/6.4.0 \
     crate://crates.io/onig_sys/69.8.1 \
     crate://crates.io/ordered-multimap/0.7.3 \
     crate://crates.io/os_display/0.1.3 \
     crate://crates.io/parking_lot/0.12.1 \
-    crate://crates.io/parking_lot_core/0.9.9 \
+    crate://crates.io/parking_lot_core/0.9.10 \
     crate://crates.io/parse_datetime/0.6.0 \
     crate://crates.io/phf/0.11.2 \
     crate://crates.io/phf_codegen/0.11.2 \
@@ -174,51 +175,53 @@ SRC_URI += " \
     crate://crates.io/pin-project-lite/0.2.9 \
     crate://crates.io/pin-utils/0.1.0 \
     crate://crates.io/pkg-config/0.3.26 \
-    crate://crates.io/platform-info/2.0.3 \
+    crate://crates.io/platform-info/2.0.4 \
     crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/powerfmt/0.2.0 \
     crate://crates.io/ppv-lite86/0.2.17 \
-    crate://crates.io/pretty_assertions/1.4.0 \
+    crate://crates.io/pretty_assertions/1.4.1 \
     crate://crates.io/prettyplease/0.2.19 \
-    crate://crates.io/proc-macro-crate/3.1.0 \
-    crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/procfs/0.16.0 \
-    crate://crates.io/procfs-core/0.16.0 \
+    crate://crates.io/proc-macro-crate/3.2.0 \
+    crate://crates.io/proc-macro2/1.0.89 \
+    crate://crates.io/procfs/0.17.0 \
+    crate://crates.io/procfs-core/0.17.0 \
+    crate://crates.io/proptest/1.5.0 \
+    crate://crates.io/quick-error/1.2.3 \
     crate://crates.io/quick-error/2.0.1 \
-    crate://crates.io/quickcheck/1.0.3 \
-    crate://crates.io/quote/1.0.36 \
+    crate://crates.io/quote/1.0.37 \
     crate://crates.io/radium/0.7.0 \
     crate://crates.io/rand/0.8.5 \
     crate://crates.io/rand_chacha/0.3.1 \
     crate://crates.io/rand_core/0.6.4 \
     crate://crates.io/rand_pcg/0.3.1 \
+    crate://crates.io/rand_xorshift/0.3.0 \
     crate://crates.io/rayon/1.10.0 \
     crate://crates.io/rayon-core/1.12.1 \
-    crate://crates.io/redox_syscall/0.4.1 \
-    crate://crates.io/redox_syscall/0.5.2 \
+    crate://crates.io/redox_syscall/0.5.7 \
     crate://crates.io/reference-counted-singleton/0.1.2 \
-    crate://crates.io/regex/1.10.5 \
-    crate://crates.io/regex-automata/0.4.4 \
-    crate://crates.io/regex-syntax/0.8.2 \
-    crate://crates.io/relative-path/1.8.0 \
-    crate://crates.io/rlimit/0.10.1 \
+    crate://crates.io/regex/1.11.1 \
+    crate://crates.io/regex-automata/0.4.8 \
+    crate://crates.io/regex-syntax/0.8.5 \
+    crate://crates.io/relative-path/1.9.3 \
+    crate://crates.io/rlimit/0.10.2 \
     crate://crates.io/roff/0.2.1 \
-    crate://crates.io/rstest/0.21.0 \
-    crate://crates.io/rstest_macros/0.21.0 \
-    crate://crates.io/rust-ini/0.21.0 \
+    crate://crates.io/rstest/0.23.0 \
+    crate://crates.io/rstest_macros/0.23.0 \
+    crate://crates.io/rust-ini/0.21.1 \
     crate://crates.io/rustc-hash/1.1.0 \
-    crate://crates.io/rustc_version/0.4.0 \
+    crate://crates.io/rustc_version/0.4.1 \
     crate://crates.io/rustix/0.37.26 \
-    crate://crates.io/rustix/0.38.31 \
+    crate://crates.io/rustix/0.38.37 \
+    crate://crates.io/rusty-fork/0.3.0 \
     crate://crates.io/same-file/1.0.6 \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/self_cell/1.0.4 \
-    crate://crates.io/selinux/0.4.4 \
-    crate://crates.io/selinux-sys/0.6.9 \
+    crate://crates.io/selinux/0.4.6 \
+    crate://crates.io/selinux-sys/0.6.12 \
     crate://crates.io/semver/1.0.14 \
-    crate://crates.io/serde/1.0.203 \
+    crate://crates.io/serde/1.0.214 \
     crate://crates.io/serde-big-array/0.5.1 \
-    crate://crates.io/serde_derive/1.0.203 \
+    crate://crates.io/serde_derive/1.0.214 \
     crate://crates.io/sha1/0.10.6 \
     crate://crates.io/sha2/0.10.8 \
     crate://crates.io/sha3/0.10.8 \
@@ -234,32 +237,37 @@ SRC_URI += " \
     crate://crates.io/socket2/0.5.3 \
     crate://crates.io/strsim/0.10.0 \
     crate://crates.io/syn/1.0.109 \
-    crate://crates.io/syn/2.0.60 \
+    crate://crates.io/syn/2.0.86 \
     crate://crates.io/tap/1.0.1 \
-    crate://crates.io/tempfile/3.10.1 \
+    crate://crates.io/tempfile/3.13.0 \
     crate://crates.io/terminal_size/0.2.6 \
-    crate://crates.io/terminal_size/0.3.0 \
+    crate://crates.io/terminal_size/0.4.0 \
     crate://crates.io/textwrap/0.16.1 \
-    crate://crates.io/thiserror/1.0.61 \
-    crate://crates.io/thiserror-impl/1.0.61 \
+    crate://crates.io/thiserror/1.0.66 \
+    crate://crates.io/thiserror-impl/1.0.66 \
     crate://crates.io/time/0.3.36 \
     crate://crates.io/time-core/0.1.2 \
     crate://crates.io/time-macros/0.2.18 \
     crate://crates.io/tiny-keccak/2.0.2 \
-    crate://crates.io/toml_datetime/0.6.6 \
-    crate://crates.io/toml_edit/0.21.1 \
+    crate://crates.io/toml_datetime/0.6.8 \
+    crate://crates.io/toml_edit/0.22.22 \
     crate://crates.io/trim-in-place/0.1.7 \
     crate://crates.io/typenum/1.15.0 \
-    crate://crates.io/unicode-ident/1.0.5 \
+    crate://crates.io/unarray/0.1.4 \
+    crate://crates.io/unicode-ident/1.0.13 \
     crate://crates.io/unicode-linebreak/0.1.5 \
-    crate://crates.io/unicode-segmentation/1.11.0 \
-    crate://crates.io/unicode-width/0.1.12 \
+    crate://crates.io/unicode-segmentation/1.12.0 \
+    crate://crates.io/unicode-width/0.1.13 \
+    crate://crates.io/unicode-width/0.2.0 \
     crate://crates.io/unicode-xid/0.2.4 \
     crate://crates.io/unindent/0.2.3 \
     crate://crates.io/utf8parse/0.2.1 \
+    crate://crates.io/utmp-classic/0.1.6 \
+    crate://crates.io/utmp-classic-raw/0.1.3 \
     crate://crates.io/uuid/1.7.0 \
     crate://crates.io/uutils_term_grid/0.6.0 \
     crate://crates.io/version_check/0.9.4 \
+    crate://crates.io/wait-timeout/0.2.0 \
     crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
     crate://crates.io/wasm-bindgen/0.2.87 \
@@ -267,54 +275,56 @@ SRC_URI += " \
     crate://crates.io/wasm-bindgen-macro/0.2.87 \
     crate://crates.io/wasm-bindgen-macro-support/0.2.87 \
     crate://crates.io/wasm-bindgen-shared/0.2.87 \
-    crate://crates.io/which/4.3.0 \
+    crate://crates.io/web-time/1.1.0 \
     crate://crates.io/wild/2.2.1 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi-util/0.1.8 \
+    crate://crates.io/winapi-util/0.1.9 \
     crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
     crate://crates.io/windows/0.52.0 \
     crate://crates.io/windows-core/0.52.0 \
     crate://crates.io/windows-sys/0.45.0 \
     crate://crates.io/windows-sys/0.48.0 \
     crate://crates.io/windows-sys/0.52.0 \
+    crate://crates.io/windows-sys/0.59.0 \
     crate://crates.io/windows-targets/0.42.2 \
-    crate://crates.io/windows-targets/0.48.0 \
-    crate://crates.io/windows-targets/0.52.0 \
+    crate://crates.io/windows-targets/0.48.5 \
+    crate://crates.io/windows-targets/0.52.6 \
     crate://crates.io/windows_aarch64_gnullvm/0.42.2 \
-    crate://crates.io/windows_aarch64_gnullvm/0.48.0 \
-    crate://crates.io/windows_aarch64_gnullvm/0.52.0 \
+    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
     crate://crates.io/windows_aarch64_msvc/0.42.2 \
-    crate://crates.io/windows_aarch64_msvc/0.48.0 \
-    crate://crates.io/windows_aarch64_msvc/0.52.0 \
+    crate://crates.io/windows_aarch64_msvc/0.48.5 \
+    crate://crates.io/windows_aarch64_msvc/0.52.6 \
     crate://crates.io/windows_i686_gnu/0.42.2 \
-    crate://crates.io/windows_i686_gnu/0.48.0 \
-    crate://crates.io/windows_i686_gnu/0.52.0 \
+    crate://crates.io/windows_i686_gnu/0.48.5 \
+    crate://crates.io/windows_i686_gnu/0.52.6 \
+    crate://crates.io/windows_i686_gnullvm/0.52.6 \
     crate://crates.io/windows_i686_msvc/0.42.2 \
-    crate://crates.io/windows_i686_msvc/0.48.0 \
-    crate://crates.io/windows_i686_msvc/0.52.0 \
+    crate://crates.io/windows_i686_msvc/0.48.5 \
+    crate://crates.io/windows_i686_msvc/0.52.6 \
     crate://crates.io/windows_x86_64_gnu/0.42.2 \
-    crate://crates.io/windows_x86_64_gnu/0.48.0 \
-    crate://crates.io/windows_x86_64_gnu/0.52.0 \
+    crate://crates.io/windows_x86_64_gnu/0.48.5 \
+    crate://crates.io/windows_x86_64_gnu/0.52.6 \
     crate://crates.io/windows_x86_64_gnullvm/0.42.2 \
-    crate://crates.io/windows_x86_64_gnullvm/0.48.0 \
-    crate://crates.io/windows_x86_64_gnullvm/0.52.0 \
+    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
     crate://crates.io/windows_x86_64_msvc/0.42.2 \
-    crate://crates.io/windows_x86_64_msvc/0.48.0 \
-    crate://crates.io/windows_x86_64_msvc/0.52.0 \
-    crate://crates.io/winnow/0.5.40 \
+    crate://crates.io/windows_x86_64_msvc/0.48.5 \
+    crate://crates.io/windows_x86_64_msvc/0.52.6 \
+    crate://crates.io/winnow/0.6.20 \
     crate://crates.io/wyz/0.5.1 \
     crate://crates.io/xattr/1.3.1 \
-    crate://crates.io/yansi/0.5.1 \
+    crate://crates.io/yansi/1.0.1 \
     crate://crates.io/z85/3.0.5 \
-    crate://crates.io/zerocopy/0.7.33 \
-    crate://crates.io/zerocopy-derive/0.7.33 \
-    crate://crates.io/zip/1.3.0 \
+    crate://crates.io/zerocopy/0.7.34 \
+    crate://crates.io/zerocopy-derive/0.7.34 \
+    crate://crates.io/zip/1.1.4 \
 "
 
 SRC_URI[adler-1.0.2.sha256sum] = "f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe"
 SRC_URI[ahash-0.8.11.sha256sum] = "e89da841a80418a9b391ebaea17f5c112ffaaa96f621d2c285b5174da76b9011"
-SRC_URI[aho-corasick-1.0.4.sha256sum] = "6748e8def348ed4d14996fa801f4122cd763fff530258cdc03f64b25f89d3a5a"
+SRC_URI[aho-corasick-1.1.3.sha256sum] = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
 SRC_URI[allocator-api2-0.2.18.sha256sum] = "5c6cb57a04249c6480766f7f7cef5467412af1490f8d1e243141daddada3264f"
 SRC_URI[android-tzdata-0.1.1.sha256sum] = "e999941b234f3131b00bc13c22d06e8c5ff726d1b6318ac7eb276997bbb4fef0"
 SRC_URI[android_system_properties-0.1.5.sha256sum] = "819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311"
@@ -328,24 +338,26 @@ SRC_URI[arbitrary-1.3.2.sha256sum] = "7d5a26814d8dcb93b0e5a0ff3c6d80a8843bafb21b
 SRC_URI[arrayref-0.3.6.sha256sum] = "a4c527152e37cf757a3f78aae5a06fbeefdb07ccc535c980a3208ee3060dd544"
 SRC_URI[arrayvec-0.7.4.sha256sum] = "96d30a06541fbafbc7f82ed10c06164cfbd2c401138f6addd8404629c4b16711"
 SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
-SRC_URI[bigdecimal-0.4.5.sha256sum] = "51d712318a27c7150326677b321a5fa91b55f6d9034ffd67f20319e147d40cee"
+SRC_URI[bigdecimal-0.4.6.sha256sum] = "8f850665a0385e070b64c38d2354e6c104c8479c59868d1e48a0c13ee2c7a1c1"
 SRC_URI[binary-heap-plus-0.5.0.sha256sum] = "e4551d8382e911ecc0d0f0ffb602777988669be09447d536ff4388d1def11296"
 SRC_URI[bincode-1.3.3.sha256sum] = "b1f45e9417d87227c7a56d22e471c6206462cba514c7590c09aff4cf6d1ddcad"
-SRC_URI[bindgen-0.69.4.sha256sum] = "a00dc851838a2120612785d195287475a3ac45514741da670b735818822129a0"
+SRC_URI[bindgen-0.70.1.sha256sum] = "f49d8fed880d473ea71efb9bf597651e77201bdd4893efe54c9e5d65ae04ce6f"
+SRC_URI[bit-set-0.5.3.sha256sum] = "0700ddab506f33b20a03b13996eccd309a48e5ff77d0d95926aa0210fb4e95f1"
+SRC_URI[bit-vec-0.6.3.sha256sum] = "349f9b6a179ed607305526ca489b34ad0a41aed5f7980fa90eb03160b69598fb"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bitflags-2.5.0.sha256sum] = "cf4b9d6a944f767f8e5e0db018570623c85f3d925ac718db4e06d0187adb21c1"
+SRC_URI[bitflags-2.6.0.sha256sum] = "b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de"
 SRC_URI[bitvec-1.0.1.sha256sum] = "1bc2832c24239b0141d5674bb9174f9d68a8b5b3f2753311927c172ca46f7e9c"
 SRC_URI[blake2b_simd-1.0.2.sha256sum] = "23285ad32269793932e830392f2fe2f83e26488fd3ec778883a93c8323735780"
-SRC_URI[blake3-1.5.1.sha256sum] = "30cca6d3674597c30ddf2c587bf8d9d65c9a84d2326d941cc79c9842dfe0ef52"
+SRC_URI[blake3-1.5.4.sha256sum] = "d82033247fd8e890df8f740e407ad4d038debb9eb1f40533fffb32e7d17dc6f7"
 SRC_URI[block-buffer-0.10.3.sha256sum] = "69cce20737498f97b993470a6e536b8523f0af7892a4f928cceb1ac5e52ebe7e"
-SRC_URI[bstr-1.9.1.sha256sum] = "05efc5cfd9110c8416e471df0e96702d58690178e206e61b7173706673c93706"
+SRC_URI[bstr-1.10.0.sha256sum] = "40723b8fb387abc38f4f4a37c09073622e41dd12327033091ef8950659e6dc0c"
 SRC_URI[bumpalo-3.11.1.sha256sum] = "572f695136211188308f16ad2ca5c851a712c464060ae6974944458eb83880ba"
 SRC_URI[bytecount-0.6.8.sha256sum] = "5ce89b21cab1437276d2650d57e971f9d548a2d9037cc231abdc0562b97498ce"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
-SRC_URI[cc-1.0.79.sha256sum] = "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f"
+SRC_URI[cc-1.1.13.sha256sum] = "72db2f7947ecee9b03b510377e8bb9077afa27176fdbff55c51027e976fdcc48"
 SRC_URI[cexpr-0.6.0.sha256sum] = "6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[cfg_aliases-0.1.1.sha256sum] = "fd16c4719339c4530435d38e511904438d07cce7950afa3718a84ac36c10e89e"
+SRC_URI[cfg_aliases-0.2.1.sha256sum] = "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
 SRC_URI[chrono-0.4.38.sha256sum] = "a21f936df1771bf62b77f047b726c4625ff2e8aa607c01ec06e5a05bd8463401"
 SRC_URI[clang-sys-1.4.0.sha256sum] = "fa2e27ae6ab525c3d369ded447057bca5438d86dc3a68f6faafb8269ba82ebf3"
 SRC_URI[clap-4.4.2.sha256sum] = "6a13b88d2c62ff462f88e4a121f17a82c1af05693a2f192b5c38d14de73c19f6"
@@ -375,7 +387,7 @@ SRC_URI[crossterm-0.27.0.sha256sum] = "f476fe445d41c9e991fd07515a6f463074b782242
 SRC_URI[crossterm_winapi-0.9.1.sha256sum] = "acdd7c62a3665c7f6830a51635d9ac9b23ed385797f70a83bb8bafe9c572ab2b"
 SRC_URI[crunchy-0.2.2.sha256sum] = "7a81dae078cea95a014a339291cec439d2f232ebe854a9d672b796c6afafa9b7"
 SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
-SRC_URI[ctrlc-3.4.4.sha256sum] = "672465ae37dc1bc6380a6547a8883d5dd397b0f1faaad4f265726cc7042a5345"
+SRC_URI[ctrlc-3.4.5.sha256sum] = "90eeab0aa92f3f9b4e87f258c72b139c207d251f9cbc1080a0086b86a8870dd3"
 SRC_URI[data-encoding-2.6.0.sha256sum] = "e8566979429cf69b49a5c740c60791108e86440e8be149bbea4fe54d2c32d6e2"
 SRC_URI[data-encoding-macro-0.1.15.sha256sum] = "f1559b6cba622276d6d63706db152618eeb15b89b3e4041446b05876e352e639"
 SRC_URI[data-encoding-macro-internal-0.1.13.sha256sum] = "332d754c0af53bc87c108fed664d121ecf59207ec4196041f04d6ab9002ad33f"
@@ -386,35 +398,34 @@ SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff424
 SRC_URI[displaydoc-0.2.4.sha256sum] = "487585f4d0c6655fe74905e2504d8ad6908e4db67f744eb140876906c2f3175d"
 SRC_URI[dlv-list-0.5.0.sha256sum] = "d529fd73d344663edfd598ccb3f344e46034db51ebd103518eae34338248ad73"
 SRC_URI[dns-lookup-2.0.4.sha256sum] = "e5766087c2235fec47fafa4cfecc81e494ee679d0fd4a59887ea0919bfb0e4fc"
-SRC_URI[dunce-1.0.4.sha256sum] = "56ce8c6da7551ec6c462cbaf3bfbc75131ebbfa1c944aeaa9dab51ca1c5f0c3b"
+SRC_URI[dunce-1.0.5.sha256sum] = "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
 SRC_URI[either-1.8.0.sha256sum] = "90e5c1c8368803113bf0c9584fc495a58b86dc8a29edbf8fe877d21d9507e797"
 SRC_URI[encode_unicode-0.3.6.sha256sum] = "a357d28ed41a50f9c765dbfe56cbc04a64e53e5fc58ba79fbc34c10ef3df831f"
-SRC_URI[env_logger-0.8.4.sha256sum] = "a19187fea3ac7e84da7dacf48de0c45d63c6a76f9490dae389aead16c243fce3"
 SRC_URI[equivalent-1.0.1.sha256sum] = "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
 SRC_URI[errno-0.3.8.sha256sum] = "a258e46cdc063eb8519c00b9fc845fc47bcfca4130e2f08e88665ceda8474245"
 SRC_URI[exacl-0.12.0.sha256sum] = "22be12de19decddab85d09f251ec8363f060ccb22ec9c81bc157c0c8433946d8"
-SRC_URI[fastrand-2.0.1.sha256sum] = "25cbce373ec4653f1a01a31e8a5e5ec0c622dc27ff9c4e6606eefef5cbbed4a5"
+SRC_URI[fastrand-2.1.1.sha256sum] = "e8c02a5121d4ea3eb16a80748c74f5549a5665e4c21333c6098f283870fbdea6"
 SRC_URI[file_diff-1.0.0.sha256sum] = "31a7a908b8f32538a2143e59a6e4e2508988832d5d4d6f7c156b3cbc762643a5"
 SRC_URI[filedescriptor-0.8.2.sha256sum] = "7199d965852c3bac31f779ef99cbb4537f80e952e2d6aa0ffeb30cce00f4f46e"
-SRC_URI[filetime-0.2.23.sha256sum] = "1ee447700ac8aa0b2f2bd7bc4462ad686ba06baa6727ac149a2d6277f0d240fd"
+SRC_URI[filetime-0.2.25.sha256sum] = "35c0522e981e68cbfa8c3f978441a5f34b30b96e146b33cd3359176b50fe8586"
 SRC_URI[flate2-1.0.28.sha256sum] = "46303f565772937ffe1d394a4fac6f411c6013172fadde9dcdb1e147a086940e"
 SRC_URI[fnv-1.0.7.sha256sum] = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1"
 SRC_URI[fs_extra-1.3.0.sha256sum] = "42703706b716c37f96a77aea830392ad231f44c9e9a67872fa5548707e11b11c"
 SRC_URI[fsevent-sys-4.1.0.sha256sum] = "76ee7a02da4d231650c7cea31349b889be2f45ddb3ef3032d2ec8185f6313fd2"
-SRC_URI[fts-sys-0.2.9.sha256sum] = "4e184d5f593d19793f26afb6f9a58d25f0bc755c4e48890ffcba6db416153ebb"
-SRC_URI[fundu-2.0.0.sha256sum] = "6c04cb831a8dccadfe3774b07cba4574a1ec24974d761510e65d8a543c2d7cb4"
-SRC_URI[fundu-core-0.3.0.sha256sum] = "76a889e633afd839fb5b04fe53adfd588cefe518e71ec8d3c929698c6daf2acd"
+SRC_URI[fts-sys-0.2.11.sha256sum] = "28ab6a6dfd9184fe8a5097924dea6e7648f499121b3e933bb8486a17f817122e"
+SRC_URI[fundu-2.0.1.sha256sum] = "2ce12752fc64f35be3d53e0a57017cd30970f0cffd73f62c791837d8845badbd"
+SRC_URI[fundu-core-0.3.1.sha256sum] = "e463452e2d8b7600d38dcea1ed819773a57f0d710691bfc78db3961bd3f4c3ba"
 SRC_URI[funty-2.0.0.sha256sum] = "e6d5a32815ae3f33302d95fdcb2ce17862f8c65363dcfd29360480ba1001fc9c"
-SRC_URI[futures-0.3.28.sha256sum] = "23342abe12aba583913b2e62f22225ff9c950774065e4bfb61a19cd9770fec40"
-SRC_URI[futures-channel-0.3.28.sha256sum] = "955518d47e09b25bbebc7a18df10b81f0c766eaf4c4f1cccef2fca5f2a4fb5f2"
-SRC_URI[futures-core-0.3.28.sha256sum] = "4bca583b7e26f571124fe5b7561d49cb2868d79116cfa0eefce955557c6fee8c"
-SRC_URI[futures-executor-0.3.28.sha256sum] = "ccecee823288125bd88b4d7f565c9e58e41858e47ab72e8ea2d64e93624386e0"
-SRC_URI[futures-io-0.3.28.sha256sum] = "4fff74096e71ed47f8e023204cfd0aa1289cd54ae5430a9523be060cdb849964"
-SRC_URI[futures-macro-0.3.28.sha256sum] = "89ca545a94061b6365f2c7355b4b32bd20df3ff95f02da9329b34ccc3bd6ee72"
-SRC_URI[futures-sink-0.3.28.sha256sum] = "f43be4fe21a13b9781a69afa4985b0f6ee0e1afab2c6f454a8cf30e2b2237b6e"
-SRC_URI[futures-task-0.3.28.sha256sum] = "76d3d132be6c0e6aa1534069c705a74a5997a356c0dc2f86a47765e5617c5b65"
-SRC_URI[futures-timer-3.0.2.sha256sum] = "e64b03909df88034c26dc1547e8970b91f98bdb65165d6a4e9110d94263dbb2c"
-SRC_URI[futures-util-0.3.28.sha256sum] = "26b01e40b772d54cf6c6d721c1d1abd0647a0106a12ecaa1c186273392a69533"
+SRC_URI[futures-0.3.30.sha256sum] = "645c6916888f6cb6350d2550b80fb63e734897a8498abe35cfb732b6487804b0"
+SRC_URI[futures-channel-0.3.31.sha256sum] = "2dff15bf788c671c1934e366d07e30c1814a8ef514e1af724a602e8a2fbe1b10"
+SRC_URI[futures-core-0.3.31.sha256sum] = "05f29059c0c2090612e8d742178b0580d2dc940c837851ad723096f87af6663e"
+SRC_URI[futures-executor-0.3.30.sha256sum] = "a576fc72ae164fca6b9db127eaa9a9dda0d61316034f33a0a0d4eda41f02b01d"
+SRC_URI[futures-io-0.3.31.sha256sum] = "9e5c1b78ca4aae1ac06c48a526a655760685149f0d465d21f37abfe57ce075c6"
+SRC_URI[futures-macro-0.3.31.sha256sum] = "162ee34ebcb7c64a8abebc059ce0fee27c2262618d7b60ed8faf72fef13c3650"
+SRC_URI[futures-sink-0.3.31.sha256sum] = "e575fab7d1e0dcb8d0c7bcf9a63ee213816ab51902e6d244a95819acacf1d4f7"
+SRC_URI[futures-task-0.3.31.sha256sum] = "f90f7dce0722e95104fcb095585910c0977252f286e354b5e3bd38902cd99988"
+SRC_URI[futures-timer-3.0.3.sha256sum] = "f288b0a4f20f9a56b5d1da57e2227c661b7b16168e2f72365f57b63326e29b24"
+SRC_URI[futures-util-0.3.31.sha256sum] = "9fa08315bb612088cc391249efdc3bc77536f16c91f6cf495e6fbe85b20a4a81"
 SRC_URI[gcd-2.3.0.sha256sum] = "1d758ba1b47b00caf47f24925c0074ecb20d6dfcffe7f6d53395c0465674841a"
 SRC_URI[generic-array-0.14.6.sha256sum] = "bff49e947297f3312447abdca79f45f4738097cc82b06e72054d2223f601f1b9"
 SRC_URI[getrandom-0.2.9.sha256sum] = "c85e1d9ab2eadba7e5040d4e09cbd6d072b76a557ad64e797c2cb9d4da21d7e4"
@@ -427,13 +438,11 @@ SRC_URI[hex-literal-0.4.1.sha256sum] = "6fe2267d4ed49bc07b63801559be28c718ea06c4
 SRC_URI[hostname-0.4.0.sha256sum] = "f9c7c7c8ac16c798734b8a24560c1362120597c40d5e1459f09498f8f6c8f2ba"
 SRC_URI[iana-time-zone-0.1.53.sha256sum] = "64c122667b287044802d6ce17ee2ddf13207ed924c712de9a66a5814d5b64765"
 SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] = "f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f"
-SRC_URI[indexmap-2.2.6.sha256sum] = "168fb715dda47215e360912c096649d23d58bf392ac62f73919e831745e40f26"
-SRC_URI[indicatif-0.17.8.sha256sum] = "763a5a8f45087d6bcea4222e7b72c291a054edf80e4ef6efd2a4979878c7bea3"
+SRC_URI[indexmap-2.5.0.sha256sum] = "68b900aa2f7301e21c36462b170ee99994de34dff39a4a6a528e80e7376d07e5"
+SRC_URI[indicatif-0.17.9.sha256sum] = "cbf675b85ed934d3c67b5c5469701eec7db22689d0a2139d856e0925fa28b281"
 SRC_URI[inotify-0.9.6.sha256sum] = "f8069d3ec154eb856955c1c0fbffefbf5f3c40a104ec912d4797314c1801abff"
 SRC_URI[inotify-sys-0.1.5.sha256sum] = "e05c02b5e89bff3b946cedeca278abc628fe811e604f027c45a8aa3cf793d0eb"
-SRC_URI[instant-0.1.12.sha256sum] = "7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c"
 SRC_URI[io-lifetimes-1.0.11.sha256sum] = "eae7b9aee968036d54dce06cebaefd919e4472e753296daccd6d344e3e2df0c2"
-SRC_URI[itertools-0.12.1.sha256sum] = "ba291022dbbd398a455acf126c1e341954079855bc60dfdda641363bd6922569"
 SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
 SRC_URI[itoa-1.0.4.sha256sum] = "4217ad341ebadf8d8e724e264f13e593e0648f5b3e94b3896a5df283be015ecc"
 SRC_URI[js-sys-0.3.64.sha256sum] = "c5f195fe497f702db0f318b07fdd68edb16955aed830df8363d837542f8f935a"
@@ -441,41 +450,43 @@ SRC_URI[keccak-0.1.4.sha256sum] = "8f6d5ed8676d904364de097082f4e7d240b571b67989c
 SRC_URI[kqueue-1.0.7.sha256sum] = "2c8fc60ba15bf51257aa9807a48a61013db043fcf3a78cb0d916e8e396dcad98"
 SRC_URI[kqueue-sys-1.0.3.sha256sum] = "8367585489f01bc55dd27404dcf56b95e6da061a256a666ab23be9ba96a2e587"
 SRC_URI[lazy_static-1.4.0.sha256sum] = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
-SRC_URI[lazycell-1.3.0.sha256sum] = "830d08ce1d1d941e6b30645f1a0eb5643013d835ce3779a5fc208261dbe10f55"
-SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
+SRC_URI[libc-0.2.161.sha256sum] = "8e9489c2807c139ffd9c1794f4af0ebe86a828db53ecdc7fea2111d0fed085d1"
 SRC_URI[libloading-0.7.4.sha256sum] = "b67380fd3b2fbe7527a606e18729d21c6f3951633d0500574c4dc22d2d638b9f"
 SRC_URI[libm-0.2.7.sha256sum] = "f7012b1bbb0719e1097c47611d3898568c546d597c2e74d66f6087edd5233ff4"
+SRC_URI[libredox-0.1.3.sha256sum] = "c0ff37bd590ca25063e35af745c343cb7a0271906fb7b37e4813e8f79f00268d"
 SRC_URI[linux-raw-sys-0.3.8.sha256sum] = "ef53942eb7bf7ff43a617b3e2c1c4a5ecf5944a7c1bc12d7ee39bbb15e5c1519"
-SRC_URI[linux-raw-sys-0.4.12.sha256sum] = "c4cd1a83af159aa67994778be9070f0ae1bd732942279cabb14f86f986a21456"
+SRC_URI[linux-raw-sys-0.4.14.sha256sum] = "78b3ae25bc7c8c38cec158d1f2757ee79e9b3740fbc7ccf0e59e4b08d793fa89"
 SRC_URI[lock_api-0.4.9.sha256sum] = "435011366fe56583b16cf956f9df0095b405b82d76425bc8981c0e22e60ec4df"
 SRC_URI[log-0.4.20.sha256sum] = "b5e6163cb8c49088c2c36f57875e58ccd8c87c7427f7fbd50ea6710b2f3f2e8f"
 SRC_URI[lru-0.12.3.sha256sum] = "d3262e75e648fce39813cb56ac41f3c3e3f65217ebf3844d818d1f9398cfb0dc"
-SRC_URI[lscolors-0.16.0.sha256sum] = "ab0b209ec3976527806024406fe765474b9a1750a0ed4b8f0372364741f50e7b"
+SRC_URI[lscolors-0.20.0.sha256sum] = "61183da5de8ba09a58e330d55e5ea796539d8443bd00fdeb863eac39724aa4ab"
 SRC_URI[md-5-0.10.6.sha256sum] = "d89e7ee0cfbedfc4da3340218492196241d89eefb6dab27de5df917a6d2e78cf"
 SRC_URI[memchr-2.7.4.sha256sum] = "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
-SRC_URI[memmap2-0.9.4.sha256sum] = "fe751422e4a8caa417e13c3ea66452215d7d63e19e604f4980461212f3ae1322"
+SRC_URI[memmap2-0.9.5.sha256sum] = "fd3f7eed9d3848f8b98834af67102b720745c4ec028fcd0aa0239277e7de374f"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
 SRC_URI[miniz_oxide-0.7.2.sha256sum] = "9d811f3e15f28568be3407c8e7fdb6514c1cda3cb30683f15b6a1a1dc4ea14a7"
 SRC_URI[mio-0.8.11.sha256sum] = "a4a650543ca06a924e8b371db273b2756685faae30f8487da1b56505a8f78b0c"
-SRC_URI[nix-0.28.0.sha256sum] = "ab2156c4fce2f8df6c499cc1c763e4394b7482525bf2a9701c9d79d215f519e4"
+SRC_URI[nix-0.29.0.sha256sum] = "71e2746dc3a24dd78b3cfcb7be93368c6de9963d30f43a6a73998a9cf4b17b46"
 SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
 SRC_URI[notify-6.0.1.sha256sum] = "5738a2795d57ea20abec2d6d76c6081186709c0024187cd5977265eda6598b51"
-SRC_URI[nu-ansi-term-0.49.0.sha256sum] = "c073d3c1930d0751774acf49e66653acecb416c3a54c6ec095a9b11caddb5a68"
-SRC_URI[num-bigint-0.4.5.sha256sum] = "c165a9ab64cf766f73521c0dd2cfdff64f488b8f0b3e621face3462d3db536d7"
+SRC_URI[nu-ansi-term-0.50.0.sha256sum] = "dd2800e1520bdc966782168a627aa5d1ad92e33b984bf7c7615d31280c83ff14"
+SRC_URI[num-bigint-0.4.6.sha256sum] = "a5e44f723f1133c9deac646763579fdb3ac745e418f2a7af9cd0c431da1f20b9"
 SRC_URI[num-conv-0.1.0.sha256sum] = "51d515d32fb182ee37cda2ccdcb92950d6a3c2893aa280e540671c2cd0f3b1d9"
 SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
 SRC_URI[num-modular-0.5.1.sha256sum] = "64a5fe11d4135c3bcdf3a95b18b194afa9608a5f6ff034f5d857bc9a27fb0119"
 SRC_URI[num-prime-0.4.4.sha256sum] = "e238432a7881ec7164503ccc516c014bf009be7984cde1ba56837862543bdec3"
 SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
+SRC_URI[num_enum-0.7.3.sha256sum] = "4e613fc340b2220f734a8595782c551f1250e969d87d3be1ae0579e8d4065179"
+SRC_URI[num_enum_derive-0.7.3.sha256sum] = "af1844ef2428cc3e1cb900be36181049ef3d3193c63e43026cfe202983b27a56"
 SRC_URI[num_threads-0.1.6.sha256sum] = "2819ce041d2ee131036f4fc9d6ae7ae125a3a40e97ba64d04fe799ad9dabbb44"
 SRC_URI[number_prefix-0.4.0.sha256sum] = "830b246a0e5f20af87141b25c173cd1b609bd7779a4617d6ec582abaf90870f3"
-SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
+SRC_URI[once_cell-1.20.2.sha256sum] = "1261fe7e33c73b354eab43b1273a57c8f967d0391e80353e51f764ac02cf6775"
 SRC_URI[onig-6.4.0.sha256sum] = "8c4b31c8722ad9171c6d77d3557db078cab2bd50afcc9d09c8b315c59df8ca4f"
 SRC_URI[onig_sys-69.8.1.sha256sum] = "7b829e3d7e9cc74c7e315ee8edb185bf4190da5acde74afd7fc59c35b1f086e7"
 SRC_URI[ordered-multimap-0.7.3.sha256sum] = "49203cdcae0030493bad186b28da2fa25645fa276a51b6fec8010d281e02ef79"
 SRC_URI[os_display-0.1.3.sha256sum] = "7a6229bad892b46b0dcfaaeb18ad0d2e56400f5aaea05b768bde96e73676cf75"
 SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
-SRC_URI[parking_lot_core-0.9.9.sha256sum] = "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
+SRC_URI[parking_lot_core-0.9.10.sha256sum] = "1e401f977ab385c9e4e3ab30627d6f26d00e2c73eef317493c4ec6d468726cf8"
 SRC_URI[parse_datetime-0.6.0.sha256sum] = "a8720474e3dd4af20cea8716703498b9f3b690f318fa9d9d9e2e38eaf44b96d0"
 SRC_URI[phf-0.11.2.sha256sum] = "ade2d8b8f33c7333b51bcf0428d37e217e9f32192ae4772156f65063b8ce03dc"
 SRC_URI[phf_codegen-0.11.2.sha256sum] = "e8d39688d359e6b34654d328e262234662d16cc0f60ec8dcbe5e718709342a5a"
@@ -484,51 +495,53 @@ SRC_URI[phf_shared-0.11.2.sha256sum] = "90fcb95eef784c2ac79119d1dd819e162b5da872
 SRC_URI[pin-project-lite-0.2.9.sha256sum] = "e0a7ae3ac2f1173085d398531c705756c94a4c56843785df85a60c1a0afac116"
 SRC_URI[pin-utils-0.1.0.sha256sum] = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
 SRC_URI[pkg-config-0.3.26.sha256sum] = "6ac9a59f73473f1b8d852421e59e64809f025994837ef743615c6d0c5b305160"
-SRC_URI[platform-info-2.0.3.sha256sum] = "d5ff316b9c4642feda973c18f0decd6c8b0919d4722566f6e4337cce0dd88217"
+SRC_URI[platform-info-2.0.4.sha256sum] = "91077ffd05d058d70d79eefcd7d7f6aac34980860a7519960f7913b6563a8c3a"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[powerfmt-0.2.0.sha256sum] = "439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391"
 SRC_URI[ppv-lite86-0.2.17.sha256sum] = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
-SRC_URI[pretty_assertions-1.4.0.sha256sum] = "af7cee1a6c8a5b9208b3cb1061f10c0cb689087b3d8ce85fb9d2dd7a29b6ba66"
+SRC_URI[pretty_assertions-1.4.1.sha256sum] = "3ae130e2f271fbc2ac3a40fb1d07180839cdbbe443c7a27e1e3c13c5cac0116d"
 SRC_URI[prettyplease-0.2.19.sha256sum] = "5ac2cf0f2e4f42b49f5ffd07dae8d746508ef7526c13940e5f524012ae6c6550"
-SRC_URI[proc-macro-crate-3.1.0.sha256sum] = "6d37c51ca738a55da99dc0c4a34860fd675453b8b36209178c2249bb13651284"
-SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[procfs-0.16.0.sha256sum] = "731e0d9356b0c25f16f33b5be79b1c57b562f141ebfcdb0ad8ac2c13a24293b4"
-SRC_URI[procfs-core-0.16.0.sha256sum] = "2d3554923a69f4ce04c4a754260c338f505ce22642d3830e049a399fc2059a29"
+SRC_URI[proc-macro-crate-3.2.0.sha256sum] = "8ecf48c7ca261d60b74ab1a7b20da18bede46776b2e55535cb958eb595c5fa7b"
+SRC_URI[proc-macro2-1.0.89.sha256sum] = "f139b0662de085916d1fb67d2b4169d1addddda1919e696f3252b740b629986e"
+SRC_URI[procfs-0.17.0.sha256sum] = "cc5b72d8145275d844d4b5f6d4e1eef00c8cd889edb6035c21675d1bb1f45c9f"
+SRC_URI[procfs-core-0.17.0.sha256sum] = "239df02d8349b06fc07398a3a1697b06418223b1c7725085e801e7c0fc6a12ec"
+SRC_URI[proptest-1.5.0.sha256sum] = "b4c2511913b88df1637da85cc8d96ec8e43a3f8bb8ccb71ee1ac240d6f3df58d"
+SRC_URI[quick-error-1.2.3.sha256sum] = "a1d01941d82fa2ab50be1e79e6714289dd7cde78eba4c074bc5a4374f650dfe0"
 SRC_URI[quick-error-2.0.1.sha256sum] = "a993555f31e5a609f617c12db6250dedcac1b0a85076912c436e6fc9b2c8e6a3"
-SRC_URI[quickcheck-1.0.3.sha256sum] = "588f6378e4dd99458b60ec275b4477add41ce4fa9f64dcba6f15adccb19b50d6"
-SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
+SRC_URI[quote-1.0.37.sha256sum] = "b5b9d34b8991d19d98081b46eacdd8eb58c6f2b201139f7c5f643cc155a633af"
 SRC_URI[radium-0.7.0.sha256sum] = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
 SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
 SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
 SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
 SRC_URI[rand_pcg-0.3.1.sha256sum] = "59cad018caf63deb318e5a4586d99a24424a364f40f1e5778c29aca23f4fc73e"
+SRC_URI[rand_xorshift-0.3.0.sha256sum] = "d25bf25ec5ae4a3f1b92f929810509a2f53d7dca2f50b794ff57e3face536c8f"
 SRC_URI[rayon-1.10.0.sha256sum] = "b418a60154510ca1a002a752ca9714984e21e4241e804d32555251faf8b78ffa"
 SRC_URI[rayon-core-1.12.1.sha256sum] = "1465873a3dfdaa8ae7cb14b4383657caab0b3e8a0aa9ae8e04b044854c8dfce2"
-SRC_URI[redox_syscall-0.4.1.sha256sum] = "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
-SRC_URI[redox_syscall-0.5.2.sha256sum] = "c82cf8cff14456045f55ec4241383baeff27af886adb72ffb2162f99911de0fd"
+SRC_URI[redox_syscall-0.5.7.sha256sum] = "9b6dfecf2c74bce2466cabf93f6664d6998a69eb21e39f4207930065b27b771f"
 SRC_URI[reference-counted-singleton-0.1.2.sha256sum] = "f1bfbf25d7eb88ddcbb1ec3d755d0634da8f7657b2cb8b74089121409ab8228f"
-SRC_URI[regex-1.10.5.sha256sum] = "b91213439dad192326a0d7c6ee3955910425f441d7038e0d6933b0aec5c4517f"
-SRC_URI[regex-automata-0.4.4.sha256sum] = "3b7fa1134405e2ec9353fd416b17f8dacd46c473d7d3fd1cf202706a14eb792a"
-SRC_URI[regex-syntax-0.8.2.sha256sum] = "c08c74e62047bb2de4ff487b251e4a92e24f48745648451635cec7d591162d9f"
-SRC_URI[relative-path-1.8.0.sha256sum] = "4bf2521270932c3c7bed1a59151222bd7643c79310f2916f01925e1e16255698"
-SRC_URI[rlimit-0.10.1.sha256sum] = "3560f70f30a0f16d11d01ed078a07740fe6b489667abc7c7b029155d9f21c3d8"
+SRC_URI[regex-1.11.1.sha256sum] = "b544ef1b4eac5dc2db33ea63606ae9ffcfac26c1416a2806ae0bf5f56b201191"
+SRC_URI[regex-automata-0.4.8.sha256sum] = "368758f23274712b504848e9d5a6f010445cc8b87a7cdb4d7cbee666c1288da3"
+SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
+SRC_URI[relative-path-1.9.3.sha256sum] = "ba39f3699c378cd8970968dcbff9c43159ea4cfbd88d43c00b22f2ef10a435d2"
+SRC_URI[rlimit-0.10.2.sha256sum] = "7043b63bd0cd1aaa628e476b80e6d4023a3b50eb32789f2728908107bd0c793a"
 SRC_URI[roff-0.2.1.sha256sum] = "b833d8d034ea094b1ea68aa6d5c740e0d04bad9d16568d08ba6f76823a114316"
-SRC_URI[rstest-0.21.0.sha256sum] = "9afd55a67069d6e434a95161415f5beeada95a01c7b815508a82dcb0e1593682"
-SRC_URI[rstest_macros-0.21.0.sha256sum] = "4165dfae59a39dd41d8dec720d3cbfbc71f69744efb480a3920f5d4e0cc6798d"
-SRC_URI[rust-ini-0.21.0.sha256sum] = "0d625ed57d8f49af6cfa514c42e1a71fadcff60eb0b1c517ff82fe41aa025b41"
+SRC_URI[rstest-0.23.0.sha256sum] = "0a2c585be59b6b5dd66a9d2084aa1d8bd52fbdb806eafdeffb52791147862035"
+SRC_URI[rstest_macros-0.23.0.sha256sum] = "825ea780781b15345a146be27eaefb05085e337e869bff01b4306a4fd4a9ad5a"
+SRC_URI[rust-ini-0.21.1.sha256sum] = "4e310ef0e1b6eeb79169a1171daf9abcb87a2e17c03bee2c4bb100b55c75409f"
 SRC_URI[rustc-hash-1.1.0.sha256sum] = "08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2"
-SRC_URI[rustc_version-0.4.0.sha256sum] = "bfa0f585226d2e68097d4f95d113b15b83a82e819ab25717ec0590d9584ef366"
+SRC_URI[rustc_version-0.4.1.sha256sum] = "cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92"
 SRC_URI[rustix-0.37.26.sha256sum] = "84f3f8f960ed3b5a59055428714943298bf3fa2d4a1d53135084e0544829d995"
-SRC_URI[rustix-0.38.31.sha256sum] = "6ea3e1a662af26cd7a3ba09c0297a31af215563ecf42817c98df621387f4e949"
+SRC_URI[rustix-0.38.37.sha256sum] = "8acb788b847c24f28525660c4d7758620a7210875711f79e7f663cc152726811"
+SRC_URI[rusty-fork-0.3.0.sha256sum] = "cb3dcc6e454c328bb824492db107ab7c0ae8fcffe4ad210136ef014458c1bc4f"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[self_cell-1.0.4.sha256sum] = "d369a96f978623eb3dc28807c4852d6cc617fed53da5d3c400feff1ef34a714a"
-SRC_URI[selinux-0.4.4.sha256sum] = "53371b1e9bbbfffd65e5ac3c895c786ec35b7695bdc4a67a8b08c29c8d057e0b"
-SRC_URI[selinux-sys-0.6.9.sha256sum] = "89d45498373dc17ec8ebb72e1fd320c015647b0157fc81dddf678e2e00205fec"
+SRC_URI[selinux-0.4.6.sha256sum] = "0139b2436c81305eb6bda33af151851f75bd62783817b25f44daa371119c30b5"
+SRC_URI[selinux-sys-0.6.12.sha256sum] = "8d557667087c5b4791e180b80979cd1a92fdb9bfd92cfd4b9ab199c4d7402423"
 SRC_URI[semver-1.0.14.sha256sum] = "e25dfac463d778e353db5be2449d1cce89bd6fd23c9f1ea21310ce6e5a1b29c4"
-SRC_URI[serde-1.0.203.sha256sum] = "7253ab4de971e72fb7be983802300c30b5a7f0c2e56fab8abfc6a214307c0094"
+SRC_URI[serde-1.0.214.sha256sum] = "f55c3193aca71c12ad7890f1785d2b73e1b9f63a0bbc353c08ef26fe03fc56b5"
 SRC_URI[serde-big-array-0.5.1.sha256sum] = "11fc7cc2c76d73e0f27ee52abbd64eec84d46f370c88371120433196934e4b7f"
-SRC_URI[serde_derive-1.0.203.sha256sum] = "500cbc0ebeb6f46627f50f3f5811ccf6bf00643be300b4c3eabc0ef55dc5b5ba"
+SRC_URI[serde_derive-1.0.214.sha256sum] = "de523f781f095e28fa605cdce0f8307e451cc0fd14e2eb4cd2e98a355b147766"
 SRC_URI[sha1-0.10.6.sha256sum] = "e3bf829a2d51ab4a5ddf1352d8470c140cadc8301b2ae1789db023f01cedd6ba"
 SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
 SRC_URI[sha3-0.10.8.sha256sum] = "75872d278a8f37ef87fa0ddbda7802605cb18344497949862c0d4dcb291eba60"
@@ -544,32 +557,37 @@ SRC_URI[smawk-0.3.1.sha256sum] = "f67ad224767faa3c7d8b6d91985b78e70a1324408abcb1
 SRC_URI[socket2-0.5.3.sha256sum] = "2538b18701741680e0322a2302176d3253a35388e2e62f172f64f4f16605f877"
 SRC_URI[strsim-0.10.0.sha256sum] = "73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623"
 SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
-SRC_URI[syn-2.0.60.sha256sum] = "909518bc7b1c9b779f1bbf07f2929d35af9f0f37e47c6e9ef7f9dddc1e1821f3"
+SRC_URI[syn-2.0.86.sha256sum] = "e89275301d38033efb81a6e60e3497e734dfcc62571f2854bf4b16690398824c"
 SRC_URI[tap-1.0.1.sha256sum] = "55937e1799185b12863d447f42597ed69d9928686b8d88a1df17376a097d8369"
-SRC_URI[tempfile-3.10.1.sha256sum] = "85b77fafb263dd9d05cbeac119526425676db3784113aa9295c88498cbf8bff1"
+SRC_URI[tempfile-3.13.0.sha256sum] = "f0f2c9fc62d0beef6951ccffd757e241266a2c833136efbe35af6cd2567dca5b"
 SRC_URI[terminal_size-0.2.6.sha256sum] = "8e6bf6f19e9f8ed8d4048dc22981458ebcf406d67e94cd422e5ecd73d63b3237"
-SRC_URI[terminal_size-0.3.0.sha256sum] = "21bebf2b7c9e0a515f6e0f8c51dc0f8e4696391e6f1ff30379559f8365fb0df7"
+SRC_URI[terminal_size-0.4.0.sha256sum] = "4f599bd7ca042cfdf8f4512b277c02ba102247820f9d9d4a9f521f496751a6ef"
 SRC_URI[textwrap-0.16.1.sha256sum] = "23d434d3f8967a09480fb04132ebe0a3e088c173e6d0ee7897abbdf4eab0f8b9"
-SRC_URI[thiserror-1.0.61.sha256sum] = "c546c80d6be4bc6a00c0f01730c08df82eaa7a7a61f11d656526506112cc1709"
-SRC_URI[thiserror-impl-1.0.61.sha256sum] = "46c3384250002a6d5af4d114f2845d37b57521033f30d5c3f46c4d70e1197533"
+SRC_URI[thiserror-1.0.66.sha256sum] = "5d171f59dbaa811dbbb1aee1e73db92ec2b122911a48e1390dfe327a821ddede"
+SRC_URI[thiserror-impl-1.0.66.sha256sum] = "b08be0f17bd307950653ce45db00cd31200d82b624b36e181337d9c7d92765b5"
 SRC_URI[time-0.3.36.sha256sum] = "5dfd88e563464686c916c7e46e623e520ddc6d79fa6641390f2e3fa86e83e885"
 SRC_URI[time-core-0.1.2.sha256sum] = "ef927ca75afb808a4d64dd374f00a2adf8d0fcff8e7b184af886c3c87ec4a3f3"
 SRC_URI[time-macros-0.2.18.sha256sum] = "3f252a68540fde3a3877aeea552b832b40ab9a69e318efd078774a01ddee1ccf"
 SRC_URI[tiny-keccak-2.0.2.sha256sum] = "2c9d3793400a45f954c52e73d068316d76b6f4e36977e3fcebb13a2721e80237"
-SRC_URI[toml_datetime-0.6.6.sha256sum] = "4badfd56924ae69bcc9039335b2e017639ce3f9b001c393c1b2d1ef846ce2cbf"
-SRC_URI[toml_edit-0.21.1.sha256sum] = "6a8534fd7f78b5405e860340ad6575217ce99f38d4d5c8f2442cb5ecb50090e1"
+SRC_URI[toml_datetime-0.6.8.sha256sum] = "0dd7358ecb8fc2f8d014bf86f6f638ce72ba252a2c3a2572f2a795f1d23efb41"
+SRC_URI[toml_edit-0.22.22.sha256sum] = "4ae48d6208a266e853d946088ed816055e556cc6028c5e8e2b84d9fa5dd7c7f5"
 SRC_URI[trim-in-place-0.1.7.sha256sum] = "343e926fc669bc8cde4fa3129ab681c63671bae288b1f1081ceee6d9d37904fc"
 SRC_URI[typenum-1.15.0.sha256sum] = "dcf81ac59edc17cc8697ff311e8f5ef2d99fcbd9817b34cec66f90b6c3dfd987"
-SRC_URI[unicode-ident-1.0.5.sha256sum] = "6ceab39d59e4c9499d4e5a8ee0e2735b891bb7308ac83dfb4e80cad195c9f6f3"
+SRC_URI[unarray-0.1.4.sha256sum] = "eaea85b334db583fe3274d12b4cd1880032beab409c0d774be044d4480ab9a94"
+SRC_URI[unicode-ident-1.0.13.sha256sum] = "e91b56cd4cadaeb79bbf1a5645f6b4f8dc5bde8834ad5894a8db35fda9efa1fe"
 SRC_URI[unicode-linebreak-0.1.5.sha256sum] = "3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f"
-SRC_URI[unicode-segmentation-1.11.0.sha256sum] = "d4c87d22b6e3f4a18d4d40ef354e97c90fcb14dd91d7dc0aa9d8a1172ebf7202"
-SRC_URI[unicode-width-0.1.12.sha256sum] = "68f5e5f3158ecfd4b8ff6fe086db7c8467a2dfdac97fe420f2b7c4aa97af66d6"
+SRC_URI[unicode-segmentation-1.12.0.sha256sum] = "f6ccf251212114b54433ec949fd6a7841275f9ada20dddd2f29e9ceea4501493"
+SRC_URI[unicode-width-0.1.13.sha256sum] = "0336d538f7abc86d282a4189614dfaa90810dfc2c6f6427eaf88e16311dd225d"
+SRC_URI[unicode-width-0.2.0.sha256sum] = "1fc81956842c57dac11422a97c3b8195a1ff727f06e85c84ed2e8aa277c9a0fd"
 SRC_URI[unicode-xid-0.2.4.sha256sum] = "f962df74c8c05a667b5ee8bcf162993134c104e96440b663c8daa176dc772d8c"
 SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
 SRC_URI[utf8parse-0.2.1.sha256sum] = "711b9620af191e0cdc7468a8d14e709c3dcdb115b36f838e601583af800a370a"
+SRC_URI[utmp-classic-0.1.6.sha256sum] = "e24c654e19afaa6b8f3877ece5d3bed849c2719c56f6752b18ca7da4fcc6e85a"
+SRC_URI[utmp-classic-raw-0.1.3.sha256sum] = "22c226537a3d6e01c440c1926ca0256dbee2d19b2229ede6fc4863a6493dd831"
 SRC_URI[uuid-1.7.0.sha256sum] = "f00cc9702ca12d3c81455259621e676d0f7251cec66a21e98fe2e9a37db93b2a"
 SRC_URI[uutils_term_grid-0.6.0.sha256sum] = "f89defb4adb4ba5703a57abc879f96ddd6263a444cacc446db90bf2617f141fb"
 SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
+SRC_URI[wait-timeout-0.2.0.sha256sum] = "9f200f5b12eb75f8c1ed65abd4b2db8a6e1b138a20de009dacee265a2498f3f6"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
 SRC_URI[wasm-bindgen-0.2.87.sha256sum] = "7706a72ab36d8cb1f80ffbf0e071533974a60d0a308d01a5d0375bf60499a342"
@@ -577,46 +595,308 @@ SRC_URI[wasm-bindgen-backend-0.2.87.sha256sum] = "5ef2b6d3c510e9625e5fe6f509ab07
 SRC_URI[wasm-bindgen-macro-0.2.87.sha256sum] = "dee495e55982a3bd48105a7b947fd2a9b4a8ae3010041b9e0faab3f9cd028f1d"
 SRC_URI[wasm-bindgen-macro-support-0.2.87.sha256sum] = "54681b18a46765f095758388f2d0cf16eb8d4169b639ab575a8f5693af210c7b"
 SRC_URI[wasm-bindgen-shared-0.2.87.sha256sum] = "ca6ad05a4870b2bf5fe995117d3728437bd27d7cd5f06f13c17443ef369775a1"
-SRC_URI[which-4.3.0.sha256sum] = "1c831fbbee9e129a8cf93e7747a82da9d95ba8e16621cae60ec2cdc849bacb7b"
+SRC_URI[web-time-1.1.0.sha256sum] = "5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb"
 SRC_URI[wild-2.2.1.sha256sum] = "a3131afc8c575281e1e80f36ed6a092aa502c08b18ed7524e86fbbb12bb410e1"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
-SRC_URI[winapi-util-0.1.8.sha256sum] = "4d4cc384e1e73b93bafa6fb4f1df8c41695c8a91cf9c4c64358067d15a7b6c6b"
+SRC_URI[winapi-util-0.1.9.sha256sum] = "cf221c93e13a30d793f7645a0e7762c55d169dbb0a49671918a2319d289b10bb"
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
 SRC_URI[windows-0.52.0.sha256sum] = "e48a53791691ab099e5e2ad123536d0fff50652600abaf43bbf952894110d0be"
 SRC_URI[windows-core-0.52.0.sha256sum] = "33ab640c8d7e35bf8ba19b884ba838ceb4fba93a4e8c65a9059d08afcfc683d9"
 SRC_URI[windows-sys-0.45.0.sha256sum] = "75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0"
 SRC_URI[windows-sys-0.48.0.sha256sum] = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
 SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
+SRC_URI[windows-sys-0.59.0.sha256sum] = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
 SRC_URI[windows-targets-0.42.2.sha256sum] = "8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071"
-SRC_URI[windows-targets-0.48.0.sha256sum] = "7b1eb6f0cd7c80c79759c929114ef071b87354ce476d9d94271031c0497adfd5"
-SRC_URI[windows-targets-0.52.0.sha256sum] = "8a18201040b24831fbb9e4eb208f8892e1f50a37feb53cc7ff887feb8f50e7cd"
+SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
+SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
 SRC_URI[windows_aarch64_gnullvm-0.42.2.sha256sum] = "597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8"
-SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] = "91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc"
-SRC_URI[windows_aarch64_gnullvm-0.52.0.sha256sum] = "cb7764e35d4db8a7921e09562a0304bf2f93e0a51bfccee0bd0bb0b666b015ea"
+SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
+SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
 SRC_URI[windows_aarch64_msvc-0.42.2.sha256sum] = "e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43"
-SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] = "b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"
-SRC_URI[windows_aarch64_msvc-0.52.0.sha256sum] = "bbaa0368d4f1d2aaefc55b6fcfee13f41544ddf36801e793edbbfd7d7df075ef"
+SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
+SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
 SRC_URI[windows_i686_gnu-0.42.2.sha256sum] = "c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f"
-SRC_URI[windows_i686_gnu-0.48.0.sha256sum] = "622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241"
-SRC_URI[windows_i686_gnu-0.52.0.sha256sum] = "a28637cb1fa3560a16915793afb20081aba2c92ee8af57b4d5f28e4b3e7df313"
+SRC_URI[windows_i686_gnu-0.48.5.sha256sum] = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
+SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
+SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
 SRC_URI[windows_i686_msvc-0.42.2.sha256sum] = "44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060"
-SRC_URI[windows_i686_msvc-0.48.0.sha256sum] = "4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"
-SRC_URI[windows_i686_msvc-0.52.0.sha256sum] = "ffe5e8e31046ce6230cc7215707b816e339ff4d4d67c65dffa206fd0f7aa7b9a"
+SRC_URI[windows_i686_msvc-0.48.5.sha256sum] = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
+SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
 SRC_URI[windows_x86_64_gnu-0.42.2.sha256sum] = "8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36"
-SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] = "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1"
-SRC_URI[windows_x86_64_gnu-0.52.0.sha256sum] = "3d6fa32db2bc4a2f5abeacf2b69f7992cd09dca97498da74a151a3132c26befd"
+SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
+SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
 SRC_URI[windows_x86_64_gnullvm-0.42.2.sha256sum] = "26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3"
-SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] = "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
-SRC_URI[windows_x86_64_gnullvm-0.52.0.sha256sum] = "1a657e1e9d3f514745a572a6846d3c7aa7dbe1658c056ed9c3344c4109a6949e"
+SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
+SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
 SRC_URI[windows_x86_64_msvc-0.42.2.sha256sum] = "9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0"
-SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] = "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"
-SRC_URI[windows_x86_64_msvc-0.52.0.sha256sum] = "dff9641d1cd4be8d1a070daf9e3773c5f67e78b4d9d42263020c057706765c04"
-SRC_URI[winnow-0.5.40.sha256sum] = "f593a95398737aeed53e489c785df13f3618e41dbcd6718c6addbf1395aa6876"
+SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
+SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
+SRC_URI[winnow-0.6.20.sha256sum] = "36c1fec1a2bb5866f07c25f68c26e565c4c200aebb96d7e55710c19d3e8ac49b"
 SRC_URI[wyz-0.5.1.sha256sum] = "05f360fc0b24296329c78fda852a1e9ae82de9cf7b27dae4b7f62f118f77b9ed"
 SRC_URI[xattr-1.3.1.sha256sum] = "8da84f1a25939b27f6820d92aed108f83ff920fdf11a7b19366c27c4cda81d4f"
-SRC_URI[yansi-0.5.1.sha256sum] = "09041cd90cf85f7f8b2df60c646f853b7f535ce68f85244eb6731cf89fa498ec"
+SRC_URI[yansi-1.0.1.sha256sum] = "cfe53a6657fd280eaa890a3bc59152892ffa3e30101319d168b781ed6529b049"
 SRC_URI[z85-3.0.5.sha256sum] = "2a599daf1b507819c1121f0bf87fa37eb19daac6aff3aefefd4e6e2e0f2020fc"
-SRC_URI[zerocopy-0.7.33.sha256sum] = "087eca3c1eaf8c47b94d02790dd086cd594b912d2043d4de4bfdd466b3befb7c"
-SRC_URI[zerocopy-derive-0.7.33.sha256sum] = "6f4b6c273f496d8fd4eaf18853e6b448760225dc030ff2c485a786859aea6393"
-SRC_URI[zip-1.3.0.sha256sum] = "f1f4a27345eb6f7aa7bd015ba7eb4175fa4e1b462a29874b779e0bbcf96c6ac7"
+SRC_URI[zerocopy-0.7.34.sha256sum] = "ae87e3fcd617500e5d106f0380cf7b77f3c6092aae37191433159dda23cfb087"
+SRC_URI[zerocopy-derive-0.7.34.sha256sum] = "15e934569e47891f7d9411f1a451d947a60e000ab3bd24fbb970f000387d1b3b"
+SRC_URI[zip-1.1.4.sha256sum] = "9cc23c04387f4da0374be4533ad1208cbb091d5c11d070dfef13676ad6497164"
+# from fuzz/Cargo.lock
+SRC_URI += " \
+    crate://crates.io/aho-corasick/1.1.3 \
+    crate://crates.io/android-tzdata/0.1.1 \
+    crate://crates.io/android_system_properties/0.1.5 \
+    crate://crates.io/anstream/0.6.14 \
+    crate://crates.io/anstyle/1.0.7 \
+    crate://crates.io/anstyle-parse/0.2.4 \
+    crate://crates.io/anstyle-query/1.0.3 \
+    crate://crates.io/anstyle-wincon/3.0.3 \
+    crate://crates.io/arbitrary/1.3.2 \
+    crate://crates.io/autocfg/1.3.0 \
+    crate://crates.io/bigdecimal/0.4.3 \
+    crate://crates.io/binary-heap-plus/0.5.0 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.5.0 \
+    crate://crates.io/bstr/1.9.1 \
+    crate://crates.io/bumpalo/3.16.0 \
+    crate://crates.io/bytecount/0.6.8 \
+    crate://crates.io/cc/1.0.98 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/cfg_aliases/0.1.1 \
+    crate://crates.io/cfg_aliases/0.2.1 \
+    crate://crates.io/chrono/0.4.38 \
+    crate://crates.io/clap/4.5.4 \
+    crate://crates.io/clap_builder/4.5.2 \
+    crate://crates.io/clap_lex/0.7.0 \
+    crate://crates.io/colorchoice/1.0.1 \
+    crate://crates.io/compare/0.1.0 \
+    crate://crates.io/const-random/0.1.18 \
+    crate://crates.io/const-random-macro/0.1.16 \
+    crate://crates.io/core-foundation-sys/0.8.6 \
+    crate://crates.io/crossbeam-deque/0.8.5 \
+    crate://crates.io/crossbeam-epoch/0.9.18 \
+    crate://crates.io/crossbeam-utils/0.8.20 \
+    crate://crates.io/crunchy/0.2.2 \
+    crate://crates.io/ctrlc/3.4.4 \
+    crate://crates.io/dlv-list/0.5.2 \
+    crate://crates.io/dunce/1.0.4 \
+    crate://crates.io/either/1.12.0 \
+    crate://crates.io/errno/0.3.9 \
+    crate://crates.io/fastrand/2.1.1 \
+    crate://crates.io/fnv/1.0.7 \
+    crate://crates.io/getrandom/0.2.15 \
+    crate://crates.io/glob/0.3.1 \
+    crate://crates.io/hashbrown/0.14.5 \
+    crate://crates.io/iana-time-zone/0.1.60 \
+    crate://crates.io/iana-time-zone-haiku/0.1.2 \
+    crate://crates.io/is_terminal_polyfill/1.70.0 \
+    crate://crates.io/itertools/0.13.0 \
+    crate://crates.io/jobserver/0.1.31 \
+    crate://crates.io/js-sys/0.3.69 \
+    crate://crates.io/libc/0.2.161 \
+    crate://crates.io/libfuzzer-sys/0.4.7 \
+    crate://crates.io/libm/0.2.8 \
+    crate://crates.io/linux-raw-sys/0.4.14 \
+    crate://crates.io/log/0.4.21 \
+    crate://crates.io/memchr/2.7.2 \
+    crate://crates.io/minimal-lexical/0.2.1 \
+    crate://crates.io/nix/0.28.0 \
+    crate://crates.io/nix/0.29.0 \
+    crate://crates.io/nom/7.1.3 \
+    crate://crates.io/num-bigint/0.4.5 \
+    crate://crates.io/num-integer/0.1.46 \
+    crate://crates.io/num-traits/0.2.19 \
+    crate://crates.io/number_prefix/0.4.0 \
+    crate://crates.io/once_cell/1.19.0 \
+    crate://crates.io/onig/6.4.0 \
+    crate://crates.io/onig_sys/69.8.1 \
+    crate://crates.io/ordered-multimap/0.7.3 \
+    crate://crates.io/os_display/0.1.3 \
+    crate://crates.io/parse_datetime/0.6.0 \
+    crate://crates.io/pkg-config/0.3.30 \
+    crate://crates.io/ppv-lite86/0.2.17 \
+    crate://crates.io/proc-macro2/1.0.83 \
+    crate://crates.io/quote/1.0.36 \
+    crate://crates.io/rand/0.8.5 \
+    crate://crates.io/rand_chacha/0.3.1 \
+    crate://crates.io/rand_core/0.6.4 \
+    crate://crates.io/rayon/1.10.0 \
+    crate://crates.io/rayon-core/1.12.1 \
+    crate://crates.io/regex/1.10.4 \
+    crate://crates.io/regex-automata/0.4.6 \
+    crate://crates.io/regex-syntax/0.8.3 \
+    crate://crates.io/rust-ini/0.21.0 \
+    crate://crates.io/rustix/0.38.37 \
+    crate://crates.io/self_cell/1.0.4 \
+    crate://crates.io/serde/1.0.202 \
+    crate://crates.io/serde_derive/1.0.202 \
+    crate://crates.io/similar/2.6.0 \
+    crate://crates.io/strsim/0.11.1 \
+    crate://crates.io/syn/2.0.65 \
+    crate://crates.io/tempfile/3.13.0 \
+    crate://crates.io/terminal_size/0.3.0 \
+    crate://crates.io/thiserror/1.0.61 \
+    crate://crates.io/thiserror-impl/1.0.61 \
+    crate://crates.io/tiny-keccak/2.0.2 \
+    crate://crates.io/trim-in-place/0.1.7 \
+    crate://crates.io/unicode-ident/1.0.12 \
+    crate://crates.io/unicode-width/0.1.12 \
+    crate://crates.io/utf8parse/0.2.1 \
+    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+    crate://crates.io/wasm-bindgen/0.2.92 \
+    crate://crates.io/wasm-bindgen-backend/0.2.92 \
+    crate://crates.io/wasm-bindgen-macro/0.2.92 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.92 \
+    crate://crates.io/wasm-bindgen-shared/0.2.92 \
+    crate://crates.io/wild/2.2.1 \
+    crate://crates.io/winapi-util/0.1.8 \
+    crate://crates.io/windows-core/0.52.0 \
+    crate://crates.io/windows-sys/0.48.0 \
+    crate://crates.io/windows-sys/0.52.0 \
+    crate://crates.io/windows-sys/0.59.0 \
+    crate://crates.io/windows-targets/0.48.5 \
+    crate://crates.io/windows-targets/0.52.6 \
+    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
+    crate://crates.io/windows_aarch64_msvc/0.48.5 \
+    crate://crates.io/windows_aarch64_msvc/0.52.6 \
+    crate://crates.io/windows_i686_gnu/0.48.5 \
+    crate://crates.io/windows_i686_gnu/0.52.6 \
+    crate://crates.io/windows_i686_gnullvm/0.52.6 \
+    crate://crates.io/windows_i686_msvc/0.48.5 \
+    crate://crates.io/windows_i686_msvc/0.52.6 \
+    crate://crates.io/windows_x86_64_gnu/0.48.5 \
+    crate://crates.io/windows_x86_64_gnu/0.52.6 \
+    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
+    crate://crates.io/windows_x86_64_msvc/0.48.5 \
+    crate://crates.io/windows_x86_64_msvc/0.52.6 \
+"
+
+SRC_URI[aho-corasick-1.1.3.sha256sum] = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
+SRC_URI[android-tzdata-0.1.1.sha256sum] = "e999941b234f3131b00bc13c22d06e8c5ff726d1b6318ac7eb276997bbb4fef0"
+SRC_URI[android_system_properties-0.1.5.sha256sum] = "819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311"
+SRC_URI[anstream-0.6.14.sha256sum] = "418c75fa768af9c03be99d17643f93f79bbba589895012a80e3452a19ddda15b"
+SRC_URI[anstyle-1.0.7.sha256sum] = "038dfcf04a5feb68e9c60b21c9625a54c2c0616e79b72b0fd87075a056ae1d1b"
+SRC_URI[anstyle-parse-0.2.4.sha256sum] = "c03a11a9034d92058ceb6ee011ce58af4a9bf61491aa7e1e59ecd24bd40d22d4"
+SRC_URI[anstyle-query-1.0.3.sha256sum] = "a64c907d4e79225ac72e2a354c9ce84d50ebb4586dee56c82b3ee73004f537f5"
+SRC_URI[anstyle-wincon-3.0.3.sha256sum] = "61a38449feb7068f52bb06c12759005cf459ee52bb4adc1d5a7c4322d716fb19"
+SRC_URI[arbitrary-1.3.2.sha256sum] = "7d5a26814d8dcb93b0e5a0ff3c6d80a8843bafb21b39e8e18a6f05471870e110"
+SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
+SRC_URI[bigdecimal-0.4.3.sha256sum] = "9324c8014cd04590682b34f1e9448d38f0674d0f7b2dc553331016ef0e4e9ebc"
+SRC_URI[binary-heap-plus-0.5.0.sha256sum] = "e4551d8382e911ecc0d0f0ffb602777988669be09447d536ff4388d1def11296"
+SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bitflags-2.5.0.sha256sum] = "cf4b9d6a944f767f8e5e0db018570623c85f3d925ac718db4e06d0187adb21c1"
+SRC_URI[bstr-1.9.1.sha256sum] = "05efc5cfd9110c8416e471df0e96702d58690178e206e61b7173706673c93706"
+SRC_URI[bumpalo-3.16.0.sha256sum] = "79296716171880943b8470b5f8d03aa55eb2e645a4874bdbb28adb49162e012c"
+SRC_URI[bytecount-0.6.8.sha256sum] = "5ce89b21cab1437276d2650d57e971f9d548a2d9037cc231abdc0562b97498ce"
+SRC_URI[cc-1.0.98.sha256sum] = "41c270e7540d725e65ac7f1b212ac8ce349719624d7bcff99f8e2e488e8cf03f"
+SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[cfg_aliases-0.1.1.sha256sum] = "fd16c4719339c4530435d38e511904438d07cce7950afa3718a84ac36c10e89e"
+SRC_URI[cfg_aliases-0.2.1.sha256sum] = "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
+SRC_URI[chrono-0.4.38.sha256sum] = "a21f936df1771bf62b77f047b726c4625ff2e8aa607c01ec06e5a05bd8463401"
+SRC_URI[clap-4.5.4.sha256sum] = "90bc066a67923782aa8515dbaea16946c5bcc5addbd668bb80af688e53e548a0"
+SRC_URI[clap_builder-4.5.2.sha256sum] = "ae129e2e766ae0ec03484e609954119f123cc1fe650337e155d03b022f24f7b4"
+SRC_URI[clap_lex-0.7.0.sha256sum] = "98cc8fbded0c607b7ba9dd60cd98df59af97e84d24e49c8557331cfc26d301ce"
+SRC_URI[colorchoice-1.0.1.sha256sum] = "0b6a852b24ab71dffc585bcb46eaf7959d175cb865a7152e35b348d1b2960422"
+SRC_URI[compare-0.1.0.sha256sum] = "120133d4db2ec47efe2e26502ee984747630c67f51974fca0b6c1340cf2368d3"
+SRC_URI[const-random-0.1.18.sha256sum] = "87e00182fe74b066627d63b85fd550ac2998d4b0bd86bfed477a0ae4c7c71359"
+SRC_URI[const-random-macro-0.1.16.sha256sum] = "f9d839f2a20b0aee515dc581a6172f2321f96cab76c1a38a4c584a194955390e"
+SRC_URI[core-foundation-sys-0.8.6.sha256sum] = "06ea2b9bc92be3c2baa9334a323ebca2d6f074ff852cd1d7b11064035cd3868f"
+SRC_URI[crossbeam-deque-0.8.5.sha256sum] = "613f8cc01fe9cf1a3eb3d7f488fd2fa8388403e97039e2f73692932e291a770d"
+SRC_URI[crossbeam-epoch-0.9.18.sha256sum] = "5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e"
+SRC_URI[crossbeam-utils-0.8.20.sha256sum] = "22ec99545bb0ed0ea7bb9b8e1e9122ea386ff8a48c0922e43f36d45ab09e0e80"
+SRC_URI[crunchy-0.2.2.sha256sum] = "7a81dae078cea95a014a339291cec439d2f232ebe854a9d672b796c6afafa9b7"
+SRC_URI[ctrlc-3.4.4.sha256sum] = "672465ae37dc1bc6380a6547a8883d5dd397b0f1faaad4f265726cc7042a5345"
+SRC_URI[dlv-list-0.5.2.sha256sum] = "442039f5147480ba31067cb00ada1adae6892028e40e45fc5de7b7df6dcc1b5f"
+SRC_URI[dunce-1.0.4.sha256sum] = "56ce8c6da7551ec6c462cbaf3bfbc75131ebbfa1c944aeaa9dab51ca1c5f0c3b"
+SRC_URI[either-1.12.0.sha256sum] = "3dca9240753cf90908d7e4aac30f630662b02aebaa1b58a3cadabdb23385b58b"
+SRC_URI[errno-0.3.9.sha256sum] = "534c5cf6194dfab3db3242765c03bbe257cf92f22b38f6bc0c58d59108a820ba"
+SRC_URI[fastrand-2.1.1.sha256sum] = "e8c02a5121d4ea3eb16a80748c74f5549a5665e4c21333c6098f283870fbdea6"
+SRC_URI[fnv-1.0.7.sha256sum] = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1"
+SRC_URI[getrandom-0.2.15.sha256sum] = "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
+SRC_URI[glob-0.3.1.sha256sum] = "d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b"
+SRC_URI[hashbrown-0.14.5.sha256sum] = "e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1"
+SRC_URI[iana-time-zone-0.1.60.sha256sum] = "e7ffbb5a1b541ea2561f8c41c087286cc091e21e556a4f09a8f6cbf17b69b141"
+SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] = "f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f"
+SRC_URI[is_terminal_polyfill-1.70.0.sha256sum] = "f8478577c03552c21db0e2724ffb8986a5ce7af88107e6be5d2ee6e158c12800"
+SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
+SRC_URI[jobserver-0.1.31.sha256sum] = "d2b099aaa34a9751c5bf0878add70444e1ed2dd73f347be99003d4577277de6e"
+SRC_URI[js-sys-0.3.69.sha256sum] = "29c15563dc2726973df627357ce0c9ddddbea194836909d655df6a75d2cf296d"
+SRC_URI[libc-0.2.161.sha256sum] = "8e9489c2807c139ffd9c1794f4af0ebe86a828db53ecdc7fea2111d0fed085d1"
+SRC_URI[libfuzzer-sys-0.4.7.sha256sum] = "a96cfd5557eb82f2b83fed4955246c988d331975a002961b07c81584d107e7f7"
+SRC_URI[libm-0.2.8.sha256sum] = "4ec2a862134d2a7d32d7983ddcdd1c4923530833c9f2ea1a44fc5fa473989058"
+SRC_URI[linux-raw-sys-0.4.14.sha256sum] = "78b3ae25bc7c8c38cec158d1f2757ee79e9b3740fbc7ccf0e59e4b08d793fa89"
+SRC_URI[log-0.4.21.sha256sum] = "90ed8c1e510134f979dbc4f070f87d4313098b704861a105fe34231c70a3901c"
+SRC_URI[memchr-2.7.2.sha256sum] = "6c8640c5d730cb13ebd907d8d04b52f55ac9a2eec55b440c8892f40d56c76c1d"
+SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
+SRC_URI[nix-0.28.0.sha256sum] = "ab2156c4fce2f8df6c499cc1c763e4394b7482525bf2a9701c9d79d215f519e4"
+SRC_URI[nix-0.29.0.sha256sum] = "71e2746dc3a24dd78b3cfcb7be93368c6de9963d30f43a6a73998a9cf4b17b46"
+SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
+SRC_URI[num-bigint-0.4.5.sha256sum] = "c165a9ab64cf766f73521c0dd2cfdff64f488b8f0b3e621face3462d3db536d7"
+SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
+SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
+SRC_URI[number_prefix-0.4.0.sha256sum] = "830b246a0e5f20af87141b25c173cd1b609bd7779a4617d6ec582abaf90870f3"
+SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
+SRC_URI[onig-6.4.0.sha256sum] = "8c4b31c8722ad9171c6d77d3557db078cab2bd50afcc9d09c8b315c59df8ca4f"
+SRC_URI[onig_sys-69.8.1.sha256sum] = "7b829e3d7e9cc74c7e315ee8edb185bf4190da5acde74afd7fc59c35b1f086e7"
+SRC_URI[ordered-multimap-0.7.3.sha256sum] = "49203cdcae0030493bad186b28da2fa25645fa276a51b6fec8010d281e02ef79"
+SRC_URI[os_display-0.1.3.sha256sum] = "7a6229bad892b46b0dcfaaeb18ad0d2e56400f5aaea05b768bde96e73676cf75"
+SRC_URI[parse_datetime-0.6.0.sha256sum] = "a8720474e3dd4af20cea8716703498b9f3b690f318fa9d9d9e2e38eaf44b96d0"
+SRC_URI[pkg-config-0.3.30.sha256sum] = "d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec"
+SRC_URI[ppv-lite86-0.2.17.sha256sum] = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
+SRC_URI[proc-macro2-1.0.83.sha256sum] = "0b33eb56c327dec362a9e55b3ad14f9d2f0904fb5a5b03b513ab5465399e9f43"
+SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
+SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
+SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
+SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
+SRC_URI[rayon-1.10.0.sha256sum] = "b418a60154510ca1a002a752ca9714984e21e4241e804d32555251faf8b78ffa"
+SRC_URI[rayon-core-1.12.1.sha256sum] = "1465873a3dfdaa8ae7cb14b4383657caab0b3e8a0aa9ae8e04b044854c8dfce2"
+SRC_URI[regex-1.10.4.sha256sum] = "c117dbdfde9c8308975b6a18d71f3f385c89461f7b3fb054288ecf2a2058ba4c"
+SRC_URI[regex-automata-0.4.6.sha256sum] = "86b83b8b9847f9bf95ef68afb0b8e6cdb80f498442f5179a29fad448fcc1eaea"
+SRC_URI[regex-syntax-0.8.3.sha256sum] = "adad44e29e4c806119491a7f06f03de4d1af22c3a680dd47f1e6e179439d1f56"
+SRC_URI[rust-ini-0.21.0.sha256sum] = "0d625ed57d8f49af6cfa514c42e1a71fadcff60eb0b1c517ff82fe41aa025b41"
+SRC_URI[rustix-0.38.37.sha256sum] = "8acb788b847c24f28525660c4d7758620a7210875711f79e7f663cc152726811"
+SRC_URI[self_cell-1.0.4.sha256sum] = "d369a96f978623eb3dc28807c4852d6cc617fed53da5d3c400feff1ef34a714a"
+SRC_URI[serde-1.0.202.sha256sum] = "226b61a0d411b2ba5ff6d7f73a476ac4f8bb900373459cd00fab8512828ba395"
+SRC_URI[serde_derive-1.0.202.sha256sum] = "6048858004bcff69094cd972ed40a32500f153bd3be9f716b2eed2e8217c4838"
+SRC_URI[similar-2.6.0.sha256sum] = "1de1d4f81173b03af4c0cbed3c898f6bff5b870e4a7f5d6f4057d62a7a4b686e"
+SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
+SRC_URI[syn-2.0.65.sha256sum] = "d2863d96a84c6439701d7a38f9de935ec562c8832cc55d1dde0f513b52fad106"
+SRC_URI[tempfile-3.13.0.sha256sum] = "f0f2c9fc62d0beef6951ccffd757e241266a2c833136efbe35af6cd2567dca5b"
+SRC_URI[terminal_size-0.3.0.sha256sum] = "21bebf2b7c9e0a515f6e0f8c51dc0f8e4696391e6f1ff30379559f8365fb0df7"
+SRC_URI[thiserror-1.0.61.sha256sum] = "c546c80d6be4bc6a00c0f01730c08df82eaa7a7a61f11d656526506112cc1709"
+SRC_URI[thiserror-impl-1.0.61.sha256sum] = "46c3384250002a6d5af4d114f2845d37b57521033f30d5c3f46c4d70e1197533"
+SRC_URI[tiny-keccak-2.0.2.sha256sum] = "2c9d3793400a45f954c52e73d068316d76b6f4e36977e3fcebb13a2721e80237"
+SRC_URI[trim-in-place-0.1.7.sha256sum] = "343e926fc669bc8cde4fa3129ab681c63671bae288b1f1081ceee6d9d37904fc"
+SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
+SRC_URI[unicode-width-0.1.12.sha256sum] = "68f5e5f3158ecfd4b8ff6fe086db7c8467a2dfdac97fe420f2b7c4aa97af66d6"
+SRC_URI[utf8parse-0.2.1.sha256sum] = "711b9620af191e0cdc7468a8d14e709c3dcdb115b36f838e601583af800a370a"
+SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
+SRC_URI[wasm-bindgen-0.2.92.sha256sum] = "4be2531df63900aeb2bca0daaaddec08491ee64ceecbee5076636a3b026795a8"
+SRC_URI[wasm-bindgen-backend-0.2.92.sha256sum] = "614d787b966d3989fa7bb98a654e369c762374fd3213d212cfc0251257e747da"
+SRC_URI[wasm-bindgen-macro-0.2.92.sha256sum] = "a1f8823de937b71b9460c0c34e25f3da88250760bec0ebac694b49997550d726"
+SRC_URI[wasm-bindgen-macro-support-0.2.92.sha256sum] = "e94f17b526d0a461a191c78ea52bbce64071ed5c04c9ffe424dcb38f74171bb7"
+SRC_URI[wasm-bindgen-shared-0.2.92.sha256sum] = "af190c94f2773fdb3729c55b007a722abb5384da03bc0986df4c289bf5567e96"
+SRC_URI[wild-2.2.1.sha256sum] = "a3131afc8c575281e1e80f36ed6a092aa502c08b18ed7524e86fbbb12bb410e1"
+SRC_URI[winapi-util-0.1.8.sha256sum] = "4d4cc384e1e73b93bafa6fb4f1df8c41695c8a91cf9c4c64358067d15a7b6c6b"
+SRC_URI[windows-core-0.52.0.sha256sum] = "33ab640c8d7e35bf8ba19b884ba838ceb4fba93a4e8c65a9059d08afcfc683d9"
+SRC_URI[windows-sys-0.48.0.sha256sum] = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
+SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
+SRC_URI[windows-sys-0.59.0.sha256sum] = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
+SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
+SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
+SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
+SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
+SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
+SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
+SRC_URI[windows_i686_gnu-0.48.5.sha256sum] = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
+SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
+SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
+SRC_URI[windows_i686_msvc-0.48.5.sha256sum] = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
+SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
+SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
+SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
+SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
+SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
+SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
+SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.27.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
similarity index 98%
rename from meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.27.bb
rename to meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
index 320739bee..5608b0347 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.27.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
@@ -13,7 +13,7 @@ SRC_URI += "git://github.com/uutils/coreutils.git;protocol=https;branch=main"
 # so src/uucore/src/lib/features.rs disables utmpx when targetting musl.
 COMPATIBLE_HOST:libc-musl = "null"
 
-SRCREV = "9b11753e7cb06b0f76f4221fc237019c0a86f8f5"
+SRCREV = "1d9e1626377cbaea3b21842a3525a62ba60f905f"
 S = "${WORKDIR}/git"
 
 require ${BPN}-crates.inc
-- 
2.34.1


