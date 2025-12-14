Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CA1CFD314
	for <webhook@archiver.kernel.org>; Sun, 14 Dec 2025 10:44:56 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23498.1765709084387970701
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Dec 2025 02:44:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m7wjDnos;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-343ea89896eso2619883a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Dec 2025 02:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765709083; x=1766313883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2YQ8xc4d6pPZBY8tZunACU1lE6Kk+WrUhGmTjOeQTc=;
        b=m7wjDnosgyufVCtONBOQcU8tnTbO/6LUVL+mQS7Kav8nY5Sbwipt3+npi2hxvTalV8
         0Y1Fu6kGYcbVJVpDwjCFc3817nCh/owlqR4pUZlrpmAAK26gZdSXEYKSG3eTN5El0UoB
         IadXLHBtutxSRSld0vJ9nF4h8pjhaPeXtCWvve0+xa5Z1LI9xE3Oivj7zqAn94BlcJnQ
         xHFTJ5OjaBbSiumkK8FdPun/0P06kCrEGNOuJxKauAZn3t2qXkOXzN/2nmVMg6EufyjT
         k8ETaTLJkj45uHjOCrNd2GximUzpsZhEsYIFBHYyY2W5azmU63NaarydNqYKbwUVdN6Y
         xNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765709083; x=1766313883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s2YQ8xc4d6pPZBY8tZunACU1lE6Kk+WrUhGmTjOeQTc=;
        b=paLJ3COp6/tvpTxWMjuGW0Lr/+jcOEcskZnrXoveHsT8oY1yhojTQ0ozAqH6tMW+7x
         SNVuRQRv9x44mQghXQPd7xHGTqnBoCVrv45jdBlKq0SGQYOVFOboEVLVJ9pzIdJDBAJ0
         BcB8i7vF28KuTklicfMuXWisUiictAUVpsl8iYjNWABqn3HvgAQJpzVFOB650UUJLKWW
         Soc11Xa7TLEf1pt7F/mQ7ZdZxk+VH/IiFE27LLff+gBRaNneSzbkwM6ZZbG+NrTa3kFu
         zDDHQm3uKrOmhozbXpeKe0jktfDUuA+xO9xEdOH7TBBE9KUvukQhkVMuU5iMVK+bn+Q3
         Qbdg==
X-Gm-Message-State: AOJu0Yz2gCQGXJHi4NQjlBCeQSQITzpHI7lPJGqXMGTvMojnIFitGRxW
	wu5JoRwtNgZRoCTuq0YV98d/kES4NR4yWQUTKVuiXtgBCTgDyXBUp2CJm2Yctl5M
X-Gm-Gg: AY/fxX4HQO4HCqKvdQw2QwapFkVkQTK5gD+A8IvkndMc4yqK+ZVyeL+hWAC8PgdEImx
	uRNOgTQtlF58aln5mwif+nP8MWUOThszIFPjEoehiv7zh6Xmdvh3RW5v1cR/8FJMZxQaq8HCsZM
	thh8BcairboLQMZX3rZ8Mas1YwoqzNmHMiY7n9LUZmjep0kF2nahONJkbNi6AYwooZz9uPTNXFN
	9ZviJhiZwwjSICtfMgCyIPTEsofc1hEAKUfmeNoOZx+5PQ7AwpmClk0iSvCq/Z+u2bvbo0Btu70
	VHaYAzp6kBKrOSjdDuZy/AkaOsYoZ/q+ZjE97yeHNa4OWibLVBkTaTcNr5f987S9+50U91CApST
	5KbZoDE3gLNTrKAE+8sl1AZ/m+CXHqktBlZHGMXXGgymctQUT0g7Q5O9SPvqlpMOZDC1wynHRWj
	VPvkQKev1TDDDbhxgX4y/DKJISkmfrt61byGi/Y9BTJKRrbeAbDnKoEo7kWpHwSh7R65CgbVMhM
	SiyFgQ7UaTM3w+/R5Zngw5sqQBt4T9Bb3v+1baiq8o=
X-Google-Smtp-Source: AGHT+IGOGqDB1i5UCc/hOS1ZTAkY3wT7vL+rsI9V0gUfmcGWxUwFY/jX/I/REpDTKWo0gorVTBLIVQ==
X-Received: by 2002:a05:7022:428d:b0:119:e569:f279 with SMTP id a92af1059eb24-11f34c19265mr6978722c88.34.1765709083183;
        Sun, 14 Dec 2025 02:44:43 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b51b2sm33026160c88.8.2025.12.14.02.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 02:44:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] vk-gl-cts: Delete unused patch
Date: Sun, 14 Dec 2025 02:44:38 -0800
Message-ID: <20251214104439.1085235-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214104439.1085235-1-raj.khem@gmail.com>
References: <20251214104439.1085235-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Dec 2025 10:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122649

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...clude-cstdint-causing-build-failures.patch | 47 -------------------
 1 file changed, 47 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-Fix-missing-include-cstdint-causing-build-failures.patch

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Fix-missing-include-cstdint-causing-build-failures.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Fix-missing-include-cstdint-causing-build-failures.patch
deleted file mode 100644
index 44632bc74f..0000000000
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Fix-missing-include-cstdint-causing-build-failures.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 1d80b54aefd1f5f361990b1223c6fe308a8d3085 Mon Sep 17 00:00:00 2001
-From: Ricardo Garcia <rgarcia@igalia.com>
-Date: Mon, 21 Apr 2025 12:30:05 +0200
-Subject: [PATCH] Fix missing #include <cstdint> causing build failures
-
-Tested on Fedora 42 with clang.
-
-Upstream-Status: Submitted [https://github.com/google/amber/pull/1092]
-
-Fixes:
-http://errors.yoctoproject.org/Errors/Details/852849/
-
-In file included from TOPDIR/tmp/work/core2-64-oe-linux/vulkan-cts/1.4.1.0/git/external/amber/src/src/type.cc:15:
-TOPDIR/tmp/work/core2-64-oe-linux/vulkan-cts/1.4.1.0/git/external/amber/src/src/type.h:56:39: error: 'uint32_t' has not been declared
-   56 |   static bool IsInt8(FormatMode mode, uint32_t num_bits) {
-      |                                       ^~~~~~~~
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
- src/tokenizer.h | 1 +
- src/type.h      | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/src/tokenizer.h b/src/tokenizer.h
-index 53efec60..ea4f19df 100644
---- a/src/tokenizer.h
-+++ b/src/tokenizer.h
-@@ -16,6 +16,7 @@
- #define SRC_TOKENIZER_H_
-
- #include <cstdlib>
-+#include <cstdint>
- #include <memory>
- #include <string>
-
-diff --git a/src/type.h b/src/type.h
-index c63779ba..97720f29 100644
---- a/src/type.h
-+++ b/src/type.h
-@@ -16,6 +16,7 @@
- #define SRC_TYPE_H_
-
- #include <cassert>
-+#include <cstdint>
- #include <memory>
- #include <string>
- #include <vector>

