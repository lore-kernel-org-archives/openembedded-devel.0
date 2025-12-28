Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D85E784BE
	for <webhook@archiver.kernel.org>; Sun, 28 Dec 2025 13:39:35 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24496.1766929173417615526
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Dec 2025 05:39:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hqz5MyWo;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so53030895e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Dec 2025 05:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766929172; x=1767533972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLlcHkGfIB1MeAb3kf9zT9eHXwdSnDRSnWgDXdYk3cM=;
        b=Hqz5MyWoHItENJo8V1c2DHZXg1k9h9Pl5BGPTOlBCHkBFHqJcHR1+CgSBt8ZWswlwp
         Y0tb3ugd3Ae9o7Vu/6ctR8wuQcIcOhgf4Bx+4Y/5qimSYvW8rPaTGRrfZaC6V7Mb4VxD
         g/ro6LYhMMNOcae8e19ONRKf1h66+u4Crdm1Lm6RFvgIZtcB6K09c6O8/qszmLTaGJtR
         aKDre0/TY9KOmCh11AMXnO3g/7cZ70UDNF2q/AObZIBDEMKnIhNMPpIJ1P5DhkrJUAYu
         Pz+7yV9b3GcYXwLXgduyXwXMtDe+H2qYlOsUgjcFSMC+q28cE3C6N2G8NnWB2XQPlc/0
         elMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766929172; x=1767533972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vLlcHkGfIB1MeAb3kf9zT9eHXwdSnDRSnWgDXdYk3cM=;
        b=YcqeObRu63ua02K0RINAkCGm5kcuRf5avNOiE6fiCxmHlDorufc6CFfvyDqJF5Se1K
         2W7c3TUYIQ2oYM0tNnf1VFUdYaEyNBIXTtCdcRaOsHb9sTlN0jMGAsvMW+kkczJSx6Y3
         puvYzVgcRV9jeTABx3xLG3GbqtuSDk5MnomqyeLGcYujj1NT+AanpvJJA33nyqdu9Pwv
         QN13pL+DESTzj4yO6aD6ZBvpjDz4ud0Th7G4WlBKA0RYwdXzp6WQK/AjbEHOLBJ3Z7dL
         7StxclyOsMUe3H+Ze7s/MaROrvTtE7VM/umoCR3FW7ubQv6AL8P3IUZ/+E1fs0O3JcGU
         lcAQ==
X-Gm-Message-State: AOJu0YzFwhaKqV842uJXQvnx9eQFWwwYlH5EhcIjU7HbT6VHL2PEiVeD
	DwBRkusRC1uSz+lBGk3BXVA7Ha/wdxU4TaNk5O+ZcaX0u4fvYQYk1Vu6l9bdRg==
X-Gm-Gg: AY/fxX6Kld+VsoQ8C96HSY3B4szMYACTKvJDI+3NOffOmvaKhDmrswvqnZvxPQQpbNQ
	g1uocWQHjdzZXtt/evcKDEzk7Fz+mr8VgQ/8XTpe+3MUCUtqS0C1iimDzyDqwWNfQ3gO4LYRQl9
	PKgF1COWfODb0aHvrHJMm+1vxHhW4KhPHIlcbN1klRWw0IvcJ2wUq+k9VfdEKEF/i8z2JKsRAeE
	7TfAdi3fjXLd/qqbsuBQPeUKgRzpbLvYHWSVKHygLiA8trQI5jNCOyMlRI0HvOtUKBzy6YGla4E
	0tCNd2t+GzP8YI1J//UgKtOpMakxhrnDt/hhh7K4Y30TeUnT9mrWQW5el9qVMBrav/lSgzw+d8M
	Xnb256dlys0eBV0zfDiXtt3yjDZWuPh6sAJokwT4e/LX/K8gb/dxaxq7+IX6LoiIw+kV5rFdWK1
	q3PW+le6/h
X-Google-Smtp-Source: AGHT+IHDUfPrnaKiilbm9zEO4RdB9DDUpGf/nBnqD7SBvxYA1Wko/7PHpovfGcaMVTuLg5UACwEdAg==
X-Received: by 2002:a05:600c:470a:b0:477:7b16:5f9f with SMTP id 5b1f17b1804b1-47d1958a61fmr311325535e9.31.1766929171035;
        Sun, 28 Dec 2025 05:39:31 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm57457874f8f.37.2025.12.28.05.39.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 05:39:30 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 2/3] nbdkit: patch CVE-2025-47712
Date: Sun, 28 Dec 2025 14:39:28 +0100
Message-ID: <20251228133929.2662904-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228133929.2662904-1-skandigraun@gmail.com>
References: <20251228133929.2662904-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Dec 2025 13:39:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122963

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-47712

Pick the patch from the project's repository which explicitly
mentions this vulnerability ID.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../nbdkit/nbdkit/CVE-2025-47712.patch        | 162 ++++++++++++++++++
 .../recipes-support/nbdkit/nbdkit_1.30.2.bb   |   1 +
 2 files changed, 163 insertions(+)
 create mode 100644 meta-networking/recipes-support/nbdkit/nbdkit/CVE-2025-47712.patch

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit/CVE-2025-47712.patch b/meta-networking/recipes-support/nbdkit/nbdkit/CVE-2025-47712.patch
new file mode 100644
index 0000000000..84b0ad89f2
--- /dev/null
+++ b/meta-networking/recipes-support/nbdkit/nbdkit/CVE-2025-47712.patch
@@ -0,0 +1,162 @@
+From 4290f04d6fd9321fffcf09c0507a4f394e19f087 Mon Sep 17 00:00:00 2001
+From: Eric Blake <eblake@redhat.com>
+Date: Tue, 22 Apr 2025 19:53:39 -0500
+Subject: [PATCH] blocksize: Fix 32-bit overflow in .extents [CVE-2025-47712]
+
+If the original request is larger than 2**32 - minblock, then we were
+calling nbdkit_extents_aligned() with a count that rounded up then
+overflowed to 0 instead of the intended 4G because of overflowing a
+32-bit type, which in turn causes an assertion failure:
+
+nbdkit: ../../server/backend.c:814: backend_extents: Assertion `backend_valid_range (c, offset, count)' failed.
+
+The fix is to force the rounding to be in a 64-bit type from the
+get-go.
+
+The ability for a well-behaved client to cause the server to die from
+an assertion failure can be used as a denial of service attack against
+other clients.  Mitigations: if you requrire the use of TLS, then you
+can ensure that you only have trusted clients that won't trigger a
+block status call that large.  Also, the problem only occurs when
+using the blocksize filter, although setting the filter's maxlen
+parameter to a smaller value than its default of 2**32-1 does not
+help.
+
+Fixes: 2680be00 ('blocksize: Fix .extents when plugin changes type within minblock', v1.21.16)
+Signed-off-by: Eric Blake <eblake@redhat.com>
+Message-ID: <20250423210917.1784789-3-eblake@redhat.com>
+Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
+
+CVE: CVE-2025-47712
+Upstream-Status: Backport [https://gitlab.com/nbdkit/nbdkit/-/commit/a486f88d1eea653ea88b0bf8804c4825dab25ec7]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ filters/blocksize/blocksize.c            |  5 +-
+ tests/Makefile.am                        |  2 +
+ tests/test-blocksize-extents-overflow.sh | 83 ++++++++++++++++++++++++
+ 3 files changed, 88 insertions(+), 2 deletions(-)
+ create mode 100755 tests/test-blocksize-extents-overflow.sh
+
+diff --git a/filters/blocksize/blocksize.c b/filters/blocksize/blocksize.c
+index 03da4971..b06f78b3 100644
+--- a/filters/blocksize/blocksize.c
++++ b/filters/blocksize/blocksize.c
+@@ -474,8 +474,9 @@ blocksize_extents (nbdkit_next *next,
+     return -1;
+   }
+ 
+-  if (nbdkit_extents_aligned (next, MIN (ROUND_UP (count, h->minblock),
+-                                         h->maxlen),
++  if (nbdkit_extents_aligned (next,
++                              MIN (ROUND_UP ((uint64_t) count, h->minblock),
++                                   h->maxlen),
+                               ROUND_DOWN (offset, h->minblock), flags,
+                               h->minblock, extents2, err) == -1)
+     return -1;
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 8ddf73d1..a38a37bc 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -1415,11 +1415,13 @@ test_layers_filter3_la_LIBADD = $(IMPORT_LIBRARY_ON_WINDOWS)
+ TESTS += \
+ 	test-blocksize.sh \
+ 	test-blocksize-extents.sh \
++	test-blocksize-extents-overflow.sh \
+ 	test-blocksize-default.sh \
+ 	$(NULL)
+ EXTRA_DIST += \
+ 	test-blocksize.sh \
+ 	test-blocksize-extents.sh \
++	test-blocksize-extents-overflow.sh \
+ 	test-blocksize-default.sh \
+ 	$(NULL)
+ 
+diff --git a/tests/test-blocksize-extents-overflow.sh b/tests/test-blocksize-extents-overflow.sh
+new file mode 100755
+index 00000000..844c3999
+--- /dev/null
++++ b/tests/test-blocksize-extents-overflow.sh
+@@ -0,0 +1,83 @@
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
++# Demonstrate a fix for a bug where blocksize overflowed 32 bits
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
++# Script a sparse server that requires 512-byte aligned requests.
++exts='
++if test $(( ($3|$4) & 511 )) != 0; then
++  echo "EINVAL request unaligned" 2>&1
++  exit 1
++fi
++echo 0 5G 0
++'
++
++# We also need an nbdsh script to parse all extents, coalescing adjacent
++# types for simplicity.
++# FIXME: Once nbdkit plugin version 3 allows 64-bit block extents, run
++# this test twice, once for each bit size (32-bit needs 2 extents, 64-bit
++# will get the same result with only 1 extent).
++export script='
++size = h.get_size()
++offs = 0
++entries = []
++def f(metacontext, offset, e, err):
++    global entries
++    global offs
++    assert offs == offset
++    for length, flags in zip(*[iter(e)] * 2):
++        if entries and flags == entries[-1][1]:
++            entries[-1] = (entries[-1][0] + length, flags)
++        else:
++            entries.append((length, flags))
++        offs = offs + length
++
++# Test a loop over the entire device
++while offs < size:
++    len = min(size - offs, 2**32-1)
++    h.block_status(len, offs, f)
++assert entries == [(5 * 2**30, 0)]
++'
++
++# Now run everything
++nbdkit --filter=blocksize eval minblock=512 \
++       get_size='echo 5G' pread='exit 1' extents="$exts" \
++       --run 'nbdsh --base-allocation -u "$uri" -c "$script"'
diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.30.2.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.30.2.bb
index d5b51f0e8d..7996c43752 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.30.2.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.30.2.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
            file://CVE-2025-47711.patch \
+           file://CVE-2025-47712.patch \
            "
 
 SRCREV = "b59380e061fdf0f114c13c226ea2a508f2c067d0"

