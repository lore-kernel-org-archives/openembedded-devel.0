Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14874.1793092909875981093
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pZIanNy/;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so24399185e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092908; x=1793697708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekyZEPQzt7mGwzr9fvh2ptpAxSA/cIupggPSrMiEdw8=;
        b=pZIanNy/uXPPlFJOdar8T77m1Riaz2D92vL1gLF9TPaI/1Ii6aGVI6GpU6oPyHyxPL
         xOFaj1dF61IWW/6bquos2fKSY9tWHDqddX3B1xUsbxH7OQ25TBmO9F4lajdY0c3Vekel
         miYuRNeBpfDpX9UsPvawHAcoRDoNDBR47+XsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092908; x=1793697708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ekyZEPQzt7mGwzr9fvh2ptpAxSA/cIupggPSrMiEdw8=;
        b=kfvlKaZtsEUwnUwAnP/fhLvJlhXQsixe2AeOfDbP6HxuwgSNOKymPLQfe14l/K8UTS
         x2fw7Y4YF04SZ1LxVFKdRhKDPYjhjxtz7KzKjiWVkLdkz4zHbFBpigE0aABW1zY36bdR
         /bWnt9VEuUvI1vz/PEIBwwtzcyQE53W+mpy50yyiFK09GPkfYZYx+eLr62RBKRK5AyVE
         eoJzrWLcCwh7OQdcApI0BgkKdibk65fJ2u0XpHFr70LyBDfsB8y/QrZkSS9lkNt9127C
         WkZwCEawbIkq/Wr5dIcltEczQT85RVgZUTMZx7BDm99Stcj4yQKLSdQckOf7zsWYLF+P
         Fg9g==
X-Gm-Message-State: AFq9FYITJrd5kFksLwhsrxhZAk4FZ/XPALamybMDwQtS4Dx3CPby+1k1
	ne8JbKtUuP955mKs9FQUd9E2+WwSutKjujzLH+EnIzvK/Iw7n/V66LAEpCL+fxCMXUh7FWLj0xv
	1hNgI
X-Gm-Gg: AYBFou1esEmL0UJaGyB+s0ML1XTh1iFplRhDN65tSwgZ0GaMgOl8q/YzgEMgdzCwHXo
	DL+rGtTjm53rB4ZhoboaBMf+3ySydtt8a8DUe4BRHzZhQxKC4Ui3KdkNzeThz6oyg4zjT7TGEDL
	26CRkHzt5/ImN9ZHu9UZ6+PlFAvy+SP3h9bsJQR7vzixIBOq+FqrP9E2EkIt4ydy9ZrDWLLtDRh
	aig6QixFtY4T6p+BEyRRXy4EGWlDfCJt81jYJls84gRhmQJKqfYBUlol9om9hCbJ21GXCzbuNnG
	y0yPutNRKgjobCuy7hLPAQ6ywKHUmlOb9oRkX2n962HvAABvPCdmZqiYTHYOGL31MV9EkwwmCL+
	cs7C8cB1VCB7bFa9nlNvE65a0yYBLQO0ssYlV5jIizNj6uYMFTV9CVEwApLqnSpQpPXpGXLYmn7
	PMszAQbiMC/nU8IQf/oCN9d7QwGB61ShZMkH3xdM5hamo3XZR0Y4DfTAu7ATDmh8/26INrYGF/K
	F2bSYjySTVk6JBiKcHqrunUD9FFu1fhLMEC78gN9EuZy/NCfSaCW4FjZJ7QgwpQVMgjaLgbO6hq
	mcjMdJUKlh+JCBDgYH1Nyz/MT/QUCXJM1LC/UFTUgpudG+AsXSFP5PWuG4LR+D3U5FHuun0QggK
	ofMOuXw==
X-Received: by 2002:a05:600c:3acb:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a35aca4fe1mr170858405e9.16.1793092908052;
        Tue, 27 Oct 2026 02:21:48 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:47 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 60/61] python3-ruff: Upgrade 0.17.1 -> 0.17.2
Date: Tue, 27 Oct 2026 11:20:27 +0200
Message-ID: <20261027092028.782979-60-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:22:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131524
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.17.2:

Preview features:

- [complexity] Add unnecessary-regular-expression-compile

Bug fixes:

- Avoid syntax errors for type variables with starred constraints
  (UP040, UP046, UP047, RUF053)
- [pydocstyle] Treat backslash-escaped *args and kwargs as
   documented (D417)
- [pylint] Avoid false positive on starred elements (PLE0643)
- [pylint] Mark fixes unsafe when deleting comments (PLR5501,PLW0120)
- [pyupgrade] Mark fix unsafe when deleting comments (UP035)

Performance:

- Avoid intermediate names in lint name resolution
- Prefilter bidirectional Unicode checks by UTF-8 leading bytes
- Share postfix parsing and reduce expression copies

Configuration:

- [pylint] Add a configurable allowlist for magic-value-comparison
  (PLR2004)

Documentation:

- Clarify documentation and correct stale guidance
- [pyupgrade] Remove mentions of variance related to fix safety
  (UP040, UP047)

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-ruff-crates.inc            | 40 +++++++++-------
 ...e-atomic-for-AtomicU64-on-targets-wi.patch | 47 +++++++++++--------
 ...-ruff_0.17.1.bb => python3-ruff_0.17.2.bb} |  2 +-
 3 files changed, 53 insertions(+), 36 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ruff_0.17.1.bb => python3-ruff_0.17.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-ruff-crates.inc b/meta-python/recipes-devtools/python/python3-ruff-crates.inc
index 50b22b418a..f657504ad7 100644
--- a/meta-python/recipes-devtools/python/python3-ruff-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-ruff-crates.inc
@@ -43,7 +43,7 @@ SRC_URI += " \
     crate://crates.io/bytecheck_derive/0.8.2 \
     crate://crates.io/bytes/1.12.0 \
     crate://crates.io/cachedir/0.3.1 \
-    crate://crates.io/camino/1.2.5 \
+    crate://crates.io/camino/1.2.6 \
     crate://crates.io/cast/0.3.0 \
     crate://crates.io/castaway/0.2.4 \
     crate://crates.io/cc/1.2.65 \
@@ -55,12 +55,12 @@ SRC_URI += " \
     crate://crates.io/ciborium/0.2.2 \
     crate://crates.io/ciborium-io/0.2.2 \
     crate://crates.io/ciborium-ll/0.2.2 \
-    crate://crates.io/clap/4.6.6 \
-    crate://crates.io/clap_builder/4.6.6 \
+    crate://crates.io/clap/4.6.7 \
+    crate://crates.io/clap_builder/4.6.7 \
     crate://crates.io/clap_complete/4.5.58 \
     crate://crates.io/clap_complete_command/0.6.1 \
     crate://crates.io/clap_complete_nushell/4.5.8 \
-    crate://crates.io/clap_derive/4.6.4 \
+    crate://crates.io/clap_derive/4.6.7 \
     crate://crates.io/clap_lex/1.0.0 \
     crate://crates.io/clearscreen/4.0.6 \
     crate://crates.io/codspeed/5.0.1 \
@@ -265,10 +265,14 @@ SRC_URI += " \
     crate://crates.io/pest_meta/2.8.2 \
     crate://crates.io/phf/0.11.3 \
     crate://crates.io/phf/0.13.1 \
+    crate://crates.io/phf/0.14.0 \
     crate://crates.io/phf_codegen/0.11.3 \
+    crate://crates.io/phf_codegen/0.14.0 \
     crate://crates.io/phf_generator/0.11.3 \
+    crate://crates.io/phf_generator/0.14.0 \
     crate://crates.io/phf_shared/0.11.3 \
     crate://crates.io/phf_shared/0.13.1 \
+    crate://crates.io/phf_shared/0.14.0 \
     crate://crates.io/pin-project-lite/0.2.16 \
     crate://crates.io/pkg-config/0.3.32 \
     crate://crates.io/portable-atomic/1.13.1 \
@@ -299,8 +303,8 @@ SRC_URI += " \
     crate://crates.io/r-efi/6.0.0 \
     crate://crates.io/radium/0.7.0 \
     crate://crates.io/rancor/0.1.1 \
-    crate://crates.io/rand/0.8.5 \
-    crate://crates.io/rand/0.10.2 \
+    crate://crates.io/rand/0.8.8 \
+    crate://crates.io/rand/0.10.3 \
     crate://crates.io/rand_core/0.6.4 \
     crate://crates.io/rand_core/0.10.0 \
     crate://crates.io/rayon/1.12.0 \
@@ -362,7 +366,7 @@ SRC_URI += " \
     crate://crates.io/strum_macros/0.28.0 \
     crate://crates.io/supports-hyperlinks/3.2.0 \
     crate://crates.io/syn/2.0.119 \
-    crate://crates.io/syn/3.0.5 \
+    crate://crates.io/syn/3.0.6 \
     crate://crates.io/synstructure/0.13.2 \
     crate://crates.io/tap/1.0.1 \
     crate://crates.io/tempfile/3.27.0 \
@@ -372,7 +376,7 @@ SRC_URI += " \
     crate://crates.io/test-case/3.3.1 \
     crate://crates.io/test-case-core/3.3.1 \
     crate://crates.io/test-case-macros/3.3.1 \
-    crate://crates.io/thin-vec/0.2.19 \
+    crate://crates.io/thin-vec/0.2.20 \
     crate://crates.io/thiserror/1.0.69 \
     crate://crates.io/thiserror/2.0.20 \
     crate://crates.io/thiserror-impl/1.0.69 \
@@ -543,7 +547,7 @@ SRC_URI[bytecheck-0.8.2.sha256sum] = "0caa33a2c0edca0419d15ac723dff03f1956f79783
 SRC_URI[bytecheck_derive-0.8.2.sha256sum] = "89385e82b5d1821d2219e0b095efa2cc1f246cbf99080f3be46a1a85c0d392d9"
 SRC_URI[bytes-1.12.0.sha256sum] = "8ae3f5d315924270530207e2a68396c3cc547f6dca3fbdca317cfb1a51edb593"
 SRC_URI[cachedir-0.3.1.sha256sum] = "4703f3937077db8fa35bee3c8789343c1aec2585f0146f09d658d4ccc0e8d873"
-SRC_URI[camino-1.2.5.sha256sum] = "bb1307f12aa967b5a58416e87b3653360e0fd614a016b6e970db08fecbb1b80d"
+SRC_URI[camino-1.2.6.sha256sum] = "bbbad30e4b4c14a39e3cc8aed085a12a327257c316619c93581e017bc52be591"
 SRC_URI[cast-0.3.0.sha256sum] = "37b2a672a2cb129a2e41c10b1224bb368f9f37a2b16b612598138befd7b37eb5"
 SRC_URI[castaway-0.2.4.sha256sum] = "dec551ab6e7578819132c713a93c022a05d60159dc86e7a7050223577484c55a"
 SRC_URI[cc-1.2.65.sha256sum] = "e228eec9be7c17ccb640b59b36a5cd805ea2a564a4c5e162c2f659fea30d3b96"
@@ -555,12 +559,12 @@ SRC_URI[chrono-0.4.45.sha256sum] = "1aa79e62e7697b8e29b513a68abacf485adcd1fe8284
 SRC_URI[ciborium-0.2.2.sha256sum] = "42e69ffd6f0917f5c029256a24d0161db17cea3997d185db0d35926308770f0e"
 SRC_URI[ciborium-io-0.2.2.sha256sum] = "05afea1e0a06c9be33d539b876f1ce3692f4afea2cb41f740e7743225ed1c757"
 SRC_URI[ciborium-ll-0.2.2.sha256sum] = "57663b653d948a338bfb3eeba9bb2fd5fcfaecb9e199e87e1eda4d9e8b240fd9"
-SRC_URI[clap-4.6.6.sha256sum] = "473c7e07f409a8d772161724aa8db6a765a2532a70f9667eeb7b49d3d02fbdca"
-SRC_URI[clap_builder-4.6.6.sha256sum] = "7b48fea5a88e9ae728a2dcbedbfc0e730f7d60da42e1cb049a83c9fb8b789889"
+SRC_URI[clap-4.6.7.sha256sum] = "aa8876b300ab35ba921adea3dfd70157a46249b33f95c9084ae5709785478946"
+SRC_URI[clap_builder-4.6.7.sha256sum] = "ec0797fb7aeb1406c84efac526901f7ec3ead2124f946b494e72879d4b54704d"
 SRC_URI[clap_complete-4.5.58.sha256sum] = "75bf0b32ad2e152de789bb635ea4d3078f6b838ad7974143e99b99f45a04af4a"
 SRC_URI[clap_complete_command-0.6.1.sha256sum] = "da8e198c052315686d36371e8a3c5778b7852fc75cc313e4e11eeb7a644a1b62"
 SRC_URI[clap_complete_nushell-4.5.8.sha256sum] = "0a0c951694691e65bf9d421d597d68416c22de9632e884c28412cb8cd8b73dce"
-SRC_URI[clap_derive-4.6.4.sha256sum] = "d012d2b9d65aca7f18f4d9878a045bc17899bba951561ba5ec3c2ba1eed9a061"
+SRC_URI[clap_derive-4.6.7.sha256sum] = "f9c751b79415d4e559e3d1fcf128e09e720eb673a06d26cf6f392d37d75b66e0"
 SRC_URI[clap_lex-1.0.0.sha256sum] = "3a822ea5bc7590f9d40f1ba12c0dc3c2760f3482c6984db1573ad11031420831"
 SRC_URI[clearscreen-4.0.6.sha256sum] = "d669bb552908e336ad5681789752033b45566b7e591aeaac7a614e58e5d6d8f2"
 SRC_URI[codspeed-5.0.1.sha256sum] = "7083f253260bcb4aaa3b4aa4c52973703dabc1a85c2f193997e2689aafa8a919"
@@ -765,10 +769,14 @@ SRC_URI[pest_generator-2.8.2.sha256sum] = "6d4f36811dfe07f7b8573462465d5cb8965ff
 SRC_URI[pest_meta-2.8.2.sha256sum] = "42919b05089acbd0a5dcd5405fb304d17d1053847b81163d09c4ad18ce8e8420"
 SRC_URI[phf-0.11.3.sha256sum] = "1fd6780a80ae0c52cc120a26a1a42c1ae51b247a253e4e06113d23d2c2edd078"
 SRC_URI[phf-0.13.1.sha256sum] = "c1562dc717473dbaa4c1f85a36410e03c047b2e7df7f45ee938fbef64ae7fadf"
+SRC_URI[phf-0.14.0.sha256sum] = "010378780309880b08997fae13be7834dba947d36393bd372f2b1556deb2a2f6"
 SRC_URI[phf_codegen-0.11.3.sha256sum] = "aef8048c789fa5e851558d709946d6d79a8ff88c0440c587967f8e94bfb1216a"
+SRC_URI[phf_codegen-0.14.0.sha256sum] = "41b585a510fb76fdebead6897982ef2a03a21d8e6cbcca904999742a4afc6ffe"
 SRC_URI[phf_generator-0.11.3.sha256sum] = "3c80231409c20246a13fddb31776fb942c38553c51e871f8cbd687a4cfb5843d"
+SRC_URI[phf_generator-0.14.0.sha256sum] = "aeb62e0959d5a1bebc965f4d15d9e2b7cea002b6b0f5ba8cde6cc26738467100"
 SRC_URI[phf_shared-0.11.3.sha256sum] = "67eabc2ef2a60eb7faa00097bd1ffdb5bd28e62bf39990626a582201b7a754e5"
 SRC_URI[phf_shared-0.13.1.sha256sum] = "e57fef6bc5981e38c2ce2d63bfa546861309f875b8a75f092d1d54ae2d64f266"
+SRC_URI[phf_shared-0.14.0.sha256sum] = "c6fd9027e2d9319be6349febd1db4e8d02aa544921200c9b777720ac34a3aa89"
 SRC_URI[pin-project-lite-0.2.16.sha256sum] = "3b3cff922bd51709b605d9ead9aa71031d81447142d828eb4a6eba76fe619f9b"
 SRC_URI[pkg-config-0.3.32.sha256sum] = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c"
 SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
@@ -799,8 +807,8 @@ SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847
 SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
 SRC_URI[radium-0.7.0.sha256sum] = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
 SRC_URI[rancor-0.1.1.sha256sum] = "a063ea72381527c2a0561da9c80000ef822bdd7c3241b1cc1b12100e3df081ee"
-SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
-SRC_URI[rand-0.10.2.sha256sum] = "c7f5fa3a058cd35567ef9bfa5e75732bee0f9e4c55fa90477bef2dfcdbc4be80"
+SRC_URI[rand-0.8.8.sha256sum] = "e058c7de0b26af77780c769414d6257830bb240f3c38477dbc2c16e5f54d6d4c"
+SRC_URI[rand-0.10.3.sha256sum] = "65c9fb96cbc91e3478eaae79a69fcd3f1ae4ad052e471fe6732fff548984b4af"
 SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
 SRC_URI[rand_core-0.10.0.sha256sum] = "0c8d0fd677905edcbeedbf2edb6494d676f0e98d54d5cf9bda0b061cb8fb8aba"
 SRC_URI[rayon-1.12.0.sha256sum] = "fb39b166781f92d482534ef4b4b1b2568f42613b53e5b6c160e24cfbfa30926d"
@@ -862,7 +870,7 @@ SRC_URI[strum-0.28.0.sha256sum] = "9628de9b8791db39ceda2b119bbe13134770b56c138ec
 SRC_URI[strum_macros-0.28.0.sha256sum] = "ab85eea0270ee17587ed4156089e10b9e6880ee688791d45a905f5b1ca36f664"
 SRC_URI[supports-hyperlinks-3.2.0.sha256sum] = "e396b6523b11ccb83120b115a0b7366de372751aa6edf19844dfb13a6af97e91"
 SRC_URI[syn-2.0.119.sha256sum] = "872831b642d1a07999a962a351ed35b955ea2cfc8f3862091e2a240a84f17297"
-SRC_URI[syn-3.0.5.sha256sum] = "12df2e0110f65b775f769bb17ef989067a1d931b2eb822bd4346631eeada89f9"
+SRC_URI[syn-3.0.6.sha256sum] = "8593e8e72159ed2257d083c7a454a85cbf854f37a0966d8d483aff8c8a3ebcee"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
 SRC_URI[tap-1.0.1.sha256sum] = "55937e1799185b12863d447f42597ed69d9928686b8d88a1df17376a097d8369"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
@@ -872,7 +880,7 @@ SRC_URI[termtree-0.5.1.sha256sum] = "8f50febec83f5ee1df3015341d8bd429f2d1cc62bcb
 SRC_URI[test-case-3.3.1.sha256sum] = "eb2550dd13afcd286853192af8601920d959b14c401fcece38071d53bf0768a8"
 SRC_URI[test-case-core-3.3.1.sha256sum] = "adcb7fd841cd518e279be3d5a3eb0636409487998a4aff22f3de87b81e88384f"
 SRC_URI[test-case-macros-3.3.1.sha256sum] = "5c89e72a01ed4c579669add59014b9a524d609c0c88c6a585ce37485879f6ffb"
-SRC_URI[thin-vec-0.2.19.sha256sum] = "79def32ffcd477db1ff26f76dab9e3a91f0bd42a85ca96577089b24623056f9d"
+SRC_URI[thin-vec-0.2.20.sha256sum] = "4568d7e143ec86d2021c338bae2afa88699e84b8e0af523626654fe6f03a1748"
 SRC_URI[thiserror-1.0.69.sha256sum] = "b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52"
 SRC_URI[thiserror-2.0.20.sha256sum] = "ec86235f5fcc2a73650310756d2ac5b138a5780bbbdfae3eeccec992c435ba4f"
 SRC_URI[thiserror-impl-1.0.69.sha256sum] = "4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1"
diff --git a/meta-python/recipes-devtools/python/python3-ruff/0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch b/meta-python/recipes-devtools/python/python3-ruff/0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch
index f2708bb6b0..ccf1d645be 100644
--- a/meta-python/recipes-devtools/python/python3-ruff/0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch
+++ b/meta-python/recipes-devtools/python/python3-ruff/0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch
@@ -1,3 +1,4 @@
+From d2c053cc5d1906f1276ce323531c626f6e199e26 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Wed, 21 Oct 2026 18:00:00 -0700
 Subject: [PATCH] ruff: Use portable-atomic for AtomicU64 on targets without
@@ -23,25 +24,17 @@ atomics keep using std's AtomicU64 unchanged.
 Upstream-Status: Submitted [https://github.com/astral-sh/ruff/pull/29627]
 Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
- Cargo.toml               |  1 +
  Cargo.lock               |  1 +
+ Cargo.toml               |  1 +
  crates/ruff/Cargo.toml   |  3 +++
- crates/ruff/src/cache.rs | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++----
+ crates/ruff/src/cache.rs | 57 +++++++++++++++++++++++++++++++++++++---
  4 files changed, 58 insertions(+), 4 deletions(-)
 
---- a/Cargo.toml
-+++ b/Cargo.toml
-@@ -170,6 +170,7 @@
- phf = { version = "0.11.3", default-features = false }
- phf_codegen = { version = "0.11.3", default-features = false }
- pep440_rs = { version = "0.7.1", default-features = false }
-+portable-atomic = { version = "1.13.1", default-features = false, features = ["fallback"] }
- pretty_assertions = { version = "1.3.0", default-features = false, features = ["std"] }
- proc-macro2 = { version = "1.0.79", default-features = false, features = ["proc-macro"] }
- pyproject-toml = { version = "0.13.4", default-features = false }
+diff --git a/Cargo.lock b/Cargo.lock
+index 08da4b1..f6ae6ce 100644
 --- a/Cargo.lock
 +++ b/Cargo.lock
-@@ -2523,6 +2523,7 @@
+@@ -3123,6 +3123,7 @@ dependencies = [
   "mimalloc",
   "notify",
   "path-absolutize",
@@ -49,9 +42,23 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
   "rayon",
   "regex",
   "rkyv",
+diff --git a/Cargo.toml b/Cargo.toml
+index ae31696..57a66fb 100644
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -172,6 +172,7 @@ pathdiff = { version = "0.2.1", default-features = false }
+ phf = { version = "0.14.0", default-features = false }
+ phf_codegen = { version = "0.14.0", default-features = false }
+ pep440_rs = { version = "0.7.1", default-features = false }
++portable-atomic = { version = "1.13.1", default-features = false, features = ["fallback"] }
+ pretty_assertions = { version = "1.3.0", default-features = false, features = ["std"] }
+ proc-macro2 = { version = "1.0.79", default-features = false, features = ["proc-macro"] }
+ pyproject-toml = { version = "0.13.4", default-features = false }
+diff --git a/crates/ruff/Cargo.toml b/crates/ruff/Cargo.toml
+index a7cd6cd..b7ca393 100644
 --- a/crates/ruff/Cargo.toml
 +++ b/crates/ruff/Cargo.toml
-@@ -77,6 +77,9 @@
+@@ -77,6 +77,9 @@ tikv-jemallocator = { workspace = true }
  [target.'cfg(target_os = "windows")'.dependencies]
  mimalloc = { workspace = true }
  
@@ -61,9 +68,11 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  [dev-dependencies]
  # Enable test rules during development
  ruff_linter = { workspace = true, features = ["clap", "test-rules"] }
+diff --git a/crates/ruff/src/cache.rs b/crates/ruff/src/cache.rs
+index 94ca467..3fca85e 100644
 --- a/crates/ruff/src/cache.rs
 +++ b/crates/ruff/src/cache.rs
-@@ -4,7 +4,9 @@
+@@ -4,7 +4,9 @@ use std::hash::Hasher;
  use std::io::{self, Write};
  use std::path::{Path, PathBuf};
  use std::sync::Mutex;
@@ -74,7 +83,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  use std::time::{Duration, SystemTime};
  
  use anyhow::{Context, Result};
-@@ -23,6 +25,10 @@
+@@ -23,6 +25,10 @@ use ruff_macros::CacheKey;
  use ruff_workspace::Settings;
  use ruff_workspace::resolver::Resolver;
  
@@ -85,7 +94,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  /// [`Path`] that is relative to the package root in [`PackageCache`].
  pub(crate) type RelativePath = Path;
  /// [`PathBuf`] that is relative to the package root in [`PackageCache`].
-@@ -341,12 +347,56 @@
+@@ -341,12 +347,56 @@ pub(crate) struct FileCache {
      ///
      /// Represented as the number of milliseconds since Unix epoch. This will
      /// break in 1970 + ~584 years (~2554).
@@ -143,7 +152,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  impl FileCache {
      /// Return whether or not the file in the cache was linted and found to have no diagnostics.
      pub(crate) fn linted(&self) -> bool {
-@@ -503,7 +553,6 @@
+@@ -503,7 +553,6 @@ mod tests {
      use std::io;
      use std::io::Write;
      use std::path::{Path, PathBuf};
@@ -151,7 +160,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
      use std::time::SystemTime;
  
      use anyhow::Result;
-@@ -522,7 +571,7 @@
+@@ -522,7 +571,7 @@ mod tests {
      use ruff_workspace::Settings;
  
      use crate::cache::{self, ChangeData, FileCache, FileCacheData, FileCacheKey};
diff --git a/meta-python/recipes-devtools/python/python3-ruff_0.17.1.bb b/meta-python/recipes-devtools/python/python3-ruff_0.17.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-ruff_0.17.1.bb
rename to meta-python/recipes-devtools/python/python3-ruff_0.17.2.bb
index 8ebcf1da1f..0a18c03807 100644
--- a/meta-python/recipes-devtools/python/python3-ruff_0.17.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ruff_0.17.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e679ca4f742cbfa29ab6a499529c2d39"
 
 SRC_URI += "file://0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch"
 
-SRC_URI[sha256sum] = "5bb796c5112e9fb9527f2ef2faa0a130d6312d19de92bcfaddd70dbb2d41020f"
+SRC_URI[sha256sum] = "84d632402d14c23b488f941db23712d6736a013225162062d34558c3f3c780eb"
 
 inherit pypi python_maturin cargo-update-recipe-crates
 
-- 
2.47.3

