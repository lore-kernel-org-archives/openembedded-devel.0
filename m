Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1663.1792738462964451012
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m6ST8DaC;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a06454116eso283696b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738462; x=1793343262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtCzQKG3+3a5qVEsmjPtmwUNFREgLQlWi+HCbZhHAlY=;
        b=m6ST8DaCptkwtm+YTC4uQ3rKYPHT16xMN27YibPCqYEqPAIa1RetMl0Bg+u/MXGmqh
         ADpK7kPkwkfqjPhVZn2Ox/mhAB/c3OKt2FH7n9t/GHPTlFXYtQSQORT0tGuGu6Q9cLtj
         KlZ97gtw2JcJWguEfrEk6XjA1TWIqogy48LE16Bi6TNV46ZMpc6yk6JrEVLOl1o2NqeV
         G7tSZZWx0X/nP8ors9YTlzYRqcdlyKWRS2TJQWd70pWFNIkBj/vOqv6tt0n++h1eyi0M
         akTE6CgbNEyRx3I7OuWX6R4AImIrH1IPpuVBd8ZBAaJ7rpIi7jb9G7q57ASV10/vH6/a
         DuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738462; x=1793343262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YtCzQKG3+3a5qVEsmjPtmwUNFREgLQlWi+HCbZhHAlY=;
        b=l3ZIrvKntjCnLp08mNvQRmi5oLj4Myau8M72BViVktdD/7btRu4UH3D+q3ToPfUzB7
         wBoLudHGwx12glDMjr1pjf32Tiwx9r9d+HHh7VHB08Z3maQct9H5hWeqCF8Y0rFozPcp
         6oky9dSQZ/nTzX7q2u8tn7FtaqP6D5+ODMQ3qIGuh0ExKO0b88u5ncQkDE+TjrZVVdIj
         pGSPFeLTE8/uOi3V12lOl17vzAZoNPLJJ4pFJVFOWpQbcAFrkMwYVoX0SC/CaxWSJ8hd
         KykC2KW62+p8N82rregXEF0JSJsDTi4Ce/HeDcQ8+zCNczGVid5z8ZZRafwSd0VR4zkg
         PBNg==
X-Gm-Message-State: AFq9FYLh5oEkqh6d9WWTNMuZZEG3R97eg+c7bcVuqRZj+9+ktwgU4oZK
	XYTd1OUY2+55tUfmOMWOaJhg70CCbnGGVppmG0RYvJU2wolhfnLDIvXAzFDiVTddm4w=
X-Gm-Gg: AYBFou3Uw6UALMRkPBg5AobhxjRV6IV7rIDTPiyvdhLptYadypDY2ff8cG9mFb9hBAc
	ji4I42cCuT6R/DPLsFI3285qQsFDRTspXy8qJk+xMHpfXEhm+r3v/8mxWfh1oxOXua/a4svAOaa
	Qk142ZcdfXMI/v1nzOyoeY2ESQcDoynFkBnKlE3vlwZX3WB+6LuGMQcbGc+LXBpm2MoqjzrPEyW
	YVyY6dvj03sb9WFffp2b7xONONNoNf7Uutj57hS28tAUhRphhfwYn3IbEgxUBjr002OccDIW6XJ
	rlF78HPCuRKFdpyOJxtiIiG0EOID/1EwB0wwpI3hIIZtCw1IFpcG9pkZKiE2f75thcJLdL9SevR
	LNUn1r3mfegMiGs42NCRpUeMy3WD4bN4j03sqcQp7m2uGV3BQBXTCGfT79nbadBYJP11YqkQdSr
	437yvV2AVujIMDJnNkSqN1qELL71KM0so3vbsva+eEb3wTEMkCMnVwZZCoCgHorRoreH4IL/wVq
	rtLijPX1qV0w3zmwNtQGCDFy9Cy1DGo8fWh62ZgQ6Qq58r0NbpxZZAUc0ds4G2Z1Vqd2nk+LEEC
	53hUBN5DBoPOhG8p78IqWU9NS/gl9d0xzu9yE3tne51FJ1PWCtUqMgjnLyL8usVgWnicikBXZJu
	ho8t/fTHDdkA0D/+6E5CHjaqT5uPaTrVbzKAVdU9zvSDXFlG3PDH3GOeK5kRu8aT4eK7JX8Ioy3
	LrLpCOSse53hWYAD1JanlAMu/663kii5aiY6avz6AUC6f6J8+UC4ffnjkc5kIqd9ZhkCdy/FlsL
	CYSTmY3ecPoS+E4f1RpQY4J1zZzwXw=
X-Received: by 2002:a05:6a00:a22a:b0:886:46c:8a1f with SMTP id d2e1a72fcca58-8a2c717379amr1131656b3a.35.1792738462188;
        Thu, 22 Oct 2026 23:54:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:54:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 24/29] sd: Fix build for riscv32
Date: Thu, 22 Oct 2026 23:53:45 -0700
Message-ID: <20261023065350.3228996-24-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131348
Content-Type: text/plain; charset="utf-8"

crossbeam-utils 0.8.16 does not recognize the riscv32-yoe-linux-musl
target as lacking 64-bit atomics, and rustix 0.38.20 with linux-raw-sys
0.4.10 lacks ioctl definitions for riscv32, so the build fails.

Add a patch that updates them in Cargo.lock to crossbeam-utils 0.8.23,
rustix 0.38.44 and linux-raw-sys 0.4.15, and regenerate sd-crates.inc.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/sd/sd-crates.inc     |  40 ++-
 ...ck-Update-crossbeam-utils-and-rustix.patch | 254 ++++++++++++++++++
 meta-oe/recipes-extended/sd/sd_1.1.0.bb       |   4 +-
 3 files changed, 289 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-extended/sd/sd/0001-Cargo.lock-Update-crossbeam-utils-and-rustix.patch

diff --git a/meta-oe/recipes-extended/sd/sd-crates.inc b/meta-oe/recipes-extended/sd/sd-crates.inc
index a37e5fa2ca..17107d8159 100644
--- a/meta-oe/recipes-extended/sd/sd-crates.inc
+++ b/meta-oe/recipes-extended/sd/sd-crates.inc
@@ -28,11 +28,11 @@ SRC_URI += " \
     crate://crates.io/console/0.15.7 \
     crate://crates.io/crossbeam-deque/0.8.3 \
     crate://crates.io/crossbeam-epoch/0.9.15 \
-    crate://crates.io/crossbeam-utils/0.8.16 \
+    crate://crates.io/crossbeam-utils/0.8.23 \
     crate://crates.io/difflib/0.4.0 \
     crate://crates.io/either/1.15.0 \
     crate://crates.io/encode_unicode/0.3.6 \
-    crate://crates.io/errno/0.3.5 \
+    crate://crates.io/errno/0.3.14 \
     crate://crates.io/fastrand/2.0.1 \
     crate://crates.io/fnv/1.0.7 \
     crate://crates.io/getrandom/0.2.10 \
@@ -42,7 +42,7 @@ SRC_URI += " \
     crate://crates.io/libc/0.2.177 \
     crate://crates.io/libm/0.2.8 \
     crate://crates.io/linked-hash-map/0.5.6 \
-    crate://crates.io/linux-raw-sys/0.4.10 \
+    crate://crates.io/linux-raw-sys/0.4.15 \
     crate://crates.io/memchr/2.7.6 \
     crate://crates.io/memoffset/0.9.0 \
     crate://crates.io/num-traits/0.2.17 \
@@ -66,7 +66,7 @@ SRC_URI += " \
     crate://crates.io/regex-syntax/0.7.5 \
     crate://crates.io/regex-syntax/0.8.8 \
     crate://crates.io/roff/0.2.1 \
-    crate://crates.io/rustix/0.38.20 \
+    crate://crates.io/rustix/0.38.44 \
     crate://crates.io/rusty-fork/0.3.0 \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/serde/1.0.228 \
@@ -86,24 +86,36 @@ SRC_URI += " \
     crate://crates.io/utf8parse/0.2.1 \
     crate://crates.io/wait-timeout/0.2.1 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+    crate://crates.io/windows-link/0.2.1 \
     crate://crates.io/windows-sys/0.45.0 \
     crate://crates.io/windows-sys/0.48.0 \
+    crate://crates.io/windows-sys/0.59.0 \
+    crate://crates.io/windows-sys/0.61.2 \
     crate://crates.io/windows-targets/0.42.2 \
     crate://crates.io/windows-targets/0.48.5 \
+    crate://crates.io/windows-targets/0.52.6 \
     crate://crates.io/windows_aarch64_gnullvm/0.42.2 \
     crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
     crate://crates.io/windows_aarch64_msvc/0.42.2 \
     crate://crates.io/windows_aarch64_msvc/0.48.5 \
+    crate://crates.io/windows_aarch64_msvc/0.52.6 \
     crate://crates.io/windows_i686_gnu/0.42.2 \
     crate://crates.io/windows_i686_gnu/0.48.5 \
+    crate://crates.io/windows_i686_gnu/0.52.6 \
+    crate://crates.io/windows_i686_gnullvm/0.52.6 \
     crate://crates.io/windows_i686_msvc/0.42.2 \
     crate://crates.io/windows_i686_msvc/0.48.5 \
+    crate://crates.io/windows_i686_msvc/0.52.6 \
     crate://crates.io/windows_x86_64_gnu/0.42.2 \
     crate://crates.io/windows_x86_64_gnu/0.48.5 \
+    crate://crates.io/windows_x86_64_gnu/0.52.6 \
     crate://crates.io/windows_x86_64_gnullvm/0.42.2 \
     crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
     crate://crates.io/windows_x86_64_msvc/0.42.2 \
     crate://crates.io/windows_x86_64_msvc/0.48.5 \
+    crate://crates.io/windows_x86_64_msvc/0.52.6 \
     crate://crates.io/yaml-rust/0.4.5 \
 "
 
@@ -133,11 +145,11 @@ SRC_URI[colorchoice-1.0.0.sha256sum] = "acbf1af155f9b9ef647e42cdc158db4b64a1b61f
 SRC_URI[console-0.15.7.sha256sum] = "c926e00cc70edefdc64d3a5ff31cc65bb97a3460097762bd23afb4d8145fccf8"
 SRC_URI[crossbeam-deque-0.8.3.sha256sum] = "ce6fd6f855243022dcecf8702fef0c297d4338e226845fe067f6341ad9fa0cef"
 SRC_URI[crossbeam-epoch-0.9.15.sha256sum] = "ae211234986c545741a7dc064309f67ee1e5ad243d0e48335adc0484d960bcc7"
-SRC_URI[crossbeam-utils-0.8.16.sha256sum] = "5a22b2d63d4d1dc0b7f1b6b2747dd0088008a9be28b6ddf0b1e7d335e3037294"
+SRC_URI[crossbeam-utils-0.8.23.sha256sum] = "a31eee39dddec8330830986fcd7625edb5a24ec90ea038215273bbc3adb08ac6"
 SRC_URI[difflib-0.4.0.sha256sum] = "6184e33543162437515c2e2b48714794e37845ec9851711914eec9d308f6ebe8"
 SRC_URI[either-1.15.0.sha256sum] = "48c757948c5ede0e46177b7add2e67155f70e33c07fea8284df6576da70b3719"
 SRC_URI[encode_unicode-0.3.6.sha256sum] = "a357d28ed41a50f9c765dbfe56cbc04a64e53e5fc58ba79fbc34c10ef3df831f"
-SRC_URI[errno-0.3.5.sha256sum] = "ac3e13f66a2f95e32a39eaa81f6b95d42878ca0e1db0c7543723dfe12557e860"
+SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
 SRC_URI[fastrand-2.0.1.sha256sum] = "25cbce373ec4653f1a01a31e8a5e5ec0c622dc27ff9c4e6606eefef5cbbed4a5"
 SRC_URI[fnv-1.0.7.sha256sum] = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1"
 SRC_URI[getrandom-0.2.10.sha256sum] = "be4136b2a15dd319360be1c07d9933517ccf0be8f16bf62a3bee4f0d618df427"
@@ -147,7 +159,7 @@ SRC_URI[lazy_static-1.4.0.sha256sum] = "e2abad23fbc42b3700f2f279844dc832adb2b2eb
 SRC_URI[libc-0.2.177.sha256sum] = "2874a2af47a2325c2001a6e6fad9b16a53b802102b528163885171cf92b15976"
 SRC_URI[libm-0.2.8.sha256sum] = "4ec2a862134d2a7d32d7983ddcdd1c4923530833c9f2ea1a44fc5fa473989058"
 SRC_URI[linked-hash-map-0.5.6.sha256sum] = "0717cef1bc8b636c6e1c1bbdefc09e6322da8a9321966e8928ef80d20f7f770f"
-SRC_URI[linux-raw-sys-0.4.10.sha256sum] = "da2479e8c062e40bf0066ffa0bc823de0a9368974af99c9f6df941d2c231e03f"
+SRC_URI[linux-raw-sys-0.4.15.sha256sum] = "d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab"
 SRC_URI[memchr-2.7.6.sha256sum] = "f52b00d39961fc5b2736ea853c9cc86238e165017a493d1d5c8eac6bdc4cc273"
 SRC_URI[memoffset-0.9.0.sha256sum] = "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
 SRC_URI[num-traits-0.2.17.sha256sum] = "39e3200413f237f41ab11ad6d161bc7239c84dcb631773ccd7de3dfe4b5c267c"
@@ -171,7 +183,7 @@ SRC_URI[regex-automata-0.4.13.sha256sum] = "5276caf25ac86c8d810222b3dbb938e512c5
 SRC_URI[regex-syntax-0.7.5.sha256sum] = "dbb5fb1acd8a1a18b3dd5be62d25485eb770e05afb408a9627d14d451bae12da"
 SRC_URI[regex-syntax-0.8.8.sha256sum] = "7a2d987857b319362043e95f5353c0535c1f58eec5336fdfcf626430af7def58"
 SRC_URI[roff-0.2.1.sha256sum] = "b833d8d034ea094b1ea68aa6d5c740e0d04bad9d16568d08ba6f76823a114316"
-SRC_URI[rustix-0.38.20.sha256sum] = "67ce50cb2e16c2903e30d1cbccfd8387a74b9d4c938b6a4c5ec6cc7556f7a8a0"
+SRC_URI[rustix-0.38.44.sha256sum] = "fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154"
 SRC_URI[rusty-fork-0.3.0.sha256sum] = "cb3dcc6e454c328bb824492db107ab7c0ae8fcffe4ad210136ef014458c1bc4f"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
@@ -191,22 +203,34 @@ SRC_URI[unicode-width-0.1.11.sha256sum] = "e51733f11c9c4f72aa0c160008246859e340b
 SRC_URI[utf8parse-0.2.1.sha256sum] = "711b9620af191e0cdc7468a8d14e709c3dcdb115b36f838e601583af800a370a"
 SRC_URI[wait-timeout-0.2.1.sha256sum] = "09ac3b126d3914f9849036f826e054cbabdc8519970b8998ddaf3b5bd3c65f11"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
+SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
 SRC_URI[windows-sys-0.45.0.sha256sum] = "75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0"
 SRC_URI[windows-sys-0.48.0.sha256sum] = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
+SRC_URI[windows-sys-0.59.0.sha256sum] = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
+SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
 SRC_URI[windows-targets-0.42.2.sha256sum] = "8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071"
 SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
+SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
 SRC_URI[windows_aarch64_gnullvm-0.42.2.sha256sum] = "597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8"
 SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
+SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
 SRC_URI[windows_aarch64_msvc-0.42.2.sha256sum] = "e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43"
 SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
+SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
 SRC_URI[windows_i686_gnu-0.42.2.sha256sum] = "c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f"
 SRC_URI[windows_i686_gnu-0.48.5.sha256sum] = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
+SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
+SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
 SRC_URI[windows_i686_msvc-0.42.2.sha256sum] = "44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060"
 SRC_URI[windows_i686_msvc-0.48.5.sha256sum] = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
+SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
 SRC_URI[windows_x86_64_gnu-0.42.2.sha256sum] = "8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36"
 SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
+SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
 SRC_URI[windows_x86_64_gnullvm-0.42.2.sha256sum] = "26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3"
 SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
+SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
 SRC_URI[windows_x86_64_msvc-0.42.2.sha256sum] = "9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0"
 SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
+SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
 SRC_URI[yaml-rust-0.4.5.sha256sum] = "56c1936c4cc7a1c9ab21a1ebb602eb942ba868cbd44a99cb7cdc5892335e1c85"
diff --git a/meta-oe/recipes-extended/sd/sd/0001-Cargo.lock-Update-crossbeam-utils-and-rustix.patch b/meta-oe/recipes-extended/sd/sd/0001-Cargo.lock-Update-crossbeam-utils-and-rustix.patch
new file mode 100644
index 0000000000..5db8d91931
--- /dev/null
+++ b/meta-oe/recipes-extended/sd/sd/0001-Cargo.lock-Update-crossbeam-utils-and-rustix.patch
@@ -0,0 +1,254 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 22 Oct 2026 15:30:00 -0700
+Subject: [PATCH] Cargo.lock: Update crossbeam-utils and rustix
+
+crossbeam-utils 0.8.16 decides whether 64-bit atomics are available by
+looking up the target triple in a list. Targets without 64-bit atomics
+that are not in it, e.g. riscv32 with a custom triple such as
+riscv32-yoe-linux-musl, are assumed to have them, and the build fails:
+
+  error[E0432]: unresolved imports `core::sync::atomic::AtomicI64`, `core::sync::atomic::AtomicU64`
+    --> crossbeam-utils-0.8.16/src/lib.rs:79:49
+
+Since 0.8.17 crossbeam-utils uses cfg(target_has_atomic = "64")
+instead.
+
+rustix 0.38.20 with linux-raw-sys 0.4.10 also lacks ioctl definitions
+for riscv32:
+
+  error[E0432]: unresolved imports `linux_raw_sys::ioctl::TCSETS`, `linux_raw_sys::ioctl::TCSETS2`
+  error[E0425]: cannot find value `EXT4_IOC_RESIZE_FS` in module `linux_raw_sys::ioctl`
+
+Update them with 'cargo update -p crossbeam-utils -p rustix
+-p linux-raw-sys', which moves crossbeam-utils to 0.8.23, rustix to
+0.38.44, linux-raw-sys to 0.4.15 and errno to 0.3.14, and locks the
+Windows-only dependencies of the newer rustix.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ Cargo.lock | 111 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------
+ 1 file changed, 98 insertions(+), 13 deletions(-)
+
+--- a/Cargo.lock
++++ b/Cargo.lock
+@@ -245,12 +245,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "crossbeam-utils"
+-version = "0.8.16"
++version = "0.8.23"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "5a22b2d63d4d1dc0b7f1b6b2747dd0088008a9be28b6ddf0b1e7d335e3037294"
+-dependencies = [
+- "cfg-if",
+-]
++checksum = "a31eee39dddec8330830986fcd7625edb5a24ec90ea038215273bbc3adb08ac6"
+ 
+ [[package]]
+ name = "difflib"
+@@ -272,12 +269,12 @@ checksum = "a357d28ed41a50f9c765dbfe56cbc04a64e53e5fc58ba79fbc34c10ef3df831f"
+ 
+ [[package]]
+ name = "errno"
+-version = "0.3.5"
++version = "0.3.14"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "ac3e13f66a2f95e32a39eaa81f6b95d42878ca0e1db0c7543723dfe12557e860"
++checksum = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
+ dependencies = [
+  "libc",
+- "windows-sys 0.48.0",
++ "windows-sys 0.61.2",
+ ]
+ 
+ [[package]]
+@@ -348,9 +345,9 @@ checksum = "0717cef1bc8b636c6e1c1bbdefc09e6322da8a9321966e8928ef80d20f7f770f"
+ 
+ [[package]]
+ name = "linux-raw-sys"
+-version = "0.4.10"
++version = "0.4.15"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "da2479e8c062e40bf0066ffa0bc823de0a9368974af99c9f6df941d2c231e03f"
++checksum = "d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab"
+ 
+ [[package]]
+ name = "memchr"
+@@ -565,15 +562,15 @@ checksum = "b833d8d034ea094b1ea68aa6d5c740e0d04bad9d16568d08ba6f76823a114316"
+ 
+ [[package]]
+ name = "rustix"
+-version = "0.38.20"
++version = "0.38.44"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "67ce50cb2e16c2903e30d1cbccfd8387a74b9d4c938b6a4c5ec6cc7556f7a8a0"
++checksum = "fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154"
+ dependencies = [
+  "bitflags 2.4.1",
+  "errno",
+  "libc",
+  "linux-raw-sys",
+- "windows-sys 0.48.0",
++ "windows-sys 0.59.0",
+ ]
+ 
+ [[package]]
+@@ -763,6 +760,12 @@ version = "0.11.0+wasi-snapshot-preview1"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
+ 
++[[package]]
++name = "windows-link"
++version = "0.2.1"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
++
+ [[package]]
+ name = "windows-sys"
+ version = "0.45.0"
+@@ -781,6 +784,24 @@ dependencies = [
+  "windows-targets 0.48.5",
+ ]
+ 
++[[package]]
++name = "windows-sys"
++version = "0.59.0"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
++dependencies = [
++ "windows-targets 0.52.6",
++]
++
++[[package]]
++name = "windows-sys"
++version = "0.61.2"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
++dependencies = [
++ "windows-link",
++]
++
+ [[package]]
+ name = "windows-targets"
+ version = "0.42.2"
+@@ -811,6 +832,22 @@ dependencies = [
+  "windows_x86_64_msvc 0.48.5",
+ ]
+ 
++[[package]]
++name = "windows-targets"
++version = "0.52.6"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
++dependencies = [
++ "windows_aarch64_gnullvm 0.52.6",
++ "windows_aarch64_msvc 0.52.6",
++ "windows_i686_gnu 0.52.6",
++ "windows_i686_gnullvm",
++ "windows_i686_msvc 0.52.6",
++ "windows_x86_64_gnu 0.52.6",
++ "windows_x86_64_gnullvm 0.52.6",
++ "windows_x86_64_msvc 0.52.6",
++]
++
+ [[package]]
+ name = "windows_aarch64_gnullvm"
+ version = "0.42.2"
+@@ -823,6 +860,12 @@ version = "0.48.5"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
+ 
++[[package]]
++name = "windows_aarch64_gnullvm"
++version = "0.52.6"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
++
+ [[package]]
+ name = "windows_aarch64_msvc"
+ version = "0.42.2"
+@@ -835,6 +878,12 @@ version = "0.48.5"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
+ 
++[[package]]
++name = "windows_aarch64_msvc"
++version = "0.52.6"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
++
+ [[package]]
+ name = "windows_i686_gnu"
+ version = "0.42.2"
+@@ -847,6 +896,18 @@ version = "0.48.5"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
+ 
++[[package]]
++name = "windows_i686_gnu"
++version = "0.52.6"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
++
++[[package]]
++name = "windows_i686_gnullvm"
++version = "0.52.6"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
++
+ [[package]]
+ name = "windows_i686_msvc"
+ version = "0.42.2"
+@@ -859,6 +920,12 @@ version = "0.48.5"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
+ 
++[[package]]
++name = "windows_i686_msvc"
++version = "0.52.6"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
++
+ [[package]]
+ name = "windows_x86_64_gnu"
+ version = "0.42.2"
+@@ -871,6 +938,12 @@ version = "0.48.5"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
+ 
++[[package]]
++name = "windows_x86_64_gnu"
++version = "0.52.6"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
++
+ [[package]]
+ name = "windows_x86_64_gnullvm"
+ version = "0.42.2"
+@@ -883,6 +956,12 @@ version = "0.48.5"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
+ 
++[[package]]
++name = "windows_x86_64_gnullvm"
++version = "0.52.6"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
++
+ [[package]]
+ name = "windows_x86_64_msvc"
+ version = "0.42.2"
+@@ -895,6 +974,12 @@ version = "0.48.5"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
+ 
++[[package]]
++name = "windows_x86_64_msvc"
++version = "0.52.6"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
++
+ [[package]]
+ name = "xtask"
+ version = "1.0.0"
diff --git a/meta-oe/recipes-extended/sd/sd_1.1.0.bb b/meta-oe/recipes-extended/sd/sd_1.1.0.bb
index 6dc369fff9..ea9ad65303 100644
--- a/meta-oe/recipes-extended/sd/sd_1.1.0.bb
+++ b/meta-oe/recipes-extended/sd/sd_1.1.0.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=aec69d9265f7a44821317ebe1e576f1b \
 "
 
-SRC_URI = "git://github.com/chmln/sd.git;protocol=https;nobranch=1;tag=v${PV}"
+SRC_URI = "git://github.com/chmln/sd.git;protocol=https;nobranch=1;tag=v${PV} \
+           file://0001-Cargo.lock-Update-crossbeam-utils-and-rustix.patch \
+           "
 SRCREV = "4a7b216552d64134c0fa17a59b9d557d89019f0f"
 
 inherit cargo cargo-update-recipe-crates
