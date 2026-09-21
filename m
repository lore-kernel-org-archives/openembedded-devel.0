Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9ECFC982EE
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 12:22:42 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47605.1789993352716399942
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 05:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cOqwMQ9X;
 spf=pass (domain: konsulko.com, ip: 74.125.225.141, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so28887725e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 05:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789993351; x=1790598151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QBMo/QcD4ovOTaWfWKtg2YZQjsS352QGUH6pJqfTBAg=;
        b=cOqwMQ9XgFTqUojwznmlCI4Oc49P66Svwyf8QZA/iZkgnjbDr+Wt4AJyhpEAbHd8Tc
         89RaS2wsp7fxrLjR2njpISFmeoVdg+8jP5RotePyxb8Zac0W9nKJEPsn0qKTvfofcinC
         MR21UWNpodjZ2RonSILj5ofSczjDhpEphoQkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993351; x=1790598151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QBMo/QcD4ovOTaWfWKtg2YZQjsS352QGUH6pJqfTBAg=;
        b=JVT52ixb51ZZwG061BCa/n6U7Us4CNzfmjAUAAZujfujkNDJERgNXXEFH4unupNO+G
         KQEovsqrs9+dBl0mqyWc7i1uUGiABEUZKLaVprF3/67zXZJAySA1MPcykYD88pOcpSVN
         GvcQfeqpE8Lq96mtqIldC0+AWDpWzJU4NkzfUgC1m1PjHp+KvjWnwoRUlUKqwtuPCJot
         +lWfIx32pWyZ8bzTPtMpWODf5NPkMaIsmaY1RmqeFvm/K3aJkI8vO+Q18JgNWQdzi772
         aq2z1d/O9cdsOQwmSRIf1Lx+/NOraCaIxdq2OL8CWShBnEE5tUOH3vLnm96Q4cl7iSwp
         v+7w==
X-Gm-Message-State: AFuF++nPPShSGdokYT+vkubKOGO3KuwdE87j7nQ1MQwy69FQA2Z9etqE
	DITLjn4ReDZyBBahc5JJTgfFuy8hz6km0LV4IWGI6dS/pRdV1qYz+6cwOvvKFfGp52uMjA/B5nc
	JdaXY
X-Gm-Gg: AYBFou0hUboEEA6ztRLinDuvzwthvDq3vD+AL6PLJkq0J6vDL2blNC14Hq/2FKPrkoD
	ys5byUUR/MDO7TA+M4nmBGIt78Fw8PmRQS9rgDqGHYjeBcvPsgdwQvk1xy7BYRZJJESQf7Ue9Tv
	U5y/HW+o4HRtrdZ9gjM2YNIzoQs5d0xOsuJIJL57YHaeXah6UKKYopZwPG4ot3Etm1WQfML7MGK
	lxChgXh13Qc1IAFW9XWaevO+RNy5H38aX/oCGnlk9Rju7gZNweedSSkHorfbdiqSLJa5aeEyoDU
	GT2sAnmY9zBwQMcfnaB3WGcBt/F3gn4TGKCcbCGXgymWFgYs28ycli5I9bFwG6W+TSh2HoXuGIk
	J24LWRET15cJfreNPgI3iXIZRebfH7pEJFjzuIBWMjSrg+XCfB7iKHZWZTImE/R8Jt1yWoM6Gpy
	sUdxfREIbzZrZQFcCxHgqkrHRIGlcAlpSZAI6B0ifNIxF9YhOI78UZe4uxYTT4rpyWqSzBnH/yU
	6oTiqinZ4iHQ83HaoEfDgJ95R1U8lPrJYDu3mSdXvCiqnRZUMV8Xr+RcnSDF3w7J7gYGHhPoZVu
	MJ5fPhEu6R35iuyU8fuRWQ7Kz3xDCZr2WNc=
X-Received: by 2002:a05:600c:3f07:b0:49c:ee01:8c53 with SMTP id 5b1f17b1804b1-49fc56713c5mr158600075e9.2.1789993350902;
        Mon, 21 Sep 2026 05:22:30 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc58a1176sm208150005e9.2.2026.09.21.05.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:22:30 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-ruff: Upgrade 0.16.4 -> 0.16.8
Date: Mon, 21 Sep 2026 15:22:24 +0300
Message-ID: <20260921122224.4185627-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921122224.4185627-1-leon.anavi@konsulko.com>
References: <20260921122224.4185627-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 12:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130166

Upgrade to release 0.16.8:

Bug fixes

- Visit functional TypedDict keyword arguments correctly
- [flake8-simplify] Detect nested async with under sync parent
  (SIM117)
- [flake8-simplify] Preserve operand order in SIM109 fix
- [pyupgrade] Preserve required parentheses in multiline UP040
  fixes
- [pyupgrade] Skip TypeVarTuple and ParamSpec conversions with
  bounds or constraints (UP040, UP046, UP047)

Rule changes

- Add support for __lazy_modules__
- Recognize PEP-728 TypedDict class keywords
- Recognize quoted types in typing.TypeForm
- Support conditional assignment to __lazy_modules__
- [flake8-type-checking] Prefer lazy imports over TYPE_CHECKING on
  Python 3.15 and later (TC001, TC002, TC003)
- [pyupgrade] Make the fix for UP040 always unsafe
- [pyupgrade] Stop recommending deprecated ByteString aliases
  (UP035)
- [ruff, flake8-use-pathlib] Recognize the parent_mode argument
  (RUF064, PTH103)
- [ruff] Detect \Z in pytest.raises() match patterns (RUF043)

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-ruff-crates.inc            | 44 +++++++++----------
 ...-ruff_0.16.4.bb => python3-ruff_0.16.8.bb} |  2 +-
 2 files changed, 23 insertions(+), 23 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ruff_0.16.4.bb => python3-ruff_0.16.8.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-ruff-crates.inc b/meta-python/recipes-devtools/python/python3-ruff-crates.inc
index 4491d6e3bf..03b8a06f2f 100644
--- a/meta-python/recipes-devtools/python/python3-ruff-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-ruff-crates.inc
@@ -37,7 +37,7 @@ SRC_URI += " \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/block2/0.6.2 \
     crate://crates.io/boxcar/0.2.14 \
-    crate://crates.io/bstr/1.13.0 \
+    crate://crates.io/bstr/1.13.1 \
     crate://crates.io/bumpalo/3.19.0 \
     crate://crates.io/bytecheck/0.8.2 \
     crate://crates.io/bytecheck_derive/0.8.2 \
@@ -50,13 +50,13 @@ SRC_URI += " \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/cfg_aliases/0.2.1 \
     crate://crates.io/chacha20/0.10.0 \
-    crate://crates.io/char_str/0.0.2 \
+    crate://crates.io/char_str/0.0.4 \
     crate://crates.io/chrono/0.4.44 \
     crate://crates.io/ciborium/0.2.2 \
     crate://crates.io/ciborium-io/0.2.2 \
     crate://crates.io/ciborium-ll/0.2.2 \
-    crate://crates.io/clap/4.6.5 \
-    crate://crates.io/clap_builder/4.6.5 \
+    crate://crates.io/clap/4.6.6 \
+    crate://crates.io/clap_builder/4.6.6 \
     crate://crates.io/clap_complete/4.5.58 \
     crate://crates.io/clap_complete_command/0.6.1 \
     crate://crates.io/clap_complete_nushell/4.5.8 \
@@ -138,8 +138,8 @@ SRC_URI += " \
     crate://crates.io/futures-util/0.3.32 \
     crate://crates.io/gen-lsp-types/0.11.0 \
     crate://crates.io/generic-array/0.14.7 \
-    crate://crates.io/get-size-derive2/0.10.3 \
-    crate://crates.io/get-size2/0.10.3 \
+    crate://crates.io/get-size-derive2/0.11.0 \
+    crate://crates.io/get-size2/0.11.0 \
     crate://crates.io/getopts/0.2.24 \
     crate://crates.io/getrandom/0.2.16 \
     crate://crates.io/getrandom/0.3.4 \
@@ -317,8 +317,8 @@ SRC_URI += " \
     crate://crates.io/regex-lite/0.1.7 \
     crate://crates.io/regex-syntax/0.8.11 \
     crate://crates.io/rend/0.5.3 \
-    crate://crates.io/rkyv/0.8.17 \
-    crate://crates.io/rkyv_derive/0.8.17 \
+    crate://crates.io/rkyv/0.8.18 \
+    crate://crates.io/rkyv_derive/0.8.18 \
     crate://crates.io/ron/0.12.0 \
     crate://crates.io/rust-stemmers/1.2.0 \
     crate://crates.io/rustc-hash/2.1.3 \
@@ -377,9 +377,9 @@ SRC_URI += " \
     crate://crates.io/test-case-macros/3.3.1 \
     crate://crates.io/thin-vec/0.2.19 \
     crate://crates.io/thiserror/1.0.69 \
-    crate://crates.io/thiserror/2.0.19 \
+    crate://crates.io/thiserror/2.0.20 \
     crate://crates.io/thiserror-impl/1.0.69 \
-    crate://crates.io/thiserror-impl/2.0.19 \
+    crate://crates.io/thiserror-impl/2.0.20 \
     crate://crates.io/thread_local/1.1.9 \
     crate://crates.io/tikv-jemalloc-sys/0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7 \
     crate://crates.io/tikv-jemallocator/0.6.1 \
@@ -420,7 +420,7 @@ SRC_URI += " \
     crate://crates.io/utf8-width/0.1.7 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.24.0 \
+    crate://crates.io/uuid/1.24.1 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version-ranges/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
@@ -544,7 +544,7 @@ SRC_URI[bitvec-1.1.1.sha256sum] = "ddcec3d12c579d40898fe0a9a358a803c23e9c52ca3c4
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[block2-0.6.2.sha256sum] = "cdeb9d870516001442e364c5220d3574d2da8dc765554b4a617230d33fa58ef5"
 SRC_URI[boxcar-0.2.14.sha256sum] = "36f64beae40a84da1b4b26ff2761a5b895c12adc41dc25aaee1c4f2bbfe97a6e"
-SRC_URI[bstr-1.13.0.sha256sum] = "1f7dc094d718f2e1c1559ad110e27eeaae14a5465d3d56dd6dbd793079fbd530"
+SRC_URI[bstr-1.13.1.sha256sum] = "6bb31b46c14244e20ee9984b11bf5c992b91fb6939fea616e3512c8baecdbe5f"
 SRC_URI[bumpalo-3.19.0.sha256sum] = "46c5e41b57b8bba42a04676d81cb89e9ee8e859a1a66f80a5a72e1cb76b34d43"
 SRC_URI[bytecheck-0.8.2.sha256sum] = "0caa33a2c0edca0419d15ac723dff03f1956f7978329b1e3b5fdaaaed9d3ca8b"
 SRC_URI[bytecheck_derive-0.8.2.sha256sum] = "89385e82b5d1821d2219e0b095efa2cc1f246cbf99080f3be46a1a85c0d392d9"
@@ -557,13 +557,13 @@ SRC_URI[cc-1.2.65.sha256sum] = "e228eec9be7c17ccb640b59b36a5cd805ea2a564a4c5e162
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[cfg_aliases-0.2.1.sha256sum] = "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
 SRC_URI[chacha20-0.10.0.sha256sum] = "6f8d983286843e49675a4b7a2d174efe136dc93a18d69130dd18198a6c167601"
-SRC_URI[char_str-0.0.2.sha256sum] = "576ba56f6ca18ebb069d0d07260407171712aff4dfe15ee3f8982dc16a455bcf"
+SRC_URI[char_str-0.0.4.sha256sum] = "c9cba78a5abb515610e10af297615434b019755b5d7be14e559ff5340dff50c4"
 SRC_URI[chrono-0.4.44.sha256sum] = "c673075a2e0e5f4a1dde27ce9dee1ea4558c7ffe648f576438a20ca1d2acc4b0"
 SRC_URI[ciborium-0.2.2.sha256sum] = "42e69ffd6f0917f5c029256a24d0161db17cea3997d185db0d35926308770f0e"
 SRC_URI[ciborium-io-0.2.2.sha256sum] = "05afea1e0a06c9be33d539b876f1ce3692f4afea2cb41f740e7743225ed1c757"
 SRC_URI[ciborium-ll-0.2.2.sha256sum] = "57663b653d948a338bfb3eeba9bb2fd5fcfaecb9e199e87e1eda4d9e8b240fd9"
-SRC_URI[clap-4.6.5.sha256sum] = "301b56658598e48f3648647ac6fc887be7e7108eddfa4e9b63fcf3ec58c0cadf"
-SRC_URI[clap_builder-4.6.5.sha256sum] = "94a65403d1a1bd28f7dc68eb8506e8874808ee5eecb59298de588e2e1407a078"
+SRC_URI[clap-4.6.6.sha256sum] = "473c7e07f409a8d772161724aa8db6a765a2532a70f9667eeb7b49d3d02fbdca"
+SRC_URI[clap_builder-4.6.6.sha256sum] = "7b48fea5a88e9ae728a2dcbedbfc0e730f7d60da42e1cb049a83c9fb8b789889"
 SRC_URI[clap_complete-4.5.58.sha256sum] = "75bf0b32ad2e152de789bb635ea4d3078f6b838ad7974143e99b99f45a04af4a"
 SRC_URI[clap_complete_command-0.6.1.sha256sum] = "da8e198c052315686d36371e8a3c5778b7852fc75cc313e4e11eeb7a644a1b62"
 SRC_URI[clap_complete_nushell-4.5.8.sha256sum] = "0a0c951694691e65bf9d421d597d68416c22de9632e884c28412cb8cd8b73dce"
@@ -645,8 +645,8 @@ SRC_URI[futures-task-0.3.32.sha256sum] = "037711b3d59c33004d3856fbdc83b99d4ff37a
 SRC_URI[futures-util-0.3.32.sha256sum] = "389ca41296e6190b48053de0321d02a77f32f8a5d2461dd38762c0593805c6d6"
 SRC_URI[gen-lsp-types-0.11.0.sha256sum] = "b64887ac3a8083427ae935a7296db876871582cd57eac077564f8bc18fa49116"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
-SRC_URI[get-size-derive2-0.10.3.sha256sum] = "c736d226c32e496b8377813b52269e11ad3a48d8373b68862d0364f04fd1229d"
-SRC_URI[get-size2-0.10.3.sha256sum] = "b411f34418305908ab15a82ff78958c2a9aee9a272b2a2e663836b20a4e4b9d3"
+SRC_URI[get-size-derive2-0.11.0.sha256sum] = "7efe46d2adb529015748742f1a38594039ce357dbb21e6d178de342cfce468d4"
+SRC_URI[get-size2-0.11.0.sha256sum] = "d4d338de392104417fe6fdbe588c52383b9236956d8afe5654f0077176edc632"
 SRC_URI[getopts-0.2.24.sha256sum] = "cfe4fbac503b8d1f88e6676011885f34b7174f46e59956bba534ba83abded4df"
 SRC_URI[getrandom-0.2.16.sha256sum] = "335ff9f135e4384c8150d6f27c6daed433577f86b4750418338c01a1a2528592"
 SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
@@ -824,8 +824,8 @@ SRC_URI[regex-automata-0.4.18.sha256sum] = "ad8553b9b26413251cbf30e620595c7a41b3
 SRC_URI[regex-lite-0.1.7.sha256sum] = "943f41321c63ef1c92fd763bfe054d2668f7f225a5c29f0105903dc2fc04ba30"
 SRC_URI[regex-syntax-0.8.11.sha256sum] = "d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4"
 SRC_URI[rend-0.5.3.sha256sum] = "cadadef317c2f20755a64d7fdc48f9e7178ee6b0e1f7fce33fa60f1d68a276e6"
-SRC_URI[rkyv-0.8.17.sha256sum] = "815cc8a37159a463064825246cadb07961e25cd9885908606f6d08a98d8f8874"
-SRC_URI[rkyv_derive-0.8.17.sha256sum] = "c0ed1a78a1b19d184b0daa629dd9a024573173ec7d485b287cb369fb3607cc1c"
+SRC_URI[rkyv-0.8.18.sha256sum] = "d9776093b7ca170454ab1406954f7b7d97a57c51dc6c0642957fb2ef25c2d399"
+SRC_URI[rkyv_derive-0.8.18.sha256sum] = "1c25ef604ac7dd839d44d64648952ea23c97866f124ff671b0ed2cf3ad9bb06e"
 SRC_URI[ron-0.12.0.sha256sum] = "fd490c5b18261893f14449cbd28cb9c0b637aebf161cd77900bfdedaff21ec32"
 SRC_URI[rust-stemmers-1.2.0.sha256sum] = "e46a2036019fdb888131db7a4c847a1063a7493f971ed94ea82c67eada63ca54"
 SRC_URI[rustc-hash-2.1.3.sha256sum] = "6b1e7f9a428571be2dc5bc0505c13fb6bf936822b894ec87abf8a08a4e51742d"
@@ -884,9 +884,9 @@ SRC_URI[test-case-core-3.3.1.sha256sum] = "adcb7fd841cd518e279be3d5a3eb063640948
 SRC_URI[test-case-macros-3.3.1.sha256sum] = "5c89e72a01ed4c579669add59014b9a524d609c0c88c6a585ce37485879f6ffb"
 SRC_URI[thin-vec-0.2.19.sha256sum] = "79def32ffcd477db1ff26f76dab9e3a91f0bd42a85ca96577089b24623056f9d"
 SRC_URI[thiserror-1.0.69.sha256sum] = "b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52"
-SRC_URI[thiserror-2.0.19.sha256sum] = "09a43598840e33d5b0331f38c5e30d13bb11c11210a4b58f0d9b18a5a5eefcd9"
+SRC_URI[thiserror-2.0.20.sha256sum] = "ec86235f5fcc2a73650310756d2ac5b138a5780bbbdfae3eeccec992c435ba4f"
 SRC_URI[thiserror-impl-1.0.69.sha256sum] = "4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1"
-SRC_URI[thiserror-impl-2.0.19.sha256sum] = "43cbfe0cf76104d42a574802844187e84a305e531ed54455f11fbde0f10541cd"
+SRC_URI[thiserror-impl-2.0.20.sha256sum] = "bc04cd3e1236dd4a98afca4569f2deb3f120e5422a4023be2cb683f8486292af"
 SRC_URI[thread_local-1.1.9.sha256sum] = "f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185"
 SRC_URI[tikv-jemalloc-sys-0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7.sha256sum] = "cd8aa5b2ab86a2cefa406d889139c162cbb230092f7d1d7cbc1716405d852a3b"
 SRC_URI[tikv-jemallocator-0.6.1.sha256sum] = "0359b4327f954e0567e69fb191cf1436617748813819c94b8cd4a431422d053a"
@@ -927,7 +927,7 @@ SRC_URI[urlencoding-2.1.3.sha256sum] = "daf8dba3b7eb870caf1ddeed7bc9d2a049f3cfdf
 SRC_URI[utf8-width-0.1.7.sha256sum] = "86bd8d4e895da8537e5315b8254664e6b769c4ff3db18321b297a1e7004392e3"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.24.0.sha256sum] = "bf3923a6f5c4c6382e0b653c4117f48d631ea17f38ed86e2a828e6f7412f5239"
+SRC_URI[uuid-1.24.1.sha256sum] = "2cefc03fd367c0c6d4305de1b312cf00248c4114f4a0418ce6a6af769e3b0bd9"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version-ranges-0.1.1.sha256sum] = "f8d079415ceb2be83fc355adbadafe401307d5c309c7e6ade6638e6f9f42f42d"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
diff --git a/meta-python/recipes-devtools/python/python3-ruff_0.16.4.bb b/meta-python/recipes-devtools/python/python3-ruff_0.16.8.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-ruff_0.16.4.bb
rename to meta-python/recipes-devtools/python/python3-ruff_0.16.8.bb
index 8afbb76183..38151a5bd3 100644
--- a/meta-python/recipes-devtools/python/python3-ruff_0.16.4.bb
+++ b/meta-python/recipes-devtools/python/python3-ruff_0.16.8.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e679ca4f742cbfa29ab6a499529c2d39"
 
 DEPENDS += "python3-maturin-native"
 
-SRC_URI[sha256sum] = "13171aa9d9af2240ee3504e639de73122c67e74036de5ba2e1d01422cd17e3dc"
+SRC_URI[sha256sum] = "9247bf92b5f04d825c8639a4fe423ec2e4222acd9222e58412b0dab7e442798b"
 
 inherit pypi python_setuptools3_rust cargo-update-recipe-crates
 
-- 
2.47.3


