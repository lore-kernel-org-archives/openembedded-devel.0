Return-Path: <SANJAY.CHITRODA@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51162E80ABE
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 11:27:07 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.web11.14989.1695986817612732699
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 04:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: vivelmur@cisco.com)
X-CSE-ConnectionGUID: qOmjKM3STaGPnQnG/ce1Rw==
X-CSE-MsgGUID: 2Wagt26xQm6I4n/SOrxTvQ==
X-IPAS-Result: =?us-ascii?q?A0ABAACbsxZlmJtdJa1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgXsFAQEBAQsBgy9VQEeMb4lCkw6KcRSBeQEBAQ0BATsJBAEBj?=
 =?us-ascii?q?BQCJjQJDgECBAEBAQEDAgMBAQEBAQEBAgEBBQEBAQIBBwQUAQEBAQEBAQEeG?=
 =?us-ascii?q?QUOECeFaA2GSQEtCwEYAS0sAwECWyMhgn4Bgl4DEbNLgXkzgQGDJAGwGIFSg?=
 =?us-ascii?q?UgBjD6DI4IvJ4IoglGCLYEFgUYXAoE4D4ZcBIlDhT4HFAQagiaDLCqBcUqIf?=
 =?us-ascii?q?SqBCAhcgWo9Ag1UCwtdgRGBJ4EdAgIROQ8FR1oWHQMHA1oqECsHBC8iBgkWL?=
 =?us-ascii?q?SUGUQQXFiQJExI+BIM4CoEGPxEOEYJEIgIHNjYZS4JbCRVATnYQKwQUF20ob?=
 =?us-ascii?q?h8VHjYREhcNAwh2HQIRIzwDBQMENgoVDQshBVcDRwZMCwMCHAUDAwSBNgUPH?=
 =?us-ascii?q?gIQLicDAxlOAhAUAz4DAwYDCzIDMFdLDFkDCQMHBUlAAwsYDUgRLDUUGwY/c?=
 =?us-ascii?q?weiGgMtQIJkPT4TASsJRzUTG5QMgxKMCYIdoEAHkBCVBk2FV6QKC5gnixaCT?=
 =?us-ascii?q?JUoZYQwAgQGBQIWgWM6gVtwgzcJSRkPV41SDguDJDKQGSQyAgkwAgcLAQEDC?=
 =?us-ascii?q?YhvgXxeAQE?=
IronPort-Data: A9a23:mydtVKzN4JFcXI1zPMh6t+eQxirEfRIJ4+MujC+fZmUNrF6WrkUOz
 GdNXTiGOvyPMTP2LtxxYY+w8U0P75LQndQxHVc4rFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlpCCea/lH0auSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 YiaT/H3Ygf/gGYlaDNMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE88jmSH
 rurIBmRpws1zj91Yj+Xuu+Tnn4iHtY+CTOzZk9+AMBOtPTtShsaic7XPNJEAateZq7gc9pZk
 L2hvrToIesl0zGldOk1C3Fl/y9C0aJu4ZjCI1ua6vevxmL+dULq7LJlARgMIthNkgp3KTkmG
 f0wMjsBaFWIgPi7he79Qeh3jcNlJ87uVG8dkig/lneCUrB3GtaaHviiCdxwhF/cguhQHOjTY
 88EcxJkbQ/LZFtEPVJ/5JcWxb3w3CehImUEwL6TjfAI6mfPllJh6b2zEYbTPeetX9VpgH/N8
 woq+EygUk1Fa7Rz0wGty3Pqre/CmwvkWYQeDrym++Qsi1qWrkQLBQEbTx2+qOO6jWalWt9aJ
 koPvCEpqMAa81SmSNT4VRC0rHOI+xIRRddUO+k78x2WjK3M7gCUA2IJQjJMZJohrsBebSYj1
 BmKn97sLTNqubyRD3ma89+8pDCvIjQYNz9aNQcLSAIE55/op4RbpgnGSNRqAei+jtzpAzb8y
 hiHrS4wgL4TjNYQka68+Dj6bymEvJPFSEs+4R/aGz7j5QJib4njbIutgbTG0RpeBJ++S1uim
 SM/p8Gx1OY3C77KnyHUevpYSdlF+M25GDHbhFduGbwo+DKs52OvcOhsDNdWeRoB3iEsJGKBX
 aPDhe9CzMQMYybyPMebd6r0Wpt6l/GxfTjwfqmMNoImX3RnSOOQEMhTiaO4xWvhlg0nlrsyf
 Mvdese3BnFcAqNipNZXewv/+eFwrszd7TqDLXwe8/hB+eHPDJJyYexVWGZilshjsMu5TP/p2
 9heLdCW7B5UTffzZCLamaZKcwFXfCJmVcup85MNHgJmHuaAMD94YxM26e15E7GJY4wO/gs11
 ijnAxQBmAaXaYPvcFvSMBiPl48Drb4m/S5kYkTAzH6j2mMoZs60/bwDep4sFYTLB8Q9pcOYu
 8ItIp3aatwWE2yv021EMfHV8tc4HDz13l3mAsZQSGVlF7Z6WRfz88PpFiO2snFm4tyf75Vu+
 tVNF2rzHPI+euiVJJ2HMar+kwvq4yZ1dSAbdxKgH+S/sX7EqOBCQxEdRNduSy3QAX0vHgen6
 js=
IronPort-HdrOrdr: A9a23:18zEOaPIT0Ya/8BcTsqjsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxflZnOjfK/mKIVyYygabvp
 0QF5RDNA==
X-Talos-CUID: 9a23:TMuNkWOTZULpse5DQQ5i9m0xQfsZe1Llyk7WDAizBD9TV+jA
X-Talos-MUID: 9a23:r0fhbQRb2bAJvgivRXS2uzhtKJ02852rVmFRl9I9nNOUCTJJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.03,187,1694736000"; 
   d="scan'208";a="120266904"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 11:26:56 +0000
Received: from sjc-ads-6897.cisco.com (sjc-ads-6897.cisco.com [10.30.218.17])
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id 38TBQu9d030267
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 29 Sep 2023 11:26:56 GMT
Received: by sjc-ads-6897.cisco.com (Postfix, from userid 1822629)
	id DDEDDCC12B5; Fri, 29 Sep 2023 04:26:55 -0700 (PDT)
From: sanjay.chitroda@einfochips.com
To: openembedded-devel@lists.openembedded.org
Cc: peter.marko@siemens.com, akuster808@gmail.com, Qi.Chen@windriver.com,
        raj.khem@gmail.com, Sanjay Chitroda <sanjay.chitroda@einfochips.com>
Subject: [meta-oe][PATCH 1/2] Revert "grpc: fix CVE-2023-32732"
Date: Fri, 29 Sep 2023 04:26:51 -0700
Message-Id: <20230929112652.2898181-1-sanjay.chitroda@einfochips.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.218.17, sjc-ads-6897.cisco.com
X-Outbound-Node: rcdn-core-4.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 11:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105237

From: Sanjay Chitroda <sanjay.chitroda@einfochips.com>

https://github.com/openembedded/meta-openembedded/commit/491b7592f440 commit adds vulnerability instead of fix.

As per upstream CVE-2023-32732 has following reference.
Introduce by: https://github.com/grpc/grpc/pull/32309 (v1.53.x)
Fix by: https://github.com/grpc/grpc/pull/33005 (v1.56.x)

This reverts commit 491b7592f4408a1d7f32ddfb12b2c1613bcadfe1.

Signed-off-by: Sanjay Chitroda <sanjay.chitroda@einfochips.com>
---
 .../grpc/grpc/0001-fix-CVE-2023-32732.patch   | 81 -------------------
 meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb  |  1 -
 2 files changed, 82 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-fix-CVE-2023-32732.patch

diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-fix-CVE-2023-32732.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-fix-CVE-2023-32732.patch
deleted file mode 100644
index ab46897b1..000000000
--- a/meta-oe/recipes-devtools/grpc/grpc/0001-fix-CVE-2023-32732.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From d39489045b5aa73e27713e3cbacb8832c1140ec8 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 9 Aug 2023 13:33:45 +0800
-Subject: [PATCH] fix CVE-2023-32732
-
-CVE: CVE-2023-32732
-
-Upstream-Status: Backport [https://github.com/grpc/grpc/pull/32309/commits/6a7850ef4f042ac26559854266dddc79bfbc75b2]
-The original patch is adjusted to fit the current 1.50.1 version.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- .../ext/transport/chttp2/transport/hpack_parser.cc     | 10 +++++++---
- src/core/ext/transport/chttp2/transport/internal.h     |  2 --
- src/core/ext/transport/chttp2/transport/parsing.cc     |  6 ++----
- 3 files changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/src/core/ext/transport/chttp2/transport/hpack_parser.cc b/src/core/ext/transport/chttp2/transport/hpack_parser.cc
-index f2e49022dc3..cd459d15238 100644
---- a/src/core/ext/transport/chttp2/transport/hpack_parser.cc
-+++ b/src/core/ext/transport/chttp2/transport/hpack_parser.cc
-@@ -1211,12 +1211,16 @@ class HPackParser::Parser {
-             "). GRPC_ARG_MAX_METADATA_SIZE can be set to increase this limit.",
-             *frame_length_, metadata_size_limit_);
-     if (metadata_buffer_ != nullptr) metadata_buffer_->Clear();
-+    // StreamId is used as a signal to skip this stream but keep the connection
-+    // alive
-     return input_->MaybeSetErrorAndReturn(
-         [] {
-           return grpc_error_set_int(
--              GRPC_ERROR_CREATE_FROM_STATIC_STRING(
--                  "received initial metadata size exceeds limit"),
--              GRPC_ERROR_INT_GRPC_STATUS, GRPC_STATUS_RESOURCE_EXHAUSTED);
-+	      grpc_error_set_int(
-+                  GRPC_ERROR_CREATE_FROM_STATIC_STRING(
-+                      "received initial metadata size exceeds limit"),
-+                  GRPC_ERROR_INT_GRPC_STATUS, GRPC_STATUS_RESOURCE_EXHAUSTED),
-+	      GRPC_ERROR_INT_STREAM_ID, 0);
-         },
-         false);
-   }
-diff --git a/src/core/ext/transport/chttp2/transport/internal.h b/src/core/ext/transport/chttp2/transport/internal.h
-index 4a2f4261d83..f8b544d9583 100644
---- a/src/core/ext/transport/chttp2/transport/internal.h
-+++ b/src/core/ext/transport/chttp2/transport/internal.h
-@@ -542,8 +542,6 @@ struct grpc_chttp2_stream {
- 
-   grpc_core::Timestamp deadline = grpc_core::Timestamp::InfFuture();
- 
--  /** saw some stream level error */
--  grpc_error_handle forced_close_error = GRPC_ERROR_NONE;
-   /** how many header frames have we received? */
-   uint8_t header_frames_received = 0;
-   /** number of bytes received - reset at end of parse thread execution */
-diff --git a/src/core/ext/transport/chttp2/transport/parsing.cc b/src/core/ext/transport/chttp2/transport/parsing.cc
-index 980f13543f6..afe6da190b6 100644
---- a/src/core/ext/transport/chttp2/transport/parsing.cc
-+++ b/src/core/ext/transport/chttp2/transport/parsing.cc
-@@ -22,6 +22,7 @@
- #include <string.h>
- 
- #include <string>
-+#include <utility>
- 
- #include "absl/base/attributes.h"
- #include "absl/status/status.h"
-@@ -719,10 +720,7 @@ static grpc_error_handle parse_frame_slice(grpc_chttp2_transport* t,
-     }
-     grpc_chttp2_parsing_become_skip_parser(t);
-     if (s) {
--      s->forced_close_error = err;
--      grpc_chttp2_add_rst_stream_to_next_write(t, t->incoming_stream_id,
--                                               GRPC_HTTP2_PROTOCOL_ERROR,
--                                               &s->stats.outgoing);
-+      grpc_chttp2_cancel_stream(t, s, std::exchange(err, absl::OkStatus()));
-     } else {
-       GRPC_ERROR_UNREF(err);
-     }
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
index 45bfcb857..958992e1e 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
@@ -26,7 +26,6 @@ SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BR
            file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch \
            file://0001-cmake-add-separate-export-for-plugin-targets.patch \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
-           file://0001-fix-CVE-2023-32732.patch \
            "
 # Fixes build with older compilers 4.8 especially on ubuntu 14.04
 CXXFLAGS:append:class-native = " -Wl,--no-as-needed"
-- 
2.35.6


