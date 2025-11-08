Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC4ECCFA13
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 19:32:19 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12357.1762630333165483687
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 11:32:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QNoREROT;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so9004505e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 11:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762630331; x=1763235131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzIeNWxUiLT+njp3sWz968zwm2kBNhp7IvWL991eHlQ=;
        b=QNoREROTaJbyqoObzSKWssM2WwFMXJJyUiUB8PdTCOGgBWuFJh57zep0Jxz+1vOWgc
         7pG0vSCiEfm2tPL3Xj8BVZXIJ8QXkhJG2VAZcfk+/4TP57tKRzo8UyjIvi6bs9cg+S5R
         CzOq/r0bEwPfA8S8AXonJxK8YeH8JwuHtfwQ5+f8rdsdI8E3whHYWLrkNAF8wGRqRVqt
         cE9yQTw2VZabEqUulCRwWtPuBBT/YNWqNnABhmAjgNzzeobvdz3j98ey5m3judGz+ncs
         TB9ywtIuv0xC8hyjK1b3vzFdcQa16IRuJZgkbReXPv9Z43KwNt/YEExuDIrmloregQIP
         jTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762630331; x=1763235131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vzIeNWxUiLT+njp3sWz968zwm2kBNhp7IvWL991eHlQ=;
        b=dtlFPe4578ky7IG3tjoxFmuigED3VcJ+7PauIdT/IEIc6EQc1UPaPtFCFbYI/eE9zR
         8p5YhgQcSwWTfVUfxFzaiWH4hac6pb/Xcp0kNZxT8FO4TlxyfzAj4hQ2ivhgZFiRYgHQ
         elug5F9UB3+CWyza/TnikGLrkopVQj3HhmVRFagPmhTZe5OTOYFRywajemvQXang65aN
         lT69Ea7GlhpfBG1OcpCXW908kzSmk/iNEVoFrLIKR/kOpXnJvPozAV7pFPfAC5LlMXF/
         Xp7T2Wk+xjBWdnW7qC7q6RH/TTHPDaOtvLc5VpsuPgX0Q2vJn+7jfVO1haEhy7B0Bt5y
         4umw==
X-Gm-Message-State: AOJu0Yy2SViRMxZtzxIEgczIYlW7nuK5ds4UCehnY/LFuDTkDLMXEd+V
	H3tacCOY3KbZ9lCY+j7zVlhyLAe9uWnDtXUfoPT2uucWwV4Wlj+Q67QfU9qRsMpa
X-Gm-Gg: ASbGncsjjniAE1t7dzZjtp3Q06wkjfC+D8rkJ3FDYDbiEeYzFnwZ1tBfJBYOU8cdl8C
	/mjWjqPIQg1eZjFAcodb9trsYuvzpq9YV9tBZMmor/2tpu/npa0sJEKuVqWqVxwWucktRKGlDSO
	Jhvd3BrJzT5P8sGT2K/DE3OOFTCb2WUrtkzeOiF2B0txSVWZJvkICDlB1/GfFYrxCHIYfrH9y08
	TIOiPyHEZjuGTs07VnHIhbQq/uIhBu1vMq/IAQF50ZqziMSfKiDZbO7+/3OuHNT9CtdsvHnHuZ+
	6aPdpJpSllNBQkH55y8GarMEBeJyAkzOJyiXJCzHIyiLNyw2fvukk/h0qccp56rfDh2eZxg7g+q
	MlXrPS9UKi/fnR+CkhR+xzu6ChnX43812pK4BTd8qKXQrhwzZZna9I2i+dRG2Xkn3oPT4fUdM4w
	==
X-Google-Smtp-Source: AGHT+IEwHOPe2J0fUfgs7OP7RJGwAYA+4Yg2wpx6aEAVroCM+aCUiw+22ngK/Q54yMbfAw6aINfXzw==
X-Received: by 2002:a05:600c:524a:b0:477:76b0:1e73 with SMTP id 5b1f17b1804b1-47776b01f65mr15811535e9.41.1762630331286;
        Sat, 08 Nov 2025 11:32:11 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bcfd021sm150455725e9.11.2025.11.08.11.32.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 11:32:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/5] cbindgen: upgrade 0.28.0 -> 0.29.2
Date: Sat,  8 Nov 2025 20:32:06 +0100
Message-ID: <20251108193208.3465135-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108193208.3465135-1-skandigraun@gmail.com>
References: <20251108193208.3465135-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 19:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121403

Drop patch that is incorporated in this release.

Changelog:

0.29.2
 * Request serde's std feature to avoid issues with newer toml versions.

0.29.1
 * enum: Track dependencies properly in enumerations.
 * constant: Handle cfg in associated constants.
 * Remove "display" feature from the toml crate
 * Fix incorrect detection of duplicated constants
 * docs: Correct after_include type in example config (fix)
 * cargo update
 * Update toml to 0.9

0.29.0
 * Support no-export annotation for statics and functions.
 * Fixed conditional fields of constexpr literal structs
 * Add rename rule for generated associated constant
 * Upgrade heck to 0.5
 * Add support for an optional nullable attribute
 * docs.md: Fix deprecated_with_note and deprecated_variant_with_note being spelled as 'notes'
 * Fix generic with "void" default
 * Fixed error generation of structures using the keyword as inside arrays
 * Added test for unsafe(no_mangle) attribute
 * Fixed handling of trait methods containing the unsafe attribute
 * Rename -Zparse-only

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../cbindgen/cbindgen-crates.inc              | 150 ++++++++++++++++++
 ...l-codes-on-riscv32gc-unknown-linux-g.patch |  38 -----
 .../cbindgen/cbindgen_0.28.0.bb               | 148 -----------------
 .../cbindgen/cbindgen_0.29.2.bb               |  12 ++
 4 files changed, 162 insertions(+), 186 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/cbindgen/cbindgen-crates.inc
 delete mode 100644 meta-oe/recipes-devtools/cbindgen/cbindgen/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
 delete mode 100644 meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb
 create mode 100644 meta-oe/recipes-devtools/cbindgen/cbindgen_0.29.2.bb

diff --git a/meta-oe/recipes-devtools/cbindgen/cbindgen-crates.inc b/meta-oe/recipes-devtools/cbindgen/cbindgen-crates.inc
new file mode 100644
index 0000000000..f835ecfeeb
--- /dev/null
+++ b/meta-oe/recipes-devtools/cbindgen/cbindgen-crates.inc
@@ -0,0 +1,150 @@
+# Autogenerated with 'bitbake -c update_crates cbindgen'
+
+# from Cargo.lock
+SRC_URI += " \
+    crate://crates.io/anstream/0.6.19 \
+    crate://crates.io/anstyle/1.0.11 \
+    crate://crates.io/anstyle-parse/0.2.7 \
+    crate://crates.io/anstyle-query/1.1.3 \
+    crate://crates.io/anstyle-wincon/3.0.9 \
+    crate://crates.io/autocfg/1.5.0 \
+    crate://crates.io/bitflags/2.9.1 \
+    crate://crates.io/cfg-if/1.0.1 \
+    crate://crates.io/clap/4.5.41 \
+    crate://crates.io/clap_builder/4.5.41 \
+    crate://crates.io/clap_lex/0.7.5 \
+    crate://crates.io/colorchoice/1.0.4 \
+    crate://crates.io/dashmap/5.5.3 \
+    crate://crates.io/diff/0.1.13 \
+    crate://crates.io/equivalent/1.0.2 \
+    crate://crates.io/errno/0.3.13 \
+    crate://crates.io/fastrand/2.3.0 \
+    crate://crates.io/getrandom/0.3.3 \
+    crate://crates.io/hashbrown/0.14.5 \
+    crate://crates.io/heck/0.5.0 \
+    crate://crates.io/indexmap/2.5.0 \
+    crate://crates.io/is_terminal_polyfill/1.70.1 \
+    crate://crates.io/itoa/1.0.15 \
+    crate://crates.io/lazy_static/1.5.0 \
+    crate://crates.io/libc/0.2.174 \
+    crate://crates.io/linux-raw-sys/0.9.4 \
+    crate://crates.io/lock_api/0.4.13 \
+    crate://crates.io/log/0.4.27 \
+    crate://crates.io/memchr/2.7.5 \
+    crate://crates.io/once_cell/1.21.3 \
+    crate://crates.io/once_cell_polyfill/1.70.1 \
+    crate://crates.io/parking_lot/0.12.4 \
+    crate://crates.io/parking_lot_core/0.9.11 \
+    crate://crates.io/pretty_assertions/1.4.1 \
+    crate://crates.io/proc-macro2/1.0.95 \
+    crate://crates.io/quote/1.0.40 \
+    crate://crates.io/r-efi/5.3.0 \
+    crate://crates.io/redox_syscall/0.5.13 \
+    crate://crates.io/rustix/1.0.8 \
+    crate://crates.io/ryu/1.0.20 \
+    crate://crates.io/scopeguard/1.2.0 \
+    crate://crates.io/serde/1.0.228 \
+    crate://crates.io/serde_core/1.0.228 \
+    crate://crates.io/serde_derive/1.0.228 \
+    crate://crates.io/serde_json/1.0.140 \
+    crate://crates.io/serde_spanned/1.0.0 \
+    crate://crates.io/serial_test/2.0.0 \
+    crate://crates.io/serial_test_derive/2.0.0 \
+    crate://crates.io/smallvec/1.15.1 \
+    crate://crates.io/strsim/0.11.1 \
+    crate://crates.io/syn/2.0.104 \
+    crate://crates.io/tempfile/3.20.0 \
+    crate://crates.io/toml/0.9.2 \
+    crate://crates.io/toml_datetime/0.7.0 \
+    crate://crates.io/toml_parser/1.0.1 \
+    crate://crates.io/toml_writer/1.0.2 \
+    crate://crates.io/unicode-ident/1.0.18 \
+    crate://crates.io/utf8parse/0.2.2 \
+    crate://crates.io/wasi/0.14.2+wasi-0.2.4 \
+    crate://crates.io/windows-sys/0.59.0 \
+    crate://crates.io/windows-targets/0.52.6 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
+    crate://crates.io/windows_aarch64_msvc/0.52.6 \
+    crate://crates.io/windows_i686_gnu/0.52.6 \
+    crate://crates.io/windows_i686_gnullvm/0.52.6 \
+    crate://crates.io/windows_i686_msvc/0.52.6 \
+    crate://crates.io/windows_x86_64_gnu/0.52.6 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
+    crate://crates.io/windows_x86_64_msvc/0.52.6 \
+    crate://crates.io/winnow/0.7.12 \
+    crate://crates.io/wit-bindgen-rt/0.39.0 \
+    crate://crates.io/yansi/1.0.1 \
+"
+
+SRC_URI[anstream-0.6.19.sha256sum] = "301af1932e46185686725e0fad2f8f2aa7da69dd70bf6ecc44d6b703844a3933"
+SRC_URI[anstyle-1.0.11.sha256sum] = "862ed96ca487e809f1c8e5a8447f6ee2cf102f846893800b20cebdf541fc6bbd"
+SRC_URI[anstyle-parse-0.2.7.sha256sum] = "4e7644824f0aa2c7b9384579234ef10eb7efb6a0deb83f9630a49594dd9c15c2"
+SRC_URI[anstyle-query-1.1.3.sha256sum] = "6c8bdeb6047d8983be085bab0ba1472e6dc604e7041dbf6fcd5e71523014fae9"
+SRC_URI[anstyle-wincon-3.0.9.sha256sum] = "403f75924867bb1033c59fbf0797484329750cfbe3c4325cd33127941fabc882"
+SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
+SRC_URI[bitflags-2.9.1.sha256sum] = "1b8e56985ec62d17e9c1001dc89c88ecd7dc08e47eba5ec7c29c7b5eeecde967"
+SRC_URI[cfg-if-1.0.1.sha256sum] = "9555578bc9e57714c812a1f84e4fc5b4d21fcb063490c624de019f7464c91268"
+SRC_URI[clap-4.5.41.sha256sum] = "be92d32e80243a54711e5d7ce823c35c41c9d929dc4ab58e1276f625841aadf9"
+SRC_URI[clap_builder-4.5.41.sha256sum] = "707eab41e9622f9139419d573eca0900137718000c517d47da73045f54331c3d"
+SRC_URI[clap_lex-0.7.5.sha256sum] = "b94f61472cee1439c0b966b47e3aca9ae07e45d070759512cd390ea2bebc6675"
+SRC_URI[colorchoice-1.0.4.sha256sum] = "b05b61dc5112cbb17e4b6cd61790d9845d13888356391624cbe7e41efeac1e75"
+SRC_URI[dashmap-5.5.3.sha256sum] = "978747c1d849a7d2ee5e8adc0159961c48fb7e5db2f06af6723b80123bb53856"
+SRC_URI[diff-0.1.13.sha256sum] = "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
+SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
+SRC_URI[errno-0.3.13.sha256sum] = "778e2ac28f6c47af28e4907f13ffd1e1ddbd400980a9abd7c8df189bf578a5ad"
+SRC_URI[fastrand-2.3.0.sha256sum] = "37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be"
+SRC_URI[getrandom-0.3.3.sha256sum] = "26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4"
+SRC_URI[hashbrown-0.14.5.sha256sum] = "e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1"
+SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
+SRC_URI[indexmap-2.5.0.sha256sum] = "68b900aa2f7301e21c36462b170ee99994de34dff39a4a6a528e80e7376d07e5"
+SRC_URI[is_terminal_polyfill-1.70.1.sha256sum] = "7943c866cc5cd64cbc25b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf"
+SRC_URI[itoa-1.0.15.sha256sum] = "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
+SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
+SRC_URI[libc-0.2.174.sha256sum] = "1171693293099992e19cddea4e8b849964e9846f4acee11b3948bcc337be8776"
+SRC_URI[linux-raw-sys-0.9.4.sha256sum] = "cd945864f07fe9f5371a27ad7b52a172b4b499999f1d97574c9fa68373937e12"
+SRC_URI[lock_api-0.4.13.sha256sum] = "96936507f153605bddfcda068dd804796c84324ed2510809e5b2a624c81da765"
+SRC_URI[log-0.4.27.sha256sum] = "13dc2df351e3202783a1fe0d44375f7295ffb4049267b0f3018346dc122a1d94"
+SRC_URI[memchr-2.7.5.sha256sum] = "32a282da65faaf38286cf3be983213fcf1d2e2a58700e808f83f4ea9a4804bc0"
+SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
+SRC_URI[once_cell_polyfill-1.70.1.sha256sum] = "a4895175b425cb1f87721b59f0f286c2092bd4af812243672510e1ac53e2e0ad"
+SRC_URI[parking_lot-0.12.4.sha256sum] = "70d58bf43669b5795d1576d0641cfb6fbb2057bf629506267a92807158584a13"
+SRC_URI[parking_lot_core-0.9.11.sha256sum] = "bc838d2a56b5b1a6c25f55575dfc605fabb63bb2365f6c2353ef9159aa69e4a5"
+SRC_URI[pretty_assertions-1.4.1.sha256sum] = "3ae130e2f271fbc2ac3a40fb1d07180839cdbbe443c7a27e1e3c13c5cac0116d"
+SRC_URI[proc-macro2-1.0.95.sha256sum] = "02b3e5e68a3a1a02aad3ec490a98007cbc13c37cbe84a3cd7b8e406d76e7f778"
+SRC_URI[quote-1.0.40.sha256sum] = "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
+SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
+SRC_URI[redox_syscall-0.5.13.sha256sum] = "0d04b7d0ee6b4a0207a0a7adb104d23ecb0b47d6beae7152d0fa34b692b29fd6"
+SRC_URI[rustix-1.0.8.sha256sum] = "11181fbabf243db407ef8df94a6ce0b2f9a733bd8be4ad02b4eda9602296cac8"
+SRC_URI[ryu-1.0.20.sha256sum] = "28d3b2b1366ec20994f1fd18c3c594f05c5dd4bc44d8bb0c1c632c8d6829481f"
+SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
+SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
+SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
+SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
+SRC_URI[serde_json-1.0.140.sha256sum] = "20068b6e96dc6c9bd23e01df8827e6c7e1f2fddd43c21810382803c136b99373"
+SRC_URI[serde_spanned-1.0.0.sha256sum] = "40734c41988f7306bb04f0ecf60ec0f3f1caa34290e4e8ea471dcd3346483b83"
+SRC_URI[serial_test-2.0.0.sha256sum] = "0e56dd856803e253c8f298af3f4d7eb0ae5e23a737252cd90bb4f3b435033b2d"
+SRC_URI[serial_test_derive-2.0.0.sha256sum] = "91d129178576168c589c9ec973feedf7d3126c01ac2bf08795109aa35b69fb8f"
+SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
+SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
+SRC_URI[syn-2.0.104.sha256sum] = "17b6f705963418cdb9927482fa304bc562ece2fdd4f616084c50b7023b435a40"
+SRC_URI[tempfile-3.20.0.sha256sum] = "e8a64e3985349f2441a1a9ef0b853f869006c3855f2cda6862a94d26ebb9d6a1"
+SRC_URI[toml-0.9.2.sha256sum] = "ed0aee96c12fa71097902e0bb061a5e1ebd766a6636bb605ba401c45c1650eac"
+SRC_URI[toml_datetime-0.7.0.sha256sum] = "bade1c3e902f58d73d3f294cd7f20391c1cb2fbcb643b73566bc773971df91e3"
+SRC_URI[toml_parser-1.0.1.sha256sum] = "97200572db069e74c512a14117b296ba0a80a30123fbbb5aa1f4a348f639ca30"
+SRC_URI[toml_writer-1.0.2.sha256sum] = "fcc842091f2def52017664b53082ecbbeb5c7731092bad69d2c63050401dfd64"
+SRC_URI[unicode-ident-1.0.18.sha256sum] = "5a5f39404a5da50712a4c1eecf25e90dd62b613502b7e925fd4e4d19b5c96512"
+SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
+SRC_URI[wasi-0.14.2+wasi-0.2.4.sha256sum] = "9683f9a5a998d873c0d21fcbe3c083009670149a8fab228644b8bd36b2c48cb3"
+SRC_URI[windows-sys-0.59.0.sha256sum] = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
+SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
+SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
+SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
+SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
+SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
+SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
+SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
+SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
+SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
+SRC_URI[winnow-0.7.12.sha256sum] = "f3edebf492c8125044983378ecb5766203ad3b4c2f7a922bd7dd207f6d443e95"
+SRC_URI[wit-bindgen-rt-0.39.0.sha256sum] = "6f42320e61fe2cfd34354ecb597f86f413484a798ba44a8ca1165c58d42da6c1"
+SRC_URI[yansi-1.0.1.sha256sum] = "cfe53a6657fd280eaa890a3bc59152892ffa3e30101319d168b781ed6529b049"
diff --git a/meta-oe/recipes-devtools/cbindgen/cbindgen/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch b/meta-oe/recipes-devtools/cbindgen/cbindgen/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
deleted file mode 100644
index 75086aba75..0000000000
--- a/meta-oe/recipes-devtools/cbindgen/cbindgen/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 6ab6af57cbd3b3b0cd4ba04f7f65693e1ca69870 Mon Sep 17 00:00:00 2001
-From: Dan Gohman <dev@sunfishcode.online>
-Date: Sun, 6 Apr 2025 05:22:49 -0700
-Subject: [PATCH] Define more ioctl codes on riscv32gc-unknown-linux-gnu
-
-Define ioctl codes including `FICLONE` and `FS_IOC32_GETVERSION` on
-riscv32gc-unknown-linux-gnu.
-
-Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/4382]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/unix/linux_like/linux/arch/generic/mod.rs | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/unix/linux_like/linux/arch/generic/mod.rs b/src/unix/linux_like/linux/arch/generic/mod.rs
-index 2f437e1..db1f1e7 100644
---- a/src/unix/linux_like/linux/arch/generic/mod.rs
-+++ b/src/unix/linux_like/linux/arch/generic/mod.rs
-@@ -114,6 +114,7 @@ cfg_if! {
-                  target_arch = "x86_64",
-                  target_arch = "arm",
-                  target_arch = "aarch64",
-+                 target_arch = "riscv32",
-                  target_arch = "riscv64",
-                  target_arch = "s390x",
-                  target_arch = "csky",
-@@ -218,7 +219,10 @@ cfg_if! {
-     // where S stands for size (int, long, struct...)
-     // where T stands for type ('f','v','X'...)
-     // where N stands for NR (NumbeR)
--    if #[cfg(any(target_arch = "x86", target_arch = "arm", target_arch = "csky"))] {
-+    if #[cfg(any(target_arch = "x86",
-+                 target_arch = "arm",
-+                 target_arch = "riscv32",
-+                 target_arch = "csky"))] {
-         pub const FS_IOC_GETFLAGS: ::Ioctl = 0x80046601;
-         pub const FS_IOC_SETFLAGS: ::Ioctl = 0x40046602;
-         pub const FS_IOC_GETVERSION: ::Ioctl = 0x80047601;
diff --git a/meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb b/meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb
deleted file mode 100644
index 8a6337a0d2..0000000000
--- a/meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb
+++ /dev/null
@@ -1,148 +0,0 @@
-SUMMARY = "cbindgen creates C/C++11 headers for Rust libraries which expose a public C API"
-HOMEPAGE = "https://github.com/mozilla/cbindgen"
-LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9741c346eef56131163e13b9db1241b3"
-
-SRC_URI += "git://github.com/mozilla/cbindgen.git;protocol=https;branch=master \
-            file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch;patchdir=${CARGO_VENDORING_DIRECTORY}/libc-0.2.155"
-SRCREV = "bd78bbe59b10eda6ef1255e4acda95c56c6d0279"
-
-inherit cargo pkgconfig
-
-SRC_URI += " \
-    crate://crates.io/anstream/0.6.15 \
-    crate://crates.io/anstyle-parse/0.2.5 \
-    crate://crates.io/anstyle-query/1.1.1 \
-    crate://crates.io/anstyle-wincon/3.0.4 \
-    crate://crates.io/anstyle/1.0.8 \
-    crate://crates.io/autocfg/1.3.0 \
-    crate://crates.io/bitflags/2.6.0 \
-    crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/clap/4.5.15 \
-    crate://crates.io/clap_builder/4.5.15 \
-    crate://crates.io/clap_lex/0.7.2 \
-    crate://crates.io/colorchoice/1.0.2 \
-    crate://crates.io/dashmap/5.5.3 \
-    crate://crates.io/diff/0.1.13 \
-    crate://crates.io/equivalent/1.0.1 \
-    crate://crates.io/errno/0.3.9 \
-    crate://crates.io/fastrand/2.1.0 \
-    crate://crates.io/hashbrown/0.14.5 \
-    crate://crates.io/heck/0.4.1 \
-    crate://crates.io/indexmap/2.3.0 \
-    crate://crates.io/is_terminal_polyfill/1.70.1 \
-    crate://crates.io/itoa/1.0.11 \
-    crate://crates.io/lazy_static/1.5.0 \
-    crate://crates.io/libc/0.2.155 \
-    crate://crates.io/linux-raw-sys/0.4.14 \
-    crate://crates.io/lock_api/0.4.12 \
-    crate://crates.io/log/0.4.22 \
-    crate://crates.io/memchr/2.7.4 \
-    crate://crates.io/once_cell/1.19.0 \
-    crate://crates.io/parking_lot/0.12.3 \
-    crate://crates.io/parking_lot_core/0.9.10 \
-    crate://crates.io/pretty_assertions/1.4.0 \
-    crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/quote/1.0.36 \
-    crate://crates.io/redox_syscall/0.5.3 \
-    crate://crates.io/rustix/0.38.34 \
-    crate://crates.io/ryu/1.0.18 \
-    crate://crates.io/scopeguard/1.2.0 \
-    crate://crates.io/serde/1.0.205 \
-    crate://crates.io/serde_derive/1.0.205 \
-    crate://crates.io/serde_json/1.0.122 \
-    crate://crates.io/serde_spanned/0.6.7 \
-    crate://crates.io/serial_test/2.0.0 \
-    crate://crates.io/serial_test_derive/2.0.0 \
-    crate://crates.io/smallvec/1.13.2 \
-    crate://crates.io/strsim/0.11.1 \
-    crate://crates.io/syn/2.0.85 \
-    crate://crates.io/tempfile/3.12.0 \
-    crate://crates.io/toml/0.8.19 \
-    crate://crates.io/toml_datetime/0.6.8 \
-    crate://crates.io/toml_edit/0.22.20 \
-    crate://crates.io/unicode-ident/1.0.12 \
-    crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/windows-sys/0.52.0 \
-    crate://crates.io/windows-sys/0.59.0 \
-    crate://crates.io/windows-targets/0.52.6 \
-    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
-    crate://crates.io/windows_aarch64_msvc/0.52.6 \
-    crate://crates.io/windows_i686_gnu/0.52.6 \
-    crate://crates.io/windows_i686_gnullvm/0.52.6 \
-    crate://crates.io/windows_i686_msvc/0.52.6 \
-    crate://crates.io/windows_x86_64_gnu/0.52.6 \
-    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
-    crate://crates.io/windows_x86_64_msvc/0.52.6 \
-    crate://crates.io/winnow/0.6.18 \
-    crate://crates.io/yansi/0.5.1 \
-"
-
-SRC_URI[anstream-0.6.15.sha256sum] = "64e15c1ab1f89faffbf04a634d5e1962e9074f2741eef6d97f3c4e322426d526"
-SRC_URI[anstyle-parse-0.2.5.sha256sum] = "eb47de1e80c2b463c735db5b217a0ddc39d612e7ac9e2e96a5aed1f57616c1cb"
-SRC_URI[anstyle-query-1.1.1.sha256sum] = "6d36fc52c7f6c869915e99412912f22093507da8d9e942ceaf66fe4b7c14422a"
-SRC_URI[anstyle-wincon-3.0.4.sha256sum] = "5bf74e1b6e971609db8ca7a9ce79fd5768ab6ae46441c572e46cf596f59e57f8"
-SRC_URI[anstyle-1.0.8.sha256sum] = "1bec1de6f59aedf83baf9ff929c98f2ad654b97c9510f4e70cf6f661d49fd5b1"
-SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
-SRC_URI[bitflags-2.6.0.sha256sum] = "b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de"
-SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[clap-4.5.15.sha256sum] = "11d8838454fda655dafd3accb2b6e2bea645b9e4078abe84a22ceb947235c5cc"
-SRC_URI[clap_builder-4.5.15.sha256sum] = "216aec2b177652e3846684cbfe25c9964d18ec45234f0f5da5157b207ed1aab6"
-SRC_URI[clap_lex-0.7.2.sha256sum] = "1462739cb27611015575c0c11df5df7601141071f07518d56fcc1be504cbec97"
-SRC_URI[colorchoice-1.0.2.sha256sum] = "d3fd119d74b830634cea2a0f58bbd0d54540518a14397557951e79340abc28c0"
-SRC_URI[dashmap-5.5.3.sha256sum] = "978747c1d849a7d2ee5e8adc0159961c48fb7e5db2f06af6723b80123bb53856"
-SRC_URI[diff-0.1.13.sha256sum] = "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
-SRC_URI[equivalent-1.0.1.sha256sum] = "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
-SRC_URI[errno-0.3.9.sha256sum] = "534c5cf6194dfab3db3242765c03bbe257cf92f22b38f6bc0c58d59108a820ba"
-SRC_URI[fastrand-2.1.0.sha256sum] = "9fc0510504f03c51ada170672ac806f1f105a88aa97a5281117e1ddc3368e51a"
-SRC_URI[hashbrown-0.14.5.sha256sum] = "e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1"
-SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
-SRC_URI[indexmap-2.3.0.sha256sum] = "de3fc2e30ba82dd1b3911c8de1ffc143c74a914a14e99514d7637e3099df5ea0"
-SRC_URI[is_terminal_polyfill-1.70.1.sha256sum] = "7943c866cc5cd64cbc25b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf"
-SRC_URI[itoa-1.0.11.sha256sum] = "49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b"
-SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
-SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
-SRC_URI[linux-raw-sys-0.4.14.sha256sum] = "78b3ae25bc7c8c38cec158d1f2757ee79e9b3740fbc7ccf0e59e4b08d793fa89"
-SRC_URI[lock_api-0.4.12.sha256sum] = "07af8b9cdd281b7915f413fa73f29ebd5d55d0d3f0155584dade1ff18cea1b17"
-SRC_URI[log-0.4.22.sha256sum] = "a7a70ba024b9dc04c27ea2f0c0548feb474ec5c54bba33a7f72f873a39d07b24"
-SRC_URI[memchr-2.7.4.sha256sum] = "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
-SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
-SRC_URI[parking_lot-0.12.3.sha256sum] = "f1bf18183cf54e8d6059647fc3063646a1801cf30896933ec2311622cc4b9a27"
-SRC_URI[parking_lot_core-0.9.10.sha256sum] = "1e401f977ab385c9e4e3ab30627d6f26d00e2c73eef317493c4ec6d468726cf8"
-SRC_URI[pretty_assertions-1.4.0.sha256sum] = "af7cee1a6c8a5b9208b3cb1061f10c0cb689087b3d8ce85fb9d2dd7a29b6ba66"
-SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
-SRC_URI[redox_syscall-0.5.3.sha256sum] = "2a908a6e00f1fdd0dfd9c0eb08ce85126f6d8bbda50017e74bc4a4b7d4a926a4"
-SRC_URI[rustix-0.38.34.sha256sum] = "70dc5ec042f7a43c4a73241207cecc9873a06d45debb38b329f8541d85c2730f"
-SRC_URI[ryu-1.0.18.sha256sum] = "f3cb5ba0dc43242ce17de99c180e96db90b235b8a9fdc9543c96d2209116bd9f"
-SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
-SRC_URI[serde-1.0.205.sha256sum] = "e33aedb1a7135da52b7c21791455563facbbcc43d0f0f66165b42c21b3dfb150"
-SRC_URI[serde_derive-1.0.205.sha256sum] = "692d6f5ac90220161d6774db30c662202721e64aed9058d2c394f451261420c1"
-SRC_URI[serde_json-1.0.122.sha256sum] = "784b6203951c57ff748476b126ccb5e8e2959a5c19e5c617ab1956be3dbc68da"
-SRC_URI[serde_spanned-0.6.7.sha256sum] = "eb5b1b31579f3811bf615c144393417496f152e12ac8b7663bf664f4a815306d"
-SRC_URI[serial_test-2.0.0.sha256sum] = "0e56dd856803e253c8f298af3f4d7eb0ae5e23a737252cd90bb4f3b435033b2d"
-SRC_URI[serial_test_derive-2.0.0.sha256sum] = "91d129178576168c589c9ec973feedf7d3126c01ac2bf08795109aa35b69fb8f"
-SRC_URI[smallvec-1.13.2.sha256sum] = "3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67"
-SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
-SRC_URI[syn-2.0.85.sha256sum] = "5023162dfcd14ef8f32034d8bcd4cc5ddc61ef7a247c024a33e24e1f24d21b56"
-SRC_URI[tempfile-3.12.0.sha256sum] = "04cbcdd0c794ebb0d4cf35e88edd2f7d2c4c3e9a5a6dab322839b321c6a87a64"
-SRC_URI[toml-0.8.19.sha256sum] = "a1ed1f98e3fdc28d6d910e6737ae6ab1a93bf1985935a1193e68f93eeb68d24e"
-SRC_URI[toml_datetime-0.6.8.sha256sum] = "0dd7358ecb8fc2f8d014bf86f6f638ce72ba252a2c3a2572f2a795f1d23efb41"
-SRC_URI[toml_edit-0.22.20.sha256sum] = "583c44c02ad26b0c3f3066fe629275e50627026c51ac2e595cca4c230ce1ce1d"
-SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
-SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
-SRC_URI[windows-sys-0.59.0.sha256sum] = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
-SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
-SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
-SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
-SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
-SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
-SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
-SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
-SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
-SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
-SRC_URI[winnow-0.6.18.sha256sum] = "68a9bda4691f099d435ad181000724da8e5899daa10713c2d432552b9ccd3a6f"
-SRC_URI[yansi-0.5.1.sha256sum] = "09041cd90cf85f7f8b2df60c646f853b7f535ce68f85244eb6731cf89fa498ec"
-
-BBCLASSEXTEND += "native"
diff --git a/meta-oe/recipes-devtools/cbindgen/cbindgen_0.29.2.bb b/meta-oe/recipes-devtools/cbindgen/cbindgen_0.29.2.bb
new file mode 100644
index 0000000000..0ba5392d6c
--- /dev/null
+++ b/meta-oe/recipes-devtools/cbindgen/cbindgen_0.29.2.bb
@@ -0,0 +1,12 @@
+SUMMARY = "cbindgen creates C/C++11 headers for Rust libraries which expose a public C API"
+HOMEPAGE = "https://github.com/mozilla/cbindgen"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9741c346eef56131163e13b9db1241b3"
+
+require cbindgen-crates.inc
+SRC_URI += "git://github.com/mozilla/cbindgen.git;protocol=https;branch=main;tag=v${PV}"
+SRCREV = "76f41c090c0587d940a0ef81a41c8b995f074926"
+
+inherit cargo pkgconfig
+
+BBCLASSEXTEND += "native"

