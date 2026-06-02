Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB5DECD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 06:40:48 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19120.1780382443569840471
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2026 23:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iOGRGGZH;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10523; q=dns/txt;
  s=iport01; t=1780382443; x=1781592043;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=o5y6s4i8PTBeT054HxBEd7aeUZmc+I02X9uCby7X92k=;
  b=iOGRGGZHf0zw1IhudLeKmwhoLKvM+DXBSQQ1wNML5+BfCdj5KYo9VIDu
   JIbpK5mJVuA35H+oAZ4UoEhpP3duO2JWcKm+LU5GqAQQF/c22Mz2GGyJw
   WKJsCtBGlfGk5LuhHwy1rfIhqwBHL7AjZIAXeAIcdP45M+7WxONP5iUZf
   mqcBf/9Qd9VDQxtmViJ10nDFj3ai3CdKoAXq4hUZhcoMPXTpgPDB9N5uT
   MnEyqrk16ESAe51mlIU6yARYZ3KmyoVy+jnY7QOQ1I8NGFBMR/ejT02bJ
   RpOLwoXbv7CnuA8rNUvNaZjD11A1qDKjmdsgTsX1aK6m1Hjae804c6RFH
   w==;
X-CSE-ConnectionGUID: y4PzCzjSRiqBDBD+HGvTDg==
X-CSE-MsgGUID: et87hSkWQfKgyuFemHhbUA==
X-IPAS-Result: =?us-ascii?q?A0AnAAC6eR5q/5P/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZyX0JJjHOHN4IhgRadCBSBEANXDwEBAQ9EDQQBAYUGAo0yAiY0CQ4BAgQDA?=
 =?us-ascii?q?gMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBLQsBGAFZAwECFkQjI?=
 =?us-ascii?q?YMCAYJzAgERsk2BeTOBAYMoATEFCQJDUNsoAQsUAYE4AYU+iB1bGAGEeycbG?=
 =?us-ascii?q?4FygRQBgnJ2gQWBXAEBAhh/Lj8ZhgUEgiJ6EoFdiVWET0iBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWYDNRIqFW4yHYEjPheBCxsHBYFKgVVqgQSFFSMfAzmBF4F/gStsaRADC?=
 =?us-ascii?q?xgNSBEsNxQbBD5uB4tvFw+CNQE8PhMBKgGBBRMrOhIukyeSPqEOCiiDdIwhl?=
 =?us-ascii?q?ToaM4QElBaSUZkGjgmVcl2EaIFoPDmBDgsHcBWDIglKGQ+OKgMLC4NggX/HZ?=
 =?us-ascii?q?yQ1AgkyAQEHAgcOAwuBaJACLYFOAQE?=
IronPort-Data: A9a23:UJyJr6Cnt0n+NxVW/3niw5YqxClBgxIJ4kV8jS/XYbTApGsq0DUEm
 mpKW23SafbbZjT9KopxYI/k908BusKBx9YwOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jX2thh
 fuo+5eBYAH9gmYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE0qlWHmokP7Yi+/9dLUtit
 tw3NgwhYUXW7w626OrTpuhEnM8vKozveYgYoHwllGmfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYwBPjDS0Un1lM/E48ygeKihnDXeDxDo1XTrq0yi4TW5FAhgOa1b4KPILRmQ+1YghbHp
 lnFwF33IR4LKfKSzBqF+E+F07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++Nu0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:zqh4aq1bAfk9UpbQW/KwFAqjBIIkLtp133Aq2lEZdPUzSL37qy
 nAppomPHPP5Qr5O0tQ+uxoRpPgfZq0z/cciuMs1NyZMzUO1lHFEGgb1+vf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkWyF+xJK+qjhzEhu7t2uq0tQcQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AsUhhmWu9nGiNEWl1yv2eMWEL6Is0LkXP52XSGHW?=
 =?us-ascii?q?5EExFYpHWaXCOxI9rxp8=3D?=
X-Talos-MUID: 9a23:vlKYvApwr4sUAgu5bgQezzx+ZJho2KeRMU4unoQblcSBFSx6Bh7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,182,1774310400"; 
   d="scan'208";a="488607022"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Jun 2026 06:40:42 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 6311118000273
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 06:40:42 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 09D98CB6A93; Mon,  1 Jun 2026 23:40:42 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 1/2] python3-grpcio: Fix CVE-2024-7246
Date: Mon,  1 Jun 2026 23:39:12 -0700
Message-Id: <20260602063912.4104825-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 06:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127320

From: Sudhir Dumbhare <sudumbha@cisco.com>

Apply the nearest upstream fix from v1.62.3 [1] for HPACK parser error
handling to prevent header table desynchronization, aligned with the original
fix in v1.60.2 [2] as referenced in [3].

[1] https://github.com/grpc/grpc/commit/1d172cfca56440889ca32ae516b8c2767321f5b5
[2] https://github.com/grpc/grpc/commit/88b1244fd43e81860baa60cc7fb3945a2cca0d11
[3] https://bugzilla.suse.com/show_bug.cgi?id=1228919

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-7246

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 .../python/python3-grpcio/CVE-2024-7246.patch | 206 ++++++++++++++++++
 .../python/python3-grpcio_1.62.2.bb           |   1 +
 2 files changed, 207 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/CVE-2024-7246.patch

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/CVE-2024-7246.patch b/meta-python/recipes-devtools/python/python3-grpcio/CVE-2024-7246.patch
new file mode 100644
index 0000000000..b464e8a94b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio/CVE-2024-7246.patch
@@ -0,0 +1,206 @@
+From bb1f5e7687799b6650e6b03b285576d9c72dc7d0 Mon Sep 17 00:00:00 2001
+From: Craig Tiller <ctiller@google.com>
+Date: Thu, 1 Aug 2024 13:02:40 -0700
+Subject: [PATCH] [v1.62] [chttp2] Fix a bug in hpack error handling (#37363)
+
+PiperOrigin-RevId: 657234128
+PiperOrigin-RevId: 658458047
+
+CVE: CVE-2024-7246
+Upstream-Status: Backport [https://github.com/grpc/grpc/commit/1d172cfca56440889ca32ae516b8c2767321f5b5]
+
+Backport Changes:
+- The following files were omitted as they are not present in the current version:
+  test/core/transport/chttp2/hpack_parser_test.cc, introduced in v1.8.0-pre2 by
+  https://github.com/grpc/grpc/commit/34a57d0346afe95e11104462c30dc468b0cb0b89
+  test/core/transport/chttp2/hpack_sync_fuzzer.cc and
+  test/core/transport/chttp2/hpack_sync_fuzzer.proto, introduced in v1.56.0-pre1 by
+  https://github.com/grpc/grpc/commit/65a2a895afaf1d2072447b9baf246374b182a946
+
+(cherry picked from commit 1d172cfca56440889ca32ae516b8c2767321f5b5)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ .../chttp2/transport/hpack_parser.cc          | 63 +++++++++++--------
+ .../transport/chttp2/transport/hpack_parser.h |  2 +
+ 2 files changed, 38 insertions(+), 27 deletions(-)
+
+diff --git a/src/core/ext/transport/chttp2/transport/hpack_parser.cc b/src/core/ext/transport/chttp2/transport/hpack_parser.cc
+index 31bf46456f..f2fe80c504 100644
+--- a/src/core/ext/transport/chttp2/transport/hpack_parser.cc
++++ b/src/core/ext/transport/chttp2/transport/hpack_parser.cc
+@@ -91,12 +91,14 @@ constexpr Base64InverseTable kBase64InverseTable;
+ class HPackParser::Input {
+  public:
+   Input(grpc_slice_refcount* current_slice_refcount, const uint8_t* begin,
+-        const uint8_t* end, absl::BitGenRef bitsrc, HpackParseResult& error)
++        const uint8_t* end, absl::BitGenRef bitsrc,
++        HpackParseResult& frame_error, HpackParseResult& field_error)
+       : current_slice_refcount_(current_slice_refcount),
+         begin_(begin),
+         end_(end),
+         frontier_(begin),
+-        error_(error),
++        frame_error_(frame_error),
++        field_error_(field_error),
+         bitsrc_(bitsrc) {}
+ 
+   // If input is backed by a slice, retrieve its refcount. If not, return
+@@ -215,14 +217,18 @@ class HPackParser::Input {
+ 
+   // Check if we saw an EOF
+   bool eof_error() const {
+-    return min_progress_size_ != 0 || error_.connection_error();
++    return min_progress_size_ != 0 || frame_error_.connection_error();
++  }
++
++  // Reset the field error to be ok
++  void ClearFieldError() {
++    if (field_error_.ok()) return;
++    field_error_ = HpackParseResult();
+   }
+ 
+   // Minimum number of bytes to unstuck the current parse
+   size_t min_progress_size() const { return min_progress_size_; }
+ 
+-  bool has_error() const { return !error_.ok(); }
+-
+   // Set the current error - tweaks the error to include a stream id so that
+   // chttp2 does not close the connection.
+   // Intended for errors that are specific to a stream and recoverable.
+@@ -246,10 +252,7 @@ class HPackParser::Input {
+   // read prior to being able to get further in this parse.
+   void UnexpectedEOF(size_t min_progress_size) {
+     GPR_ASSERT(min_progress_size > 0);
+-    if (min_progress_size_ != 0 || error_.connection_error()) {
+-      GPR_DEBUG_ASSERT(eof_error());
+-      return;
+-    }
++    if (eof_error()) return;
+     // Set min progress size, taking into account bytes parsed already but not
+     // consumed.
+     min_progress_size_ = min_progress_size + (begin_ - frontier_);
+@@ -302,13 +305,18 @@ class HPackParser::Input {
+   // Do not use this directly, instead use SetErrorAndContinueParsing or
+   // SetErrorAndStopParsing.
+   void SetError(HpackParseResult error) {
+-    if (!error_.ok() || min_progress_size_ > 0) {
+-      if (error.connection_error() && !error_.connection_error()) {
+-        error_ = std::move(error);  // connection errors dominate
++    SetErrorFor(frame_error_, error);
++    SetErrorFor(field_error_, std::move(error));
++  }
++
++  void SetErrorFor(HpackParseResult& error, HpackParseResult new_error) {
++    if (!error.ok() || min_progress_size_ > 0) {
++      if (new_error.connection_error() && !error.connection_error()) {
++        error = std::move(new_error);  // connection errors dominate
+       }
+       return;
+     }
+-    error_ = std::move(error);
++    error = std::move(new_error);
+   }
+ 
+   // Refcount if we are backed by a slice
+@@ -320,7 +328,8 @@ class HPackParser::Input {
+   // Frontier denotes the first byte past successfully processed input
+   const uint8_t* frontier_;
+   // Current error
+-  HpackParseResult& error_;
++  HpackParseResult& frame_error_;
++  HpackParseResult& field_error_;
+   // If the error was EOF, we flag it here by noting how many more bytes would
+   // be needed to make progress
+   size_t min_progress_size_ = 0;
+@@ -597,6 +606,7 @@ class HPackParser::Parser {
+   bool ParseTop() {
+     GPR_DEBUG_ASSERT(state_.parse_state == ParseState::kTop);
+     auto cur = *input_->Next();
++    input_->ClearFieldError();
+     switch (cur >> 4) {
+         // Literal header not indexed - First byte format: 0000xxxx
+         // Literal header never indexed - First byte format: 0001xxxx
+@@ -702,7 +712,7 @@ class HPackParser::Parser {
+         break;
+     }
+     gpr_log(
+-        GPR_DEBUG, "HTTP:%d:%s:%s: %s%s", log_info_.stream_id, type,
++        GPR_INFO, "HTTP:%d:%s:%s: %s%s", log_info_.stream_id, type,
+         log_info_.is_client ? "CLI" : "SVR", memento.md.DebugString().c_str(),
+         memento.parse_status == nullptr
+             ? ""
+@@ -951,11 +961,10 @@ class HPackParser::Parser {
+                                   state_.string_length)
+             : String::Parse(input_, state_.is_string_huff_compressed,
+                             state_.string_length);
+-    HpackParseResult& status = state_.frame_error;
+     absl::string_view key_string;
+     if (auto* s = absl::get_if<Slice>(&state_.key)) {
+       key_string = s->as_string_view();
+-      if (status.ok()) {
++      if (state_.field_error.ok()) {
+         auto r = ValidateKey(key_string);
+         if (r != ValidateMetadataResult::kOk) {
+           input_->SetErrorAndContinueParsing(
+@@ -965,7 +974,7 @@ class HPackParser::Parser {
+     } else {
+       const auto* memento = absl::get<const HPackTable::Memento*>(state_.key);
+       key_string = memento->md.key();
+-      if (status.ok() && memento->parse_status != nullptr) {
++      if (state_.field_error.ok() && memento->parse_status != nullptr) {
+         input_->SetErrorAndContinueParsing(*memento->parse_status);
+       }
+     }
+@@ -992,16 +1001,16 @@ class HPackParser::Parser {
+         key_string.size() + value.wire_size + hpack_constants::kEntryOverhead;
+     auto md = grpc_metadata_batch::Parse(
+         key_string, std::move(value_slice), state_.add_to_table, transport_size,
+-        [key_string, &status, this](absl::string_view message, const Slice&) {
+-          if (!status.ok()) return;
++        [key_string, this](absl::string_view message, const Slice&) {
++          if (!state_.field_error.ok()) return;
+           input_->SetErrorAndContinueParsing(
+               HpackParseResult::MetadataParseError(key_string));
+           gpr_log(GPR_ERROR, "Error parsing '%s' metadata: %s",
+                   std::string(key_string).c_str(),
+                   std::string(message).c_str());
+         });
+-    HPackTable::Memento memento{std::move(md),
+-                                status.PersistentStreamErrorOrNullptr()};
++    HPackTable::Memento memento{
++        std::move(md), state_.field_error.PersistentStreamErrorOrNullptr()};
+     input_->UpdateFrontier();
+     state_.parse_state = ParseState::kTop;
+     if (state_.add_to_table) {
+@@ -1163,13 +1172,13 @@ grpc_error_handle HPackParser::Parse(
+     std::vector<uint8_t> buffer = std::move(unparsed_bytes_);
+     return ParseInput(
+         Input(nullptr, buffer.data(), buffer.data() + buffer.size(), bitsrc,
+-              state_.frame_error),
++              state_.frame_error, state_.field_error),
+         is_last, call_tracer);
+   }
+-  return ParseInput(
+-      Input(slice.refcount, GRPC_SLICE_START_PTR(slice),
+-            GRPC_SLICE_END_PTR(slice), bitsrc, state_.frame_error),
+-      is_last, call_tracer);
++  return ParseInput(Input(slice.refcount, GRPC_SLICE_START_PTR(slice),
++                          GRPC_SLICE_END_PTR(slice), bitsrc, state_.frame_error,
++                          state_.field_error),
++                    is_last, call_tracer);
+ }
+ 
+ grpc_error_handle HPackParser::ParseInput(
+diff --git a/src/core/ext/transport/chttp2/transport/hpack_parser.h b/src/core/ext/transport/chttp2/transport/hpack_parser.h
+index 5edb34b960..f7002186f7 100644
+--- a/src/core/ext/transport/chttp2/transport/hpack_parser.h
++++ b/src/core/ext/transport/chttp2/transport/hpack_parser.h
+@@ -238,6 +238,8 @@ class HPackParser {
+     HPackTable hpack_table;
+     // Error so far for this frame (set by class Input)
+     HpackParseResult frame_error;
++    // Error so far for this field (set by class Input)
++    HpackParseResult field_error;
+     // Length of frame so far.
+     uint32_t frame_length = 0;
+     // Length of the string being parsed
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
index 29c09675ef..eaa48a5d5c 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
@@ -13,6 +13,7 @@ SRC_URI += "file://0001-Include-missing-cstdint-header.patch \
            file://0001-target.h-define-proper-macro-for-ppc-ppc64.patch \
            file://0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch \
            file://CVE-2024-11407.patch \
+           file://CVE-2024-7246.patch \
            "
 SRC_URI[sha256sum] = "c77618071d96b7a8be2c10701a98537823b9c65ba256c0b9067e0594cdbd954d"
 
-- 
2.35.6


