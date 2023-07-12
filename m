Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D5C7EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 08:15:21 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.2662.1689149718248426668
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jul 2023 01:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=he7k3nbF;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689149718; x=1720685718;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nZhgXVx4fnabaSCFpMjsEFChnnvZ3qct62uYtIBo/Pk=;
  b=he7k3nbFu6Dlv2MPEhbKX4BxqexNhUz4MoyYt2FCf3N/8EImLZg3Xvft
   x0mhW/5TFd2nXzJAn2gnBNLyvtWe0CVAYkZo2d2pc+sbZqqOdankquUc2
   AIw9ZpH+KVIJE1r/wWuftRcQ2/XiVjMJq/ts74AMdNDi7WWeF1aYIXDJg
   I+UYSN81Dl7uLL/cei9XL+0A5S4+42OutiKyR9Td0bHNTpnyUX9YURWQt
   uxXXaIRfP76LbUc/5BI9slJSKVcvS8H0cVRp6cQw9jcziyGJaDd2cSf4U
   l138K5R7B93J7b4EAUGaDEWk3ZVl3qllZTK3JBGYNWCtSovG+kyDwb/Ha
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="363697972"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="363697972"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 01:15:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="866029726"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="866029726"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga001.fm.intel.com with ESMTP; 12 Jul 2023 01:15:11 -0700
From: chee.yang.lee@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][mickledore][patch] c-ares: upgrade 1.19.0 -> 1.19.1
Date: Wed, 12 Jul 2023 16:03:31 +0800
Message-Id: <20230712080331.2237663-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 08:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103836

From: Chee Yang Lee <chee.yang.lee@intel.com>

https://c-ares.org/changelog.html

c-ares version 1.19.1 - May 22 2023

Security:
CVE-2023-32067. High. 0-byte UDP payload causes Denial of Service
CVE-2023-31147 Moderate. Insufficient randomness in generation of DNS
query IDs
CVE-2023-31130. Moderate. Buffer Underwrite in ares_inet_net_pton()
CVE-2023-31124. Low. AutoTools does not set CARES_RANDOM_FILE during
cross compilation

Bug fixes:
Fix uninitialized memory warning in test
Turn off IPV6_V6ONLY on Windows to allow IPv4-mapped IPv6 addresses
ares_getaddrinfo() should allow a port of 0
Fix memory leak in ares_send() on error
Fix comment style in ares_data.h
Remove unneeded ifdef for Windows
Fix typo in ares_init_options.3
Re-add support for Watcom compiler
Sync ax_pthread.m4 with upstream
Windows: Invalid stack variable used out of scope for HOSTS path
Sync ax_cxx_compile_stdcxx_11.m4 with upstream to fix uclibc support

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../c-ares/c-ares/CVE-2023-32067.patch        | 87 -------------------
 .../{c-ares_1.19.0.bb => c-ares_1.19.1.bb}    |  6 +-
 2 files changed, 2 insertions(+), 91 deletions(-)
 delete mode 100644 meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch
 rename meta-oe/recipes-support/c-ares/{c-ares_1.19.0.bb => c-ares_1.19.1.bb} (83%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch b/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch
deleted file mode 100644
index cd13e7d9e5..0000000000
--- a/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From b9b8413cfdb70a3f99e1573333b23052d57ec1ae Mon Sep 17 00:00:00 2001
-From: Brad House <brad@brad-house.com>
-Date: Mon, 22 May 2023 06:51:49 -0400
-Subject: [PATCH] Merge pull request from GHSA-9g78-jv2r-p7vc
-
-CVE: CVE-2023-32067
-
-Upstream Status: Backport
-[https://github.com/c-ares/c-ares/commit/b9b8413cfdb70a3f99e1573333b23052d57ec1ae]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- src/lib/ares_process.c | 41 +++++++++++++++++++++++++----------------
- 1 file changed, 25 insertions(+), 16 deletions(-)
-
-diff --git a/src/lib/ares_process.c b/src/lib/ares_process.c
-index bf0cde4..6cac0a9 100644
---- a/src/lib/ares_process.c
-+++ b/src/lib/ares_process.c
-@@ -470,7 +470,7 @@ static void read_udp_packets(ares_channel channel, fd_set *read_fds,
- {
-   struct server_state *server;
-   int i;
--  ares_ssize_t count;
-+  ares_ssize_t read_len;
-   unsigned char buf[MAXENDSSZ + 1];
- #ifdef HAVE_RECVFROM
-   ares_socklen_t fromlen;
-@@ -513,32 +513,41 @@ static void read_udp_packets(ares_channel channel, fd_set *read_fds,
-       /* To reduce event loop overhead, read and process as many
-        * packets as we can. */
-       do {
--        if (server->udp_socket == ARES_SOCKET_BAD)
--          count = 0;
--
--        else {
--          if (server->addr.family == AF_INET)
-+        if (server->udp_socket == ARES_SOCKET_BAD) {
-+          read_len = -1;
-+        } else {
-+          if (server->addr.family == AF_INET) {
-             fromlen = sizeof(from.sa4);
--          else
-+          } else {
-             fromlen = sizeof(from.sa6);
--          count = socket_recvfrom(channel, server->udp_socket, (void *)buf,
--                                  sizeof(buf), 0, &from.sa, &fromlen);
-+          }
-+          read_len = socket_recvfrom(channel, server->udp_socket, (void *)buf,
-+                                     sizeof(buf), 0, &from.sa, &fromlen);
-         }
-
--        if (count == -1 && try_again(SOCKERRNO))
-+        if (read_len == 0) {
-+          /* UDP is connectionless, so result code of 0 is a 0-length UDP
-+           * packet, and not an indication the connection is closed like on
-+           * tcp */
-           continue;
--        else if (count <= 0)
-+        } else if (read_len < 0) {
-+          if (try_again(SOCKERRNO))
-+            continue;
-+
-           handle_error(channel, i, now);
-+
- #ifdef HAVE_RECVFROM
--        else if (!same_address(&from.sa, &server->addr))
-+        } else if (!same_address(&from.sa, &server->addr)) {
-           /* The address the response comes from does not match the address we
-            * sent the request to. Someone may be attempting to perform a cache
-            * poisoning attack. */
--          break;
-+          continue;
- #endif
--        else
--          process_answer(channel, buf, (int)count, i, 0, now);
--       } while (count > 0);
-+
-+        } else {
-+          process_answer(channel, buf, (int)read_len, i, 0, now);
-+        }
-+      } while (read_len >= 0);
-     }
- }
-
---
-2.40.0
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.19.0.bb b/meta-oe/recipes-support/c-ares/c-ares_1.19.1.bb
similarity index 83%
rename from meta-oe/recipes-support/c-ares/c-ares_1.19.0.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.19.1.bb
index 997f27a895..1440d72711 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.19.0.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.19.1.bb
@@ -5,10 +5,8 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
 
-SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https \
-           file://CVE-2023-32067.patch \
-	  "
-SRCREV = "fddf01938d3789e06cc1c3774e4cd0c7d2a89976"
+SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https"
+SRCREV = "6360e96b5cf8e5980c887ce58ef727e53d77243a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
 
-- 
2.37.3


