Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A7FD111A8
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 20:35:26 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4965.1764534923491960239
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 12:35:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NR9yII0Z;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47778b23f64so19160325e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 12:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764534922; x=1765139722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0g0D9Tjd1rmzbyAIWQFKMNJIC5mzvV73OPkWQd/NpMg=;
        b=NR9yII0Z+qw910lAMTmFqNt8k3glDPZ7MpSAGUxG0NuZesPRem40hkXfIV2/ZcYNLi
         a3Iq0su42joQDj82AwQsPfE7Y6DQfhKlgSK2Z/mWwq4U9aHq9H8bJOhZPg8stxCfU0E5
         sNsjDXiYA4envk46XCUaIJJkYFasD09+JFJy3YiKDw0UVUxP6j3KB8oG1zGeyysHi4e8
         hHdHEEsJhTkZWZiiN2r+YVByPea6ELXeXk3Wb44p/mWJtfyuqZuo3KPVSz03ZZYqCf9e
         KPHYKc5lz4GHwWfE8SeNlfkC1ntYyE/0HN2qBM7quf5N1+zjReRJBWUAgVr2LxtLUOpH
         3C4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764534922; x=1765139722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0g0D9Tjd1rmzbyAIWQFKMNJIC5mzvV73OPkWQd/NpMg=;
        b=SSQtWbOpa2UPqbAyXeVamWj5IIfw7p32mow7fIhW4c30KmtD0+8M6xHowU9OyMxfYO
         xgW4kSLg+G+w3uSlNtVZAtlUfoeXBXFzDFOANBrAlUmSz2jXm6B64/NbZyWRn3Utw7jJ
         +KqjtUz+EK9Uergit/1UsPR+YC2UDkSBKiWGU1YgjpXcdktlJD7RgHbhqvdpVDpvlneV
         rbu5AvuztjqUccrlkJ0MdPdoustUpHbINVEvXJ9sGwTi/2C0vFvn1J8mChbfZd5Vuk/2
         YKEFBSxF7SRnl9NNztoR9LhJiGesLf4pJ+824j+OyowihIhpv6YxErqcHZVkUg+s7TM3
         dHRg==
X-Gm-Message-State: AOJu0YzyLXbwOuk6iPI1gwyeF2fKDyCdoiXCPCC1WMC3Q+gTty6Kmwke
	g+/eRFZfJUwxbG7BQAbVmjLwxsLmhlTvvhTWj3P0pvjNvG7bGK4LZzhINwR2Gw==
X-Gm-Gg: ASbGncsRpgSruX+OMZ7x6G3Qzqi6piDzmZqD/JGe9PXM1BtwiX5WkVPLRVept6yt/wt
	UAZY+y7ZAvlidKeUSewqZyZd5Vvib9cnh9aEOs1gnqOVXBYo0NjUoAfqOrWxtrr1K8gPdw2HOh4
	cChY85iqq5jp5yH6DpycZM5e3miptbply9jFUJEWa9TwTlCEddnl26zKzfcAkYuo5+wO9y3K0my
	XIOJKC6kG8GVQJzzQpcIEy3oTYqdKcmjQ6/iWXzpTy/OL7BF53GNswu4il0UQ5yA9nr3XMgxnAu
	f926W50+ZT0Exw/I4eaQDmhoViyrCOC9vG0Ys4VYKID/MdnZj0KzsDfStAjKhmTzRZLCEFbLsmq
	UKwvhLr5H8xCSM7JmBb6JSn5bTEtW+BWT3OCeWrptx3f9P5Cv+Ttk0Bocowf/scv84UmLGYlpj8
	EdbkMnQObl
X-Google-Smtp-Source: AGHT+IGiQ7reHZqUkOUEcaHTdkWXOqidOZfNCxW3LNS4ZzvlSZyUQuJls1EKqauLJg4X8uc0tBM4yg==
X-Received: by 2002:a05:6000:2881:b0:42b:3dfb:645c with SMTP id ffacd0b85a97d-42cc1ac9debmr38592223f8f.12.1764534921762;
        Sun, 30 Nov 2025 12:35:21 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca8bae9sm21338810f8f.33.2025.11.30.12.35.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 12:35:21 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH 8/8] nbdkit: patch CVE-2025-47712
Date: Sun, 30 Nov 2025 21:35:11 +0100
Message-ID: <20251130203511.462501-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251130203511.462501-1-skandigraun@gmail.com>
References: <20251130203511.462501-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 20:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122188

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-47712

Pick the patch from the project's repository which explicitly
mentions this vulnerability ID.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../nbdkit/nbdkit/CVE-2025-47712.patch        | 166 ++++++++++++++++++
 .../recipes-support/nbdkit/nbdkit_1.33.11.bb  |   3 +-
 2 files changed, 168 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/nbdkit/nbdkit/CVE-2025-47712.patch

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit/CVE-2025-47712.patch b/meta-networking/recipes-support/nbdkit/nbdkit/CVE-2025-47712.patch
new file mode 100644
index 0000000000..0bd34f0995
--- /dev/null
+++ b/meta-networking/recipes-support/nbdkit/nbdkit/CVE-2025-47712.patch
@@ -0,0 +1,166 @@
+From fcc4b6e49c9e90b83de5619bba5c828b0e0dea45 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Tue, 22 Apr 2025 19:53:39 -0500
+Subject: [PATCH 2/2] blocksize: Fix 32-bit overflow in .extents
+ [CVE-2025-47712]
+
+From: Eric Blake <eblake@redhat.com>
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
+index 09195cea..e5c8b744 100644
+--- a/filters/blocksize/blocksize.c
++++ b/filters/blocksize/blocksize.c
+@@ -482,8 +482,9 @@ blocksize_extents (nbdkit_next *next,
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
+index 36ac1e16..a6fb1993 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -1473,12 +1473,14 @@ test_layers_filter3_la_LIBADD = $(IMPORT_LIBRARY_ON_WINDOWS)
+ TESTS += \
+ 	test-blocksize.sh \
+ 	test-blocksize-extents.sh \
++	test-blocksize-extents-overflow.sh \
+ 	test-blocksize-default.sh \
+ 	test-blocksize-sharding.sh \
+ 	$(NULL)
+ EXTRA_DIST += \
+ 	test-blocksize.sh \
+ 	test-blocksize-extents.sh \
++	test-blocksize-extents-overflow.sh \
+ 	test-blocksize-default.sh \
+ 	test-blocksize-sharding.sh \
+ 	$(NULL)
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
diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
index 0c83991b4d..dd1e52214b 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.11.bb
@@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
            file://0001-plugins-Avoid-absolute-buildpaths-in-binaries.patch \
-           file://CVE-2025-47711.patch"
+           file://CVE-2025-47711.patch \
+           file://CVE-2025-47712.patch"
 SRCREV = "6c02c6a469d62a047f230b0ccf03f72328312d2b"
 
 S = "${WORKDIR}/git"

