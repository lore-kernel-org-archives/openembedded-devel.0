Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5181CE92725
	for <webhook@archiver.kernel.org>; Sun, 28 Dec 2025 13:39:35 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24416.1766929172404024370
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Dec 2025 05:39:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lAO8NKKZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fbc3056afso4460860f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Dec 2025 05:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766929171; x=1767533971; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iotRxNyGbj1lWzUd0gcsX39eEK+9zz8LetfWd2ecV9M=;
        b=lAO8NKKZRdF+aYfoyDqnwI04k1DZRDBsDe0r64zBGaOuYL36gzEkZuVJDkhYAPvXQy
         pkFkPEWmC7lBQm+848NJz4mPs6R8tXsQgc1eC+6S7fk/B3UazFNkcmsaAcwV7JM0JNw2
         XxSn/sQi4m/adltcxur2nwsVaOziyav6n3cSgxQoOwl1XMfZxc0hsxAoDRw6BPkIMIQb
         0rGf8VCk++0OOJkRiJiVU9mrObVjrxEkGwsKbcpdGcedIuCkIyTFNV3N8jQGpZX01yO6
         iqEf7+XeeRHm3u/4DAz/JyMMvnx/8+30NJL0FVE954zNpp82i2BJA50oAaAD9UGBsG9K
         ptBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766929171; x=1767533971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iotRxNyGbj1lWzUd0gcsX39eEK+9zz8LetfWd2ecV9M=;
        b=Xcd0qLG0kewZ/CCE0Kusw9bdyagtT6TKuff18i8vfbU0F5ub8+uI4a3on/Ok0Ael2J
         E9aBPsW8DV2WniFwUjnb77yRVtcuP1c8ZdOTGj92duTJxdPaHX5/nzoZp7Z0n04UmEOr
         gHZIC7c471oUd0hq7w0dj9K35lmE5D6X4hnJKbVmfKkKE2dwsLngWM98q/ssg9RRHwT1
         WZf+JhSY7Zg3Cm6edRGHS00p7RpyRIY2iCKDzRXG0EcI8dg1GFpSySHquOs+YQX7xBQC
         IZ5+wODbTe46Pk90mrQ88hJLuCIOS0Ch//sB6PJcvuANh4YR/9qG4Fsk7uw3VR5MRFRo
         l80g==
X-Gm-Message-State: AOJu0Yw00M2PqNDjE1MhjvkjiGqyh7bwavAv4chZHczF3Iz49qRN8bH3
	YUonybdkHbmhbilUQw6K+/R/rXf0FcRvYABgnv64tCex9fh3YxtVLfcY/aLYyA==
X-Gm-Gg: AY/fxX6Grd/PkqRWmlzCWYue9ucyLy3kTbLn2YYE3oAQZatauJLrgwLWJ3VkTBEFtxk
	I5E7PicCkT1lCS1tsCnqjYleABKww/9V2yt2MtymSqjHyGFSh6GWhpgJY34QADm4qEnEzAbmHsT
	vwnjiq3ZBE+wJquB88Q515xREtpYfVACVX0R0uwB9r1tRSxo/+Dy3g3fSZAJWcjCX1GQWasOH4S
	sgW1PsBLnHe37PeBqvevfEm1HITeiBfQNTZDNKqKBvb5n5fmVMomo4OBC3x3P0raYf+KfgyEd2k
	cKOIXY21uHIw8Mr8WX35ab/pR6lenTbQP/WbdxvDsybiG+uNFhG0EjWVJHCKrfj/GoE9Y18PYr7
	LmBBiXJDYzfE6BsocePbVsyxLxFOTvvQL9ScyDX47Mx1KVz/3ICNxTqLMapVoMQaMSJQT2lhOow
	ubegbncnsO
X-Google-Smtp-Source: AGHT+IF3i0E8OO9DVWYZfsNYo2vKJTATNZegf6IYfysheW+uKQFG7YUzNDuuLyiWLz0o6XhEzNiRPg==
X-Received: by 2002:a5d:5f47:0:b0:432:86e7:dd79 with SMTP id ffacd0b85a97d-43286e7ddabmr6130277f8f.3.1766929170342;
        Sun, 28 Dec 2025 05:39:30 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm57457874f8f.37.2025.12.28.05.39.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 05:39:29 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 1/3] nbdkit: patch CVE-2025-47711
Date: Sun, 28 Dec 2025 14:39:27 +0100
Message-ID: <20251228133929.2662904-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Dec 2025 13:39:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122962

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-47711

Pick the patch from the repository which explicitly mentions
this CVE ID.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../nbdkit/nbdkit/CVE-2025-47711.patch        | 168 ++++++++++++++++++
 .../recipes-support/nbdkit/nbdkit_1.30.2.bb   |   3 +-
 2 files changed, 170 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/nbdkit/nbdkit/CVE-2025-47711.patch

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit/CVE-2025-47711.patch b/meta-networking/recipes-support/nbdkit/nbdkit/CVE-2025-47711.patch
new file mode 100644
index 0000000000..edc1b7243c
--- /dev/null
+++ b/meta-networking/recipes-support/nbdkit/nbdkit/CVE-2025-47711.patch
@@ -0,0 +1,168 @@
+From 53b7e408f2a5fc449183ff4c82e1cad8387ca331 Mon Sep 17 00:00:00 2001
+From: Eric Blake <eblake@redhat.com>
+Date: Tue, 22 Apr 2025 17:01:12 -0500
+Subject: [PATCH] server: Fix off-by-one for maximum block_status length
+ [CVE-2025-47711]
+
+There has been an off-by-one bug in the code for .extents since the
+introduction of that callback.  Remember, internally the code allows
+plugins to report on extents with 64-bit lengths, but the protocol
+only supports 32-bit block status calls (nbdkit will need to create
+plugin version 3 before it can support NBD's newer 64-bit block
+status).  As such, the server loop intentionally truncates a plugin's
+large extent to 2**32-1 bytes.  But in the process of checking whether
+the loop should exit early, or if any additional extents should be
+reported to the client, the server used 'pos > offset+count' instead
+of >=, which is one byte too far.  If the client has requested exactly
+2**32-1 bytes, and the plugin's first extent has that same length, the
+code erroneously proceeds on to the plugin's second extent.  Worse, if
+the plugin's first extent has 2**32 bytes or more, it was truncated to
+2**31-1 bytes, but not completely handled, and the failure to exit the
+loop early means that the server then fails the assertion:
+
+nbdkit: ../../server/protocol.c:505: extents_to_block_descriptors:
+Assertion `e.length <= length' failed.
+
+The single-byte fix addresses both symptoms, while the added test
+demonstrates both when run on older nbdkit (the protocol violation
+when the plugin returns 2**32-1 bytes in the first extent, and the
+assertion failure when the plugin returns 2**32 or more bytes in the
+first extent).
+
+The problem can only be triggered by a client request for 2**32-1
+bytes; anything smaller is immune.  The problem also does not occur
+for plugins that do not return extents information beyond the client's
+request, or if the first extent is smaller than the client's request.
+
+The ability to cause the server to die from an assertion failure can
+be used as a denial of service attack against other clients.
+Mitigations: if you require the use of TLS, then you can ensure that
+you only have trusted clients that won't trigger a block status call
+of length 2**32-1 bytes.  Also, you can use "--filter=blocksize-policy
+blocksize-minimum=512" to reject block status attempts from clients
+that are not sector-aligned.
+
+Fixes: 26455d45 ('server: protocol: Implement Block Status "base:allocation".', v1.11.10)
+Reported-by: Nikolay Ivanets <stenavin@gmail.com>
+Signed-off-by: Eric Blake <eblake@redhat.com>
+Message-ID: <20250423211953.GR1450@redhat.com>
+Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
+
+CVE: CVE-2025-47711
+Upstream-Status: Backport [https://gitlab.com/nbdkit/nbdkit/-/commit/e6f96bd1b77c0cc927ce6aeff650b52238304f39]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ server/protocol.c          |  2 +-
+ tests/Makefile.am          |  2 ++
+ tests/test-eval-extents.sh | 71 ++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 74 insertions(+), 1 deletion(-)
+ create mode 100755 tests/test-eval-extents.sh
+
+diff --git a/server/protocol.c b/server/protocol.c
+index 2ac77055..015235ce 100644
+--- a/server/protocol.c
++++ b/server/protocol.c
+@@ -495,7 +495,7 @@ extents_to_block_descriptors (struct nbdkit_extents *extents,
+       (*nr_blocks)++;
+ 
+       pos += length;
+-      if (pos > offset + count) /* this must be the last block */
++      if (pos >= offset + count) /* this must be the last block */
+         break;
+ 
+       /* If we reach here then we must have consumed this whole
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 9b995e53..8ddf73d1 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -705,11 +705,13 @@ TESTS += \
+ 	test-eval.sh \
+ 	test-eval-file.sh \
+ 	test-eval-exports.sh \
++	test-eval-extents.sh \
+ 	$(NULL)
+ EXTRA_DIST += \
+ 	test-eval.sh \
+ 	test-eval-file.sh \
+ 	test-eval-exports.sh \
++	test-eval-extents.sh \
+ 	$(NULL)
+ 
+ # file plugin test.
+diff --git a/tests/test-eval-extents.sh b/tests/test-eval-extents.sh
+new file mode 100755
+index 00000000..92b503e6
+--- /dev/null
++++ b/tests/test-eval-extents.sh
+@@ -0,0 +1,71 @@
++#!/usr/bin/env bash
++# nbdkit
++# Copyright Red Hat
++#
++# Redistribution and use in source and binary forms, with or without
++# modification, are permitted provided that the following conditions are
++# met:
++#
++# * Redistributions of source code must retain the above copyright
++# notice, this list of conditions and the following disclaimer.
++#
++# * Redistributions in binary form must reproduce the above copyright
++# notice, this list of conditions and the following disclaimer in the
++# documentation and/or other materials provided with the distribution.
++#
++# * Neither the name of Red Hat nor the names of its contributors may be
++# used to endorse or promote products derived from this software without
++# specific prior written permission.
++#
++# THIS SOFTWARE IS PROVIDED BY RED HAT AND CONTRIBUTORS ''AS IS'' AND
++# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
++# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
++# PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL RED HAT OR
++# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
++# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
++# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
++# USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
++# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
++# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
++# OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
++# SUCH DAMAGE.
++
++source ./functions.sh
++set -e
++set -x
++
++requires_run
++requires_plugin eval
++requires_nbdsh_uri
++requires nbdsh --base-allocation --version
++
++files="eval-extents.out"
++rm -f $files
++cleanup_fn rm -f $files
++
++# Trigger an off-by-one bug introduced in v1.11.10 and fixed in v1.43.7
++export script='
++def f(context, offset, extents, status):
++  print(extents)
++
++# First, probe where the server should return 2 extents.
++h.block_status(2**32-1, 2, f)
++
++# Next, probe where the server has exactly 2**32-1 bytes in its first extent.
++h.block_status(2**32-1, 1, f)
++
++# Now, probe where the first extent has to be truncated.
++h.block_status(2**32-1, 0, f)
++'
++nbdkit eval \
++       get_size='echo 5G' \
++       pread='dd if=/dev/zero count=$3 iflag=count_bytes' \
++       extents='echo 0 4G 1; echo 4G 1G 2' \
++       --run 'nbdsh --base-allocation --uri "$uri" -c "$script"' \
++       > eval-extents.out
++cat eval-extents.out
++diff -u - eval-extents.out <<EOF
++[4294967294, 1, 1073741824, 2]
++[4294967295, 1]
++[4294967295, 1]
++EOF
diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.30.2.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.30.2.bb
index da24b1efd6..d5b51f0e8d 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.30.2.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.30.2.bb
@@ -10,7 +10,8 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
-"
+           file://CVE-2025-47711.patch \
+           "
 
 SRCREV = "b59380e061fdf0f114c13c226ea2a508f2c067d0"
 

