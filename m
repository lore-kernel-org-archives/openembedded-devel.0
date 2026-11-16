Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23242.1794814557067857176
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=txlq1qL+;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so16319255e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814555; x=1795419355; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fUSyIOc8FE1yAPb0UoMnBKXMu2A9hnygDAED5naF4WE=;
        b=txlq1qL+MHrvynWYj7GL7AWS3ngkeLL805lyWnSREDlI8nbAOm76YtGQdtg1sA9dtm
         rsejH/wgQ0bjNyPnyTO39Hnr2ntVe0IIDf5Nbe6zCxemPuGF/jDuRTIKy4G7kemlPCvP
         qq/iFew1ctVfqf/8EM6an0YiP/yIFIfs5sfLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814555; x=1795419355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fUSyIOc8FE1yAPb0UoMnBKXMu2A9hnygDAED5naF4WE=;
        b=hWDqCLVESe1VFm1mQGXsYPiXuoUVgWYv+z3qvGMfKiE2gGP9AG9/3pslxfqSvO7zc5
         /uEBQCzudJ9dC6RYgdVmeV5xX5LGC7LH7zL5bNpE29X4f6sUnSm/Qyaq6hvv3Rjbxij3
         V29/3DgSO1xU1O9398Wr7+m7goJ5C9SiZajVZ6glriWFWfsG+uanWMO6IqdX3bqmajiO
         00nTpRt8D2Hwy3w6/CM8yPyMYlbIQDswCQWTIm61udm820MPdOL2tX0hZlkYXetJdzyb
         pMNKa9SJcdfq6hpuco6uVR/Uvi3VkEnRP16Ay6cuepIe3f5s405yXxt0AQqXBkd/+qVv
         56/A==
X-Gm-Message-State: APuU4Z9JedA7S+Xqc++moyP7V5Q7W3twV05E+acEY3gOyLZBXVd3HROu
	k3VllbLzDTHoMW+GZ7Um7EST0HbZqw9isO3exisexfhHrYHmrSAHGLKQz4trdW1oMhoSDA/OmrJ
	Ln1rH
X-Gm-Gg: AYBFou1hcS/DeFiTli0cqelInd7zgAJEpH8rhtjRHPcY0zm+pH9U2Ul6zQDq7JyF0ts
	W+tCHVmEWY7LznYEaqQ3A5+lBY+Cq5X4Bb2AE8lHloTU3gUR0M2ztqCW2SW2MIx00AHToE+BDYK
	MUqIp5s2rqipVfRV0ZOZunIoRDVokIa5ZizOz/szZFPLvXHTOsL7SLGltH+6U+HvO80Q9A6qKM0
	TQyHuSFnQ/UKa9My9d7TUfzArkiFAYBxkMijxh/PS1rPd8YaOVhzbKwBHWPyeXuuvcwR700t2Bc
	8Mh+/IeObpIvVKjGz3JYNDqhJsB06hV/1YcPTTmBbAKvfgEDUW2MAiIWoaW8Vbi9k1ayJzkF6d/
	vhg9GAhanpzGmu1kPIA9QdFK3jkeSlKH6tpG2E51Ai5VD3Iw0edBJLhava+L7cXi8zm5mV+3IKs
	PMtpf8Fs4DOYJv2Az6xDSQupCBtzaP3mycWI8FB646hiZKocZ+kvnqfCyN2RVHWW4LFLOEwHr7J
	NPE3Zi4F2aXAhoyY10VuRU3sIDSkDMmGl+3PTd7qowzODoO5tGN9xh+dzLC6L8anI1pR+RDl6ra
	1GeLdWE94vuNkvne5vQ5UDIUDHjLfX9wcWHmy8tJ/yOaq24cPrRkLAYDEQ5uKvZWwNU4imxuVSH
	pDUjsJA/27i7YpCSW4NpBPQ2+QtvbLtx5lWTcWxHdVJbX2/bJaM6AhA==
X-Received: by 2002:a05:600c:46cf:b0:4bb:6c71:b269 with SMTP id 5b1f17b1804b1-4bb6c71c1f7mr69722765e9.28.1794814555118;
        Sun, 15 Nov 2026 23:35:55 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:54 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 24/24] python3-ruff: Upgrade 0.17.4 -> 0.17.5
Date: Mon, 16 Nov 2026 09:35:31 +0200
Message-ID: <20261116073532.880420-24-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116073532.880420-1-leon.anavi@konsulko.com>
References: <20261116073532.880420-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132452
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.17.5:

Preview features:

- Redirect renamed rules
- [flake8-async] Implement pytest-raises-exception-group (ASYNC401)
- [flake8-logging-format] Mark G004 fix as unsafe
- [pylint] Implement no-method-argument (PLE0211)
- [refurb] Do not offer fix when write is nested in an expression
  (FURB103)
- [ruff] Add renamed-rule (RUF202)
- [ruff] Expand redirected-noqa to other suppression comments
  (RUF101)

Bug fixes:

- Avoid crashing when Ruff logs to a closed stderr pipe
- Fix fixes that add or remove a keyword argument with a
  parenthesized value
- [flake8-import-conventions] Avoid shadowing names when fixing
  import aliases (ICN001)
- [flake8-bugbear] Fix B010 autofix for parenthesized setattr
  calls
- [flake8-pyi] Fix PYI034 autofix for parenthesized self annotations
- [pyupgrade] Fix UP031 duplicating closing parentheses around
  the format string

Rule changes:

- [flake8-bugbear] Ignore frozen dataclass instantiations (B008)

Other changes:

- Fix FreeBSD source builds with libc 0.2.190 (#30176)

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-ruff-crates.inc            | 114 +++++++++---------
 ...e-atomic-for-AtomicU64-on-targets-wi.patch |  10 +-
 ...-ruff_0.17.4.bb => python3-ruff_0.17.5.bb} |   2 +-
 3 files changed, 62 insertions(+), 64 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ruff_0.17.4.bb => python3-ruff_0.17.5.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-ruff-crates.inc b/meta-python/recipes-devtools/python/python3-ruff-crates.inc
index f11630d974..c4269600da 100644
--- a/meta-python/recipes-devtools/python/python3-ruff-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-ruff-crates.inc
@@ -26,8 +26,8 @@ SRC_URI += " \
     crate://crates.io/arrayvec/0.7.8 \
     crate://crates.io/assert_fs/1.1.4 \
     crate://crates.io/async-trait/0.1.89 \
-    crate://crates.io/attribute-derive/0.10.3 \
-    crate://crates.io/attribute-derive-macro/0.10.3 \
+    crate://crates.io/attribute-derive/0.11.0 \
+    crate://crates.io/attribute-derive-macro/0.11.0 \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/bit-set/0.8.0 \
     crate://crates.io/bit-vec/0.8.0 \
@@ -63,12 +63,12 @@ SRC_URI += " \
     crate://crates.io/clap_derive/4.6.7 \
     crate://crates.io/clap_lex/1.0.0 \
     crate://crates.io/clearscreen/5.0.0 \
-    crate://crates.io/codspeed/5.0.1 \
-    crate://crates.io/codspeed-criterion-compat/5.0.1 \
-    crate://crates.io/codspeed-criterion-compat-walltime/5.0.1 \
-    crate://crates.io/codspeed-divan-compat/5.0.1 \
-    crate://crates.io/codspeed-divan-compat-macros/5.0.1 \
-    crate://crates.io/codspeed-divan-compat-walltime/5.0.1 \
+    crate://crates.io/codspeed/6.0.0 \
+    crate://crates.io/codspeed-criterion-compat/6.0.0 \
+    crate://crates.io/codspeed-criterion-compat-walltime/6.0.0 \
+    crate://crates.io/codspeed-divan-compat/6.0.0 \
+    crate://crates.io/codspeed-divan-compat-macros/6.0.0 \
+    crate://crates.io/codspeed-divan-compat-walltime/6.0.0 \
     crate://crates.io/collection_literals/1.0.2 \
     crate://crates.io/colorchoice/1.0.4 \
     crate://crates.io/colored/3.1.1 \
@@ -101,7 +101,6 @@ SRC_URI += " \
     crate://crates.io/defmt/1.1.0 \
     crate://crates.io/defmt-macros/1.1.0 \
     crate://crates.io/defmt-parser/1.0.0 \
-    crate://crates.io/derive-where/1.6.0 \
     crate://crates.io/diff/0.1.13 \
     crate://crates.io/difflib/0.4.0 \
     crate://crates.io/digest/0.10.7 \
@@ -138,8 +137,8 @@ SRC_URI += " \
     crate://crates.io/futures-util/0.3.32 \
     crate://crates.io/gen-lsp-types/0.11.0 \
     crate://crates.io/generic-array/0.14.7 \
-    crate://crates.io/get-size-derive2/0.11.0 \
-    crate://crates.io/get-size2/0.11.0 \
+    crate://crates.io/get-size-derive2/0.11.1 \
+    crate://crates.io/get-size2/0.11.1 \
     crate://crates.io/getrandom/0.2.16 \
     crate://crates.io/getrandom/0.3.4 \
     crate://crates.io/getrandom/0.4.2 \
@@ -171,7 +170,7 @@ SRC_URI += " \
     crate://crates.io/imperative/1.0.7 \
     crate://crates.io/indexmap/2.14.2 \
     crate://crates.io/indicatif/0.18.6 \
-    crate://crates.io/indoc/2.0.7 \
+    crate://crates.io/indoc/2.0.8 \
     crate://crates.io/inotify/0.11.0 \
     crate://crates.io/inotify-sys/0.1.5 \
     crate://crates.io/insta/1.49.0 \
@@ -187,9 +186,9 @@ SRC_URI += " \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itertools/0.15.0 \
     crate://crates.io/itoa/1.0.15 \
-    crate://crates.io/jiff/0.2.37 \
+    crate://crates.io/jiff/0.2.38 \
     crate://crates.io/jiff-core/0.1.0 \
-    crate://crates.io/jiff-static/0.2.37 \
+    crate://crates.io/jiff-static/0.2.38 \
     crate://crates.io/jiff-tzdb/0.1.4 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
     crate://crates.io/jobserver/0.1.34 \
@@ -212,8 +211,8 @@ SRC_URI += " \
     crate://crates.io/lock_api/0.4.14 \
     crate://crates.io/log/0.4.34 \
     crate://crates.io/lsp-server/0.10.0 \
-    crate://crates.io/manyhow/0.11.4 \
-    crate://crates.io/manyhow-macros/0.11.4 \
+    crate://crates.io/manyhow/0.14.1 \
+    crate://crates.io/manyhow-macros/0.14.1 \
     crate://crates.io/markdown/1.0.0 \
     crate://crates.io/matchers/0.2.0 \
     crate://crates.io/matchit/0.9.2 \
@@ -223,7 +222,7 @@ SRC_URI += " \
     crate://crates.io/minicov/0.3.8 \
     crate://crates.io/minimal-lexical/0.2.1 \
     crate://crates.io/miniz_oxide/0.8.9 \
-    crate://crates.io/mio/1.0.4 \
+    crate://crates.io/mio/1.2.4 \
     crate://crates.io/munge/0.4.7 \
     crate://crates.io/munge_macro/0.4.7 \
     crate://crates.io/natord/1.0.9 \
@@ -297,8 +296,8 @@ SRC_URI += " \
     crate://crates.io/quickcheck/1.1.0 \
     crate://crates.io/quickcheck_macros/1.2.0 \
     crate://crates.io/quote/1.0.47 \
-    crate://crates.io/quote-use/0.8.4 \
-    crate://crates.io/quote-use-macros/0.8.4 \
+    crate://crates.io/quote-use/0.9.0 \
+    crate://crates.io/quote-use-macros/0.9.0 \
     crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/r-efi/6.0.0 \
     crate://crates.io/radium/0.7.0 \
@@ -341,8 +340,8 @@ SRC_URI += " \
     crate://crates.io/serde_core/1.0.229 \
     crate://crates.io/serde_derive/1.0.229 \
     crate://crates.io/serde_derive_internals/0.30.0 \
-    crate://crates.io/serde_json/1.0.151 \
-    crate://crates.io/serde_spanned/1.1.1 \
+    crate://crates.io/serde_json/1.0.154 \
+    crate://crates.io/serde_spanned/1.1.2 \
     crate://crates.io/serde_test/1.0.177 \
     crate://crates.io/sha2/0.10.9 \
     crate://crates.io/sharded-slab/0.1.7 \
@@ -353,7 +352,7 @@ SRC_URI += " \
     crate://crates.io/similar/3.2.0 \
     crate://crates.io/siphasher/1.0.1 \
     crate://crates.io/slab/0.4.12 \
-    crate://crates.io/smallvec/1.16.2 \
+    crate://crates.io/smallvec/1.16.3 \
     crate://crates.io/snapbox/1.0.0 \
     crate://crates.io/snapbox-macros/1.0.0 \
     crate://crates.io/stable_deref_trait/1.2.0 \
@@ -366,7 +365,7 @@ SRC_URI += " \
     crate://crates.io/strum_macros/0.28.0 \
     crate://crates.io/supports-hyperlinks/3.2.0 \
     crate://crates.io/syn/2.0.119 \
-    crate://crates.io/syn/3.0.6 \
+    crate://crates.io/syn/3.0.8 \
     crate://crates.io/synstructure/0.13.2 \
     crate://crates.io/tap/1.0.1 \
     crate://crates.io/tempfile/3.27.0 \
@@ -376,7 +375,7 @@ SRC_URI += " \
     crate://crates.io/test-case/3.4.0 \
     crate://crates.io/test-case-core/3.4.0 \
     crate://crates.io/test-case-macros/3.4.0 \
-    crate://crates.io/thin-vec/0.2.20 \
+    crate://crates.io/thin-vec/0.2.21 \
     crate://crates.io/thiserror/1.0.69 \
     crate://crates.io/thiserror/2.0.21 \
     crate://crates.io/thiserror-impl/1.0.69 \
@@ -389,12 +388,12 @@ SRC_URI += " \
     crate://crates.io/tinyvec/1.10.0 \
     crate://crates.io/tinyvec_macros/0.1.1 \
     crate://crates.io/toml/0.9.12+spec-1.1.0 \
-    crate://crates.io/toml/1.1.6+spec-1.1.0 \
+    crate://crates.io/toml/1.1.8+spec-1.1.0 \
     crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 \
-    crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
+    crate://crates.io/toml_datetime/1.1.2+spec-1.1.0 \
     crate://crates.io/toml_edit/0.25.12+spec-1.1.0 \
-    crate://crates.io/toml_parser/1.1.3+spec-1.1.0 \
-    crate://crates.io/toml_writer/1.1.2+spec-1.1.0 \
+    crate://crates.io/toml_parser/1.1.5+spec-1.1.0 \
+    crate://crates.io/toml_writer/1.1.3+spec-1.1.0 \
     crate://crates.io/tracing/0.1.44 \
     crate://crates.io/tracing-attributes/0.1.31 \
     crate://crates.io/tracing-core/0.1.36 \
@@ -419,7 +418,7 @@ SRC_URI += " \
     crate://crates.io/utf8-width/0.1.7 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.27.0 \
+    crate://crates.io/uuid/1.28.0 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version-ranges/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
@@ -530,8 +529,8 @@ SRC_URI[argfile-1.0.0.sha256sum] = "99489a733dea0d2930bfa59c243146a8513ce7b0991b
 SRC_URI[arrayvec-0.7.8.sha256sum] = "d3fb67a6e08acf24fdeccbac2cb6ac4305825bd1f117462e0e6f2f193345ad56"
 SRC_URI[assert_fs-1.1.4.sha256sum] = "6ecf5c70ca07b7f80220bce936f0556a960ca6fb00fc2bd4125b5e581b218137"
 SRC_URI[async-trait-0.1.89.sha256sum] = "9035ad2d096bed7955a320ee7e2230574d28fd3c3a0f186cbea1ff3c7eed5dbb"
-SRC_URI[attribute-derive-0.10.3.sha256sum] = "0053e96dd3bec5b4879c23a138d6ef26f2cb936c9cdc96274ac2b9ed44b5bb54"
-SRC_URI[attribute-derive-macro-0.10.3.sha256sum] = "463b53ad0fd5b460af4b1915fe045ff4d946d025fb6c4dc3337752eaa980f71b"
+SRC_URI[attribute-derive-0.11.0.sha256sum] = "d2f9ef7a68684657ce9da341c934c73b63df7a3585a61e366d84c84ed5d3d167"
+SRC_URI[attribute-derive-macro-0.11.0.sha256sum] = "300d426e5e73549125bb8e4649bdd5508f82c94ddf898fb0517246e71dfb8e98"
 SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[bit-set-0.8.0.sha256sum] = "08807e080ed7f9d5433fa9b275196cfc35414f66a0c79d864dc51a0d825231a3"
 SRC_URI[bit-vec-0.8.0.sha256sum] = "5e764a1d40d510daf35e07be9eb06e75770908c27d411ee6c92109c9840eaaf7"
@@ -567,12 +566,12 @@ SRC_URI[clap_complete_nushell-4.5.8.sha256sum] = "0a0c951694691e65bf9d421d597d68
 SRC_URI[clap_derive-4.6.7.sha256sum] = "f9c751b79415d4e559e3d1fcf128e09e720eb673a06d26cf6f392d37d75b66e0"
 SRC_URI[clap_lex-1.0.0.sha256sum] = "3a822ea5bc7590f9d40f1ba12c0dc3c2760f3482c6984db1573ad11031420831"
 SRC_URI[clearscreen-5.0.0.sha256sum] = "6ebe9918b237e4e17e25a04d539d99ef3515417a85f703e0ed8bf44353eb17b3"
-SRC_URI[codspeed-5.0.1.sha256sum] = "7083f253260bcb4aaa3b4aa4c52973703dabc1a85c2f193997e2689aafa8a919"
-SRC_URI[codspeed-criterion-compat-5.0.1.sha256sum] = "d9f24251445188c69d50f10179d795424bd71b533b7e3f84fc03f26893b01af0"
-SRC_URI[codspeed-criterion-compat-walltime-5.0.1.sha256sum] = "5c38205d56e2cb4fe04b708de7f9653a3f1b89edbe3a20b28f21e9e525e9e061"
-SRC_URI[codspeed-divan-compat-5.0.1.sha256sum] = "bc1065d507e1cbab731a7976db4cef7e47e49b87b4dbc0a925df07d343558420"
-SRC_URI[codspeed-divan-compat-macros-5.0.1.sha256sum] = "2fd05482a95823ffe421e8a9ba24fa22a6a30d594e2c60455cbb43a41bf2d8fa"
-SRC_URI[codspeed-divan-compat-walltime-5.0.1.sha256sum] = "d2f8eae75b8fa85357020a404899c4280d590c9fd1c47640b3ce53106c62d2ee"
+SRC_URI[codspeed-6.0.0.sha256sum] = "7e7c21807b937b8e535f2745cd83c525fc250524021cd662b9ba4d3e399bb504"
+SRC_URI[codspeed-criterion-compat-6.0.0.sha256sum] = "8a14939cf9e46182bdfbf6de618a8a110361c15a27eccff8f5ad4380249e9c14"
+SRC_URI[codspeed-criterion-compat-walltime-6.0.0.sha256sum] = "af785573a72d17af663e661a45e1d617a2bab9f3a13a219ca0ae6ef9412ea1d8"
+SRC_URI[codspeed-divan-compat-6.0.0.sha256sum] = "cc7e48c4e555e60b894144b14df1e893a7317b9f4000b1492ace3041479b12cc"
+SRC_URI[codspeed-divan-compat-macros-6.0.0.sha256sum] = "1eb62a7a8d4cc6b79b18dcbac670b3202f4c8c901ca8ea701ab42190f0b14799"
+SRC_URI[codspeed-divan-compat-walltime-6.0.0.sha256sum] = "15c4e77a97571b6214b976cee7e2a564215d0a5bee9520a3cdab86106d0b31a3"
 SRC_URI[collection_literals-1.0.2.sha256sum] = "26b3f65b8fb8e88ba339f7d23a390fe1b0896217da05e2a66c584c9b29a91df8"
 SRC_URI[colorchoice-1.0.4.sha256sum] = "b05b61dc5112cbb17e4b6cd61790d9845d13888356391624cbe7e41efeac1e75"
 SRC_URI[colored-3.1.1.sha256sum] = "faf9468729b8cbcea668e36183cb69d317348c2e08e994829fb56ebfdfbaac34"
@@ -605,7 +604,6 @@ SRC_URI[datatest-stable-0.3.3.sha256sum] = "a867d7322eb69cf3a68a5426387a25b45cb3
 SRC_URI[defmt-1.1.0.sha256sum] = "a6e524506490a1953d237cb87b1cfc1e46f88c18f10a22dfe0f507dc6bfc7f7f"
 SRC_URI[defmt-macros-1.1.0.sha256sum] = "f0a27770e9c8f719a79d8b638281f4d828f77d8fd61e0bd94451b9b85e576a0b"
 SRC_URI[defmt-parser-1.0.0.sha256sum] = "10d60334b3b2e7c9d91ef8150abfb6fa4c1c39ebbcf4a81c2e346aad939fee3e"
-SRC_URI[derive-where-1.6.0.sha256sum] = "ef941ded77d15ca19b40374869ac6000af1c9f2a4c0f3d4c70926287e6364a8f"
 SRC_URI[diff-0.1.13.sha256sum] = "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
 SRC_URI[difflib-0.4.0.sha256sum] = "6184e33543162437515c2e2b48714794e37845ec9851711914eec9d308f6ebe8"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
@@ -642,8 +640,8 @@ SRC_URI[futures-task-0.3.32.sha256sum] = "037711b3d59c33004d3856fbdc83b99d4ff37a
 SRC_URI[futures-util-0.3.32.sha256sum] = "389ca41296e6190b48053de0321d02a77f32f8a5d2461dd38762c0593805c6d6"
 SRC_URI[gen-lsp-types-0.11.0.sha256sum] = "b64887ac3a8083427ae935a7296db876871582cd57eac077564f8bc18fa49116"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
-SRC_URI[get-size-derive2-0.11.0.sha256sum] = "7efe46d2adb529015748742f1a38594039ce357dbb21e6d178de342cfce468d4"
-SRC_URI[get-size2-0.11.0.sha256sum] = "d4d338de392104417fe6fdbe588c52383b9236956d8afe5654f0077176edc632"
+SRC_URI[get-size-derive2-0.11.1.sha256sum] = "28f0daa179069133df60523e0f59d0a6bd2d3db9ccae01b630896d269c4a802e"
+SRC_URI[get-size2-0.11.1.sha256sum] = "050a5d07359ebfac7f0b74916d94cfa30575e45fdc7e9bfbb0f76d5d4203325a"
 SRC_URI[getrandom-0.2.16.sha256sum] = "335ff9f135e4384c8150d6f27c6daed433577f86b4750418338c01a1a2528592"
 SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
 SRC_URI[getrandom-0.4.2.sha256sum] = "0de51e6874e94e7bf76d726fc5d13ba782deca734ff60d5bb2fb2607c7406555"
@@ -675,7 +673,7 @@ SRC_URI[imara-diff-0.2.0.sha256sum] = "2f01d462f766df78ab820dd06f5eb700233c51f0f
 SRC_URI[imperative-1.0.7.sha256sum] = "35e1d0bd9c575c52e59aad8e122a11786e852a154678d0c86e9e243d55273970"
 SRC_URI[indexmap-2.14.2.sha256sum] = "cc4e190f5d26ca7051642629da2c52fc03bde85a03197c99408dcd291734c855"
 SRC_URI[indicatif-0.18.6.sha256sum] = "9433806cd6b4ec1aba79c021c7e4c58fb4c3b9977c085062e611ac929998fb0c"
-SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
+SRC_URI[indoc-2.0.8.sha256sum] = "a37b2691796cffeb8a8cd305ac66e65841559f147f4e63231d0eafa4db5384d1"
 SRC_URI[inotify-0.11.0.sha256sum] = "f37dccff2791ab604f9babef0ba14fbe0be30bd368dc541e2b08d07c8aa908f3"
 SRC_URI[inotify-sys-0.1.5.sha256sum] = "e05c02b5e89bff3b946cedeca278abc628fe811e604f027c45a8aa3cf793d0eb"
 SRC_URI[insta-1.49.0.sha256sum] = "b67d3d2e287e4b86c10b3f3b641033d1f89b74bdb39d05f34952e2b9a6fe21cd"
@@ -691,9 +689,9 @@ SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c08819
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itertools-0.15.0.sha256sum] = "8b4baf93f58d4425749ca49a51c50ebab072c5df6994d08fed93541c331481dc"
 SRC_URI[itoa-1.0.15.sha256sum] = "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
-SRC_URI[jiff-0.2.37.sha256sum] = "0ab1baf72f08796de0260609515130699b890ac25f30e610ad894bc5856cafdb"
+SRC_URI[jiff-0.2.38.sha256sum] = "b2b005715dcbeb0089a3c0dab99f2ff1cc3b2525323552703d648585d342a383"
 SRC_URI[jiff-core-0.1.0.sha256sum] = "7feca88439efe53da3754500c1851dedf3cb36c524dd5cf8225cc0794de95d09"
-SRC_URI[jiff-static-0.2.37.sha256sum] = "378268a1116ad67ae6228701118ac9f491d78fda38a40a1f1a9e1348de6f7212"
+SRC_URI[jiff-static-0.2.38.sha256sum] = "2cc9817253cf7c7ee4684451bd327e88d6f3658014e54a29198625590650695c"
 SRC_URI[jiff-tzdb-0.1.4.sha256sum] = "c1283705eb0a21404d2bfd6eef2a7593d240bc42a0bdb39db0ad6fa2ec026524"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
 SRC_URI[jobserver-0.1.34.sha256sum] = "9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33"
@@ -716,8 +714,8 @@ SRC_URI[litemap-0.8.0.sha256sum] = "241eaef5fd12c88705a01fc1066c48c4b36e0dd4377d
 SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
 SRC_URI[log-0.4.34.sha256sum] = "f9f8bd3e56ce4dfc153cf470fffbfa98c7620958b312ca5c3a4b8d5181fd13c6"
 SRC_URI[lsp-server-0.10.0.sha256sum] = "3ee25a31f2e571e426eef2896179450cafc7e2f5be00d8a93b1c2d21c0ff7656"
-SRC_URI[manyhow-0.11.4.sha256sum] = "b33efb3ca6d3b07393750d4030418d594ab1139cee518f0dc88db70fec873587"
-SRC_URI[manyhow-macros-0.11.4.sha256sum] = "46fce34d199b78b6e6073abf984c9cf5fd3e9330145a93ee0738a7443e371495"
+SRC_URI[manyhow-0.14.1.sha256sum] = "f1704b073316272a6785b70599f91f73b49022c2e290b065591ee6b9109ed8c7"
+SRC_URI[manyhow-macros-0.14.1.sha256sum] = "31601db71f1f5fb6f831a18aa3052d13a62528ee4f2cba7e8c9a5e258d953725"
 SRC_URI[markdown-1.0.0.sha256sum] = "a5cab8f2cadc416a82d2e783a1946388b31654d391d1c7d92cc1f03e295b1deb"
 SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
 SRC_URI[matchit-0.9.2.sha256sum] = "8863b587001c1b9a8a4e36008cebc6b3612cb1226fe2de94858e06092687b608"
@@ -727,7 +725,7 @@ SRC_URI[mimalloc-0.1.52.sha256sum] = "2d4139bb28d14ad1facf21d5eb8825051b326e172d
 SRC_URI[minicov-0.3.8.sha256sum] = "4869b6a491569605d66d3952bcdf03df789e5b536e5f0cf7758a7f08a55ae24d"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
 SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
-SRC_URI[mio-1.0.4.sha256sum] = "78bed444cc8a2160f01cbcf811ef18cac863ad68ae8ca62092e8db51d51c761c"
+SRC_URI[mio-1.2.4.sha256sum] = "1788edb87fdc09c7e26304471e2f5be8cdefb1b6930d6e3985fc02ff53bf86ee"
 SRC_URI[munge-0.4.7.sha256sum] = "5e17401f259eba956ca16491461b6e8f72913a0a114e39736ce404410f915a0c"
 SRC_URI[munge_macro-0.4.7.sha256sum] = "4568f25ccbd45ab5d5603dc34318c1ec56b117531781260002151b8530a9f931"
 SRC_URI[natord-1.0.9.sha256sum] = "308d96db8debc727c3fd9744aac51751243420e46edf401010908da7f8d5e57c"
@@ -801,8 +799,8 @@ SRC_URI[quick-xml-0.41.0.sha256sum] = "e660451e55124f798a69a5af3f49ccfbefbd41910
 SRC_URI[quickcheck-1.1.0.sha256sum] = "95c589f335db0f6aaa168a7cd27b1fc6920f5e1470c804f814d9cd6e62a0f70b"
 SRC_URI[quickcheck_macros-1.2.0.sha256sum] = "a9a28b8493dd664c8b171dd944da82d933f7d456b829bfb236738e1fe06c5ba4"
 SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
-SRC_URI[quote-use-0.8.4.sha256sum] = "9619db1197b497a36178cfc736dc96b271fe918875fbf1344c436a7e93d0321e"
-SRC_URI[quote-use-macros-0.8.4.sha256sum] = "82ebfb7faafadc06a7ab141a6f67bcfb24cb8beb158c6fe933f2f035afa99f35"
+SRC_URI[quote-use-0.9.0.sha256sum] = "48356e493823dc3c1d7e9fc7b3ff204ecec48afbdd718fc4134091b88eb63f3d"
+SRC_URI[quote-use-macros-0.9.0.sha256sum] = "8cf1c5de6a7cc231c71e03c77aa4c7019097859ea7029156b54d2894a8430704"
 SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
 SRC_URI[radium-0.7.0.sha256sum] = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
@@ -845,8 +843,8 @@ SRC_URI[serde-wasm-bindgen-0.6.5.sha256sum] = "8302e169f0eddcc139c70f139d19d6467
 SRC_URI[serde_core-1.0.229.sha256sum] = "67dca2c9c51e58a4791a4b1ed58308b39c64224d349a935ab5039aa360942a48"
 SRC_URI[serde_derive-1.0.229.sha256sum] = "e7a5d71263a5a7d47b41f6b3f06ba276f10cc18b0931f1799f710578e2309348"
 SRC_URI[serde_derive_internals-0.30.0.sha256sum] = "f852137cce035d6a4df67ccce505ff6b3e9fd3a10e3e52b24dc71e650bb1a9bd"
-SRC_URI[serde_json-1.0.151.sha256sum] = "c841b55ecdae098c80dcae9cf767f6f8a0c2cdb3416bbef72181df4d0fe73f14"
-SRC_URI[serde_spanned-1.1.1.sha256sum] = "6662b5879511e06e8999a8a235d848113e942c9124f211511b16466ee2995f26"
+SRC_URI[serde_json-1.0.154.sha256sum] = "e7e9cc8b1b85264074fbcc02a88680c4096b1e47df8f739dceb03bf482f04bd6"
+SRC_URI[serde_spanned-1.1.2.sha256sum] = "4e7523beb55eece201a2356bee0bbca0d1ab466c14c07703b2e0ee6d42cb0c2c"
 SRC_URI[serde_test-1.0.177.sha256sum] = "7f901ee573cab6b3060453d2d5f0bae4e6d628c23c0a962ff9b5f1d7c8d4f1ed"
 SRC_URI[sha2-0.10.9.sha256sum] = "a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283"
 SRC_URI[sharded-slab-0.1.7.sha256sum] = "f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6"
@@ -857,7 +855,7 @@ SRC_URI[similar-2.7.0.sha256sum] = "bbbb5d9659141646ae647b42fe094daf6c6192d16208
 SRC_URI[similar-3.2.0.sha256sum] = "4f66ca1f7aca2474dc10c942eb22feffc897735f54cd1db90138c2fddb490987"
 SRC_URI[siphasher-1.0.1.sha256sum] = "56199f7ddabf13fe5074ce809e7d3f42b42ae711800501b5b16ea82ad029c39d"
 SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
-SRC_URI[smallvec-1.16.2.sha256sum] = "f9395f0f0eee849a9b707b2f06bb92a6a422090e2123bb2ef8e87a0e61892a8e"
+SRC_URI[smallvec-1.16.3.sha256sum] = "5b3dc8af474f516a851ff4bd12db780f948b9250ad37211e4eec0bccea54e01b"
 SRC_URI[snapbox-1.0.0.sha256sum] = "71d70a71b68054cbe88708f77abfc4bd2daf75028f8f55f4f1cff63565df89ea"
 SRC_URI[snapbox-macros-1.0.0.sha256sum] = "d248cef42e1456ab2f7149c0376985351b7d849ea9ad2a957bf15ddfebf1fdf9"
 SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
@@ -870,7 +868,7 @@ SRC_URI[strum-0.28.0.sha256sum] = "9628de9b8791db39ceda2b119bbe13134770b56c138ec
 SRC_URI[strum_macros-0.28.0.sha256sum] = "ab85eea0270ee17587ed4156089e10b9e6880ee688791d45a905f5b1ca36f664"
 SRC_URI[supports-hyperlinks-3.2.0.sha256sum] = "e396b6523b11ccb83120b115a0b7366de372751aa6edf19844dfb13a6af97e91"
 SRC_URI[syn-2.0.119.sha256sum] = "872831b642d1a07999a962a351ed35b955ea2cfc8f3862091e2a240a84f17297"
-SRC_URI[syn-3.0.6.sha256sum] = "8593e8e72159ed2257d083c7a454a85cbf854f37a0966d8d483aff8c8a3ebcee"
+SRC_URI[syn-3.0.8.sha256sum] = "01016da373cd8f7ef12624f796309f5c31ba8d646dd08856c02cd741d823c622"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
 SRC_URI[tap-1.0.1.sha256sum] = "55937e1799185b12863d447f42597ed69d9928686b8d88a1df17376a097d8369"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
@@ -880,7 +878,7 @@ SRC_URI[termtree-0.5.1.sha256sum] = "8f50febec83f5ee1df3015341d8bd429f2d1cc62bcb
 SRC_URI[test-case-3.4.0.sha256sum] = "124953e7f67cb0b2fcfb87e899e4ae5a64fb68e2e160767933cc67b646fb0042"
 SRC_URI[test-case-core-3.4.0.sha256sum] = "bd097615b407247e102046ba34426bb594923ab3554cf0f3cdfed050f1a5a3e8"
 SRC_URI[test-case-macros-3.4.0.sha256sum] = "f4ce35ece947bccac166e1ded639133827a953f69a48ba134d17f91108333082"
-SRC_URI[thin-vec-0.2.20.sha256sum] = "4568d7e143ec86d2021c338bae2afa88699e84b8e0af523626654fe6f03a1748"
+SRC_URI[thin-vec-0.2.21.sha256sum] = "d6a4b9ba8738cb4a4f399d37e266becfd475e75eb73425b87a05a2f2039ba63e"
 SRC_URI[thiserror-1.0.69.sha256sum] = "b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52"
 SRC_URI[thiserror-2.0.21.sha256sum] = "09e52cb86a36cede5cb101bf8908837b3e4c6e5e59fe7fd85c23fb56200d189e"
 SRC_URI[thiserror-impl-1.0.69.sha256sum] = "4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1"
@@ -893,12 +891,12 @@ SRC_URI[tinytemplate-1.2.1.sha256sum] = "be4d6b5f19ff7664e8c98d03e2139cb510db9b0
 SRC_URI[tinyvec-1.10.0.sha256sum] = "bfa5fdc3bce6191a1dbc8c02d5c8bffcf557bafa17c124c5264a458f1b0613fa"
 SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
 SRC_URI[toml-0.9.12+spec-1.1.0.sha256sum] = "cf92845e79fc2e2def6a5d828f0801e29a2f8acc037becc5ab08595c7d5e9863"
-SRC_URI[toml-1.1.6+spec-1.1.0.sha256sum] = "920602543f0911ab71da12c50d59701da54c196d1a2bf5cb4b75667f137a406a"
+SRC_URI[toml-1.1.8+spec-1.1.0.sha256sum] = "20489e00e4d8741d6be680764cc12e270655e375a20d1011e844a9c3379e678d"
 SRC_URI[toml_datetime-0.7.5+spec-1.1.0.sha256sum] = "92e1cfed4a3038bc5a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347"
-SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] = "3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
+SRC_URI[toml_datetime-1.1.2+spec-1.1.0.sha256sum] = "2b86d767906c6c42421dcba507eb9d203e779497710a47782a224bb871653053"
 SRC_URI[toml_edit-0.25.12+spec-1.1.0.sha256sum] = "d2153edc6955a6c354fad8f5efd38b6a8769bdccf9fe50f8e1329f81b0baa5d7"
-SRC_URI[toml_parser-1.1.3+spec-1.1.0.sha256sum] = "1d38ac1cf9b95face32296c0a3ede1fdc270627c9d9c02a7274dd6d960dc4d56"
-SRC_URI[toml_writer-1.1.2+spec-1.1.0.sha256sum] = "7d56353a2a665ad0f41a421187180aab746c8c325620617ad883a99a1cbe66d2"
+SRC_URI[toml_parser-1.1.5+spec-1.1.0.sha256sum] = "baa693a8032d7e1cada7d0041e96126df243179ff061456783ac7f12bda4744c"
+SRC_URI[toml_writer-1.1.3+spec-1.1.0.sha256sum] = "06bdbd8cfc056b8d2e2e85f29b56a3bdbecb527cef81eb39e3e7b98af4652770"
 SRC_URI[tracing-0.1.44.sha256sum] = "63e71662fa4b2a2c3a26f570f037eb95bb1f85397f3cd8076caed2f026a6d100"
 SRC_URI[tracing-attributes-0.1.31.sha256sum] = "7490cfa5ec963746568740651ac6781f701c9c5ea257c58e057f3ba8cf69e8da"
 SRC_URI[tracing-core-0.1.36.sha256sum] = "db97caf9d906fbde555dd62fa95ddba9eecfd14cb388e4f491a66d74cd5fb79a"
@@ -923,7 +921,7 @@ SRC_URI[urlencoding-2.1.3.sha256sum] = "daf8dba3b7eb870caf1ddeed7bc9d2a049f3cfdf
 SRC_URI[utf8-width-0.1.7.sha256sum] = "86bd8d4e895da8537e5315b8254664e6b769c4ff3db18321b297a1e7004392e3"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.27.0.sha256sum] = "97277d36b9c3ace13e58fa6e753f8b0bbbf302a18dd193240d70f9e29681059a"
+SRC_URI[uuid-1.28.0.sha256sum] = "7cc1186384beb7dd8eedea376413fd654937285ea6c9cfbb928dc3043ea4b606"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version-ranges-0.1.1.sha256sum] = "f8d079415ceb2be83fc355adbadafe401307d5c309c7e6ade6638e6f9f42f42d"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
diff --git a/meta-python/recipes-devtools/python/python3-ruff/0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch b/meta-python/recipes-devtools/python/python3-ruff/0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch
index 788f6ec31d..6e9fe41696 100644
--- a/meta-python/recipes-devtools/python/python3-ruff/0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch
+++ b/meta-python/recipes-devtools/python/python3-ruff/0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch
@@ -1,4 +1,4 @@
-From fb8bd491698715d72568a10b118afebb31f550c9 Mon Sep 17 00:00:00 2001
+From e34a9bca8ee1276495b68355d5f7b9ef47002c5f Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Wed, 21 Oct 2026 18:00:00 -0700
 Subject: [PATCH] ruff: Use portable-atomic for AtomicU64 on targets without
@@ -31,10 +31,10 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  4 files changed, 58 insertions(+), 4 deletions(-)
 
 diff --git a/Cargo.lock b/Cargo.lock
-index 1a222f1..7e9a657 100644
+index 43b0266..f7c0158 100644
 --- a/Cargo.lock
 +++ b/Cargo.lock
-@@ -3123,6 +3123,7 @@ dependencies = [
+@@ -3110,6 +3110,7 @@ dependencies = [
   "mimalloc",
   "notify",
   "path-absolutize",
@@ -43,7 +43,7 @@ index 1a222f1..7e9a657 100644
   "regex",
   "rkyv",
 diff --git a/Cargo.toml b/Cargo.toml
-index 7a20227..a919431 100644
+index 7a42c8d..9aa4468 100644
 --- a/Cargo.toml
 +++ b/Cargo.toml
 @@ -173,6 +173,7 @@ pathdiff = { version = "0.2.1", default-features = false }
@@ -55,7 +55,7 @@ index 7a20227..a919431 100644
  proc-macro2 = { version = "1.0.79", default-features = false, features = ["proc-macro"] }
  pyproject-toml = { version = "0.13.4", default-features = false }
 diff --git a/crates/ruff/Cargo.toml b/crates/ruff/Cargo.toml
-index 718cbfa..301de70 100644
+index 4977246..db86580 100644
 --- a/crates/ruff/Cargo.toml
 +++ b/crates/ruff/Cargo.toml
 @@ -77,6 +77,9 @@ tikv-jemallocator = { workspace = true }
diff --git a/meta-python/recipes-devtools/python/python3-ruff_0.17.4.bb b/meta-python/recipes-devtools/python/python3-ruff_0.17.5.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-ruff_0.17.4.bb
rename to meta-python/recipes-devtools/python/python3-ruff_0.17.5.bb
index 2c97383b2c..de6e6d0be5 100644
--- a/meta-python/recipes-devtools/python/python3-ruff_0.17.4.bb
+++ b/meta-python/recipes-devtools/python/python3-ruff_0.17.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e679ca4f742cbfa29ab6a499529c2d39"
 
 SRC_URI += "file://0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch"
 
-SRC_URI[sha256sum] = "f32d178b50e826e00f6c6c1be3f56333068acb9b67fe167143527fa9b81e890d"
+SRC_URI[sha256sum] = "625e57d80cd43352d12ea81690f3eac46cddc8c0f35026d137fb0f157f94592e"
 
 inherit pypi python_maturin cargo-update-recipe-crates
 
-- 
2.47.3

