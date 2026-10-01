Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D9ACA5FC1
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 03:03:57 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3433.1790823828777073229
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 20:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=V8OqrXlv;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469f204f6so2946080b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 20:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790823828; x=1791428628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zhDYBYrupikqbDELX3GqKnJp8DUDFJFs/W3UqJP1QGs=;
        b=V8OqrXlvBAmpBmIBrY3x7Z2+mRiaoFdBtJQPAkc++lyt8naSomcXnflwDQeYEaDe/c
         2PdWmmDmT3lFASs6rYb/RyPJeeGfW+zKvfSw0oe8YUADJA9OpMphX0o+i1M4Mn569Q5B
         zVaZqxRtbeYqNR0TdPIxDc5o9vODCyRtggRGfry8psjXBqiNJImK68JsMEnWIm0HoeWp
         4ezOB+4vfvpplixmdDYKvK+tm27b8+ka0EjjYjfpvPUC8DuJZ5YPH859qYNDOZm4jqZW
         4MA3qi7x6+EjSdTr/F04qdgomz5khVvscJQwHU1VLDdQC7IXgAnsCsR1dsAa0TDUPEFg
         P48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790823828; x=1791428628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zhDYBYrupikqbDELX3GqKnJp8DUDFJFs/W3UqJP1QGs=;
        b=1qly7sSAYS9bb4kpXGjgLEIjOBfxygNE7hFYxHDIx4fin1UPNes+/+LYx2/09mmaZQ
         GWALDdLms2fkTg/HIRUE5MIrWNXDit0ZjVh+Pn4FCKLmqkAS19x6UWuofPLnnfhkZbLX
         /5rwVDrXRwlRx1YSJo4h6pjL1emR0AK/c5e3T5ff12moD2pzT6fjNgSed1QUcKx6z6Li
         hnL9iH/m8p9Y83/5O8m8ByoZvNUMcA0ZQauIErvQw7LNT6lrRLnhFtrgph1AZHRrcr1M
         6qFMiPBX4QQKj10CLqF6P36L+d85t7SGgCLzyYqs4gVNPnbFqDMsgz3RdiNHMQUPaXUZ
         ZHpA==
X-Gm-Message-State: AFuF++nM/LUEssfAQDljypILOOSCqFb3jezXkh4RdnL2I5X6KaVYF/Lq
	KiGMdpOsbjdK0kjgOMvIonNBxxxYxN9r4nEv7veOWw3ETJmYae1ZKa1rggYfMw==
X-Gm-Gg: AYBFou2nQEb4+xgv7Vw1SZ6MMJpkHvhSxp5yMWg3p+CJNgq2uSWQS5VgLmHkwBNC1Cp
	knruWpJT4elns7Y6WV7h7WdllXIMmlQNW7Eqro/jNgBDnm+T0yWMOAwg/+F+NUDS80lKgcijJiE
	4QEfDHlwnwyWRK1QPYspk/MAnb9QX4HGkbNJ/IVGRUuRluKdmpYLyYbd/32Db+4+zXPB4TGbvqz
	34JokdkBhE53NIsRcUYV/mETA1zstBXFXGLJ4XktnfmNvJrJRRlX6wHcgvbKqh5orATwTyKcPCd
	+Yc9JJ2OdNtedUIsWsWJg8uQyz104DcVG0XU14s6PNpeEG08U+hWfj/1QOx2Cgx4Dplp64LPcQc
	LH8lvMSK8ZSYLtsD2zloJEA0LAT1X3ITSfTLQwemNmF/ggVAl/12iXjfJ/ZR6WLQLArQ5XkaN6N
	quKUoMB1wf2dENOh4MSeM1fqNZdKDzRJjLjvRzwqLAzCNlTG1nmQfnYl0trHDiKmqonCEdoH8Ik
	v38CQQcXoVTakjdmX5vS3w=
X-Received: by 2002:a05:6a00:2301:b0:877:c77d:af8d with SMTP id d2e1a72fcca58-8874be0d9famr2635471b3a.13.1790823827990;
        Wed, 30 Sep 2026 20:03:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88819db440csm357042b3a.60.2026.09.30.20.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:03:47 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 6/17] gerbera: upgrade 3.2.1 -> 3.3.0
Date: Thu,  1 Oct 2026 16:03:18 +1300
Message-ID: <20261001030331.1581021-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
References: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130555

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patches that are part of the upstream version.

Changelog:
https://github.com/gerbera/gerbera/releases/tag/v3.3.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...-against-fmt-12-include-fmt-format.h.patch |  53 -----
 ...-cstring-for-std-strerror-std-memcpy.patch | 204 ------------------
 .../{gerbera_3.2.1.bb => gerbera_3.3.0.bb}    |   4 +-
 3 files changed, 1 insertion(+), 260 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-fix-build-against-fmt-12-include-fmt-format.h.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gerbera/gerbera/0002-include-cstring-for-std-strerror-std-memcpy.patch
 rename meta-multimedia/recipes-multimedia/gerbera/{gerbera_3.2.1.bb => gerbera_3.3.0.bb} (88%)

diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-fix-build-against-fmt-12-include-fmt-format.h.patch b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-fix-build-against-fmt-12-include-fmt-format.h.patch
deleted file mode 100644
index eaaf7869e5..0000000000
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-fix-build-against-fmt-12-include-fmt-format.h.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 9507706136fd0000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Wed, 8 Jul 2026 00:00:00 +0000
-Subject: [PATCH] fix build against fmt 12: include fmt/format.h
-
-Since fmt 11, <fmt/core.h> is a thin shim that only pulls in <fmt/base.h>
-and no longer declares fmt::format() unless FMT_DEPRECATED_HEAVY_CORE is
-defined. fmt 12.2.0 finishes the job and the build fails with:
-
-  src/exceptions.cc:37:31: error: no member named 'format' in namespace 'fmt'
-      : std::runtime_error(fmt::format("{}: Error: {}", message, userMessage))
-
-Include <fmt/format.h> in the central headers that expose fmt::format()
-to the rest of the tree (exceptions.h via throw_std_runtime_error, and
-search_handler.h) so all consumers see the declaration again.
-
-Backport of gerbera commit 9507706136fd.
-
-Upstream-Status: Backport [https://github.com/gerbera/gerbera/commit/9507706136fd]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- src/exceptions.h            | 2 +-
- src/database/search_handler.h | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/exceptions.h b/src/exceptions.h
-index 1111111..2222222 100644
---- a/src/exceptions.h
-+++ b/src/exceptions.h
-@@ -34,7 +34,7 @@
- #ifndef __EXCEPTIONS_H__
- #define __EXCEPTIONS_H__
-
--#include <fmt/core.h>
-+#include <fmt/format.h>
- #include <stdexcept>
- #include <string>
-
-diff --git a/src/database/search_handler.h b/src/database/search_handler.h
-index 3333333..4444444 100644
---- a/src/database/search_handler.h
-+++ b/src/database/search_handler.h
-@@ -32,7 +32,7 @@
- #include "util/tools.h"
-
- #include <algorithm>
--#include <fmt/core.h>
-+#include <fmt/format.h>
- #include <map>
- #include <memory>
- #include <tuple>
---
-2.43.0
diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera/0002-include-cstring-for-std-strerror-std-memcpy.patch b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0002-include-cstring-for-std-strerror-std-memcpy.patch
deleted file mode 100644
index 14742f4727..0000000000
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera/0002-include-cstring-for-std-strerror-std-memcpy.patch
+++ /dev/null
@@ -1,204 +0,0 @@
-From 7caa9ae9ebf50000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Wed, 8 Jul 2026 00:00:01 +0000
-Subject: [PATCH] include <cstring> for std::strerror / std::memcpy / std::strchr
-
-Several translation units use std::strerror(), std::memcpy() and
-std::strchr() but relied on <cstring> being pulled in transitively
-through <fmt/core.h> (and other headers). With fmt 12 the fmt headers no
-longer drag in <cstring>, so the build fails with:
-
-  src/util/thread_runner.h:194:68: error: no member named 'strerror' in namespace 'std'
-  src/content/inotify/mt_inotify.cc:163:13: error: no member named 'memcpy' in namespace 'std'
-  src/util/url_utils.cc:144:24: error: no member named 'strchr' in namespace 'std'
-
-Include <cstring> explicitly in every file that uses these functions.
-
-Based on upstream gerbera commit 7caa9ae9ebf5, extended to cover all
-affected translation units in this release.
-
-Upstream-Status: Backport [https://github.com/gerbera/gerbera/commit/7caa9ae9ebf5]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
---- a/src/main.cc
-+++ b/src/main.cc
-@@ -40,6 +40,7 @@
- #define GRB_LOG_FAC GrbLogFacility::server
- 
- #include "config/config_definition.h"
-+#include <cstring>
- #include "config/config_manager.h"
- #include "config/config_val.h"
- #include "config/grb_runtime.h"
---- a/src/database/sqlite3/sqlite_database.cc
-+++ b/src/database/sqlite3/sqlite_database.cc
-@@ -33,6 +33,7 @@
- #define GRB_LOG_FAC GrbLogFacility::sqlite3
- 
- #include "sqlite_database.h" // API
-+#include <cstring>
- 
- #include "cds/cds_enums.h"
- #include "config/config.h"
---- a/src/database/postgres/postgres_database.cc
-+++ b/src/database/postgres/postgres_database.cc
-@@ -25,6 +25,7 @@
- 
- #ifdef HAVE_PGSQL
- #include "postgres_database.h" // API
-+#include <cstring>
- 
- #include "cds/cds_enums.h"
- #include "config/config.h"
---- a/src/iohandler/mem_io_handler.cc
-+++ b/src/iohandler/mem_io_handler.cc
-@@ -33,6 +33,7 @@
- #define GRB_LOG_FAC GrbLogFacility::iohandler
- 
- #include "mem_io_handler.h" // API
-+#include <cstring>
- 
- #include "exceptions.h"
- 
---- a/src/iohandler/process_io_handler.cc
-+++ b/src/iohandler/process_io_handler.cc
-@@ -33,6 +33,7 @@
- #define GRB_LOG_FAC GrbLogFacility::iohandler
- 
- #include "process_io_handler.h" // API
-+#include <cstring>
- 
- #include "content/content.h"
- #include "exceptions.h"
---- a/src/iohandler/curl_io_handler.cc
-+++ b/src/iohandler/curl_io_handler.cc
-@@ -34,6 +34,7 @@
- 
- #ifdef HAVE_CURL
- #include "curl_io_handler.h" // API
-+#include <cstring>
- 
- #include "config/config.h"
- #include "exceptions.h"
---- a/src/config/grb_runtime.cc
-+++ b/src/config/grb_runtime.cc
-@@ -22,6 +22,7 @@
- #define GRB_LOG_FAC GrbLogFacility::server
- 
- #include "grb_runtime.h" // API
-+#include <cstring>
- 
- #include "config/config.h"
- #include "config/config_definition.h"
---- a/src/util/grb_net.cc
-+++ b/src/util/grb_net.cc
-@@ -21,6 +21,7 @@
- /// @file util/grb_net.cc
- #define GRB_LOG_FAC GrbLogFacility::clients
- #include "grb_net.h" // API
-+#include <cstring>
- 
- #include "exceptions.h"
- #include "logger.h"
---- a/src/util/grb_fs.cc
-+++ b/src/util/grb_fs.cc
-@@ -21,6 +21,7 @@
- /// @file util/grb_fs.cc
- #define GRB_LOG_FAC GrbLogFacility::content
- #include "grb_fs.h" // API
-+#include <cstring>
- 
- #include "exceptions.h"
- #include "util/logger.h"
---- a/src/config/setup/config_setup_path.cc
-+++ b/src/config/setup/config_setup_path.cc
-@@ -25,6 +25,7 @@
- #define GRB_LOG_FAC GrbLogFacility::config
- 
- #include "config_setup_path.h" // API
-+#include <cstring>
- 
- #include "config/config_definition.h"
- #include "config/config_options.h"
---- a/src/util/thread_executor.cc
-+++ b/src/util/thread_executor.cc
-@@ -32,6 +32,7 @@
- /// @file util/thread_executor.cc
- 
- #include "thread_executor.h" // API
-+#include <cstring>
- 
- #include "util/logger.h"
- 
---- a/src/util/thread_runner.h
-+++ b/src/util/thread_runner.h
-@@ -28,6 +28,7 @@
- 
- #include "config/config.h"
- #include "thread_executor.h"
-+#include <cstring>
- #include "util/logger.h"
- 
- #include <chrono>
---- a/src/util/string_converter.cc
-+++ b/src/util/string_converter.cc
-@@ -32,6 +32,7 @@
- /// @file util/string_converter.cc
- #define GRB_LOG_FAC GrbLogFacility::util
- #include "string_converter.h" // API
-+#include <cstring>
- 
- #include "common.h"
- #include "config/config.h"
---- a/src/content/inotify/mt_inotify.cc
-+++ b/src/content/inotify/mt_inotify.cc
-@@ -41,6 +41,7 @@
- 
- #ifdef HAVE_INOTIFY
- #include "mt_inotify.h"
-+#include <cstring>
- 
- #include "exceptions.h"
- #include "util/logger.h"
---- a/src/metadata/metacontent_handler.cc
-+++ b/src/metadata/metacontent_handler.cc
-@@ -25,6 +25,7 @@
- #define GRB_LOG_FAC GrbLogFacility::metadata
- 
- #include "metacontent_handler.h" // API
-+#include <cstring>
- 
- #include "cds/cds_item.h"
- #include "cds/cds_objects.h"
---- a/src/transcoding/transcode_ext_handler.cc
-+++ b/src/transcoding/transcode_ext_handler.cc
-@@ -33,6 +33,7 @@
- #define GRB_LOG_FAC GrbLogFacility::transcoding
- 
- #include "transcode_ext_handler.h" // API
-+#include <cstring>
- 
- #include "cds/cds_objects.h"
- #include "config/config.h"
---- a/src/util/tools.cc
-+++ b/src/util/tools.cc
-@@ -32,6 +32,7 @@
- /// @file util/tools.cc
- #define GRB_LOG_FAC GrbLogFacility::content
- #include "tools.h" // API
-+#include <cstring>
- 
- #include "config/config.h"
- #include "contrib/md5.h"
---- a/src/util/url_utils.cc
-+++ b/src/util/url_utils.cc
-@@ -22,6 +22,7 @@
- /// @file util/url_utils.cc
- #define GRB_LOG_FAC GrbLogFacility::content
- #include "url_utils.h" // API
-+#include <cstring>
- 
- #include "exceptions.h"
- 
---
-2.43.0
diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.2.1.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.3.0.bb
similarity index 88%
rename from meta-multimedia/recipes-multimedia/gerbera/gerbera_3.2.1.bb
rename to meta-multimedia/recipes-multimedia/gerbera/gerbera_3.3.0.bb
index 8ae899d3ec..3d28273f30 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.2.1.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.3.0.bb
@@ -4,10 +4,8 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"
 
 SRC_URI = "git://github.com/gerbera/gerbera.git;protocol=https;branch=master;tag=v${PV} \
-           file://0001-fix-build-against-fmt-12-include-fmt-format.h.patch \
-           file://0002-include-cstring-for-std-strerror-std-memcpy.patch \
            "
-SRCREV = "a6a2bb2991d197a52755a488fc943566d654d3bd"
+SRCREV = "28361d9e22812c9d7042a85b355a17c8f8495217"
 
 
 DEPENDS = "pugixml sqlite3 zlib fmt spdlog util-linux-libuuid libupnp libnsl2 icu jsoncpp cxxopts"

