Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37948.1795594099883352445
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Eb8vG2YT;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38190551625so10924640eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594099; x=1796198899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=syy2hF49+XpusiacvsrruCFY5B6Tt2pdLY7EYpO4ojM=;
        b=Eb8vG2YTO3MrGQ+MYiDUEI7fDuDsNyMTmMsayseRtLrJjDpPIQA4yB7FUswu1AsdRY
         EjP6NsmYN32cavPLvUzEfbN3ZebSubg3nUyEHl7tISfCpE9/iZ+96PZi+gjP/Va15r4r
         YBgdPbIY80yWiJOtBvbOBPsSqNaSqXIRU34zTt0iZrzQJS4pEx+XZj4cK8KqYk2lQHf9
         VV9ccjyGGfc6EsvB3z2Ox1ONwEpE88E/F2nmi+Egu0dCZkPZpniT/v4gFWYwBnUHaw0Z
         WsYiv28Oxlzj5pD4UkxXILA9k4LjnyJRxSoeGvA2XEwf/e2pYxtXhocYfhGnYDzizu5q
         r+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594099; x=1796198899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=syy2hF49+XpusiacvsrruCFY5B6Tt2pdLY7EYpO4ojM=;
        b=P4xHQp+n6Hjp7HP6nCr0LziFA3MVG6GqOO4YtifAKMrZeolUteVN4+LyqRedyspUUV
         j6kjwZsopdnTvNB9pqnTwsJ1NJkADdFZ5H9PbQSH1Mo5sDBCOb4fDSCGub9zGG21RHxW
         O3nSyZNQhRZlYNDf4OEgJ5uyXdywFiKvyimyF9UKcZrxLEz1y8FnFXqGsQm9B/n4iIXv
         JcSV3spiSicLHUi6kSsFwr4dG/pdfT4Vwx4pgoPI1HJoqM5d5TfD3/3bmI6tn+X9Jfr3
         d2KaLuKDZ1NcWEMXn1wajZJf6GmC1SKPutvMbLYCfSZCABkGPJk+1NbWVOL7K2lu5iqQ
         bkzg==
X-Gm-Message-State: APuU4Z81q94pOIolggtgCujRnsgQ7pKBUcnXB1LbeAq1RvsCI0IS/INN
	WlDTAwxoakl7V9ccGROa3TY+PEdFBgyx5xJuC/TCgR0/Kw4Nje53N/WkMc0jGeiT
X-Gm-Gg: AZFdTZcnMJb3ZMqDiwEchSWenaArw55X+b2Bq1G5JJOjhGUYvNH4byRYWoOOLcRkEHR
	gTJRhHMJ/1vrGiTDjOo37TmcbcCvnMkO2WyQinQIkKxlv0bI4rI9G5QucGRrB+8352QFwtonpzS
	E757SGs0V7WJm9PPNafyx8BuqnM+0uwelzljom8yXP2o7OQk4iR+j42uYdYp1lrfkMaepFgwiwl
	QW2PbLEcl13SIbsBIAnT/K1X5Ncv6wWBvqtukmUk+/4wi/PE6dFRUgcPNJwFq7QkaKrEi4PT8Id
	MAOLv/vZP1Pmd9IqY1RNdqKj8tBF2CwowAYBY07f0V+aXoW3D6grVna3d8i2Kw7Omc+zIKvxyq7
	tHkN7QqKToe2ivw2cWgPDKoah88z4dI0vEDGWyB1quluYGlcrdVkyZ/N9B4rEl8jGycQTybfY6J
	VL2Q9nTQIXU9Hg+QBZ9ej6YWcAbxgYm9dtN+teVRHpMWE0Kt1FCyRck4A8PyzlS3MFflwg+9cNf
	Hsv3QqE+VFeeQaJCJFEg5aKJf7MKeOcrQ9wxogUG9bCbsd66NpznEXAJADRU3aOE0DSaNOlmhlN
	E6pv81ZikOe2pdhxIkJDVobPfA4VKlzyCZdk8FyFbsiwovetclUIaL0e+yTZ49JN4XMXHmY/ppR
	XqhbWSYzAG5S5eyIP2m8hHHSdvr3SYGNXpGE//d1Ccd086xk+eVxrktu19lvS4OTavVIbKeZQQT
	bexyRRBwJtgywZAiceXC44R5rLtfwrHZjfBV5yYLtFgHPO3SIKFWxlkVKVWv78Cmqj8yPfUSAZS
	GnUY58aQVjpfalv1jqD3b9yH9gm2VmW9hGk3JprPf4OpshtAcS5RodXKPxluE4jhpTlmQef4uUf
	vZ1m
X-Received: by 2002:a05:7301:6192:10b0:386:a7f2:88e2 with SMTP id 5a478bee46e88-386a7f28967mr10615504eec.23.1795594099064;
        Wed, 25 Nov 2026 00:08:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 29/55] android-tools: Fix build with protobuf >= 36
Date: Wed, 25 Nov 2026 00:06:45 -0800
Message-ID: <20261125080732.2419614-35-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133032
Content-Type: text/plain; charset="utf-8"

protobuf 36's descriptor.h includes absl/log/log.h, whose LOG and VLOG
macros replace the libbase ones that adb uses, so adb's D() trace macro
expands to Abseil logging and fails with "use of undeclared identifier
'STATELESS'" (e.g. in daemon/jdwp_service.cpp).

Backport the fix from nmeum/android-tools, which includes descriptor.h
first from sysdeps.h so libbase's macros win, adapted to the Debian
35.0.2 source layout.

This older source includes sysdeps.h late in more files, and the Debian
makefiles also build adbd, so more sources need the same treatment:
include sysdeps.h (or the protobuf header) before libbase's logging
headers, otherwise adb and adbd fail to link with absl VLogSite
undefined and other files log through Abseil. Also rename usb_ffs.cpp's
strings descriptor, which clashes with the global namespace strings
declared by Abseil's cord.h.

Add an upstream version check against the Debian pool.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-logging-macros-after-protobuf-inclu.patch |  67 +++++
 ...bbase-logging-macros-in-more-sources.patch | 257 ++++++++++++++++++
 .../android-tools/android-tools_35.0.2.bb     |   5 +
 3 files changed, 329 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0017-adb-keep-libbase-logging-macros-after-protobuf-inclu.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0018-adb-keep-libbase-logging-macros-in-more-sources.patch

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0017-adb-keep-libbase-logging-macros-after-protobuf-inclu.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0017-adb-keep-libbase-logging-macros-after-protobuf-inclu.patch
new file mode 100644
index 0000000000..e76a9d345e
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0017-adb-keep-libbase-logging-macros-after-protobuf-inclu.patch
@@ -0,0 +1,67 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Felix Yan <felixonmars@archlinux.org>
+Date: Thu, 27 Aug 2026 16:00:00 +0800
+Subject: [PATCH] adb: keep libbase logging macros after protobuf includes
+
+Protobuf 36's descriptor.h includes absl/log/log.h, which defines the
+short LOG and VLOG macros. Several adb sources include generated protobuf
+headers after adb's libbase logging/trace headers; those protobuf headers
+then replace adb's macros and make adb_trace.h's LOG(DEBUG) expand as
+Abseil logging, where DEBUG is not a valid severity.
+
+sysdeps.h is the first include for most adb translation units. Include
+descriptor.h first from it, so Abseil's short logging macros are seen
+before android-base/logging.h and adb_trace.h install adb's macros.
+Include sysdeps.h first from adb_install.cpp too.
+
+This keeps adb's logging behavior intact and avoids per-include macro
+save/restore blocks.
+
+Adapted to the Debian android-platform-tools 35.0.2 source layout. This
+version's sysdeps.h has no protobuf-first include yet, and has no
+mdns_tracker.cpp. Includes the adb_install.cpp change from the follow-up
+commit
+https://github.com/nmeum/android-tools/commit/9a1844a13b5519a879de88f1dcb1c06fcad15780
+
+Upstream-Status: Backport [https://github.com/nmeum/android-tools/commit/69a8c54dcd8c49d5b5eb22fa5c3c992d80e0bb2b]
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ packages/modules/adb/client/adb_install.cpp | 2 +-
+ packages/modules/adb/sysdeps.h              | 7 +++++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+--- a/packages/modules/adb/client/adb_install.cpp
++++ b/packages/modules/adb/client/adb_install.cpp
+@@ -14,6 +14,7 @@
+  * limitations under the License.
+  */
+ 
++#include "sysdeps.h"
+ #include "adb_install.h"
+ 
+ #include <fcntl.h>
+@@ -39,7 +40,6 @@
+ #include "commandline.h"
+ #include "fastdeploy.h"
+ #include "incremental.h"
+-#include "sysdeps.h"
+ 
+ using namespace std::literals;
+ 
+--- a/packages/modules/adb/sysdeps.h
++++ b/packages/modules/adb/sysdeps.h
+@@ -24,6 +24,13 @@
+ #  undef _WIN32
+ #endif
+ 
++// Include protobuf headers first, because they expose Abseil's LOG/VLOG macros
++// that android-base/logging.h and adb_trace.h redefine later. Not all modules
++// that include sysdeps.h use protobufs, so only include them if they exist.
++#if __has_include("google/protobuf/descriptor.h")
++#include "google/protobuf/descriptor.h"
++#endif
++
+ #include <errno.h>
+ 
+ #include <optional>
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0018-adb-keep-libbase-logging-macros-in-more-sources.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0018-adb-keep-libbase-logging-macros-in-more-sources.patch
new file mode 100644
index 0000000000..fc00ead361
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0018-adb-keep-libbase-logging-macros-in-more-sources.patch
@@ -0,0 +1,257 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 23 Nov 2026 12:00:00 -0800
+Subject: [PATCH] adb: keep libbase logging macros in more sources
+
+With protobuf >= 36, a protobuf header included after
+android-base/logging.h or adb_trace.h replaces the LOG/VLOG macros with
+Abseil's. The previous patch includes descriptor.h from sysdeps.h, so
+include sysdeps.h before libbase's logging headers in the adb, adbd and
+libadb sources that include them first, and include pairing.pb.h first
+in pairing_connection.cpp, which does not use sysdeps.h. Otherwise VLOG
+expands to Abseil's and adb/adbd fail to link with undefined
+absl::log_internal::VLogSite symbols, and other files silently log
+through Abseil instead of libbase.
+
+sysdeps.h redefines open/close/read as macros, so where a file includes
+<fstream> or <sstream>, keep the standard headers before sysdeps.h.
+
+Abseil's cord.h declares a global namespace strings, which clashes with
+the static strings descriptor in usb_ffs.cpp, so rename it to
+usb_strings.
+
+Upstream-Status: Pending
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ packages/modules/adb/adb_io.cpp                                |    2 +-
+ packages/modules/adb/adb_listeners.cpp                         |    2 +-
+ packages/modules/adb/adb_utils.cpp                             |    2 +-
+ packages/modules/adb/client/adb_wifi.cpp                       |    7 ++++---
+ packages/modules/adb/client/incremental_server.cpp             |    3 ++-
+ packages/modules/adb/client/incremental_utils.cpp              |    2 +-
+ packages/modules/adb/client/pairing/pairing_client.cpp         |    3 ++-
+ packages/modules/adb/daemon/adb_wifi.cpp                       |    2 +-
+ packages/modules/adb/daemon/usb_ffs.cpp                        |    6 +++---
+ packages/modules/adb/pairing_connection/pairing_connection.cpp |    4 ++--
+ packages/modules/adb/transport_fd.cpp                          |    3 ++-
+ 11 files changed, 20 insertions(+), 16 deletions(-)
+
+--- a/packages/modules/adb/adb_io.cpp
++++ b/packages/modules/adb/adb_io.cpp
+@@ -16,6 +16,7 @@
+ 
+ #define TRACE_TAG RWX
+ 
++#include "sysdeps.h"
+ #include "adb_io.h"
+ 
+ #include <unistd.h>
+@@ -32,7 +33,6 @@
+ #include "adb.h"
+ #include "adb_trace.h"
+ #include "adb_utils.h"
+-#include "sysdeps.h"
+ 
+ bool SendProtocolString(borrowed_fd fd, std::string_view s) {
+     unsigned int length = s.size();
+--- a/packages/modules/adb/adb_listeners.cpp
++++ b/packages/modules/adb/adb_listeners.cpp
+@@ -14,6 +14,7 @@
+  * limitations under the License.
+  */
+ 
++#include "sysdeps.h"
+ #include "adb_listeners.h"
+ 
+ #include <stdio.h>
+@@ -29,7 +30,6 @@
+ #include <cutils/sockets.h>
+ 
+ #include "socket_spec.h"
+-#include "sysdeps.h"
+ #include "transport.h"
+ 
+ // A listener is an entity which binds to a local port and, upon receiving a connection on that
+--- a/packages/modules/adb/adb_utils.cpp
++++ b/packages/modules/adb/adb_utils.cpp
+@@ -16,6 +16,7 @@
+ 
+ #define TRACE_TAG ADB
+ 
++#include "sysdeps.h"
+ #include "adb_utils.h"
+ #include "adb_unique_fd.h"
+ 
+@@ -35,7 +36,6 @@
+ 
+ #include "adb.h"
+ #include "adb_trace.h"
+-#include "sysdeps.h"
+ 
+ #ifdef _WIN32
+ #  ifndef WIN32_LEAN_AND_MEAN
+--- a/packages/modules/adb/client/adb_wifi.cpp
++++ b/packages/modules/adb/client/adb_wifi.cpp
+@@ -14,13 +14,15 @@
+  * limitations under the License.
+  */
+ 
+-#include "adb_wifi.h"
+-
+ #include <fstream>
+ #include <random>
+ #include <thread>
+ #include <type_traits>
+ 
++#include "sysdeps.h"
++
++#include "adb_wifi.h"
++
+ #include <adb/crypto/key.h>
+ #include <adb/crypto/x509_generator.h>
+ #include <android-base/file.h>
+@@ -32,7 +34,6 @@
+ #include "adb_mdns.h"
+ #include "adb_utils.h"
+ #include "client/adb_client.h"
+-#include "sysdeps.h"
+ 
+ using adbwifi::pairing::PairingClient;
+ using namespace adb::crypto;
+--- a/packages/modules/adb/client/incremental_server.cpp
++++ b/packages/modules/adb/client/incremental_server.cpp
+@@ -34,6 +34,8 @@
+ #include <type_traits>
+ #include <unordered_set>
+ 
++#include "sysdeps.h"
++
+ #include "adb.h"
+ #include "adb_client.h"
+ #include "adb_io.h"
+@@ -41,7 +43,6 @@
+ #include "adb_unique_fd.h"
+ #include "adb_utils.h"
+ #include "incremental_utils.h"
+-#include "sysdeps.h"
+ 
+ namespace incremental {
+ 
+--- a/packages/modules/adb/client/incremental_utils.cpp
++++ b/packages/modules/adb/client/incremental_utils.cpp
+@@ -16,6 +16,7 @@
+ 
+ #define TRACE_TAG INCREMENTAL
+ 
++#include "sysdeps.h"
+ #include "incremental_utils.h"
+ 
+ #include <android-base/endian.h>
+@@ -32,7 +33,6 @@
+ 
+ #include "adb_io.h"
+ #include "adb_trace.h"
+-#include "sysdeps.h"
+ 
+ using namespace std::literals;
+ 
+--- a/packages/modules/adb/client/pairing/pairing_client.cpp
++++ b/packages/modules/adb/client/pairing/pairing_client.cpp
+@@ -23,13 +23,14 @@
+ #include <thread>
+ #include <vector>
+ 
++#include "sysdeps.h"
++
+ #include <android-base/logging.h>
+ #include <android-base/parsenetaddress.h>
+ #include <android-base/stringprintf.h>
+ #include <android-base/thread_annotations.h>
+ #include <android-base/unique_fd.h>
+ #include <cutils/sockets.h>
+-#include "sysdeps.h"
+ 
+ namespace adbwifi {
+ namespace pairing {
+--- a/packages/modules/adb/daemon/adb_wifi.cpp
++++ b/packages/modules/adb/daemon/adb_wifi.cpp
+@@ -14,6 +14,7 @@
+  * limitations under the License.
+  */
+ 
++#include "sysdeps.h"
+ #include "adb_wifi.h"
+ 
+ #include <unistd.h>
+@@ -24,7 +25,6 @@
+ 
+ #include "adb.h"
+ #include "daemon/mdns.h"
+-#include "sysdeps.h"
+ #include "transport.h"
+ 
+ using namespace android::base;
+--- a/packages/modules/adb/daemon/usb_ffs.cpp
++++ b/packages/modules/adb/daemon/usb_ffs.cpp
+@@ -235,10 +235,10 @@
+         __le16 code;
+         const char str1[sizeof(STR_INTERFACE_)];
+     } __attribute__((packed)) lang0;
+-} __attribute__((packed)) strings = {
++} __attribute__((packed)) usb_strings = {
+     .header = {
+         .magic = cpu_to_le32(FUNCTIONFS_STRINGS_MAGIC),
+-        .length = cpu_to_le32(sizeof(strings)),
++        .length = cpu_to_le32(sizeof(usb_strings)),
+         .str_count = cpu_to_le32(1),
+         .lang_count = cpu_to_le32(1),
+     },
+@@ -294,7 +294,7 @@
+             }
+         }
+ 
+-        if (adb_write(control.get(), &strings, sizeof(strings)) < 0) {
++        if (adb_write(control.get(), &usb_strings, sizeof(usb_strings)) < 0) {
+             PLOG(ERROR) << "failed to write USB strings";
+             return false;
+         }
+--- a/packages/modules/adb/pairing_connection/pairing_connection.cpp
++++ b/packages/modules/adb/pairing_connection/pairing_connection.cpp
+@@ -14,6 +14,8 @@
+  * limitations under the License.
+  */
+ 
++#include "pairing.pb.h"
++
+ #include "adb/pairing/pairing_connection.h"
+ 
+ #include <stddef.h>
+@@ -32,8 +34,6 @@
+ #include <android-base/macros.h>
+ #include <android-base/unique_fd.h>
+ 
+-#include "pairing.pb.h"
+-
+ using namespace adb;
+ using android::base::unique_fd;
+ using TlsError = tls::TlsConnection::TlsError;
+--- a/packages/modules/adb/transport_fd.cpp
++++ b/packages/modules/adb/transport_fd.cpp
+@@ -14,6 +14,8 @@
+  * limitations under the License.
+  */
+ 
++#include "sysdeps.h"
++
+ #include <stdint.h>
+ 
+ #include <deque>
+@@ -28,7 +30,6 @@
+ 
+ #include "adb_unique_fd.h"
+ #include "adb_utils.h"
+-#include "sysdeps.h"
+ #include "transport.h"
+ #include "types.h"
+ 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
index 38b522084d..c2c5ae4c86 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
@@ -61,6 +61,8 @@ SRC_URI = "https://deb.debian.org/debian/pool/main/a/android-platform-tools/andr
            file://0014-daemon-auth-vendor-a-portable-b64_pton-for-non-glib.patch \
            file://0015-adbd-make-fs-config-opt-in-on-non-android-builds.patch \
            file://0016-libziparchive-include-cstdint-in-zip_writer.h.patch \
+           file://0017-adb-keep-libbase-logging-macros-after-protobuf-inclu.patch \
+           file://0018-adb-keep-libbase-logging-macros-in-more-sources.patch \
            "
 
 SRC_URI[orig.md5sum] = "352376965cdef7bd7505d8fefdd43d50"
@@ -68,6 +70,9 @@ SRC_URI[orig.sha256sum] = "ec1d317608db3328bfbddf7152c8d7f185c7c87b2175081416344
 SRC_URI[debian.md5sum] = "1de890bd272da9e8cd35bc9579802f1f"
 SRC_URI[debian.sha256sum] = "f03a89b82ea8dfbe3cb77d5326eedf0d15984f5896885e8c5df64cf421819579"
 
+UPSTREAM_CHECK_URI = "https://deb.debian.org/debian/pool/main/a/android-platform-tools/"
+UPSTREAM_CHECK_REGEX = "android-platform-tools_(?P<pver>\d+(\.\d+)+)\.orig\.tar"
+
 S = "${UNPACKDIR}/android-platform-tools-${PV}"
 B = "${UNPACKDIR}/${BPN}"
 
