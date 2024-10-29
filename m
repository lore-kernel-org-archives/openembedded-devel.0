Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB80ED5B87A
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 04:25:08 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.12000.1730175904566514396
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 21:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MPsABSXc;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-71817c40110so2545022a34.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 21:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730175904; x=1730780704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IlnS6tS6dF50GChKp0AIKPqJP9Rtpjz7ArytNfUA38=;
        b=MPsABSXcQUV1F9i0OgZNGI3e0To0TDfmm9JH+ChvysbZHM47yKHuFYqjyr4NWTbKfi
         /8fXeuM23sXaxxCI7i91aBEc8i6proi7Z56EMu4Gf0lsFmmDRFosuZ0tB1Ky3hjz7UEh
         MDhm1ELUnfj2DzUp9N7myeyTGgJtStlsiTN3+hygKPmkXplUvVJcYombW6hZa+FxklaF
         pps9EAYcvQCrL3dOKNVCftXEJWsBbcHf9PSjbHN2dW40S7MQjUU7fP7sGPK9l+76eRVT
         HlqlIeCmjU7K9gQxKFMK59GGghyxpFxdXOIANUwGSIzMWjoKOFywlR02gs2CnsxiWqNn
         qbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730175904; x=1730780704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8IlnS6tS6dF50GChKp0AIKPqJP9Rtpjz7ArytNfUA38=;
        b=Mb1QpJ6qQ7/fnsRJ3KNYCJ1pl7DnzFqi7q74XQRcQDiiAmrxYYnaHgoIhKvQuh/4HT
         XEcBNbsz1SgBm0Uhedy+4SAA5YncRWVSTLOG5aowv6olE/uRlFSEO5HcWAmUmMhPi+34
         DzYtR5T3lCTykTaD57wMpM/dX04kGswxZcCdMgiy7DrhjB53gWcggKXtm6Uw7lxZJMYL
         XZRed8NCs0yLL4Mnffow++lgsjJoafgSrxtftxueVCDKAASw3yiWu9g2sJVm2SKen66f
         h6g5gL+9yyXUsRoTvpbjg0/QKONQhON1xOLcbSArkyRppLvq1osjVx1DP1EkG7bgEjBj
         qe2g==
X-Gm-Message-State: AOJu0YwEBfvTaomh4NDlLWS4WvFuTIE+JlwtodtnQReTbdkvcevX1iO0
	cYBxbIGWVOR+D0XEe6GfdL24ad/VXHAT1zEYZLi7IsTLSRafYttR2jF20xXm
X-Google-Smtp-Source: AGHT+IEc3GDunSNDgXAYUmy2e6oQjH/+51Oh4qTP8qkqsFvYkNPyJVbtHwT6uvvGChFIsXsS9l3ltg==
X-Received: by 2002:a05:6830:43ac:b0:718:12af:c89b with SMTP id 46e09a7af769-71867f11bd7mr8269134a34.1.1730175903458;
        Mon, 28 Oct 2024 21:25:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8085])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8679cbesm6710198a12.24.2024.10.28.21.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 21:25:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 4/5] python3-pydantic-core: Upgrade to 2.25.0
Date: Mon, 28 Oct 2024 21:24:56 -0700
Message-ID: <20241029042457.4125617-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029042457.4125617-1-raj.khem@gmail.com>
References: <20241029042457.4125617-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 04:25:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113320

Needed for py 3.13 support in pydantic 2.9 recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pydantic-core-crates.inc   | 56 +++++++++---------
 ...embed-RUSTFLAGS-in-final-binary-1396.patch | 58 -------------------
 ...1.0.bb => python3-pydantic-core_2.25.0.bb} |  3 +-
 3 files changed, 29 insertions(+), 88 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/0001-dont-embed-RUSTFLAGS-in-final-binary-1396.patch
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.21.0.bb => python3-pydantic-core_2.25.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
index 531632f32b..05863c870c 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
@@ -29,7 +29,7 @@ SRC_URI += " \
     crate://crates.io/icu_provider/1.5.0 \
     crate://crates.io/icu_provider_macros/1.5.0 \
     crate://crates.io/idna/0.5.0 \
-    crate://crates.io/idna/1.0.1 \
+    crate://crates.io/idna/1.0.2 \
     crate://crates.io/indexmap/2.2.6 \
     crate://crates.io/indoc/2.0.5 \
     crate://crates.io/itoa/1.0.11 \
@@ -48,29 +48,29 @@ SRC_URI += " \
     crate://crates.io/percent-encoding/2.3.1 \
     crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/pyo3/0.22.2 \
-    crate://crates.io/pyo3-build-config/0.22.2 \
-    crate://crates.io/pyo3-ffi/0.22.2 \
-    crate://crates.io/pyo3-macros/0.22.2 \
-    crate://crates.io/pyo3-macros-backend/0.22.2 \
+    crate://crates.io/pyo3/0.22.5 \
+    crate://crates.io/pyo3-build-config/0.22.5 \
+    crate://crates.io/pyo3-ffi/0.22.5 \
+    crate://crates.io/pyo3-macros/0.22.5 \
+    crate://crates.io/pyo3-macros-backend/0.22.5 \
     crate://crates.io/python3-dll-a/0.2.10 \
     crate://crates.io/quote/1.0.36 \
     crate://crates.io/radium/0.7.0 \
-    crate://crates.io/regex/1.10.5 \
-    crate://crates.io/regex-automata/0.4.7 \
-    crate://crates.io/regex-syntax/0.8.4 \
+    crate://crates.io/regex/1.11.0 \
+    crate://crates.io/regex-automata/0.4.8 \
+    crate://crates.io/regex-syntax/0.8.5 \
     crate://crates.io/rustversion/1.0.17 \
     crate://crates.io/ryu/1.0.18 \
-    crate://crates.io/serde/1.0.204 \
-    crate://crates.io/serde_derive/1.0.204 \
-    crate://crates.io/serde_json/1.0.121 \
+    crate://crates.io/serde/1.0.213 \
+    crate://crates.io/serde_derive/1.0.213 \
+    crate://crates.io/serde_json/1.0.132 \
     crate://crates.io/smallvec/1.13.2 \
     crate://crates.io/speedate/0.14.4 \
     crate://crates.io/stable_deref_trait/1.2.0 \
     crate://crates.io/static_assertions/1.1.0 \
     crate://crates.io/strum/0.26.3 \
     crate://crates.io/strum_macros/0.26.4 \
-    crate://crates.io/syn/2.0.68 \
+    crate://crates.io/syn/2.0.82 \
     crate://crates.io/synstructure/0.13.1 \
     crate://crates.io/tap/1.0.1 \
     crate://crates.io/target-lexicon/0.12.14 \
@@ -84,7 +84,7 @@ SRC_URI += " \
     crate://crates.io/url/2.5.2 \
     crate://crates.io/utf16_iter/1.0.5 \
     crate://crates.io/utf8_iter/1.0.4 \
-    crate://crates.io/uuid/1.9.1 \
+    crate://crates.io/uuid/1.11.0 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
     crate://crates.io/write16/1.0.0 \
@@ -127,7 +127,7 @@ SRC_URI[icu_properties_data-1.5.0.sha256sum] = "67a8effbc3dd3e4ba1afa8ad918d5684
 SRC_URI[icu_provider-1.5.0.sha256sum] = "6ed421c8a8ef78d3e2dbc98a973be2f3770cb42b606e3ab18d6237c4dfde68d9"
 SRC_URI[icu_provider_macros-1.5.0.sha256sum] = "1ec89e9337638ecdc08744df490b221a7399bf8d164eb52a665454e60e075ad6"
 SRC_URI[idna-0.5.0.sha256sum] = "634d9b1461af396cad843f47fdba5597a4f9e6ddd4bfb6ff5d85028c25cb12f6"
-SRC_URI[idna-1.0.1.sha256sum] = "44a986806a1cc899952ba462bc1f28afbfd5850ab6cb030ccb20dd02cc527a24"
+SRC_URI[idna-1.0.2.sha256sum] = "bd69211b9b519e98303c015e21a007e293db403b6c85b9b124e133d25e242cdd"
 SRC_URI[indexmap-2.2.6.sha256sum] = "168fb715dda47215e360912c096649d23d58bf392ac62f73919e831745e40f26"
 SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
 SRC_URI[itoa-1.0.11.sha256sum] = "49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b"
@@ -146,29 +146,29 @@ SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa
 SRC_URI[percent-encoding-2.3.1.sha256sum] = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[pyo3-0.22.2.sha256sum] = "831e8e819a138c36e212f3af3fd9eeffed6bf1510a805af35b0edee5ffa59433"
-SRC_URI[pyo3-build-config-0.22.2.sha256sum] = "1e8730e591b14492a8945cdff32f089250b05f5accecf74aeddf9e8272ce1fa8"
-SRC_URI[pyo3-ffi-0.22.2.sha256sum] = "5e97e919d2df92eb88ca80a037969f44e5e70356559654962cbb3316d00300c6"
-SRC_URI[pyo3-macros-0.22.2.sha256sum] = "eb57983022ad41f9e683a599f2fd13c3664d7063a3ac5714cae4b7bee7d3f206"
-SRC_URI[pyo3-macros-backend-0.22.2.sha256sum] = "ec480c0c51ddec81019531705acac51bcdbeae563557c982aa8263bb96880372"
+SRC_URI[pyo3-0.22.5.sha256sum] = "3d922163ba1f79c04bc49073ba7b32fd5a8d3b76a87c955921234b8e77333c51"
+SRC_URI[pyo3-build-config-0.22.5.sha256sum] = "bc38c5feeb496c8321091edf3d63e9a6829eab4b863b4a6a65f26f3e9cc6b179"
+SRC_URI[pyo3-ffi-0.22.5.sha256sum] = "94845622d88ae274d2729fcefc850e63d7a3ddff5e3ce11bd88486db9f1d357d"
+SRC_URI[pyo3-macros-0.22.5.sha256sum] = "e655aad15e09b94ffdb3ce3d217acf652e26bbc37697ef012f5e5e348c716e5e"
+SRC_URI[pyo3-macros-backend-0.22.5.sha256sum] = "ae1e3f09eecd94618f60a455a23def79f79eba4dc561a97324bf9ac8c6df30ce"
 SRC_URI[python3-dll-a-0.2.10.sha256sum] = "bd0b78171a90d808b319acfad166c4790d9e9759bbc14ac8273fe133673dd41b"
 SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[radium-0.7.0.sha256sum] = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
-SRC_URI[regex-1.10.5.sha256sum] = "b91213439dad192326a0d7c6ee3955910425f441d7038e0d6933b0aec5c4517f"
-SRC_URI[regex-automata-0.4.7.sha256sum] = "38caf58cc5ef2fed281f89292ef23f6365465ed9a41b7a7754eb4e26496c92df"
-SRC_URI[regex-syntax-0.8.4.sha256sum] = "7a66a03ae7c801facd77a29370b4faec201768915ac14a721ba36f20bc9c209b"
+SRC_URI[regex-1.11.0.sha256sum] = "38200e5ee88914975b69f657f0801b6f6dccafd44fd9326302a4aaeecfacb1d8"
+SRC_URI[regex-automata-0.4.8.sha256sum] = "368758f23274712b504848e9d5a6f010445cc8b87a7cdb4d7cbee666c1288da3"
+SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
 SRC_URI[rustversion-1.0.17.sha256sum] = "955d28af4278de8121b7ebeb796b6a45735dc01436d898801014aced2773a3d6"
 SRC_URI[ryu-1.0.18.sha256sum] = "f3cb5ba0dc43242ce17de99c180e96db90b235b8a9fdc9543c96d2209116bd9f"
-SRC_URI[serde-1.0.204.sha256sum] = "bc76f558e0cbb2a839d37354c575f1dc3fdc6546b5be373ba43d95f231bf7c12"
-SRC_URI[serde_derive-1.0.204.sha256sum] = "e0cd7e117be63d3c3678776753929474f3b04a43a080c744d6b0ae2a8c28e222"
-SRC_URI[serde_json-1.0.121.sha256sum] = "4ab380d7d9f22ef3f21ad3e6c1ebe8e4fc7a2000ccba2e4d71fc96f15b2cb609"
+SRC_URI[serde-1.0.213.sha256sum] = "3ea7893ff5e2466df8d720bb615088341b295f849602c6956047f8f80f0e9bc1"
+SRC_URI[serde_derive-1.0.213.sha256sum] = "7e85ad2009c50b58e87caa8cd6dac16bdf511bbfb7af6c33df902396aa480fa5"
+SRC_URI[serde_json-1.0.132.sha256sum] = "d726bfaff4b320266d395898905d0eba0345aae23b54aee3a737e260fd46db03"
 SRC_URI[smallvec-1.13.2.sha256sum] = "3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67"
 SRC_URI[speedate-0.14.4.sha256sum] = "08a20480dbd4c693f0b0f3210f2cee5bfa21a176c1fa4df0e65cc0474e7fa557"
 SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
 SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
 SRC_URI[strum-0.26.3.sha256sum] = "8fec0f0aef304996cf250b31b5a10dee7980c85da9d759361292b8bca5a18f06"
 SRC_URI[strum_macros-0.26.4.sha256sum] = "4c6bee85a5a24955dc440386795aa378cd9cf82acd5f764469152d2270e581be"
-SRC_URI[syn-2.0.68.sha256sum] = "901fa70d88b9d6c98022e23b4136f9f3e54e4662c3bc1bd1d84a42a9a0f0c1e9"
+SRC_URI[syn-2.0.82.sha256sum] = "83540f837a8afc019423a8edb95b52a8effe46957ee402287f4292fae35be021"
 SRC_URI[synstructure-0.13.1.sha256sum] = "c8af7666ab7b6390ab78131fb5b0fce11d6b7a6951602017c35fa82800708971"
 SRC_URI[tap-1.0.1.sha256sum] = "55937e1799185b12863d447f42597ed69d9928686b8d88a1df17376a097d8369"
 SRC_URI[target-lexicon-0.12.14.sha256sum] = "e1fc403891a21bcfb7c37834ba66a547a8f402146eba7265b5a6d88059c9ff2f"
@@ -182,7 +182,7 @@ SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd8
 SRC_URI[url-2.5.2.sha256sum] = "22784dbdf76fdde8af1aeda5622b546b422b6fc585325248a2bf9f5e41e94d6c"
 SRC_URI[utf16_iter-1.0.5.sha256sum] = "c8232dd3cdaed5356e0f716d285e4b40b932ac434100fe9b7e0e8e935b9e6246"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
-SRC_URI[uuid-1.9.1.sha256sum] = "5de17fd2f7da591098415cff336e12965a28061ddace43b59cb3c430179c9439"
+SRC_URI[uuid-1.11.0.sha256sum] = "f8c5f0a0af699448548ad1a2fbf920fb4bee257eae39953ba95cb84891a0446a"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
 SRC_URI[write16-1.0.0.sha256sum] = "d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f6d936"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-dont-embed-RUSTFLAGS-in-final-binary-1396.patch b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-dont-embed-RUSTFLAGS-in-final-binary-1396.patch
deleted file mode 100644
index 5d732d5bee..0000000000
--- a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-dont-embed-RUSTFLAGS-in-final-binary-1396.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From e07c41b3bad75948201a2201387225694c2fb501 Mon Sep 17 00:00:00 2001
-From: Boxy <rust@boxyuwu.dev>
-Date: Wed, 7 Aug 2024 17:11:02 +0100
-Subject: [PATCH] dont embed `RUSTFLAGS` in final binary (#1396)
-
-Upstream-Status: Backport [https://github.com/pydantic/pydantic-core/pull/1396]
-
-See discussion upstream in:
-https://github.com/pydantic/pydantic-core/issues/1365
-
-Backport fix from:
-https://github.com/pydantic/pydantic-core/commit/e07c41b3bad75948201a2201387225694c2fb501
-
-Signed-off-by: Tim Orling <tim.orling@konsulko.com>
----
- build.rs   | 9 +++++++++
- src/lib.rs | 5 ++++-
- 2 files changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/build.rs b/build.rs
-index d1093c74..f8f66901 100644
---- a/build.rs
-+++ b/build.rs
-@@ -36,6 +36,15 @@ fn main() {
-         println!("cargo:rustc-cfg=has_coverage_attribute");
-     }
-     println!("cargo:rustc-check-cfg=cfg(has_coverage_attribute)");
-+
-+    if std::env::var("RUSTFLAGS")
-+        .unwrap_or_default()
-+        .contains("-Cprofile-use=")
-+    {
-+        println!("cargo:rustc-cfg=specified_profile_use");
-+    }
-+    println!("cargo:rustc-check-cfg=cfg(specified_profile_use)");
-+
-     generate_self_schema();
-     println!("cargo:rustc-env=PROFILE={}", std::env::var("PROFILE").unwrap());
- }
-diff --git a/src/lib.rs b/src/lib.rs
-index eb598424..eb486da6 100644
---- a/src/lib.rs
-+++ b/src/lib.rs
-@@ -98,7 +98,10 @@ pub fn build_info() -> String {
-     format!(
-         "profile={} pgo={}",
-         env!("PROFILE"),
--        option_env!("RUSTFLAGS").unwrap_or("").contains("-Cprofile-use="),
-+        // We use a `cfg!` here not `env!`/`option_env!` as those would
-+        // embed `RUSTFLAGS` into the generated binary which causes problems
-+        // with reproducable builds.
-+        cfg!(specified_profile_use),
-     )
- }
- 
--- 
-2.46.0
-
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.21.0.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.25.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pydantic-core_2.21.0.bb
rename to meta-python/recipes-devtools/python/python3-pydantic-core_2.25.0.bb
index b24e141f60..59873e8671 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.25.0.bb
@@ -11,9 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
 require ${BPN}-crates.inc
 
 SRC_URI += "file://run-ptest"
-SRC_URI += "file://0001-dont-embed-RUSTFLAGS-in-final-binary-1396.patch"
 
-SRC_URI[sha256sum] = "79c747f9916e5b6cb588dfd994d9ac15a93e43eb07467d9e6f24d892c176bbf5"
+SRC_URI[sha256sum] = "f19d3a1d8998cc2bdab9190cead6becbb3c88d10bdfad947266132f077ce349e"
 
 DEPENDS = "python3-maturin-native python3-typing-extensions"
 

