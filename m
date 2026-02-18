Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F981E9A03E
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 10:20:20 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9035.1771410019347246469
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Feb 2026 02:20:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZidQB5IW;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-824a3509a12so3052455b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 02:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771410018; x=1772014818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iRY18TlGJ00WH5+x+iqsaZC3EXGn/hFQW4VCVdnXgt8=;
        b=ZidQB5IW/YIiMpla9jV2zE1+an2tMVCVJHDCVkcxJ43EhPT7s7msnoGW9favertTy/
         ozfhnoBcl5w3rxAMKfG7d75dcf/meaTAuckM63oER63zZVnEE6ClvFt5c/7T5TyADwTx
         pJnvArYDMQimUvZe/G8WTLxMC2VR8tln05/04eFEgSV5LRnZ5cI3gXs6ON5iuSupAqRZ
         cHBVdh4MLr40dAi7vWWn7k+hpZBOyE5au7RacjW3Se1azI9K3rii6SGX6jkdH3DkIX36
         J03jGu3h955D1wFmzZ2RMDFx85ZbZciGYO0GEkaX5Ikr3vl9DEuyn9BQ4OqrSuVkYcXj
         SZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771410018; x=1772014818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRY18TlGJ00WH5+x+iqsaZC3EXGn/hFQW4VCVdnXgt8=;
        b=qht01e9e6O6Hwk0LGj2vuJEK6E/IeG3Oms4h1tiC5qy5udMATdvGQFKjr6OX9MzPwp
         egJliKCPldlJYQcptQ8CfOj3ThdiHbTa1QBWzuA5mbfLxuACrkhTpo31Nt+D0ctuqOHe
         qntwYMEOJ0ZxEj4Y1g+qEXOxGvxWa8cUG2F5GmCKJVHTz7TgluG0DAZbWtpSTnXU1fIb
         14EW3n3uXByJ6fnqd+W4yoajW8kAaZO3wKB9e3OYourOEfIvpoyztxGThA+x9f4aCd+6
         EyQwVint0wSfJ5JcN0KH0Fp94LusFeJDZwx4FkumCEVmOxWwqpKpi+i/K1IuWrW1JArw
         JFPA==
X-Gm-Message-State: AOJu0YxSAg1udTEwo8eCfLpK9m4dGMEWt6Eexh8abThNgyL7px0wDimF
	8NkI94RxNMfuyoI/RPJO7cBleZ6xKkJbJzSxrkQnAytjxK8vDNbDFJh5bgPZjA==
X-Gm-Gg: AZuq6aIjhjriCV6ko82HO7DOYE3/8Eu86U5wXUUzXmxFMgf4eBpDj26aByQOHe6rgzy
	3CdU3MTiIdfg0DMQd4+76ma6hmjoiS/L+6wrVLONPz1pUdIxwAikq2BKgISTTywt6JH827chqGY
	uZO4NvDz7SWzOJdTSDyKu/d6lJTrorGepGEEC7vfGLncygLOuyHQxZrKhhEenx3BP5r46VcaBmb
	K90uTbNTWSTcIZN7j7Pai/SyroVZcbPEXjkuuryW6PQmrMmn8lshRlNcw4SlumsrLTgO8N38w5Q
	iqOU/8fp3RS/qT/rVYE6sjrn1KzAgpIzEF7EA2v2QO4D0fqKU39N+lx3Zz22sshpVSLEduMT/yZ
	ERoSMdcKXD8WJchVI8yWoW7yojdUfswh9kIiaK5PqmMvtSUNHbdUPUh1PySxs6OiPPESALqM+Ah
	/FzWSL+6PSERJAMIxpjkYUfgejXlWJYZXAzCQ=
X-Received: by 2002:a05:6a21:389:b0:38d:f0f3:b94e with SMTP id adf61e73a8af0-394fc1a2465mr1279455637.24.1771410018321;
        Wed, 18 Feb 2026 02:20:18 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e531e6dccsm11826670a12.19.2026.02.18.02.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 02:20:17 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/2] libjxl: upgrade 0.11.1 -> 0.11.2
Date: Wed, 18 Feb 2026 23:20:02 +1300
Message-ID: <20260218102003.3812885-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 10:20:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124471

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- fix tile dimension in low memory rendering pipeline (CVE-2025-12474)
- fix number of channels for gray-to-gray color transform (CVE-2026-1837)
- djxl: reject decoding JXL files if "packed" representation size overflows
    size_t

https://github.com/libjxl/libjxl/releases/tag/v0.11.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libjxl/{libjxl_0.11.1.bb => libjxl_0.11.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libjxl/{libjxl_0.11.1.bb => libjxl_0.11.2.bb} (96%)

diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb b/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.2.bb
similarity index 96%
rename from meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb
rename to meta-oe/recipes-multimedia/libjxl/libjxl_0.11.2.bb
index 8170c9055d..617d3bc502 100644
--- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.2.bb
@@ -8,11 +8,11 @@ inherit cmake pkgconfig mime
 
 DEPENDS = "highway brotli"
 
-SRC_URI = "gitsm://github.com/libjxl/libjxl.git;protocol=https;nobranch=1 \
+SRC_URI = "gitsm://github.com/libjxl/libjxl.git;protocol=https;nobranch=1;tag=v${PV} \
            file://0001-cmake-Do-not-use-mrelax-all-with-clang-on-RISCV64.patch \
            "
 
-SRCREV = "794a5dcf0d54f9f0b20d288a12e87afb91d20dfc"
+SRCREV = "332feb17d17311c748445f7ee75c4fb55cc38530"
 
 EXTRA_OECMAKE = " \
 	-DCMAKE_BUILD_TYPE=Release \

