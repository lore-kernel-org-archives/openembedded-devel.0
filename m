Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59FBCFD376
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 20:35:26 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4999.1764534921931896134
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 12:35:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UYZSgdXs;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b3b0d76fcso2192307f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 12:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764534920; x=1765139720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WG9ZWji02ArrqfFVP2u/8REGiu6LqyCgdP0EZ8i91vs=;
        b=UYZSgdXssolnB4x2SWajpZWWe73BIS1iwVouyNMgexXkzyLCDDdJ1l98mLOjERQQi+
         cnkkY46gnbJggDMJMYxDVKn2cI3wzUcb3nrtODPOwfmoJczsxIW7GSICgtgsy2Rb9UwJ
         T5hrSav/Gard4xR/3iefeUjR44+axiGa7ls/j2RJFJDs4UxMr7kDFQyX1BsE4f6eOloG
         FHqP1NroGKVM06mXijLhibWbEVk3femkkvsGVbZFiVhE15thAKVRDgLWI8RS7mfPpdYo
         aamGyWzTrt875LVV1oqbQKQiKTdV75fDt3+y4ZXpW1aCGfD+PQ+ccL5PcEDd9neij+wY
         Toxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764534920; x=1765139720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WG9ZWji02ArrqfFVP2u/8REGiu6LqyCgdP0EZ8i91vs=;
        b=j8rakP+hjUikj8cKIwoluIffhImp/wrPuO/tzNtbNKOXMCwjM87WqLSSssc+gIpV46
         /LYPv1FH9rLPwAeirQldGRBaRstsT73sFVyJlqhH1eQIrMDEsuUmGUdNvlCPTYy+nAgc
         Io6C771xjXB3Z4DkTF2JTWwtrZ/B5K9KcSzVgtb0L1/kBhe7tshfl95DlTxBzOr4JejB
         bn3bOH2svE7cfJHGEeRJjwGQrZhDvBd1LEj4noaU4ipT6K8uwPBkppz6S4gT6UYQXl6/
         NAYz7ufTWiA2YxEk5cIQWMjANsYa+lgBue/3E48YDGjtGAGXDawibDPWquL5AlVUTfT3
         maBA==
X-Gm-Message-State: AOJu0YxUzTof/VvMLPyTb0IiBg9peIj7igwTN9ot74rdMFHR3ppLJXSU
	gvBrcHmV6BAGzmiumFbSci+h7AxMDefhobjCZfJyJEWA8PMK/OkSavvjjid0lQ==
X-Gm-Gg: ASbGncsRLJpNu3esbamMdMHv+2aUL4PRw+dp3CCDCZUAZP5j3TGKAyX6zIZoIT+q/QG
	tMYdvkJQaEw5N865OKY3Mn9ZtG+xHnxUIiz71Z+wwNbsJ2F1ivE2NUj4zq6LrK7V7/amxqkV6/H
	O8CXspJl/AUZq4LhyUGilfwiidEAGZbPk+P4A+D7Ey2o+3bDYevJ3T6KXzNpdKdsb9zZS/gsRGH
	Gu3SpqMZuhggmIc1iH5X0u8kMwJ++nzv22YpBSooX64wRQYIwFSMdKn5TgE+ruLMHHQbmhXs3bI
	WEQb6RLquyoUZDNhCv5VO4wpEuPnpfD7CzfStRMCbj4GeEDk6WxAYuM0+N6tVrkI7UQsQIqerb1
	APt6EVfIT88ZhS1PshtTceOIvj/F9bFpW1eSqJqueIBq1MzxkhmB7+OaX+osqDfWZ4SlPazj8yD
	kgMsTNv6/P
X-Google-Smtp-Source: AGHT+IGqiP5mUNXTJveuxzISG9O4qTdZ2cP+8iNDkz3PgWVPs7fTMGn3WCzprBvYluNoIaaS7m2eBg==
X-Received: by 2002:a05:6000:26cb:b0:429:d186:8c49 with SMTP id ffacd0b85a97d-42cc1d526b1mr39885154f8f.56.1764534920128;
        Sun, 30 Nov 2025 12:35:20 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca8bae9sm21338810f8f.33.2025.11.30.12.35.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 12:35:19 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH 7/8] nbdkit: patch CVE-2025-47711
Date: Sun, 30 Nov 2025 21:35:10 +0100
Message-ID: <20251130203511.462501-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251130203511.462501-1-skandigraun@gmail.com>
References: <20251130203511.462501-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 20:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122187

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-47711

Pick the patch from the repository which explicitly mentions
this CVE ID.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../nbdkit/nbdkit/CVE-2025-47711.patch        | 172 ++++++++++++++++++
 .../recipes-support/nbdkit/nbdkit_1.33.11.bb  |   3 +-
 2 files changed, 174 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/nbdkit/nbdkit/CVE-2025-47711.patch

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit/CVE-2025-47711.patch b/meta-networking/recipes-support/nbdkit/nbdkit/CVE-2025-47711.patch
new file mode 100644
index 0000000000..a5eb519738
--- /dev/null
+++ b/meta-networking/recipes-support/nbdkit/nbdkit/CVE-2025-47711.patch
@@ -0,0 +1,172 @@
+From 8b41004f101505fd13e0491c88570a00820ccdc2 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Tue, 22 Apr 2025 17:01:12 -0500
+Subject: [PATCH 1/2] server: Fix off-by-one for maximum block_status length
+ [CVE-2025-47711]
+
+From: Eric Blake <eblake@redhat.com>
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
+index d9a5e282..c32fec82 100644
+--- a/server/protocol.c
++++ b/server/protocol.c
+@@ -493,7 +493,7 @@ extents_to_block_descriptors (struct nbdkit_extents *extents,
+       (*nr_blocks)++;
+ 
+       pos += length;
+-      if (pos > offset + count) /* this must be the last block */
++      if (pos >= offset + count) /* this must be the last block */
+         break;
+ 
+       /* If we reach here then we must have consumed this whole
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 9b846d24..36ac1e16 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -781,6 +781,7 @@ TESTS += \
+ 	test-eval.sh \
+ 	test-eval-file.sh \
+ 	test-eval-exports.sh \
++	test-eval-extents.sh \
+ 	test-eval-cache.sh \
+ 	test-eval-dump-plugin.sh \
+ 	test-eval-disconnect.sh \
+@@ -789,6 +790,7 @@ EXTRA_DIST += \
+ 	test-eval.sh \
+ 	test-eval-file.sh \
+ 	test-eval-exports.sh \
++	test-eval-extents.sh \
+ 	test-eval-cache.sh \
+ 	test-eval-dump-plugin.sh \
+ 	test-eval-disconnect.sh \
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
diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
index cdf2677f13..0c83991b4d 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
@@ -10,7 +10,8 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
-           file://0001-plugins-Avoid-absolute-buildpaths-in-binaries.patch"
+           file://0001-plugins-Avoid-absolute-buildpaths-in-binaries.patch \
+           file://CVE-2025-47711.patch"
 SRCREV = "6c02c6a469d62a047f230b0ccf03f72328312d2b"
 
 S = "${WORKDIR}/git"

