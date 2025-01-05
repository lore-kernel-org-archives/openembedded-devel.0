Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBD9E7719A
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:06 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.48481.1736119440348542303
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LPCbsGsE;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e46ebe19489so17390209276.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119439; x=1736724239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yoaUcOXSjjyll5m/DymN7CoBFOesOl5uqO/HIbwn7aU=;
        b=LPCbsGsE0YdObby/RHzBjMH4xXhKnO+pyLFU03hL1hoNN9FGBJNj9abEueNLyA6IgI
         APMbZKSCqt0d2cpBqifScb6kPedLKa7mbCvrWDOZ9e7jgnFB1nTL/TRKbgOZhAXoHGuH
         8Ye0OhFsO+ujW7yTs4OcK88L0ZuTrSudciXlD/7bXuY+3a5r3NR9LpLzfhp04HJ/oNcT
         Aia0y9J2YL3+szisG+UW+kIwsFDj5PIWssPp1zyONsw5uYldD9/GyBdfqdhTaJeEYcg8
         EtbHBOx0cNv6EP/QZql2sUPkCKzQDD8tUOuRirwADhyLwBkF31gCC1mYfP8GEKI9ztZg
         80TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119439; x=1736724239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yoaUcOXSjjyll5m/DymN7CoBFOesOl5uqO/HIbwn7aU=;
        b=bF2zgB420rjjytnsAdtf2MEijqFUVhSp4++b+DG6g8QpLrYLVpADUcYZN2lvreiQQG
         hdAT1zPL9+OdHr8ehuNeBay3zHQ5jruCQ6/+g+yNdqbCa6gWSlblAxDXWrJgMqqdJ5d5
         +PaovT6jjgCttcqaoHwnIFrjQUiPbFGkRONfhh2M9G1e5/KkSynaw/O/UmqeRR6Kja+v
         gH9pClOACVsKojmI/CKrqYqRDfiyJzLB9pqgDCA3iqNx+5VJLG6KBnsiv456nkSeXbad
         n3RnCzF5kE3UG9EWsZAMb85i6JK03ZEoVWbjX9VxVwYNyqREXFH6DXifCuO63CH1xLM4
         R6ww==
X-Gm-Message-State: AOJu0YwX99ceHuaAii6YfJXnWffqeb/AARPDX8SCLh+btmMimV31EonP
	vfwDxWx4Hb5QwF31dMEJ+HTp6+6eRUeP4nQ5prKj3fOzvIVvFpwYNEkkvpXg
X-Gm-Gg: ASbGncv8Mt/6yQT/M7ndGFg9snn5JjerKSsrYNAiimyBmuaZ1+efNIBAx5rRsuceK1h
	aW2n0O5mHRBRUWytgZMI1q0QZNVnYfUk3d+phhgQ7PcSDvZ+i57wzlWJeG5SFP6iR0jqhTfv/0u
	dLEoArMoGXBPBFOWZ1dEOtjHWk+UzE9X3cptY7lA5hM1slAhCkeBbNi+/ZFGWTWoivWYCUc4yfi
	g1MlsHFHhgsOsOpC7naOM4oyN0CVbepLIMZEI8xRkaqlePdU/hgKw0e14KjZaGT6WxGxQ==
X-Google-Smtp-Source: AGHT+IHH4+DoQdAdTRLKCwmrsKo89UjrhGiWxmS6EpYfn7JJA0tWJCrhnsHsvAmJxuBOL37wJba5KA==
X-Received: by 2002:a05:690c:4a0e:b0:6ef:aae1:ac51 with SMTP id 00721157ae682-6f3f820defamr318883287b3.27.1736119439278;
        Sun, 05 Jan 2025 15:23:59 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:23:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [meta-oe][styhead][PATCH 01/24] abseil-cpp: Do not leak -Wnon-virtual-dtor into the .pc files
Date: Sun,  5 Jan 2025 18:23:34 -0500
Message-ID: <20250105232358.1502946-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114631

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The -Wnon-virtual-dtor flag was unintentionally added to the .pc files,
which causes problems when abseil is used by C code:

  cc1: error: command-line option '-Wnon-virtual-dtor' is valid for
  C++/ObjC++ but not for C [-Werror]

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-virtual-dtor-in-the-flags-are-neede.patch | 30 +++++++++++++++++++
 .../abseil-cpp/abseil-cpp_20240722.0.bb       |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch
new file mode 100644
index 0000000000..9a4fc0b43f
--- /dev/null
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch
@@ -0,0 +1,30 @@
+From 9cb5e5d15c142e5cc43a2c1db87c8e4e5b6d38a5 Mon Sep 17 00:00:00 2001
+From: Derek Mauro <dmauro@google.com>
+Date: Mon, 5 Aug 2024 07:35:05 -0700
+Subject: [PATCH] Don't match -Wnon-virtual-dtor in the "flags are needed to
+ suppress warnings in headers". It should fall through to the "don't impose
+ our warnings on others" case. Do this by matching on "-Wno-*" instead of
+ "-Wno*".
+
+Fixes #1737
+
+PiperOrigin-RevId: 659548798
+Change-Id: I49d7ba7ddcd7be30f946fca90ba9be467181e854
+Upstream-Status: Backport [https://github.com/abseil/abseil-cpp/commit/9cb5e5d15c142e5cc43a2c1db87c8e4e5b6d38a5]
+---
+ CMake/AbseilHelpers.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMake/AbseilHelpers.cmake b/CMake/AbseilHelpers.cmake
+index b177e590..3c4c92fe 100644
+--- a/CMake/AbseilHelpers.cmake
++++ b/CMake/AbseilHelpers.cmake
+@@ -195,7 +195,7 @@ function(absl_cc_library)
+         # specified platform. Filter both of them out before the successor
+         # reaches the "^-m" filter.
+         set(skip_next_cflag ON)
+-      elseif(${cflag} MATCHES "^(-Wno|/wd)")
++      elseif(${cflag} MATCHES "^(-Wno-|/wd)")
+         # These flags are needed to suppress warnings that might fire in our headers.
+         set(PC_CFLAGS "${PC_CFLAGS} ${cflag}")
+       elseif(${cflag} MATCHES "^(-W|/w[1234eo])")
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
index f44a5d9082..d9634b2b04 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
            file://0003-Remove-neon-option-from-cross-compilation.patch \
            file://0004-abseil-ppc-fixes.patch \
+           file://0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.43.0


