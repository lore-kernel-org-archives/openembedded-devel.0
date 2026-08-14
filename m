Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEA1C5DF70
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:49 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24517.1786747607292405137
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MXqyt5hC;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e58034d05so1413888a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747607; x=1787352407; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y3XXI2Ygm7bCQolFA3XyWan0IHqa4yuv6dp0gozDNi0=;
        b=MXqyt5hCLN0Ahz91GTB3r3A0JBkuA8y/zOuudDCIFVWYqXJuPD6W22TshNE+In2siS
         vsBtPFMpzbyCNfRibNvbjf/I/rAbDU8BEbFptrhX1DeiB/wi0mxsyELbDJxO1NTbtdIF
         9twlT1TEupGaXzDVgCN1odrZQh6SYL9FBcBPlGgL7jtex1PfPWxAE1xkG+k96fxKbnR2
         8Fp7P25Inl64Jd6iiC4KYMHqOe3Q7K4dBAlYkm0BoHnJb7t2jbOQMt1cc5sogj1hWFLA
         JrlPYz3Jjidv5HP5iYSnlEhM3hEXCUukj+Z/lO9EGgYLWXs0dolJQhEU8bvhzeYdQQjk
         sR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747607; x=1787352407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y3XXI2Ygm7bCQolFA3XyWan0IHqa4yuv6dp0gozDNi0=;
        b=rBSQyzdPXog3SCu9uWocDL1uwTOOy9lgMz83DMSY0bNMh9/IfxxGF4Ts8VTyyJ6dM/
         hObpVXPLR38FJgob7ojb9B1y4QzzHk7nx0nSPvvZGXfqIc8ivx7ZqHY2IQsGTSZnvecb
         TDwOJGW47o8PKGBwi+78b71I/S9MSlK5BjAVAhhICSpOIeMtmsWZ2E4hpIMYfZEkUt6s
         B+5Nd5/BU8XXc1S2qvEIxqHmbcb9GqSeJd+AT07qNQK7iShlVPnz1L47vGd/Zs0qJg+o
         gNmwXbmwfplD8Q8oBCtfgEL/z+FTFRQIEEqbtRl9G5Qwai2hdEay63j4ZoXRBCCsQopZ
         PeCw==
X-Gm-Message-State: AOJu0YypXiijmB5DiZ9R2tGnK5AMdiABJsCy0A9ys56BaDVNOyRuhI6M
	sURKbbgDz3jgM9vWDrm98U1sY1f36oGfxn7r7tWlKVovgiD615WubCp4VjdN9lqa
X-Gm-Gg: AR+sD12QtYg5kWPlVZ08V2GzNinvonipiy8CzWGA2t4O1XyCeOA6AWucDpGhr+99MiF
	4KC/N4ZtDRdNEyJ/ap9kc31px2kp/yKLR19Zde4ajXlw5i1JZpfaHIi6a1jzbas6T3/9jHANW02
	+dCVm+OyLq+s9TXsWFAeBPOEiVH5Qj2AcTqtxs0Gqkq92kDBbqaYz55Oo2TsbIcp+dxq+9swanh
	c4B0aJIEHh7AJ/qPMLFqVuO2rhXyvZ4W6AzXstxwPEfoz52ULJP6q+vMUJ5ZrJg+mo2K3dqVFTz
	sLDPiSEEnzqhwDY5E9I1qgxTx/VWVTwI58aIfQ0BO5+YYwMO/TgVL2Z0wUfWiO/dYjZJK5V0od0
	enP4aqX3JKasP1/2pWPg40yOkyEQM9ELHo2V+MPTt0o85bAaUGD5X+l5nN8oV5QRNe2+3sYOGoZ
	TLxeZj5K7kVXkjz46vhcUf6p/0n5KvrrefpKXSiitRK4bJM9481fl+lUsHhBngH7CAKzl5dh2ho
	C+1Q/Hy+D2ww951DNHzFT+2DSeO3X2U9UQwCQoamMZvCbPyY67rOHNc9i0H3WDUz1mzqYFi6mhr
	IWx8AdXFbTpW4w0QoGGSM2ctj4xD6cbwABi4+98ytgLELdVrZ2LfwZARF6O9UqO+7xL9qu1zX2k
	NDngxLyh51NGWGzLwrEbN0gGUORxiGE/PsZy1vY5Yr+V6jg==
X-Received: by 2002:a17:90b:4a8c:b0:381:bc4c:da56 with SMTP id 98e67ed59e1d1-3933b95158dmr8993866a91.19.1786747606449;
        Fri, 14 Aug 2026 15:46:46 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 057/109] ripgrep: upgrade 15.1.0 -> 15.2.0
Date: Fri, 14 Aug 2026 15:44:43 -0700
Message-ID: <20260814224539.1523174-57-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129121

Minor release; see upstream release notes for details.

Recipe-side changes: patches / files moved to the new version directory.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../ripgrep/ripgrep-crates.inc                | 140 +++++++++---------
 .../{ripgrep_15.1.0.bb => ripgrep_15.2.0.bb}  |   2 +-
 2 files changed, 69 insertions(+), 73 deletions(-)
 rename meta-oe/recipes-extended/ripgrep/{ripgrep_15.1.0.bb => ripgrep_15.2.0.bb} (87%)

diff --git a/meta-oe/recipes-extended/ripgrep/ripgrep-crates.inc b/meta-oe/recipes-extended/ripgrep/ripgrep-crates.inc
index aa7e3f9dd2..57f1c7021f 100644
--- a/meta-oe/recipes-extended/ripgrep/ripgrep-crates.inc
+++ b/meta-oe/recipes-extended/ripgrep/ripgrep-crates.inc
@@ -2,115 +2,111 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/aho-corasick/1.1.3 \
-    crate://crates.io/anyhow/1.0.100 \
-    crate://crates.io/bstr/1.12.0 \
-    crate://crates.io/cc/1.2.41 \
+    crate://crates.io/aho-corasick/1.1.4 \
+    crate://crates.io/anyhow/1.0.103 \
+    crate://crates.io/bstr/1.13.0 \
+    crate://crates.io/cc/1.2.67 \
     crate://crates.io/cfg-if/1.0.4 \
-    crate://crates.io/crossbeam-deque/0.8.6 \
-    crate://crates.io/crossbeam-epoch/0.9.18 \
-    crate://crates.io/crossbeam-utils/0.8.21 \
+    crate://crates.io/crossbeam-deque/0.8.7 \
+    crate://crates.io/crossbeam-epoch/0.9.20 \
+    crate://crates.io/crossbeam-utils/0.8.22 \
     crate://crates.io/encoding_rs/0.8.35 \
     crate://crates.io/encoding_rs_io/0.1.7 \
-    crate://crates.io/find-msvc-tools/0.1.4 \
-    crate://crates.io/getrandom/0.3.4 \
-    crate://crates.io/globset/0.4.18 \
+    crate://crates.io/find-msvc-tools/0.1.9 \
+    crate://crates.io/getrandom/0.4.3 \
+    crate://crates.io/globset/0.4.19 \
     crate://crates.io/grep/0.4.1 \
     crate://crates.io/grep-cli/0.1.12 \
-    crate://crates.io/grep-matcher/0.1.8 \
-    crate://crates.io/grep-pcre2/0.1.9 \
+    crate://crates.io/grep-matcher/0.1.9 \
+    crate://crates.io/grep-pcre2/0.1.10 \
     crate://crates.io/grep-printer/0.3.1 \
     crate://crates.io/grep-regex/0.1.14 \
-    crate://crates.io/grep-searcher/0.1.16 \
-    crate://crates.io/ignore/0.4.24 \
-    crate://crates.io/itoa/1.0.15 \
-    crate://crates.io/jobserver/0.1.34 \
-    crate://crates.io/lexopt/0.3.1 \
-    crate://crates.io/libc/0.2.177 \
-    crate://crates.io/log/0.4.28 \
-    crate://crates.io/memchr/2.7.6 \
-    crate://crates.io/memmap2/0.9.9 \
+    crate://crates.io/grep-searcher/0.1.17 \
+    crate://crates.io/ignore/0.4.29 \
+    crate://crates.io/itoa/1.0.18 \
+    crate://crates.io/jobserver/0.1.35 \
+    crate://crates.io/lexopt/0.3.2 \
+    crate://crates.io/libc/0.2.186 \
+    crate://crates.io/log/0.4.33 \
+    crate://crates.io/memchr/2.8.3 \
+    crate://crates.io/memmap2/0.9.11 \
     crate://crates.io/pcre2/0.2.11 \
     crate://crates.io/pcre2-sys/0.2.10 \
-    crate://crates.io/pkg-config/0.3.32 \
-    crate://crates.io/proc-macro2/1.0.101 \
-    crate://crates.io/quote/1.0.41 \
-    crate://crates.io/r-efi/5.3.0 \
-    crate://crates.io/regex-automata/0.4.13 \
-    crate://crates.io/regex-syntax/0.8.8 \
-    crate://crates.io/ryu/1.0.20 \
+    crate://crates.io/pkg-config/0.3.33 \
+    crate://crates.io/proc-macro2/1.0.106 \
+    crate://crates.io/quote/1.0.46 \
+    crate://crates.io/r-efi/6.0.0 \
+    crate://crates.io/regex-automata/0.4.15 \
+    crate://crates.io/regex-syntax/0.8.11 \
     crate://crates.io/same-file/1.0.6 \
     crate://crates.io/serde/1.0.228 \
     crate://crates.io/serde_core/1.0.228 \
     crate://crates.io/serde_derive/1.0.228 \
-    crate://crates.io/serde_json/1.0.145 \
-    crate://crates.io/shlex/1.3.0 \
-    crate://crates.io/syn/2.0.107 \
+    crate://crates.io/serde_json/1.0.150 \
+    crate://crates.io/shlex/2.0.1 \
+    crate://crates.io/syn/2.0.119 \
     crate://crates.io/termcolor/1.4.1 \
     crate://crates.io/textwrap/0.16.2 \
-    crate://crates.io/tikv-jemalloc-sys/0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7 \
-    crate://crates.io/tikv-jemallocator/0.6.1 \
-    crate://crates.io/unicode-ident/1.0.20 \
+    crate://crates.io/tikv-jemalloc-sys/0.7.1+5.3.1-0-g81034ce1f1373e37dc865038e1bc8eeecf559ce8 \
+    crate://crates.io/tikv-jemallocator/0.7.0 \
+    crate://crates.io/unicode-ident/1.0.24 \
     crate://crates.io/walkdir/2.5.0 \
-    crate://crates.io/wasip2/1.0.1+wasi-0.2.4 \
     crate://crates.io/winapi-util/0.1.11 \
     crate://crates.io/windows-link/0.2.1 \
     crate://crates.io/windows-sys/0.61.2 \
-    crate://crates.io/wit-bindgen/0.46.0 \
+    crate://crates.io/zmij/1.0.23 \
 "
 
-SRC_URI[aho-corasick-1.1.3.sha256sum] = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
-SRC_URI[anyhow-1.0.100.sha256sum] = "a23eb6b1614318a8071c9b2521f36b424b2c83db5eb3a0fead4a6c0809af6e61"
-SRC_URI[bstr-1.12.0.sha256sum] = "234113d19d0d7d613b40e86fb654acf958910802bcceab913a4f9e7cda03b1a4"
-SRC_URI[cc-1.2.41.sha256sum] = "ac9fe6cdbb24b6ade63616c0a0688e45bb56732262c158df3c0c4bea4ca47cb7"
+SRC_URI[aho-corasick-1.1.4.sha256sum] = "ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301"
+SRC_URI[anyhow-1.0.103.sha256sum] = "2a4385e2e34eb35d6b3efe798b9eb88096925d87726c0798709bf56d9ed84af3"
+SRC_URI[bstr-1.13.0.sha256sum] = "1f7dc094d718f2e1c1559ad110e27eeaae14a5465d3d56dd6dbd793079fbd530"
+SRC_URI[cc-1.2.67.sha256sum] = "e17dd265a7d0f31ef544e1b20e03add05d3b45b491b633b10d67145d2acc1a38"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
-SRC_URI[crossbeam-deque-0.8.6.sha256sum] = "9dd111b7b7f7d55b72c0a6ae361660ee5853c9af73f70c3c2ef6858b950e2e51"
-SRC_URI[crossbeam-epoch-0.9.18.sha256sum] = "5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e"
-SRC_URI[crossbeam-utils-0.8.21.sha256sum] = "d0a5c400df2834b80a4c3327b3aad3a4c4cd4de0629063962b03235697506a28"
+SRC_URI[crossbeam-deque-0.8.7.sha256sum] = "5181e0de7b61eb03a81e347d6dd8797bae9da5146707b51077e2d71a54ec0ceb"
+SRC_URI[crossbeam-epoch-0.9.20.sha256sum] = "2d6914041f254d6e9176c01941b21115dcfb7089e55135a35411081bd106ef3f"
+SRC_URI[crossbeam-utils-0.8.22.sha256sum] = "61803da095bee82a81bb1a452ecc25d3b2f1416d1897eb86430c6159ef717c17"
 SRC_URI[encoding_rs-0.8.35.sha256sum] = "75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3"
 SRC_URI[encoding_rs_io-0.1.7.sha256sum] = "1cc3c5651fb62ab8aa3103998dade57efdd028544bd300516baa31840c252a83"
-SRC_URI[find-msvc-tools-0.1.4.sha256sum] = "52051878f80a721bb68ebfbc930e07b65ba72f2da88968ea5c06fd6ca3d3a127"
-SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
-SRC_URI[globset-0.4.18.sha256sum] = "52dfc19153a48bde0cbd630453615c8151bce3a5adfac7a0aebfbf0a1e1f57e3"
+SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
+SRC_URI[getrandom-0.4.3.sha256sum] = "300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099"
+SRC_URI[globset-0.4.19.sha256sum] = "e47d37d2ae4464254884b60ab7071be2b876a9c35b696bd018ddcc76847309cd"
 SRC_URI[grep-0.4.1.sha256sum] = "309217bc53e2c691c314389c7fa91f9cd1a998cda19e25544ea47d94103880c3"
 SRC_URI[grep-cli-0.1.12.sha256sum] = "cf32d263c5d5cc2a23ce587097f5ddafdb188492ba2e6fb638eaccdc22453631"
-SRC_URI[grep-matcher-0.1.8.sha256sum] = "36d7b71093325ab22d780b40d7df3066ae4aebb518ba719d38c697a8228a8023"
-SRC_URI[grep-pcre2-0.1.9.sha256sum] = "667bb90a3ee51f8f6e2aadf1d0f106ea42efca4cf28f0e71f0fdec1137d7f9b0"
+SRC_URI[grep-matcher-0.1.9.sha256sum] = "f9417543f4870fc8f1c8e1af870afae2431007626d9e703fce6471c468d33847"
+SRC_URI[grep-pcre2-0.1.10.sha256sum] = "b752bb6f57dd3716e55b63a33ca05b5825c3d66cd427468874a5564af6ca365c"
 SRC_URI[grep-printer-0.3.1.sha256sum] = "fd76035e87871f51c1ee5b793e32122b3ccf9c692662d9622ef1686ff5321acb"
 SRC_URI[grep-regex-0.1.14.sha256sum] = "0ce0c256c3ad82bcc07b812c15a45ec1d398122e8e15124f96695234db7112ef"
-SRC_URI[grep-searcher-0.1.16.sha256sum] = "ac63295322dc48ebb20a25348147905d816318888e64f531bfc2a2bc0577dc34"
-SRC_URI[ignore-0.4.24.sha256sum] = "81776e6f9464432afcc28d03e52eb101c93b6f0566f52aef2427663e700f0403"
-SRC_URI[itoa-1.0.15.sha256sum] = "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
-SRC_URI[jobserver-0.1.34.sha256sum] = "9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33"
-SRC_URI[lexopt-0.3.1.sha256sum] = "9fa0e2a1fcbe2f6be6c42e342259976206b383122fc152e872795338b5a3f3a7"
-SRC_URI[libc-0.2.177.sha256sum] = "2874a2af47a2325c2001a6e6fad9b16a53b802102b528163885171cf92b15976"
-SRC_URI[log-0.4.28.sha256sum] = "34080505efa8e45a4b816c349525ebe327ceaa8559756f0356cba97ef3bf7432"
-SRC_URI[memchr-2.7.6.sha256sum] = "f52b00d39961fc5b2736ea853c9cc86238e165017a493d1d5c8eac6bdc4cc273"
-SRC_URI[memmap2-0.9.9.sha256sum] = "744133e4a0e0a658e1374cf3bf8e415c4052a15a111acd372764c55b4177d490"
+SRC_URI[grep-searcher-0.1.17.sha256sum] = "72348823a0eafc4bc2e9051064f28b5b42cc100b571b3a35d67918d711efcbc6"
+SRC_URI[ignore-0.4.29.sha256sum] = "d4ffa3a0547a138e59ddd6fa3b7c672ed47e6ad6a3cd177984ff1116aa5ba742"
+SRC_URI[itoa-1.0.18.sha256sum] = "8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682"
+SRC_URI[jobserver-0.1.35.sha256sum] = "1c00acbd29eabad4a2392fa0e921c874934dbbf4194312ad20f04a0ed67a3cb3"
+SRC_URI[lexopt-0.3.2.sha256sum] = "803ec87c9cfb29b9d2633f20cba1f488db3fd53f2158b1024cbefb47ba05d413"
+SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
+SRC_URI[log-0.4.33.sha256sum] = "0ceec5bc11778974d1bcb055b18002eba7f4b3518b6a0081b3af5f21666da9ad"
+SRC_URI[memchr-2.8.3.sha256sum] = "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98"
+SRC_URI[memmap2-0.9.11.sha256sum] = "d1219ed1b7f229ee7104d281dd01d6802fe28bb6e95d292942c4daacdeb798c0"
 SRC_URI[pcre2-0.2.11.sha256sum] = "9e970b0fcce0c7ee6ef662744ff711f21ccd6f11b7cf03cd187a80e89797fc67"
 SRC_URI[pcre2-sys-0.2.10.sha256sum] = "18b9073c1a2549bd409bf4a32c94d903bb1a09bf845bc306ae148897fa0760a4"
-SRC_URI[pkg-config-0.3.32.sha256sum] = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c"
-SRC_URI[proc-macro2-1.0.101.sha256sum] = "89ae43fd86e4158d6db51ad8e2b80f313af9cc74f5c0e03ccb87de09998732de"
-SRC_URI[quote-1.0.41.sha256sum] = "ce25767e7b499d1b604768e7cde645d14cc8584231ea6b295e9c9eb22c02e1d1"
-SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
-SRC_URI[regex-automata-0.4.13.sha256sum] = "5276caf25ac86c8d810222b3dbb938e512c55c6831a10f3e6ed1c93b84041f1c"
-SRC_URI[regex-syntax-0.8.8.sha256sum] = "7a2d987857b319362043e95f5353c0535c1f58eec5336fdfcf626430af7def58"
-SRC_URI[ryu-1.0.20.sha256sum] = "28d3b2b1366ec20994f1fd18c3c594f05c5dd4bc44d8bb0c1c632c8d6829481f"
+SRC_URI[pkg-config-0.3.33.sha256sum] = "19f132c84eca552bf34cab8ec81f1c1dcc229b811638f9d283dceabe58c5569e"
+SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
+SRC_URI[quote-1.0.46.sha256sum] = "dfbc457d0c7a0759a614551b11a6409e5951f6c7537be1f1b7682b9ae9230368"
+SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
+SRC_URI[regex-automata-0.4.15.sha256sum] = "1f388202e4b80542a0921078cc23b6333bcf1409c1e3f86404cae4766a6131db"
+SRC_URI[regex-syntax-0.8.11.sha256sum] = "d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
 SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
 SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
 SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
-SRC_URI[serde_json-1.0.145.sha256sum] = "402a6f66d8c709116cf22f558eab210f5a50187f702eb4d7e5ef38d9a7f1c79c"
-SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
-SRC_URI[syn-2.0.107.sha256sum] = "2a26dbd934e5451d21ef060c018dae56fc073894c5a7896f882928a76e6d081b"
+SRC_URI[serde_json-1.0.150.sha256sum] = "e8014e44b4736ed0538adeecded0fce2a272f22dc9578a7eb6b2d9993c74cfb9"
+SRC_URI[shlex-2.0.1.sha256sum] = "f8fadd59c855ef2080decdef8ff161eb6661b86933c9d82e5ba29dc602a55aba"
+SRC_URI[syn-2.0.119.sha256sum] = "872831b642d1a07999a962a351ed35b955ea2cfc8f3862091e2a240a84f17297"
 SRC_URI[termcolor-1.4.1.sha256sum] = "06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755"
 SRC_URI[textwrap-0.16.2.sha256sum] = "c13547615a44dc9c452a8a534638acdf07120d4b6847c8178705da06306a3057"
-SRC_URI[tikv-jemalloc-sys-0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7.sha256sum] = "cd8aa5b2ab86a2cefa406d889139c162cbb230092f7d1d7cbc1716405d852a3b"
-SRC_URI[tikv-jemallocator-0.6.1.sha256sum] = "0359b4327f954e0567e69fb191cf1436617748813819c94b8cd4a431422d053a"
-SRC_URI[unicode-ident-1.0.20.sha256sum] = "462eeb75aeb73aea900253ce739c8e18a67423fadf006037cd3ff27e82748a06"
+SRC_URI[tikv-jemalloc-sys-0.7.1+5.3.1-0-g81034ce1f1373e37dc865038e1bc8eeecf559ce8.sha256sum] = "1a2825c78386b4ae0314074867860ba9577875de945f05992c38815cbec327f0"
+SRC_URI[tikv-jemallocator-0.7.0.sha256sum] = "249f09e49ab1609436f34c776e84231bead18d6a955f119f939bdc1d847561bd"
+SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
-SRC_URI[wasip2-1.0.1+wasi-0.2.4.sha256sum] = "0562428422c63773dad2c345a1882263bbf4d65cf3f42e90921f787ef5ad58e7"
 SRC_URI[winapi-util-0.1.11.sha256sum] = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
 SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
 SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
-SRC_URI[wit-bindgen-0.46.0.sha256sum] = "f17a85883d4e6d00e8a97c586de764dabcc06133f7f1d55dce5cdc070ad7fe59"
+SRC_URI[zmij-1.0.23.sha256sum] = "29666d0abbfad1e3dc4dcf6144730dd3a3ab225bbbdac83319345b1b44ccfc1b"
diff --git a/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb b/meta-oe/recipes-extended/ripgrep/ripgrep_15.2.0.bb
similarity index 87%
rename from meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
rename to meta-oe/recipes-extended/ripgrep/ripgrep_15.2.0.bb
index 9b323bba12..6f109fc065 100644
--- a/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
+++ b/meta-oe/recipes-extended/ripgrep/ripgrep_15.2.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "crate://crates.io/ripgrep/${PV};name=ripgrep"
-SRC_URI[ripgrep.sha256sum] = "f388c4955f85477c28a8667355819844a06614b083c23517f0e86bd1d6d82b73"
+SRC_URI[ripgrep.sha256sum] = "a30750b6d0743bfdd2656ebbaf4555aa278c43144b84bc389bcbfa399485ec71"
 S = "${CARGO_VENDORING_DIRECTORY}/ripgrep-${PV}"
 
 inherit cargo cargo-update-recipe-crates

