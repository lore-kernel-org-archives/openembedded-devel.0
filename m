Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6D1C982C3
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:40 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18114.1789458273650019820
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Y882cOit;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id E12851C3D9
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:19 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Npp-00ds5l0; Tue, 15 Sep 2026 09:44:09 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 06/31] glycin: upgrade 2.1.5 -> 2.2.0
Date: Tue, 15 Sep 2026 09:43:22 +0200
Message-ID: <20260915074347.6003-6-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458249-E4FF69B9-25C4D9EC/0/0 CLEAN NORMAL
X-TOI-MSGID: 1b8830dc-32fa-4b8e-a1ec-f9bb66cfa1ca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458259; i=f_l_k@t-online.de;
	bh=TKbyh96YP8j1yfT9set509QzlF3PEnyCC3QTa/jdAM8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Y882cOit9SK3S/zfg4GmZz3sfOJ8e40mvqPWin/3wRfV2VPmBnD+GAUeGB8LlL8Ig
	 TONvnDjF6ZsfsYmG80M/6668xKNFJF+AvtG8oUZ3pb7jjjWI7MXIkJBC3BAjXR+dLC
	 90d17JKCHSGv7Q9OPllSCZsCrkvGj5jeg+j/qovTfo7aeSDncAJ9BAJaBBiiAcF6mh
	 YAvserSwGGdoKUtRcGzIVF2CHZwzJ2KkHAFibn+k3oPGt9Ul1I3dWO2zcQY81k9ms1
	 Vizu283RfItpLOqop1AE0SvNysWu2EZ8y1PQyQlU1KufhIyDXM95pXcTtOCnMTyJHS
	 MbPFNxflUYe5Q==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130061

Both cross-compilation patches are part of the release now. Upstream
handles the rust target via meson.is_cross_build() and the rust_target
cross property the recipe already provides.

The 2.2 series is released from main, so follow that branch.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/glycin/glycin-crates.inc    | 674 +++++++++---------
 ...oss-compilation-via-a-rust_target-cr.patch |  97 ---
 ...argo-artifacts-from-the-per-target-s.patch |  31 -
 .../{glycin_2.1.5.bb =3D> glycin_2.2.0.bb}      |   7 +-
 4 files changed, 354 insertions(+), 455 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/glycin/glycin/0001-meson-Sup=
port-cross-compilation-via-a-rust_target-cr.patch
 delete mode 100644 meta-gnome/recipes-gnome/glycin/glycin/0002-libglycin=
-Read-cargo-artifacts-from-the-per-target-s.patch
 rename meta-gnome/recipes-gnome/glycin/{glycin_2.1.5.bb =3D> glycin_2.2.=
0.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/glycin/glycin-crates.inc b/meta-gno=
me/recipes-gnome/glycin/glycin-crates.inc
index b1a982eff2..4760801a3a 100644
--- a/meta-gnome/recipes-gnome/glycin/glycin-crates.inc
+++ b/meta-gnome/recipes-gnome/glycin/glycin-crates.inc
@@ -5,9 +5,12 @@ SRC_URI +=3D " \
     crate://crates.io/adler2/2.0.1 \
     crate://crates.io/ahash/0.8.12 \
     crate://crates.io/aho-corasick/1.1.4 \
+    crate://crates.io/aliasable/0.1.3 \
+    crate://crates.io/alloca/0.4.0 \
     crate://crates.io/allocator-api2/0.2.21 \
     crate://crates.io/android_system_properties/0.1.5 \
-    crate://crates.io/anyhow/1.0.102 \
+    crate://crates.io/anes/0.1.6 \
+    crate://crates.io/anstyle/1.0.14 \
     crate://crates.io/approx/0.5.1 \
     crate://crates.io/async-broadcast/0.7.2 \
     crate://crates.io/async-channel/2.5.0 \
@@ -18,265 +21,282 @@ SRC_URI +=3D " \
     crate://crates.io/async-lock/3.4.2 \
     crate://crates.io/async-process/2.5.0 \
     crate://crates.io/async-recursion/1.1.1 \
-    crate://crates.io/async-signal/0.2.13 \
+    crate://crates.io/async-signal/0.2.14 \
     crate://crates.io/async-task/4.7.1 \
-    crate://crates.io/async-trait/0.1.89 \
+    crate://crates.io/async-trait/0.1.91 \
     crate://crates.io/atomic-waker/1.1.2 \
-    crate://crates.io/autocfg/1.5.0 \
+    crate://crates.io/autocfg/1.5.1 \
     crate://crates.io/bit_field/0.10.3 \
-    crate://crates.io/bitflags/2.11.0 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.13.1 \
     crate://crates.io/bitreader/0.3.11 \
     crate://crates.io/blocking/1.6.2 \
-    crate://crates.io/bon/3.9.0 \
-    crate://crates.io/bon-macros/3.9.0 \
-    crate://crates.io/bumpalo/3.20.2 \
-    crate://crates.io/bytemuck/1.25.0 \
+    crate://crates.io/bon/3.9.3 \
+    crate://crates.io/bon-macros/3.9.3 \
+    crate://crates.io/bumpalo/3.20.3 \
+    crate://crates.io/bytemuck/1.25.2 \
     crate://crates.io/byteorder/1.5.0 \
     crate://crates.io/byteorder-lite/0.1.0 \
-    crate://crates.io/bytes/1.11.1 \
+    crate://crates.io/bytes/1.12.1 \
     crate://crates.io/cairo-rs/0.22.0 \
     crate://crates.io/cairo-sys-rs/0.22.0 \
-    crate://crates.io/cc/1.2.56 \
-    crate://crates.io/cfg-expr/0.20.7 \
+    crate://crates.io/cast/0.3.0 \
+    crate://crates.io/cc/1.4.0 \
+    crate://crates.io/cfg-expr/0.20.8 \
     crate://crates.io/cfg-if/1.0.4 \
-    crate://crates.io/cfg_aliases/0.2.1 \
-    crate://crates.io/chrono/0.4.44 \
+    crate://crates.io/cfg_aliases/0.2.2 \
+    crate://crates.io/chrono/0.4.45 \
+    crate://crates.io/ciborium/0.2.2 \
+    crate://crates.io/ciborium-io/0.2.2 \
+    crate://crates.io/ciborium-ll/0.2.2 \
+    crate://crates.io/clap/4.6.4 \
+    crate://crates.io/clap_builder/4.6.2 \
+    crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/color_quant/1.1.0 \
     crate://crates.io/concurrent-queue/2.5.0 \
     crate://crates.io/core-foundation-sys/0.8.7 \
     crate://crates.io/crc32fast/1.5.0 \
-    crate://crates.io/crossbeam-deque/0.8.6 \
-    crate://crates.io/crossbeam-epoch/0.9.18 \
-    crate://crates.io/crossbeam-utils/0.8.21 \
+    crate://crates.io/criterion/0.8.2 \
+    crate://crates.io/criterion-plot/0.8.2 \
+    crate://crates.io/crossbeam-deque/0.8.7 \
+    crate://crates.io/crossbeam-epoch/0.9.20 \
+    crate://crates.io/crossbeam-utils/0.8.22 \
     crate://crates.io/crunchy/0.2.4 \
     crate://crates.io/darling/0.23.0 \
     crate://crates.io/darling_core/0.23.0 \
     crate://crates.io/darling_macro/0.23.0 \
+    crate://crates.io/defmt/1.1.1 \
+    crate://crates.io/defmt-macros/1.1.1 \
+    crate://crates.io/defmt-parser/1.0.0 \
     crate://crates.io/dlib/0.5.3 \
-    crate://crates.io/dunce/1.0.5 \
-    crate://crates.io/either/1.15.0 \
+    crate://crates.io/either/1.17.0 \
     crate://crates.io/encoding_rs/0.8.35 \
     crate://crates.io/endi/1.1.1 \
     crate://crates.io/enumflags2/0.7.12 \
     crate://crates.io/enumflags2_derive/0.7.12 \
     crate://crates.io/enumn/0.1.14 \
-    crate://crates.io/env_filter/1.0.0 \
-    crate://crates.io/env_logger/0.11.9 \
+    crate://crates.io/env_filter/2.0.0 \
+    crate://crates.io/env_logger/0.11.11 \
     crate://crates.io/equivalent/1.0.2 \
     crate://crates.io/errno/0.3.14 \
-    crate://crates.io/event-listener/5.4.1 \
+    crate://crates.io/event-listener/5.4.2 \
     crate://crates.io/event-listener-strategy/0.5.4 \
-    crate://crates.io/exr/1.74.0 \
-    crate://crates.io/fallible_collections/0.5.1 \
-    crate://crates.io/fastrand/2.3.0 \
-    crate://crates.io/fax/0.2.6 \
-    crate://crates.io/fax_derive/0.2.0 \
+    crate://crates.io/exr/1.74.2 \
+    crate://crates.io/fallible_collections/0.5.2 \
+    crate://crates.io/fastrand/2.5.0 \
+    crate://crates.io/fax/0.2.7 \
     crate://crates.io/fdeflate/0.3.7 \
-    crate://crates.io/fearless_simd/0.3.0 \
+    crate://crates.io/fearless_simd/0.4.1 \
     crate://crates.io/find-msvc-tools/0.1.9 \
     crate://crates.io/flate2/1.1.9 \
-    crate://crates.io/foldhash/0.1.5 \
-    crate://crates.io/foreign-types/0.5.0 \
-    crate://crates.io/foreign-types-macros/0.2.3 \
-    crate://crates.io/foreign-types-shared/0.3.1 \
     crate://crates.io/four-cc/0.4.0 \
-    crate://crates.io/futures-channel/0.3.32 \
-    crate://crates.io/futures-core/0.3.32 \
-    crate://crates.io/futures-executor/0.3.32 \
-    crate://crates.io/futures-io/0.3.32 \
+    crate://crates.io/futures-channel/0.3.33 \
+    crate://crates.io/futures-core/0.3.33 \
+    crate://crates.io/futures-executor/0.3.33 \
+    crate://crates.io/futures-io/0.3.33 \
     crate://crates.io/futures-lite/2.6.1 \
-    crate://crates.io/futures-macro/0.3.32 \
-    crate://crates.io/futures-task/0.3.32 \
-    crate://crates.io/futures-timer/3.0.3 \
-    crate://crates.io/futures-util/0.3.32 \
+    crate://crates.io/futures-macro/0.3.33 \
+    crate://crates.io/futures-sink/0.3.33 \
+    crate://crates.io/futures-task/0.3.33 \
+    crate://crates.io/futures-timer/3.0.4 \
+    crate://crates.io/futures-util/0.3.33 \
     crate://crates.io/gdk-pixbuf/0.22.0 \
     crate://crates.io/gdk-pixbuf-sys/0.22.0 \
-    crate://crates.io/gdk4/0.11.0 \
-    crate://crates.io/gdk4-sys/0.11.0 \
+    crate://crates.io/gdk4/0.11.4 \
+    crate://crates.io/gdk4-sys/0.11.4 \
     crate://crates.io/getopts/0.2.24 \
-    crate://crates.io/getrandom/0.3.4 \
-    crate://crates.io/getrandom/0.4.1 \
-    crate://crates.io/gif/0.14.1 \
-    crate://crates.io/gio/0.22.2 \
-    crate://crates.io/gio-sys/0.22.0 \
-    crate://crates.io/gio-unix/0.22.0 \
+    crate://crates.io/getrandom/0.4.3 \
+    crate://crates.io/gif/0.14.2 \
+    crate://crates.io/gio/0.22.8 \
+    crate://crates.io/gio-sys/0.22.8 \
+    crate://crates.io/gio-unix/0.22.8 \
     crate://crates.io/gio-unix-sys/0.22.0 \
-    crate://crates.io/glib/0.22.2 \
-    crate://crates.io/glib-macros/0.22.2 \
-    crate://crates.io/glib-sys/0.22.0 \
-    crate://crates.io/gobject-sys/0.22.0 \
-    crate://crates.io/gufo/0.4.1 \
-    crate://crates.io/gufo-common/1.1.0 \
-    crate://crates.io/gufo-exif/0.4.0 \
-    crate://crates.io/gufo-jpeg/0.4.0 \
-    crate://crates.io/gufo-png/0.4.1 \
-    crate://crates.io/gufo-tiff/0.4.0 \
-    crate://crates.io/gufo-webp/0.4.0 \
-    crate://crates.io/gufo-xmp/0.4.0 \
+    crate://crates.io/glib/0.22.8 \
+    crate://crates.io/glib-macros/0.22.6 \
+    crate://crates.io/glib-sys/0.22.8 \
+    crate://crates.io/gobject-sys/0.22.6 \
+    crate://crates.io/gufo/0.5.0 \
+    crate://crates.io/gufo-common/2.0.0 \
+    crate://crates.io/gufo-exif/0.5.0 \
+    crate://crates.io/gufo-jpeg/0.5.1 \
+    crate://crates.io/gufo-png/0.5.0 \
+    crate://crates.io/gufo-svg/0.5.0 \
+    crate://crates.io/gufo-tiff/0.5.0 \
+    crate://crates.io/gufo-webp/0.5.0 \
+    crate://crates.io/gufo-xmp/0.5.0 \
     crate://crates.io/half/2.7.1 \
     crate://crates.io/hashbrown/0.14.5 \
-    crate://crates.io/hashbrown/0.15.5 \
-    crate://crates.io/hashbrown/0.16.1 \
-    crate://crates.io/hayro-jpeg2000/0.3.4 \
+    crate://crates.io/hashbrown/0.17.1 \
+    crate://crates.io/hayro-jpeg2000/0.3.5 \
+    crate://crates.io/heck/0.4.1 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/hermit-abi/0.5.2 \
     crate://crates.io/hex/0.4.3 \
     crate://crates.io/iana-time-zone/0.1.65 \
     crate://crates.io/iana-time-zone-haiku/0.1.2 \
-    crate://crates.io/id-arena/2.3.0 \
     crate://crates.io/ident_case/1.0.1 \
     crate://crates.io/image/0.25.10 \
-    crate://crates.io/image-extras/0.1.0 \
+    crate://crates.io/image-extras/0.1.1 \
     crate://crates.io/image-webp/0.2.4 \
-    crate://crates.io/indexmap/2.13.0 \
-    crate://crates.io/itoa/1.0.17 \
-    crate://crates.io/jiff/0.2.23 \
-    crate://crates.io/jiff-static/0.2.23 \
-    crate://crates.io/jobserver/0.1.34 \
+    crate://crates.io/indexmap/2.14.0 \
+    crate://crates.io/itertools/0.13.0 \
+    crate://crates.io/itoa/1.0.18 \
+    crate://crates.io/jiff/0.2.35 \
+    crate://crates.io/jiff-core/0.1.0 \
+    crate://crates.io/jiff-static/0.2.35 \
     crate://crates.io/jpeg-decoder/0.3.2 \
-    crate://crates.io/jpeg-encoder/0.7.0 \
-    crate://crates.io/jpegxl-rs/0.12.0+libjxl-0.11.1 \
-    crate://crates.io/jpegxl-sys/0.12.0+libjxl-0.11.1 \
-    crate://crates.io/js-sys/0.3.91 \
+    crate://crates.io/jpeg-encoder/0.7.1 \
+    crate://crates.io/jpegxl-rs/0.14.0+libjxl-0.11.2 \
+    crate://crates.io/jpegxl-sys/0.12.1+libjxl-0.11.2 \
+    crate://crates.io/js-sys/0.3.103 \
     crate://crates.io/lazy_static/1.5.0 \
-    crate://crates.io/lcms2/6.1.1 \
-    crate://crates.io/lcms2-sys/4.0.6 \
-    crate://crates.io/leb128fmt/0.1.0 \
     crate://crates.io/lebe/0.5.3 \
-    crate://crates.io/libc/0.2.183 \
+    crate://crates.io/libc/0.2.189 \
     crate://crates.io/libheif-rs/2.7.0 \
-    crate://crates.io/libheif-sys/5.2.0+1.21.2 \
+    crate://crates.io/libheif-sys/5.3.0+1.23.0 \
     crate://crates.io/libloading/0.8.9 \
+    crate://crates.io/libm/0.2.16 \
     crate://crates.io/libopenraw/0.4.0-alpha.12 \
     crate://crates.io/librsvg-rebind/0.3.0 \
     crate://crates.io/librsvg-rebind-sys/0.3.0 \
     crate://crates.io/libseccomp/0.4.0 \
     crate://crates.io/libseccomp-sys/0.3.0 \
     crate://crates.io/linux-raw-sys/0.12.1 \
-    crate://crates.io/log/0.4.29 \
+    crate://crates.io/log/0.4.33 \
     crate://crates.io/matchers/0.2.0 \
-    crate://crates.io/matrixmultiply/0.3.10 \
-    crate://crates.io/memchr/2.8.0 \
-    crate://crates.io/memfd/0.6.5 \
+    crate://crates.io/matrixmultiply/0.3.11 \
+    crate://crates.io/memchr/2.8.3 \
     crate://crates.io/memmap2/0.9.11 \
     crate://crates.io/memoffset/0.9.1 \
     crate://crates.io/miniz_oxide/0.8.9 \
-    crate://crates.io/miniz_oxide/0.9.0 \
-    crate://crates.io/mio/1.1.1 \
+    crate://crates.io/miniz_oxide/0.9.1 \
+    crate://crates.io/mio/1.2.2 \
     crate://crates.io/moxcms/0.8.1 \
     crate://crates.io/multiversion/0.8.0 \
     crate://crates.io/multiversion-macros/0.8.0 \
-    crate://crates.io/nalgebra/0.33.2 \
+    crate://crates.io/nalgebra/0.33.3 \
     crate://crates.io/nalgebra-macros/0.2.2 \
-    crate://crates.io/nix/0.30.1 \
+    crate://crates.io/nix/0.31.3 \
     crate://crates.io/nu-ansi-term/0.50.3 \
-    crate://crates.io/num-bigint/0.4.6 \
+    crate://crates.io/num-bigint/0.4.8 \
     crate://crates.io/num-complex/0.4.6 \
     crate://crates.io/num-integer/0.1.46 \
     crate://crates.io/num-rational/0.4.2 \
     crate://crates.io/num-traits/0.2.19 \
-    crate://crates.io/num_enum/0.7.5 \
-    crate://crates.io/num_enum_derive/0.7.5 \
-    crate://crates.io/once_cell/1.21.3 \
+    crate://crates.io/num_enum/0.7.6 \
+    crate://crates.io/num_enum_derive/0.7.6 \
+    crate://crates.io/once_cell/1.21.4 \
+    crate://crates.io/oorandom/11.1.5 \
     crate://crates.io/ordered-stream/0.2.0 \
-    crate://crates.io/pango/0.22.0 \
+    crate://crates.io/ouroboros/0.18.5 \
+    crate://crates.io/ouroboros_macro/0.18.5 \
+    crate://crates.io/page_size/0.6.0 \
+    crate://crates.io/pango/0.22.8 \
     crate://crates.io/pango-sys/0.22.0 \
     crate://crates.io/parking/2.2.1 \
     crate://crates.io/paste/1.0.15 \
     crate://crates.io/pin-project-lite/0.2.17 \
     crate://crates.io/piper/0.2.5 \
-    crate://crates.io/pkg-config/0.3.32 \
+    crate://crates.io/pkg-config/0.3.33 \
+    crate://crates.io/plotters/0.3.7 \
+    crate://crates.io/plotters-backend/0.3.7 \
+    crate://crates.io/plotters-svg/0.3.7 \
     crate://crates.io/png/0.18.1 \
     crate://crates.io/polling/3.11.0 \
-    crate://crates.io/portable-atomic/1.13.1 \
-    crate://crates.io/portable-atomic-util/0.2.5 \
+    crate://crates.io/portable-atomic/1.14.0 \
+    crate://crates.io/portable-atomic-util/0.2.7 \
     crate://crates.io/prettyplease/0.2.37 \
-    crate://crates.io/proc-macro-crate/3.4.0 \
-    crate://crates.io/proc-macro2/1.0.106 \
-    crate://crates.io/pxfm/0.1.28 \
+    crate://crates.io/proc-macro-crate/3.5.0 \
+    crate://crates.io/proc-macro2/1.0.107 \
+    crate://crates.io/proc-macro2-diagnostics/0.10.1 \
+    crate://crates.io/pulp/0.22.3 \
+    crate://crates.io/pulp-wasm-simd-flag/0.1.1 \
+    crate://crates.io/pxfm/0.1.30 \
     crate://crates.io/qoi/0.4.1 \
     crate://crates.io/quick-error/2.0.1 \
-    crate://crates.io/quote/1.0.45 \
-    crate://crates.io/r-efi/5.3.0 \
+    crate://crates.io/quote/1.0.47 \
+    crate://crates.io/r-efi/6.0.0 \
+    crate://crates.io/raw-cpuid/11.6.0 \
     crate://crates.io/rawpointer/0.2.1 \
-    crate://crates.io/rayon/1.11.0 \
+    crate://crates.io/rayon/1.12.0 \
     crate://crates.io/rayon-core/1.13.0 \
-    crate://crates.io/regex-automata/0.4.14 \
-    crate://crates.io/regex-syntax/0.8.10 \
+    crate://crates.io/reborrow/0.5.5 \
+    crate://crates.io/regex/1.13.1 \
+    crate://crates.io/regex-automata/0.4.16 \
+    crate://crates.io/regex-syntax/0.8.11 \
     crate://crates.io/rmp/0.8.15 \
     crate://crates.io/rmp-serde/1.3.1 \
     crate://crates.io/rustix/1.1.4 \
-    crate://crates.io/rustversion/1.0.22 \
+    crate://crates.io/rustversion/1.0.23 \
     crate://crates.io/ryu/1.0.23 \
     crate://crates.io/safe-transmute/0.11.3 \
     crate://crates.io/safe_arch/0.7.4 \
     crate://crates.io/same-file/1.0.6 \
-    crate://crates.io/semver/1.0.27 \
-    crate://crates.io/serde/1.0.228 \
-    crate://crates.io/serde_core/1.0.228 \
-    crate://crates.io/serde_derive/1.0.228 \
-    crate://crates.io/serde_json/1.0.149 \
-    crate://crates.io/serde_repr/0.1.20 \
-    crate://crates.io/serde_spanned/1.0.4 \
+    crate://crates.io/serde/1.0.229 \
+    crate://crates.io/serde_core/1.0.229 \
+    crate://crates.io/serde_derive/1.0.229 \
+    crate://crates.io/serde_json/1.0.151 \
+    crate://crates.io/serde_repr/0.1.21 \
+    crate://crates.io/serde_spanned/1.1.1 \
     crate://crates.io/serde_yaml_ng/0.10.0 \
     crate://crates.io/sharded-slab/0.1.7 \
     crate://crates.io/shell-words/1.1.1 \
-    crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/shlex/2.0.1 \
     crate://crates.io/signal-hook-registry/1.4.8 \
     crate://crates.io/simba/0.9.1 \
-    crate://crates.io/simd-adler32/0.3.8 \
+    crate://crates.io/simd-adler32/0.3.10 \
     crate://crates.io/simple_logger/5.2.0 \
     crate://crates.io/slab/0.4.12 \
-    crate://crates.io/smallvec/1.15.1 \
-    crate://crates.io/socket2/0.6.3 \
+    crate://crates.io/smallvec/1.15.2 \
+    crate://crates.io/socket2/0.6.5 \
     crate://crates.io/static_assertions/1.1.0 \
     crate://crates.io/strsim/0.11.1 \
-    crate://crates.io/syn/2.0.117 \
-    crate://crates.io/system-deps/7.0.7 \
+    crate://crates.io/syn/2.0.119 \
+    crate://crates.io/syn/3.0.3 \
+    crate://crates.io/system-deps/7.0.8 \
     crate://crates.io/target-features/0.1.6 \
-    crate://crates.io/target-lexicon/0.13.3 \
-    crate://crates.io/tempfile/3.26.0 \
-    crate://crates.io/thiserror/2.0.18 \
-    crate://crates.io/thiserror-impl/2.0.18 \
-    crate://crates.io/thread_local/1.1.9 \
+    crate://crates.io/target-lexicon/0.13.5 \
+    crate://crates.io/tempfile/3.27.0 \
+    crate://crates.io/thiserror/2.0.19 \
+    crate://crates.io/thiserror-impl/2.0.19 \
+    crate://crates.io/thread_local/1.1.10 \
     crate://crates.io/tiff/0.11.3 \
-    crate://crates.io/tokio/1.50.0 \
-    crate://crates.io/tokio-stream/0.1.18 \
-    crate://crates.io/toml/0.9.12+spec-1.1.0 \
-    crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 \
-    crate://crates.io/toml_edit/0.23.10+spec-1.0.0 \
-    crate://crates.io/toml_parser/1.0.9+spec-1.1.0 \
-    crate://crates.io/toml_writer/1.0.6+spec-1.1.0 \
+    crate://crates.io/tinytemplate/1.2.1 \
+    crate://crates.io/tokio/1.53.1 \
+    crate://crates.io/tokio-stream/0.1.19 \
+    crate://crates.io/toml/1.1.4+spec-1.1.0 \
+    crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
+    crate://crates.io/toml_edit/0.25.13+spec-1.1.0 \
+    crate://crates.io/toml_parser/1.1.3+spec-1.1.0 \
+    crate://crates.io/toml_writer/1.1.2+spec-1.1.0 \
     crate://crates.io/tracing/0.1.44 \
     crate://crates.io/tracing-attributes/0.1.31 \
     crate://crates.io/tracing-core/0.1.36 \
     crate://crates.io/tracing-log/0.2.0 \
-    crate://crates.io/tracing-subscriber/0.3.22 \
-    crate://crates.io/typenum/1.19.0 \
+    crate://crates.io/tracing-subscriber/0.3.23 \
+    crate://crates.io/typenum/1.20.1 \
     crate://crates.io/uds_windows/1.2.1 \
     crate://crates.io/unicode-ident/1.0.24 \
     crate://crates.io/unicode-width/0.2.2 \
-    crate://crates.io/unicode-xid/0.2.6 \
     crate://crates.io/unsafe-libyaml/0.2.11 \
-    crate://crates.io/uuid/1.22.0 \
+    crate://crates.io/uuid/1.24.0 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/vcpkg/0.2.15 \
     crate://crates.io/version-compare/0.2.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
-    crate://crates.io/wasip2/1.0.2+wasi-0.2.9 \
-    crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 \
-    crate://crates.io/wasm-bindgen/0.2.114 \
-    crate://crates.io/wasm-bindgen-macro/0.2.114 \
-    crate://crates.io/wasm-bindgen-macro-support/0.2.114 \
-    crate://crates.io/wasm-bindgen-shared/0.2.114 \
-    crate://crates.io/wasm-encoder/0.244.0 \
-    crate://crates.io/wasm-metadata/0.244.0 \
-    crate://crates.io/wasmparser/0.244.0 \
+    crate://crates.io/wasm-bindgen/0.2.126 \
+    crate://crates.io/wasm-bindgen-macro/0.2.126 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.126 \
+    crate://crates.io/wasm-bindgen-shared/0.2.126 \
+    crate://crates.io/web-sys/0.3.103 \
     crate://crates.io/weezl/0.1.12 \
     crate://crates.io/wide/0.7.33 \
+    crate://crates.io/winapi/0.3.9 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
     crate://crates.io/winapi-util/0.1.11 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
     crate://crates.io/windows-core/0.62.2 \
     crate://crates.io/windows-implement/0.60.2 \
     crate://crates.io/windows-interface/0.59.3 \
@@ -284,35 +304,33 @@ SRC_URI +=3D " \
     crate://crates.io/windows-result/0.4.1 \
     crate://crates.io/windows-strings/0.5.1 \
     crate://crates.io/windows-sys/0.61.2 \
-    crate://crates.io/winnow/0.7.15 \
-    crate://crates.io/wit-bindgen/0.51.0 \
-    crate://crates.io/wit-bindgen-core/0.51.0 \
-    crate://crates.io/wit-bindgen-rust/0.51.0 \
-    crate://crates.io/wit-bindgen-rust-macro/0.51.0 \
-    crate://crates.io/wit-component/0.244.0 \
-    crate://crates.io/wit-parser/0.244.0 \
-    crate://crates.io/xml-rs/0.8.28 \
-    crate://crates.io/yeslogic-fontconfig-sys/6.0.0 \
-    crate://crates.io/zbus/5.14.0 \
-    crate://crates.io/zbus_macros/5.14.0 \
-    crate://crates.io/zbus_names/4.3.1 \
-    crate://crates.io/zerocopy/0.8.42 \
-    crate://crates.io/zerocopy-derive/0.8.42 \
-    crate://crates.io/zmij/1.0.21 \
+    crate://crates.io/winnow/1.0.4 \
+    crate://crates.io/xml/1.3.0 \
+    crate://crates.io/yansi/1.0.1 \
+    crate://crates.io/yeslogic-fontconfig-sys/6.0.1 \
+    crate://crates.io/zbus/5.18.0 \
+    crate://crates.io/zbus_macros/5.18.0 \
+    crate://crates.io/zbus_names/4.3.4 \
+    crate://crates.io/zerocopy/0.8.55 \
+    crate://crates.io/zerocopy-derive/0.8.55 \
+    crate://crates.io/zmij/1.0.23 \
     crate://crates.io/zune-core/0.5.1 \
     crate://crates.io/zune-inflate/0.2.54 \
-    crate://crates.io/zune-jpeg/0.5.12 \
-    crate://crates.io/zvariant/5.10.0 \
-    crate://crates.io/zvariant_derive/5.10.0 \
-    crate://crates.io/zvariant_utils/3.3.0 \
+    crate://crates.io/zune-jpeg/0.5.15 \
+    crate://crates.io/zvariant/5.13.1 \
+    crate://crates.io/zvariant_derive/5.13.1 \
+    crate://crates.io/zvariant_utils/3.5.0 \
 "
=20
 SRC_URI[adler2-2.0.1.sha256sum] =3D "320119579fcad9c21884f5c4861d16174d0=
e06250625266f50fe6898340abefa"
 SRC_URI[ahash-0.8.12.sha256sum] =3D "5a15f179cd60c4584b8a8c596927aadc462=
e27f2ca70c04e0071964a73ba7a75"
 SRC_URI[aho-corasick-1.1.4.sha256sum] =3D "ddd31a130427c27518df266943a53=
08ed92d4b226cc639f5a8f1002816174301"
+SRC_URI[aliasable-0.1.3.sha256sum] =3D "250f629c0161ad8107cf89319e990051=
fae62832fd343083bea452d93e2205fd"
+SRC_URI[alloca-0.4.0.sha256sum] =3D "e5a7d05ea6aea7e9e64d25b9156ba2fee3f=
dd659e34e41063cd2fc7cd020d7f4"
 SRC_URI[allocator-api2-0.2.21.sha256sum] =3D "683d7910e743518b0e34f1186f=
92494becacb047c7b6bf616c96772180fef923"
 SRC_URI[android_system_properties-0.1.5.sha256sum] =3D "819e7219dbd41043=
ac279b19830f2efc897156490d7fd6ea916720117ee66311"
-SRC_URI[anyhow-1.0.102.sha256sum] =3D "7f202df86484c868dbad7eaa557ef785d=
5c66295e41b460ef922eca0723b842c"
+SRC_URI[anes-0.1.6.sha256sum] =3D "4b46cbb362ab8752921c97e041f5e366ee629=
7bd428a31275b9fcf1e380f7299"
+SRC_URI[anstyle-1.0.14.sha256sum] =3D "940b3a0ca603d1eade50a4846a2afffd5=
ef57a9feac2c0e2ec2e14f9ead76000"
 SRC_URI[approx-0.5.1.sha256sum] =3D "cab112f0a86d568ea0e627cc1d6be74a1e9=
cd55214684db5561995f6dad897c6"
 SRC_URI[async-broadcast-0.7.2.sha256sum] =3D "435a87a52755b8f27fcf321ac4=
f04b2802e337c8c4872923137471ec39c37532"
 SRC_URI[async-channel-2.5.0.sha256sum] =3D "924ed96dd52d1b75e9c1a3e62757=
15fd320f5f9439fb5a4a11fa51f4221158d2"
@@ -323,265 +341,282 @@ SRC_URI[async-io-2.6.0.sha256sum] =3D "456b8a8feb=
6f42d237746d4b3e9a178494627745c3c
 SRC_URI[async-lock-3.4.2.sha256sum] =3D "290f7f2596bd5b78a9fec8088ccd891=
80d7f9f55b94b0576823bbbdc72ee8311"
 SRC_URI[async-process-2.5.0.sha256sum] =3D "fc50921ec0055cdd8a16de48773b=
feec5c972598674347252c0399676be7da75"
 SRC_URI[async-recursion-1.1.1.sha256sum] =3D "3b43422f69d8ff38f95f1b2bb7=
6517c91589a924d1559a0e935d7c8ce0274c11"
-SRC_URI[async-signal-0.2.13.sha256sum] =3D "43c070bbf59cd3570b6b2dd54cd7=
72527c7c3620fce8be898406dd3ed6adc64c"
+SRC_URI[async-signal-0.2.14.sha256sum] =3D "52b5aaafa020cf5053a01f2a60e8=
ff5dccf550f0f77ec54a4e47285ac2bab485"
 SRC_URI[async-task-4.7.1.sha256sum] =3D "8b75356056920673b02621b35afd0f7=
dda9306d03c79a30f5c56c44cf256e3de"
-SRC_URI[async-trait-0.1.89.sha256sum] =3D "9035ad2d096bed7955a320ee7e223=
0574d28fd3c3a0f186cbea1ff3c7eed5dbb"
+SRC_URI[async-trait-0.1.91.sha256sum] =3D "ae36dc4177970ef04fde5178d3e24=
29882def40e57a451f919c098f72baa6cec"
 SRC_URI[atomic-waker-1.1.2.sha256sum] =3D "1505bd5d3d116872e7271a6d4e16d=
81d0c8570876c8de68093a09ac269d8aac0"
-SRC_URI[autocfg-1.5.0.sha256sum] =3D "c08606f8c3cbf4ce6ec8e28fb0014a2c08=
6708fe954eaa885384a6165172e7e8"
+SRC_URI[autocfg-1.5.1.sha256sum] =3D "f2032f911046de80f0a198e0901378627c=
33f59ea0ac00e363d481118bd70a53"
 SRC_URI[bit_field-0.10.3.sha256sum] =3D "1e4b40c7323adcfc0a41c4b88143ed5=
8346ff65a288fc144329c5c45e05d70c6"
-SRC_URI[bitflags-2.11.0.sha256sum] =3D "843867be96c8daad0d758b57df9392b6=
d8d271134fce549de6ce169ff98a92af"
+SRC_URI[bitflags-1.3.2.sha256sum] =3D "bef38d45163c2f1dde094a7dfd33ccf59=
5c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bitflags-2.13.1.sha256sum] =3D "b588b76d00fde79687d7646a9b5bdf3c=
c0f655e0bbd080335a95d7e96f3587da"
 SRC_URI[bitreader-0.3.11.sha256sum] =3D "886559b1e163d56c765bc3a985febb4=
eee8009f625244511d8ee3c432e08c066"
 SRC_URI[blocking-1.6.2.sha256sum] =3D "e83f8d02be6967315521be875afa792a3=
16e28d57b5a2d401897e2a7921b7f21"
-SRC_URI[bon-3.9.0.sha256sum] =3D "2d13a61f2963b88eef9c1be03df65d42f6996d=
feac1054870d950fcf66686f83"
-SRC_URI[bon-macros-3.9.0.sha256sum] =3D "d314cc62af2b6b0c65780555abb4d02=
a03dd3b799cd42419044f0c38d99738c0"
-SRC_URI[bumpalo-3.20.2.sha256sum] =3D "5d20789868f4b01b2f2caec9f5c4e0213=
b41e3e5702a50157d699ae31ced2fcb"
-SRC_URI[bytemuck-1.25.0.sha256sum] =3D "c8efb64bd706a16a1bdde310ae86b351=
e4d21550d98d056f22f8a7f7a2183fec"
+SRC_URI[bon-3.9.3.sha256sum] =3D "a602c73c7b0148ec6d12af6fd5cc7a46e2eacc=
8878271a999abac56eed12f561"
+SRC_URI[bon-macros-3.9.3.sha256sum] =3D "6dee98b0db6a962de883bf5d20362de=
e4d7ca0d12fe39a7c6c73c844e1cd7c1f"
+SRC_URI[bumpalo-3.20.3.sha256sum] =3D "72f5acc6cb2ba439de613abc23857ec3d=
78374d8ed5ac84e9d11336e87da8649"
+SRC_URI[bytemuck-1.25.2.sha256sum] =3D "95832e849adfb21180ccb6826a99da14=
e5d266ae5c2e668e1602cf234f153797"
 SRC_URI[byteorder-1.5.0.sha256sum] =3D "1fd0f2584146f6f2ef48085050886acf=
353beff7305ebd1ae69500e27c67f64b"
 SRC_URI[byteorder-lite-0.1.0.sha256sum] =3D "8f1fe948ff07f4bd06c30984e69=
f5b4899c516a3ef74f34df92a2df2ab535495"
-SRC_URI[bytes-1.11.1.sha256sum] =3D "1e748733b7cbc798e1434b6ac524f0c1ff2=
ab456fe201501e6497c8417a4fc33"
+SRC_URI[bytes-1.12.1.sha256sum] =3D "fc652a48c352aef3ea3aed32080501cf3ef=
6ed5da78602a020c991775b0aff04"
 SRC_URI[cairo-rs-0.22.0.sha256sum] =3D "5cc8d9aa793480744cd9a0524fef1a2e=
197d9eaa0f739cde19d16aba530dcb95"
 SRC_URI[cairo-sys-rs-0.22.0.sha256sum] =3D "f8b4985713047f5faee02b8db6a6=
ef32bbb50269ff53c1aee716d1d195b76d54"
-SRC_URI[cc-1.2.56.sha256sum] =3D "aebf35691d1bfb0ac386a69bac2fde4dd276fb=
618cf8bf4f5318fe285e821bb2"
-SRC_URI[cfg-expr-0.20.7.sha256sum] =3D "3c6b04e07d8080154ed4ac03546d9a2b=
303cc2fe1901ba0b35b301516e289368"
+SRC_URI[cast-0.3.0.sha256sum] =3D "37b2a672a2cb129a2e41c10b1224bb368f9f3=
7a2b16b612598138befd7b37eb5"
+SRC_URI[cc-1.4.0.sha256sum] =3D "5add81bb678e6cb321aff7fa0dc7689ad82b112=
dbc032cea19f91d6b8e3582b9"
+SRC_URI[cfg-expr-0.20.8.sha256sum] =3D "fb693542bcafa528e198be0ebd9d3632=
ca5b7c93dbe7237460e199910835997c"
 SRC_URI[cfg-if-1.0.4.sha256sum] =3D "9330f8b2ff13f34540b44e946ef35111825=
727b38d33286ef986142615121801"
-SRC_URI[cfg_aliases-0.2.1.sha256sum] =3D "613afe47fcd5fac7ccf1db93babcb0=
82c5994d996f20b8b159f2ad1658eb5724"
-SRC_URI[chrono-0.4.44.sha256sum] =3D "c673075a2e0e5f4a1dde27ce9dee1ea455=
8c7ffe648f576438a20ca1d2acc4b0"
+SRC_URI[cfg_aliases-0.2.2.sha256sum] =3D "f079e83a288787bcd14a6aea84cee5=
c87a67c5a3e660c30f557a3d24761b3527"
+SRC_URI[chrono-0.4.45.sha256sum] =3D "1aa79e62e7697b8e29b513a68abacf485a=
dcd1fe8284a4316c5ae868e6633327"
+SRC_URI[ciborium-0.2.2.sha256sum] =3D "42e69ffd6f0917f5c029256a24d0161db=
17cea3997d185db0d35926308770f0e"
+SRC_URI[ciborium-io-0.2.2.sha256sum] =3D "05afea1e0a06c9be33d539b876f1ce=
3692f4afea2cb41f740e7743225ed1c757"
+SRC_URI[ciborium-ll-0.2.2.sha256sum] =3D "57663b653d948a338bfb3eeba9bb2f=
d5fcfaecb9e199e87e1eda4d9e8b240fd9"
+SRC_URI[clap-4.6.4.sha256sum] =3D "d91e0c145792ef73a6ad36d27c75ac09f1832=
222a3c209689d90f534685ee5b7"
+SRC_URI[clap_builder-4.6.2.sha256sum] =3D "f09628afdcc538b57f3c6341e9c8e=
9970f18e4a481690a64974d7023bd33548b"
+SRC_URI[clap_lex-1.1.0.sha256sum] =3D "c8d4a3bb8b1e0c1050499d1815f5ab16d=
04f0959b233085fb31653fbfc9d98f9"
 SRC_URI[color_quant-1.1.0.sha256sum] =3D "3d7b894f5411737b7867f482795592=
4d7c254fc9f4d91a6aad6b097804b1018b"
 SRC_URI[concurrent-queue-2.5.0.sha256sum] =3D "4ca0197aee26d1ae37445ee53=
2fefce43251d24cc7c166799f4d46817f1d3973"
 SRC_URI[core-foundation-sys-0.8.7.sha256sum] =3D "773648b94d0e5d620f64f2=
80777445740e61fe701025087ec8b57f45c791888b"
 SRC_URI[crc32fast-1.5.0.sha256sum] =3D "9481c1c90cbf2ac953f07c8d4a58aa39=
45c425b7185c9154d67a65e4230da511"
-SRC_URI[crossbeam-deque-0.8.6.sha256sum] =3D "9dd111b7b7f7d55b72c0a6ae36=
1660ee5853c9af73f70c3c2ef6858b950e2e51"
-SRC_URI[crossbeam-epoch-0.9.18.sha256sum] =3D "5b82ac4a3c2ca9c3460964f02=
0e1402edd5753411d7737aa39c3714ad1b5420e"
-SRC_URI[crossbeam-utils-0.8.21.sha256sum] =3D "d0a5c400df2834b80a4c3327b=
3aad3a4c4cd4de0629063962b03235697506a28"
+SRC_URI[criterion-0.8.2.sha256sum] =3D "950046b2aa2492f9a536f5f4f9a3de7b=
9e2476e575e05bd6c333371add4d98f3"
+SRC_URI[criterion-plot-0.8.2.sha256sum] =3D "d8d80a2f4f5b554395e47b5d830=
5bc3d27813bacb73493eb1001e8f76dae29ea"
+SRC_URI[crossbeam-deque-0.8.7.sha256sum] =3D "5181e0de7b61eb03a81e347d6d=
d8797bae9da5146707b51077e2d71a54ec0ceb"
+SRC_URI[crossbeam-epoch-0.9.20.sha256sum] =3D "2d6914041f254d6e9176c0194=
1b21115dcfb7089e55135a35411081bd106ef3f"
+SRC_URI[crossbeam-utils-0.8.22.sha256sum] =3D "61803da095bee82a81bb1a452=
ecc25d3b2f1416d1897eb86430c6159ef717c17"
 SRC_URI[crunchy-0.2.4.sha256sum] =3D "460fbee9c2c2f33933d720630a6a0bac33=
ba7053db5344fac858d4b8952d77d5"
 SRC_URI[darling-0.23.0.sha256sum] =3D "25ae13da2f202d56bd7f91c25fba009e7=
717a1e4a1cc98a76d844b65ae912e9d"
 SRC_URI[darling_core-0.23.0.sha256sum] =3D "9865a50f7c335f53564bb694ef66=
0825eb8610e0a53d3e11bf1b0d3df31e03b0"
 SRC_URI[darling_macro-0.23.0.sha256sum] =3D "ac3984ec7bd6cfa798e62b4a642=
426a5be0e68f9401cfc2a01e3fa9ea2fcdb8d"
+SRC_URI[defmt-1.1.1.sha256sum] =3D "e2953bfe4f93bbd20cc71198842756f77d16=
1884c99ebbabc41d80231ded88d1"
+SRC_URI[defmt-macros-1.1.1.sha256sum] =3D "bad9c72e7ca2137e0dc3813245a0d=
282fd6daad32fd800af018306a9169b5fe8"
+SRC_URI[defmt-parser-1.0.0.sha256sum] =3D "10d60334b3b2e7c9d91ef8150abfb=
6fa4c1c39ebbcf4a81c2e346aad939fee3e"
 SRC_URI[dlib-0.5.3.sha256sum] =3D "ab8ecd87370524b461f8557c119c405552c39=
6ed91fc0a8eec68679eab26f94a"
-SRC_URI[dunce-1.0.5.sha256sum] =3D "92773504d58c093f6de2459af4af33faa518=
c13451eb8f2b5698ed3d36e7c813"
-SRC_URI[either-1.15.0.sha256sum] =3D "48c757948c5ede0e46177b7add2e67155f=
70e33c07fea8284df6576da70b3719"
+SRC_URI[either-1.17.0.sha256sum] =3D "9e5e8f6c15a24b9a3ee5efec809ccd006d=
3b30e8b3bb63c39af737c7f87daa1d"
 SRC_URI[encoding_rs-0.8.35.sha256sum] =3D "75030f3c4f45dafd7586dd6780965=
a8c7e8e285a5ecb86713e63a79c5b2766f3"
 SRC_URI[endi-1.1.1.sha256sum] =3D "66b7e2430c6dff6a955451e2cfc438f09cea1=
965a9d6f87f7e3b90decc014099"
 SRC_URI[enumflags2-0.7.12.sha256sum] =3D "1027f7680c853e056ebcec683615fb=
6fbbc07dbaa13b4d5d9442b146ded4ecef"
 SRC_URI[enumflags2_derive-0.7.12.sha256sum] =3D "67c78a4d8fdf9953a5c9d45=
8f9efe940fd97a0cab0941c075a813ac594733827"
 SRC_URI[enumn-0.1.14.sha256sum] =3D "2f9ed6b3789237c8a0c1c505af1c7eb2c56=
0df6186f01b098c3a1064ea532f38"
-SRC_URI[env_filter-1.0.0.sha256sum] =3D "7a1c3cc8e57274ec99de65301228b53=
7f1e4eedc1b8e0f9411c6caac8ae7308f"
-SRC_URI[env_logger-0.11.9.sha256sum] =3D "b2daee4ea451f429a58296525ddf28=
b45a3b64f1acf6587e2067437bb11e218d"
+SRC_URI[env_filter-2.0.0.sha256sum] =3D "900d271a03799a1ee8d1ca9b19893b4=
8ca674a9284fefcfb85f05e74ed314217"
+SRC_URI[env_logger-0.11.11.sha256sum] =3D "de671bd27a75a797dc9ae289ba1e7=
7276e75e2026408aab65185384e2d5cd3f6"
 SRC_URI[equivalent-1.0.2.sha256sum] =3D "877a4ace8713b0bcf2a4e7eec82529c=
029f1d0619886d18145fea96c3ffe5c0f"
 SRC_URI[errno-0.3.14.sha256sum] =3D "39cab71617ae0d63f51a36d69f866391735=
b51691dbda63cf6f96d042b63efeb"
-SRC_URI[event-listener-5.4.1.sha256sum] =3D "e13b66accf52311f30a0db42147=
dadea9850cb48cd070028831ae5f5d4b856ab"
+SRC_URI[event-listener-5.4.2.sha256sum] =3D "5a23add41df1562121a9393cb06=
5eab5146a1242410f23a644851e90cfd669d2"
 SRC_URI[event-listener-strategy-0.5.4.sha256sum] =3D "8be9f3dfaaffdae297=
2880079a491a1a8bb7cbed0b8dd7a347f668b4150a3b93"
-SRC_URI[exr-1.74.0.sha256sum] =3D "4300e043a56aa2cb633c01af81ca8f699a321=
879a7854d3896a0ba89056363be"
-SRC_URI[fallible_collections-0.5.1.sha256sum] =3D "8b3e85d14d419ba3e1db9=
25519461c0d17a49bdd2d67ea6316fa965ca7acdf74"
-SRC_URI[fastrand-2.3.0.sha256sum] =3D "37909eebbb50d72f9059c3b6d82c0463f=
2ff062c9e95845c43a6c9c0355411be"
-SRC_URI[fax-0.2.6.sha256sum] =3D "f05de7d48f37cd6730705cbca900770cab77a8=
9f413d23e100ad7fad7795a0ab"
-SRC_URI[fax_derive-0.2.0.sha256sum] =3D "a0aca10fb742cb43f9e7bb8467c91aa=
9bcb8e3ffbc6a6f7389bb93ffc920577d"
+SRC_URI[exr-1.74.2.sha256sum] =3D "711fe42c9964295e01ee3fba3f9fe0e1d24b9=
8886950d68efe81b1c76e21adf3"
+SRC_URI[fallible_collections-0.5.2.sha256sum] =3D "dab93c7205280c4785c44=
517fe84d99751b81f6deb8450cb196da6be88e332bb"
+SRC_URI[fastrand-2.5.0.sha256sum] =3D "da7c62ceae207dd37ea5b845da6a0696c=
799f85e97da1ab5b7910be3c1c80223"
+SRC_URI[fax-0.2.7.sha256sum] =3D "caf1079563223d5d59d83c85886a56e586cfd5=
c1a26292e971a0fa266531ac5a"
 SRC_URI[fdeflate-0.3.7.sha256sum] =3D "1e6853b52649d4ac5c0bd02320cddc5ba=
956bdb407c4b75a2c6b75bf51500f8c"
-SRC_URI[fearless_simd-0.3.0.sha256sum] =3D "8fb2907d1f08b2b316b9223ced5b=
0e89d87028ba8deae9764741dba8ff7f3903"
+SRC_URI[fearless_simd-0.4.1.sha256sum] =3D "b97b65636e5b9ef369943878ac74=
335ba1c55c1cb6adbf1e2c293c624248d693"
 SRC_URI[find-msvc-tools-0.1.9.sha256sum] =3D "5baebc0774151f905a1a2cc419=
89300b1e6fbb29aff0ceffa1064fdd3088d582"
 SRC_URI[flate2-1.1.9.sha256sum] =3D "843fba2746e448b37e26a819579957415c8=
cef339bf08564fe8b7ddbd959573c"
-SRC_URI[foldhash-0.1.5.sha256sum] =3D "d9c4f5dac5e15c24eb999c26181a6ca40=
b39fe946cbe4c263c7209467bc83af2"
-SRC_URI[foreign-types-0.5.0.sha256sum] =3D "d737d9aa519fb7b749cbc3b962ed=
cf310a8dd1f4b67c91c4f83975dbdd17d965"
-SRC_URI[foreign-types-macros-0.2.3.sha256sum] =3D "1a5c6c585bc94aaf2c7b5=
1dd4c2ba22680844aba4c687be581871a6f518c5742"
-SRC_URI[foreign-types-shared-0.3.1.sha256sum] =3D "aa9a19cbb55df58761df4=
9b23516a86d432839add4af60fc256da840f66ed35b"
 SRC_URI[four-cc-0.4.0.sha256sum] =3D "795cbfc56d419a7ce47ccbb7504dd9a5b7=
c484c083c356e797de08bd988d9629"
-SRC_URI[futures-channel-0.3.32.sha256sum] =3D "07bbe89c50d7a535e539b8c17=
bc0b49bdb77747034daa8087407d655f3f7cc1d"
-SRC_URI[futures-core-0.3.32.sha256sum] =3D "7e3450815272ef58cec6d564423f=
6e755e25379b217b0bc688e295ba24df6b1d"
-SRC_URI[futures-executor-0.3.32.sha256sum] =3D "baf29c38818342a3b26b5b92=
3639e7b1f4a61fc5e76102d4b1981c6dc7a7579d"
-SRC_URI[futures-io-0.3.32.sha256sum] =3D "cecba35d7ad927e23624b22ad55235=
f2239cfa44fd10428eecbeba6d6a717718"
+SRC_URI[futures-channel-0.3.33.sha256sum] =3D "262590f4fe6afeb0bc83be1da=
a64e52657fe185690a958af7f3ad0e92085c5ae"
+SRC_URI[futures-core-0.3.33.sha256sum] =3D "2cd50c473c80f6d7c3670a752354=
b8e569b1a7cbfdc0419ec88e5edad85e0dc7"
+SRC_URI[futures-executor-0.3.33.sha256sum] =3D "6754879cc9f2c66f88c6e5c3=
5344bb0bdb0708b0352b1201815667c7eabc7458"
+SRC_URI[futures-io-0.3.33.sha256sum] =3D "4577ecaa3c4f96589d473f679a71b5=
96316f6641bc350038b962a5daf0085d7a"
 SRC_URI[futures-lite-2.6.1.sha256sum] =3D "f78e10609fe0e0b3f4157ffab1876=
319b5b0db102a2c60dc4626306dc46b44ad"
-SRC_URI[futures-macro-0.3.32.sha256sum] =3D "e835b70203e41293343137df5c0=
664546da5745f82ec9b84d40be8336958447b"
-SRC_URI[futures-task-0.3.32.sha256sum] =3D "037711b3d59c33004d3856fbdc83=
b99d4ff37a24768fa1be9ce3538a1cde4393"
-SRC_URI[futures-timer-3.0.3.sha256sum] =3D "f288b0a4f20f9a56b5d1da57e222=
7c661b7b16168e2f72365f57b63326e29b24"
-SRC_URI[futures-util-0.3.32.sha256sum] =3D "389ca41296e6190b48053de0321d=
02a77f32f8a5d2461dd38762c0593805c6d6"
+SRC_URI[futures-macro-0.3.33.sha256sum] =3D "2d6d3cde68c518367be28956066=
ddfef33813991b77a55005a69dae04bf3b10b"
+SRC_URI[futures-sink-0.3.33.sha256sum] =3D "e34418ac499d6305c2fb5ad0ed2f=
6ac998c5f8ca209b4510f7f94242c647e307"
+SRC_URI[futures-task-0.3.33.sha256sum] =3D "b231ed28831efb4a61a08580c4bc=
233ec56bc009f4cd8f52da2c3cb97df0c109"
+SRC_URI[futures-timer-3.0.4.sha256sum] =3D "af43fadb8a98512d547e37b4e92e=
0ced13e205c061b87b4623eff01d918d6968"
+SRC_URI[futures-util-0.3.33.sha256sum] =3D "a77a90a256fce34da66415271e30=
f94ee91c57b04b8a2c042d9cf3220179deaa"
 SRC_URI[gdk-pixbuf-0.22.0.sha256sum] =3D "25f420376dbee041b2db374ce45738=
92a36222bb3f6c0c43e24f0d67eae9b646"
 SRC_URI[gdk-pixbuf-sys-0.22.0.sha256sum] =3D "48f31b37b1fc4b48b54f6b91b7=
ef04c18e00b4585d98359dd7b998774bbd91fb"
-SRC_URI[gdk4-0.11.0.sha256sum] =3D "2e9a95621b043a35e70ea9f6da89e1a47165=
8ee5771258874f000a11f6a9cb89"
-SRC_URI[gdk4-sys-0.11.0.sha256sum] =3D "4d322515677e4a12e10efe7e758743c3=
e5faa56940237f19ba6890ba8edbbb76"
+SRC_URI[gdk4-0.11.4.sha256sum] =3D "d81e2a6c6ecba2aab60633a98df1868b03fa=
0bfdce8105edc27c1bccf71f0e39"
+SRC_URI[gdk4-sys-0.11.4.sha256sum] =3D "3d8f608d8d7d229975c4d0d026f5d307=
1598c4ddab3c5262b0a31840fec78d13"
 SRC_URI[getopts-0.2.24.sha256sum] =3D "cfe4fbac503b8d1f88e6676011885f34b=
7174f46e59956bba534ba83abded4df"
-SRC_URI[getrandom-0.3.4.sha256sum] =3D "899def5c37c4fd7b2664648c28120ece=
c138e4d395b459e5ca34f9cce2dd77fd"
-SRC_URI[getrandom-0.4.1.sha256sum] =3D "139ef39800118c7683f2fd3c98c1b23c=
09ae076556b435f8e9064ae108aaeeec"
-SRC_URI[gif-0.14.1.sha256sum] =3D "f5df2ba84018d80c213569363bdcd0c64e693=
3c67fe4c1d60ecf822971a3c35e"
-SRC_URI[gio-0.22.2.sha256sum] =3D "816b6743c46b217aa8fba679095ac6f2162fd=
53259dc8f186fcdbff9c555db03"
-SRC_URI[gio-sys-0.22.0.sha256sum] =3D "64729ba2772c080448f9f966dba8f4456=
beeb100d8c28a865ef8a0f2ef4987e1"
-SRC_URI[gio-unix-0.22.0.sha256sum] =3D "69db2f0bb80c9d97c315720c395db76d=
4649969bce3a130aea6c5c9d757bf80f"
+SRC_URI[getrandom-0.4.3.sha256sum] =3D "300e883d756b2e4ec94e02791f39b04b=
522276138852cfc41d9fb7e904106099"
+SRC_URI[gif-0.14.2.sha256sum] =3D "ee8cfcc411d9adbbaba82fb72661cc1bcca13=
e8bba98b364e62b2dba8f960159"
+SRC_URI[gio-0.22.8.sha256sum] =3D "8b3e1f669909c326b9413bde5a742097b8c90=
a7d78f45326db13668984769ded"
+SRC_URI[gio-sys-0.22.8.sha256sum] =3D "353fdc7da7cd16da916104b1e0e4e7de3=
80ec9c8aaa20d4d742d66310ab4b0d5"
+SRC_URI[gio-unix-0.22.8.sha256sum] =3D "ce8d768735e229742c135afa3d332660=
4088d2df0679901cdb05e791fe2fbe0a"
 SRC_URI[gio-unix-sys-0.22.0.sha256sum] =3D "44bab97ce39112040216e268f074=
645f50b31caeb53af708ab5d7e4e67f0dbfd"
-SRC_URI[glib-0.22.2.sha256sum] =3D "16877c6e619447e0bcb6de326a42a8bd02b3=
6328cfeeda210135425e576efa3d"
-SRC_URI[glib-macros-0.22.2.sha256sum] =3D "bda575994e3689b1bc12f89c3df62=
1ead46ff292623b76b4710a3a5b79be54bb"
-SRC_URI[glib-sys-0.22.0.sha256sum] =3D "48073e3b228419faa80b9b7f7122759d=
4ab2f44cd52a065fde7ca08f34c03147"
-SRC_URI[gobject-sys-0.22.0.sha256sum] =3D "18eda93f09d3778f38255b231b17e=
f67195013a592c91624a4daf8bead875565"
-SRC_URI[gufo-0.4.1.sha256sum] =3D "99a86855fe55303654418ebd8b07312057a32=
b5887fb768a38170fd54ed944db"
-SRC_URI[gufo-common-1.1.0.sha256sum] =3D "9f23bc0d0e791259ce4fe703c4d988=
c64317e33477bc4d1d7526ab8eb9fcaab6"
-SRC_URI[gufo-exif-0.4.0.sha256sum] =3D "ad61fccc591119491879e7bee63ebbfb=
d27811b35367b4728a857119fde78843"
-SRC_URI[gufo-jpeg-0.4.0.sha256sum] =3D "5606b919ea2538d6e761781be87eaf51=
86427c3d64849c1013359aa3681e68d2"
-SRC_URI[gufo-png-0.4.1.sha256sum] =3D "aa9d6a919b2c9f4b5f344bf0e2991b08b=
23ab69ab336b65195657a6c624fb8a5"
-SRC_URI[gufo-tiff-0.4.0.sha256sum] =3D "51743619d12e8ead9fdd3cdd2ad3d0ed=
994a538542857f5115d74d6547a0083b"
-SRC_URI[gufo-webp-0.4.0.sha256sum] =3D "218ea90042f1766b38b487dfbb261b6f=
21636e5cfd570e1ac6709119dae92fe2"
-SRC_URI[gufo-xmp-0.4.0.sha256sum] =3D "020d604dbaf16f257f9d8bf7c11095510=
89be459ad8dc54c4205d28fe1688399"
+SRC_URI[glib-0.22.8.sha256sum] =3D "ddbcf514bd1881fc1b960e4e52b4e82873f4=
da3bceddbd58d42827b508888100"
+SRC_URI[glib-macros-0.22.6.sha256sum] =3D "506d23499707c7142898429757e8d=
9a3871d965239a2cb66dfa05052be6d6f19"
+SRC_URI[glib-sys-0.22.8.sha256sum] =3D "030967459f9f676851872c6304adea78=
25c6d462ec9b72554c733cf0c5952233"
+SRC_URI[gobject-sys-0.22.6.sha256sum] =3D "22a861859b887a79cf461359c192c=
97a57d8fb0229dd291232e57aa11f6fa72c"
+SRC_URI[gufo-0.5.0.sha256sum] =3D "6a16d7faeeb03e2925ac6b0f40630b15b1992=
d08c50add402f35fde495e44f64"
+SRC_URI[gufo-common-2.0.0.sha256sum] =3D "d583cdde9eb6985dbb6e596d27677e=
5d353d5eee44763cbf7c7ead3147d337bf"
+SRC_URI[gufo-exif-0.5.0.sha256sum] =3D "e99100988e312c22c6f209663b289e72=
7db3918d06fbcbbc2315149457b42b75"
+SRC_URI[gufo-jpeg-0.5.1.sha256sum] =3D "383907a5c532bff484b2914d649e368e=
98ce6426829458353fe40070225b07a5"
+SRC_URI[gufo-png-0.5.0.sha256sum] =3D "e5c3065acab6cf458afbe53f73462a0db=
f17348a2af3c889183f8714b3bff6fc"
+SRC_URI[gufo-svg-0.5.0.sha256sum] =3D "c536908b63d5952fa5e8ebdfaff406b92=
bb8096d3cbbd402afd112340383ad93"
+SRC_URI[gufo-tiff-0.5.0.sha256sum] =3D "e9c77c38e7815b76e08b1943dc67517e=
02543504c14a29e071a4ddf9bee111ec"
+SRC_URI[gufo-webp-0.5.0.sha256sum] =3D "04d6d3dc0ccd22a30619df68ce347c84=
4d8adb49b822f42660d9a92e6ae14540"
+SRC_URI[gufo-xmp-0.5.0.sha256sum] =3D "903aaa13213b860bbad3565e62f3fbd10=
87ca9404692ebe53728654653470561"
 SRC_URI[half-2.7.1.sha256sum] =3D "6ea2d84b969582b4b1864a92dc5d27cd2b77b=
622a8d79306834f1be5ba20d84b"
 SRC_URI[hashbrown-0.14.5.sha256sum] =3D "e5274423e17b7c9fc20b6e7e208532f=
9b19825d82dfd615708b70edd83df41f1"
-SRC_URI[hashbrown-0.15.5.sha256sum] =3D "9229cfe53dfd69f0609a49f65461bd9=
3001ea1ef889cd5529dd176593f5338a1"
-SRC_URI[hashbrown-0.16.1.sha256sum] =3D "841d1cc9bed7f9236f321df97703037=
3f4a4163ae1a7dbfe1a51a2c1a51d9100"
-SRC_URI[hayro-jpeg2000-0.3.4.sha256sum] =3D "c1a74cfc18c0093ef8009a0d6c1=
ba3024df0cce228503a14c1372e1e23eed43e"
+SRC_URI[hashbrown-0.17.1.sha256sum] =3D "ed5909b6e89a2db4456e54cd5f67379=
1d7eca6732202bbf2a9cc504fe2f9b84a"
+SRC_URI[hayro-jpeg2000-0.3.5.sha256sum] =3D "c75ab947623ef4ccaa7acf0579e=
df7cbb5a73838e3839a7be73335e522f433a1"
+SRC_URI[heck-0.4.1.sha256sum] =3D "95505c38b4572b2d910cecb0281560f54b440=
a19336cbbcb27bf6ce6adc6f5a8"
 SRC_URI[heck-0.5.0.sha256sum] =3D "2304e00983f87ffb38b55b444b5e3b60a884b=
5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[hermit-abi-0.5.2.sha256sum] =3D "fc0fef456e4baa96da950455cd02c08=
1ca953b141298e41db3fc7e36b1da849c"
 SRC_URI[hex-0.4.3.sha256sum] =3D "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e=
486a595ed5fd8f86ba55232a70"
 SRC_URI[iana-time-zone-0.1.65.sha256sum] =3D "e31bc9ad994ba00e440a8aa5c9=
ef0ec67d5cb5e5cb0cc7f8b744a35b389cc470"
 SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] =3D "f31827a206f56af32e590=
ba56d5d2d085f558508192593743f16b2306495269f"
-SRC_URI[id-arena-2.3.0.sha256sum] =3D "3d3067d79b975e8844ca9eb072e16b31c=
3c1c36928edf9c6789548c524d0d954"
 SRC_URI[ident_case-1.0.1.sha256sum] =3D "b9e0384b61958566e926dc50660321d=
12159025e767c18e043daf26b70104c39"
 SRC_URI[image-0.25.10.sha256sum] =3D "85ab80394333c02fe689eaf900ab500fbd=
0c2213da414687ebf995a65d5a6104"
-SRC_URI[image-extras-0.1.0.sha256sum] =3D "86d29ba92ef6970a2685cc758b455=
d190842b8b9e96c865ffd31cdb9954b7548"
+SRC_URI[image-extras-0.1.1.sha256sum] =3D "60d02eb2c9ccbbab470538fce34c7=
bc3be7b4e59268e65a3171367b296cdb842"
 SRC_URI[image-webp-0.2.4.sha256sum] =3D "525e9ff3e1a4be2fbea1fdf0e98686a=
6d98b4d8f937e1bf7402245af1909e8c3"
-SRC_URI[indexmap-2.13.0.sha256sum] =3D "7714e70437a7dc3ac8eb7e6f8df75fd8=
eb422675fc7678aff7364301092b1017"
-SRC_URI[itoa-1.0.17.sha256sum] =3D "92ecc6618181def0457392ccd0ee51198e06=
5e016d1d527a7ac1b6dc7c1f09d2"
-SRC_URI[jiff-0.2.23.sha256sum] =3D "1a3546dc96b6d42c5f24902af9e2538e82e3=
9ad350b0c766eb3fbf2d8f3d8359"
-SRC_URI[jiff-static-0.2.23.sha256sum] =3D "2a8c8b344124222efd714b73bb41f=
8b5120b27a7cc1c75593a6ff768d9d05aa4"
-SRC_URI[jobserver-0.1.34.sha256sum] =3D "9afb3de4395d6b3e67a780b6de64b51=
c978ecf11cb9a462c66be7d4ca9039d33"
+SRC_URI[indexmap-2.14.0.sha256sum] =3D "d466e9454f08e4a911e14806c24e16fb=
a1b4c121d1ea474396f396069cf949d9"
+SRC_URI[itertools-0.13.0.sha256sum] =3D "413ee7dfc52ee1a4949ceeb7dbc8a33=
f2d6c088194d9f922fb8318faf1f01186"
+SRC_URI[itoa-1.0.18.sha256sum] =3D "8f42a60cbdf9a97f5d2305f08a87dc4e0930=
8d1276d28c869c684d7777685682"
+SRC_URI[jiff-0.2.35.sha256sum] =3D "668b7183bd07af9a4885f5c35b0cc5c83c46=
07a913c16b7e17291832910d2dcc"
+SRC_URI[jiff-core-0.1.0.sha256sum] =3D "7feca88439efe53da3754500c1851ded=
f3cb36c524dd5cf8225cc0794de95d09"
+SRC_URI[jiff-static-0.2.35.sha256sum] =3D "3a69dcb3a21cfb32ce1cd05616933=
7ca284af0766dd766e7878819b251a49204"
 SRC_URI[jpeg-decoder-0.3.2.sha256sum] =3D "00810f1d8b74be64b13dbf3db89ac=
67740615d6c891f0e7b6179326533011a07"
-SRC_URI[jpeg-encoder-0.7.0.sha256sum] =3D "0b0b36cbb4e6704f12f5b5d7b01da=
c593982c6550859ebd5a66fb15c9ea27fd5"
-SRC_URI[jpegxl-rs-0.12.0+libjxl-0.11.1.sha256sum] =3D "4bc73de4d7188a80b=
adb62062780510e402a17947f663e50f6390ebb6e7b90ed"
-SRC_URI[jpegxl-sys-0.12.0+libjxl-0.11.1.sha256sum] =3D "d07cb5b362c69ced=
9ebfcdb3301dc6cadf7d186a3e6a3d8f4fcb9094a83ab408"
-SRC_URI[js-sys-0.3.91.sha256sum] =3D "b49715b7073f385ba4bc528e5747d02e66=
cb39c6146efb66b781f131f0fb399c"
+SRC_URI[jpeg-encoder-0.7.1.sha256sum] =3D "a0370574b86f7eca156b9f298392b=
5e69a23f8c86f3f865add60bbc2e79467a6"
+SRC_URI[jpegxl-rs-0.14.0+libjxl-0.11.2.sha256sum] =3D "9b7d16fe73fb6d2e1=
6b986392b716409c6ae6fabd35769d66bea391b016cdbc9"
+SRC_URI[jpegxl-sys-0.12.1+libjxl-0.11.2.sha256sum] =3D "00cb4f7ffb45ee43=
27e9ec6ca1a732f3abef470ee008f7d4be3afb414075cd7d"
+SRC_URI[js-sys-0.3.103.sha256sum] =3D "53b44bfcdb3f8d5837a46dae1ca9660a8=
37176eee74a28b229bc626816589102"
 SRC_URI[lazy_static-1.5.0.sha256sum] =3D "bbd2bcb4c963f2ddae06a2efc7e9f3=
591312473c50c6685e1f298068316e66fe"
-SRC_URI[lcms2-6.1.1.sha256sum] =3D "b75877b724685dd49310bdbadbf973fc69b1=
d01992a6d4a861b928fc3943f87b"
-SRC_URI[lcms2-sys-4.0.6.sha256sum] =3D "1c2604b23848ca80b2add60f0fb2270f=
d980e622c25029b6597fa01cfd5f8d5f"
-SRC_URI[leb128fmt-0.1.0.sha256sum] =3D "09edd9e8b54e49e587e4f6295a7d29c3=
ea94d469cb40ab8ca70b288248a81db2"
 SRC_URI[lebe-0.5.3.sha256sum] =3D "7a79a3332a6609480d7d0c9eab957bca6b455=
b91bb84e66d19f5ff66294b85b8"
-SRC_URI[libc-0.2.183.sha256sum] =3D "b5b646652bf6661599e1da8901b3b952289=
6f01e736bad5f723fe7a3a27f899d"
+SRC_URI[libc-0.2.189.sha256sum] =3D "3eaf3ede3fee6db1a4c2ee091bf8a8b4dcc=
dc6d17f656fb07896ee72867612f2"
 SRC_URI[libheif-rs-2.7.0.sha256sum] =3D "39c4e7037b43e1431961745e5c4004e=
edae3735a4fddd687810ff9d70beb9882"
-SRC_URI[libheif-sys-5.2.0+1.21.2.sha256sum] =3D "107c0d813a0cf5ddf7af2c5=
8a60611f18efdb2830e84d9b37580fb20e6e27a2b"
+SRC_URI[libheif-sys-5.3.0+1.23.0.sha256sum] =3D "5d2593dda939875015d3e1a=
9deccdb57381d4ef1fc9a96120731b25990579689"
 SRC_URI[libloading-0.8.9.sha256sum] =3D "d7c4b02199fee7c5d21a5ae7d8cfa79=
a6ef5bb2fc834d6e9058e89c825efdc55"
+SRC_URI[libm-0.2.16.sha256sum] =3D "b6d2cec3eae94f9f509c767b45932f1ada83=
50c4bdb85af2fcab4a3c14807981"
 SRC_URI[libopenraw-0.4.0-alpha.12.sha256sum] =3D "cb7af949edc773f32dd45f=
f5a0692860b619b03d2fa3741c1db1acfd1db3a553"
 SRC_URI[librsvg-rebind-0.3.0.sha256sum] =3D "8e29b54b27b49901092b20ef117=
7d42a068beec0ce5f3344a664118d586d2443"
 SRC_URI[librsvg-rebind-sys-0.3.0.sha256sum] =3D "4ab4a782ee37dfa57e9f03a=
169cc7ea652d20164e9e023f3df355d5d8b4e6c34"
 SRC_URI[libseccomp-0.4.0.sha256sum] =3D "0e5310a2c5b6ffbc094b5f70a2ca7b7=
9ed36ad90e6f90994b166489a1bce3fcc"
 SRC_URI[libseccomp-sys-0.3.0.sha256sum] =3D "60276e2d41bbb68b323e566047a=
1bfbf952050b157d8b5cdc74c07c1bf4ca3b6"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] =3D "32a66949e030da00e8c7d4434b2=
51670a91556f4144941d37452769c25d58a53"
-SRC_URI[log-0.4.29.sha256sum] =3D "5e5032e24019045c762d3c0f28f5b6b8bbf38=
563a65908389bf7978758920897"
+SRC_URI[log-0.4.33.sha256sum] =3D "0ceec5bc11778974d1bcb055b18002eba7f4b=
3518b6a0081b3af5f21666da9ad"
 SRC_URI[matchers-0.2.0.sha256sum] =3D "d1525a2a28c7f4fa0fc98bb91ae755d1e=
2d1505079e05539e35bc876b5d65ae9"
-SRC_URI[matrixmultiply-0.3.10.sha256sum] =3D "a06de3016e9fae57a36fd14dba=
131fccf49f74b40b7fbdb472f96e361ec71a08"
-SRC_URI[memchr-2.8.0.sha256sum] =3D "f8ca58f447f06ed17d5fc4043ce1b10dd20=
5e060fb3ce5b979b8ed8e59ff3f79"
-SRC_URI[memfd-0.6.5.sha256sum] =3D "ad38eb12aea514a0466ea40a80fd8cc83637=
065948eb4a426e4aa46261175227"
+SRC_URI[matrixmultiply-0.3.11.sha256sum] =3D "3f607c237553f086e7043417a5=
1df26b2eb899d3caff94e6a67592ff992fedc7"
+SRC_URI[memchr-2.8.3.sha256sum] =3D "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0=
c4beb022d3b367256b91b87513d98"
 SRC_URI[memmap2-0.9.11.sha256sum] =3D "d1219ed1b7f229ee7104d281dd01d6802=
fe28bb6e95d292942c4daacdeb798c0"
 SRC_URI[memoffset-0.9.1.sha256sum] =3D "488016bfae457b036d996092f6cb4486=
77611ce4449e970ceaf42695203f218a"
 SRC_URI[miniz_oxide-0.8.9.sha256sum] =3D "1fa76a2c86f704bdb222d66965fb3d=
63269ce38518b83cb0575fca855ebb6316"
-SRC_URI[miniz_oxide-0.9.0.sha256sum] =3D "5faa9f23e86bd5768d76def086192f=
f5f869fb088da12a976ea21e9796b975f6"
-SRC_URI[mio-1.1.1.sha256sum] =3D "a69bcab0ad47271a0234d9422b131806bf3968=
021e5dc9328caf2d4cd58557fc"
+SRC_URI[miniz_oxide-0.9.1.sha256sum] =3D "b63fbc4a50860e98e7b2aa7804ded1=
db5cbc3aff9193adaff57a6931bf7c4b4c"
+SRC_URI[mio-1.2.2.sha256sum] =3D "30d65c71f1ce40ab09135ce117d742b9f8a19f=
f91a41a8b57ed50bc2de59c427"
 SRC_URI[moxcms-0.8.1.sha256sum] =3D "bb85c154ba489f01b25c0d36ae69a87e4a1=
c73a72631fc6c0eb6dde34a73e44b"
 SRC_URI[multiversion-0.8.0.sha256sum] =3D "7edb7f0ff51249dfda9ab96b58236=
95e15a052dc15074c9dbf3d118afaf2c201"
 SRC_URI[multiversion-macros-0.8.0.sha256sum] =3D "b093064383341eb3271f42=
e381cb8f10a01459478446953953c75d24bd339fc0"
-SRC_URI[nalgebra-0.33.2.sha256sum] =3D "26aecdf64b707efd1310e3544d709c5c=
0ac61c13756046aaaba41be5c4f66a3b"
+SRC_URI[nalgebra-0.33.3.sha256sum] =3D "9d43ddcacf343185dfd6de2ee786d9e8=
b1c2301622afab66b6c73baf9882abfd"
 SRC_URI[nalgebra-macros-0.2.2.sha256sum] =3D "254a5372af8fc138e36684761d=
3c0cdb758a4410e938babcff1c860ce14ddbfc"
-SRC_URI[nix-0.30.1.sha256sum] =3D "74523f3a35e05aba87a1d978330aef40f67b0=
304ac79c1c00b294c9830543db6"
+SRC_URI[nix-0.31.3.sha256sum] =3D "cf20d2fde8ff38632c426f1165ed7436270b4=
4f199fc55284c38276f9db47c3d"
 SRC_URI[nu-ansi-term-0.50.3.sha256sum] =3D "7957b9740744892f114936ab4a57=
b3f487491bbeafaf8083688b16841a4240e5"
-SRC_URI[num-bigint-0.4.6.sha256sum] =3D "a5e44f723f1133c9deac646763579fd=
b3ac745e418f2a7af9cd0c431da1f20b9"
+SRC_URI[num-bigint-0.4.8.sha256sum] =3D "c89e69e7e0f03bea5ef08013795c250=
18e101932225a656383bd384495ecc367"
 SRC_URI[num-complex-0.4.6.sha256sum] =3D "73f88a1307638156682bada9d76041=
35552957b7818057dcef22705b4d509495"
 SRC_URI[num-integer-0.1.46.sha256sum] =3D "7969661fd2958a5cb096e56c8e1ad=
0444ac2bbcd0061bd28660485a44879858f"
 SRC_URI[num-rational-0.4.2.sha256sum] =3D "f83d14da390562dca69fc84082e73=
e548e1ad308d24accdedd2720017cb37824"
 SRC_URI[num-traits-0.2.19.sha256sum] =3D "071dfc062690e90b734c0b2273ce72=
ad0ffa95f0c74596bc250dcfd960262841"
-SRC_URI[num_enum-0.7.5.sha256sum] =3D "b1207a7e20ad57b847bbddc6776b96842=
0d38292bbfe2089accff5e19e82454c"
-SRC_URI[num_enum_derive-0.7.5.sha256sum] =3D "ff32365de1b6743cb203b71078=
8263c44a03de03802daf96092f2da4fe6ba4d7"
-SRC_URI[once_cell-1.21.3.sha256sum] =3D "42f5e15c9953c5e4ccceeb2e7382a71=
6482c34515315f7b03532b8b4e8393d2d"
+SRC_URI[num_enum-0.7.6.sha256sum] =3D "5d0bca838442ec211fa11de3a8b0e0e8f=
3a4522575b5c4c06ed722e005036f26"
+SRC_URI[num_enum_derive-0.7.6.sha256sum] =3D "680998035259dcfcafe653688b=
f2aa6d3e2dc05e98be6ab46afb089dc84f1df8"
+SRC_URI[once_cell-1.21.4.sha256sum] =3D "9f7c3e4beb33f85d45ae3e3a1792185=
706c8e16d043238c593331cc7cd313b50"
+SRC_URI[oorandom-11.1.5.sha256sum] =3D "d6790f58c7ff633d8771f42965289203=
411a5e5c68388703c06e14f24770b41e"
 SRC_URI[ordered-stream-0.2.0.sha256sum] =3D "9aa2b01e1d916879f73a53d01d1=
d6cee68adbb31d6d9177a8cfce093cced1d50"
-SRC_URI[pango-0.22.0.sha256sum] =3D "25d8f224eddef627b896d2f7b05725b3fae=
dbd140e0e8343446f0d34f34238ee"
+SRC_URI[ouroboros-0.18.5.sha256sum] =3D "1e0f050db9c44b97a94723127e6be76=
6ac5c340c48f2c4bb3ffa11713744be59"
+SRC_URI[ouroboros_macro-0.18.5.sha256sum] =3D "3c7028bdd3d43083f6d8d4d51=
87680d0d3560d54df4cc9d752005268b41e64d0"
+SRC_URI[page_size-0.6.0.sha256sum] =3D "30d5b2194ed13191c1999ae0704b7839=
fb18384fa22e49b57eeaa97d79ce40da"
+SRC_URI[pango-0.22.8.sha256sum] =3D "5d800d8d0de2ad5d0fb046f5344dbaba14a=
003cf3dd27cc21d85893d35ea316c"
 SRC_URI[pango-sys-0.22.0.sha256sum] =3D "bbd111a20ca90fedf03e09c59783c67=
9c00900f1d8491cca5399f5e33609d5d6"
 SRC_URI[parking-2.2.1.sha256sum] =3D "f38d5652c16fde515bb1ecef450ab0f6a2=
19d619a7274976324d5e377f7dceba"
 SRC_URI[paste-1.0.15.sha256sum] =3D "57c0d7b74b563b49d38dae00a0c37d4d6de=
9b432382b2892f0574ddcae73fd0a"
 SRC_URI[pin-project-lite-0.2.17.sha256sum] =3D "a89322df9ebe1c1578d689c9=
2318e070967d1042b512afbe49518723f4e6d5cd"
 SRC_URI[piper-0.2.5.sha256sum] =3D "c835479a4443ded371d6c535cbfd8d31ad92=
c5d23ae9770a61bc155e4992a3c1"
-SRC_URI[pkg-config-0.3.32.sha256sum] =3D "7edddbd0b52d732b21ad9a5fab5c70=
4c14cd949e5e9a1ec5929a24fded1b904c"
+SRC_URI[pkg-config-0.3.33.sha256sum] =3D "19f132c84eca552bf34cab8ec81f1c=
1dcc229b811638f9d283dceabe58c5569e"
+SRC_URI[plotters-0.3.7.sha256sum] =3D "5aeb6f403d7a4911efb1e33402027fc44=
f29b5bf6def3effcc22d7bb75f2b747"
+SRC_URI[plotters-backend-0.3.7.sha256sum] =3D "df42e13c12958a16b3f7f4386=
b9ab1f3e7933914ecea48da7139435263a4172a"
+SRC_URI[plotters-svg-0.3.7.sha256sum] =3D "51bae2ac328883f7acdfea3d66a7c=
35751187f870bc81f94563733a154d7a670"
 SRC_URI[png-0.18.1.sha256sum] =3D "60769b8b31b2a9f263dae2776c37b1b28ae24=
6943cf719eb6946a1db05128a61"
 SRC_URI[polling-3.11.0.sha256sum] =3D "5d0e4f59085d47d8241c88ead0f274e8a=
0cb551f3625263c05eb8dd897c34218"
-SRC_URI[portable-atomic-1.13.1.sha256sum] =3D "c33a9471896f1c69cecef8d20=
cbe2f7accd12527ce60845ff44c153bb2a21b49"
-SRC_URI[portable-atomic-util-0.2.5.sha256sum] =3D "7a9db96d7fa8782dd8c15=
ce32ffe8680bbd1e978a43bf51a34d39483540495f5"
+SRC_URI[portable-atomic-1.14.0.sha256sum] =3D "3d20d5497ef88037a52ff9826=
7d066e7f11fcc5e99bbfbd58a42336193aacec3"
+SRC_URI[portable-atomic-util-0.2.7.sha256sum] =3D "c2a106d1259c23fac8e54=
3272398ae0e3c0b8d33c88ed73d0cc71b0f1d902618"
 SRC_URI[prettyplease-0.2.37.sha256sum] =3D "479ca8adacdd7ce8f1fb39ce9ecc=
cbfe93a3f1344b3d0d97f20bc0196208f62b"
-SRC_URI[proc-macro-crate-3.4.0.sha256sum] =3D "219cb19e96be00ab2e37d6e29=
9658a0cfa83e52429179969b0f0121b4ac46983"
-SRC_URI[proc-macro2-1.0.106.sha256sum] =3D "8fd00f0bb2e90d81d1044c2b3261=
7f68fcb9fa3bb7640c23e9c748e53fb30934"
-SRC_URI[pxfm-0.1.28.sha256sum] =3D "b5a041e753da8b807c9255f28de81879c78c=
876392ff2469cde94799b2896b9d"
+SRC_URI[proc-macro-crate-3.5.0.sha256sum] =3D "e67ba7e9b2b56446f1d419b1d=
807906278ffa1a658a8a5d8a39dcb1f5a78614f"
+SRC_URI[proc-macro2-1.0.107.sha256sum] =3D "985e7ec9bb745e6ce6535b544d84=
d6cd6f7ad8bd711c398938ae983b91a766d9"
+SRC_URI[proc-macro2-diagnostics-0.10.1.sha256sum] =3D "af066a9c399a26e02=
0ada66a034357a868728e72cd426f3adcd35f80d88d88c8"
+SRC_URI[pulp-0.22.3.sha256sum] =3D "046aa45b989642ec2e4717c8e72d677b13ed=
d831a4d3b6cf37d9a3e54912496a"
+SRC_URI[pulp-wasm-simd-flag-0.1.1.sha256sum] =3D "1d8f70e07b9c3962945a74=
e59ca1c511bba65b6419468acc217c457d93f3c740"
+SRC_URI[pxfm-0.1.30.sha256sum] =3D "d55d956fa96f5ec02be2e13af0e20391a5aa=
83d6a074e3ad368959d0fab299ea"
 SRC_URI[qoi-0.4.1.sha256sum] =3D "7f6d64c71eb498fe9eae14ce4ec935c555749a=
ef511cca85b5568910d6e48001"
 SRC_URI[quick-error-2.0.1.sha256sum] =3D "a993555f31e5a609f617c12db6250d=
edcac1b0a85076912c436e6fc9b2c8e6a3"
-SRC_URI[quote-1.0.45.sha256sum] =3D "41f2619966050689382d2b44f664f4bc593=
e129785a36d6ee376ddf37259b924"
-SRC_URI[r-efi-5.3.0.sha256sum] =3D "69cdb34c158ceb288df11e18b4bd39de994f=
6657d83847bdffdbd7f346754b0f"
+SRC_URI[quote-1.0.47.sha256sum] =3D "1fbf4db142a473a8d80c26bbf18454ed458=
bf8d26c8219c331daecfdbd079001"
+SRC_URI[r-efi-6.0.0.sha256sum] =3D "f8dcc9c7d52a811697d2151c701e0d08956f=
92b0e24136cf4cf27b57a6a0d9bf"
+SRC_URI[raw-cpuid-11.6.0.sha256sum] =3D "498cd0dc59d73224351ee52a95fee0f=
1a617a2eae0e7d9d720cc622c73a54186"
 SRC_URI[rawpointer-0.2.1.sha256sum] =3D "60a357793950651c4ed0f3f52338f53=
b2f809f32d83a07f72909fa13e4c6c1e3"
-SRC_URI[rayon-1.11.0.sha256sum] =3D "368f01d005bf8fd9b1206fb6fa653e6c4a8=
1ceb1466406b81792d87c5677a58f"
+SRC_URI[rayon-1.12.0.sha256sum] =3D "fb39b166781f92d482534ef4b4b1b2568f4=
2613b53e5b6c160e24cfbfa30926d"
 SRC_URI[rayon-core-1.13.0.sha256sum] =3D "22e18b0f0062d30d4230b2e85ff77f=
dfe4326feb054b9783a3460d8435c8ab91"
-SRC_URI[regex-automata-0.4.14.sha256sum] =3D "6e1dd4122fc1595e8162618945=
476892eefca7b88c52820e74af6262213cae8f"
-SRC_URI[regex-syntax-0.8.10.sha256sum] =3D "dc897dd8d9e8bd1ed8cdad82b596=
6c3e0ecae09fb1907d58efaa013543185d0a"
+SRC_URI[reborrow-0.5.5.sha256sum] =3D "03251193000f4bd3b042892be858ee50e=
8b3719f2b08e5833ac4353724632430"
+SRC_URI[regex-1.13.1.sha256sum] =3D "f020237b6c8eed93db2e2cb53c00c60a8e1=
bc73da7d073199a1180401450218d"
+SRC_URI[regex-automata-0.4.16.sha256sum] =3D "8fcfdb36bda0c880c5931cdc7a=
2bcdc8ba4556847b9d912bca70bc94708711ad"
+SRC_URI[regex-syntax-0.8.11.sha256sum] =3D "d6f6ff9a378485b298a5286656da=
665ba74413d36db0979633275d2e708145d4"
 SRC_URI[rmp-0.8.15.sha256sum] =3D "4ba8be72d372b2c9b35542551678538b562e7=
cf86c3315773cae48dfbfe7790c"
 SRC_URI[rmp-serde-1.3.1.sha256sum] =3D "72f81bee8c8ef9b577d1681a70ebbc96=
2c232461e397b22c208c43c04b67a155"
 SRC_URI[rustix-1.1.4.sha256sum] =3D "b6fe4565b9518b83ef4f91bb47ce29620ca=
828bd32cb7e408f0062e9930ba190"
-SRC_URI[rustversion-1.0.22.sha256sum] =3D "b39cdef0fa800fc44525c84ccb54a=
029961a8215f9619753635a9c0d2538d46d"
+SRC_URI[rustversion-1.0.23.sha256sum] =3D "cf54715a573b99ac80df0bc206da0=
22bcd442c974952c7b9720069370852e21f"
 SRC_URI[ryu-1.0.23.sha256sum] =3D "9774ba4a74de5f7b1c1451ed6cd5285a32edd=
b5cccb8cc655a4e50009e06477f"
 SRC_URI[safe-transmute-0.11.3.sha256sum] =3D "3944826ff8fa8093089aba3acb=
4ef44b9446a99a16f3bf4e74af3f77d340ab7d"
 SRC_URI[safe_arch-0.7.4.sha256sum] =3D "96b02de82ddbe1b636e6170c21be6222=
23aea188ef2e139be0a5b219ec215323"
 SRC_URI[same-file-1.0.6.sha256sum] =3D "93fc1dc3aaa9bfed95e02e6eadabb4ba=
f7e3078b0bd1b4d7b6b0b68378900502"
-SRC_URI[semver-1.0.27.sha256sum] =3D "d767eb0aabc880b29956c35734170f26ed=
551a859dbd361d140cdbeca61ab1e2"
-SRC_URI[serde-1.0.228.sha256sum] =3D "9a8e94ea7f378bd32cbbd37198a4a91436=
180c5bb472411e48b5ec2e2124ae9e"
-SRC_URI[serde_core-1.0.228.sha256sum] =3D "41d385c7d4ca58e59fc732af25c39=
83b67ac852c1a25000afe1175de458b67ad"
-SRC_URI[serde_derive-1.0.228.sha256sum] =3D "d540f220d3187173da220f885ab=
66608367b6574e925011a9353e4badda91d79"
-SRC_URI[serde_json-1.0.149.sha256sum] =3D "83fc039473c5595ace860d8c4fafa=
220ff474b3fc6bfdb4293327f1a37e94d86"
-SRC_URI[serde_repr-0.1.20.sha256sum] =3D "175ee3e80ae9982737ca543e961330=
87cbd9a485eecc3bc4de9c1a37b47ea59c"
-SRC_URI[serde_spanned-1.0.4.sha256sum] =3D "f8bbf91e5a4d6315eee45e704372=
590b30e260ee83af6639d64557f51b067776"
+SRC_URI[serde-1.0.229.sha256sum] =3D "4148590afebada386688f18773da617792=
bf2ef03ffc1e4cbd2b1d45b023e0ba"
+SRC_URI[serde_core-1.0.229.sha256sum] =3D "67dca2c9c51e58a4791a4b1ed5830=
8b39c64224d349a935ab5039aa360942a48"
+SRC_URI[serde_derive-1.0.229.sha256sum] =3D "e7a5d71263a5a7d47b41f6b3f06=
ba276f10cc18b0931f1799f710578e2309348"
+SRC_URI[serde_json-1.0.151.sha256sum] =3D "c841b55ecdae098c80dcae9cf767f=
6f8a0c2cdb3416bbef72181df4d0fe73f14"
+SRC_URI[serde_repr-0.1.21.sha256sum] =3D "8d3b1629de253c70a0508c3899572d=
a79ca359fdab27c7920ff00406df418906"
+SRC_URI[serde_spanned-1.1.1.sha256sum] =3D "6662b5879511e06e8999a8a235d8=
48113e942c9124f211511b16466ee2995f26"
 SRC_URI[serde_yaml_ng-0.10.0.sha256sum] =3D "7b4db627b98b36d4203a7b458cf=
3573730f2bb591b28871d916dfa9efabfd41f"
 SRC_URI[sharded-slab-0.1.7.sha256sum] =3D "f40ca3c46823713e0d4209592e8d6=
e826aa57e928f09752619fc696c499637f6"
 SRC_URI[shell-words-1.1.1.sha256sum] =3D "dc6fe69c597f9c37bfeeeeeb33da35=
30379845f10be461a66d16d03eca2ded77"
-SRC_URI[shlex-1.3.0.sha256sum] =3D "0fda2ff0d084019ba4d7c6f371c95d8fd75c=
e3524c3cb8fb653a3023f6323e64"
+SRC_URI[shlex-2.0.1.sha256sum] =3D "f8fadd59c855ef2080decdef8ff161eb6661=
b86933c9d82e5ba29dc602a55aba"
 SRC_URI[signal-hook-registry-1.4.8.sha256sum] =3D "c4db69cba1110affc0e9f=
7bcd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b"
 SRC_URI[simba-0.9.1.sha256sum] =3D "c99284beb21666094ba2b75bbceda012e610=
f5479dfcc2d6e2426f53197ffd95"
-SRC_URI[simd-adler32-0.3.8.sha256sum] =3D "e320a6c5ad31d271ad523dcf3ad13=
e2767ad8b1cb8f047f75a8aeaf8da139da2"
+SRC_URI[simd-adler32-0.3.10.sha256sum] =3D "3a219298ac11a56ea9a6d2120044=
824d6f01aeb034955e7af7bc16858527deea"
 SRC_URI[simple_logger-5.2.0.sha256sum] =3D "c7038d0e96661bf9ce647e1a6f6e=
f6d6f3663f66d9bf741abf14ba4876071c17"
 SRC_URI[slab-0.4.12.sha256sum] =3D "0c790de23124f9ab44544d7ac05d60440adc=
586479ce501c1d6d7da3cd8c9cf5"
-SRC_URI[smallvec-1.15.1.sha256sum] =3D "67b1b7a3b5fe4f1376887184045fcf45=
c69e92af734b7aaddc05fb777b6fbd03"
-SRC_URI[socket2-0.6.3.sha256sum] =3D "3a766e1110788c36f4fa1c2b71b387a781=
5aa65f88ce0229841826633d93723e"
+SRC_URI[smallvec-1.15.2.sha256sum] =3D "8ed6a63f02c8539c91a8685a86f40996=
61ba3da017932f6ebbea6de3f0fa7c90"
+SRC_URI[socket2-0.6.5.sha256sum] =3D "c3d1e2c7f27f8d4cb10542a02c49005dbd=
6e93095799d6f3be745fae9f8fedd4"
 SRC_URI[static_assertions-1.1.0.sha256sum] =3D "a2eb9349b6444b326872e140=
eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
 SRC_URI[strsim-0.11.1.sha256sum] =3D "7da8b5736845d9f2fcb837ea5d9e262856=
4b3b043a70948a3f0b778838c5fb4f"
-SRC_URI[syn-2.0.117.sha256sum] =3D "e665b8803e7b1d2a727f4023456bbbbe74da=
67099c585258af0ad9c5013b9b99"
-SRC_URI[system-deps-7.0.7.sha256sum] =3D "48c8f33736f986f16d69b6cb8b03f5=
5ddcad5c41acc4ccc39dd88e84aa805e7f"
+SRC_URI[syn-2.0.119.sha256sum] =3D "872831b642d1a07999a962a351ed35b955ea=
2cfc8f3862091e2a240a84f17297"
+SRC_URI[syn-3.0.3.sha256sum] =3D "53e9bae58849f64dfa4f5d5ae372c8341f7305=
f82a3868709269343628b659a3"
+SRC_URI[system-deps-7.0.8.sha256sum] =3D "396a35feb67335377e0251fcbc1092=
fc85c484bd4e3a7a54319399da127796e7"
 SRC_URI[target-features-0.1.6.sha256sum] =3D "c1bbb9f3c5c463a01705937a24=
fdabc5047929ac764b2d5b9cf681c1f5041ed5"
-SRC_URI[target-lexicon-0.13.3.sha256sum] =3D "df7f62577c25e07834649fc3b3=
9fafdc597c0a3527dc1c60129201ccfcbaa50c"
-SRC_URI[tempfile-3.26.0.sha256sum] =3D "82a72c767771b47409d2345987fda862=
8641887d5466101319899796367354a0"
-SRC_URI[thiserror-2.0.18.sha256sum] =3D "4288b5bcbc7920c07a1149a35cf9590=
a2aa808e0bc1eafaade0b80947865fbc4"
-SRC_URI[thiserror-impl-2.0.18.sha256sum] =3D "ebc4ee7f67670e9b64d05fa425=
3e753e016c6c95ff35b89b7941d6b856dec1d5"
-SRC_URI[thread_local-1.1.9.sha256sum] =3D "f60246a4944f24f6e018aa17cdeff=
b7818b76356965d03b07d6a9886e8962185"
+SRC_URI[target-lexicon-0.13.5.sha256sum] =3D "adb6935a6f5c20170eeceb1a38=
35a49e12e19d792f6dd344ccc76a985ca5a6ca"
+SRC_URI[tempfile-3.27.0.sha256sum] =3D "32497e9a4c7b38532efcdebeef879707=
aa9f794296a4f0244f6f69e9bc8574bd"
+SRC_URI[thiserror-2.0.19.sha256sum] =3D "09a43598840e33d5b0331f38c5e30d1=
3bb11c11210a4b58f0d9b18a5a5eefcd9"
+SRC_URI[thiserror-impl-2.0.19.sha256sum] =3D "43cbfe0cf76104d42a57480284=
4187e84a305e531ed54455f11fbde0f10541cd"
+SRC_URI[thread_local-1.1.10.sha256sum] =3D "1ad99c4c6d32803332c548b1af05=
40b357b3f5fc0be8f6c6bfe8b2e6ae784070"
 SRC_URI[tiff-0.11.3.sha256sum] =3D "b63feaf3343d35b6ca4d50483f94843803b0=
f51634937cc2ec519fc32232bc52"
-SRC_URI[tokio-1.50.0.sha256sum] =3D "27ad5e34374e03cfffefc301becb44e9dc3=
c17584f414349ebe29ed26661822d"
-SRC_URI[tokio-stream-0.1.18.sha256sum] =3D "32da49809aab5c3bc678af03902d=
4ccddea2a87d028d86392a4b1560c6906c70"
-SRC_URI[toml-0.9.12+spec-1.1.0.sha256sum] =3D "cf92845e79fc2e2def6a5d828=
f0801e29a2f8acc037becc5ab08595c7d5e9863"
-SRC_URI[toml_datetime-0.7.5+spec-1.1.0.sha256sum] =3D "92e1cfed4a3038bc5=
a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347"
-SRC_URI[toml_edit-0.23.10+spec-1.0.0.sha256sum] =3D "84c8b9f757e028cee9f=
a244aea147aab2a9ec09d5325a9b01e0a49730c2b5269"
-SRC_URI[toml_parser-1.0.9+spec-1.1.0.sha256sum] =3D "702d4415e08923e7e1e=
f96cd5727c0dfed80b4d2fa25db9647fe5eb6f7c5a4c4"
-SRC_URI[toml_writer-1.0.6+spec-1.1.0.sha256sum] =3D "ab16f14aed21ee8bfd8=
ec22513f7287cd4a91aa92e44edfe2c17ddd004e92607"
+SRC_URI[tinytemplate-1.2.1.sha256sum] =3D "be4d6b5f19ff7664e8c98d03e2139=
cb510db9b0a60b55f8e8709b689d939b6bc"
+SRC_URI[tokio-1.53.1.sha256sum] =3D "202caea871b69668250d242070849eb495b=
e178ed697a3e98aebce5bc81a0bed"
+SRC_URI[tokio-stream-0.1.19.sha256sum] =3D "a3d06f0b082ba57c26b79407372e=
57cf2a1e28124f78e9479fe80322cf53420b"
+SRC_URI[toml-1.1.4+spec-1.1.0.sha256sum] =3D "3aace63f4bbcdfc2c965b059de=
67119c89c4017a70d633be6c104910f67056f5"
+SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] =3D "3165f65f62e28e011=
5a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
+SRC_URI[toml_edit-0.25.13+spec-1.1.0.sha256sum] =3D "6975367e4d2ef766d86=
af01ffad14b622fecc8d4357a998fbc4deb6e9bacaf9b"
+SRC_URI[toml_parser-1.1.3+spec-1.1.0.sha256sum] =3D "1d38ac1cf9b95face32=
296c0a3ede1fdc270627c9d9c02a7274dd6d960dc4d56"
+SRC_URI[toml_writer-1.1.2+spec-1.1.0.sha256sum] =3D "7d56353a2a665ad0f41=
a421187180aab746c8c325620617ad883a99a1cbe66d2"
 SRC_URI[tracing-0.1.44.sha256sum] =3D "63e71662fa4b2a2c3a26f570f037eb95b=
b1f85397f3cd8076caed2f026a6d100"
 SRC_URI[tracing-attributes-0.1.31.sha256sum] =3D "7490cfa5ec963746568740=
651ac6781f701c9c5ea257c58e057f3ba8cf69e8da"
 SRC_URI[tracing-core-0.1.36.sha256sum] =3D "db97caf9d906fbde555dd62fa95d=
dba9eecfd14cb388e4f491a66d74cd5fb79a"
 SRC_URI[tracing-log-0.2.0.sha256sum] =3D "ee855f1f400bd0e5c02d150ae5de38=
40039a3f54b025156404e34c23c03f47c3"
-SRC_URI[tracing-subscriber-0.3.22.sha256sum] =3D "2f30143827ddab0d256fd8=
43b7a66d164e9f271cfa0dde49142c5ca0ca291f1e"
-SRC_URI[typenum-1.19.0.sha256sum] =3D "562d481066bde0658276a35467c4af00b=
dc6ee726305698a55b86e61d7ad82bb"
+SRC_URI[tracing-subscriber-0.3.23.sha256sum] =3D "cb7f578e5945fb24253896=
5c2d0b04418d38ec25c79d160cd279bf0731c8d319"
+SRC_URI[typenum-1.20.1.sha256sum] =3D "b6f5e870be6c3b371b77fe0ee0bafb859=
fa4964b4404c27de1d380043c4dda20"
 SRC_URI[uds_windows-1.2.1.sha256sum] =3D "f2f6fb2847f6742cd76af783a2a2c4=
9e9375d0a111c7bef6f71cd9e738c72d6e"
 SRC_URI[unicode-ident-1.0.24.sha256sum] =3D "e6e4313cd5fcd3dad5cafa17970=
2e2b244f760991f45397d14d4ebf38247da75"
 SRC_URI[unicode-width-0.2.2.sha256sum] =3D "b4ac048d71ede7ee76d585517add=
45da530660ef4390e49b098733c6e897f254"
-SRC_URI[unicode-xid-0.2.6.sha256sum] =3D "ebc1c04c71510c7f702b52b7c35073=
4c9ff1295c464a03335b00bb84fc54f853"
 SRC_URI[unsafe-libyaml-0.2.11.sha256sum] =3D "673aac59facbab8a9007c7f610=
8d11f63b603f7cabff99fabf650fea5c32b861"
-SRC_URI[uuid-1.22.0.sha256sum] =3D "a68d3c8f01c0cfa54a75291d83601161799e=
4a89a39e0929f4b0354d88757a37"
+SRC_URI[uuid-1.24.0.sha256sum] =3D "bf3923a6f5c4c6382e0b653c4117f48d631e=
a17f38ed86e2a828e6f7412f5239"
 SRC_URI[valuable-0.1.1.sha256sum] =3D "ba73ea9cf16a25df0c8caa16c51acb937=
d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[vcpkg-0.2.15.sha256sum] =3D "accd4ea62f7bb7a82fe23066fb0957d48ef=
677f6eeb8215f372f52e48bb32426"
 SRC_URI[version-compare-0.2.1.sha256sum] =3D "03c2856837ef78f57382f06b2b=
8563a2f512f7185d732608fd9176cb3b8edf0e"
 SRC_URI[version_check-0.9.5.sha256sum] =3D "0b928f33d975fc6ad9f86c8f2838=
53ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[walkdir-2.5.0.sha256sum] =3D "29790946404f91d9c5d06f9874efddea1d=
c06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] =3D "ccf3ec651a847=
eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
-SRC_URI[wasip2-1.0.2+wasi-0.2.9.sha256sum] =3D "9517f9239f02c069db75e65f=
174b3da828fe5f5b945c4dd26bd25d89c03ebcf5"
-SRC_URI[wasip3-0.4.0+wasi-0.3.0-rc-2026-01-06.sha256sum] =3D "5428f8bf88=
ea5ddc08faddef2ac4a67e390b88186c703ce6dbd955e1c145aca5"
-SRC_URI[wasm-bindgen-0.2.114.sha256sum] =3D "6532f9a5c1ece3798cb1c2cfdba=
640b9b3ba884f5db45973a6f442510a87d38e"
-SRC_URI[wasm-bindgen-macro-0.2.114.sha256sum] =3D "18a2d50fcf105fb33bb15=
f00e7a77b772945a2ee45dcf454961fd843e74c18e6"
-SRC_URI[wasm-bindgen-macro-support-0.2.114.sha256sum] =3D "03ce4caeaac54=
7cdf713d280eda22a730824dd11e6b8c3ca9e42247b25c631e3"
-SRC_URI[wasm-bindgen-shared-0.2.114.sha256sum] =3D "75a326b8c223ee17883a=
4251907455a2431acc2791c98c26279376490c378c16"
-SRC_URI[wasm-encoder-0.244.0.sha256sum] =3D "990065f2fe63003fe337b932cfb=
5e3b80e0b4d0f5ff650e6985b1048f62c8319"
-SRC_URI[wasm-metadata-0.244.0.sha256sum] =3D "bb0e353e6a2fbdc176932bbaab=
493762eb1255a7900fe0fea1a2f96c296cc909"
-SRC_URI[wasmparser-0.244.0.sha256sum] =3D "47b807c72e1bac69382b3a6fb3dbe=
8ea4c0ed87ff5629b8685ae6b9a611028fe"
+SRC_URI[wasm-bindgen-0.2.126.sha256sum] =3D "4b067c0c11094aef6b7a801c1e3=
4a26affafdf3d051dba08456b868789aaf9a4"
+SRC_URI[wasm-bindgen-macro-0.2.126.sha256sum] =3D "167ce5e579f6bcf889c4f=
7175a8a5a585de84e8ff93976ce393efa5f2837aab1"
+SRC_URI[wasm-bindgen-macro-support-0.2.126.sha256sum] =3D "f3997c7839262=
f4ef12cf90b818d6340c18e80f263f1a94bf157d0ec4420380e"
+SRC_URI[wasm-bindgen-shared-0.2.126.sha256sum] =3D "dc1b4cb0cc549fcf58d7=
dfc081778139b3d283a081644e833e84682ad71cea24"
+SRC_URI[web-sys-0.3.103.sha256sum] =3D "8622dcb61c0bcc9fffa6938bed81210a=
f2da9a7e4a1a834b2e37a59b6dfb6141"
 SRC_URI[weezl-0.1.12.sha256sum] =3D "a28ac98ddc8b9274cb41bb4d9d4d5c425b6=
020c50c46f25559911905610b4a88"
 SRC_URI[wide-0.7.33.sha256sum] =3D "0ce5da8ecb62bcd8ec8b7ea19f69a51275e9=
1299be594ea5cc6ef7819e16cd03"
+SRC_URI[winapi-0.3.9.sha256sum] =3D "5c839a674fcd7a98952e593242ea400abe9=
3992746761e38641405d28b00f419"
+SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D "ac3b87c63620426=
dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
 SRC_URI[winapi-util-0.1.11.sha256sum] =3D "c2a7b1c03c876122aa43f3020e6c3=
c3ee5c05081c9a00739faf7503aeba10d22"
+SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D "712e227841d05=
7c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
 SRC_URI[windows-core-0.62.2.sha256sum] =3D "b8e83a14d34d0623b51dce958119=
9302a221863196a1dde71a7663a4c2be9deb"
 SRC_URI[windows-implement-0.60.2.sha256sum] =3D "053e2e040ab57b9dc951b72=
c264860db7eb3b0200ba345b4e4c3b14f67855ddf"
 SRC_URI[windows-interface-0.59.3.sha256sum] =3D "3f316c4a2570ba26bbec722=
032c4099d8c8bc095efccdc15688708623367e358"
@@ -589,24 +624,19 @@ SRC_URI[windows-link-0.2.1.sha256sum] =3D "f0805222=
e57f7521d6a62e36fa9163bc891acd4
 SRC_URI[windows-result-0.4.1.sha256sum] =3D "7781fa89eaf60850ac3d2da7af8=
e5242a5ea78d1a11c49bf2910bb5a73853eb5"
 SRC_URI[windows-strings-0.5.1.sha256sum] =3D "7837d08f69c77cf6b076895445=
38e017c1bfcf57e34b4c0ff58e6c2cd3b37091"
 SRC_URI[windows-sys-0.61.2.sha256sum] =3D "ae137229bcbd6cdf0f7b80a31df61=
766145077ddf49416a728b02cb3921ff3fc"
-SRC_URI[winnow-0.7.15.sha256sum] =3D "df79d97927682d2fd8adb29682d1140b34=
3be4ac0f08fd68b7765d9c059d3945"
-SRC_URI[wit-bindgen-0.51.0.sha256sum] =3D "d7249219f66ced02969388cf2bb04=
4a09756a083d0fab1e566056b04d9fbcaa5"
-SRC_URI[wit-bindgen-core-0.51.0.sha256sum] =3D "ea61de684c3ea68cb082b7a8=
8508a8b27fcc8b797d738bfc99a82facf1d752dc"
-SRC_URI[wit-bindgen-rust-0.51.0.sha256sum] =3D "b7c566e0f4b284dd6561c786=
d9cb0142da491f46a9fbed79ea69cdad5db17f21"
-SRC_URI[wit-bindgen-rust-macro-0.51.0.sha256sum] =3D "0c0f9bfd77e6a48ecc=
f51359e3ae77140a7f50b1e2ebfe62422d8afdaffab17a"
-SRC_URI[wit-component-0.244.0.sha256sum] =3D "9d66ea20e9553b30172b5e8319=
94e35fbde2d165325bec84fc43dbf6f4eb9cb2"
-SRC_URI[wit-parser-0.244.0.sha256sum] =3D "ecc8ac4bc1dc3381b7f59c34f00b6=
7e18f910c2c0f50015669dde7def656a736"
-SRC_URI[xml-rs-0.8.28.sha256sum] =3D "3ae8337f8a065cfc972643663ea4279e04=
e7256de865aa66fe25cec5fb912d3f"
-SRC_URI[yeslogic-fontconfig-sys-6.0.0.sha256sum] =3D "503a066b4c037c4401=
69d995b869046827dbc71263f6e8f3be6d77d4f3229dbd"
-SRC_URI[zbus-5.14.0.sha256sum] =3D "ca82f95dbd3943a40a53cfded6c2d0a2ca26=
192011846a1810c4256ef92c60bc"
-SRC_URI[zbus_macros-5.14.0.sha256sum] =3D "897e79616e84aac4b2c46e9132a4f=
63b93105d54fe8c0e8f6bffc21fa8d49222"
-SRC_URI[zbus_names-4.3.1.sha256sum] =3D "ffd8af6d5b78619bab301ff3c560a5b=
d22426150253db278f164d6cf3b72c50f"
-SRC_URI[zerocopy-0.8.42.sha256sum] =3D "f2578b716f8a7a858b7f02d5bd870c14=
bf4ddbbcf3a4c05414ba6503640505e3"
-SRC_URI[zerocopy-derive-0.8.42.sha256sum] =3D "7e6cc098ea4d3bd6246687de6=
5af3f920c430e236bee1e3bf2e441463f08a02f"
-SRC_URI[zmij-1.0.21.sha256sum] =3D "b8848ee67ecc8aedbaf3e4122217aff89263=
9231befc6a1b58d29fff4c2cabaa"
+SRC_URI[winnow-1.0.4.sha256sum] =3D "23b97319f7b8343df12cc98938e5c3eb436=
064524c8d2b4e30a1d3a36eecdf81"
+SRC_URI[xml-1.3.0.sha256sum] =3D "636f85e5ca6488e96401b61eb7de54f4e44755=
c988af0f52cf90230c312a1a89"
+SRC_URI[yansi-1.0.1.sha256sum] =3D "cfe53a6657fd280eaa890a3bc59152892ffa=
3e30101319d168b781ed6529b049"
+SRC_URI[yeslogic-fontconfig-sys-6.0.1.sha256sum] =3D "1d8b8abf912b9a29ff=
112e1671c97c33636903d13a69712037190e6805af4f76"
+SRC_URI[zbus-5.18.0.sha256sum] =3D "fe18fb60dc696039e738717b76eaea21e7a4=
489bbb1885020b43c94236d7e98a"
+SRC_URI[zbus_macros-5.18.0.sha256sum] =3D "fe96480bed92df2b442a1a30df364=
e12d08eed03aeb061f2b8dc6afb2be91119"
+SRC_URI[zbus_names-4.3.4.sha256sum] =3D "d8bf88b4a3ff53e883001e0e0115b29=
7a9d53c31b9c1edd2bfdd853e3428624e"
+SRC_URI[zerocopy-0.8.55.sha256sum] =3D "b5a105cd7b140f6eeec8acff2ea38135=
d3cab283ada58540f629fe51e46696eb"
+SRC_URI[zerocopy-derive-0.8.55.sha256sum] =3D "0fe976fb70c78cd64cccfe3a6=
fc142244e8a77b70959b30faf9d0ac37ee228eb"
+SRC_URI[zmij-1.0.23.sha256sum] =3D "29666d0abbfad1e3dc4dcf6144730dd3a3ab=
225bbbdac83319345b1b44ccfc1b"
 SRC_URI[zune-core-0.5.1.sha256sum] =3D "cb8a0807f7c01457d0379ba880ba6322=
660448ddebc890ce29bb64da71fb40f9"
 SRC_URI[zune-inflate-0.2.54.sha256sum] =3D "73ab332fe2f6680068f3582b16a2=
4f90ad7096d5d39b974d1c0aff0125116f02"
-SRC_URI[zune-jpeg-0.5.12.sha256sum] =3D "410e9ecef634c709e3831c2cfdb8d9c=
32164fae1c67496d5b68fff728eec37fe"
-SRC_URI[zvariant-5.10.0.sha256sum] =3D "5708299b21903bbe348e94729f22c49c=
55d04720a004aa350f1f9c122fd2540b"
-SRC_URI[zvariant_derive-5.10.0.sha256sum] =3D "5b59b012ebe9c46656f9cc08d=
8da8b4c726510aef12559da3e5f1bf72780752c"
-SRC_URI[zvariant_utils-3.3.0.sha256sum] =3D "f75c23a64ef8f40f13a6989991e=
643554d9bef1d682a281160cf0c1bc389c5e9"
+SRC_URI[zune-jpeg-0.5.15.sha256sum] =3D "27bc9d5b815bc103f142aa054f561d9=
187d191692ec7c2d1e2b4737f8dbd7296"
+SRC_URI[zvariant-5.13.1.sha256sum] =3D "bee2a0bcd2a907786a456fff45aaaaf5=
4c9ba5f50b71ae9ec1a4edd200c94911"
+SRC_URI[zvariant_derive-5.13.1.sha256sum] =3D "38a708216a18780796770bfe3=
f4739c7c83a3e8f789b755534bbbc06e4e23e12"
+SRC_URI[zvariant_utils-3.5.0.sha256sum] =3D "90cb9383f9b45290407a1258b20=
2d3f8f01db719eb60b4e4055c6375af4fc7c7"
diff --git a/meta-gnome/recipes-gnome/glycin/glycin/0001-meson-Support-cr=
oss-compilation-via-a-rust_target-cr.patch b/meta-gnome/recipes-gnome/gly=
cin/glycin/0001-meson-Support-cross-compilation-via-a-rust_target-cr.patc=
h
deleted file mode 100644
index 9d14326214..0000000000
--- a/meta-gnome/recipes-gnome/glycin/glycin/0001-meson-Support-cross-com=
pilation-via-a-rust_target-cr.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From b4fac7e77a2a88be19fc83b3890711e2e3165859 Mon Sep 17 00:00:00 2001
-From: Anton Politov <ampernic@inbox.ru>
-Date: Thu, 18 Jun 2026 14:03:36 +0300
-Subject: [PATCH] meson: Support cross-compilation via a rust_target cros=
s
- property
-
-cargo was always invoked without --target and the artifact paths assumed
-the native layout (cargo-target/<profile>/), so the Rust components coul=
d
-not be cross-compiled. Read the rust target triple from the cross file's
-[properties] (rust_target); when set, pass it as --target and read the
-artifacts from the per-target subdirectory cargo writes to. When it is
-unset the build is unchanged.
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glycin/-/commi=
t/13b6b060d41aa4cdce3eb878e83c6dd01014e669]
----
- glycin-loaders/meson.build     | 4 ++--
- glycin-thumbnailer/meson.build | 3 ++-
- libglycin/meson.build          | 2 +-
- meson.build                    | 9 +++++++++
- 4 files changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/glycin-loaders/meson.build b/glycin-loaders/meson.build
-index 805a646..03db09e 100644
---- a/glycin-loaders/meson.build
-+++ b/glycin-loaders/meson.build
-@@ -49,7 +49,7 @@ manifest =3D meson.project_source_root() / 'Cargo.toml=
'
- cargo_options =3D [
-   '--profile', cargo_profile,
-   '--manifest-path', manifest,
--]
-+] + cargo_target_args
-=20
- git_version =3D ''
-=20
-@@ -103,7 +103,7 @@ foreach loader : get_option('loaders')
-     output: loader,
-     command: [
-       'cp',
--      cargo_target_dir / rust_target / loader,
-+      cargo_artifact_dir / rust_target / loader,
-       '@OUTPUT@',
-     ],
-   )
-diff --git a/glycin-thumbnailer/meson.build b/glycin-thumbnailer/meson.b=
uild
-index 3e205e3..1580378 100644
---- a/glycin-thumbnailer/meson.build
-+++ b/glycin-thumbnailer/meson.build
-@@ -21,6 +21,7 @@ cargo_build =3D custom_target(
-         '--profile', cargo_profile,
-         '--manifest-path', cargo_manifest,
-         '--package=3Dglycin-thumbnailer',
-+        cargo_target_args,
-     ],
- )
-=20
-@@ -34,7 +35,7 @@ custom_target(
-     output: 'glycin-thumbnailer',
-     command: [
-         'cp',
--        cargo_target_dir / rust_target / 'glycin-thumbnailer',
-+        cargo_artifact_dir / rust_target / 'glycin-thumbnailer',
-         '@OUTPUT@',
-     ],
- )
-diff --git a/libglycin/meson.build b/libglycin/meson.build
-index 12cbd5f..3a2a8b6 100644
---- a/libglycin/meson.build
-+++ b/libglycin/meson.build
-@@ -17,7 +17,7 @@ cargo_options =3D [
-     '--target-dir', cargo_target_dir,
-     '--profile', cargo_profile,
-     '--manifest-path', manifest,
--]
-+] + cargo_target_args
-=20
- cargo_env_module =3D cargo_env
-=20
-diff --git a/meson.build b/meson.build
-index bb4a5e4..72d1ae8 100644
---- a/meson.build
-+++ b/meson.build
-@@ -25,6 +25,15 @@ cargo_target_dir =3D meson.project_build_root() / 'ca=
rgo-target'
- cargo_home =3D meson.project_build_root() / 'cargo-home'
- cargo_manifest =3D meson.project_source_root() / 'Cargo.toml'
-=20
-+cargo_build_target =3D meson.get_external_property('rust_target', '')
-+if cargo_build_target !=3D ''
-+  cargo_target_args =3D ['--target', cargo_build_target]
-+  cargo_artifact_dir =3D cargo_target_dir / cargo_build_target
-+else
-+  cargo_target_args =3D []
-+  cargo_artifact_dir =3D cargo_target_dir
-+endif
-+
- cargo_bin =3D find_program('cargo')
- crate_version_bin =3D find_program(meson.project_source_root() / 'build=
-aux/crates-version.py')
-=20
diff --git a/meta-gnome/recipes-gnome/glycin/glycin/0002-libglycin-Read-c=
argo-artifacts-from-the-per-target-s.patch b/meta-gnome/recipes-gnome/gly=
cin/glycin/0002-libglycin-Read-cargo-artifacts-from-the-per-target-s.patc=
h
deleted file mode 100644
index 5f431e25cf..0000000000
--- a/meta-gnome/recipes-gnome/glycin/glycin/0002-libglycin-Read-cargo-ar=
tifacts-from-the-per-target-s.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 6fa1351e99a52e9efc8724952275ee51a15afc7e Mon Sep 17 00:00:00 2001
-From: x <a@b.c>
-Date: Wed, 2 Sep 2026 19:57:42 +0000
-Subject: [PATCH] libglycin: Read cargo artifacts from the per-target
- subdirectory
-
-Commit 13b6b06 ("meson: Support cross-compilation via a rust_target cros=
s
-property") converted the loaders and the thumbnailer to cargo_artifact_d=
ir
-but left the libglycin shared object path pointing at cargo_target_dir.
-When --target is passed, cargo writes to cargo-target/<triple>/<profile>=
/
-and the copy step fails. Upstream fixed this as part of the much larger
-windows-gnu commit 4d1a505, so only the relevant hunk is taken here.
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glycin/-/commi=
t/4d1a505]
----
- libglycin/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libglycin/meson.build b/libglycin/meson.build
-index 3a2a8b6..dbadf49 100644
---- a/libglycin/meson.build
-+++ b/libglycin/meson.build
-@@ -72,7 +72,7 @@ foreach package : packages
-         endif
-     endif
-=20
--    cargo_output =3D cargo_target_dir / rust_target / f'libglycin@suffi=
x@.so'.replace('-', '_')
-+    cargo_output =3D cargo_artifact_dir / rust_target / f'libglycin@suf=
fix@.so'.replace('-', '_')
-=20
-     # Build library with Rust
-     libglycin =3D custom_target(
diff --git a/meta-gnome/recipes-gnome/glycin/glycin_2.1.5.bb b/meta-gnome=
/recipes-gnome/glycin/glycin_2.2.0.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/glycin/glycin_2.1.5.bb
rename to meta-gnome/recipes-gnome/glycin/glycin_2.2.0.bb
index a34c2425a2..69d1566fe2 100644
--- a/meta-gnome/recipes-gnome/glycin/glycin_2.1.5.bb
+++ b/meta-gnome/recipes-gnome/glycin/glycin_2.2.0.bb
@@ -13,11 +13,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE-MPL-2.0;md5=3Df75=
d2927d3c1ed2414ef72048f5ad640
=20
 inherit cargo_common cargo-update-recipe-crates meson pkgconfig gettext =
gobject-introspection
=20
-SRC_URI =3D "git://gitlab.gnome.org/GNOME/glycin.git;protocol=3Dhttps;br=
anch=3D2.1;tag=3D${PV} \
-           file://0001-meson-Support-cross-compilation-via-a-rust_target=
-cr.patch \
-           file://0002-libglycin-Read-cargo-artifacts-from-the-per-targe=
t-s.patch \
-           "
-SRCREV =3D "62c5096eaac2c92dab84c2eb896936d8da3dd9c1"
+SRC_URI =3D "git://gitlab.gnome.org/GNOME/glycin.git;protocol=3Dhttps;br=
anch=3Dmain;tag=3D${PV}"
+SRCREV =3D "a5c2d58d6ae0bd7233f6705781b17dd083ebde73"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.gnome.org/GNOME/glycin/-/tags"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
--=20
2.55.0


