Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A381BC5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:28 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24372.1786747585467202129
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EbKc3/1O;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc891373e0so22062175ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747585; x=1787352385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26hV8Jdv1rYvZE0eHIYhEIyCcTtHYqX6lzAFuG08zQ4=;
        b=EbKc3/1OGwb/ROO5EZlkEf3UtHN1xoo58MiDqbphlYN4uL7NA6vns0ZNW9XTrMcpqt
         NPUXfUwb+EcENPnaI0B756AsNiFiWmgIuQ5lPglrOSC3jpEHHP2QGAH4B/Wc3g+zLs+7
         U0LrSMALdBWdbXY5tLzklM2JUcktpHDmJkjpl+SoK/MLyLTnNs/DhgcKl3/XRWcCRlXB
         7tBIMMHtlI/QR0DFGsuU+fwkcvEVFHgE7+WoRwZsgLZ1HbRARfDlxkq1fiO9zrhGT3i8
         aOCwXu9U+ZJDt6lzh327gWPlQ7mWKzwtnGaL6PXuhryy2EyjvNy/3X8zIGhHuMmhclrd
         ucdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747585; x=1787352385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=26hV8Jdv1rYvZE0eHIYhEIyCcTtHYqX6lzAFuG08zQ4=;
        b=e22l6/4HLJutptMIs//olD2+xUg1cbOT90wJZULc3kEJQC4XdjEBkRQyhoXWxQaEih
         Fk35OZwDmsjZQLddCcv5VszHKGejmReM4hiYHlFlUK+g81eoMN6lYjg2XEvXo4MqmdiL
         H8PJye2udnltGGwFy+4wQ8niO2YgdDymj9VRsG6UaEeuA/14SdG68Hd4ftdYhI1HgOB5
         GOh4NIWx+SljYh72bPsLz0pAKinUaAqNd09viCGPelzXgCt6v2tlScmIZLJNYYeI3C5l
         eWEnVJ3wXck3+PQVgx1ChORFa43oLvstneK1q5GLBPVtK0uVbuLDH8OYeGmKZINQSf/h
         gBcA==
X-Gm-Message-State: AOJu0Yysz0QxxNkHDgMmYZgVuGvyUJh6/od1krT5QKODyo5udhoSGCle
	djb2QbqhhaE67Gs2LoC7lPzTijO1shfMr8IZBhYI7YlbsVgtqcP8BCL+yTj3CIPO
X-Gm-Gg: AR+sD13S+n7ZvhHnyFEB7UzKXGGym8YNj2zEEs0Ilj6nk5E5DgcsK/OccllxN5Ep3Aw
	p+fI6pav6dbuZR6N340NWcCQX7JvutevbLls2XBHsBWUSbRBt9IToyd7bySBF/RMYZ2/oB83NTO
	GEN02YwfuSheb04v9CCO8m2Ugf9ObOQPkPW29pldtZyd01n9o2SfriXlq6tKdiOP9NDr22zNhL4
	/O1HgsDfg6fmY90UIltzQwwUMHF7As7Xi2J7rVp8RGKfOmrzHdA/ecpY7nCq3l5e+h5dE2ANH2B
	qMpnnAu1dxB8UDhMnpQmzdl/UFIbsSp+ek8kY8nyt4smVe2dtssIsHmqwYqKqcmdidKLsjTAe5Z
	GRa37J0ceH1iss1vHyQriUkg8SfTGO/7gepvjH5ES+30h5TNjovCUPaO05tgwhuQ/Jp4fOo2nVX
	DTNZu0jsCRhmKhmwSjgAmvQlrX2NEi/4iZhUYdG8SS5Hl/mm+PUwnqItc2B5g4WSqxKy+cgF41r
	hgzEH92CJ95GkPQ+0Ic4GYdyW8uUYidZNnQJ4dde9Wk3E9i0JVRu1CxOoXIv5KHIQZW/HBiGcOx
	wcLPWs9cehYJcMKgI+uLxgVxdL2V2Iq/7C6bud+vaD1B2B7ImRsnPioVj9OBhWF+Zx9AcclUv+1
	4WcvkYmpMO15aLtQSAWrtnucMFiUG31R/SlcfSnuAnzd83A==
X-Received: by 2002:a05:6a21:69c:b0:3c4:42d9:58e3 with SMTP id adf61e73a8af0-3cc71e182f5mr10904409637.13.1786747584663;
        Fri, 14 Aug 2026 15:46:24 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 038/109] librust-cxx: upgrade 1.0.197 -> 1.0.198
Date: Fri, 14 Aug 2026 15:44:24 -0700
Message-ID: <20260814224539.1523174-38-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129102

Point release with bug fixes and minor improvements.

Recipe-side changes: patches / files moved to the new version directory.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../librust-cxx/librust-cxx-crates.inc        | 71 ++++++++++---------
 ...-cxx_1.0.197.bb => librust-cxx_1.0.198.bb} |  2 +-
 2 files changed, 38 insertions(+), 35 deletions(-)
 rename meta-oe/recipes-devtools/librust-cxx/{librust-cxx_1.0.197.bb => librust-cxx_1.0.198.bb} (93%)

diff --git a/meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc b/meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc
index c66fac799f..0965a6b5bf 100644
--- a/meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc
+++ b/meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc
@@ -3,19 +3,19 @@
 # from Cargo.lock
 SRC_URI += " \
     crate://crates.io/anstyle/1.0.14 \
-    crate://crates.io/bitflags/2.13.0 \
-    crate://crates.io/cc/1.2.66 \
+    crate://crates.io/bitflags/2.13.1 \
+    crate://crates.io/cc/1.3.0 \
     crate://crates.io/cfg-if/1.0.4 \
-    crate://crates.io/clap/4.6.1 \
-    crate://crates.io/clap_builder/4.6.0 \
+    crate://crates.io/clap/4.6.2 \
+    crate://crates.io/clap_builder/4.6.2 \
     crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/codespan-reporting/0.13.1 \
-    crate://crates.io/cxx-build/1.0.197 \
-    crate://crates.io/cxx-gen/0.7.197 \
+    crate://crates.io/cxx-build/1.0.198 \
+    crate://crates.io/cxx-gen/0.7.198 \
     crate://crates.io/cxx-test-suite/0.0.1 \
-    crate://crates.io/cxxbridge-cmd/1.0.197 \
-    crate://crates.io/cxxbridge-flags/1.0.197 \
-    crate://crates.io/cxxbridge-macro/1.0.197 \
+    crate://crates.io/cxxbridge-cmd/1.0.198 \
+    crate://crates.io/cxxbridge-flags/1.0.198 \
+    crate://crates.io/cxxbridge-macro/1.0.198 \
     crate://crates.io/dissimilar/1.0.11 \
     crate://crates.io/equivalent/1.0.2 \
     crate://crates.io/errno/0.3.14 \
@@ -31,7 +31,7 @@ SRC_URI += " \
     crate://crates.io/libc/0.2.186 \
     crate://crates.io/link-cplusplus/1.0.12 \
     crate://crates.io/linux-raw-sys/0.12.1 \
-    crate://crates.io/memchr/2.8.2 \
+    crate://crates.io/memchr/2.8.3 \
     crate://crates.io/once_cell/1.21.4 \
     crate://crates.io/proc-macro2/1.0.106 \
     crate://crates.io/quote/1.0.46 \
@@ -46,37 +46,39 @@ SRC_URI += " \
     crate://crates.io/serde_spanned/1.1.1 \
     crate://crates.io/shlex/2.0.1 \
     crate://crates.io/strsim/0.11.1 \
-    crate://crates.io/syn/2.0.118 \
-    crate://crates.io/target-triple/1.0.0 \
+    crate://crates.io/syn/2.0.119 \
+    crate://crates.io/syn/3.0.0 \
+    crate://crates.io/target-triple/1.0.1 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/termcolor/1.4.1 \
-    crate://crates.io/toml/1.1.2+spec-1.1.0 \
+    crate://crates.io/toml/1.1.3+spec-1.1.0 \
     crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
     crate://crates.io/toml_parser/1.1.2+spec-1.1.0 \
-    crate://crates.io/toml_writer/1.1.1+spec-1.1.0 \
-    crate://crates.io/trybuild/1.0.117 \
+    crate://crates.io/toml_writer/1.1.2+spec-1.1.0 \
+    crate://crates.io/trybuild/1.0.118 \
     crate://crates.io/unicode-ident/1.0.24 \
     crate://crates.io/unicode-width/0.2.2 \
     crate://crates.io/winapi-util/0.1.11 \
     crate://crates.io/windows-link/0.2.1 \
     crate://crates.io/windows-sys/0.61.2 \
-    crate://crates.io/winnow/1.0.3 \
-    crate://crates.io/zmij/1.0.21 \
+    crate://crates.io/winnow/1.0.4 \
+    crate://crates.io/zmij/1.0.23 \
 "
+
 SRC_URI[anstyle-1.0.14.sha256sum] = "940b3a0ca603d1eade50a4846a2afffd5ef57a9feac2c0e2ec2e14f9ead76000"
-SRC_URI[bitflags-2.13.0.sha256sum] = "b4388bee8683e3d04af747c73422af53102d2bd24d9eadb6cbc100baef4b43f8"
-SRC_URI[cc-1.2.66.sha256sum] = "f5d6cac793997bd970000024b2934968efe83b382de4fdcf4fcb46b6ee4ad996"
+SRC_URI[bitflags-2.13.1.sha256sum] = "b588b76d00fde79687d7646a9b5bdf3cc0f655e0bbd080335a95d7e96f3587da"
+SRC_URI[cc-1.3.0.sha256sum] = "c89588d05638b5b4594a3348a2d6c20277e43a7f5c5202b05cc56888475a47b8"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
-SRC_URI[clap-4.6.1.sha256sum] = "1ddb117e43bbf7dacf0a4190fef4d345b9bad68dfc649cb349e7d17d28428e51"
-SRC_URI[clap_builder-4.6.0.sha256sum] = "714a53001bf66416adb0e2ef5ac857140e7dc3a0c48fb28b2f10762fc4b5069f"
+SRC_URI[clap-4.6.2.sha256sum] = "dd059f9da4f5c36b3787f65d38ccaab1cc315f07b01f89abc8359ee6a8205011"
+SRC_URI[clap_builder-4.6.2.sha256sum] = "f09628afdcc538b57f3c6341e9c8e9970f18e4a481690a64974d7023bd33548b"
 SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
 SRC_URI[codespan-reporting-0.13.1.sha256sum] = "af491d569909a7e4dee0ad7db7f5341fef5c614d5b8ec8cf765732aba3cff681"
-SRC_URI[cxx-build-1.0.197.sha256sum] = "43e05269dbed4dab7072ae0f04ef31799ad189d52ce2ac12710c2997b754f86a"
-SRC_URI[cxx-gen-0.7.197.sha256sum] = "1fe60274ac750caecda11504eec75de8ff73c8dfdfeb50eedb485e291b2c4018"
+SRC_URI[cxx-build-1.0.198.sha256sum] = "e3184a94384c663718698311a78a51ac00c484c10b4eeac06fb0a068c5f64fa2"
+SRC_URI[cxx-gen-0.7.198.sha256sum] = "fb0f24fd8cafa20f043e24372ca5d8273ab1fdce055ee977b989f82c1bcd89b5"
 SRC_URI[cxx-test-suite-0.0.1.sha256sum] = "2a0a413bcefc6b37668d9eae784f5fe11232343e11101f1d1834163a509610e7"
-SRC_URI[cxxbridge-cmd-1.0.197.sha256sum] = "e2f017b07e0da7f425642339faff0edc9f0de6459a18180183d086d1f3381e89"
-SRC_URI[cxxbridge-flags-1.0.197.sha256sum] = "293d267f43a5778bf3b89fff2a658f081166e7f152d9640e2ee3d917d065a5fc"
-SRC_URI[cxxbridge-macro-1.0.197.sha256sum] = "72dd233dc128223fe85d2afa5c617c79743c0f47fb495b69234b5da680d4986a"
+SRC_URI[cxxbridge-cmd-1.0.198.sha256sum] = "0148d8fd1199329ddf1d157a5e134e51ceff37c6a7ddd38615c399d81cb05d8d"
+SRC_URI[cxxbridge-flags-1.0.198.sha256sum] = "52850339faed2eaadd24e286dc1d8268cc6f8a7bd9524d713adc9099566b4c89"
+SRC_URI[cxxbridge-macro-1.0.198.sha256sum] = "2c77c856545d886c9bd5215409ebb63b925e262135248b50c79e5a5f194ee47c"
 SRC_URI[dissimilar-1.0.11.sha256sum] = "aeda16ab4059c5fd2a83f2b9c9e9c981327b18aa8e3b313f7e6563799d4f093e"
 SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
 SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
@@ -92,7 +94,7 @@ SRC_URI[itoa-1.0.18.sha256sum] = "8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c
 SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
 SRC_URI[link-cplusplus-1.0.12.sha256sum] = "7f78c730aaa7d0b9336a299029ea49f9ee53b0ed06e9202e8cb7db9bae7b8c82"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
-SRC_URI[memchr-2.8.2.sha256sum] = "88904434abc2901f197fe8cc55f0445e7ded921dba5911dad2e2b39b48e663c4"
+SRC_URI[memchr-2.8.3.sha256sum] = "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98"
 SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
 SRC_URI[quote-1.0.46.sha256sum] = "dfbc457d0c7a0759a614551b11a6409e5951f6c7537be1f1b7682b9ae9230368"
@@ -107,19 +109,20 @@ SRC_URI[serde_json-1.0.150.sha256sum] = "e8014e44b4736ed0538adeecded0fce2a272f22
 SRC_URI[serde_spanned-1.1.1.sha256sum] = "6662b5879511e06e8999a8a235d848113e942c9124f211511b16466ee2995f26"
 SRC_URI[shlex-2.0.1.sha256sum] = "f8fadd59c855ef2080decdef8ff161eb6661b86933c9d82e5ba29dc602a55aba"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
-SRC_URI[syn-2.0.118.sha256sum] = "1b9ae57f904213ebb649ce6895b8a66c66f0203b9319718f69a5612a065b1422"
-SRC_URI[target-triple-1.0.0.sha256sum] = "591ef38edfb78ca4771ee32cf494cb8771944bee237a9b91fc9c1424ac4b777b"
+SRC_URI[syn-2.0.119.sha256sum] = "872831b642d1a07999a962a351ed35b955ea2cfc8f3862091e2a240a84f17297"
+SRC_URI[syn-3.0.0.sha256sum] = "f2fac314a64dc9a36e61a9eb4261a5e9bbfbc922b27e518af97bc32b926cf967"
+SRC_URI[target-triple-1.0.1.sha256sum] = "c3a6bfce3d99adfa72d24750a61f782f3036a81e7f86d8841ee1326deaebd171"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[termcolor-1.4.1.sha256sum] = "06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755"
-SRC_URI[toml-1.1.2+spec-1.1.0.sha256sum] = "81f3d15e84cbcd896376e6730314d59fb5a87f31e4b038454184435cd57defee"
+SRC_URI[toml-1.1.3+spec-1.1.0.sha256sum] = "53c96ecdfa941c8fc4fcaed14f99ada8ebed502eef533015095a07e3301d4c3c"
 SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] = "3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
 SRC_URI[toml_parser-1.1.2+spec-1.1.0.sha256sum] = "a2abe9b86193656635d2411dc43050282ca48aa31c2451210f4202550afb7526"
-SRC_URI[toml_writer-1.1.1+spec-1.1.0.sha256sum] = "756daf9b1013ebe47a8776667b466417e2d4c5679d441c26230efd9ef78692db"
-SRC_URI[trybuild-1.0.117.sha256sum] = "0710d4dfbeae4f9c390baa784c49858a7468fa433f3fe5d0ec5ebef651cf59f9"
+SRC_URI[toml_writer-1.1.2+spec-1.1.0.sha256sum] = "7d56353a2a665ad0f41a421187180aab746c8c325620617ad883a99a1cbe66d2"
+SRC_URI[trybuild-1.0.118.sha256sum] = "06649c6f63d86604ba0c8950d5a1829fc9a17afd70fc6629f481d75b6a624c78"
 SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
 SRC_URI[unicode-width-0.2.2.sha256sum] = "b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254"
 SRC_URI[winapi-util-0.1.11.sha256sum] = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
 SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
 SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
-SRC_URI[winnow-1.0.3.sha256sum] = "0592e1c9d151f854e6fd382574c3a0855250e1d9b2f99d9281c6e6391af352f1"
-SRC_URI[zmij-1.0.21.sha256sum] = "b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa"
+SRC_URI[winnow-1.0.4.sha256sum] = "23b97319f7b8343df12cc98938e5c3eb436064524c8d2b4e30a1d3a36eecdf81"
+SRC_URI[zmij-1.0.23.sha256sum] = "29666d0abbfad1e3dc4dcf6144730dd3a3ab225bbbdac83319345b1b44ccfc1b"
diff --git a/meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.197.bb b/meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.198.bb
similarity index 93%
rename from meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.197.bb
rename to meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.198.bb
index a8c8480705..7b4aa36568 100644
--- a/meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.197.bb
+++ b/meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.198.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "crate://crates.io/cxx/${PV};name=cxx"
-SRC_URI[cxx.sha256sum] = "00424da159cc5adcb4eeea7e7b5cb1d96df41f5fa695ec596922181bdc36232a"
+SRC_URI[cxx.sha256sum] = "6fe442a792c7c736eea18b32a7f8a3b63cf8aafabda6760042dc2fdeda456291"
 
 S = "${CARGO_VENDORING_DIRECTORY}/cxx-${PV}"
 

