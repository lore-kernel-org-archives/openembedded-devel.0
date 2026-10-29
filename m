Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1739.1793306009178347934
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 13:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=abLh65lA;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20261029203327abd14c53e600020784-xcfcyt@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20261029203327abd14c53e600020784
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 29 Oct 2026 21:33:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=rUBiPt2yQo7DIVeyhPmaHX4jbTngj8p+1zsV2/gSoG4=;
 b=abLh65lAycQy5H0kMbUzUMqRgzlbnI24WITvARaF8+RaU3XW9CZrmk010Ig0/EXfgYF1Pl
 zmqQ2vupARWtpUSFaAl+gSRJmBlTOjk8vF9FaaUeJwFJVptSlawyHjEPcv/KtGDXUOn7hNnN
 +yI7AxVkMxhdJPGpWgNuCezEZuuXJcsgu+Hbg/im9cS0Nr+VQBa1n3rLT78uDZBT90fiPEFJ
 O8x2kLaoZ0R6oCdu4h/qzIK/tSofdp+Kkt86jHQQQpWZhGnq4QTqhx5J4KmLUGXtnJAnNF3K
 NLZugkicxuxb7iKgFiMObn9ZNHbqUtjdBVJpCM0hyTzrL/oYIg80L6Pw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH] zchunk: patch CVE-2026-117556
Date: Thu, 29 Oct 2026 21:30:12 +0100
Message-ID: <20261029203012.3210324-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 20:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131669
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].
Also pick related patch to apply it correctly.

[1] https://security-tracker.debian.org/tracker/CVE-2026-117556

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../zchunk/zchunk/CVE-2026-117556-01.patch    | 150 ++++++++
 .../zchunk/zchunk/CVE-2026-117556-02.patch    | 329 ++++++++++++++++++
 .../recipes-support/zchunk/zchunk_1.4.0.bb    |   6 +-
 3 files changed, 484 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/zchunk/zchunk/CVE-2026-117556-01.patch
 create mode 100644 meta-oe/recipes-support/zchunk/zchunk/CVE-2026-117556-02.patch

diff --git a/meta-oe/recipes-support/zchunk/zchunk/CVE-2026-117556-01.patch b/meta-oe/recipes-support/zchunk/zchunk/CVE-2026-117556-01.patch
new file mode 100644
index 00000000000..01ac3cca92f
--- /dev/null
+++ b/meta-oe/recipes-support/zchunk/zchunk/CVE-2026-117556-01.patch
@@ -0,0 +1,150 @@
+From ab6aedbe5a1e9597ba9b9e50462af476a0655f7a Mon Sep 17 00:00:00 2001
+From: Jonathan Dieter <jonathan@dieter.ie>
+Date: Thu, 30 Jul 2026 20:51:11 +0100
+Subject: [PATCH] Fix a number of memory related bugs in zchunk
+
+Credit for this patch and for bringing these bugs to my attention goes to
+glitchfox.  Additionally, after glitchfox brought this to my attention, I
+received a PR to fix the optional element bug from lilu5458.
+
+Authored-by: glitchfox@benjaminali.com
+Signed-off-by: Jonathan Dieter <jonathan@dieter.ie>
+
+CVE: CVE-2026-117556
+Upstream-Status: Backport [https://github.com/zchunk/zchunk/commit/ab6aedbe5a1e9597ba9b9e50462af476a0655f7a]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/lib/comp/comp.c        |  8 +++++---
+ src/lib/dl/range.c         |  3 +++
+ src/lib/header.c           |  4 ++++
+ src/lib/index/index_read.c | 20 +++++++++++++++-----
+ 4 files changed, 27 insertions(+), 8 deletions(-)
+
+diff --git a/src/lib/comp/comp.c b/src/lib/comp/comp.c
+index 414727d..1c116a6 100644
+--- a/src/lib/comp/comp.c
++++ b/src/lib/comp/comp.c
+@@ -101,7 +101,8 @@ static size_t comp_read_from_dc(zckCtx *zck, zckComp *comp, char *dst,
+     size_t dl_size = dst_size;
+     if(dl_size > comp->dc_data_size - comp->dc_data_loc)
+         dl_size = comp->dc_data_size - comp->dc_data_loc;
+-    memcpy(dst, comp->dc_data+comp->dc_data_loc, dl_size);
++    if(dl_size > 0)
++        memcpy(dst, comp->dc_data+comp->dc_data_loc, dl_size);
+     comp->dc_data_loc += dl_size;
+     if(dl_size > 0)
+         zck_log(ZCK_LOG_DEBUG, "Reading %llu bytes from decompressed buffer",
+@@ -414,8 +415,9 @@ bool comp_add_to_dc(zckCtx *zck, zckComp *comp, const char *src,
+                 (long long unsigned) comp->dc_data_loc);
+     zck_log(ZCK_LOG_DEBUG, "Adding %llu bytes to decompressed buffer",
+             (long long unsigned) src_size);
+-    memcpy(temp, comp->dc_data + comp->dc_data_loc,
+-           comp->dc_data_size - comp->dc_data_loc);
++    if(comp->dc_data_size > comp->dc_data_loc)
++        memcpy(temp, comp->dc_data + comp->dc_data_loc,
++               comp->dc_data_size - comp->dc_data_loc);
+     free(comp->dc_data);
+     comp->dc_data_size -= comp->dc_data_loc;
+     comp->dc_data_loc = 0;
+diff --git a/src/lib/dl/range.c b/src/lib/dl/range.c
+index d4f7426..d786551 100644
+--- a/src/lib/dl/range.c
++++ b/src/lib/dl/range.c
+@@ -153,6 +153,9 @@ void ZCK_PUBLIC_API zck_range_free(zckRange **info) {
+ }
+ 
+ char ZCK_PUBLIC_API *zck_get_range_char(zckCtx *zck, zckRange *range) {
++    if(range == NULL || range->first == NULL)
++        return zmalloc(1);
++
+     int buf_size = BUF_SIZE;
+     char *output = zmalloc(buf_size);
+     if (!output) {
+diff --git a/src/lib/header.c b/src/lib/header.c
+index 57adc31..e28935d 100644
+--- a/src/lib/header.c
++++ b/src/lib/header.c
+@@ -195,6 +195,10 @@ static bool read_preface(zckCtx *zck) {
+             if(!compint_to_size(zck, &data_size, header+length, &length,
+                                 max_length))
+                 return false;
++            if(data_size > max_length - length) {
++                set_fatal_error(zck, "Optional element exceeds header size");
++                return false;
++            }
+             if(!read_optional_element(zck, id, data_size, header+length))
+                 return false;
+             length += data_size;
+diff --git a/src/lib/index/index_read.c b/src/lib/index/index_read.c
+index 6ec0a8d..8f57f23 100644
+--- a/src/lib/index/index_read.c
++++ b/src/lib/index/index_read.c
+@@ -47,7 +47,7 @@ bool index_read(zckCtx *zck, char *data, size_t size, size_t max_length) {
+ 
+     /* Read and configure hash type */
+     int hash_type = 0;
+-    if(!compint_to_int(zck, &hash_type, data + length, &length, max_length)) {
++    if(!compint_to_int(zck, &hash_type, data + length, &length, size)) {
+         set_fatal_error(zck, "Unable to read hash type");
+         return false;
+     }
+@@ -59,7 +59,7 @@ bool index_read(zckCtx *zck, char *data, size_t size, size_t max_length) {
+     /* Read number of index entries */
+     size_t index_count;
+     if(!compint_to_size(zck, &index_count, data + length, &length,
+-                        max_length)) {
++                        size)) {
+         set_fatal_error(zck, "Unable to read index count");
+         return false;
+     }
+@@ -69,7 +69,7 @@ bool index_read(zckCtx *zck, char *data, size_t size, size_t max_length) {
+     size_t idx_loc = 0;
+     int count = 0;
+     while(length < size) {
+-        if(length + zck->index.digest_size > max_length) {
++        if(zck->index.digest_size > size - length) {
+             set_fatal_error(zck, "Read past end of header");
+             return false;
+         }
+@@ -99,6 +99,12 @@ bool index_read(zckCtx *zck, char *data, size_t size, size_t max_length) {
+         /* Read uncompressed entry digest, if any */
+         if (zck->has_uncompressed_source) {
+             /* same size for digest as compressed */
++            if(zck->index.digest_size > size - length) {
++                set_fatal_error(zck, "Read past end of index");
++                free(new->digest);
++                free(new);
++                return false;
++            }
+             new->digest_uncompressed = zmalloc(zck->index.digest_size);
+             if (!new->digest_uncompressed) {
+                 free(new->digest);
+@@ -116,7 +122,7 @@ bool index_read(zckCtx *zck, char *data, size_t size, size_t max_length) {
+         /* Read and store entry length */
+         size_t chunk_length = 0;
+         if(!compint_to_size(zck, &chunk_length, data+length, &length,
+-                            max_length)) {
++                            size)) {
+             set_fatal_error(zck, "Unable to read chunk %i compressed size",
+                             count);
+             return false;
+@@ -127,7 +133,7 @@ bool index_read(zckCtx *zck, char *data, size_t size, size_t max_length) {
+         /* Read and store uncompressed entry length */
+         chunk_length = 0;
+         if(!compint_to_size(zck, &chunk_length, data+length, &length,
+-                            max_length)) {
++                            size)) {
+             set_fatal_error(zck, "Unable to read chunk %i uncompressed size",
+                             count);
+             return false;
+@@ -146,6 +152,10 @@ bool index_read(zckCtx *zck, char *data, size_t size, size_t max_length) {
+             zck->index.first = new;
+         prev = new;
+     }
++    if(count == 0 || (size_t)count != index_count) {
++        set_fatal_error(zck, "Index entry count does not match index data");
++        return false;
++    }
+     free(zck->index_string);
+     zck->index_string = NULL;
+     return true;
diff --git a/meta-oe/recipes-support/zchunk/zchunk/CVE-2026-117556-02.patch b/meta-oe/recipes-support/zchunk/zchunk/CVE-2026-117556-02.patch
new file mode 100644
index 00000000000..968632cbeb8
--- /dev/null
+++ b/meta-oe/recipes-support/zchunk/zchunk/CVE-2026-117556-02.patch
@@ -0,0 +1,329 @@
+From 02b371a64bf98245df97315d07c684a0ca5ea1df Mon Sep 17 00:00:00 2001
+From: Jonathan Dieter <jonathan@dieter.ie>
+Date: Mon, 26 Oct 2026 18:07:06 +0000
+Subject: [PATCH] Fix out-of-bounds read
+
+Also, add a flag for doing memory tests.
+
+Thanks to HaiND (Nguyen Dinh Hai), Post and Telecommunication Institute
+of Technology, github.com/Haind03 for flagging up this issue
+
+Signed-off-by: Jonathan Dieter <jonathan@dieter.ie>
+
+CVE: CVE-2026-117556
+Upstream-Status: Backport [https://github.com/zchunk/zchunk/commit/02b371a64bf98245df97315d07c684a0ca5ea1df]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/lib/compint.c         |   4 +
+ src/lib/header.c          |  16 +--
+ test/meson.build          |  10 ++
+ test/read_header_bounds.c | 203 ++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 227 insertions(+), 6 deletions(-)
+ create mode 100644 test/read_header_bounds.c
+
+diff --git a/src/lib/compint.c b/src/lib/compint.c
+index 5178559..7324d12 100644
+--- a/src/lib/compint.c
++++ b/src/lib/compint.c
+@@ -48,6 +48,10 @@ int compint_to_size(zckCtx *zck, size_t *val, const char *compint,
+     VALIDATE_BOOL(zck);
+ 
+     *val = 0;
++    if(max_length == 0) {
++        set_fatal_error(zck, "Read past end of header");
++        return false;
++    }
+     size_t old_val = 0;
+     const unsigned char *i = (unsigned char *)compint;
+     int count = 0;
+diff --git a/src/lib/header.c b/src/lib/header.c
+index e28935d..05f8895 100644
+--- a/src/lib/header.c
++++ b/src/lib/header.c
+@@ -164,7 +164,8 @@ static bool read_preface(zckCtx *zck) {
+ 
+     /* Read flags */
+     size_t flags = 0;
+-    if(!compint_to_size(zck, &flags, header+length, &length, max_length))
++    if(!compint_to_size(zck, &flags, header+length, &length,
++                        max_length - length))
+         return false;
+     if(!check_flags(zck, flags))
+         return false;
+@@ -174,7 +175,8 @@ static bool read_preface(zckCtx *zck) {
+     int tmp = 0;
+ 
+     /* Read and initialize compression type */
+-    if(!compint_to_int(zck, &tmp, header+length, &length, max_length))
++    if(!compint_to_int(zck, &tmp, header+length, &length,
++                       max_length - length))
+         return false;
+     if(!comp_ioption(zck, ZCK_COMP_TYPE, tmp))
+         return false;
+@@ -185,15 +187,16 @@ static bool read_preface(zckCtx *zck) {
+     if(zck->has_optional_elems) {
+         size_t opt_count = 0;
+         if(!compint_to_size(zck, &opt_count, header+length, &length,
+-                            max_length))
++                            max_length - length))
+             return false;
+         for(size_t i=0; i<opt_count; i++) {
+             size_t id = 0;
+             size_t data_size = 0;
+-            if(!compint_to_size(zck, &id, header+length, &length, max_length))
++            if(!compint_to_size(zck, &id, header+length, &length,
++                                max_length - length))
+                 return false;
+             if(!compint_to_size(zck, &data_size, header+length, &length,
+-                                max_length))
++                                max_length - length))
+                 return false;
+             if(data_size > max_length - length) {
+                 set_fatal_error(zck, "Optional element exceeds header size");
+@@ -206,7 +209,8 @@ static bool read_preface(zckCtx *zck) {
+     }
+ 
+     /* Read and initialize index size */
+-    if(!compint_to_int(zck, &tmp, header+length, &length, max_length))
++    if(!compint_to_int(zck, &tmp, header+length, &length,
++                       max_length - length))
+         return false;
+     zck->index_size = tmp;
+ 
+diff --git a/test/meson.build b/test/meson.build
+index 66a1820..fc7a35f 100644
+--- a/test/meson.build
++++ b/test/meson.build
+@@ -52,6 +52,11 @@ exitcodecheck = executable('exitcodecheck',
+                       include_directories: incdir,
+                       dependencies: [zstd_dep, openssl_dep],
+                       c_args: preprocessor_defines)
++read_header_bounds = executable('read_header_bounds',
++                      ['read_header_bounds.c'] + util_sources,
++                      include_directories: incdir,
++                      dependencies: [zstd_dep, openssl_dep],
++                      c_args: preprocessor_defines)
+ zck_cmp_uncomp = executable(
+     'zck_cmp_uncomp',
+     ['zck_cmp_uncomp.c'],
+@@ -73,6 +78,11 @@ test(
+     empty,
+     is_parallel: false
+ )
++test(
++    'rejects truncated preface without over-reading',
++    read_header_bounds,
++    is_parallel: false
++)
+ test(
+     'check version info in zck',
+     zck,
+diff --git a/test/read_header_bounds.c b/test/read_header_bounds.c
+new file mode 100644
+index 0000000..2162de6
+--- /dev/null
++++ b/test/read_header_bounds.c
+@@ -0,0 +1,203 @@
++/*
++ * Copyright 2026 Jonathan Dieter <jonathan@dieter.ie>
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions are met:
++ *
++ *  1. Redistributions of source code must retain the above copyright notice,
++ *     this list of conditions and the following disclaimer.
++ *
++ *  2. Redistributions in binary form must reproduce the above copyright notice,
++ *     this list of conditions and the following disclaimer in the documentation
++ *     and/or other materials provided with the distribution.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
++ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
++ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
++ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++/* Regression test for the read_preface() out-of-bounds read - Only will
++ * report an issue when run under a sanitizer */
++
++#include <stdlib.h>
++#include <stdio.h>
++#include <string.h>
++#include <stdbool.h>
++#include <unistd.h>
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <fcntl.h>
++#include <zck.h>
++#include "zck_private.h"
++#include "util.h"
++
++#ifndef O_BINARY
++#define O_BINARY 0
++#endif
++
++#define TEST_FILE "read_header_bounds.zck"
++
++/* Exit code that tells meson the test was skipped */
++#define SKIP 77
++
++/* The over-read is only caught by a memory checker, so only run under
++ * valgrind (which preloads its own libraries) or AddressSanitizer */
++static bool memory_checked(void) {
++#ifdef __SANITIZE_ADDRESS__
++    return true;
++#else
++    const char *preload = getenv("LD_PRELOAD");
++    return preload != NULL && strstr(preload, "vgpreload") != NULL;
++#endif
++}
++
++/* Compute the SHA-256 header digest over the given bytes, using libzck's own
++ * hashing so it matches what read_header_from_file() will calculate. */
++static char *header_digest(const char *buf, size_t size) {
++    zckCtx *zck = zck_create();
++    if(zck == NULL)
++        return NULL;
++
++    zckHashType ht;
++    zckHash hash;
++    memset(&hash, 0, sizeof(hash));  /* hash_init() closes it before use */
++    if(!hash_setup(zck, &ht, ZCK_HASH_SHA256) ||
++       !hash_init(zck, &hash, &ht) ||
++       !hash_update(zck, &hash, buf, size)) {
++        zck_free(&zck);
++        return NULL;
++    }
++    char *digest = hash_finalize(zck, &hash);
++    zck_free(&zck);
++    return digest;
++}
++
++int main(void) {
++    if(!memory_checked()) {
++        printf("Skipping: needs valgrind or AddressSanitizer\n");
++        return SKIP;
++    }
++
++    char cibuf[MAX_COMP_SIZE];
++    size_t cilen;
++
++    /* SHA-256 digest size, read from libzck rather than hard-coded. */
++    zckHashType ht;
++    if(!hash_setup(NULL, &ht, ZCK_HASH_SHA256)) {
++        printf("ERROR: unable to set up SHA-256\n");
++        exit(1);
++    }
++    size_t digest_size = ht.digest_size;
++
++    /* --- Header body (the preface) ---
++     * full data digest (zero bytes) + flags(0) + a truncated compression-type
++     * compint.  The final byte has its high bit clear, so the reader believes
++     * the integer continues past the end of the header. */
++    char body[64];
++    size_t body_len = 0;
++
++    memset(body + body_len, 0, digest_size);         /* data digest */
++    body_len += digest_size;
++
++    cilen = 0;
++    compint_from_size(cibuf, 0, &cilen);             /* flags = 0 */
++    memcpy(body + body_len, cibuf, cilen);
++    body_len += cilen;
++
++    body[body_len++] = 0x00;  /* unterminated compression-type compint */
++
++    /* --- Lead ---
++     * "\0ZCK1" + compint(hash type) + compint(header length).  The header
++     * digest that follows is computed over the lead prefix plus the body,
++     * which is exactly the range read_header_from_file() hashes. */
++    char lead[16];
++    size_t lead_len = 0;
++
++    memcpy(lead, "\0ZCK1", 5);
++    lead_len = 5;
++
++    cilen = 0;
++    compint_from_size(cibuf, ZCK_HASH_SHA256, &cilen);
++    memcpy(lead + lead_len, cibuf, cilen);
++    lead_len += cilen;
++
++    cilen = 0;
++    compint_from_size(cibuf, body_len, &cilen);
++    memcpy(lead + lead_len, cibuf, cilen);
++    lead_len += cilen;
++
++    /* digest = SHA256(lead prefix + body) */
++    char *to_hash = zmalloc(lead_len + body_len);
++    if(to_hash == NULL)
++        exit(1);
++    memcpy(to_hash, lead, lead_len);
++    memcpy(to_hash + lead_len, body, body_len);
++    char *digest = header_digest(to_hash, lead_len + body_len);
++    free(to_hash);
++    if(digest == NULL) {
++        printf("ERROR: unable to compute header digest\n");
++        exit(1);
++    }
++
++    /* Write the file: lead, digest, body */
++    int out = open(TEST_FILE, O_WRONLY | O_CREAT | O_TRUNC | O_BINARY, 0666);
++    if(out < 0) {
++        perror("Unable to open " TEST_FILE " for writing");
++        free(digest);
++        exit(1);
++    }
++    if(write(out, lead, lead_len) != (ssize_t)lead_len ||
++       write(out, digest, digest_size) != (ssize_t)digest_size ||
++       write(out, body, body_len) != (ssize_t)body_len) {
++        perror("Short write");
++        close(out);
++        free(digest);
++        exit(1);
++    }
++    close(out);
++    free(digest);
++
++    /* Read it back: the header must be rejected, not over-read */
++    int in = open(TEST_FILE, O_RDONLY | O_BINARY);
++    if(in < 0) {
++        perror("Unable to open " TEST_FILE " for reading");
++        exit(1);
++    }
++
++    /* Drive the read stages individually so the test targets the preface */
++    zckCtx *zck = zck_create();
++    if(zck == NULL) {
++        close(in);
++        exit(1);
++    }
++    if(!zck_init_adv_read(zck, in) || !zck_read_lead(zck)) {
++        printf("ERROR: lead parse failed unexpectedly: %s\n",
++               zck_get_error(zck));
++        zck_free(&zck);
++        close(in);
++        unlink(TEST_FILE);
++        exit(1);
++    }
++
++    int rc = 0;
++    if(zck_read_header(zck)) {
++        printf("ERROR: zck_read_header accepted a truncated preface\n");
++        rc = 1;
++    } else {
++        printf("zck_read_header correctly rejected truncated preface: %s\n",
++               zck_get_error(zck));
++    }
++
++    zck_free(&zck);
++    close(in);
++    unlink(TEST_FILE);
++    return rc;
++}
diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.4.0.bb b/meta-oe/recipes-support/zchunk/zchunk_1.4.0.bb
index 0c8a9c7a5f0..04476782d33 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.4.0.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.4.0.bb
@@ -3,7 +3,11 @@ DESCRIPTION = "A file format designed for highly efficient deltas while maintain
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
 
-SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;branch=main"
+SRC_URI = " \
+    git://github.com/zchunk/zchunk.git;protocol=https;branch=main \
+    file://CVE-2026-117556-01.patch \
+    file://CVE-2026-117556-02.patch \
+"
 
 SRCREV = "4dd91d31157ede4a1b092721d944ae2fdd161cd9"
 S = "${WORKDIR}/git"
