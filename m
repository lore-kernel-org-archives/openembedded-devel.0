Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34347.1794851735860349628
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=DtADAr3R;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36f8cdd30beso6023091eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851735; x=1795456535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hso9WEGyFNrKcLh4i8EeBmI2ybPtoVrQOsWHcFGZ5KM=;
        b=DtADAr3RXObVMKuRW9vj6EwjJuVtflbfMtIjq4YzyVLeRfRjIEzuS6LQoyOveb6F5n
         durZMRfcLCrax7fUIVcsN/0bfrMtCJpKQJYfO1ib/njCc6rp9EBBR3KQxQiN4v+ZovpO
         +gSML36McpLZH0uBZn3gJ6evQ1TDfrUyluKUW+uO2E09pDkb2ecJo6L2NKBAPMhCzGH6
         zgKCa8HgLhuyf6ILKxR+oqxeaGNZyRJT5B8NcWcRCkaw4Tqx8FiNwJDFkC2pr9K8+2tA
         4W9G9sWG/hfzZLJb+Bh056dhWFuVv0CTSG+vAl6m0XwJNgoOkYrbNFHKS+S4ZZXsVFMh
         iksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851735; x=1795456535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hso9WEGyFNrKcLh4i8EeBmI2ybPtoVrQOsWHcFGZ5KM=;
        b=bXBYf1+pnoWRgYqbaAzCkJ41MLSmfDpcEY9rNNzt1+P9fbqCXDZGM7PuOT13hDWAbp
         XMa09gLmYytsyop0svzl0zPwFJuN7ArIGD2JWROZ/p3GcW8obSZrwfBEVnvFZayuIiD0
         HBW7Sqen+ege+dSqt6SlALtv5HyP7LBUYcf3n4OSvlm/7osVwgA+GH4KJLLiN1Bi7eUo
         eKZsdJnr8DlAIaHOnGIhnxVqjuid30Ydj3X/ukFdPJDZsyYSESBFwBku6u+EWdGegCgH
         KywCzxeh2LWXX8mFNYaeYeH/+QJ7OuCNv4SVu7/pcOpj3OrbeCeJ40al8jA4VCqY3CtI
         zPYA==
X-Gm-Message-State: APuU4Z8gsCVImlPyflX5GNlk+ksXY43N3uLQ5+IW+VfUIaL6wEo2CB67
	NP+vOTMriefBXEHVoioFDqLdeszwJMkdcAMsTZG/A1NZeImBY+3vDm+LJTe0nUZS
X-Gm-Gg: AZFdTZdF7O+gsAaPS6LnP8pT8DKc1MpawBkBYR0KW89ke0dBPpUWLT06hA4uPjqruCZ
	2XJWaJbYIOJeQWUrb8NszRMkeQ1aAcJ0DKm+cDU4M74vG/JLLvJdJB8sR5Uhec5bueG1ledZZIk
	5pgofboqn2lOTXpw1MRcVUc5WkA8dLcczfLfttOnBS4qNpnNWbVjxwFvVkQExlLHjLHjOnZzYSK
	fNWDDtlwpp6Fs5wqpm1Ystp8OdwEIlsjsJvdNqZKxthAY2EtSzH66zxEDdYlUOeelrLkRGuWvsC
	GNaCVoHJBN5nqQ7WUTx+eRKn3TQFdCHOh1tOqHb11Z+Sot79GQvZfe+RfshRvP6nvFSTV0pj9X7
	1Qsydh8hK9aME0zhGqHBFjlxzV6VUbJhN7NAlQSf6Zv96T6H2eQC9IsDs0y5QOK2zZkAHIMCsWi
	BdHO7j2IKpp4e/Zec/jgKglDJYAS4iL+f5sHCfYx0DHKniIIRu1ykU16a0JhMcApxH/vyp5vN9G
	bpKz8DK+AUriqZzqBSZ4zKGnKxFifPmY9OHzzI3TVC1bAzJr1Fq48Lc8LuQ462TO2Zt59koog1c
	Q/xYNiflJwNoO2S9p2egn6hS9U9dVL3gozvAgieQD0vHA0szXDzRq9B1Z0YVNM9CEWafWyEWiHK
	wx8g0OFW7w4pmic/gIPLFGGBsU1TjOxP0j5+jhpX7geVVjUaOySS7LuoCokTKGfM9ipJJqubRTJ
	/XHrxYnxRv4tCKp6LKXJAwaizz4bfyQ4H+SoL73gkjBfyPM7cjPyD7zhuA0yDO0Cig1YFgpqLon
	XH7Ce/zs/ylxkEij9ota+/i91Y8391trU/io+8AIk4efCdyegMWvu2bamgZQ6IVkF17gBJ+8bZX
	FS8=
X-Received: by 2002:a05:693c:6293:b0:378:314:4033 with SMTP id 5a478bee46e88-379679e29f2mr11484658eec.32.1794851734504;
        Mon, 16 Nov 2026 09:55:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 066/105] python3-pydantic-core: upgrade 2.50.1 -> 2.50.4
Date: Mon, 16 Nov 2026 09:53:18 -0800
Message-ID: <20261116175359.342679-66-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132522
Content-Type: text/plain; charset="utf-8"

Refresh the radium patch and regenerate the crates.

Changes:
- Security (pydantic 2.14.2, no CVE IDs yet): GHSA-qpmf-fgh3-ff25,
  validation bypass of extra data keys in JSON model validation;
  GHSA-3r8g-cqwr-jr29, bypass of aliased fields in TypedDict and
  dataclasses with extra=allow.
- Behavior change: JSON validation by iteration now handles field
  lookup and extra data like Python validation; keys matching only an
  unused alias or field name are treated as extra (extra=forbid now
  raises).
- Fixes: GC tracking issues, infinite recursion with PydanticUseDefault,
  recursion guard for validate_strings(), disallow non-string extra
  keys, deeply nested data wrongly reported as cyclic.
- Build: PyO3 bumped to 0.30.1, jiter 0.18.0, speedate 0.18.0;
  many serialization/validation performance improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-pydantic-core-crates.inc   | 56 ++++++++++---------
 ...toml-Update-bitvec-to-use-radium-1.x.patch | 16 ++----
 ...0.1.bb => python3-pydantic-core_2.50.4.bb} |  2 +-
 3 files changed, 37 insertions(+), 37 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.50.1.bb => python3-pydantic-core_2.50.4.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
index 891718c175..f2398045ed 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
@@ -4,6 +4,7 @@
 SRC_URI += " \
     crate://crates.io/ahash/0.8.12 \
     crate://crates.io/aho-corasick/1.1.3 \
+    crate://crates.io/arrayvec/0.7.8 \
     crate://crates.io/autocfg/1.3.0 \
     crate://crates.io/base64/0.23.1 \
     crate://crates.io/bitflags/2.9.1 \
@@ -12,6 +13,7 @@ SRC_URI += " \
     crate://crates.io/cfg-if/1.0.0 \
     crate://crates.io/displaydoc/0.2.5 \
     crate://crates.io/enum_dispatch/0.3.13 \
+    crate://crates.io/equivalent/1.0.3 \
     crate://crates.io/foldhash/0.2.0 \
     crate://crates.io/form_urlencoded/1.2.2 \
     crate://crates.io/funty/2.0.0 \
@@ -31,12 +33,13 @@ SRC_URI += " \
     crate://crates.io/icu_provider_macros/1.5.0 \
     crate://crates.io/idna/1.1.0 \
     crate://crates.io/idna_adapter/1.2.0 \
+    crate://crates.io/indexmap/2.14.0 \
     crate://crates.io/itoa/1.0.11 \
-    crate://crates.io/jiter/0.16.0 \
+    crate://crates.io/jiter/0.18.0 \
     crate://crates.io/js-sys/0.3.77 \
-    crate://crates.io/lexical-parse-float/1.0.5 \
-    crate://crates.io/lexical-parse-integer/1.0.5 \
-    crate://crates.io/lexical-util/1.0.6 \
+    crate://crates.io/lexical-parse-float/1.0.6 \
+    crate://crates.io/lexical-parse-integer/1.0.6 \
+    crate://crates.io/lexical-util/1.0.7 \
     crate://crates.io/libc/0.2.185 \
     crate://crates.io/litemap/0.7.3 \
     crate://crates.io/log/0.4.27 \
@@ -49,11 +52,11 @@ SRC_URI += " \
     crate://crates.io/percent-encoding/2.3.2 \
     crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/proc-macro2/1.0.107 \
-    crate://crates.io/pyo3/0.29.2 \
-    crate://crates.io/pyo3-build-config/0.29.2 \
-    crate://crates.io/pyo3-ffi/0.29.2 \
-    crate://crates.io/pyo3-macros/0.29.2 \
-    crate://crates.io/pyo3-macros-backend/0.29.2 \
+    crate://crates.io/pyo3/0.30.1 \
+    crate://crates.io/pyo3-build-config/0.30.1 \
+    crate://crates.io/pyo3-ffi/0.30.1 \
+    crate://crates.io/pyo3-macros/0.30.1 \
+    crate://crates.io/pyo3-macros-backend/0.30.1 \
     crate://crates.io/quote/1.0.44 \
     crate://crates.io/r-efi/5.2.0 \
     crate://crates.io/radium/1.1.0 \
@@ -65,11 +68,10 @@ SRC_URI += " \
     crate://crates.io/serde_derive/1.0.229 \
     crate://crates.io/serde_json/1.0.151 \
     crate://crates.io/smallvec/1.16.2 \
-    crate://crates.io/speedate/0.17.0 \
+    crate://crates.io/speedate/0.18.0 \
     crate://crates.io/stable_deref_trait/1.2.0 \
-    crate://crates.io/static_assertions/1.1.0 \
-    crate://crates.io/strum/0.27.2 \
-    crate://crates.io/strum_macros/0.27.2 \
+    crate://crates.io/strum/0.28.0 \
+    crate://crates.io/strum_macros/0.28.0 \
     crate://crates.io/syn/2.0.82 \
     crate://crates.io/syn/3.0.6 \
     crate://crates.io/synstructure/0.13.1 \
@@ -105,6 +107,7 @@ SRC_URI += " \
 
 SRC_URI[ahash-0.8.12.sha256sum] = "5a15f179cd60c4584b8a8c596927aadc462e27f2ca70c04e0071964a73ba7a75"
 SRC_URI[aho-corasick-1.1.3.sha256sum] = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
+SRC_URI[arrayvec-0.7.8.sha256sum] = "d3fb67a6e08acf24fdeccbac2cb6ac4305825bd1f117462e0e6f2f193345ad56"
 SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
 SRC_URI[base64-0.23.1.sha256sum] = "ac07cdecf99051d9a5238b80f35af32cdeba5b336e55d957b318b50137e18da5"
 SRC_URI[bitflags-2.9.1.sha256sum] = "1b8e56985ec62d17e9c1001dc89c88ecd7dc08e47eba5ec7c29c7b5eeecde967"
@@ -113,6 +116,7 @@ SRC_URI[bumpalo-3.19.0.sha256sum] = "46c5e41b57b8bba42a04676d81cb89e9ee8e859a1a6
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
 SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
 SRC_URI[enum_dispatch-0.3.13.sha256sum] = "aa18ce2bc66555b3218614519ac839ddb759a7d6720732f979ef8d13be147ecd"
+SRC_URI[equivalent-1.0.3.sha256sum] = "00d174d5400e5e8fd687ad1049e2f578285fa914201b1af7e8b112a4546bd826"
 SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb"
 SRC_URI[form_urlencoded-1.2.2.sha256sum] = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
 SRC_URI[funty-2.0.0.sha256sum] = "e6d5a32815ae3f33302d95fdcb2ce17862f8c65363dcfd29360480ba1001fc9c"
@@ -132,12 +136,13 @@ SRC_URI[icu_provider-1.5.0.sha256sum] = "6ed421c8a8ef78d3e2dbc98a973be2f3770cb42
 SRC_URI[icu_provider_macros-1.5.0.sha256sum] = "1ec89e9337638ecdc08744df490b221a7399bf8d164eb52a665454e60e075ad6"
 SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.0.sha256sum] = "daca1df1c957320b2cf139ac61e7bd64fed304c5040df000a745aa1de3b4ef71"
+SRC_URI[indexmap-2.14.0.sha256sum] = "d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9"
 SRC_URI[itoa-1.0.11.sha256sum] = "49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b"
-SRC_URI[jiter-0.16.0.sha256sum] = "820ddcacd75c9782308d3fa594f3885630ea3f49adba78a8a29abdfe4b81630c"
+SRC_URI[jiter-0.18.0.sha256sum] = "49e31424b61d85292bd805dbf643c3ccc44f5f3871fb751209b889ee70585029"
 SRC_URI[js-sys-0.3.77.sha256sum] = "1cfaf33c695fc6e08064efbc1f72ec937429614f25eef83af942d0e227c3a28f"
-SRC_URI[lexical-parse-float-1.0.5.sha256sum] = "de6f9cb01fb0b08060209a057c048fcbab8717b4c1ecd2eac66ebfe39a65b0f2"
-SRC_URI[lexical-parse-integer-1.0.5.sha256sum] = "72207aae22fc0a121ba7b6d479e42cbfea549af1479c3f3a4f12c70dd66df12e"
-SRC_URI[lexical-util-1.0.6.sha256sum] = "5a82e24bf537fd24c177ffbbdc6ebcc8d54732c35b50a3f28cc3f4e4c949a0b3"
+SRC_URI[lexical-parse-float-1.0.6.sha256sum] = "52a9f232fbd6f550bc0137dcb5f99ab674071ac2d690ac69704593cb4abbea56"
+SRC_URI[lexical-parse-integer-1.0.6.sha256sum] = "9a7a039f8fb9c19c996cd7b2fcce303c1b2874fe1aca544edc85c4a5f8489b34"
+SRC_URI[lexical-util-1.0.7.sha256sum] = "2604dd126bb14f13fb5d1bd6a66155079cb9fa655b37f875b3a742c705dbed17"
 SRC_URI[libc-0.2.185.sha256sum] = "52ff2c0fe9bc6cb6b14a0592c2ff4fa9ceb83eea9db979b0487cd054946a2b8f"
 SRC_URI[litemap-0.7.3.sha256sum] = "643cb0b8d4fcc284004d5fd0d67ccf61dfffadb7f75e1e71bc420f4688a3a704"
 SRC_URI[log-0.4.27.sha256sum] = "13dc2df351e3202783a1fe0d44375f7295ffb4049267b0f3018346dc122a1d94"
@@ -150,11 +155,11 @@ SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515
 SRC_URI[percent-encoding-2.3.2.sha256sum] = "9b4f627cb1b25917193a259e49bdad08f671f8d9708acfd5fe0a8c1455d87220"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[proc-macro2-1.0.107.sha256sum] = "985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9"
-SRC_URI[pyo3-0.29.2.sha256sum] = "4688ddedf473e32662b9b067670129a8afb8c18e351482c70d62ba4a88171e8b"
-SRC_URI[pyo3-build-config-0.29.2.sha256sum] = "f41027e41b4bd03f6e60f9f417fe24a6341a6bb744edd62b6f709f2a52ea30e9"
-SRC_URI[pyo3-ffi-0.29.2.sha256sum] = "e591a95526fead067432c3b3a33fc74770b87b1e04e73671090d9c2055a2b327"
-SRC_URI[pyo3-macros-0.29.2.sha256sum] = "73225868fc1cd84eef2c3c230ddb91273bf1de46aeb8a4248da76d32a0924a1c"
-SRC_URI[pyo3-macros-backend-0.29.2.sha256sum] = "571575aa3749fa6216757dd47d2a3e7ef360f329a40f0666a9fbd14889024952"
+SRC_URI[pyo3-0.30.1.sha256sum] = "229ca13b8a15bb0d1487b81ab975bfcd97513416499a8312011b6036e42e0de4"
+SRC_URI[pyo3-build-config-0.30.1.sha256sum] = "70130e2b6dd1ee589a8788026a429561ca5c40fa7a2fa7914c2282eddae24700"
+SRC_URI[pyo3-ffi-0.30.1.sha256sum] = "5e7ff73c555c286d212d4ce7e5fbda845a973c4f61bd5f160f5f2c3c2a04d1c4"
+SRC_URI[pyo3-macros-0.30.1.sha256sum] = "c46d2e5862c7bb8207e3b639f713dda3c499933444784154c11d013c5a691b60"
+SRC_URI[pyo3-macros-backend-0.30.1.sha256sum] = "38b89f066f2ae72a2aef52d1537ca2fcd104440ebfadee06e97aa90738a25b9b"
 SRC_URI[quote-1.0.44.sha256sum] = "21b2ebcf727b7760c461f091f9f0f539b77b8e87f2fd88131e7f1b433b3cece4"
 SRC_URI[r-efi-5.2.0.sha256sum] = "74765f6d916ee2faa39bc8e68e4f3ed8949b48cccdac59983d287a7cb71ce9c5"
 SRC_URI[radium-1.1.0.sha256sum] = "db0b76288902db304c864a12046b73d2d895cc34a4bb8137baaeebe9978a072c"
@@ -166,11 +171,10 @@ SRC_URI[serde_core-1.0.229.sha256sum] = "67dca2c9c51e58a4791a4b1ed58308b39c64224
 SRC_URI[serde_derive-1.0.229.sha256sum] = "e7a5d71263a5a7d47b41f6b3f06ba276f10cc18b0931f1799f710578e2309348"
 SRC_URI[serde_json-1.0.151.sha256sum] = "c841b55ecdae098c80dcae9cf767f6f8a0c2cdb3416bbef72181df4d0fe73f14"
 SRC_URI[smallvec-1.16.2.sha256sum] = "f9395f0f0eee849a9b707b2f06bb92a6a422090e2123bb2ef8e87a0e61892a8e"
-SRC_URI[speedate-0.17.0.sha256sum] = "aba069c070b5e213f2a094deb7e5ed50ecb092be36102a4f4042e8d2056d060e"
+SRC_URI[speedate-0.18.0.sha256sum] = "da8f8c5f7f7ea2811a17f99bca4fec7f9ef0b0734713a5cbfc9baee203eba8eb"
 SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
-SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
-SRC_URI[strum-0.27.2.sha256sum] = "af23d6f6c1a224baef9d3f61e287d2761385a5b88fdab4eb4c6f11aeb54c4bcf"
-SRC_URI[strum_macros-0.27.2.sha256sum] = "7695ce3845ea4b33927c055a39dc438a45b059f7c1b3d91d38d10355fb8cbca7"
+SRC_URI[strum-0.28.0.sha256sum] = "9628de9b8791db39ceda2b119bbe13134770b56c138ec1d3af810d045c04f9bd"
+SRC_URI[strum_macros-0.28.0.sha256sum] = "ab85eea0270ee17587ed4156089e10b9e6880ee688791d45a905f5b1ca36f664"
 SRC_URI[syn-2.0.82.sha256sum] = "83540f837a8afc019423a8edb95b52a8effe46957ee402287f4292fae35be021"
 SRC_URI[syn-3.0.6.sha256sum] = "8593e8e72159ed2257d083c7a454a85cbf854f37a0966d8d483aff8c8a3ebcee"
 SRC_URI[synstructure-0.13.1.sha256sum] = "c8af7666ab7b6390ab78131fb5b0fce11d6b7a6951602017c35fa82800708971"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
index 30af375be5..c7ca8e2afa 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
@@ -8,15 +8,13 @@ Upstream-Status: Submitted [https://github.com/ferrilab/bitvec/pull/220]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
- Cargo.lock | 10 +++++++---
- Cargo.toml |  2 ++
+ Cargo.lock |   10 +++++++---
+ Cargo.toml |    2 ++
  2 files changed, 9 insertions(+), 3 deletions(-)
 
-diff --git a/Cargo.lock b/Cargo.lock
-index 094919f..c33228f 100644
 --- a/Cargo.lock
 +++ b/Cargo.lock
-@@ -49,7 +49,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
+@@ -55,7 +55,7 @@ source = "registry+https://github.com/ru
  checksum = "1bc2832c24239b0141d5674bb9174f9d68a8b5b3f2753311927c172ca46f7e9c"
  dependencies = [
   "funty",
@@ -25,7 +23,7 @@ index 094919f..c33228f 100644
   "tap",
   "wyz",
  ]
-@@ -449,6 +449,7 @@ dependencies = [
+@@ -467,6 +467,7 @@ dependencies = [
   "percent-encoding",
   "pyo3",
   "pyo3-build-config",
@@ -33,7 +31,7 @@ index 094919f..c33228f 100644
   "regex",
   "serde",
   "serde_json",
-@@ -538,9 +539,12 @@ checksum = "74765f6d916ee2faa39bc8e68e4f3ed8949b48cccdac59983d287a7cb71ce9c5"
+@@ -556,9 +557,12 @@ checksum = "74765f6d916ee2faa39bc8e68e4f
  
  [[package]]
  name = "radium"
@@ -48,8 +46,6 @@ index 094919f..c33228f 100644
  
  [[package]]
  name = "regex"
-diff --git a/Cargo.toml b/Cargo.toml
-index 0d1d5a4..d3da0ac 100644
 --- a/Cargo.toml
 +++ b/Cargo.toml
 @@ -25,6 +25,8 @@ include = [
@@ -60,4 +56,4 @@ index 0d1d5a4..d3da0ac 100644
 +radium = "1"
  # TODO it would be very nice to remove the "py-clone" feature as it can panic,
  # but needs a bit of work to make sure it's not used in the codebase
- pyo3 = { version = "0.29.2", features = ["num-bigint", "py-clone", "smallvec"] }
+ pyo3 = { version = "0.30.1", features = ["num-bigint", "py-clone", "smallvec"] }
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.50.1.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.50.4.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-pydantic-core_2.50.1.bb
rename to meta-python/recipes-devtools/python/python3-pydantic-core_2.50.4.bb
index 8530fddbd6..a561200f63 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.50.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.50.4.bb
@@ -13,7 +13,7 @@ require ${BPN}-crates.inc
 SRC_URI += "file://0001-Upgrade-radium-to-1.0.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/bitvec-1.0.1/"
 SRC_URI += "file://atomic.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/radium-1.1.0/"
 SRC_URI += "file://0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch"
-SRC_URI[sha256sum] = "e50d7b94baac6c7d09927fa5ca5800a0c7ee5015c7fcff65beb3a1931b5a6e09"
+SRC_URI[sha256sum] = "aead3b74b68396bf0feab5d57e050b730ded7df55853c1e048a87e00aaf033c6"
 
 DEPENDS = "python3-maturin-native python3-typing-extensions"
 
