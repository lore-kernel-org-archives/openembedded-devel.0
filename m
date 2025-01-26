Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE842C02181
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 11:02:12 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.28141.1737889321692202819
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jan 2025 03:02:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=GszBbSBa;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202501261101580db8a6e897613caf4e-fpgt3f@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202501261101580db8a6e897613caf4e
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 26 Jan 2025 12:01:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=gxdXu34GFU2+6+1jYxwvfe3wdl6R+x+kTN8RTWhU1Qs=;
 b=GszBbSBa3lQtjNU+4gEIX7DpOg/0dRw3j8h3qwc8E1/0T6iUw3jbkA0ZfuAegzLdLKvkgf
 VC8pbziu7bWEHWX4j5DhMJtuDzh9Leb4ufcG0pQDuzm9hw4DDqdpiF9dq4S7739WbkmDDmo8
 AThLaBbyMJsqIbBlp6GQwdt6BC//cQxzxTNNXWFbBzLDfrVsF9rvOE+DF9vPxQ5NdrIHiNOl
 xG1YeHbYMnqN46q2fn8j6NZq+/V/jf3hWIzPZwTvM2BJoK6+8YNx3e4LJ/Vw0sLIMTU+6dE5
 Lwsk/zzmRmMjV0Ld7x+i4VQNk6S5ZXWGrDIKiyNrsuH8HusOiwzrySWg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][scarthgap][PATCH] python3-grpcio: patch CVE-2024-11407
Date: Sun, 26 Jan 2025 12:01:07 +0100
Message-Id: <20250126110107.725144-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Jan 2025 11:02:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115099

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick commit [1] mentioned in [2].

[1] https://github.com/grpc/grpc/commit/e9046b2bbebc0cb7f5dc42008f807f6c7e98e791
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-11407

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python3-grpcio/CVE-2024-11407.patch       | 32 +++++++++++++++++++
 .../python/python3-grpcio_1.62.2.bb           |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/CVE-2024-11407.patch

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/CVE-2024-11407.patch b/meta-python/recipes-devtools/python/python3-grpcio/CVE-2024-11407.patch
new file mode 100644
index 0000000000..eef5e7239e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio/CVE-2024-11407.patch
@@ -0,0 +1,32 @@
+From e9046b2bbebc0cb7f5dc42008f807f6c7e98e791 Mon Sep 17 00:00:00 2001
+From: Vignesh Babu <vigneshbabu@google.com>
+Date: Thu, 12 Sep 2024 11:13:45 -0700
+Subject: [PATCH] [EventEngine] Fix bug in Tx0cp code path in posix endpoint.
+
+This fix ensures that the iov_base pointers point to the right address.
+
+PiperOrigin-RevId: 673923651
+
+CVE: CVE-2024-11407
+Upstream-Status: Backport [https://github.com/grpc/grpc/commit/e9046b2bbebc0cb7f5dc42008f807f6c7e98e791]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/core/lib/event_engine/posix_engine/posix_endpoint.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/core/lib/event_engine/posix_engine/posix_endpoint.cc b/src/core/lib/event_engine/posix_engine/posix_endpoint.cc
+index 7634bb1334b..c5708db02c5 100644
+--- a/src/core/lib/event_engine/posix_engine/posix_endpoint.cc
++++ b/src/core/lib/event_engine/posix_engine/posix_endpoint.cc
+@@ -240,7 +240,7 @@ msg_iovlen_type TcpZerocopySendRecord::PopulateIovs(size_t* unwind_slice_idx,
+        iov_size++) {
+     MutableSlice& slice = internal::SliceCast<MutableSlice>(
+         buf_.MutableSliceAt(out_offset_.slice_idx));
+-    iov[iov_size].iov_base = slice.begin();
++    iov[iov_size].iov_base = slice.begin() + out_offset_.byte_idx;
+     iov[iov_size].iov_len = slice.length() - out_offset_.byte_idx;
+     *sending_length += iov[iov_size].iov_len;
+     ++(out_offset_.slice_idx);
+-- 
+2.30.2
+
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
index 59bfbf5538..b12b509142 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
@@ -12,6 +12,7 @@ SRC_URI += "file://0001-Include-missing-cstdint-header.patch \
            file://0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch;patchdir=third_party/boringssl-with-bazel/src/ \
            file://0001-target.h-define-proper-macro-for-ppc-ppc64.patch \
            file://0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch \
+           file://CVE-2024-11407.patch \
            "
 SRC_URI[sha256sum] = "c77618071d96b7a8be2c10701a98537823b9c65ba256c0b9067e0594cdbd954d"
 
-- 
2.30.2


