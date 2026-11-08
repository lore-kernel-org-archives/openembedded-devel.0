Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2909.1794165993893063696
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 11:26:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: roosesweb@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso1225485e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 11:26:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165992; x=1794770792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MA0652qK95ZHPTPy2VuHwDY5SnwmDswqhQv3oILikHc=;
        b=afW4UWkjbezf6MTBcvchtY1F/JQUjZavAoNpbO/JrPsnRjUnfRXRD1Dz2fmOj74yS6
         +5qrr3oLYE0QBoLgkVjEY97lv3z2KVllAxdcbx5RT1PcyN/Snph6PdcWhZ6RnyL44QaW
         SXON3rR4+Hh7RcQrE0pTPw2mvDv3bWX1Nd74xUfAc4OBJggSyy8rj3eVeU+MvJRLwwR7
         kauxb4LZhCARArz+f1FMt+Eh6M20MZe2YaDbxyj2YV58n20JJCMTwM2yrPuXf1H38flL
         BjjBX3+mJ9+rnllYLYwEmKOo561T1vvntSkEfuAx6kOHLPY9xlN4dGGWBEPoJesP4hPV
         H1ZQ==
X-Gm-Message-State: APuU4Z8zk0McmFC4SSYu6GPykb+NTVAotBPtVRa94Ajw9KPzF+25IBEd
	qnTqbQVaS8msSOr+1BjGY0aGPCHZz9sIaGyLvBQuJCxTuyVxwuQXGaX5nma/fw==
X-Gm-Gg: AYBFou3UKBhDuBLr7BTpxFVy1WRzfnzmW7ENArYkNPAv4spKHvYiHpOiXjXxa7yWm5J
	v6KbTYiRq2RF/a/6rOcpHbbzATEYA8sCKKMVT6wkfwCMUP4EbFWa0NPiLjXoTrswBitQo5Bz6U0
	Fct/ZezLFkJNnD48uVBek588yiDtupUtMzQ868YCDE9QoCTBHx89S1Mrr58wpDo/4rA2ww8f2Af
	bJH7nAZob0/TaaJaxFlvSuVYKMJX3sSKZKKIoDwzHi9wkxhwmlpaaja6RAryIKNFOliB8aZokgY
	Cx0Hpy1/UiRaFQtvExo8aR6/MzEq8kk1gptHEu0Dl4EPd6+PSiAr2OxUCfilnb0ITyQUTuQLouR
	zMGo2M5Msx97xM6q4VDKoYb092UJyoL5+A2b5AFyVkDzwMmUTxiQfyxJz8PCJKBG2kv9t1KY7Kc
	IdiePhgs+6QeZGI74UggmG241Pwzno49GEkBdxOih8wsV2yfUJbEoSOb0pdWOASp2CjNa4obM+O
	BGkC/WeExS8+PINk0CIkOo9t0c9zg4xuRVYQ44a2D2vEJ/zcTwDwE0QzwMvu5hkGGX1TD9BA1uh
	Btatzz3eCdB6+prgdEzr1rJ6OPwrr2r3OyM+DVSy2ETEYuAq9WHvG7geslsBQKOE6ZEcyJ9uC7X
	2jraYS7FKZqSz5Oa5wAGMiXKOUr9yeB8XbIMIC3oc8WjFSQfvnFLEcMgfJQ==
X-Received: by 2002:a05:6000:25ea:b0:490:2d81:ccbb with SMTP id ffacd0b85a97d-49584e3dccbmr4203932f8f.52.1794165991723;
        Sun, 08 Nov 2026 11:26:31 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f38e2bsm5808729f8f.8.2026.11.08.11.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:26:31 -0800 (PST)
From: "Thomas Roos" <roosesweb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Roos <thomas@roosesweb.de>
Subject: [meta-python][PATCH 09/13] python3-pydantic-core: upgrade 2.46.5 -> 2.50.1
Date: Sun,  8 Nov 2026 20:26:14 +0100
Message-ID: <20261108192623.1082770-10-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108192623.1082770-1-thomas@roosesweb.de>
References: <20261108192623.1082770-1-thomas@roosesweb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132031
Content-Type: text/plain; charset="utf-8"

pydantic 2.14.1 pins pydantic-core 2.50.1; with 2.46.5, "import pydantic"
raises SystemError because the versions do not match.

Refresh 0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch and
regenerate python3-pydantic-core-crates.inc with
bitbake -c update_crates.

AI-Generated: Claude Code, Claude Opus 5.5
Signed-off-by: Thomas Roos <thomas@roosesweb.de>
---
 .../python/python3-pydantic-core-crates.inc   | 88 +++++++++----------
 ...toml-Update-bitvec-to-use-radium-1.x.patch | 14 +--
 ...6.5.bb => python3-pydantic-core_2.50.1.bb} |  2 +-
 3 files changed, 48 insertions(+), 56 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.46.5.bb => python3-pydantic-core_2.50.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
index d475222253..891718c175 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
@@ -4,22 +4,19 @@
 SRC_URI += " \
     crate://crates.io/ahash/0.8.12 \
     crate://crates.io/aho-corasick/1.1.3 \
-    crate://crates.io/allocator-api2/0.2.21 \
     crate://crates.io/autocfg/1.3.0 \
-    crate://crates.io/base64/0.22.1 \
+    crate://crates.io/base64/0.23.1 \
     crate://crates.io/bitflags/2.9.1 \
     crate://crates.io/bitvec/1.0.1 \
     crate://crates.io/bumpalo/3.19.0 \
-    crate://crates.io/cc/1.0.101 \
     crate://crates.io/cfg-if/1.0.0 \
     crate://crates.io/displaydoc/0.2.5 \
     crate://crates.io/enum_dispatch/0.3.13 \
-    crate://crates.io/equivalent/1.0.2 \
     crate://crates.io/foldhash/0.2.0 \
     crate://crates.io/form_urlencoded/1.2.2 \
     crate://crates.io/funty/2.0.0 \
     crate://crates.io/getrandom/0.3.3 \
-    crate://crates.io/hashbrown/0.16.1 \
+    crate://crates.io/hashbrown/0.17.1 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/hex/0.4.3 \
     crate://crates.io/icu_collections/1.5.0 \
@@ -35,7 +32,7 @@ SRC_URI += " \
     crate://crates.io/idna/1.1.0 \
     crate://crates.io/idna_adapter/1.2.0 \
     crate://crates.io/itoa/1.0.11 \
-    crate://crates.io/jiter/0.14.0 \
+    crate://crates.io/jiter/0.16.0 \
     crate://crates.io/js-sys/0.3.77 \
     crate://crates.io/lexical-parse-float/1.0.5 \
     crate://crates.io/lexical-parse-integer/1.0.5 \
@@ -43,7 +40,7 @@ SRC_URI += " \
     crate://crates.io/libc/0.2.185 \
     crate://crates.io/litemap/0.7.3 \
     crate://crates.io/log/0.4.27 \
-    crate://crates.io/lru/0.16.3 \
+    crate://crates.io/lru/0.18.5 \
     crate://crates.io/memchr/2.7.4 \
     crate://crates.io/num-bigint/0.4.6 \
     crate://crates.io/num-integer/0.1.46 \
@@ -51,31 +48,30 @@ SRC_URI += " \
     crate://crates.io/once_cell/1.21.3 \
     crate://crates.io/percent-encoding/2.3.2 \
     crate://crates.io/portable-atomic/1.6.0 \
-    crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/pyo3/0.28.3 \
-    crate://crates.io/pyo3-build-config/0.28.3 \
-    crate://crates.io/pyo3-ffi/0.28.3 \
-    crate://crates.io/pyo3-macros/0.28.3 \
-    crate://crates.io/pyo3-macros-backend/0.28.3 \
-    crate://crates.io/python3-dll-a/0.2.14 \
+    crate://crates.io/proc-macro2/1.0.107 \
+    crate://crates.io/pyo3/0.29.2 \
+    crate://crates.io/pyo3-build-config/0.29.2 \
+    crate://crates.io/pyo3-ffi/0.29.2 \
+    crate://crates.io/pyo3-macros/0.29.2 \
+    crate://crates.io/pyo3-macros-backend/0.29.2 \
     crate://crates.io/quote/1.0.44 \
     crate://crates.io/r-efi/5.2.0 \
     crate://crates.io/radium/1.1.0 \
-    crate://crates.io/regex/1.12.3 \
-    crate://crates.io/regex-automata/0.4.13 \
-    crate://crates.io/regex-syntax/0.8.5 \
-    crate://crates.io/rustversion/1.0.17 \
-    crate://crates.io/serde/1.0.228 \
-    crate://crates.io/serde_core/1.0.228 \
-    crate://crates.io/serde_derive/1.0.228 \
-    crate://crates.io/serde_json/1.0.149 \
-    crate://crates.io/smallvec/1.15.1 \
+    crate://crates.io/regex/1.13.1 \
+    crate://crates.io/regex-automata/0.4.18 \
+    crate://crates.io/regex-syntax/0.8.11 \
+    crate://crates.io/serde/1.0.229 \
+    crate://crates.io/serde_core/1.0.229 \
+    crate://crates.io/serde_derive/1.0.229 \
+    crate://crates.io/serde_json/1.0.151 \
+    crate://crates.io/smallvec/1.16.2 \
     crate://crates.io/speedate/0.17.0 \
     crate://crates.io/stable_deref_trait/1.2.0 \
     crate://crates.io/static_assertions/1.1.0 \
     crate://crates.io/strum/0.27.2 \
     crate://crates.io/strum_macros/0.27.2 \
     crate://crates.io/syn/2.0.82 \
+    crate://crates.io/syn/3.0.6 \
     crate://crates.io/synstructure/0.13.1 \
     crate://crates.io/tap/1.0.1 \
     crate://crates.io/target-lexicon/0.13.4 \
@@ -84,7 +80,7 @@ SRC_URI += " \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf16_iter/1.0.5 \
     crate://crates.io/utf8_iter/1.0.4 \
-    crate://crates.io/uuid/1.23.0 \
+    crate://crates.io/uuid/1.23.4 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/wasi/0.14.2+wasi-0.2.4 \
     crate://crates.io/wasm-bindgen/0.2.100 \
@@ -109,22 +105,19 @@ SRC_URI += " \
 
 SRC_URI[ahash-0.8.12.sha256sum] = "5a15f179cd60c4584b8a8c596927aadc462e27f2ca70c04e0071964a73ba7a75"
 SRC_URI[aho-corasick-1.1.3.sha256sum] = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
-SRC_URI[allocator-api2-0.2.21.sha256sum] = "683d7910e743518b0e34f1186f92494becacb047c7b6bf616c96772180fef923"
 SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
-SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
+SRC_URI[base64-0.23.1.sha256sum] = "ac07cdecf99051d9a5238b80f35af32cdeba5b336e55d957b318b50137e18da5"
 SRC_URI[bitflags-2.9.1.sha256sum] = "1b8e56985ec62d17e9c1001dc89c88ecd7dc08e47eba5ec7c29c7b5eeecde967"
 SRC_URI[bitvec-1.0.1.sha256sum] = "1bc2832c24239b0141d5674bb9174f9d68a8b5b3f2753311927c172ca46f7e9c"
 SRC_URI[bumpalo-3.19.0.sha256sum] = "46c5e41b57b8bba42a04676d81cb89e9ee8e859a1a66f80a5a72e1cb76b34d43"
-SRC_URI[cc-1.0.101.sha256sum] = "ac367972e516d45567c7eafc73d24e1c193dcf200a8d94e9db7b3d38b349572d"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
 SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
 SRC_URI[enum_dispatch-0.3.13.sha256sum] = "aa18ce2bc66555b3218614519ac839ddb759a7d6720732f979ef8d13be147ecd"
-SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
 SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb"
 SRC_URI[form_urlencoded-1.2.2.sha256sum] = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
 SRC_URI[funty-2.0.0.sha256sum] = "e6d5a32815ae3f33302d95fdcb2ce17862f8c65363dcfd29360480ba1001fc9c"
 SRC_URI[getrandom-0.3.3.sha256sum] = "26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4"
-SRC_URI[hashbrown-0.16.1.sha256sum] = "841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100"
+SRC_URI[hashbrown-0.17.1.sha256sum] = "ed5909b6e89a2db4456e54cd5f673791d7eca6732202bbf2a9cc504fe2f9b84a"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[hex-0.4.3.sha256sum] = "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70"
 SRC_URI[icu_collections-1.5.0.sha256sum] = "db2fa452206ebee18c4b5c2274dbf1de17008e874b4dc4f0aea9d01ca79e4526"
@@ -140,7 +133,7 @@ SRC_URI[icu_provider_macros-1.5.0.sha256sum] = "1ec89e9337638ecdc08744df490b221a
 SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.0.sha256sum] = "daca1df1c957320b2cf139ac61e7bd64fed304c5040df000a745aa1de3b4ef71"
 SRC_URI[itoa-1.0.11.sha256sum] = "49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b"
-SRC_URI[jiter-0.14.0.sha256sum] = "b6f3b5d3f84b36f4ad09fd1da896d23d9852a1aa86556578dd0289f43dce311d"
+SRC_URI[jiter-0.16.0.sha256sum] = "820ddcacd75c9782308d3fa594f3885630ea3f49adba78a8a29abdfe4b81630c"
 SRC_URI[js-sys-0.3.77.sha256sum] = "1cfaf33c695fc6e08064efbc1f72ec937429614f25eef83af942d0e227c3a28f"
 SRC_URI[lexical-parse-float-1.0.5.sha256sum] = "de6f9cb01fb0b08060209a057c048fcbab8717b4c1ecd2eac66ebfe39a65b0f2"
 SRC_URI[lexical-parse-integer-1.0.5.sha256sum] = "72207aae22fc0a121ba7b6d479e42cbfea549af1479c3f3a4f12c70dd66df12e"
@@ -148,7 +141,7 @@ SRC_URI[lexical-util-1.0.6.sha256sum] = "5a82e24bf537fd24c177ffbbdc6ebcc8d54732c
 SRC_URI[libc-0.2.185.sha256sum] = "52ff2c0fe9bc6cb6b14a0592c2ff4fa9ceb83eea9db979b0487cd054946a2b8f"
 SRC_URI[litemap-0.7.3.sha256sum] = "643cb0b8d4fcc284004d5fd0d67ccf61dfffadb7f75e1e71bc420f4688a3a704"
 SRC_URI[log-0.4.27.sha256sum] = "13dc2df351e3202783a1fe0d44375f7295ffb4049267b0f3018346dc122a1d94"
-SRC_URI[lru-0.16.3.sha256sum] = "a1dc47f592c06f33f8e3aea9591776ec7c9f9e4124778ff8a3c3b87159f7e593"
+SRC_URI[lru-0.18.5.sha256sum] = "ef9ac18847474e638e3702b76c65d4eb93428471a74778ef0f1be711717f89b5"
 SRC_URI[memchr-2.7.4.sha256sum] = "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
 SRC_URI[num-bigint-0.4.6.sha256sum] = "a5e44f723f1133c9deac646763579fdb3ac745e418f2a7af9cd0c431da1f20b9"
 SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
@@ -156,31 +149,30 @@ SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0
 SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
 SRC_URI[percent-encoding-2.3.2.sha256sum] = "9b4f627cb1b25917193a259e49bdad08f671f8d9708acfd5fe0a8c1455d87220"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
-SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[pyo3-0.28.3.sha256sum] = "91fd8e38a3b50ed1167fb981cd6fd60147e091784c427b8f7183a7ee32c31c12"
-SRC_URI[pyo3-build-config-0.28.3.sha256sum] = "e368e7ddfdeb98c9bca7f8383be1648fd84ab466bf2bc015e94008db6d35611e"
-SRC_URI[pyo3-ffi-0.28.3.sha256sum] = "7f29e10af80b1f7ccaf7f69eace800a03ecd13e883acfacc1e5d0988605f651e"
-SRC_URI[pyo3-macros-0.28.3.sha256sum] = "df6e520eff47c45997d2fc7dd8214b25dd1310918bbb2642156ef66a67f29813"
-SRC_URI[pyo3-macros-backend-0.28.3.sha256sum] = "c4cdc218d835738f81c2338f822078af45b4afdf8b2e33cbb5916f108b813acb"
-SRC_URI[python3-dll-a-0.2.14.sha256sum] = "d381ef313ae70b4da5f95f8a4de773c6aa5cd28f73adec4b4a31df70b66780d8"
+SRC_URI[proc-macro2-1.0.107.sha256sum] = "985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9"
+SRC_URI[pyo3-0.29.2.sha256sum] = "4688ddedf473e32662b9b067670129a8afb8c18e351482c70d62ba4a88171e8b"
+SRC_URI[pyo3-build-config-0.29.2.sha256sum] = "f41027e41b4bd03f6e60f9f417fe24a6341a6bb744edd62b6f709f2a52ea30e9"
+SRC_URI[pyo3-ffi-0.29.2.sha256sum] = "e591a95526fead067432c3b3a33fc74770b87b1e04e73671090d9c2055a2b327"
+SRC_URI[pyo3-macros-0.29.2.sha256sum] = "73225868fc1cd84eef2c3c230ddb91273bf1de46aeb8a4248da76d32a0924a1c"
+SRC_URI[pyo3-macros-backend-0.29.2.sha256sum] = "571575aa3749fa6216757dd47d2a3e7ef360f329a40f0666a9fbd14889024952"
 SRC_URI[quote-1.0.44.sha256sum] = "21b2ebcf727b7760c461f091f9f0f539b77b8e87f2fd88131e7f1b433b3cece4"
 SRC_URI[r-efi-5.2.0.sha256sum] = "74765f6d916ee2faa39bc8e68e4f3ed8949b48cccdac59983d287a7cb71ce9c5"
 SRC_URI[radium-1.1.0.sha256sum] = "db0b76288902db304c864a12046b73d2d895cc34a4bb8137baaeebe9978a072c"
-SRC_URI[regex-1.12.3.sha256sum] = "e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab477f51b72e7f3ac0e276"
-SRC_URI[regex-automata-0.4.13.sha256sum] = "5276caf25ac86c8d810222b3dbb938e512c55c6831a10f3e6ed1c93b84041f1c"
-SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
-SRC_URI[rustversion-1.0.17.sha256sum] = "955d28af4278de8121b7ebeb796b6a45735dc01436d898801014aced2773a3d6"
-SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
-SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
-SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
-SRC_URI[serde_json-1.0.149.sha256sum] = "83fc039473c5595ace860d8c4fafa220ff474b3fc6bfdb4293327f1a37e94d86"
-SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
+SRC_URI[regex-1.13.1.sha256sum] = "f020237b6c8eed93db2e2cb53c00c60a8e1bc73da7d073199a1180401450218d"
+SRC_URI[regex-automata-0.4.18.sha256sum] = "ad8553b9b26413251cbf30e620595c7a41b3887f03da04579c0e6b0d6a06b4b2"
+SRC_URI[regex-syntax-0.8.11.sha256sum] = "d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4"
+SRC_URI[serde-1.0.229.sha256sum] = "4148590afebada386688f18773da617792bf2ef03ffc1e4cbd2b1d45b023e0ba"
+SRC_URI[serde_core-1.0.229.sha256sum] = "67dca2c9c51e58a4791a4b1ed58308b39c64224d349a935ab5039aa360942a48"
+SRC_URI[serde_derive-1.0.229.sha256sum] = "e7a5d71263a5a7d47b41f6b3f06ba276f10cc18b0931f1799f710578e2309348"
+SRC_URI[serde_json-1.0.151.sha256sum] = "c841b55ecdae098c80dcae9cf767f6f8a0c2cdb3416bbef72181df4d0fe73f14"
+SRC_URI[smallvec-1.16.2.sha256sum] = "f9395f0f0eee849a9b707b2f06bb92a6a422090e2123bb2ef8e87a0e61892a8e"
 SRC_URI[speedate-0.17.0.sha256sum] = "aba069c070b5e213f2a094deb7e5ed50ecb092be36102a4f4042e8d2056d060e"
 SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
 SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
 SRC_URI[strum-0.27.2.sha256sum] = "af23d6f6c1a224baef9d3f61e287d2761385a5b88fdab4eb4c6f11aeb54c4bcf"
 SRC_URI[strum_macros-0.27.2.sha256sum] = "7695ce3845ea4b33927c055a39dc438a45b059f7c1b3d91d38d10355fb8cbca7"
 SRC_URI[syn-2.0.82.sha256sum] = "83540f837a8afc019423a8edb95b52a8effe46957ee402287f4292fae35be021"
+SRC_URI[syn-3.0.6.sha256sum] = "8593e8e72159ed2257d083c7a454a85cbf854f37a0966d8d483aff8c8a3ebcee"
 SRC_URI[synstructure-0.13.1.sha256sum] = "c8af7666ab7b6390ab78131fb5b0fce11d6b7a6951602017c35fa82800708971"
 SRC_URI[tap-1.0.1.sha256sum] = "55937e1799185b12863d447f42597ed69d9928686b8d88a1df17376a097d8369"
 SRC_URI[target-lexicon-0.13.4.sha256sum] = "b1dd07eb858a2067e2f3c7155d54e929265c264e6f37efe3ee7a8d1b5a1dd0ba"
@@ -189,7 +181,7 @@ SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb66163
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
 SRC_URI[utf16_iter-1.0.5.sha256sum] = "c8232dd3cdaed5356e0f716d285e4b40b932ac434100fe9b7e0e8e935b9e6246"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
-SRC_URI[uuid-1.23.0.sha256sum] = "5ac8b6f42ead25368cf5b098aeb3dc8a1a2c05a3eee8a9a1a68c640edbfc79d9"
+SRC_URI[uuid-1.23.4.sha256sum] = "bf80a72845275afea99e7f2b434723d3bc7e38470fcd1c7ed39a599c73319a53"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[wasi-0.14.2+wasi-0.2.4.sha256sum] = "9683f9a5a998d873c0d21fcbe3c083009670149a8fab228644b8bd36b2c48cb3"
 SRC_URI[wasm-bindgen-0.2.100.sha256sum] = "1edc8929d7499fc4e8f0be2262a241556cfc54a0bea223790e71446f2aab1ef5"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
index 80f0e840ee..30af375be5 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
@@ -1,4 +1,4 @@
-From d75df9ca49a825b67b53db9505b2aef2a79e3c76 Mon Sep 17 00:00:00 2001
+From bbce870c29c4c51402a39383476597438b4dfcef Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 19 Apr 2025 00:09:42 -0700
 Subject: [PATCH] cargo.toml: Update bitvec to use radium 1.x
@@ -13,10 +13,10 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  2 files changed, 9 insertions(+), 3 deletions(-)
 
 diff --git a/Cargo.lock b/Cargo.lock
-index 22a8524..1f97c2d 100644
+index 094919f..c33228f 100644
 --- a/Cargo.lock
 +++ b/Cargo.lock
-@@ -55,7 +55,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
+@@ -49,7 +49,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
  checksum = "1bc2832c24239b0141d5674bb9174f9d68a8b5b3f2753311927c172ca46f7e9c"
  dependencies = [
   "funty",
@@ -25,7 +25,7 @@ index 22a8524..1f97c2d 100644
   "tap",
   "wyz",
  ]
-@@ -469,6 +469,7 @@ dependencies = [
+@@ -449,6 +449,7 @@ dependencies = [
   "percent-encoding",
   "pyo3",
   "pyo3-build-config",
@@ -33,7 +33,7 @@ index 22a8524..1f97c2d 100644
   "regex",
   "serde",
   "serde_json",
-@@ -569,9 +570,12 @@ checksum = "74765f6d916ee2faa39bc8e68e4f3ed8949b48cccdac59983d287a7cb71ce9c5"
+@@ -538,9 +539,12 @@ checksum = "74765f6d916ee2faa39bc8e68e4f3ed8949b48cccdac59983d287a7cb71ce9c5"
  
  [[package]]
  name = "radium"
@@ -49,7 +49,7 @@ index 22a8524..1f97c2d 100644
  [[package]]
  name = "regex"
 diff --git a/Cargo.toml b/Cargo.toml
-index dd453c5..d120608 100644
+index 0d1d5a4..d3da0ac 100644
 --- a/Cargo.toml
 +++ b/Cargo.toml
 @@ -25,6 +25,8 @@ include = [
@@ -60,4 +60,4 @@ index dd453c5..d120608 100644
 +radium = "1"
  # TODO it would be very nice to remove the "py-clone" feature as it can panic,
  # but needs a bit of work to make sure it's not used in the codebase
- pyo3 = { version = "0.28", features = ["generate-import-lib", "num-bigint", "py-clone", "smallvec"] }
+ pyo3 = { version = "0.29.2", features = ["num-bigint", "py-clone", "smallvec"] }
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.46.5.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.50.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pydantic-core_2.46.5.bb
rename to meta-python/recipes-devtools/python/python3-pydantic-core_2.50.1.bb
index 616656af67..e8f2317921 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.46.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.50.1.bb
@@ -13,7 +13,7 @@ require ${BPN}-crates.inc
 SRC_URI += "file://0001-Upgrade-radium-to-1.0.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/bitvec-1.0.1/"
 SRC_URI += "file://atomic.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/radium-1.1.0/"
 SRC_URI += "file://0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch"
-SRC_URI[sha256sum] = "10416c15b8839ecc4ef4d0885da76da6fd0f67333a0eb8aff6d93c4b8f2910fc"
+SRC_URI[sha256sum] = "e50d7b94baac6c7d09927fa5ca5800a0c7ee5015c7fcff65beb3a1931b5a6e09"
 
 DEPENDS = "python3-maturin-native python3-typing-extensions"
 
-- 
2.56.0

