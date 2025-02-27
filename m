Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F801C021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 06:25:17 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.5145.1740637515355546044
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 22:25:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TgnXmYdj;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22349bb8605so10387965ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 22:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740637514; x=1741242314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U2JE5/k3q0s534idf2HCpjkhM8blojrUCeQtDhsa7x0=;
        b=TgnXmYdjSt/t5hnzFBbBWAPDJlNq41AZvFK+fQkWkYGq2rBSB2Bo3f6VMb2QhuOiJ1
         VmP7MX7Gl+8oXxkCY7H8dmoNKoL0n8ZWChniAZiZQWwsmS929yZzgQaCt0S5et4jGJ/H
         72bPK68j+qHcopakG521fbrtGRNvdZimDqKkGHR5/OCnJuG+kwyPV44eUXvHfSVX/gzO
         GDi+bOXAayiLni/sR4lGVp9k7xPDqmuy1msesXOKSfVVBs9iVuaW0sp6RZmo0ZxPQSzc
         lOSiquBB/Mr2wTN90xNeve1mLYT5Ea1XjjrsfP2D2lDzgnZ6yNHcYKnq3e4JR5wngPCv
         w8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740637514; x=1741242314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2JE5/k3q0s534idf2HCpjkhM8blojrUCeQtDhsa7x0=;
        b=HV+ZEELIqOT6LaBfiDd7Ts32fRl3YLqifwGj/ZNJigW+P494ypForj4lBfG0vZKrSy
         a2EH49mTrz2hX1OWgOir6jWWT4iUHoyAAe8HgrAO0xKGiM/IwXbyIa2gEE0pqOxiW32n
         VXtbNdJKn770wPeaYKlsfDz5/0T+66aGQ1OsSHHb5sTWPgDQs2KvtEf8s6GMZudA/fFl
         JrtqodCzZy3AJKFbZ3eDdKShZe+z0i42tE8IoGEGmVtcKLNcMFAQKCTu37E5+ENucc5p
         LYfYAau2iBexZ/VTjYi5s+9X2w632TJ35GvXsFi53+YWian+WsxtoQhxawUtTWPIBYlh
         KVUA==
X-Gm-Message-State: AOJu0YyI5KnZmPiNP3J5ojhOIPTwvMVuUjnf8Ae6kvpj9AGWHaP5reCp
	hwcY74TQl85M5nK6Bk7kMvPxz3RLFmOS4RVw0pDszpuOaNtJTOu/uZxnGr/h
X-Gm-Gg: ASbGnct2NhcWJyY0/F6biESyXPZcyjmNZVtmVrNHhRlZ3ZuaHQO2DC2ogcigtPcVdF2
	q4Ic2FEC0Hz886BaLgornxJWacFQyBsyu1afP6dFUiOko7Vklbm345rB5qAyAs8C+h83xYtca98
	cLvcr1QRp07s3UDXhzLOPPU0R2wOJaw0myyxxu+jJnV780F/QdzagVjtPmkPhZOHwPw2wHes1XK
	X/ZC88JHqL1Y3SQqpxXJ5LEwDzwQ1W8KsR7avFzBT4DRe7Y2K8zxHyb7upjvWQP7hkHe4yP+Nsq
	NzvG87P7tXVa3V0YOA==
X-Google-Smtp-Source: AGHT+IGSBCibpsFQKPvQP9drqHeAV9GT1rvGbbP7fyjb086AsDXByD4bghJYa5xmMlbjOjA++3NO6A==
X-Received: by 2002:a17:902:f64f:b0:223:2cae:4a96 with SMTP id d9443c01a7336-2232cae4ceamr72704435ad.42.1740637514371;
        Wed, 26 Feb 2025 22:25:14 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::9a5a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501d279csm6829145ad.44.2025.02.26.22.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 22:25:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] thin-provisioning-tools: Upgrade to 1.1.0
Date: Wed, 26 Feb 2025 22:25:11 -0800
Message-ID: <20250227062511.2042762-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 06:25:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115685

Specify BINDGEN_EXTRA_CLANG_ARGS to pass correct cflags to bindgen during
cross compile

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../thin-provisioning-tools-crates.inc        | 38 ++++++++++---------
 ...14.bb => thin-provisioning-tools_1.1.0.bb} |  7 ++--
 2 files changed, 24 insertions(+), 21 deletions(-)
 rename meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/{thin-provisioning-tools_1.0.14.bb => thin-provisioning-tools_1.1.0.bb} (88%)

diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
index a49704fe21..65dda50739 100644
--- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
+++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
@@ -16,15 +16,15 @@ SRC_URI += " \
     crate://crates.io/bindgen/0.69.4 \
     crate://crates.io/bitflags/1.3.2 \
     crate://crates.io/bitflags/2.6.0 \
-    crate://crates.io/bytemuck/1.16.1 \
+    crate://crates.io/bytemuck/1.16.3 \
     crate://crates.io/byteorder/1.5.0 \
     crate://crates.io/cassowary/0.3.0 \
     crate://crates.io/cexpr/0.6.0 \
     crate://crates.io/cfg-if/1.0.0 \
     crate://crates.io/cfg_aliases/0.2.1 \
     crate://crates.io/clang-sys/1.8.1 \
-    crate://crates.io/clap/4.5.11 \
-    crate://crates.io/clap_builder/4.5.11 \
+    crate://crates.io/clap/4.5.13 \
+    crate://crates.io/clap_builder/4.5.13 \
     crate://crates.io/clap_lex/0.7.2 \
     crate://crates.io/colorchoice/1.0.2 \
     crate://crates.io/console/0.15.8 \
@@ -44,7 +44,7 @@ SRC_URI += " \
     crate://crates.io/exitcode/1.1.2 \
     crate://crates.io/fastrand/2.1.0 \
     crate://crates.io/fixedbitset/0.4.2 \
-    crate://crates.io/flate2/1.0.30 \
+    crate://crates.io/flate2/1.0.31 \
     crate://crates.io/fragile/2.0.0 \
     crate://crates.io/getrandom/0.2.15 \
     crate://crates.io/glob/0.3.1 \
@@ -76,10 +76,10 @@ SRC_URI += " \
     crate://crates.io/number_prefix/0.4.0 \
     crate://crates.io/numtoa/0.1.0 \
     crate://crates.io/once_cell/1.19.0 \
-    crate://crates.io/os_pipe/1.2.0 \
+    crate://crates.io/os_pipe/1.2.1 \
     crate://crates.io/pkg-config/0.3.30 \
     crate://crates.io/portable-atomic/1.7.0 \
-    crate://crates.io/ppv-lite86/0.2.19 \
+    crate://crates.io/ppv-lite86/0.2.20 \
     crate://crates.io/predicates/3.1.2 \
     crate://crates.io/predicates-core/1.0.8 \
     crate://crates.io/predicates-tree/1.0.11 \
@@ -94,7 +94,7 @@ SRC_URI += " \
     crate://crates.io/rangemap/1.5.1 \
     crate://crates.io/redox_syscall/0.2.16 \
     crate://crates.io/redox_termios/0.1.3 \
-    crate://crates.io/regex/1.10.5 \
+    crate://crates.io/regex/1.10.6 \
     crate://crates.io/regex-automata/0.4.7 \
     crate://crates.io/regex-syntax/0.8.4 \
     crate://crates.io/retry/2.0.0 \
@@ -106,12 +106,12 @@ SRC_URI += " \
     crate://crates.io/semver/1.0.23 \
     crate://crates.io/serde/1.0.204 \
     crate://crates.io/serde_derive/1.0.204 \
-    crate://crates.io/shared_child/1.0.0 \
+    crate://crates.io/shared_child/1.0.1 \
     crate://crates.io/shlex/1.3.0 \
     crate://crates.io/strsim/0.11.1 \
     crate://crates.io/syn/1.0.109 \
     crate://crates.io/syn/2.0.72 \
-    crate://crates.io/tempfile/3.10.1 \
+    crate://crates.io/tempfile/3.11.0 \
     crate://crates.io/termion/1.5.6 \
     crate://crates.io/termtree/0.4.1 \
     crate://crates.io/thiserror/1.0.63 \
@@ -128,6 +128,7 @@ SRC_URI += " \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
     crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
     crate://crates.io/windows-sys/0.52.0 \
+    crate://crates.io/windows-sys/0.59.0 \
     crate://crates.io/windows-targets/0.52.6 \
     crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
     crate://crates.io/windows_aarch64_msvc/0.52.6 \
@@ -155,15 +156,15 @@ SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508f
 SRC_URI[bindgen-0.69.4.sha256sum] = "a00dc851838a2120612785d195287475a3ac45514741da670b735818822129a0"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
 SRC_URI[bitflags-2.6.0.sha256sum] = "b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de"
-SRC_URI[bytemuck-1.16.1.sha256sum] = "b236fc92302c97ed75b38da1f4917b5cdda4984745740f153a5d3059e48d725e"
+SRC_URI[bytemuck-1.16.3.sha256sum] = "102087e286b4677862ea56cf8fc58bb2cdfa8725c40ffb80fe3a008eb7f2fc83"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
 SRC_URI[cassowary-0.3.0.sha256sum] = "df8670b8c7b9dae1793364eafadf7239c40d669904660c5960d74cfd80b46a53"
 SRC_URI[cexpr-0.6.0.sha256sum] = "6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
 SRC_URI[cfg_aliases-0.2.1.sha256sum] = "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
 SRC_URI[clang-sys-1.8.1.sha256sum] = "0b023947811758c97c59bf9d1c188fd619ad4718dcaa767947df1cadb14f39f4"
-SRC_URI[clap-4.5.11.sha256sum] = "35723e6a11662c2afb578bcf0b88bf6ea8e21282a953428f240574fcc3a2b5b3"
-SRC_URI[clap_builder-4.5.11.sha256sum] = "49eb96cbfa7cfa35017b7cd548c75b14c3118c98b423041d70562665e07fb0fa"
+SRC_URI[clap-4.5.13.sha256sum] = "0fbb260a053428790f3de475e304ff84cdbc4face759ea7a3e64c1edd938a7fc"
+SRC_URI[clap_builder-4.5.13.sha256sum] = "64b17d7ea74e9f833c7dbf2cbe4fb12ff26783eda4782a8975b72f895c9b4d99"
 SRC_URI[clap_lex-0.7.2.sha256sum] = "1462739cb27611015575c0c11df5df7601141071f07518d56fcc1be504cbec97"
 SRC_URI[colorchoice-1.0.2.sha256sum] = "d3fd119d74b830634cea2a0f58bbd0d54540518a14397557951e79340abc28c0"
 SRC_URI[console-0.15.8.sha256sum] = "0e1f83fc076bd6dd27517eacdf25fef6c4dfe5f1d7448bafaaf3a26f13b5e4eb"
@@ -183,7 +184,7 @@ SRC_URI[errno-0.3.9.sha256sum] = "534c5cf6194dfab3db3242765c03bbe257cf92f22b38f6
 SRC_URI[exitcode-1.1.2.sha256sum] = "de853764b47027c2e862a995c34978ffa63c1501f2e15f987ba11bd4f9bba193"
 SRC_URI[fastrand-2.1.0.sha256sum] = "9fc0510504f03c51ada170672ac806f1f105a88aa97a5281117e1ddc3368e51a"
 SRC_URI[fixedbitset-0.4.2.sha256sum] = "0ce7134b9999ecaf8bcd65542e436736ef32ddca1b3e06094cb6ec5755203b80"
-SRC_URI[flate2-1.0.30.sha256sum] = "5f54427cfd1c7829e2a139fcefea601bf088ebca651d2bf53ebc600eac295dae"
+SRC_URI[flate2-1.0.31.sha256sum] = "7f211bbe8e69bbd0cfdea405084f128ae8b4aaa6b0b522fc8f2b009084797920"
 SRC_URI[fragile-2.0.0.sha256sum] = "6c2141d6d6c8512188a7891b4b01590a45f6dac67afb4f255c4124dbb86d4eaa"
 SRC_URI[getrandom-0.2.15.sha256sum] = "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
 SRC_URI[glob-0.3.1.sha256sum] = "d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b"
@@ -215,10 +216,10 @@ SRC_URI[num_cpus-1.16.0.sha256sum] = "4161fcb6d602d4d2081af7c3a45852d875a03dd337
 SRC_URI[number_prefix-0.4.0.sha256sum] = "830b246a0e5f20af87141b25c173cd1b609bd7779a4617d6ec582abaf90870f3"
 SRC_URI[numtoa-0.1.0.sha256sum] = "b8f8bdf33df195859076e54ab11ee78a1b208382d3a26ec40d142ffc1ecc49ef"
 SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
-SRC_URI[os_pipe-1.2.0.sha256sum] = "29d73ba8daf8fac13b0501d1abeddcfe21ba7401ada61a819144b6c2a4f32209"
+SRC_URI[os_pipe-1.2.1.sha256sum] = "5ffd2b0a5634335b135d5728d84c5e0fd726954b87111f7506a61c502280d982"
 SRC_URI[pkg-config-0.3.30.sha256sum] = "d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec"
 SRC_URI[portable-atomic-1.7.0.sha256sum] = "da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044ecfc67265"
-SRC_URI[ppv-lite86-0.2.19.sha256sum] = "2288c0e17cc8d342c712bb43a257a80ebffce59cdb33d5000d8348f3ec02528b"
+SRC_URI[ppv-lite86-0.2.20.sha256sum] = "77957b295656769bb8ad2b6a6b09d897d94f05c41b069aede1fcdaa675eaea04"
 SRC_URI[predicates-3.1.2.sha256sum] = "7e9086cc7640c29a356d1a29fd134380bee9d8f79a17410aa76e7ad295f42c97"
 SRC_URI[predicates-core-1.0.8.sha256sum] = "ae8177bee8e75d6846599c6b9ff679ed51e882816914eec639944d7c9aa11931"
 SRC_URI[predicates-tree-1.0.11.sha256sum] = "41b740d195ed3166cd147c8047ec98db0e22ec019eb8eeb76d343b795304fb13"
@@ -233,7 +234,7 @@ SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a
 SRC_URI[rangemap-1.5.1.sha256sum] = "f60fcc7d6849342eff22c4350c8b9a989ee8ceabc4b481253e8946b9fe83d684"
 SRC_URI[redox_syscall-0.2.16.sha256sum] = "fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a"
 SRC_URI[redox_termios-0.1.3.sha256sum] = "20145670ba436b55d91fc92d25e71160fbfbdd57831631c8d7d36377a476f1cb"
-SRC_URI[regex-1.10.5.sha256sum] = "b91213439dad192326a0d7c6ee3955910425f441d7038e0d6933b0aec5c4517f"
+SRC_URI[regex-1.10.6.sha256sum] = "4219d74c6b67a3654a9fbebc4b419e22126d13d2f3c4a07ee0cb61ff79a79619"
 SRC_URI[regex-automata-0.4.7.sha256sum] = "38caf58cc5ef2fed281f89292ef23f6365465ed9a41b7a7754eb4e26496c92df"
 SRC_URI[regex-syntax-0.8.4.sha256sum] = "7a66a03ae7c801facd77a29370b4faec201768915ac14a721ba36f20bc9c209b"
 SRC_URI[retry-2.0.0.sha256sum] = "9166d72162de3575f950507683fac47e30f6f2c3836b71b7fbc61aa517c9c5f4"
@@ -245,12 +246,12 @@ SRC_URI[safemem-0.3.3.sha256sum] = "ef703b7cb59335eae2eb93ceb664c0eb7ea6bf567079
 SRC_URI[semver-1.0.23.sha256sum] = "61697e0a1c7e512e84a621326239844a24d8207b4669b41bc18b32ea5cbf988b"
 SRC_URI[serde-1.0.204.sha256sum] = "bc76f558e0cbb2a839d37354c575f1dc3fdc6546b5be373ba43d95f231bf7c12"
 SRC_URI[serde_derive-1.0.204.sha256sum] = "e0cd7e117be63d3c3678776753929474f3b04a43a080c744d6b0ae2a8c28e222"
-SRC_URI[shared_child-1.0.0.sha256sum] = "b0d94659ad3c2137fef23ae75b03d5241d633f8acded53d672decfa0e6e0caef"
+SRC_URI[shared_child-1.0.1.sha256sum] = "09fa9338aed9a1df411814a5b2252f7cd206c55ae9bf2fa763f8de84603aa60c"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
 SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
 SRC_URI[syn-2.0.72.sha256sum] = "dc4b9b9bf2add8093d3f2c0204471e951b2285580335de42f9d2534f3ae7a8af"
-SRC_URI[tempfile-3.10.1.sha256sum] = "85b77fafb263dd9d05cbeac119526425676db3784113aa9295c88498cbf8bff1"
+SRC_URI[tempfile-3.11.0.sha256sum] = "b8fcd239983515c23a32fb82099f97d0b11b8c72f654ed659363a95c3dad7a53"
 SRC_URI[termion-1.5.6.sha256sum] = "077185e2eac69c3f8379a4298e1e07cd36beb962290d4a51199acf0fdc10607e"
 SRC_URI[termtree-0.4.1.sha256sum] = "3369f5ac52d5eb6ab48c6b4ffdc8efbcad6b89c765749064ba298f2c68a16a76"
 SRC_URI[thiserror-1.0.63.sha256sum] = "c0342370b38b6a11b6cc11d6a805569958d54cfa061a29969c3b5ce2ea405724"
@@ -267,6 +268,7 @@ SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
 SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
+SRC_URI[windows-sys-0.59.0.sha256sum] = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
 SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
 SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
 SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.14.bb b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
similarity index 88%
rename from meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.14.bb
rename to meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
index e5a683aa0f..bb4b53c28b 100644
--- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.14.bb
+++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
@@ -11,16 +11,17 @@ SRC_URI = " \
     git://github.com/jthornber/thin-provisioning-tools;branch=main;protocol=https \
     "
 
-# v1.0.14
-SRCREV = "6be3e0937800cb947f1be7c0150825f155cfca14"
+# v1.1.0
+SRCREV = "b745ab35057bdd0a4f1406938916621dcf2b7ef6"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 inherit cargo cargo-update-recipe-crates
 inherit pkgconfig
 
-DEPENDS += "udev clang-native"
+DEPENDS += "udev libdevmapper libdevmapper-native clang-native"
 
 export LIBCLANG_PATH = "${WORKDIR}/recipe-sysroot-native${libdir}"
+export BINDGEN_EXTRA_CLANG_ARGS = "${BUILD_CFLAGS}"
 
 require ${BPN}-crates.inc
 require ${BPN}-git-crates.inc

