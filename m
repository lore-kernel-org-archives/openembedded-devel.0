Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4774C44507
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 00:45:15 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1186.1783903512409545662
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2026 17:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RIm0XdL5;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c999f162c9aso1366670a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2026 17:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783903512; x=1784508312; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AQf1CAUNAtnIVfjLPx88qIGR+2f318ab9r/g6rSng0g=;
        b=RIm0XdL5tdnfCaSnJRZBcvwUMgO8kb84z8ad58CaUEMh/juyMWnm/8T+sq/4EDvDJO
         CfCkw4CCMMvCWYYipA8PpW6K1O2tZcA5ipZM4qDg0L1KGW1ARxEPMawh7ED5MdVQSVOB
         Cd5n4SxdINRHd98/gaZBk4E6sTk6qZkdIC7cKJ5JTPX5q158GqbcquR9ItHDz+POgKL6
         HPYBfQemYvnAatA66r3sGK2zAXYum9J0FBtKYwfsTYtRHz7YDKSl75DTwtAAZ9O8Xq80
         XGM3TO5pspUkpH9GFiRwcmJPJYAZb7q3bgEpmaAD3vspmV/+23nLfpWUZSU5gziwr1Hw
         nqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783903512; x=1784508312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AQf1CAUNAtnIVfjLPx88qIGR+2f318ab9r/g6rSng0g=;
        b=ZXFthqDH9OR341etL7dHjxFRJLmhEyf9w8DlmeA7A3wW43dVMSYWvreVtiJ9/77540
         xIRMcwRrgsB3VK3L6nVUW2ekj3OrX5xSRUlwzYwVdZ5VgE5AVdJeMCE5jrBMRrHGXuEx
         th7vJy9VEwry7x+Jc5+MF7ueivjjaYjTQ/MU5RVCcIqvOUKh6+2SwnOn/WIf9jWVkyg5
         ZWuKWsSqtCrkKUp/g8nhSCEqOUOcdEOZ+ol3Y8xKvWrKmEe5y3GjRvciQ+/8Ilu9AUrG
         8DngYU4KwTi6ou5nUIRhR3b+lZIprVKQzIIZ2C5K8uh36oBEcTeonWBBs+jZGKMtSSpA
         iofw==
X-Gm-Message-State: AOJu0Yzq5HaVXjoDwDBMzgJqd2EtstZvE6dYNeVFj4g7f8qch3Y1ZGO1
	KUC5nEtRynaMzJvX2bUptUgtXBiDVX2+ffzOWWcjaxFxcXCWJ0JvA7WFHTk3T3LZLYA=
X-Gm-Gg: AfdE7ckzOnQLuMnQ5NFqwvsC+YVUXy0lrezLSxOhAU5VjzrSaJKSJzr41reevw6bmXs
	JaSOzUtFgLyj4L/MH4I0Fopylk6lkEI/YsvK934ypgP1qMVlRo9HU9H0E0E5NwhJ6O2w4MEqVp4
	gs9b/ObEnlO4cNz2DbGSWI+RvhKGPCRlDEpNjYAdAmvQJYHIjxgNR/NIiz9vHuUd3n4zWD20qq/
	R+ni9o3TP9KJQYB2gkN3R0qeSPxbnzRau+KBY/DSyk+z0qg4Csr++vmmvK+Nw4VdOBiaVK3xqm2
	y4GW62Ep6Sxuo3WE3sL7CQ4fDz+tOf7U5dGaP7y/VmIeb0iG8ffbNQUSHbdjFog90Sfj+xmlloV
	V5PjCz35iPJWCyEolNsUcIdXaGyhp8r0fP6cyXVSLvofPpA7W/e5wa+LboVyfOoVIR1p/eUohri
	Pn9V15Tx0g7+VTHWVkc7YFIhGfr3PFVUl9oaX3Fngglcom6KhKHYaePH1CU0EhmyZsFNCFf3e1J
	lxaD2xaiz5jXjam3VXpfuhPH/PAPxwicpnXn9cQDT5uDn/JTjG28RV53t6jEpMdxz3VStf837Cx
	TpORD2RbgG8EJ7ZO4aawot9t5u2sww==
X-Received: by 2002:a05:6300:91:b0:3bf:9e25:1a17 with SMTP id adf61e73a8af0-3c110a0f8d3mr7030590637.12.1783903511583;
        Sun, 12 Jul 2026 17:45:11 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm71206990c88.7.2026.07.12.17.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 17:45:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 5/8] gerbera: fix build against fmt 12.2.0
Date: Sun, 12 Jul 2026 17:44:59 -0700
Message-ID: <20260713004502.716970-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713004502.716970-1-khem.raj@oss.qualcomm.com>
References: <20260713004502.716970-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 00:45:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128147

fmt 12.2.0 turns <fmt/core.h> into a shim that only pulls in
<fmt/base.h>, which no longer declares fmt::format() and no longer drags
in <cstring> transitively. gerbera 3.0.0 relied on both, so do_compile
fails first with:

  src/exceptions.cc:37:31: error: no member named 'format' in namespace 'fmt'

and, once that is addressed, with a second wave of:

  src/util/thread_runner.h:194:68: error: no member named 'strerror' in namespace 'std'
  src/content/inotify/mt_inotify.cc:163:13: error: no member named 'memcpy' in namespace 'std'
  src/util/url_utils.cc:144:24: error: no member named 'strchr' in namespace 'std'

Add two backport patches:

* 0001 switches the central headers exceptions.h and search_handler.h
  from <fmt/core.h> to <fmt/format.h> (upstream commit 9507706136fd).
* 0002 adds an explicit #include <cstring> to every translation unit
  that uses std::strerror/std::memcpy/std::strchr (based on upstream
  commit 7caa9ae9ebf5, extended to cover all affected files in this
  release).

Neither fix is in any released gerbera tag (both are master-only), so a
version bump would not help; backporting is the least invasive option.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-against-fmt-12-include-fmt-format.h.patch |  53 +++++
 ...-cstring-for-std-strerror-std-memcpy.patch | 204 ++++++++++++++++++
 .../gerbera/gerbera_3.0.0.bb                  |   5 +-
 3 files changed, 261 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-fix-build-against-fmt-12-include-fmt-format.h.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gerbera/gerbera/0002-include-cstring-for-std-strerror-std-memcpy.patch

diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-fix-build-against-fmt-12-include-fmt-format.h.patch b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-fix-build-against-fmt-12-include-fmt-format.h.patch
new file mode 100644
index 0000000000..eaaf7869e5
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-fix-build-against-fmt-12-include-fmt-format.h.patch
@@ -0,0 +1,53 @@
+From 9507706136fd0000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 8 Jul 2026 00:00:00 +0000
+Subject: [PATCH] fix build against fmt 12: include fmt/format.h
+
+Since fmt 11, <fmt/core.h> is a thin shim that only pulls in <fmt/base.h>
+and no longer declares fmt::format() unless FMT_DEPRECATED_HEAVY_CORE is
+defined. fmt 12.2.0 finishes the job and the build fails with:
+
+  src/exceptions.cc:37:31: error: no member named 'format' in namespace 'fmt'
+      : std::runtime_error(fmt::format("{}: Error: {}", message, userMessage))
+
+Include <fmt/format.h> in the central headers that expose fmt::format()
+to the rest of the tree (exceptions.h via throw_std_runtime_error, and
+search_handler.h) so all consumers see the declaration again.
+
+Backport of gerbera commit 9507706136fd.
+
+Upstream-Status: Backport [https://github.com/gerbera/gerbera/commit/9507706136fd]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/exceptions.h            | 2 +-
+ src/database/search_handler.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/exceptions.h b/src/exceptions.h
+index 1111111..2222222 100644
+--- a/src/exceptions.h
++++ b/src/exceptions.h
+@@ -34,7 +34,7 @@
+ #ifndef __EXCEPTIONS_H__
+ #define __EXCEPTIONS_H__
+
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ #include <stdexcept>
+ #include <string>
+
+diff --git a/src/database/search_handler.h b/src/database/search_handler.h
+index 3333333..4444444 100644
+--- a/src/database/search_handler.h
++++ b/src/database/search_handler.h
+@@ -32,7 +32,7 @@
+ #include "util/tools.h"
+
+ #include <algorithm>
+-#include <fmt/core.h>
++#include <fmt/format.h>
+ #include <map>
+ #include <memory>
+ #include <tuple>
+--
+2.43.0
diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera/0002-include-cstring-for-std-strerror-std-memcpy.patch b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0002-include-cstring-for-std-strerror-std-memcpy.patch
new file mode 100644
index 0000000000..14742f4727
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0002-include-cstring-for-std-strerror-std-memcpy.patch
@@ -0,0 +1,204 @@
+From 7caa9ae9ebf50000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 8 Jul 2026 00:00:01 +0000
+Subject: [PATCH] include <cstring> for std::strerror / std::memcpy / std::strchr
+
+Several translation units use std::strerror(), std::memcpy() and
+std::strchr() but relied on <cstring> being pulled in transitively
+through <fmt/core.h> (and other headers). With fmt 12 the fmt headers no
+longer drag in <cstring>, so the build fails with:
+
+  src/util/thread_runner.h:194:68: error: no member named 'strerror' in namespace 'std'
+  src/content/inotify/mt_inotify.cc:163:13: error: no member named 'memcpy' in namespace 'std'
+  src/util/url_utils.cc:144:24: error: no member named 'strchr' in namespace 'std'
+
+Include <cstring> explicitly in every file that uses these functions.
+
+Based on upstream gerbera commit 7caa9ae9ebf5, extended to cover all
+affected translation units in this release.
+
+Upstream-Status: Backport [https://github.com/gerbera/gerbera/commit/7caa9ae9ebf5]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+--- a/src/main.cc
++++ b/src/main.cc
+@@ -40,6 +40,7 @@
+ #define GRB_LOG_FAC GrbLogFacility::server
+
+ #include "config/config_definition.h"
++#include <cstring>
+ #include "config/config_manager.h"
+ #include "config/config_val.h"
+ #include "config/grb_runtime.h"
+--- a/src/database/sqlite3/sqlite_database.cc
++++ b/src/database/sqlite3/sqlite_database.cc
+@@ -33,6 +33,7 @@
+ #define GRB_LOG_FAC GrbLogFacility::sqlite3
+
+ #include "sqlite_database.h" // API
++#include <cstring>
+
+ #include "cds/cds_enums.h"
+ #include "config/config.h"
+--- a/src/database/postgres/postgres_database.cc
++++ b/src/database/postgres/postgres_database.cc
+@@ -25,6 +25,7 @@
+
+ #ifdef HAVE_PGSQL
+ #include "postgres_database.h" // API
++#include <cstring>
+
+ #include "cds/cds_enums.h"
+ #include "config/config.h"
+--- a/src/iohandler/mem_io_handler.cc
++++ b/src/iohandler/mem_io_handler.cc
+@@ -33,6 +33,7 @@
+ #define GRB_LOG_FAC GrbLogFacility::iohandler
+
+ #include "mem_io_handler.h" // API
++#include <cstring>
+
+ #include "exceptions.h"
+
+--- a/src/iohandler/process_io_handler.cc
++++ b/src/iohandler/process_io_handler.cc
+@@ -33,6 +33,7 @@
+ #define GRB_LOG_FAC GrbLogFacility::iohandler
+
+ #include "process_io_handler.h" // API
++#include <cstring>
+
+ #include "content/content.h"
+ #include "exceptions.h"
+--- a/src/iohandler/curl_io_handler.cc
++++ b/src/iohandler/curl_io_handler.cc
+@@ -34,6 +34,7 @@
+
+ #ifdef HAVE_CURL
+ #include "curl_io_handler.h" // API
++#include <cstring>
+
+ #include "config/config.h"
+ #include "exceptions.h"
+--- a/src/config/grb_runtime.cc
++++ b/src/config/grb_runtime.cc
+@@ -22,6 +22,7 @@
+ #define GRB_LOG_FAC GrbLogFacility::server
+
+ #include "grb_runtime.h" // API
++#include <cstring>
+
+ #include "config/config.h"
+ #include "config/config_definition.h"
+--- a/src/util/grb_net.cc
++++ b/src/util/grb_net.cc
+@@ -21,6 +21,7 @@
+ /// @file util/grb_net.cc
+ #define GRB_LOG_FAC GrbLogFacility::clients
+ #include "grb_net.h" // API
++#include <cstring>
+
+ #include "exceptions.h"
+ #include "logger.h"
+--- a/src/util/grb_fs.cc
++++ b/src/util/grb_fs.cc
+@@ -21,6 +21,7 @@
+ /// @file util/grb_fs.cc
+ #define GRB_LOG_FAC GrbLogFacility::content
+ #include "grb_fs.h" // API
++#include <cstring>
+
+ #include "exceptions.h"
+ #include "util/logger.h"
+--- a/src/config/setup/config_setup_path.cc
++++ b/src/config/setup/config_setup_path.cc
+@@ -25,6 +25,7 @@
+ #define GRB_LOG_FAC GrbLogFacility::config
+
+ #include "config_setup_path.h" // API
++#include <cstring>
+
+ #include "config/config_definition.h"
+ #include "config/config_options.h"
+--- a/src/util/thread_executor.cc
++++ b/src/util/thread_executor.cc
+@@ -32,6 +32,7 @@
+ /// @file util/thread_executor.cc
+
+ #include "thread_executor.h" // API
++#include <cstring>
+
+ #include "util/logger.h"
+
+--- a/src/util/thread_runner.h
++++ b/src/util/thread_runner.h
+@@ -28,6 +28,7 @@
+
+ #include "config/config.h"
+ #include "thread_executor.h"
++#include <cstring>
+ #include "util/logger.h"
+
+ #include <chrono>
+--- a/src/util/string_converter.cc
++++ b/src/util/string_converter.cc
+@@ -32,6 +32,7 @@
+ /// @file util/string_converter.cc
+ #define GRB_LOG_FAC GrbLogFacility::util
+ #include "string_converter.h" // API
++#include <cstring>
+
+ #include "common.h"
+ #include "config/config.h"
+--- a/src/content/inotify/mt_inotify.cc
++++ b/src/content/inotify/mt_inotify.cc
+@@ -41,6 +41,7 @@
+
+ #ifdef HAVE_INOTIFY
+ #include "mt_inotify.h"
++#include <cstring>
+
+ #include "exceptions.h"
+ #include "util/logger.h"
+--- a/src/metadata/metacontent_handler.cc
++++ b/src/metadata/metacontent_handler.cc
+@@ -25,6 +25,7 @@
+ #define GRB_LOG_FAC GrbLogFacility::metadata
+
+ #include "metacontent_handler.h" // API
++#include <cstring>
+
+ #include "cds/cds_item.h"
+ #include "cds/cds_objects.h"
+--- a/src/transcoding/transcode_ext_handler.cc
++++ b/src/transcoding/transcode_ext_handler.cc
+@@ -33,6 +33,7 @@
+ #define GRB_LOG_FAC GrbLogFacility::transcoding
+
+ #include "transcode_ext_handler.h" // API
++#include <cstring>
+
+ #include "cds/cds_objects.h"
+ #include "config/config.h"
+--- a/src/util/tools.cc
++++ b/src/util/tools.cc
+@@ -32,6 +32,7 @@
+ /// @file util/tools.cc
+ #define GRB_LOG_FAC GrbLogFacility::content
+ #include "tools.h" // API
++#include <cstring>
+
+ #include "config/config.h"
+ #include "contrib/md5.h"
+--- a/src/util/url_utils.cc
++++ b/src/util/url_utils.cc
+@@ -22,6 +22,7 @@
+ /// @file util/url_utils.cc
+ #define GRB_LOG_FAC GrbLogFacility::content
+ #include "url_utils.h" // API
++#include <cstring>
+
+ #include "exceptions.h"
+
+--
+2.43.0
diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.0.0.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.0.0.bb
index fdbd91f9b0..a08c31d0c2 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.0.0.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.0.0.bb
@@ -3,7 +3,10 @@ Description = "Gerbera is a UPnP media server which allows you to stream your di
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"

-SRC_URI = "git://github.com/gerbera/gerbera.git;protocol=https;branch=master;tag=v${PV}"
+SRC_URI = "git://github.com/gerbera/gerbera.git;protocol=https;branch=master;tag=v${PV} \
+           file://0001-fix-build-against-fmt-12-include-fmt-format.h.patch \
+           file://0002-include-cstring-for-std-strerror-std-memcpy.patch \
+           "
 SRCREV = "7846f3dd5d0f848a60d0c3146c3b7290881a8992"



