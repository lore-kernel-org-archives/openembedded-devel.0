Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C83DCA5FE3
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 09:51:25 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2856.1791021078846465125
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Oct 2026 02:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Yo5FF1tC;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202610030951144af2a381620002076c-nycsfd@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202610030951144af2a381620002076c
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 03 Oct 2026 11:51:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=tw/GwcPgsVaEtQPAx7JIvqOMWM3tyUVj9Mhe/RU99eM=;
 b=Yo5FF1tCFTRT4QAa+3BiiSzw3jbU61K5CHN1jfgFJ/H6zZqG9MU3XY1h7XPyEX6J1V2p8k
 GsAA7si2QGzYTrOq83GfMpNJyzw/Rt5+5lIXfFl5wVwhns0XDB+mgYEZFG7T8aDGpi106Bm9
 w2j0paKF3WjssxHYMwn/jLpRRgpJ/ILIZ5eruabmQMMKTqjZUG4xuMcoEAnhDNdOUT0xFo0b
 oJwrYzofwvfKOQFJ0attZiQkEY92gFXRRXHLXC4M4XKUq9k2qdyWANANbBjQCZTt50z3mK7K
 wM/w+pwUmZfwUJ1WunPEXCDtLtumSeovDjhPoVoJY+jGjP57kQYSWAnw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 1/2] c-ares: patch CVE-2026-69186
Date: Sat,  3 Oct 2026 11:50:48 +0200
Message-ID: <20261003095050.3977773-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Oct 2026 09:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130613

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-69184

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../c-ares/c-ares/CVE-2026-69186.patch        | 159 ++++++++++++++++++
 .../recipes-support/c-ares/c-ares_1.27.0.bb   |   4 +-
 2 files changed, 162 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/CVE-2026-69186.patch

diff --git a/meta-oe/recipes-support/c-ares/c-ares/CVE-2026-69186.patch b/meta-oe/recipes-support/c-ares/c-ares/CVE-2026-69186.patch
new file mode 100644
index 0000000000..b3c003acaa
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/CVE-2026-69186.patch
@@ -0,0 +1,159 @@
+From e47c203f91cd8b749c8736bc18d75a31ffdec8f4 Mon Sep 17 00:00:00 2001
+From: jmestwa-coder <jmestwa@gmail.com>
+Date: Sun, 12 Apr 2026 23:50:54 +0530
+Subject: [PATCH] validate RR counts before preallocation to reject malformed
+ packets early (#1134)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+## Summary
+
+Validate DNS RR counts before preallocation to reject malformed packets
+early.
+
+## What’s the issue?
+
+The parser currently trusts RR counts from the DNS header (`ANCOUNT`,
+`NSCOUNT`, `ARCOUNT`) without verifying that the packet contains enough
+data.
+
+A malformed packet can claim a large number of records without providing
+sufficient payload, causing the parser to proceed with unnecessary work
+and incorrect handling.
+
+## What changed?
+
+- Added validation to ensure RR counts are feasible based on the
+remaining buffer size
+- Moved RR preallocation from `ares_dns_parse_header` to
+`ares_dns_parse_buf`
+- Perform validation after question parsing and before preallocation
+- Return `ARES_EBADRESP` early for malformed packets
+
+## Why this approach?
+
+This keeps the parser aligned with its natural flow:
+
+parse header → parse question → validate → preallocate → parse records
+
+It avoids trusting unverified input and ensures malformed packets are
+rejected early and consistently.
+
+## Test
+
+Added a regression test (`ParseMalformedRRCount`) that reproduces the
+issue using a malformed packet with inconsistent RR count.
+
+Signed-off-by: @jmestwa-coder
+
+CVE: CVE-2026-69186
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/e47c203f91cd8b749c8736bc18d75a31ffdec8f4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/lib/ares_dns_parse.c | 55 ++++++++++++++++++++++------------------
+ test/ares-test-parse.cc  | 11 ++++++++
+ 2 files changed, 42 insertions(+), 24 deletions(-)
+
+diff --git a/src/lib/ares_dns_parse.c b/src/lib/ares_dns_parse.c
+index 2d2a7bb2..01f3f43c 100644
+--- a/src/lib/ares_dns_parse.c
++++ b/src/lib/ares_dns_parse.c
+@@ -848,30 +848,6 @@ static ares_status_t ares_dns_parse_header(ares__buf_t *buf, unsigned int flags,
+ 
+   (*dnsrec)->raw_rcode = rcode;
+ 
+-  if (*ancount > 0) {
+-    status =
+-      ares_dns_record_rr_prealloc(*dnsrec, ARES_SECTION_ANSWER, *ancount);
+-    if (status != ARES_SUCCESS) {
+-      goto fail;
+-    }
+-  }
+-
+-  if (*nscount > 0) {
+-    status =
+-      ares_dns_record_rr_prealloc(*dnsrec, ARES_SECTION_AUTHORITY, *nscount);
+-    if (status != ARES_SUCCESS) {
+-      goto fail;
+-    }
+-  }
+-
+-  if (*arcount > 0) {
+-    status =
+-      ares_dns_record_rr_prealloc(*dnsrec, ARES_SECTION_ADDITIONAL, *arcount);
+-    if (status != ARES_SUCCESS) {
+-      goto fail;
+-    }
+-  }
+-
+   return ARES_SUCCESS;
+ 
+ fail:
+@@ -1134,6 +1110,8 @@ static ares_status_t ares_dns_parse_buf(ares__buf_t *buf, unsigned int flags,
+                                         ares_dns_record_t **dnsrec)
+ {
+   ares_status_t  status;
++  size_t         total_rr_count;
++  const size_t   min_rr_wire_len = 11;
+   unsigned short qdcount;
+   unsigned short ancount;
+   unsigned short nscount;
+@@ -1194,6 +1172,35 @@ static ares_status_t ares_dns_parse_buf(ares__buf_t *buf, unsigned int flags,
+     }
+   }
+ 
++  total_rr_count = (size_t)ancount + (size_t)nscount + (size_t)arcount;
++  if (total_rr_count > ares__buf_len(buf) / min_rr_wire_len) {
++    status = ARES_EBADRESP;
++    goto fail;
++  }
++
++  if (ancount > 0) {
++    status = ares_dns_record_rr_prealloc(*dnsrec, ARES_SECTION_ANSWER, ancount);
++    if (status != ARES_SUCCESS) {
++      goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
++    }
++  }
++
++  if (nscount > 0) {
++    status =
++      ares_dns_record_rr_prealloc(*dnsrec, ARES_SECTION_AUTHORITY, nscount);
++    if (status != ARES_SUCCESS) {
++      goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
++    }
++  }
++
++  if (arcount > 0) {
++    status =
++      ares_dns_record_rr_prealloc(*dnsrec, ARES_SECTION_ADDITIONAL, arcount);
++    if (status != ARES_SUCCESS) {
++      goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
++    }
++  }
++
+   /* Parse Answers */
+   for (i = 0; i < ancount; i++) {
+     status = ares_dns_parse_rr(buf, flags, ARES_SECTION_ANSWER, *dnsrec);
+diff --git a/test/ares-test-parse.cc b/test/ares-test-parse.cc
+index ff1fe14d..81fd7deb 100644
+--- a/test/ares-test-parse.cc
++++ b/test/ares-test-parse.cc
+@@ -207,6 +207,17 @@ TEST_F(LibraryTest, ParseFullyCompressedName) {
+   ares_free_hostent(host);
+ }
+ 
++TEST_F(LibraryTest, ParseMalformedRRCount) {
++  ares_dns_record_t *dnsrec = NULL;
++  const unsigned char data[] = {
++    0x12, 0x34, 0x81, 0x80, 0x00, 0x01, 0x00, 0x01,
++    0x00, 0x00, 0x00, 0x00, 0x01, 'a',  0x00, 0x00,
++    0x01, 0x00, 0x01,
++  };
++
++  EXPECT_EQ(ARES_EBADRESP, ares_dns_parse(data, sizeof(data), 0, &dnsrec));
++  EXPECT_EQ(nullptr, dnsrec);
++}
+ 
+ }  // namespace test
+ }  // namespace ares
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb b/meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb
index f6de281058..f409899026 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb
@@ -6,7 +6,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fdbc58a6da11a9f68aa73c453818decc"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/cares-1_27_0/${BPN}-${PV}.tar.gz \
-           file://run-ptest"
+           file://run-ptest \
+           file://CVE-2026-69186.patch \
+"
 SRC_URI[sha256sum] = "0a72be66959955c43e2af2fbd03418e82a2bd5464604ec9a62147e37aceb420b"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"

