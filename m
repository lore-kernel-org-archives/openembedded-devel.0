Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136DCEFCD8C
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:06:44 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10757.1773050801065498679
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=DDeFH1v3;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1334352-20260309100639cc0a663ba40002077f-vps09b@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260309100639cc0a663ba40002077f
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 09 Mar 2026 11:06:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=OgGrUrBgasA/JRAkGjNiaIwRWEg9GEprm7LAXQWysrI=;
 b=DDeFH1v3NVnJ8P6JcTe9lkqjN7Bz5SPLAg6R7cN+2a/a+ZxnAWsfD92V7HIT1xa+tUM7cb
 Svsu1XQbZYOcRLjnUPyRMJcZboBA4prMvpgcwT4U+ST4Y0uHYBSgDdTvt/7HWeV2BkZjP5qW
 pCTA2Qh/ZBDV/pnVkPaVIbNzR5WvTqVUzB5fonaKnH719INWWy32GLuPY/DYy2ier/iCMq9B
 bUoi8Oyg4x4AjfuAWDEJZQhDgv4kp43RablzHLt4Bb4N/6WRVYCJenGrVeVrBVuFt1AfofME
 X4wp5UKEbQXVZQIVoyNlVy7jdhZcloq0zyXSUtPBvLk+SSjaseS2Cebg==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH 03/14] grpc: upgrade 1.76.0 -> 1.78.1
Date: Mon,  9 Mar 2026 11:06:19 +0100
Message-ID: <20260309100630.404637-3-andrej.kozemcak@siemens.com>
In-Reply-To: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
References: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124976

Removed patch included in this release

Changelogs

v1.78.1:
  https://github.com/grpc/grpc/releases/tag/v1.78.1

v1.78.1:
https://github.com/grpc/grpc/releases/tag/v1.78.0

C++:
- adding address_sorting dep in naming test build

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 ...001-build-add-missing-includes-41351.patch | 58 -------------------
 .../grpc/{grpc_1.76.0.bb => grpc_1.78.1.bb}   |  5 +-
 2 files changed, 2 insertions(+), 61 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-build-add-missing-includes-41351.patch
 rename meta-oe/recipes-devtools/grpc/{grpc_1.76.0.bb => grpc_1.78.1.bb} (95%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-build-add-missing-includes-41351.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-build-add-missing-includes-41351.patch
deleted file mode 100644
index bf1f22b906..0000000000
--- a/meta-oe/recipes-devtools/grpc/grpc/0001-build-add-missing-includes-41351.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From a976f66ac7d1b9f43a3071e22b5014fcfeab04b3 Mon Sep 17 00:00:00 2001
-From: "Mark D. Roth" <roth@google.com>
-Date: Tue, 6 Jan 2026 10:09:45 -0800
-Subject: [PATCH] [build] add missing includes (#41351)
-
-Fixes #41305.
-
-Closes #41351
-
-COPYBARA_INTEGRATE_REVIEW=https://github.com/grpc/grpc/pull/41351 from markdroth:add_missing_includes 223be6932adb00d085149c53167c1b0318745f6c
-PiperOrigin-RevId: 852829597
-
-Upstream-Status: Backport [https://github.com/grpc/grpc/commit/d54219b508423f0a2ff6a0b98c16fb6dafd44b84]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/grpc/event_engine/memory_request.h | 2 ++
- src/core/channelz/v2tov1/property_list.cc  | 1 +
- src/core/util/glob.cc                      | 2 ++
- 3 files changed, 5 insertions(+)
-
-diff --git a/include/grpc/event_engine/memory_request.h b/include/grpc/event_engine/memory_request.h
-index 76bcbb2036..ad8cab842e 100644
---- a/include/grpc/event_engine/memory_request.h
-+++ b/include/grpc/event_engine/memory_request.h
-@@ -17,6 +17,8 @@
- #include <grpc/support/port_platform.h>
- #include <stddef.h>
- 
-+#include <string>
-+
- #include "absl/strings/string_view.h"
- 
- namespace grpc_event_engine {
-diff --git a/src/core/channelz/v2tov1/property_list.cc b/src/core/channelz/v2tov1/property_list.cc
-index 64bbb6307c..03367cce7c 100644
---- a/src/core/channelz/v2tov1/property_list.cc
-+++ b/src/core/channelz/v2tov1/property_list.cc
-@@ -15,6 +15,7 @@
- #include "src/core/channelz/v2tov1/property_list.h"
- 
- #include <cstdint>
-+#include <limits>
- #include <optional>
- #include <string>
- 
-diff --git a/src/core/util/glob.cc b/src/core/util/glob.cc
-index 1b1c16e23d..22e54259f0 100644
---- a/src/core/util/glob.cc
-+++ b/src/core/util/glob.cc
-@@ -12,6 +12,8 @@
- // See the License for the specific language governing permissions and
- // limitations under the License.
- 
-+#include <algorithm>
-+
- #include "absl/strings/string_view.h"
- 
- namespace grpc_core {
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.76.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.78.1.bb
similarity index 95%
rename from meta-oe/recipes-devtools/grpc/grpc_1.76.0.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.78.1.bb
index 39c9fb98de..6739c659d3 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.76.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.78.1.bb
@@ -23,11 +23,10 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # Both dependencies are mutually exclusive
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
-SRCREV = "f5ffb68d8a2fd603dff16287e90a4ac571e1fec6"
-BRANCH = "v1.76.x"
+SRCREV = "5b6492ea90b2b867a6adad1b10a6edda28e860d1"
+BRANCH = "v1.78.x"
 SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;branch=${BRANCH};tag=v${PV} \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
-           file://0001-build-add-missing-includes-41351.patch \
            "
 
 inherit cmake pkgconfig
-- 
2.47.3


