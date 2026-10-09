Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C235CA601D
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 16:43:17 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127.1791564192835375225
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 09:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=NYL+dWe0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20261009164311c6c309556700020709-nn5izn@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20261009164311c6c309556700020709
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 09 Oct 2026 18:43:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=w0uzgh9RmqgXXUx6pg8iK1vkPr48Rxw1l1wULCQY1U0=;
 b=NYL+dWe07entnVAXUllzVWhkfcPGe3otv65EMaQAftPD/paPfY/h1VEJFs2nWJmgPDaEv/
 Fx6o4SLzSv6+qTD0Ov7LYTGbnNKkdJ+9nGtnTLa1DlKgspjnREmLXg6x6FjOK69p9rHOGE6a
 Rhi8+bgP8WCHdQTu2yqm9YxLbq4p6/0sqB8xqxCI/nRfkSlH4QEDBGUIqhUD11ifUpdHsHh6
 511PE5tPCTzYm6qd6RlcN5VgzQ1eGXGSQLaosOY40cQU7FNzOq1Vauboq4c1q20i8gpbHd1X
 AraqTxdAI6dJWMQ2WesDS/vAUiuNpVKYkWejcD3Y7o7IUpVY2zluSngg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][scarthgap][PATCH 5/7] squid: patch CVE-2026-50012
Date: Fri,  9 Oct 2026 18:42:01 +0200
Message-ID: <20261009164203.1744134-5-peter.marko@siemens.com>
In-Reply-To: <20261009164203.1744134-1-peter.marko@siemens.com>
References: <20261009164203.1744134-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 16:43:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130701

From: Peter Marko <peter.marko@siemens.com>

Pick SQUID-2026:5 patch per [1].
Also add compilation error fix per [2].

[1] https://github.com/squid-cache/squid/security/advisories/GHSA-5vmx-9x64-9284
[2] https://security-tracker.debian.org/tracker/CVE-2026-50012

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../squid/files/CVE-2026-50012-01.patch       | 34 +++++++++++++++++++
 .../squid/files/CVE-2026-50012-02.patch       | 31 +++++++++++++++++
 .../recipes-daemons/squid/squid_6.14.bb       |  2 ++
 3 files changed, 67 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2026-50012-01.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2026-50012-02.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2026-50012-01.patch b/meta-networking/recipes-daemons/squid/files/CVE-2026-50012-01.patch
new file mode 100644
index 0000000000..bd32f57cc4
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2026-50012-01.patch
@@ -0,0 +1,34 @@
+From 19fcfe922717c8b255270c032dcde4071c003bcd Mon Sep 17 00:00:00 2001
+From: Francesco Chemolli <5175948+kinkie@users.noreply.github.com>
+Date: Sat, 30 May 2026 10:16:33 +0000
+Subject: [PATCH] Harden peerDigestSwapInMask against invalid cache digest
+ reply (#2423)
+
+A cache_digest on-the-wire size may be bigger than the
+mask_size declared in the digest itself.
+
+Ignore the digest in case this happens.
+
+CVE: CVE-2026-50012
+Upstream-Status: Backport [https://github.com/squid-cache/squid/commit/19fcfe922717c8b255270c032dcde4071c003bcd]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/peer_digest.cc | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/peer_digest.cc b/src/peer_digest.cc
+index 741090574..53dac203e 100644
+--- a/src/peer_digest.cc
++++ b/src/peer_digest.cc
+@@ -622,6 +622,11 @@ peerDigestSwapInMask(void *data, char *buf, ssize_t size)
+      * NOTENOTENOTENOTENOTE: buf doesn't point to pd->cd->mask anymore!
+      * we need to do the copy ourselves!
+      */
++    Assure(size >= 0);
++    if (fetch->mask_offset + size > static_cast<ssize_t>(pd->cd->mask_size)) {
++        finishAndDeleteFetch(fetch, "peer digest mask data too large", true);
++        return -1;
++    }
+     memcpy(pd->cd->mask + fetch->mask_offset, buf, size);
+ 
+     /* NOTE! buf points to the middle of pd->cd->mask! */
diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2026-50012-02.patch b/meta-networking/recipes-daemons/squid/files/CVE-2026-50012-02.patch
new file mode 100644
index 0000000000..919c6b8314
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2026-50012-02.patch
@@ -0,0 +1,31 @@
+From c9c9a06be6fb21f400014dcb0ec7e6d573167a5d Mon Sep 17 00:00:00 2001
+From: Francesco Chemolli <5175948+kinkie@users.noreply.github.com>
+Date: Tue, 2 Jun 2026 20:53:07 +0000
+Subject: [PATCH] Fix -Wsign-compare on arm32 (#2432)
+
+Due to ssize_t differences on 32/64 bit platforms, changes
+to peerDigestSwapInMask in commit 556b91a8a7 cause
+signedness comparison errors.
+Refactor to be safe both on 32- and 64-bit platforms
+
+CVE: CVE-2026-50012
+Upstream-Status: Backport [https://github.com/squid-cache/squid/commit/c9c9a06be6fb21f400014dcb0ec7e6d573167a5d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/peer_digest.cc | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/peer_digest.cc b/src/peer_digest.cc
+index 53dac203e..2ad08043e 100644
+--- a/src/peer_digest.cc
++++ b/src/peer_digest.cc
+@@ -623,7 +623,8 @@ peerDigestSwapInMask(void *data, char *buf, ssize_t size)
+      * we need to do the copy ourselves!
+      */
+     Assure(size >= 0);
+-    if (fetch->mask_offset + size > static_cast<ssize_t>(pd->cd->mask_size)) {
++    Assure(pd->cd->mask_size >= fetch->mask_offset);
++    if (static_cast<size_t>(size) > pd->cd->mask_size - fetch->mask_offset) {
+         finishAndDeleteFetch(fetch, "peer digest mask data too large", true);
+         return -1;
+     }
diff --git a/meta-networking/recipes-daemons/squid/squid_6.14.bb b/meta-networking/recipes-daemons/squid/squid_6.14.bb
index e244b97b5c..ddaa4e48ac 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.14.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.14.bb
@@ -26,6 +26,8 @@ SRC_URI = "https://github.com/squid-cache/${BPN}/releases/download/SQUID_${PV_U}
            file://CVE-2026-33515.patch \
            file://CVE-2026-32748.patch \
            file://CVE-2026-47729.patch \
+           file://CVE-2026-50012-01.patch \
+           file://CVE-2026-50012-02.patch \
            "
 
 SRC_URI[sha256sum] = "9eafe06f58a199b918e79d33d8aa03afb9ae0c11d18974dca0b44c2669cab6dd"

