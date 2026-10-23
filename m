Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1650.1792738458484386023
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fEhlgCEo;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc147d86bebso236570a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738458; x=1793343258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9NX92WLCra/4TZJYPAwXnsXMiCLhazyqqREsJ6Ytlw=;
        b=fEhlgCEoc1vJrWb3ZDs9Xfa3Qg/jNhI/ET2eEu2bN3fGEAtjnPYVu75ygX3MZT8B4e
         0EQEDNExpZbQuV2ut1W9PwvSoHf4ge9lVfSm8oEmvgcn4k24Mh/WidQ69pAfsUf+T10k
         +rAhCCRslvOsOjwBYPtGDwD3LW4abUUvWiXQaeHcy4IeZyfW/GiKwHxkqwriq8Hee/rU
         G5O1v/iwKHhPApmRPjFDnXQ+UN6EDv/UhLhWMfVYuRipdeqg65GWMKRb7+GUD3PpAXz5
         WffF5CeT6yz+2t587lJqDUnDQGDBj9UmcXDe73qUGwENM5V/Musab9PMxSUZQhmxsXh4
         6BpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738458; x=1793343258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b9NX92WLCra/4TZJYPAwXnsXMiCLhazyqqREsJ6Ytlw=;
        b=oU+2xByeWrKAL86IZSErEdBs6XS1Jp/BpgDKKa5t+IYKsvf5J+ZewlBFbrNUbWj/0F
         Mk/4vSrU0IgsJOjRPMNZxFN9HfR7mJDQYgkAGV2qxKa9Avdicmo4ms14tSCPTjgiP8bd
         /TEj1Dk2g54taYHCdwcguQA0qDJt/zyl/JmIf4d1ZoRz7emhSLoYk5X15G0edhmWGcdB
         cEoNOCw2iVoA6lOGRGb1laeJEY7DoD/T3+fpIIXufFuFj5cO1oF8R2pBLyGLa53F5VsR
         gDPmU05j+TcXgXPGSwZN6eH2saTtLT6ETzDh5HhamIF5JNLXuV28wPECbsJOViiJwSC7
         WvyA==
X-Gm-Message-State: AFq9FYLsVZqw2uzkHC1GhG+bPLe4ee1e5eMSqcoPE7lcSWaJh0lG1mNH
	X9h0XHaWBuYogEErtSU931UhwtOg6K1k7T4F1ORlP3U2qw6ulbhPZ42pBZ4maRb34Ts=
X-Gm-Gg: AYBFou1tKX66RQgRE+UkGTs1v3kBj2akTsE9fgYnLxofkdEJEFoVDgLzjpJa4NuQeNj
	y/AvOJK0e0vwPh/T/rQoZAjp1RsgFxlVyMsU6KlEtONLKCjo49AMvvWurZZoa+OwCSTkobwP+68
	5D0AUgfv+r6E5O3bWR2SrONzhJeGM2+8yZkMwPMpHN2wSzz0rzJP+3SJm1gD3Ca0yr0rQaUiusx
	0/StGX+lqeI2y+zl1yr3fNobZNcjvwmrtwD7qbPdmA61XU4IkcZEtizxJoHC6iuNaCRZ3wXKx7J
	owEw+46MNZvPInduvZUs14HbweuhYZR3feg0c10Wt+MsGxarcaeI0Iq+5bGxSo2FHJlhtFnqxzQ
	YIm2mdMbz/ZnZpV0FnbWfs5plVfR2MLWRgaUo2zxd+aTPu3Mw3x+Uz7AAqCn0IaMgkiONgJ894j
	srPu3VigOJAW748M4xkUMNtSTZx5q4iXmKdJVGjXrx4uavtNeEaJkroXTI/mLWlje5+QPx36mmb
	kZgyd2mkegG1Cx0GsP2SOG1bhlTSozyYZ8d2K1zDeiVEK9PrCjJ3v7Oo84XN9v9oCxlcr638qeR
	v2d76xjaqLMu0xgxKqApsSDF0u7/DjfEf5ziT3U6GXHBe5xWhpc2wCPePARwZMSq/UBkU3Qnjbh
	x/lWQ3LvaygKQDPkuHpv3AvZ3rjMZl9hFbKfzv26Rbqgm3XS1CYOlEfqcApEdMYvbgsOxe++3AA
	EYAdvUmK2WGz5EhMyM4Ieu4P/zR01o3rGgy2X0lZgrpH4rMGTvLUMArkLlthtY7hxnQNpaK8R7k
	mzlKXeLnS4dSr+vjmrokTROpjZ4EKk=
X-Received: by 2002:a05:6300:8045:b0:3e1:3734:63e0 with SMTP id adf61e73a8af0-3e37672f4e1mr709321637.41.1792738457697;
        Thu, 22 Oct 2026 23:54:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:54:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 20/29] nushell: Upgrade 0.116.0 -> 0.116.1
Date: Thu, 22 Oct 2026 23:53:41 -0700
Message-ID: <20261023065350.3228996-20-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131344
Content-Type: text/plain; charset="utf-8"

Regenerate nushell-crates.inc with 'bitbake -c update_crates'.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../nushell/nushell-crates.inc                | 138 +++++++++---------
 ...{nushell_0.116.0.bb => nushell_0.116.1.bb} |   2 +-
 2 files changed, 71 insertions(+), 69 deletions(-)
 rename meta-oe/recipes-extended/nushell/{nushell_0.116.0.bb => nushell_0.116.1.bb} (89%)

diff --git a/meta-oe/recipes-extended/nushell/nushell-crates.inc b/meta-oe/recipes-extended/nushell/nushell-crates.inc
index 983b4bc13c..614ffff8d5 100644
--- a/meta-oe/recipes-extended/nushell/nushell-crates.inc
+++ b/meta-oe/recipes-extended/nushell/nushell-crates.inc
@@ -168,6 +168,7 @@ SRC_URI += " \
     crate://crates.io/fastrand/2.3.0 \
     crate://crates.io/fax/0.2.6 \
     crate://crates.io/fax_derive/0.2.0 \
+    crate://crates.io/fd-lock/4.0.4 \
     crate://crates.io/fdeflate/0.3.7 \
     crate://crates.io/fff-grep/0.11.0 \
     crate://crates.io/fff-notify-debouncer-full/0.9.4 \
@@ -338,7 +339,7 @@ SRC_URI += " \
     crate://crates.io/miniz_oxide/0.8.9 \
     crate://crates.io/mio/1.2.0 \
     crate://crates.io/moxcms/0.8.1 \
-    crate://crates.io/mq-markdown/0.8.4 \
+    crate://crates.io/mq-markdown/0.9.2 \
     crate://crates.io/multipart-rs/0.2.3 \
     crate://crates.io/native-tls/0.2.18 \
     crate://crates.io/ndarray/0.17.2 \
@@ -354,37 +355,37 @@ SRC_URI += " \
     crate://crates.io/notify-types/2.1.0 \
     crate://crates.io/ntapi/0.4.3 \
     crate://crates.io/nu-ansi-term/0.50.3 \
-    crate://crates.io/nu-cli/0.116.0 \
-    crate://crates.io/nu-cmd-base/0.116.0 \
-    crate://crates.io/nu-cmd-extra/0.116.0 \
-    crate://crates.io/nu-cmd-lang/0.116.0 \
-    crate://crates.io/nu-cmd-plugin/0.116.0 \
-    crate://crates.io/nu-color-config/0.116.0 \
-    crate://crates.io/nu-command/0.116.0 \
-    crate://crates.io/nu-config/0.116.0 \
-    crate://crates.io/nu-dap/0.116.0 \
-    crate://crates.io/nu-derive-value/0.116.0 \
-    crate://crates.io/nu-engine/0.116.0 \
-    crate://crates.io/nu-experimental/0.116.0 \
-    crate://crates.io/nu-explore/0.116.0 \
-    crate://crates.io/nu-glob/0.116.0 \
-    crate://crates.io/nu-heavy-utils/0.116.0 \
-    crate://crates.io/nu-json/0.116.0 \
-    crate://crates.io/nu-lsp/0.116.0 \
-    crate://crates.io/nu-mcp/0.116.0 \
-    crate://crates.io/nu-parser/0.116.0 \
-    crate://crates.io/nu-path/0.116.0 \
-    crate://crates.io/nu-plugin-core/0.116.0 \
-    crate://crates.io/nu-plugin-engine/0.116.0 \
-    crate://crates.io/nu-plugin-protocol/0.116.0 \
-    crate://crates.io/nu-pretty-hex/0.116.0 \
-    crate://crates.io/nu-protocol/0.116.0 \
-    crate://crates.io/nu-std/0.116.0 \
-    crate://crates.io/nu-system/0.116.0 \
-    crate://crates.io/nu-table/0.116.0 \
-    crate://crates.io/nu-term-grid/0.116.0 \
-    crate://crates.io/nu-tui/0.116.0 \
-    crate://crates.io/nu-utils/0.116.0 \
+    crate://crates.io/nu-cli/0.116.1 \
+    crate://crates.io/nu-cmd-base/0.116.1 \
+    crate://crates.io/nu-cmd-extra/0.116.1 \
+    crate://crates.io/nu-cmd-lang/0.116.1 \
+    crate://crates.io/nu-cmd-plugin/0.116.1 \
+    crate://crates.io/nu-color-config/0.116.1 \
+    crate://crates.io/nu-command/0.116.1 \
+    crate://crates.io/nu-config/0.116.1 \
+    crate://crates.io/nu-dap/0.116.1 \
+    crate://crates.io/nu-derive-value/0.116.1 \
+    crate://crates.io/nu-engine/0.116.1 \
+    crate://crates.io/nu-experimental/0.116.1 \
+    crate://crates.io/nu-explore/0.116.1 \
+    crate://crates.io/nu-glob/0.116.1 \
+    crate://crates.io/nu-heavy-utils/0.116.1 \
+    crate://crates.io/nu-json/0.116.1 \
+    crate://crates.io/nu-lsp/0.116.1 \
+    crate://crates.io/nu-mcp/0.116.1 \
+    crate://crates.io/nu-parser/0.116.1 \
+    crate://crates.io/nu-path/0.116.1 \
+    crate://crates.io/nu-plugin-core/0.116.1 \
+    crate://crates.io/nu-plugin-engine/0.116.1 \
+    crate://crates.io/nu-plugin-protocol/0.116.1 \
+    crate://crates.io/nu-pretty-hex/0.116.1 \
+    crate://crates.io/nu-protocol/0.116.1 \
+    crate://crates.io/nu-std/0.116.1 \
+    crate://crates.io/nu-system/0.116.1 \
+    crate://crates.io/nu-table/0.116.1 \
+    crate://crates.io/nu-term-grid/0.116.1 \
+    crate://crates.io/nu-tui/0.116.1 \
+    crate://crates.io/nu-utils/0.116.1 \
     crate://crates.io/nucleo-matcher/0.3.1 \
     crate://crates.io/num-bigint/0.4.8 \
     crate://crates.io/num-complex/0.4.6 \
@@ -394,7 +395,7 @@ SRC_URI += " \
     crate://crates.io/num-traits/0.2.19 \
     crate://crates.io/num_cpus/1.17.0 \
     crate://crates.io/num_threads/0.1.7 \
-    crate://crates.io/nuon/0.116.0 \
+    crate://crates.io/nuon/0.116.1 \
     crate://crates.io/objc2/0.6.4 \
     crate://crates.io/objc2-app-kit/0.3.2 \
     crate://crates.io/objc2-core-foundation/0.3.2 \
@@ -500,7 +501,7 @@ SRC_URI += " \
     crate://crates.io/redox_syscall/0.5.18 \
     crate://crates.io/redox_users/0.4.6 \
     crate://crates.io/redox_users/0.5.2 \
-    crate://crates.io/reedline/0.52.0 \
+    crate://crates.io/reedline/0.52.1 \
     crate://crates.io/ref-cast/1.0.25 \
     crate://crates.io/ref-cast-impl/1.0.25 \
     crate://crates.io/regex/1.13.1 \
@@ -970,6 +971,7 @@ SRC_URI[fast-float2-0.2.3.sha256sum] = "f8eb564c5c7423d25c886fb561d1e4ee69f72354
 SRC_URI[fastrand-2.3.0.sha256sum] = "37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be"
 SRC_URI[fax-0.2.6.sha256sum] = "f05de7d48f37cd6730705cbca900770cab77a89f413d23e100ad7fad7795a0ab"
 SRC_URI[fax_derive-0.2.0.sha256sum] = "a0aca10fb742cb43f9e7bb8467c91aa9bcb8e3ffbc6a6f7389bb93ffc920577d"
+SRC_URI[fd-lock-4.0.4.sha256sum] = "0ce92ff622d6dadf7349484f42c93271a0d49b7cc4d466a936405bacbe10aa78"
 SRC_URI[fdeflate-0.3.7.sha256sum] = "1e6853b52649d4ac5c0bd02320cddc5ba956bdb407c4b75a2c6b75bf51500f8c"
 SRC_URI[fff-grep-0.11.0.sha256sum] = "d75a741baa9142c1cbe7df7948d93a809296cd3a28f5c117964a0048b4711258"
 SRC_URI[fff-notify-debouncer-full-0.9.4.sha256sum] = "29a4ebea7b8a2840cd59358bbf396f6f04313ce8eae84ac79703ce80298b8731"
@@ -1140,7 +1142,7 @@ SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb
 SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
 SRC_URI[mio-1.2.0.sha256sum] = "50b7e5b27aa02a74bac8c3f23f448f8d87ff11f92d3aac1a6ed369ee08cc56c1"
 SRC_URI[moxcms-0.8.1.sha256sum] = "bb85c154ba489f01b25c0d36ae69a87e4a1c73a72631fc6c0eb6dde34a73e44b"
-SRC_URI[mq-markdown-0.8.4.sha256sum] = "60b3228804efb8c2181f53306951ac77ea471fcb5812e8c44a1b6dfbdfdc8c77"
+SRC_URI[mq-markdown-0.9.2.sha256sum] = "dec960d112bb48d7ae31c2ad17ce8028c0df32909550ab78b183f49f39533e04"
 SRC_URI[multipart-rs-0.2.3.sha256sum] = "7161f77c3118271d59b61f0f3b7e8cf0c97c6217b33b36f33b6b64a38c9e466a"
 SRC_URI[native-tls-0.2.18.sha256sum] = "465500e14ea162429d264d44189adc38b199b62b1c21eea9f69e4b73cb03bbf2"
 SRC_URI[ndarray-0.17.2.sha256sum] = "520080814a7a6b4a6e9070823bb24b4531daac8c4627e08ba5de8c5ef2f2752d"
@@ -1156,37 +1158,37 @@ SRC_URI[notify-debouncer-full-0.7.0.sha256sum] = "c02b49179cfebc9932238d04d60799
 SRC_URI[notify-types-2.1.0.sha256sum] = "42b8cfee0e339a0337359f3c88165702ac6e600dc01c0cc9579a92d62b08477a"
 SRC_URI[ntapi-0.4.3.sha256sum] = "c3b335231dfd352ffb0f8017f3b6027a4917f7df785ea2143d8af2adc66980ae"
 SRC_URI[nu-ansi-term-0.50.3.sha256sum] = "7957b9740744892f114936ab4a57b3f487491bbeafaf8083688b16841a4240e5"
-SRC_URI[nu-cli-0.116.0.sha256sum] = "6570550e605525f1cfe9a7a697b7bddc32e6301e45bfeb9ecbdb20a923c750f7"
-SRC_URI[nu-cmd-base-0.116.0.sha256sum] = "8d403d355533cab3632bb096057170944a9f3dd98bd0e39af8732461c9450a21"
-SRC_URI[nu-cmd-extra-0.116.0.sha256sum] = "9b0529eb952199a547ac4c334fede0904be0d197a71d0a442c2f6650a1143018"
-SRC_URI[nu-cmd-lang-0.116.0.sha256sum] = "034750773b823d35dfbd400311462941dd2feb60ba044441ae202fb3cb1e711c"
-SRC_URI[nu-cmd-plugin-0.116.0.sha256sum] = "2a3455969656165b9b0dd2ad4c668d63c11b8498d6fbc594b99f5bb1a59878c7"
-SRC_URI[nu-color-config-0.116.0.sha256sum] = "cd97b9d3e6b03441731486f1df1c166e3b61ede16d5b9c7c6a24af055b6ffa39"
-SRC_URI[nu-command-0.116.0.sha256sum] = "6d13594e4df771c8b6e27c20995dfc40b79630bedf405a626e477c017c4d5b9b"
-SRC_URI[nu-config-0.116.0.sha256sum] = "6d3fe11ee1f9de20cee8ab2561cf14a430a5c6f3f6554aa73794e2c87c16b0f8"
-SRC_URI[nu-dap-0.116.0.sha256sum] = "a4d2497958cfefadb3bb1477fb3e8b1266f3f7eccdda29a78ee9a20bc36c1f0c"
-SRC_URI[nu-derive-value-0.116.0.sha256sum] = "32651d59f8579b64970010cac1c7bc13e9a2ccfe0c061f2b3b7796d2db04fe39"
-SRC_URI[nu-engine-0.116.0.sha256sum] = "d8d80da5ef844cd5f374d35d5d390acffbac5ac7035b828bebc72940c1d43c32"
-SRC_URI[nu-experimental-0.116.0.sha256sum] = "9c046460a3c0c96b32a9519562c4a2fa8c66c590c038f3686c5e0470ff4deb4e"
-SRC_URI[nu-explore-0.116.0.sha256sum] = "8dab2020c12e810dc7e4b8bab2d47b90ade4602bb9df7bff9f7d42dbcb4e9e10"
-SRC_URI[nu-glob-0.116.0.sha256sum] = "59992a8e53b42db38bc70b4097a14ccfce49ef499b24e6e154f2acf684d09567"
-SRC_URI[nu-heavy-utils-0.116.0.sha256sum] = "4926ad4ce6ed9f130fec8f58f7ebf2c83b737a04dde2dbd1a919871138a50fde"
-SRC_URI[nu-json-0.116.0.sha256sum] = "cc6fbb878e74468e120c384f0b4cb34eb73aeb09df1f4f6d37f4848a46201381"
-SRC_URI[nu-lsp-0.116.0.sha256sum] = "3ed2dd36f36be56c57d91222f3739016df48b588e1916f1eceec3e7bd9506cdd"
-SRC_URI[nu-mcp-0.116.0.sha256sum] = "4239ad82d8ab8abbb111c90aef01482eb6bc1f90f793a644b5cb158e6abf61ba"
-SRC_URI[nu-parser-0.116.0.sha256sum] = "b429d18313c2848494e7dbce8c84d5508103ca4ecbf6b20887b4f8c3c2805e80"
-SRC_URI[nu-path-0.116.0.sha256sum] = "d730f139821e0d141449e718a958580a29fe68eb20344d33cd9855b62886b053"
-SRC_URI[nu-plugin-core-0.116.0.sha256sum] = "a74fa87014d0a9d854e1b12953049ed59139dd41b762bd655036319118490372"
-SRC_URI[nu-plugin-engine-0.116.0.sha256sum] = "aeff109af2f7f2023e7ae91d2f13e6d20bb8439b73dc97675a201063d1842ea7"
-SRC_URI[nu-plugin-protocol-0.116.0.sha256sum] = "7bfc146873f7f6bb83fdbb8b176f2740a916e69e6eb8ebcc1aad51141f35359a"
-SRC_URI[nu-pretty-hex-0.116.0.sha256sum] = "512eeca582f1ed87801d9909d8fee0c70e39203a703a9d5417990733dc940deb"
-SRC_URI[nu-protocol-0.116.0.sha256sum] = "1b99f900ca528b33629b6dbe6c1b992fe9c14f36873fb3ac713cac56e05cb7fb"
-SRC_URI[nu-std-0.116.0.sha256sum] = "cfc25b4a9a83fb29dca630c52c45f267ca3b1f79290ac9b80320031994237ad2"
-SRC_URI[nu-system-0.116.0.sha256sum] = "2670185f7a4680a5fb000caf50bb34cecc5be0c79e9d55179809966e72b6a4eb"
-SRC_URI[nu-table-0.116.0.sha256sum] = "1405925669f67f5a3afb0c9643e98fdf0af94bfcfb0f03430a3e9aee7ca91716"
-SRC_URI[nu-term-grid-0.116.0.sha256sum] = "22e965a3b3c6654012bdf4992b3ad95d3189237b73b141d17294a46a1579f7b5"
-SRC_URI[nu-tui-0.116.0.sha256sum] = "677e4e0d26ecce0fa35326b21e2fc2fe02ab605e62c33fe9fedf67d9c1b3f0a2"
-SRC_URI[nu-utils-0.116.0.sha256sum] = "6103ba8cd3fdf2ed36d46a8908347b17fb6a3be1151de974ceb1b8cce54a0af4"
+SRC_URI[nu-cli-0.116.1.sha256sum] = "e3210a5075ebd0259b166602224a8ff2f4dc92305bf02c9dc6e5e7346583d530"
+SRC_URI[nu-cmd-base-0.116.1.sha256sum] = "6a344cc88e5548048b6758980876540f198f4954e6ac0b8ce23da06534067012"
+SRC_URI[nu-cmd-extra-0.116.1.sha256sum] = "270d811b97a4e5402fd948dd84467e123093b6b425ef7c2fc7e8f84191465db3"
+SRC_URI[nu-cmd-lang-0.116.1.sha256sum] = "20ede2fc8e7a07cad1b08866a6ec8eb0c74701b76200051150e3d3ad663b37ce"
+SRC_URI[nu-cmd-plugin-0.116.1.sha256sum] = "06ca340ef0473ccddf792ded1b4bf45593c889e2e955c61974adcfb0b219f8c7"
+SRC_URI[nu-color-config-0.116.1.sha256sum] = "3ab851824e4e070c32051fb308f12119f53b17c8dfe89295f5b8a322bb86ff4b"
+SRC_URI[nu-command-0.116.1.sha256sum] = "2013739bfb07cd24b3b79e10e573d571f9f80fe67ba0d56d860cbc0e290d7a7a"
+SRC_URI[nu-config-0.116.1.sha256sum] = "3cf2614395b32b611aab1144863d74a00cc88a58ce613f4c37fb00685be676da"
+SRC_URI[nu-dap-0.116.1.sha256sum] = "18306abb507bd0b2e8b089e4d97a6a0cb1ea96063cdfd8f85a590fa12427b0f2"
+SRC_URI[nu-derive-value-0.116.1.sha256sum] = "f8afb8851aef3f821c99450af47563ebf477da7d8e0191332c3253cbca038cf5"
+SRC_URI[nu-engine-0.116.1.sha256sum] = "9624a038a70668003d9ef579c9d58c5c6b7c4b71e91518441ca51e004367d01e"
+SRC_URI[nu-experimental-0.116.1.sha256sum] = "8900751ec5ddae2757ec9f8095b7c11ab470e84e689b2ff8ac4d945b4f2f4ef0"
+SRC_URI[nu-explore-0.116.1.sha256sum] = "180d1183f62349a79b72f68f062646542ffaafba1d027231b25cf7d6e0ae5e80"
+SRC_URI[nu-glob-0.116.1.sha256sum] = "562d41b0098df79d66e5a47537744ea901954260c23e7515f2117ebac6246fad"
+SRC_URI[nu-heavy-utils-0.116.1.sha256sum] = "0dad35ba4060a6977c07dd98efff7bf57a35c8a11617abb313e48e9dc0580fbc"
+SRC_URI[nu-json-0.116.1.sha256sum] = "b0705efa4067d8ff9f580377651012b15aa002250fb18189e70fc0711cfe8af0"
+SRC_URI[nu-lsp-0.116.1.sha256sum] = "2c19194bfe2a57e44c2e564f7b43642a6178e19db0e09416c13c82f8818668d3"
+SRC_URI[nu-mcp-0.116.1.sha256sum] = "c8b43b92b8846b65520a44e5e61f24e552f510da9cd928659585a83836482694"
+SRC_URI[nu-parser-0.116.1.sha256sum] = "e2daa0ec931818191d23e8a6cdcc28821ad2aeb9b466f84195c93d28cf9929dd"
+SRC_URI[nu-path-0.116.1.sha256sum] = "0909df2d047a887b37329b463d1a852246d40900bfd244f93ce32f4e3e3be7d3"
+SRC_URI[nu-plugin-core-0.116.1.sha256sum] = "fd20c167e7cebb67073c43f6812d7d9c83ea195143eae53619323ae4a4ec60db"
+SRC_URI[nu-plugin-engine-0.116.1.sha256sum] = "eba904d2e6d05bf9637bc6ca39cdc046c68f791984f8e5311629202bc56b56be"
+SRC_URI[nu-plugin-protocol-0.116.1.sha256sum] = "7fd0f06dff8d83274e19ed25af59204fb3b6e924c931636bb1a2745d88ac8458"
+SRC_URI[nu-pretty-hex-0.116.1.sha256sum] = "3cfc84ce8e31c2ff81ef96c031e8c5fb5306d71fa463d45ba063cc7dbcbfe62e"
+SRC_URI[nu-protocol-0.116.1.sha256sum] = "5516ed558d0e31509c62b41fabe4f7f08c9161ff9a77131f9320f1187cc9015c"
+SRC_URI[nu-std-0.116.1.sha256sum] = "3957dfe8a889daab2434883a000162a0fc8a516bae7c38b9ea325cea8eb5e650"
+SRC_URI[nu-system-0.116.1.sha256sum] = "a5b98a8adf1e469b19c80d24253f6c6de2685a3c358b56ae5b55629c55185657"
+SRC_URI[nu-table-0.116.1.sha256sum] = "9c7a89377ef569a6890d82dc981407c4da5dc2112c24343237c792949d33b618"
+SRC_URI[nu-term-grid-0.116.1.sha256sum] = "4f2639db435b9140a3e5dd295bb2c63e51cea28edcadb63749ed71077439d5be"
+SRC_URI[nu-tui-0.116.1.sha256sum] = "aa87f21a3095fd4b20a2e0d5070f97ee025072098e47cef5ccc2d723e7ad6c14"
+SRC_URI[nu-utils-0.116.1.sha256sum] = "84f521367a3e9a70ce78759106801961f108f1bad9b80ec9195fcb5eec3a1d85"
 SRC_URI[nucleo-matcher-0.3.1.sha256sum] = "bf33f538733d1a5a3494b836ba913207f14d9d4a1d3cd67030c5061bdd2cac85"
 SRC_URI[num-bigint-0.4.8.sha256sum] = "c89e69e7e0f03bea5ef08013795c25018e101932225a656383bd384495ecc367"
 SRC_URI[num-complex-0.4.6.sha256sum] = "73f88a1307638156682bada9d7604135552957b7818057dcef22705b4d509495"
@@ -1196,7 +1198,7 @@ SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbc
 SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
 SRC_URI[num_cpus-1.17.0.sha256sum] = "91df4bbde75afed763b708b7eee1e8e7651e02d97f6d5dd763e89367e957b23b"
 SRC_URI[num_threads-0.1.7.sha256sum] = "5c7398b9c8b70908f6371f47ed36737907c87c52af34c268fed0bf0ceb92ead9"
-SRC_URI[nuon-0.116.0.sha256sum] = "0f4472dbed55ae72213a3941fd8b15ce5898eda9c0dc83af61750347812798e6"
+SRC_URI[nuon-0.116.1.sha256sum] = "7fb566b628d1806c6b2b5fbe7358bade2c5c3732832c7fd86e480f4970be51d7"
 SRC_URI[objc2-0.6.4.sha256sum] = "3a12a8ed07aefc768292f076dc3ac8c48f3781c8f2d5851dd3d98950e8c5a89f"
 SRC_URI[objc2-app-kit-0.3.2.sha256sum] = "d49e936b501e5c5bf01fda3a9452ff86dc3ea98ad5f283e1455153142d97518c"
 SRC_URI[objc2-core-foundation-0.3.2.sha256sum] = "2a180dd8642fa45cdb7dd721cd4c11b1cadd4929ce112ebd8b9f5803cc79d536"
@@ -1302,7 +1304,7 @@ SRC_URI[recvmsg-1.0.0.sha256sum] = "d3edd4d5d42c92f0a659926464d4cce56b562761267e
 SRC_URI[redox_syscall-0.5.18.sha256sum] = "ed2bf2547551a7053d6fdfafda3f938979645c44812fbfcda098faae3f1a362d"
 SRC_URI[redox_users-0.4.6.sha256sum] = "ba009ff324d1fc1b900bd1fdb31564febe58a8ccc8a6fdbb93b543d33b13ca43"
 SRC_URI[redox_users-0.5.2.sha256sum] = "a4e608c6638b9c18977b00b475ac1f28d14e84b27d8d42f70e0bf1e3dec127ac"
-SRC_URI[reedline-0.52.0.sha256sum] = "3798f88894590a7acdc9a25936605efbde199641f31e8d99248fce72e535638a"
+SRC_URI[reedline-0.52.1.sha256sum] = "cc0282eb061a7d039435f10075f22988e0dd7468901ee247a803021786afc662"
 SRC_URI[ref-cast-1.0.25.sha256sum] = "f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d"
 SRC_URI[ref-cast-impl-1.0.25.sha256sum] = "b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da"
 SRC_URI[regex-1.13.1.sha256sum] = "f020237b6c8eed93db2e2cb53c00c60a8e1bc73da7d073199a1180401450218d"
diff --git a/meta-oe/recipes-extended/nushell/nushell_0.116.0.bb b/meta-oe/recipes-extended/nushell/nushell_0.116.1.bb
similarity index 89%
rename from meta-oe/recipes-extended/nushell/nushell_0.116.0.bb
rename to meta-oe/recipes-extended/nushell/nushell_0.116.1.bb
index 32c98f1086..9cb9ff917d 100644
--- a/meta-oe/recipes-extended/nushell/nushell_0.116.0.bb
+++ b/meta-oe/recipes-extended/nushell/nushell_0.116.1.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = " \
 DEPENDS = "libgit2 sqlite3"
 
 SRC_URI = "crate://crates.io/nu/${PV};name=nu"
-SRC_URI[nu.sha256sum] = "ce8b0012733f646693ff5a203face7b0337135ffa809f119dfadd8c9f1f9a176"
+SRC_URI[nu.sha256sum] = "62e21f2d6a14430ae2701a4e6f11be42d40a11204c204bef32a8b9879f79e767"
 
 S = "${CARGO_VENDORING_DIRECTORY}/nu-${PV}"
 
