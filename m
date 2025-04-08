Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F82C369A4
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 10:42:19 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web11.71688.1744108933947199918
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 03:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.51 with ESMTP; 8 Apr 2025 19:42:11 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.120.37)
	by 156.147.1.126 with ESMTP; 8 Apr 2025 19:42:11 +0900
X-Original-SENDERIP: 10.177.120.37
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] opentelemetry-cpp: upgrade 1.17.0 -> 1.19.0
Date: Tue,  8 Apr 2025 19:42:09 +0900
Message-Id: <20250408104209.2011880-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 10:42:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116704

From: "mark.yang" <mark.yang@lge.com>

Changelog:
  https://github.com/open-telemetry/opentelemetry-cpp/releases/tag/v1.19.0

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 .../0001-Fix-build-with-clang-19.patch        | 56 -------------------
 ..._1.17.0.bb => opentelemetry-cpp_1.19.0.bb} |  6 +-
 2 files changed, 2 insertions(+), 60 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opentelemetry/opentelemetry-cpp/0001-Fix-build-with-clang-19.patch
 rename meta-oe/recipes-support/opentelemetry/{opentelemetry-cpp_1.17.0.bb => opentelemetry-cpp_1.19.0.bb} (91%)

diff --git a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp/0001-Fix-build-with-clang-19.patch b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp/0001-Fix-build-with-clang-19.patch
deleted file mode 100644
index 2651eb6a72..0000000000
--- a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp/0001-Fix-build-with-clang-19.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 1a5b4035e4cb75b87c716b4ebd5ffe32cd604c6e Mon Sep 17 00:00:00 2001
-From: "Sergey A. Osokin" <osa@FreeBSD.org.ru>
-Date: Sun, 8 Sep 2024 17:14:25 -0400
-Subject: [PATCH] Fix build with clang 19
-
-Please see https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=281359
-for details.
-
-Upstream-Status: Submitted [https://github.com/open-telemetry/opentelemetry-cpp/pull/3055]
-Credit:	Dimitry Andric <dim@FreeBSD.org>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- api/include/opentelemetry/logs/event_logger.h       | 2 +-
- api/include/opentelemetry/logs/logger.h             | 2 +-
- api/include/opentelemetry/logs/logger_type_traits.h | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/api/include/opentelemetry/logs/event_logger.h b/api/include/opentelemetry/logs/event_logger.h
-index b5c94a70..5892e041 100644
---- a/api/include/opentelemetry/logs/event_logger.h
-+++ b/api/include/opentelemetry/logs/event_logger.h
-@@ -66,7 +66,7 @@ class EventLogger
-     nostd::unique_ptr<LogRecord> log_record = delegate_logger->CreateLogRecord();
- 
-     IgnoreTraitResult(
--        detail::LogRecordSetterTrait<typename std::decay<ArgumentType>::type>::template Set(
-+        detail::LogRecordSetterTrait<typename std::decay<ArgumentType>::type>::template Set<>(
-             log_record.get(), std::forward<ArgumentType>(args))...);
- 
-     EmitEvent(event_name, std::move(log_record));
-diff --git a/api/include/opentelemetry/logs/logger.h b/api/include/opentelemetry/logs/logger.h
-index dc09a0c2..19da3942 100644
---- a/api/include/opentelemetry/logs/logger.h
-+++ b/api/include/opentelemetry/logs/logger.h
-@@ -73,7 +73,7 @@ class Logger
-     }
- 
-     IgnoreTraitResult(
--        detail::LogRecordSetterTrait<typename std::decay<ArgumentType>::type>::template Set(
-+        detail::LogRecordSetterTrait<typename std::decay<ArgumentType>::type>::template Set<>(
-             log_record.get(), std::forward<ArgumentType>(args))...);
- 
-     EmitLogRecord(std::move(log_record));
-diff --git a/api/include/opentelemetry/logs/logger_type_traits.h b/api/include/opentelemetry/logs/logger_type_traits.h
-index 48613513..f140a545 100644
---- a/api/include/opentelemetry/logs/logger_type_traits.h
-+++ b/api/include/opentelemetry/logs/logger_type_traits.h
-@@ -166,7 +166,7 @@ struct LogRecordSetterTrait
-                 * = nullptr>
-   inline static LogRecord *Set(LogRecord *log_record, ArgumentType &&arg) noexcept
-   {
--    return LogRecordSetterTrait<common::KeyValueIterable>::template Set(
-+    return LogRecordSetterTrait<common::KeyValueIterable>::template Set<>(
-         log_record, std::forward<ArgumentType>(arg));
-   }
- 
diff --git a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.17.0.bb b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.19.0.bb
similarity index 91%
rename from meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.17.0.bb
rename to meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.19.0.bb
index 3df48fa019..c98bc826ad 100644
--- a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.17.0.bb
+++ b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.19.0.bb
@@ -7,10 +7,8 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 DEPENDS = "nlohmann-json"
-
-SRC_URI = "gitsm://github.com/open-telemetry/opentelemetry-cpp.git;protocol=https;branch=main \
-           file://0001-Fix-build-with-clang-19.patch"
-SRCREV = "fa0a5200ddbe9ae6f487a228e658aedc102dab56"
+SRC_URI = "gitsm://github.com/open-telemetry/opentelemetry-cpp.git;protocol=https;branch=main"
+SRCREV = "ced79860f8c8a091a2eabfee6d47783f828a9b59"
 
 S = "${WORKDIR}/git"
 inherit cmake pkgconfig lib_package

