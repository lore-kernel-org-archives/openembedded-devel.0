Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26DAC8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 19:57:38 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.5587.1752004650313075317
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 12:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eV2TiNJi;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32b5226e6beso43787871fa.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 12:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752004648; x=1752609448; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D+aHBOGgTdjzHN7Lz837fNO/tGR0yp/L65WkrzJ7siw=;
        b=eV2TiNJiHft1sK9uoKm6auZS/tneeRi3pE1slZ9MEStZTXZ93cTmny8aeBuVNL9CgX
         IDZUIlH/lMfGCoFYnWMATXNasoOh5a3I5TBX0aWwECzpbq9SGiQtW/RR1IXBShS/DcRf
         /n1pKIwWhnmFx04n1e+6nrm19LRU59iyfZhi/obGNrcBLilh8DV917ic9YsVMYYTKckU
         y079xevp61vn+4hrWl54SlYCbyW4Vw3pp+P2nP+H+7C9b2f/zHEvksD3Arg1NTfkDjVc
         mgu1wsSCkSAC0nJu96mjbcF9u0+3tU0tUCxe41XTxQfO8Y7XOpHX28x8fw1GRAmemT/H
         tlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752004648; x=1752609448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+aHBOGgTdjzHN7Lz837fNO/tGR0yp/L65WkrzJ7siw=;
        b=pWo6ugmZQSgE/Qab4jbajm4osiaF/fuLFPtLSfi/6F1Idh20rXPLe6u+P2iFv+h9eK
         CTn9KhjjJoM8CxO/V3Zfk4uSkqtayQFYFBorchO26QhNGM4JZLKxQv/0sPcjCtOJGt9H
         mdFmnI37buLsZUWXDAmhnFeX0qPFlm/l+8BQBe+5vNKhsM9J3eo0SWej5fdbowH6MxCe
         VAZue4TA8TYrPX/vVo2ooBK+vi79606YUHgewAiXNOXMfqN4n6wMKcS266EEvCwqqWdl
         ab/Ye7tZcD+QZuDC9builZEU9zvpnI5wdMQtI616inK+y3OLESNDd0Frfg54PNRD50GC
         9tXg==
X-Gm-Message-State: AOJu0Yz3zBCAKX5Pwfur3pGifWkDY2FCLZ64WibfTBqCKoT085IT5fDN
	SIqd+ZYkrJ8TAj53akTCcaZKCW3q4vpxT2Mv5GLRa/kc4hWNeSYneI4FZ4y/4A==
X-Gm-Gg: ASbGncuhzQUVk4Hui0w0iKTAmTw5vTWLylHl1NwSxI2wWLBlO0Yx0cw0+s35eLMeb7J
	VYIlh65283FK+NP19cI0BLcB6AiXMacZkOAIzGdrIbsiAMsDzTHdELJhdK40fPalNTeAcizLWV7
	GEa1VJ6WAurzY3q+KPeduVQhmfjBXftUCrOW75SpMr7/q1qhZ5DrWAEumE3OCq2MxmRMGwyvF+C
	5LNqyRFQfcdeXhToddqkMKScXgISVbB/3AyYSCQbOOSHvLeILxT0j05jq9Oa9T6opXTdIPzGqyi
	Y4yKHSPXgfL+MogGnHlNmXwrX1hIp+EHnr8VG/jJHuq9CMI5neEUTNLZwguEDkYPCAwnK5N9j/o
	TCe0=
X-Google-Smtp-Source: AGHT+IE+h18l+5MoVBZ98ZSeYic8UydwA1n8a1s0MUn8NuFwVTDjUuVZA13gDfelmag48/d2Fjp51A==
X-Received: by 2002:a05:651c:3255:10b0:32b:3104:f89c with SMTP id 38308e7fff4ca-32f092ed51emr42144521fa.29.1752004647685;
        Tue, 08 Jul 2025 12:57:27 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1aff3debsm16003981fa.44.2025.07.08.12.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 12:57:27 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 01/20] cannelloni: Upgrade 1.1.0 -> 2.0.0 to allow CMake 4+ compatibility
Date: Tue,  8 Jul 2025 22:56:17 +0300
Message-ID: <20250708195636.1678606-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 19:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118323

- Drop 0001-include-bits-stdc-.h-only-when-using-libstdc.patch because already fixed in newer version.

Changelog:

https://github.com/mguentner/cannelloni/compare/v1.1.0...v2.0.0

Fix:

| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 ...bits-stdc-.h-only-when-using-libstdc.patch | 37 -------------------
 ...annelloni_1.1.0.bb => cannelloni_2.0.0.bb} |  7 +---
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-include-bits-stdc-.h-only-when-using-libstdc.patch
 rename meta-networking/recipes-connectivity/cannelloni/{cannelloni_1.1.0.bb => cannelloni_2.0.0.bb} (71%)

diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-include-bits-stdc-.h-only-when-using-libstdc.patch b/meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-include-bits-stdc-.h-only-when-using-libstdc.patch
deleted file mode 100644
index 71f447c94b..0000000000
--- a/meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-include-bits-stdc-.h-only-when-using-libstdc.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 7aed36765ae44b41ede7e139da0a11b3696f2e06 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Nov 2023 00:07:23 -0800
-Subject: [PATCH] include bits/stdc++.h only when using libstdc++
-
-We have other c++ runtime implementations e.g. llvm's libc++ which does
-not provide this header bits/stdc++.h, therefore make sure that this
-header is only included when using libstdc++
-
-Fixes
-| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/cannelloni/1.1.0/git/tcpthread.cpp:27:10: fatal error: 'bits/stdc++.h' file not found
-|    27 | #include <bits/stdc++.h>
-|       |          ^~~~~~~~~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/mguentner/cannelloni/pull/56]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tcpthread.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tcpthread.cpp b/tcpthread.cpp
-index a1b3047..bb5a7b2 100644
---- a/tcpthread.cpp
-+++ b/tcpthread.cpp
-@@ -24,7 +24,9 @@
- #include <cstdint>
- #include <cstdio>
- 
-+#ifdef __GLIBCXX__
- #include <bits/stdc++.h>
-+#endif
- 
- #include <linux/can.h>
- #include <string.h>
--- 
-2.42.1
-
diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb b/meta-networking/recipes-connectivity/cannelloni/cannelloni_2.0.0.bb
similarity index 71%
rename from meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
rename to meta-networking/recipes-connectivity/cannelloni/cannelloni_2.0.0.bb
index 835f33055a..287c7685e4 100644
--- a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
+++ b/meta-networking/recipes-connectivity/cannelloni/cannelloni_2.0.0.bb
@@ -2,15 +2,12 @@ SUMMARY = "a SocketCAN over Ethernet tunnel"
 HOMEPAGE = "https://github.com/mguentner/cannelloni"
 LICENSE = "GPL-2.0-only"
 
-SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https;branch=master \
-           file://0001-include-bits-stdc-.h-only-when-using-libstdc.patch \
-          "
-SRCREV = "3d4fb8c8b07f6d7c62b2bdad7e5a94de61c9a29b"
+SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https;branch=master"
+SRCREV = "9f649ef21710999c6f674bc3d914ab2e88363bac"
 
 LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit cmake
 
-
 PACKAGECONFIG ??= "lksctp-tools"
 PACKAGECONFIG[lksctp-tools] = "-DSCTP_SUPPORT=true, -DSCTP_SUPPORT=false, lksctp-tools"
-- 
2.43.0


