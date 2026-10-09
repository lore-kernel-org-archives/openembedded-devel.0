Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A44ACA601E
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 16:43:27 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.129.1791564203189360977
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 09:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=nG3bF/Up;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202610091643216e31360ed900020761-wcsp4d@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202610091643216e31360ed900020761
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 09 Oct 2026 18:43:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=BeKA7cdzr73FxZJH+/WjzZr0M6gs35t1PH4bDL7zzDg=;
 b=nG3bF/UpsRML5r9gfuUAWndHdzma15mxZMhCWfaWXXVHXbdWBbos+Y+ffxrI5OQL3U6XXf
 VZeem7i6oZy3H2StJmdeWdqujzkxUKkotqR6RtiDSGwM+p+J8eLLZk1QYeRZrYbHsbFDa6Jt
 AHjBRbuwA+OiSa2N9VyM3TDtJh/8CTKrhHYCWujvhkdwhr0iTYrHe7CI5bHGfBbkXPmtQbZQ
 o+3Yn3xsbcw0xSFYPziDUJSeBrAoO+HqNDZMX+ePfqIpjsm79W3gDsafL8NBBqeYZDC/aMSW
 5zUthyQHfDVUlLsJ132hl5NybiFkJw2V26BSB0bSfuy5werBG6QEUDMg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][scarthgap][PATCH 6/7] squid: patch CVE-2026-61642
Date: Fri,  9 Oct 2026 18:42:02 +0200
Message-ID: <20261009164203.1744134-6-peter.marko@siemens.com>
In-Reply-To: <20261009164203.1744134-1-peter.marko@siemens.com>
References: <20261009164203.1744134-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 16:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130702

From: Peter Marko <peter.marko@siemens.com>

Pick SQUID-2026:6 patch per [1].

[1] https://github.com/squid-cache/squid/security/advisories/GHSA-537g-4gfh-w7m6

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../squid/files/CVE-2026-61642.patch          | 43 +++++++++++++++++++
 .../recipes-daemons/squid/squid_6.14.bb       |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2026-61642.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2026-61642.patch b/meta-networking/recipes-daemons/squid/files/CVE-2026-61642.patch
new file mode 100644
index 0000000000..f5f2424504
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2026-61642.patch
@@ -0,0 +1,43 @@
+From d06f48de8b8cc9a378cb91ecfe8e89b6e81696d2 Mon Sep 17 00:00:00 2001
+From: Amos Jeffries <yadij@users.noreply.github.com>
+Date: Sun, 31 May 2026 08:29:04 +0000
+Subject: [PATCH] HTTP/1.1: Transfer-Encoding:identity is prohibited (#2427)
+
+HTTP specification deprecated identity encoding but still allows
+its use as an unknown encoding when the Transfer-Encoding
+header is otherwise correctly used.
+
+Squid compliance update at the time kept accepting identity
+encoding as it was being used by agents. The form supported was
+Transfer-Encoding:identity.
+
+However, the HTTP specification explicitly requires that any
+encoding MUST be wrapped within chunked encoding.
+
+As such the bare Transfer-Encoding:identity form Squid accepted
+is explicitly prohibited.
+
+The correct Transfer-Encoding:identity,chunked syntax has been
+rejected by Squid for nearly 5 years already without complaint.
+So support is being dropped entirely here.
+
+CVE: CVE-2026-61642
+Upstream-Status: Backport [https://github.com/squid-cache/squid/commit/d06f48de8b8cc9a378cb91ecfe8e89b6e81696d2]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/HttpHeader.cc | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/HttpHeader.cc b/src/HttpHeader.cc
+index 3e06deab6..39422123f 100644
+--- a/src/HttpHeader.cc
++++ b/src/HttpHeader.cc
+@@ -516,8 +516,6 @@ HttpHeader::parse(const char *header_start, size_t hdrLen, Http::ContentLengthIn
+ 
+         if (rawTe.caseCmp("chunked") == 0) {
+             ; // leave header present for chunked() method
+-        } else if (rawTe.caseCmp("identity") == 0) { // deprecated. no coding
+-            delById(Http::HdrType::TRANSFER_ENCODING);
+         } else {
+             // This also rejects multiple encodings until we support them properly.
+             debugs(55, warnOnError, "WARNING: unsupported Transfer-Encoding used by client: " << rawTe);
diff --git a/meta-networking/recipes-daemons/squid/squid_6.14.bb b/meta-networking/recipes-daemons/squid/squid_6.14.bb
index ddaa4e48ac..0f07b38468 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.14.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.14.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://github.com/squid-cache/${BPN}/releases/download/SQUID_${PV_U}
            file://CVE-2026-47729.patch \
            file://CVE-2026-50012-01.patch \
            file://CVE-2026-50012-02.patch \
+           file://CVE-2026-61642.patch \
            "
 
 SRC_URI[sha256sum] = "9eafe06f58a199b918e79d33d8aa03afb9ae0c11d18974dca0b44c2669cab6dd"

