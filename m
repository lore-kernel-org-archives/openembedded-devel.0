Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B77C54FB9
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 13:46:08 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.6802.1700142359580267594
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 05:45:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MYoQDtL1;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9f27af23441so116906166b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 05:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700142357; x=1700747157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4ZF1XMqPpeKjYZGj5U7eS4pIrQMVtlX9dEDJPg+dVM=;
        b=MYoQDtL1aV7P+K92wVk3eRYwkEubkeHPT6rL0iT1C5XItMZXqSKHOYmgILOM7iBQ6G
         9oB6wNaSrY00yG97zlJuo2tmmQ8mjkzXZMX2PlfnsvsGfLjR5z+Qcdz2DQCXxfTuY+3U
         kbfy4nJTYwdjsLMFQJ4zC011+Q7Rc+IdRZFeAwAT0XcwaO7G4xJt4ghf+X5b3UHt6Spm
         zePIDDoBz+lWRThVf+fsCLgkWQBjRBZfep4TmanCDTSeTVShamHlrcNyM2CxRsT2JVbD
         gpXKb58HLMH/WfUQyf0vpdZ4qU2vvq9XdXoDXpE+kIR07H5bfMugVYvglELzPpigablx
         ivdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700142357; x=1700747157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4ZF1XMqPpeKjYZGj5U7eS4pIrQMVtlX9dEDJPg+dVM=;
        b=SobDNkHuFVBp3IftdSO9iG11fN8P1kt2Ct0y/VBbB2SE1rHwMZPEmm2+tclZJ7j1/O
         B+WISFT9Nq2DQLFZzLojiPYZ2ytVZEx9FD47jr5p+lxVB0GWhThvsk0HMoCGIf1p9EKl
         K7Dpmz9nMPs1cHLEYHCdZWpJ5mFZcA8mSruW22e7E8L1yopGGG25kW8Q0pVf5TBjqa/x
         TVe24OsATJPJ/g0SXodlfakJId1QUWkLkNYbYnlQn04k9ATF4iESzvbMhHAv9IH26iHI
         2QkaAuhs3ke4AgnknCIyjAT56dxm6NzM2knsM/wQaMLdYsiTVMea/HjE+OB5Eh3kZEV+
         0/Ag==
X-Gm-Message-State: AOJu0YwGlg70faRdj8Gl35ucxDsrRkXWb09FbehQ6leqn+HeETWaWAYf
	lfyPJZbPURkxU4o26syqL8H/AcxYvjR2zw==
X-Google-Smtp-Source: AGHT+IFL0OCibdaCNwE4MbEpx2/Rsl1AzCIuJsvBzLCQ1XuPf4c4tULbNf1fkQWhISzs7YCfdu+0pw==
X-Received: by 2002:a17:907:969f:b0:9eb:af0e:39da with SMTP id hd31-20020a170907969f00b009ebaf0e39damr9132809ejc.46.1700142356916;
        Thu, 16 Nov 2023 05:45:56 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id v24-20020a170906489800b009b2ba067b37sm8327682ejq.202.2023.11.16.05.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 05:45:56 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] uutils-coreutils: upgrade 0.0.22 -> 0.0.23
Date: Thu, 16 Nov 2023 16:45:45 +0300
Message-Id: <20231116134545.1047335-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 13:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106815

Changelog:

https://github.com/uutils/coreutils/releases/tag/0.0.23

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../uutils-coreutils-crates.inc               | 58 ++++++++++---------
 ...s_0.0.22.bb => uutils-coreutils_0.0.23.bb} |  2 +-
 2 files changed, 31 insertions(+), 29 deletions(-)
 rename meta-oe/recipes-core/uutils-coreutils/{uutils-coreutils_0.0.22.bb => uutils-coreutils_0.0.23.bb} (92%)

diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
index 71ab9f9ec..cd8a6efbf 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
@@ -22,9 +22,9 @@ SRC_URI += " \
     crate://crates.io/blake2b_simd/1.0.2 \
     crate://crates.io/blake3/1.5.0 \
     crate://crates.io/block-buffer/0.10.3 \
-    crate://crates.io/bstr/1.7.0 \
+    crate://crates.io/bstr/1.8.0 \
     crate://crates.io/bumpalo/3.11.1 \
-    crate://crates.io/bytecount/0.6.4 \
+    crate://crates.io/bytecount/0.6.7 \
     crate://crates.io/byteorder/1.5.0 \
     crate://crates.io/cc/1.0.79 \
     crate://crates.io/cexpr/0.6.0 \
@@ -39,8 +39,8 @@ SRC_URI += " \
     crate://crates.io/colorchoice/1.0.0 \
     crate://crates.io/compare/0.1.0 \
     crate://crates.io/console/0.15.7 \
-    crate://crates.io/const-random/0.1.15 \
-    crate://crates.io/const-random-macro/0.1.15 \
+    crate://crates.io/const-random/0.1.16 \
+    crate://crates.io/const-random-macro/0.1.16 \
     crate://crates.io/constant_time_eq/0.3.0 \
     crate://crates.io/conv/0.3.3 \
     crate://crates.io/core-foundation-sys/0.8.3 \
@@ -67,7 +67,7 @@ SRC_URI += " \
     crate://crates.io/diff/0.1.13 \
     crate://crates.io/digest/0.10.7 \
     crate://crates.io/dlv-list/0.5.0 \
-    crate://crates.io/dns-lookup/2.0.3 \
+    crate://crates.io/dns-lookup/2.0.4 \
     crate://crates.io/dunce/1.0.4 \
     crate://crates.io/either/1.8.0 \
     crate://crates.io/encode_unicode/0.3.6 \
@@ -118,12 +118,12 @@ SRC_URI += " \
     crate://crates.io/kqueue-sys/1.0.3 \
     crate://crates.io/lazy_static/1.4.0 \
     crate://crates.io/lazycell/1.3.0 \
-    crate://crates.io/libc/0.2.149 \
+    crate://crates.io/libc/0.2.150 \
     crate://crates.io/libloading/0.7.4 \
     crate://crates.io/libm/0.2.7 \
     crate://crates.io/linux-raw-sys/0.1.4 \
     crate://crates.io/linux-raw-sys/0.3.8 \
-    crate://crates.io/linux-raw-sys/0.4.5 \
+    crate://crates.io/linux-raw-sys/0.4.10 \
     crate://crates.io/lock_api/0.4.9 \
     crate://crates.io/log/0.4.17 \
     crate://crates.io/lscolors/0.15.0 \
@@ -166,7 +166,8 @@ SRC_URI += " \
     crate://crates.io/pretty_assertions/1.4.0 \
     crate://crates.io/proc-macro-hack/0.5.20+deprecated \
     crate://crates.io/proc-macro2/1.0.63 \
-    crate://crates.io/procfs/0.15.1 \
+    crate://crates.io/procfs/0.16.0 \
+    crate://crates.io/procfs-core/0.16.0 \
     crate://crates.io/quick-error/2.0.1 \
     crate://crates.io/quickcheck/1.0.3 \
     crate://crates.io/quote/1.0.29 \
@@ -179,8 +180,8 @@ SRC_URI += " \
     crate://crates.io/redox_syscall/0.3.5 \
     crate://crates.io/redox_syscall/0.4.0 \
     crate://crates.io/reference-counted-singleton/0.1.2 \
-    crate://crates.io/regex/1.10.1 \
-    crate://crates.io/regex-automata/0.4.2 \
+    crate://crates.io/regex/1.10.2 \
+    crate://crates.io/regex-automata/0.4.3 \
     crate://crates.io/regex-syntax/0.8.2 \
     crate://crates.io/relative-path/1.8.0 \
     crate://crates.io/rlimit/0.10.1 \
@@ -191,11 +192,11 @@ SRC_URI += " \
     crate://crates.io/rustc-hash/1.1.0 \
     crate://crates.io/rustc_version/0.4.0 \
     crate://crates.io/rustix/0.36.15 \
-    crate://crates.io/rustix/0.37.23 \
-    crate://crates.io/rustix/0.38.8 \
+    crate://crates.io/rustix/0.37.26 \
+    crate://crates.io/rustix/0.38.21 \
     crate://crates.io/same-file/1.0.6 \
     crate://crates.io/scopeguard/1.1.0 \
-    crate://crates.io/self_cell/1.0.1 \
+    crate://crates.io/self_cell/1.0.2 \
     crate://crates.io/selinux/0.4.0 \
     crate://crates.io/selinux-sys/0.6.2 \
     crate://crates.io/semver/1.0.14 \
@@ -216,7 +217,7 @@ SRC_URI += " \
     crate://crates.io/strsim/0.10.0 \
     crate://crates.io/syn/1.0.109 \
     crate://crates.io/syn/2.0.23 \
-    crate://crates.io/tempfile/3.8.0 \
+    crate://crates.io/tempfile/3.8.1 \
     crate://crates.io/terminal_size/0.2.6 \
     crate://crates.io/terminal_size/0.3.0 \
     crate://crates.io/textwrap/0.16.0 \
@@ -294,9 +295,9 @@ SRC_URI[bitflags-2.4.0.sha256sum] = "b4682ae6287fcf752ecaabbfcc7b6f9b72aa33933dc
 SRC_URI[blake2b_simd-1.0.2.sha256sum] = "23285ad32269793932e830392f2fe2f83e26488fd3ec778883a93c8323735780"
 SRC_URI[blake3-1.5.0.sha256sum] = "0231f06152bf547e9c2b5194f247cd97aacf6dcd8b15d8e5ec0663f64580da87"
 SRC_URI[block-buffer-0.10.3.sha256sum] = "69cce20737498f97b993470a6e536b8523f0af7892a4f928cceb1ac5e52ebe7e"
-SRC_URI[bstr-1.7.0.sha256sum] = "c79ad7fb2dd38f3dabd76b09c6a5a20c038fc0213ef1e9afd30eb777f120f019"
+SRC_URI[bstr-1.8.0.sha256sum] = "542f33a8835a0884b006a0c3df3dadd99c0c3f296ed26c2fdc8028e01ad6230c"
 SRC_URI[bumpalo-3.11.1.sha256sum] = "572f695136211188308f16ad2ca5c851a712c464060ae6974944458eb83880ba"
-SRC_URI[bytecount-0.6.4.sha256sum] = "ad152d03a2c813c80bb94fedbf3a3f02b28f793e39e7c214c8a0bcc196343de7"
+SRC_URI[bytecount-0.6.7.sha256sum] = "e1e5f035d16fc623ae5f74981db80a439803888314e3a555fd6f04acd51a3205"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
 SRC_URI[cc-1.0.79.sha256sum] = "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f"
 SRC_URI[cexpr-0.6.0.sha256sum] = "6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766"
@@ -311,8 +312,8 @@ SRC_URI[clap_mangen-0.2.9.sha256sum] = "bb0f09a0ca8f0dd8ac92c546b426f466ef198281
 SRC_URI[colorchoice-1.0.0.sha256sum] = "acbf1af155f9b9ef647e42cdc158db4b64a1b61f743629225fde6f3e0be2a7c7"
 SRC_URI[compare-0.1.0.sha256sum] = "120133d4db2ec47efe2e26502ee984747630c67f51974fca0b6c1340cf2368d3"
 SRC_URI[console-0.15.7.sha256sum] = "c926e00cc70edefdc64d3a5ff31cc65bb97a3460097762bd23afb4d8145fccf8"
-SRC_URI[const-random-0.1.15.sha256sum] = "368a7a772ead6ce7e1de82bfb04c485f3db8ec744f72925af5735e29a22cc18e"
-SRC_URI[const-random-macro-0.1.15.sha256sum] = "9d7d6ab3c3a2282db210df5f02c4dab6e0a7057af0fb7ebd4070f30fe05c0ddb"
+SRC_URI[const-random-0.1.16.sha256sum] = "11df32a13d7892ec42d51d3d175faba5211ffe13ed25d4fb348ac9e9ce835593"
+SRC_URI[const-random-macro-0.1.16.sha256sum] = "f9d839f2a20b0aee515dc581a6172f2321f96cab76c1a38a4c584a194955390e"
 SRC_URI[constant_time_eq-0.3.0.sha256sum] = "f7144d30dcf0fafbce74250a3963025d8d52177934239851c917d29f1df280c2"
 SRC_URI[conv-0.3.3.sha256sum] = "78ff10625fd0ac447827aa30ea8b861fead473bb60aeb73af6c1c58caf0d1299"
 SRC_URI[core-foundation-sys-0.8.3.sha256sum] = "5827cebf4670468b8772dd191856768aedcb1b0278a04f989f7766351917b9dc"
@@ -339,7 +340,7 @@ SRC_URI[data-encoding-macro-internal-0.1.11.sha256sum] = "8fdf3fce3ce863539ec1d7
 SRC_URI[diff-0.1.13.sha256sum] = "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
 SRC_URI[dlv-list-0.5.0.sha256sum] = "d529fd73d344663edfd598ccb3f344e46034db51ebd103518eae34338248ad73"
-SRC_URI[dns-lookup-2.0.3.sha256sum] = "8d0fa3cd8dc96ada974e126a940d37d4079bbbe6a24aca15b1113c2f362441c5"
+SRC_URI[dns-lookup-2.0.4.sha256sum] = "e5766087c2235fec47fafa4cfecc81e494ee679d0fd4a59887ea0919bfb0e4fc"
 SRC_URI[dunce-1.0.4.sha256sum] = "56ce8c6da7551ec6c462cbaf3bfbc75131ebbfa1c944aeaa9dab51ca1c5f0c3b"
 SRC_URI[either-1.8.0.sha256sum] = "90e5c1c8368803113bf0c9584fc495a58b86dc8a29edbf8fe877d21d9507e797"
 SRC_URI[encode_unicode-0.3.6.sha256sum] = "a357d28ed41a50f9c765dbfe56cbc04a64e53e5fc58ba79fbc34c10ef3df831f"
@@ -390,12 +391,12 @@ SRC_URI[kqueue-1.0.7.sha256sum] = "2c8fc60ba15bf51257aa9807a48a61013db043fcf3a78
 SRC_URI[kqueue-sys-1.0.3.sha256sum] = "8367585489f01bc55dd27404dcf56b95e6da061a256a666ab23be9ba96a2e587"
 SRC_URI[lazy_static-1.4.0.sha256sum] = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
 SRC_URI[lazycell-1.3.0.sha256sum] = "830d08ce1d1d941e6b30645f1a0eb5643013d835ce3779a5fc208261dbe10f55"
-SRC_URI[libc-0.2.149.sha256sum] = "a08173bc88b7955d1b3145aa561539096c421ac8debde8cbc3612ec635fee29b"
+SRC_URI[libc-0.2.150.sha256sum] = "89d92a4743f9a61002fae18374ed11e7973f530cb3a3255fb354818118b2203c"
 SRC_URI[libloading-0.7.4.sha256sum] = "b67380fd3b2fbe7527a606e18729d21c6f3951633d0500574c4dc22d2d638b9f"
 SRC_URI[libm-0.2.7.sha256sum] = "f7012b1bbb0719e1097c47611d3898568c546d597c2e74d66f6087edd5233ff4"
 SRC_URI[linux-raw-sys-0.1.4.sha256sum] = "f051f77a7c8e6957c0696eac88f26b0117e54f52d3fc682ab19397a8812846a4"
 SRC_URI[linux-raw-sys-0.3.8.sha256sum] = "ef53942eb7bf7ff43a617b3e2c1c4a5ecf5944a7c1bc12d7ee39bbb15e5c1519"
-SRC_URI[linux-raw-sys-0.4.5.sha256sum] = "57bcfdad1b858c2db7c38303a6d2ad4dfaf5eb53dfeb0910128b2c26d6158503"
+SRC_URI[linux-raw-sys-0.4.10.sha256sum] = "da2479e8c062e40bf0066ffa0bc823de0a9368974af99c9f6df941d2c231e03f"
 SRC_URI[lock_api-0.4.9.sha256sum] = "435011366fe56583b16cf956f9df0095b405b82d76425bc8981c0e22e60ec4df"
 SRC_URI[log-0.4.17.sha256sum] = "abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4259d3c095a2382e"
 SRC_URI[lscolors-0.15.0.sha256sum] = "bf7015a04103ad78abb77e4b79ed151e767922d1cfde5f62640471c629a2320d"
@@ -438,7 +439,8 @@ SRC_URI[ppv-lite86-0.2.17.sha256sum] = "5b40af805b3121feab8a3c29f04d8ad262fa8e05
 SRC_URI[pretty_assertions-1.4.0.sha256sum] = "af7cee1a6c8a5b9208b3cb1061f10c0cb689087b3d8ce85fb9d2dd7a29b6ba66"
 SRC_URI[proc-macro-hack-0.5.20+deprecated.sha256sum] = "dc375e1527247fe1a97d8b7156678dfe7c1af2fc075c9a4db3690ecd2a148068"
 SRC_URI[proc-macro2-1.0.63.sha256sum] = "7b368fba921b0dce7e60f5e04ec15e565b3303972b42bcfde1d0713b881959eb"
-SRC_URI[procfs-0.15.1.sha256sum] = "943ca7f9f29bab5844ecd8fdb3992c5969b6622bb9609b9502fef9b4310e3f1f"
+SRC_URI[procfs-0.16.0.sha256sum] = "731e0d9356b0c25f16f33b5be79b1c57b562f141ebfcdb0ad8ac2c13a24293b4"
+SRC_URI[procfs-core-0.16.0.sha256sum] = "2d3554923a69f4ce04c4a754260c338f505ce22642d3830e049a399fc2059a29"
 SRC_URI[quick-error-2.0.1.sha256sum] = "a993555f31e5a609f617c12db6250dedcac1b0a85076912c436e6fc9b2c8e6a3"
 SRC_URI[quickcheck-1.0.3.sha256sum] = "588f6378e4dd99458b60ec275b4477add41ce4fa9f64dcba6f15adccb19b50d6"
 SRC_URI[quote-1.0.29.sha256sum] = "573015e8ab27661678357f27dc26460738fd2b6c86e46f386fde94cb5d913105"
@@ -451,8 +453,8 @@ SRC_URI[rayon-core-1.12.0.sha256sum] = "5ce3fb6ad83f861aac485e76e1985cd109d9a371
 SRC_URI[redox_syscall-0.3.5.sha256sum] = "567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29"
 SRC_URI[redox_syscall-0.4.0.sha256sum] = "ded0bce2d41cc3c57aefa284708ced249a64acb01745dbbe72bd78610bfd644c"
 SRC_URI[reference-counted-singleton-0.1.2.sha256sum] = "f1bfbf25d7eb88ddcbb1ec3d755d0634da8f7657b2cb8b74089121409ab8228f"
-SRC_URI[regex-1.10.1.sha256sum] = "aaac441002f822bc9705a681810a4dd2963094b9ca0ddc41cb963a4c189189ea"
-SRC_URI[regex-automata-0.4.2.sha256sum] = "5011c7e263a695dc8ca064cddb722af1be54e517a280b12a5356f98366899e5d"
+SRC_URI[regex-1.10.2.sha256sum] = "380b951a9c5e80ddfd6136919eef32310721aa4aacd4889a8d39124b026ab343"
+SRC_URI[regex-automata-0.4.3.sha256sum] = "5f804c7828047e88b2d32e2d7fe5a105da8ee3264f01902f796c8e067dc2483f"
 SRC_URI[regex-syntax-0.8.2.sha256sum] = "c08c74e62047bb2de4ff487b251e4a92e24f48745648451635cec7d591162d9f"
 SRC_URI[relative-path-1.8.0.sha256sum] = "4bf2521270932c3c7bed1a59151222bd7643c79310f2916f01925e1e16255698"
 SRC_URI[rlimit-0.10.1.sha256sum] = "3560f70f30a0f16d11d01ed078a07740fe6b489667abc7c7b029155d9f21c3d8"
@@ -463,11 +465,11 @@ SRC_URI[rust-ini-0.19.0.sha256sum] = "7e2a3bcec1f113553ef1c88aae6c020a369d03d55b
 SRC_URI[rustc-hash-1.1.0.sha256sum] = "08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2"
 SRC_URI[rustc_version-0.4.0.sha256sum] = "bfa0f585226d2e68097d4f95d113b15b83a82e819ab25717ec0590d9584ef366"
 SRC_URI[rustix-0.36.15.sha256sum] = "c37f1bd5ef1b5422177b7646cba67430579cfe2ace80f284fee876bca52ad941"
-SRC_URI[rustix-0.37.23.sha256sum] = "4d69718bf81c6127a49dc64e44a742e8bb9213c0ff8869a22c308f84c1d4ab06"
-SRC_URI[rustix-0.38.8.sha256sum] = "19ed4fa021d81c8392ce04db050a3da9a60299050b7ae1cf482d862b54a7218f"
+SRC_URI[rustix-0.37.26.sha256sum] = "84f3f8f960ed3b5a59055428714943298bf3fa2d4a1d53135084e0544829d995"
+SRC_URI[rustix-0.38.21.sha256sum] = "2b426b0506e5d50a7d8dafcf2e81471400deb602392c7dd110815afb4eaf02a3"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
 SRC_URI[scopeguard-1.1.0.sha256sum] = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
-SRC_URI[self_cell-1.0.1.sha256sum] = "4c309e515543e67811222dbc9e3dd7e1056279b782e1dacffe4242b718734fb6"
+SRC_URI[self_cell-1.0.2.sha256sum] = "e388332cd64eb80cd595a00941baf513caffae8dce9cfd0467fc9c66397dade6"
 SRC_URI[selinux-0.4.0.sha256sum] = "a00576725d21b588213fbd4af84cd7e4cc4304e8e9bd6c0f5a1498a3e2ca6a51"
 SRC_URI[selinux-sys-0.6.2.sha256sum] = "806d381649bb85347189d2350728817418138d11d738e2482cb644ec7f3c755d"
 SRC_URI[semver-1.0.14.sha256sum] = "e25dfac463d778e353db5be2449d1cce89bd6fd23c9f1ea21310ce6e5a1b29c4"
@@ -488,7 +490,7 @@ SRC_URI[socket2-0.5.3.sha256sum] = "2538b18701741680e0322a2302176d3253a35388e2e6
 SRC_URI[strsim-0.10.0.sha256sum] = "73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623"
 SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
 SRC_URI[syn-2.0.23.sha256sum] = "59fb7d6d8281a51045d62b8eb3a7d1ce347b76f312af50cd3dc0af39c87c1737"
-SRC_URI[tempfile-3.8.0.sha256sum] = "cb94d2f3cc536af71caac6b6fcebf65860b347e7ce0cc9ebe8f70d3e521054ef"
+SRC_URI[tempfile-3.8.1.sha256sum] = "7ef1adac450ad7f4b3c28589471ade84f25f731a7a0fe30d71dfa9f60fd808e5"
 SRC_URI[terminal_size-0.2.6.sha256sum] = "8e6bf6f19e9f8ed8d4048dc22981458ebcf406d67e94cd422e5ecd73d63b3237"
 SRC_URI[terminal_size-0.3.0.sha256sum] = "21bebf2b7c9e0a515f6e0f8c51dc0f8e4696391e6f1ff30379559f8365fb0df7"
 SRC_URI[textwrap-0.16.0.sha256sum] = "222a222a5bfe1bba4a77b45ec488a741b3cb8872e5e499451fd7d0129c9c7c3d"
diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.22.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.23.bb
similarity index 92%
rename from meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.22.bb
rename to meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.23.bb
index 70eea77d6..f0bb4d267 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.22.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.23.bb
@@ -11,7 +11,7 @@ SRC_URI += "git://github.com/uutils/coreutils.git;protocol=https;branch=main"
 # so src/uucore/src/lib/features.rs disables utmpx when targetting musl.
 COMPATIBLE_HOST:libc-musl = "null"
 
-SRCREV = "73b7c46131a9ce35ca1015e76fea772c40d41dd7"
+SRCREV = "a3af2230a64d3b60832ce9944df5388a5ba9128a"
 S = "${WORKDIR}/git"
 
 require ${BPN}-crates.inc
-- 
2.25.1


