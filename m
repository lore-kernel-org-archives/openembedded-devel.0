Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B727ECE579
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 17:44:56 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.2399.1725903890036603361
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Sep 2024 10:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VAlc18nT;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2d8fa2ca5b1so3299086a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Sep 2024 10:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725903889; x=1726508689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P//0cwBmaiKL8XzbzawxwSSCEkFoY9nzjSu/6Q0EerQ=;
        b=VAlc18nTaxwUcfS5ScnE02pb11O+NIqQBXuDRC3J5zBY8xn6/LPL7GWJ1C50lUlCHI
         qeLwkP9j1G5S9nuR4Ylzp+DbjHeCvVoZv+gKVjAGYDt/df9RrqpJlo2q9/ch78BepH4T
         klpyHAr6oqhGTaVlyl4fiue2NQsOoIb5n3gHonM7YxuRytEp06EqdZaYLQ7Z2UiNZBSf
         MQgdyepikwI8S4tQbYS/ywpQcl9/b/VhlD0iwR7WhS8CsyIE8IZ5EOiJ/5Qu+q86QU4C
         WizmmnbbFYUa6XNlU785jZ/VLGtHHPHn5AmUhgdrZKwNDnTlIF3aG56WK0JE7uKTFTi2
         ARNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725903889; x=1726508689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P//0cwBmaiKL8XzbzawxwSSCEkFoY9nzjSu/6Q0EerQ=;
        b=xIHDwRde9bQNlE5XVr2rAN8yygsFUmBCPLUMt+9hqBihjKJ6nbkwNH8ZVN5xkgvlPp
         1TU1+DkjKYN3bBiHznEB5TQdbEVr3K0pMZmNwhyzLXFlGv4XESKNkq4VY9Kh/kXLJJ3p
         /2xpE9czZ1d9JBIahy/oMFTjVruBBXs5ciHXFjHIDpU1KljQQNJwsGtZzp8OpyCKYk/o
         FZ/knxbdtA/qIRDyHjYoR6rgBiwW2bUDoJvWYHZcNSvLLajczSxSsygNjgoYnmTbegtl
         RTQMDiNMTnDXV/Dk5+SGslb/VrgEtHS9aAjRaVpw13UOc5c4jEl4pDTckL9qGRcx4cVk
         +pfA==
X-Gm-Message-State: AOJu0YyHAHCR0citz7jEuu39+QzIonIGuNihJQ0G7Uopss2S3X3YEXpL
	jUp1J0EUphO7iGGWE5Uds0g/W4Zq3eF8xKCUSKoz7VCeAeo8sUDVlf4750Zd
X-Google-Smtp-Source: AGHT+IG0JcR5NnS/Cua2JJkO755Xn0O3XoUJfD9svp+sbTHpDxSsbO/Rz4uyHmdNRA3f+q8UKNmySQ==
X-Received: by 2002:a17:90b:1d92:b0:2da:905a:d88a with SMTP id 98e67ed59e1d1-2dad5011d4fmr11554259a91.21.1725903889089;
        Mon, 09 Sep 2024 10:44:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4cdb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadc134909sm6950677a91.57.2024.09.09.10.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 10:44:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] opentelemetry-cpp: Fix build with clang-19
Date: Mon,  9 Sep 2024 10:44:46 -0700
Message-ID: <20240909174446.608901-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Sep 2024 17:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112182

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-build-with-clang-19.patch        | 56 +++++++++++++++++++
 .../opentelemetry/opentelemetry-cpp_1.16.1.bb |  3 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/opentelemetry/opentelemetry-cpp/0001-Fix-build-with-clang-19.patch

diff --git a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp/0001-Fix-build-with-clang-19.patch b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp/0001-Fix-build-with-clang-19.patch
new file mode 100644
index 0000000000..2651eb6a72
--- /dev/null
+++ b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp/0001-Fix-build-with-clang-19.patch
@@ -0,0 +1,56 @@
+From 1a5b4035e4cb75b87c716b4ebd5ffe32cd604c6e Mon Sep 17 00:00:00 2001
+From: "Sergey A. Osokin" <osa@FreeBSD.org.ru>
+Date: Sun, 8 Sep 2024 17:14:25 -0400
+Subject: [PATCH] Fix build with clang 19
+
+Please see https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=281359
+for details.
+
+Upstream-Status: Submitted [https://github.com/open-telemetry/opentelemetry-cpp/pull/3055]
+Credit:	Dimitry Andric <dim@FreeBSD.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ api/include/opentelemetry/logs/event_logger.h       | 2 +-
+ api/include/opentelemetry/logs/logger.h             | 2 +-
+ api/include/opentelemetry/logs/logger_type_traits.h | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/api/include/opentelemetry/logs/event_logger.h b/api/include/opentelemetry/logs/event_logger.h
+index b5c94a70..5892e041 100644
+--- a/api/include/opentelemetry/logs/event_logger.h
++++ b/api/include/opentelemetry/logs/event_logger.h
+@@ -66,7 +66,7 @@ class EventLogger
+     nostd::unique_ptr<LogRecord> log_record = delegate_logger->CreateLogRecord();
+ 
+     IgnoreTraitResult(
+-        detail::LogRecordSetterTrait<typename std::decay<ArgumentType>::type>::template Set(
++        detail::LogRecordSetterTrait<typename std::decay<ArgumentType>::type>::template Set<>(
+             log_record.get(), std::forward<ArgumentType>(args))...);
+ 
+     EmitEvent(event_name, std::move(log_record));
+diff --git a/api/include/opentelemetry/logs/logger.h b/api/include/opentelemetry/logs/logger.h
+index dc09a0c2..19da3942 100644
+--- a/api/include/opentelemetry/logs/logger.h
++++ b/api/include/opentelemetry/logs/logger.h
+@@ -73,7 +73,7 @@ class Logger
+     }
+ 
+     IgnoreTraitResult(
+-        detail::LogRecordSetterTrait<typename std::decay<ArgumentType>::type>::template Set(
++        detail::LogRecordSetterTrait<typename std::decay<ArgumentType>::type>::template Set<>(
+             log_record.get(), std::forward<ArgumentType>(args))...);
+ 
+     EmitLogRecord(std::move(log_record));
+diff --git a/api/include/opentelemetry/logs/logger_type_traits.h b/api/include/opentelemetry/logs/logger_type_traits.h
+index 48613513..f140a545 100644
+--- a/api/include/opentelemetry/logs/logger_type_traits.h
++++ b/api/include/opentelemetry/logs/logger_type_traits.h
+@@ -166,7 +166,7 @@ struct LogRecordSetterTrait
+                 * = nullptr>
+   inline static LogRecord *Set(LogRecord *log_record, ArgumentType &&arg) noexcept
+   {
+-    return LogRecordSetterTrait<common::KeyValueIterable>::template Set(
++    return LogRecordSetterTrait<common::KeyValueIterable>::template Set<>(
+         log_record, std::forward<ArgumentType>(arg));
+   }
+ 
diff --git a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.16.1.bb b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.16.1.bb
index a52e7aef63..c7004cc78d 100644
--- a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.16.1.bb
+++ b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.16.1.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 DEPENDS = "nlohmann-json"
 
-SRC_URI = "git://github.com/open-telemetry/opentelemetry-cpp.git;protocol=https;branch=main;"
+SRC_URI = "git://github.com/open-telemetry/opentelemetry-cpp.git;protocol=https;branch=main \
+           file://0001-Fix-build-with-clang-19.patch"
 SRCREV = "baecbb95bd63df53e0af16e87bc683967962c5f8"
 
 S = "${WORKDIR}/git"

