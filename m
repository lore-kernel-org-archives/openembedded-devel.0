Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16957.1794306634104566530
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 02:30:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kx2BY96r;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so25052385e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 02:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794306632; x=1794911432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AinrE0EInVs8sOE3nDO6HYvnVPgqJ+cEnyzXbIu9S4E=;
        b=kx2BY96r499ypQsY3j5WOJ9DAyAEVWLfHMC9lF5cL2Wzmn+AZKpZ16wYqEUmBvXNfQ
         0tHfUEc9y+kNxVAQvJ/jVjKS09a5KkYcUnxgvdACx3T3bA6WOx3/4P0IA4Bxfk4wI904
         1vsheWAYOOKgYsusEfFosfB7E/tSFEkCBdnAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794306632; x=1794911432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AinrE0EInVs8sOE3nDO6HYvnVPgqJ+cEnyzXbIu9S4E=;
        b=mEX5ri2X0R1sPXVBFkXbStbklPNAYg1oXwjoBuPBhT1Jlfyoq5q25T5GLd/G8W1JQ9
         ZM+hztwXnZJ7wFnLppXwDvQfvJi/bN8EYAay8IaKEjaxFLzFz9STNtlGOVtzOAuNVL6J
         HZ1t/CsxX3Rf6LzeQnWHMF106I5i9iSoG3Lku9s9I6OpVtzKDjoErV+jEdV6Hd5i/kh4
         KccNNlVVOXP0dk5k7b4lZF9GL0vwxcbL1oWpGy+JvAk/OOEzfYIgOZgqZ2vsvBpGqb1R
         9YumhI1Nr+0nXSvhOsj7q+/J8wz8xvCIJKo0lWLgAGMeMA2ZdCxGoHKDVvHD5KzRRWbo
         /TNQ==
X-Gm-Message-State: APuU4Z+ZkYf4B8bJPp7awNb0DGcojy01PxUx9OgWA/nW+NaD6m+J4DsB
	GPx/A5wV/MgAjD5HXgfNGc32ke//hp7d2Gv9HVi4Ycfe5jpY40hKhercq01WXdsy5Yo3dkwj8a7
	ezmRI
X-Gm-Gg: AYBFou0aJRMoVpzXamu5ZRiLKGRwZHOuBrIFYXr5BwdYzgjzYByjmRhUM1+cpJ3s7gc
	0Lmz0Qsrg1NwaZ1J4HCihrxppRIOqcAn4SrDpQPpCQLDjt3NGXYKi+0VZn/mKmlW86n6uXnm0z5
	bI38yMKSEXPLXowk9+4i/FH4YK33tT6ntJefezjZOcVXAGLYWXX4r85C0ThKNtqF7WCuJSkAyIo
	8cZGHJ8+Ux7MgGaH51WCjvQghoeinsUoy5Lhc5i00I+Rv6zwRuRbUpj2W9vZJoEdNVjFMk1F4ZV
	kdd3pHgSg2wGPRg1vsVgWR25ME3q2pRqdHwqpd6UDIdAnsOp3WtzFbeuO+074Yu0KRzrdnent9e
	VJXCIvWD/STNB2XQUopKCvKjmWBdXV69JCrbOIhBdqv951Xxgmye0SaEU4482SjViaNTzgeEYGJ
	+TiAsu8JVQlj8eeFYokKnelj8FdiTHN2Q8DjPWW0ZEn/k28zaKspT9teQVAu7etWLRHiaJ6NuGZ
	K4aAQ0E0/BXA/98G8wnovDE6NzFHwoNGOQB+M4WZuvZMptxJT4whhs90FylAaegG+DRWyI+JIaB
	fXucMBiuMs2QwbgIC3KGFWPTzHFt9K02/2dpdxK+UVcWzhcRTmk7QFAOCccfg0y9fmDBdo9o+yk
	lvf7DjC3hiT1An2dDPKh9YRgqPkWhfpc727J+Z93zv68Tgxe/sLsl7Q==
X-Received: by 2002:a05:600c:6296:b0:4a1:fe26:24f0 with SMTP id 5b1f17b1804b1-4ba02348dd9mr34302155e9.20.1794306631946;
        Tue, 10 Nov 2026 02:30:31 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2cb2sm52019685e9.3.2026.11.10.02.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:30:31 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-ruff: Upgrade 0.17.3 -> 0.17.4
Date: Tue, 10 Nov 2026 12:30:27 +0200
Message-ID: <20261110103028.1041905-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 10:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132073
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.17.4:

Preview features:

- [flake8-logging-format] Avoid behavior changes and syntax errors
  in fixes (G004)
- [security] Implement tarfile-ignore-zeros-true

Bug fixes:

- Accept a bare raise before a semicolon
- Allow match identifiers after a semicolon
- Fix panic on BOM-prefixed files in diagnostic renderer
- [flake8-simplify] Report collapsible elif clauses after a
  multi-statement if branch (SIM102)

Rule changes:

- Show more nonprinting characters in diagnostic fix diffs

Performance:

- Coalesce source slices when formatting attributes
- Collect return statements with a statement-only visitor
- [pyflakes] Defer value comparisons for repeated dictionary keys
  (F601, F602)
- Format node fields directly when comment handling is unnecessary
- Reduce formatter source-slice overhead
- Reuse a callee's qualified name across lint rules
- Skip invalid string character checks when the source contains
  none
- Use a Bloom filter for formatter comment lookups
- Use a concrete buffer for ordinary writes

CLI:

- Give NO_COLOR precedence in Ruff and ty diagnostics
- Honor CLICOLOR=0 in Ruff and ty diagnostics

Documentation:

- Correct the documented version and src defaults for ruff-action
- [flake8-bugbear] Make B014 example error out-of-the-box
- [flake8-no-pep420] Document preview behavior (INP001)
- [isort] Expand I001 documentation

Other changes:

- [syntax-errors] Extend __debug__ write check to attribute targets

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-ruff-crates.inc            | 64 +++++++++----------
 ...e-atomic-for-AtomicU64-on-targets-wi.patch | 10 +--
 ...-ruff_0.17.3.bb => python3-ruff_0.17.4.bb} |  2 +-
 3 files changed, 38 insertions(+), 38 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ruff_0.17.3.bb => python3-ruff_0.17.4.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-ruff-crates.inc b/meta-python/recipes-devtools/python/python3-ruff-crates.inc
index f657504ad7..f11630d974 100644
--- a/meta-python/recipes-devtools/python/python3-ruff-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-ruff-crates.inc
@@ -62,7 +62,7 @@ SRC_URI += " \
     crate://crates.io/clap_complete_nushell/4.5.8 \
     crate://crates.io/clap_derive/4.6.7 \
     crate://crates.io/clap_lex/1.0.0 \
-    crate://crates.io/clearscreen/4.0.6 \
+    crate://crates.io/clearscreen/5.0.0 \
     crate://crates.io/codspeed/5.0.1 \
     crate://crates.io/codspeed-criterion-compat/5.0.1 \
     crate://crates.io/codspeed-criterion-compat-walltime/5.0.1 \
@@ -74,7 +74,7 @@ SRC_URI += " \
     crate://crates.io/colored/3.1.1 \
     crate://crates.io/compact_str/0.10.0 \
     crate://crates.io/condtype/1.3.0 \
-    crate://crates.io/console/0.16.4 \
+    crate://crates.io/console/0.16.6 \
     crate://crates.io/console_error_panic_hook/0.1.7 \
     crate://crates.io/console_log/1.1.0 \
     crate://crates.io/core-foundation-sys/0.8.7 \
@@ -174,7 +174,7 @@ SRC_URI += " \
     crate://crates.io/indoc/2.0.7 \
     crate://crates.io/inotify/0.11.0 \
     crate://crates.io/inotify-sys/0.1.5 \
-    crate://crates.io/insta/1.48.0 \
+    crate://crates.io/insta/1.49.0 \
     crate://crates.io/insta-cmd/0.7.0 \
     crate://crates.io/interpolator/0.5.0 \
     crate://crates.io/intrusive-collections/0.10.1 \
@@ -199,7 +199,7 @@ SRC_URI += " \
     crate://crates.io/kqueue-sys/1.0.4 \
     crate://crates.io/lazy_static/1.5.0 \
     crate://crates.io/leb128fmt/0.1.0 \
-    crate://crates.io/libc/0.2.189 \
+    crate://crates.io/libc/0.2.190 \
     crate://crates.io/libcst/1.9.0 \
     crate://crates.io/libcst_derive/1.9.0 \
     crate://crates.io/libm/0.2.16 \
@@ -228,7 +228,7 @@ SRC_URI += " \
     crate://crates.io/munge_macro/0.4.7 \
     crate://crates.io/natord/1.0.9 \
     crate://crates.io/newtype-uuid/1.3.2 \
-    crate://crates.io/nix/0.31.2 \
+    crate://crates.io/nix/0.31.3 \
     crate://crates.io/nom/7.1.3 \
     crate://crates.io/normalize-line-endings/0.3.0 \
     crate://crates.io/notify/8.2.0 \
@@ -353,7 +353,7 @@ SRC_URI += " \
     crate://crates.io/similar/3.2.0 \
     crate://crates.io/siphasher/1.0.1 \
     crate://crates.io/slab/0.4.12 \
-    crate://crates.io/smallvec/1.16.1 \
+    crate://crates.io/smallvec/1.16.2 \
     crate://crates.io/snapbox/1.0.0 \
     crate://crates.io/snapbox-macros/1.0.0 \
     crate://crates.io/stable_deref_trait/1.2.0 \
@@ -373,14 +373,14 @@ SRC_URI += " \
     crate://crates.io/terminal_size/0.4.4 \
     crate://crates.io/terminfo/0.9.0 \
     crate://crates.io/termtree/0.5.1 \
-    crate://crates.io/test-case/3.3.1 \
-    crate://crates.io/test-case-core/3.3.1 \
-    crate://crates.io/test-case-macros/3.3.1 \
+    crate://crates.io/test-case/3.4.0 \
+    crate://crates.io/test-case-core/3.4.0 \
+    crate://crates.io/test-case-macros/3.4.0 \
     crate://crates.io/thin-vec/0.2.20 \
     crate://crates.io/thiserror/1.0.69 \
-    crate://crates.io/thiserror/2.0.20 \
+    crate://crates.io/thiserror/2.0.21 \
     crate://crates.io/thiserror-impl/1.0.69 \
-    crate://crates.io/thiserror-impl/2.0.20 \
+    crate://crates.io/thiserror-impl/2.0.21 \
     crate://crates.io/thread_local/1.1.9 \
     crate://crates.io/tikv-jemalloc-sys/0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7 \
     crate://crates.io/tikv-jemallocator/0.6.1 \
@@ -419,7 +419,7 @@ SRC_URI += " \
     crate://crates.io/utf8-width/0.1.7 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.26.1 \
+    crate://crates.io/uuid/1.27.0 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version-ranges/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
@@ -498,12 +498,12 @@ SRC_URI += " \
     crate://crates.io/zerotrie/0.2.5 \
     crate://crates.io/zerovec/0.11.8 \
     crate://crates.io/zerovec-derive/0.11.6 \
-    crate://crates.io/zip/8.6.0 \
+    crate://crates.io/zip/9.0.5 \
     crate://crates.io/zlib-rs/0.5.5 \
     crate://crates.io/zmij/1.0.10 \
-    crate://crates.io/zstd/0.13.3 \
-    crate://crates.io/zstd-safe/7.2.4 \
-    crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7 \
+    crate://crates.io/zstd/0.14.3 \
+    crate://crates.io/zstd-safe/8.2.0 \
+    crate://crates.io/zstd-sys/2.1.2+zstd.1.5.7 \
 "
 
 SRC_URI[adler2-2.0.1.sha256sum] = "320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa"
@@ -566,7 +566,7 @@ SRC_URI[clap_complete_command-0.6.1.sha256sum] = "da8e198c052315686d36371e8a3c57
 SRC_URI[clap_complete_nushell-4.5.8.sha256sum] = "0a0c951694691e65bf9d421d597d68416c22de9632e884c28412cb8cd8b73dce"
 SRC_URI[clap_derive-4.6.7.sha256sum] = "f9c751b79415d4e559e3d1fcf128e09e720eb673a06d26cf6f392d37d75b66e0"
 SRC_URI[clap_lex-1.0.0.sha256sum] = "3a822ea5bc7590f9d40f1ba12c0dc3c2760f3482c6984db1573ad11031420831"
-SRC_URI[clearscreen-4.0.6.sha256sum] = "d669bb552908e336ad5681789752033b45566b7e591aeaac7a614e58e5d6d8f2"
+SRC_URI[clearscreen-5.0.0.sha256sum] = "6ebe9918b237e4e17e25a04d539d99ef3515417a85f703e0ed8bf44353eb17b3"
 SRC_URI[codspeed-5.0.1.sha256sum] = "7083f253260bcb4aaa3b4aa4c52973703dabc1a85c2f193997e2689aafa8a919"
 SRC_URI[codspeed-criterion-compat-5.0.1.sha256sum] = "d9f24251445188c69d50f10179d795424bd71b533b7e3f84fc03f26893b01af0"
 SRC_URI[codspeed-criterion-compat-walltime-5.0.1.sha256sum] = "5c38205d56e2cb4fe04b708de7f9653a3f1b89edbe3a20b28f21e9e525e9e061"
@@ -578,7 +578,7 @@ SRC_URI[colorchoice-1.0.4.sha256sum] = "b05b61dc5112cbb17e4b6cd61790d9845d138883
 SRC_URI[colored-3.1.1.sha256sum] = "faf9468729b8cbcea668e36183cb69d317348c2e08e994829fb56ebfdfbaac34"
 SRC_URI[compact_str-0.10.0.sha256sum] = "79fcda08c33bb58b97008b2cdada6622500e949e060f5913361763121abd2416"
 SRC_URI[condtype-1.3.0.sha256sum] = "baf0a07a401f374238ab8e2f11a104d2851bf9ce711ec69804834de8af45c7af"
-SRC_URI[console-0.16.4.sha256sum] = "4fe5f465a4f6fee88fad41b85d990f84c835335e85b5d9e6e63e0d06d28cba7c"
+SRC_URI[console-0.16.6.sha256sum] = "e96a4956774c13c126a8b5af4daa79384f4d826534c95a02d76afb39e2ab64e3"
 SRC_URI[console_error_panic_hook-0.1.7.sha256sum] = "a06aeb73f470f66dcdbf7223caeebb85984942f22f1adb2a088cf9668146bbbc"
 SRC_URI[console_log-1.1.0.sha256sum] = "86919cef3e37b9356ccf54d4421208c17ecfda01beae61393e7ffd72916c0ef1"
 SRC_URI[core-foundation-sys-0.8.7.sha256sum] = "773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b"
@@ -678,7 +678,7 @@ SRC_URI[indicatif-0.18.6.sha256sum] = "9433806cd6b4ec1aba79c021c7e4c58fb4c3b9977
 SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
 SRC_URI[inotify-0.11.0.sha256sum] = "f37dccff2791ab604f9babef0ba14fbe0be30bd368dc541e2b08d07c8aa908f3"
 SRC_URI[inotify-sys-0.1.5.sha256sum] = "e05c02b5e89bff3b946cedeca278abc628fe811e604f027c45a8aa3cf793d0eb"
-SRC_URI[insta-1.48.0.sha256sum] = "86f0f8fee8c926415c58d6ae43a08523a26faccb2323f5e6b644fe7dd4ef6b82"
+SRC_URI[insta-1.49.0.sha256sum] = "b67d3d2e287e4b86c10b3f3b641033d1f89b74bdb39d05f34952e2b9a6fe21cd"
 SRC_URI[insta-cmd-0.7.0.sha256sum] = "bffdf4af1db390cf0401535d7c1303cd079a074d28d8473b026fdb6559c41403"
 SRC_URI[interpolator-0.5.0.sha256sum] = "71dd52191aae121e8611f1e8dc3e324dd0dd1dee1e6dd91d10ee07a3cfb4d9d8"
 SRC_URI[intrusive-collections-0.10.1.sha256sum] = "80e165935eba36cb526af8389effd2005a741adcbb6ed32106cc68e3f7b92960"
@@ -703,7 +703,7 @@ SRC_URI[kqueue-1.1.1.sha256sum] = "eac30106d7dce88daf4a3fcb4879ea939476d5074a9b7
 SRC_URI[kqueue-sys-1.0.4.sha256sum] = "ed9625ffda8729b85e45cf04090035ac368927b8cebc34898e7c120f52e4838b"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
 SRC_URI[leb128fmt-0.1.0.sha256sum] = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
-SRC_URI[libc-0.2.189.sha256sum] = "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2"
+SRC_URI[libc-0.2.190.sha256sum] = "ce5d3ddc6d3fa000eb1536d85e147bfe31aacaba692ed6a876f95cb7c855be78"
 SRC_URI[libcst-1.9.0.sha256sum] = "21b68d9c60cba9c333f89596ef5c4d3b6c9bd0b7d2e48a9810df6fa7976102a3"
 SRC_URI[libcst_derive-1.9.0.sha256sum] = "57a1ac6fb3fbdc3408a2f138e54d11c3dd338f12c2efc3db47477cc2227d89c2"
 SRC_URI[libm-0.2.16.sha256sum] = "b6d2cec3eae94f9f509c767b45932f1ada8350c4bdb85af2fcab4a3c14807981"
@@ -732,7 +732,7 @@ SRC_URI[munge-0.4.7.sha256sum] = "5e17401f259eba956ca16491461b6e8f72913a0a114e39
 SRC_URI[munge_macro-0.4.7.sha256sum] = "4568f25ccbd45ab5d5603dc34318c1ec56b117531781260002151b8530a9f931"
 SRC_URI[natord-1.0.9.sha256sum] = "308d96db8debc727c3fd9744aac51751243420e46edf401010908da7f8d5e57c"
 SRC_URI[newtype-uuid-1.3.2.sha256sum] = "5c012d14ef788ab066a347d19e3dda699916c92293b05b85ba2c76b8c82d2830"
-SRC_URI[nix-0.31.2.sha256sum] = "5d6d0705320c1e6ba1d912b5e37cf18071b6c2e9b7fa8215a1e8a7651966f5d3"
+SRC_URI[nix-0.31.3.sha256sum] = "cf20d2fde8ff38632c426f1165ed7436270b44f199fc55284c38276f9db47c3d"
 SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
 SRC_URI[normalize-line-endings-0.3.0.sha256sum] = "61807f77802ff30975e01f4f071c8ba10c022052f98b3294119f3e615d13e5be"
 SRC_URI[notify-8.2.0.sha256sum] = "4d3d07927151ff8575b7087f245456e549fea62edf0ec4e565a5ee50c8402bc3"
@@ -857,7 +857,7 @@ SRC_URI[similar-2.7.0.sha256sum] = "bbbb5d9659141646ae647b42fe094daf6c6192d16208
 SRC_URI[similar-3.2.0.sha256sum] = "4f66ca1f7aca2474dc10c942eb22feffc897735f54cd1db90138c2fddb490987"
 SRC_URI[siphasher-1.0.1.sha256sum] = "56199f7ddabf13fe5074ce809e7d3f42b42ae711800501b5b16ea82ad029c39d"
 SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
-SRC_URI[smallvec-1.16.1.sha256sum] = "ba467056f1b547ed52077911161fc86985becbc60e8e1857c8a144dab0def891"
+SRC_URI[smallvec-1.16.2.sha256sum] = "f9395f0f0eee849a9b707b2f06bb92a6a422090e2123bb2ef8e87a0e61892a8e"
 SRC_URI[snapbox-1.0.0.sha256sum] = "71d70a71b68054cbe88708f77abfc4bd2daf75028f8f55f4f1cff63565df89ea"
 SRC_URI[snapbox-macros-1.0.0.sha256sum] = "d248cef42e1456ab2f7149c0376985351b7d849ea9ad2a957bf15ddfebf1fdf9"
 SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
@@ -877,14 +877,14 @@ SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296
 SRC_URI[terminal_size-0.4.4.sha256sum] = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
 SRC_URI[terminfo-0.9.0.sha256sum] = "d4ea810f0692f9f51b382fff5893887bb4580f5fa246fde546e0b13e7fcee662"
 SRC_URI[termtree-0.5.1.sha256sum] = "8f50febec83f5ee1df3015341d8bd429f2d1cc62bcba7ea2076759d315084683"
-SRC_URI[test-case-3.3.1.sha256sum] = "eb2550dd13afcd286853192af8601920d959b14c401fcece38071d53bf0768a8"
-SRC_URI[test-case-core-3.3.1.sha256sum] = "adcb7fd841cd518e279be3d5a3eb0636409487998a4aff22f3de87b81e88384f"
-SRC_URI[test-case-macros-3.3.1.sha256sum] = "5c89e72a01ed4c579669add59014b9a524d609c0c88c6a585ce37485879f6ffb"
+SRC_URI[test-case-3.4.0.sha256sum] = "124953e7f67cb0b2fcfb87e899e4ae5a64fb68e2e160767933cc67b646fb0042"
+SRC_URI[test-case-core-3.4.0.sha256sum] = "bd097615b407247e102046ba34426bb594923ab3554cf0f3cdfed050f1a5a3e8"
+SRC_URI[test-case-macros-3.4.0.sha256sum] = "f4ce35ece947bccac166e1ded639133827a953f69a48ba134d17f91108333082"
 SRC_URI[thin-vec-0.2.20.sha256sum] = "4568d7e143ec86d2021c338bae2afa88699e84b8e0af523626654fe6f03a1748"
 SRC_URI[thiserror-1.0.69.sha256sum] = "b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52"
-SRC_URI[thiserror-2.0.20.sha256sum] = "ec86235f5fcc2a73650310756d2ac5b138a5780bbbdfae3eeccec992c435ba4f"
+SRC_URI[thiserror-2.0.21.sha256sum] = "09e52cb86a36cede5cb101bf8908837b3e4c6e5e59fe7fd85c23fb56200d189e"
 SRC_URI[thiserror-impl-1.0.69.sha256sum] = "4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1"
-SRC_URI[thiserror-impl-2.0.20.sha256sum] = "bc04cd3e1236dd4a98afca4569f2deb3f120e5422a4023be2cb683f8486292af"
+SRC_URI[thiserror-impl-2.0.21.sha256sum] = "fe5197923287db20a58125f0bc85c062f7f2c892de97b18c356f9efb14b28524"
 SRC_URI[thread_local-1.1.9.sha256sum] = "f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185"
 SRC_URI[tikv-jemalloc-sys-0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7.sha256sum] = "cd8aa5b2ab86a2cefa406d889139c162cbb230092f7d1d7cbc1716405d852a3b"
 SRC_URI[tikv-jemallocator-0.6.1.sha256sum] = "0359b4327f954e0567e69fb191cf1436617748813819c94b8cd4a431422d053a"
@@ -923,7 +923,7 @@ SRC_URI[urlencoding-2.1.3.sha256sum] = "daf8dba3b7eb870caf1ddeed7bc9d2a049f3cfdf
 SRC_URI[utf8-width-0.1.7.sha256sum] = "86bd8d4e895da8537e5315b8254664e6b769c4ff3db18321b297a1e7004392e3"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.26.1.sha256sum] = "2ef6dac1e96601b4fb3acccccff2139741fcb757cb9a36089bf5be91cfb285ce"
+SRC_URI[uuid-1.27.0.sha256sum] = "97277d36b9c3ace13e58fa6e753f8b0bbbf302a18dd193240d70f9e29681059a"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version-ranges-0.1.1.sha256sum] = "f8d079415ceb2be83fc355adbadafe401307d5c309c7e6ade6638e6f9f42f42d"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
@@ -1002,9 +1002,9 @@ SRC_URI[zerofrom-derive-0.1.6.sha256sum] = "d71e5d6e06ab090c67b5e44993ec16b72dcb
 SRC_URI[zerotrie-0.2.5.sha256sum] = "4ea269c3bd32f0a32c321907a2ae912ba6f4649bb0fc764a15627e99a7095a3f"
 SRC_URI[zerovec-0.11.8.sha256sum] = "bb0464e17806c1d976d5cba29399c7f08e516e279e2ba493f63123b5fca67dd8"
 SRC_URI[zerovec-derive-0.11.6.sha256sum] = "34df6fc39dbd26ddc9c10e6a2984476e13acce22e64e4487636ef494369225da"
-SRC_URI[zip-8.6.0.sha256sum] = "2d04a6b5381502aa6087c94c669499eb1602eb9c5e8198e534de571f7154809b"
+SRC_URI[zip-9.0.5.sha256sum] = "6e04976da629d3b04204ba8105b396a193af8ad2583b2c79bfb3ab8af580a11e"
 SRC_URI[zlib-rs-0.5.5.sha256sum] = "40990edd51aae2c2b6907af74ffb635029d5788228222c4bb811e9351c0caad3"
 SRC_URI[zmij-1.0.10.sha256sum] = "30e0d8dffbae3d840f64bda38e28391faef673a7b5a6017840f2a106c8145868"
-SRC_URI[zstd-0.13.3.sha256sum] = "e91ee311a569c327171651566e07972200e76fcfe2242a4fa446149a3881c08a"
-SRC_URI[zstd-safe-7.2.4.sha256sum] = "8f49c4d5f0abb602a93fb8736af2a4f4dd9512e36f7f570d66e65ff867ed3b9d"
-SRC_URI[zstd-sys-2.0.16+zstd.1.5.7.sha256sum] = "91e19ebc2adc8f83e43039e79776e3fda8ca919132d68a1fed6a5faca2683748"
+SRC_URI[zstd-0.14.3.sha256sum] = "db3ae9bf90af6e40197bef767eeefc46ad6397420fe873830bd85e5fbbfb3c70"
+SRC_URI[zstd-safe-8.2.0.sha256sum] = "ded520f16b29e1a9b771c722221b2b0a0398c2316d9bb3c42b458a5414d7434b"
+SRC_URI[zstd-sys-2.1.2+zstd.1.5.7.sha256sum] = "481ada9c543b2323cbb7bbdbb5249177fbf0188ed959ed2c15e4b22421c84ed3"
diff --git a/meta-python/recipes-devtools/python/python3-ruff/0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch b/meta-python/recipes-devtools/python/python3-ruff/0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch
index 2fbda610aa..788f6ec31d 100644
--- a/meta-python/recipes-devtools/python/python3-ruff/0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch
+++ b/meta-python/recipes-devtools/python/python3-ruff/0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch
@@ -1,4 +1,4 @@
-From 3db4e7361ecdafec16b5ea23a2a21e62bc5d87bd Mon Sep 17 00:00:00 2001
+From fb8bd491698715d72568a10b118afebb31f550c9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Wed, 21 Oct 2026 18:00:00 -0700
 Subject: [PATCH] ruff: Use portable-atomic for AtomicU64 on targets without
@@ -31,7 +31,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  4 files changed, 58 insertions(+), 4 deletions(-)
 
 diff --git a/Cargo.lock b/Cargo.lock
-index 84eda7b..4444142 100644
+index 1a222f1..7e9a657 100644
 --- a/Cargo.lock
 +++ b/Cargo.lock
 @@ -3123,6 +3123,7 @@ dependencies = [
@@ -43,10 +43,10 @@ index 84eda7b..4444142 100644
   "regex",
   "rkyv",
 diff --git a/Cargo.toml b/Cargo.toml
-index f5f3f6c..288535a 100644
+index 7a20227..a919431 100644
 --- a/Cargo.toml
 +++ b/Cargo.toml
-@@ -172,6 +172,7 @@ pathdiff = { version = "0.2.1", default-features = false }
+@@ -173,6 +173,7 @@ pathdiff = { version = "0.2.1", default-features = false }
  phf = { version = "0.14.0", default-features = false }
  phf_codegen = { version = "0.14.0", default-features = false }
  pep440_rs = { version = "0.7.1", default-features = false }
@@ -55,7 +55,7 @@ index f5f3f6c..288535a 100644
  proc-macro2 = { version = "1.0.79", default-features = false, features = ["proc-macro"] }
  pyproject-toml = { version = "0.13.4", default-features = false }
 diff --git a/crates/ruff/Cargo.toml b/crates/ruff/Cargo.toml
-index d88c322..a0de836 100644
+index 718cbfa..301de70 100644
 --- a/crates/ruff/Cargo.toml
 +++ b/crates/ruff/Cargo.toml
 @@ -77,6 +77,9 @@ tikv-jemallocator = { workspace = true }
diff --git a/meta-python/recipes-devtools/python/python3-ruff_0.17.3.bb b/meta-python/recipes-devtools/python/python3-ruff_0.17.4.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-ruff_0.17.3.bb
rename to meta-python/recipes-devtools/python/python3-ruff_0.17.4.bb
index 0c3a0dec55..2c97383b2c 100644
--- a/meta-python/recipes-devtools/python/python3-ruff_0.17.3.bb
+++ b/meta-python/recipes-devtools/python/python3-ruff_0.17.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e679ca4f742cbfa29ab6a499529c2d39"
 
 SRC_URI += "file://0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch"
 
-SRC_URI[sha256sum] = "a57049c8addb3662073859bb55a7ad35aa54f8a7c9ed268911d1333c5aadaaa9"
+SRC_URI[sha256sum] = "f32d178b50e826e00f6c6c1be3f56333068acb9b67fe167143527fa9b81e890d"
 
 inherit pypi python_maturin cargo-update-recipe-crates
 
-- 
2.47.3

