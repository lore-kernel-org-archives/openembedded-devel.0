Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B1BCA5FDD
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 09:51:44 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2861.1791021095270220593
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Oct 2026 02:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=fnS4GjxE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20261003095132bce53035d400020770-rbfhec@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261003095132bce53035d400020770
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 03 Oct 2026 11:51:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=xq4KWfGKXdWLrmf872sl9MIInF25zg/93oehY1YNsLk=;
 b=fnS4GjxELaTKvZwj4WF5q17TcLtVLdxnca8Ql3IGPt6pJ9pUS7nscoYwryRHhAqK/MFyQj
 4g6z5KxfxzwYVwor1kwNEBamgfiqdEfiCVBUK8FKVUvSh0ucl6GYvK1kaX9iatEin7ZmglbG
 EQNDbWChS8SEUhTTItQODUru/5QkQSPz5i7RUYmg6j/jkU6MdCIcurIIchE/iEouLkfFfpJR
 +sS4eZ/aEtSnj9AEhXMKdAyQYNHU9AVDCR7RlRE6yo4Rc+p8ZpMfRAUSJmDmB+G0m+Ml4rvK
 8w54Ej9LYXJgoM9BhDnCFyknLqVOy4a/a05kVU8BNgpSoZwdHpTjBRUg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 2/2] c-ares: patch CVE-2026-69184
Date: Sat,  3 Oct 2026 11:50:49 +0200
Message-ID: <20261003095050.3977773-2-peter.marko@siemens.com>
In-Reply-To: <20261003095050.3977773-1-peter.marko@siemens.com>
References: <20261003095050.3977773-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Oct 2026 09:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130614

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-69184

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../c-ares/c-ares/CVE-2026-69184.patch        | 295 ++++++++++++++++++
 .../recipes-support/c-ares/c-ares_1.27.0.bb   |   1 +
 2 files changed, 296 insertions(+)
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/CVE-2026-69184.patch

diff --git a/meta-oe/recipes-support/c-ares/c-ares/CVE-2026-69184.patch b/meta-oe/recipes-support/c-ares/c-ares/CVE-2026-69184.patch
new file mode 100644
index 0000000000..864d45fa63
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/CVE-2026-69184.patch
@@ -0,0 +1,295 @@
+From 5c8341ba6ff3a8e4e4dfd616f8ed0418838b8b7b Mon Sep 17 00:00:00 2001
+From: "c-ares-backport-gha[bot]"
+ <299594594+c-ares-backport-gha[bot]@users.noreply.github.com>
+Date: Sun, 5 Jul 2026 05:41:49 +0000
+Subject: [PATCH] [Backport v1.34] enforce 255 octet name limit when parsing
+ dns names (#1210)
+
+# Description
+Backport of #1164 to `v1.34`.
+
+Signed-off-by: Syed Mohammed Nayyar <jmestwa@gmail.com>
+Co-authored-by: jmestwa-coder <jmestwa@gmail.com>
+
+CVE: CVE-2026-69184
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/5c8341ba6ff3a8e4e4dfd616f8ed0418838b8b7b]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/lib/ares_dns_name.c |  42 +++++++++-
+ test/ares-test-parse.cc | 176 ++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 216 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib/ares_dns_name.c b/src/lib/ares_dns_name.c
+index b7fdf594..134f3edc 100644
+--- a/src/lib/ares_dns_name.c
++++ b/src/lib/ares_dns_name.c
+@@ -27,6 +27,18 @@
+ #include "ares.h"
+ #include "ares_private.h"
+ 
++/* RFC 1035 3.1 limits a name to 255 octets.  We track presentation length
++ * (label octets plus one separator before each label after the first), which is
++ * up to ~2 octets looser than the strict wire limit and so never rejects a
++ * compliant name.  Shared by the read and write paths. */
++#define ARES_MAX_NAME_PRESENTATION_LEN 255
++
++/* A name of <= 255 octets holds at most 128 labels, so it can never legitimately
++ * require more than that many compression-pointer jumps.  Bounding the number of
++ * indirections stops a name built purely from pointers (which never adds label
++ * bytes, so the length cap never fires) from being walked without limit. */
++#define ARES_MAX_INDIRS 128
++
+ typedef struct {
+   char  *name;
+   size_t name_len;
+@@ -50,7 +62,7 @@ static ares_status_t ares__nameoffset_create(ares__llist_t **list,
+   ares_nameoffset_t *off = NULL;
+ 
+   if (list == NULL || name == NULL || ares_strlen(name) == 0 ||
+-      ares_strlen(name) > 255) {
++      ares_strlen(name) > ARES_MAX_NAME_PRESENTATION_LEN) {
+     return ARES_EFORMERR;
+   }
+ 
+@@ -341,7 +353,7 @@ static ares_status_t ares_split_dns_name(ares_dns_labels_t *labels,
+   }
+ 
+   /* Can't exceed maximum (unescaped) length */
+-  if (labels->num && total_len + labels->num - 1 > 255) {
++  if (labels->num && total_len + labels->num - 1 > ARES_MAX_NAME_PRESENTATION_LEN) {
+     status = ARES_EBADNAME;
+     goto done;
+   }
+@@ -541,6 +553,8 @@ ares_status_t ares__dns_name_parse(ares__buf_t *buf, char **name,
+   ares_status_t status;
+   ares__buf_t  *namebuf     = NULL;
+   size_t        label_start = ares__buf_get_position(buf);
++  size_t        name_len    = 0;
++  size_t        indir       = 0;
+ 
+   if (buf == NULL) {
+     return ARES_EFORMERR;
+@@ -612,6 +626,16 @@ ares_status_t ares__dns_name_parse(ares__buf_t *buf, char **name,
+         goto fail;
+       }
+ 
++      /* Bound the number of indirections.  A name made purely of pointers never
++       * adds label bytes, so the length cap below can't stop it; the
++       * strictly-decreasing rule alone still allows thousands of jumps per name.
++       * No legitimate <= 255 octet name needs more than 128 labels/jumps. */
++      indir++;
++      if (indir > ARES_MAX_INDIRS) {
++        status = ARES_EBADNAME;
++        goto fail;
++      }
++
+       /* First time we make a jump, save the current position */
+       if (save_offset == 0) {
+         save_offset = ares__buf_get_position(buf);
+@@ -635,6 +659,20 @@ ares_status_t ares__dns_name_parse(ares__buf_t *buf, char **name,
+ 
+     /* New label */
+ 
++    /* RFC 1035 3.1 limits a name to 255 octets.  Enforce it during
++     * decompression so labels reached through a chain of pointers can't expand a
++     * single name without bound.  Track the presentation length (label data plus
++     * the separator that precedes each label after the first), matching
++     * ares_split_dns_name() on the write side. */
++    if (name_len) {
++      name_len++;
++    }
++    name_len += c;
++    if (name_len > ARES_MAX_NAME_PRESENTATION_LEN) {
++      status = ARES_EBADNAME;
++      goto fail;
++    }
++
+     /* Labels are separated by periods */
+     if (ares__buf_len(namebuf) != 0 && name != NULL) {
+       status = ares__buf_append_byte(namebuf, '.');
+diff --git a/test/ares-test-parse.cc b/test/ares-test-parse.cc
+index 81fd7deb..399c94dd 100644
+--- a/test/ares-test-parse.cc
++++ b/test/ares-test-parse.cc
+@@ -219,5 +219,181 @@ TEST_F(LibraryTest, ParseMalformedRRCount) {
+   EXPECT_EQ(nullptr, dnsrec);
+ }
+ 
++TEST_F(LibraryTest, ParseRejectsOverlongName) {
++  // RFC 1035 3.1 limits a name to 255 octets.  A longer name (here built from
++  // six 63-octet labels) must be rejected instead of expanded.
++  std::vector<byte> data = {
++    0x12, 0x34, 0x81, 0x80,
++    0x00, 0x01,  // num questions
++    0x00, 0x01,  // num answer RRs
++    0x00, 0x00,  // num authority RRs
++    0x00, 0x00,  // num additional RRs
++    // Question
++    0x01, 'a', 0x00,
++    0x00, 0x01,  // type A
++    0x00, 0x01,  // class IN
++  };
++  // Answer name: 6 x 63 label octets + 5 separators = 383 presentation octets
++  // (> 255), then root terminator
++  for (int i = 0; i < 6; i++) {
++    data.push_back(63);
++    for (int j = 0; j < 63; j++) {
++      data.push_back('a');
++    }
++  }
++  data.push_back(0x00);
++  std::vector<byte> tail = {
++    0x00, 0x01,              // type A
++    0x00, 0x01,              // class IN
++    0x00, 0x00, 0x00, 0x00,  // TTL
++    0x00, 0x04,              // rdata length
++    0x01, 0x02, 0x03, 0x04,
++  };
++  data.insert(data.end(), tail.begin(), tail.end());
++
++  ares_dns_record_t *dnsrec = NULL;
++  EXPECT_EQ(ARES_EBADNAME, ares_dns_parse(data.data(), data.size(), 0, &dnsrec));
++  EXPECT_EQ(nullptr, dnsrec);
++}
++
++TEST_F(LibraryTest, ParseRejectsOverlongNameViaPointers) {
++  // The answer name is one 63-octet label followed by a compression pointer back
++  // to the question name (four 63-octet labels).  Expanded that is 5 x 63 label
++  // octets + 4 separators = 319 presentation octets (> 255), so the length has
++  // to accumulate across the pointer jump for this to be rejected.
++  std::vector<byte> data = {
++    0x12, 0x34, 0x81, 0x80,
++    0x00, 0x01,  // num questions
++    0x00, 0x01,  // num answer RRs
++    0x00, 0x00,  // num authority RRs
++    0x00, 0x00,  // num additional RRs
++  };
++  // Question name: 4 x 63 label octets + 3 separators = 255 presentation octets,
++  // exactly the limit, so the question itself is accepted.
++  for (int i = 0; i < 4; i++) {
++    data.push_back(63);
++    for (int j = 0; j < 63; j++) {
++      data.push_back('a');
++    }
++  }
++  data.push_back(0x00);
++  std::vector<byte> qtail = {0x00, 0x01, 0x00, 0x01};  // type A, class IN
++  data.insert(data.end(), qtail.begin(), qtail.end());
++  // Answer name: one 63-octet label, then a pointer to the question name.
++  data.push_back(63);
++  for (int j = 0; j < 63; j++) {
++    data.push_back('a');
++  }
++  data.push_back(0xc0);
++  data.push_back(0x0c);  // -> offset 12, start of question name
++  std::vector<byte> tail = {
++    0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 1, 2, 3, 4,
++  };
++  data.insert(data.end(), tail.begin(), tail.end());
++  ares_dns_record_t *dnsrec = NULL;
++  EXPECT_EQ(ARES_EBADNAME, ares_dns_parse(data.data(), data.size(), 0, &dnsrec));
++  EXPECT_EQ(nullptr, dnsrec);
++}
++
++TEST_F(LibraryTest, ParseRejectsPointerChain) {
++  // A name built purely from compression pointers adds no label octets, so the
++  // length cap alone can never stop it.  A long backward chain of pointers is
++  // hidden in the opaque rdata of a raw RR, and a second RR's name points at the
++  // top of the chain; walking it must trip the indirection cap and return
++  // EBADNAME rather than following every jump.
++  std::vector<byte> data = {
++    0x12, 0x34, 0x81, 0x80,
++    0x00, 0x01,  // num questions
++    0x00, 0x02,  // num answer RRs
++    0x00, 0x00,  // num authority RRs
++    0x00, 0x00,  // num additional RRs
++    // Question
++    0x01, 'a', 0x00,
++    0x00, 0x01,  // type A
++    0x00, 0x01,  // class IN
++    // RR1: raw RR (unknown type) whose rdata carries the pointer chain
++    0x00,        // name = root
++    0xff, 0xfe,  // type (unknown -> stored raw, rdata not name-parsed)
++    0x00, 0x01,  // class IN
++    0x00, 0x00, 0x00, 0x00,  // TTL
++  };
++  // The chain lives in RR1's rdata, which begins two octets past here (after the
++  // rdlength we are about to write), so compute absolute offsets from there.
++  const size_t rdata_off = data.size() + 2;
++  std::vector<byte> chain;
++  chain.push_back(0x00);          // deepest target: root terminator
++  size_t prev = rdata_off;        // absolute offset of the root
++  size_t top  = prev;
++  const int N = 200;              // well past the 128 indirection cap
++  for (int i = 0; i < N; i++) {
++    size_t here = rdata_off + chain.size();
++    chain.push_back(0xc0 | ((prev >> 8) & 0x3f));
++    chain.push_back(prev & 0xff);
++    top  = here;
++    prev = here;
++  }
++  data.push_back((chain.size() >> 8) & 0xff);  // rdlength
++  data.push_back(chain.size() & 0xff);
++  data.insert(data.end(), chain.begin(), chain.end());
++  // RR2: name = pointer to the top of the chain.
++  data.push_back(0xc0 | ((top >> 8) & 0x3f));
++  data.push_back(top & 0xff);
++  std::vector<byte> tail = {
++    0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 1, 2, 3, 4,
++  };
++  data.insert(data.end(), tail.begin(), tail.end());
++
++  ares_dns_record_t *dnsrec = NULL;
++  EXPECT_EQ(ARES_EBADNAME, ares_dns_parse(data.data(), data.size(), 0, &dnsrec));
++  EXPECT_EQ(nullptr, dnsrec);
++}
++
++TEST_F(LibraryTest, ParseAcceptsMaxLengthName) {
++  // Exactly 255 presentation octets: 4 x 63 = 252 + 3 separators = 255, which
++  // must still be accepted (the bound is "> 255", not ">= 255").
++  std::vector<byte> data = {
++    0x12, 0x34, 0x81, 0x80, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00,
++    0x00, 0x00, 0x01, 'a',  0x00, 0x00, 0x01, 0x00, 0x01,
++  };
++  for (int i = 0; i < 4; i++) {
++    data.push_back(63);
++    for (int j = 0; j < 63; j++) {
++      data.push_back('a');
++    }
++  }
++  data.push_back(0x00);
++  std::vector<byte> tail = {
++    0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 1, 2, 3, 4,
++  };
++  data.insert(data.end(), tail.begin(), tail.end());
++  ares_dns_record_t *dnsrec = NULL;
++  EXPECT_EQ(ARES_SUCCESS, ares_dns_parse(data.data(), data.size(), 0, &dnsrec));
++  EXPECT_NE(nullptr, dnsrec);
++  ares_dns_record_destroy(dnsrec);
++}
++
++TEST_F(LibraryTest, ParseRejectsName256) {
++  // One octet over: labels 63,63,63,62,1 = 252 + 4 separators = 256 -> reject.
++  std::vector<byte> data = {
++    0x12, 0x34, 0x81, 0x80, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00,
++    0x00, 0x00, 0x01, 'a',  0x00, 0x00, 0x01, 0x00, 0x01,
++  };
++  const int lens[] = {63, 63, 63, 62, 1};
++  for (int i = 0; i < 5; i++) {
++    data.push_back(static_cast<byte>(lens[i]));
++    for (int j = 0; j < lens[i]; j++) {
++      data.push_back('a');
++    }
++  }
++  data.push_back(0x00);
++  std::vector<byte> tail = {
++    0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 1, 2, 3, 4,
++  };
++  data.insert(data.end(), tail.begin(), tail.end());
++  ares_dns_record_t *dnsrec = NULL;
++  EXPECT_EQ(ARES_EBADNAME, ares_dns_parse(data.data(), data.size(), 0, &dnsrec));
++  EXPECT_EQ(nullptr, dnsrec);
++}
++
+ }  // namespace test
+ }  // namespace ares
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb b/meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb
index f409899026..3fb5a35311 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fdbc58a6da11a9f68aa73c453818decc"
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/cares-1_27_0/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            file://CVE-2026-69186.patch \
+           file://CVE-2026-69184.patch \
 "
 SRC_URI[sha256sum] = "0a72be66959955c43e2af2fbd03418e82a2bd5464604ec9a62147e37aceb420b"
 

