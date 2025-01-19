Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39BB0C02187
	for <webhook@archiver.kernel.org>; Sun, 19 Jan 2025 18:58:17 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.21106.1737313089058206699
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jan 2025 10:58:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ZFPUVdJt;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250119185804e355356217c36da306-d5e5cl@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250119185804e355356217c36da306
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 19 Jan 2025 19:58:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=5pcxfKMKwmnXK+cyQzBYxKFbGYXA7D68ylGvY/O5vSo=;
 b=ZFPUVdJtat56Dh7fYI6Ghqo1Gcg6EP8HlUkEMwQWWp6IyghqbirhsHRIGW7YkgVm085dqD
 HclyZauRcI8REjxxZafpMj+3A3hMJSGaaJCDUUtPN6N073TpMyIYlquufRlwv5oCubnv+GD2
 fGw0EMtkarGwWH3x8k7/F8gfBDcRcZ4GIDpxPEeL75MX8OfrA9ufQP4yud8evGl6a6iMD/97
 yAKMuVje+Gwm384KzMbUJAc7kkrbie+C1JVsqGRrySn4MuS3Et1m880ibTAtxLA2Y991AHzs
 mfXbEEIksgP3o3AkxfiQWahdV/ryw8x79pxDhdFL7mHLRrpVT1zmToeQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH] grpc: patch CVE-2024-11407
Date: Sun, 19 Jan 2025 19:57:17 +0100
Message-Id: <20250119185717.421718-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Jan 2025 18:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114957

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick commit [1] mentioned in [2].

[1] https://github.com/grpc/grpc/commit/e9046b2bbebc0cb7f5dc42008f807f6c7e98e791
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-11407

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../grpc/grpc/CVE-2024-11407.patch            | 32 +++++++++++++++++++
 meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb  |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/CVE-2024-11407.patch

diff --git a/meta-oe/recipes-devtools/grpc/grpc/CVE-2024-11407.patch b/meta-oe/recipes-devtools/grpc/grpc/CVE-2024-11407.patch
new file mode 100644
index 0000000000..beaff6a423
--- /dev/null
+++ b/meta-oe/recipes-devtools/grpc/grpc/CVE-2024-11407.patch
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
+@@ -239,7 +239,7 @@ msg_iovlen_type TcpZerocopySendRecord::PopulateIovs(size_t* unwind_slice_idx,
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
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb
index 4557fcc908..1594353ef5 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb
@@ -25,6 +25,7 @@ BRANCH = "v1.60.x"
 SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
            file://CVE-2024-7246.patch \
+           file://CVE-2024-11407.patch \
            "
 # Fixes build with older compilers 4.8 especially on ubuntu 14.04
 CXXFLAGS:append:class-native = " -Wl,--no-as-needed"
-- 
2.30.2


