Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA3D9C77B7D
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 09:33:15 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.12929.1684402385968110612
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 May 2023 02:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PIg5SyDP;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-96652cb7673so287947466b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 02:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684402384; x=1686994384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MPKG+74cwGs1aY60scSqjh+Kz5vycNckipNUaIyAOpA=;
        b=PIg5SyDPhuI7vk7Qg9NPIuE48Mv9Kh1oYmIWXz4j0k759YZ0AewivCt/raUIR7PMS1
         xKim2XECW/jhGbVt96yltUrUhMxzmWvR2cyjJDppkJTdUzZ9wUbvZWC+hlFAX12x1kkX
         CtgBMI1d2D3LhRaeuwGwAbPnl52NbGvMVqMPzo98pPKG64cvDw9qTHJNp1g2DCpFmMJV
         z9SPnPx13IiQqDoqYeafu1R6FATla2jzYiE8XMK0cZtgt1S8MKfextWrJXvY7DnnS7GZ
         Z7VH5yDM6O1IMXCF/GXsYUpgEd/NZNvrVroluGD6SU3hUjnb+gTXDq3k0zBj3qNpJ8Dn
         lZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684402384; x=1686994384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPKG+74cwGs1aY60scSqjh+Kz5vycNckipNUaIyAOpA=;
        b=ECT11Ae6HQfEvumjifqk2QViQBwAXmIs/DwJKHpFJ6lqYJGvqkRSX+SyOH9EEUhtvn
         9WTb5R6KTmx4VM+R8kM1heKH+4G4uzgmbdG2LCA+Ko5p/nGQ4I2VGaYPkJ+uIPyDHkM4
         5IaXiiA1zZKse2KQBgqcTv1zc0O7bOYdiLDKkc8mEbUU4WxqE2dMXaaEaWLvKp1Gndml
         s5cHlUYbU3NbOTGtsE4tFO2fqtIcbLvGvuvX2HokrEFOHrb9XMWyW1IT0d9sFMxVv+Yc
         wFVl6/WgAa92dk5L8Tcz96dmV4/b+rljD6o7gcqJmtuxfZrlu6N2DOuC2tnQdsCw7RYF
         3t8A==
X-Gm-Message-State: AC+VfDyx7G6K+INqiDBSbiIRuB/xTaRDhXzJvSFXR7OAqqUMQpeu0oWN
	zzQm3AowQ2GakEAYlfia4GxLa2QwBnI=
X-Google-Smtp-Source: ACHHUZ5uvp0qc8poT/QEP0NB9ClmjW1zGqOWcuecSovgpxxJK0animy6YJQEt0AR3iZhxaNRfT/grw==
X-Received: by 2002:a17:907:7fa8:b0:969:8d19:74 with SMTP id qk40-20020a1709077fa800b009698d190074mr39669846ejc.57.1684402384051;
        Thu, 18 May 2023 02:33:04 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id qc20-20020a170906d8b400b0094e62aa8bcesm724060ejb.29.2023.05.18.02.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 02:33:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 1/2] abseil-cpp: backport a fix for build with gcc-13
Date: Thu, 18 May 2023 11:33:00 +0200
Message-Id: <20230518093301.2938164-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 09:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102654

* needed for abseil-cpp-native on hosts with gcc-13"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ernal-str_format-extension.h-add-mis.patch | 31 +++++++++++++++++++
 .../abseil-cpp/abseil-cpp_git.bb              |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-strings-internal-str_format-extension.h-add-mis.patch

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-strings-internal-str_format-extension.h-add-mis.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-strings-internal-str_format-extension.h-add-mis.patch
new file mode 100644
index 0000000000..88f3816b0f
--- /dev/null
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-strings-internal-str_format-extension.h-add-mis.patch
@@ -0,0 +1,31 @@
+From b436bc4ef31e29d73363d60b84e77eb419f46c50 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Fri, 27 May 2022 22:27:58 +0100
+Subject: [PATCH] absl/strings/internal/str_format/extension.h: add missing
+ <stdint.h> include
+
+Without the change absl-cpp build fails on this week's gcc-13 snapshot as:
+
+    /build/abseil-cpp/absl/strings/internal/str_format/extension.h:34:33: error: found ':' in nested-name-specifier, expected '::'
+       34 | enum class FormatConversionChar : uint8_t;
+          |                                 ^
+          |                                 ::
+
+Upstream-Status: Backport [20220623.0 36a4b073f1e7e02ed7d1ac140767e36f82f09b7c]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ absl/strings/internal/str_format/extension.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/absl/strings/internal/str_format/extension.h b/absl/strings/internal/str_format/extension.h
+index c47536d6..08c3fbeb 100644
+--- a/absl/strings/internal/str_format/extension.h
++++ b/absl/strings/internal/str_format/extension.h
+@@ -17,6 +17,7 @@
+ #define ABSL_STRINGS_INTERNAL_STR_FORMAT_EXTENSION_H_
+ 
+ #include <limits.h>
++#include <stdint.h>
+ 
+ #include <cstddef>
+ #include <cstring>
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index 1bb27d4369..30eef75ffb 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0001-absl-always-use-asm-sgidefs.h.patch             \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
            file://abseil-ppc-fixes.patch \
+           file://0001-absl-strings-internal-str_format-extension.h-add-mis.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.40.1


