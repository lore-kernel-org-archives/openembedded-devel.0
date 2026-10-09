Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1DDCA601E
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 16:43:07 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.119.1791564182880262679
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 09:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=blbxDiBi;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202610091643001bc27febdf000207a0-nlchnl@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202610091643001bc27febdf000207a0
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 09 Oct 2026 18:43:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=/e/04Gbe9w1FULLdar4TeKA8qS2EknopubBHTSjKAnM=;
 b=blbxDiBiJwHocXNYL1y3n6Rf4WRcynhMHFbGwEhkBs3t4x9E2fySYH5yMBMJUezYZDXZpg
 PAjfaSxmUXndJfY49wlebsReazTsZ83TkN98vxdhvpctbPyvzrl3lH3SBUaKOGxOYrTxqG5i
 iTO4rXpskIuIXbpA31LyEXllcV4k9t+lijj0VinVuT2XG2Oi3/FsH+CdQxaNWoHUIEzW3O0e
 7egT9YC7Rem7/+re6DI9HX+1A5w97wOtA0VII+/CKsPzf9X+taV6l/StQWihXSZuCNo5hZGd
 oh8Zrs8bw28Cmd04hEkDcGVZBLwVRJsdbforZGwlzSffvAiEWrjmbPAg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][scarthgap][PATCH 4/7] squid: patch CVE-2026-47729
Date: Fri,  9 Oct 2026 18:42:00 +0200
Message-ID: <20261009164203.1744134-4-peter.marko@siemens.com>
In-Reply-To: <20261009164203.1744134-1-peter.marko@siemens.com>
References: <20261009164203.1744134-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 16:43:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130700

From: Peter Marko <peter.marko@siemens.com>

Pick SQUID-2026:4 patch per [1].

[1] https://github.com/squid-cache/squid/security/advisories/GHSA-8c37-pxjq-qwrg

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../squid/files/CVE-2026-47729.patch          | 51 +++++++++++++++++++
 .../recipes-daemons/squid/squid_6.14.bb       |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2026-47729.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2026-47729.patch b/meta-networking/recipes-daemons/squid/files/CVE-2026-47729.patch
new file mode 100644
index 0000000000..b250d8fbab
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2026-47729.patch
@@ -0,0 +1,51 @@
+From 865a131c7d557e68c965043d98c2eccae26deef8 Mon Sep 17 00:00:00 2001
+From: squidadm <squidadm@users.noreply.github.com>
+Date: Sun, 17 May 2026 18:04:47 +1200
+Subject: [PATCH] Improve parsing of certain FTP directory listing formats
+ (#2408) (#2409)
+
+This surgical fix restricts parsing to the input buffer when the listing
+entry date in "TypeA" or "TypeB" formats is not followed by a filename.
+It does not improve rendering of listings with missing filenames or the
+overall quality of FTP listing parsing code.
+
+C strchr() always returns a non-nil pointer when given a NUL character,
+so its callers must be careful not to supply a NUL character if a
+"natural" one-of-the-regular-c-string-characters membership test is
+required.
+
+The bug was probably introduced in 1997 commit 3fdadc70 and then
+duplicated in 2017 commit 3d872090.
+
+Co-authored-by: Alex Rousskov <rousskov@measurement-factory.com>
+Co-authored-by: Amos Jeffries <yadij@users.noreply.github.com>
+
+CVE: CVE-2026-47729
+Upstream-Status: Backport [https://github.com/squid-cache/squid/commit/865a131c7d557e68c965043d98c2eccae26deef8]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/clients/FtpGateway.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/clients/FtpGateway.cc b/src/clients/FtpGateway.cc
+index 164fd0e49..e04bb603d 100644
+--- a/src/clients/FtpGateway.cc
++++ b/src/clients/FtpGateway.cc
+@@ -622,7 +622,7 @@ ftpListParseParts(const char *buf, struct Ftp::GatewayFlags flags)
+             // point after tokens[i+2] :
+             copyFrom = buf + tokens[i + 2].pos + strlen(tokens[i + 2].token);
+             if (flags.skip_whitespace) {
+-                while (strchr(w_space, *copyFrom))
++                while (*copyFrom && strchr(w_space, *copyFrom))
+                     ++copyFrom;
+             } else {
+                 /* Handle the following four formats:
+@@ -633,7 +633,7 @@ ftpListParseParts(const char *buf, struct Ftp::GatewayFlags flags)
+                  * Assuming a single space between date and filename
+                  * suggested by:  Nathan.Bailey@cc.monash.edu.au and
+                  * Mike Battersby <mike@starbug.bofh.asn.au> */
+-                if (strchr(w_space, *copyFrom))
++                if (*copyFrom && strchr(w_space, *copyFrom))
+                     ++copyFrom;
+             }
+ 
diff --git a/meta-networking/recipes-daemons/squid/squid_6.14.bb b/meta-networking/recipes-daemons/squid/squid_6.14.bb
index 5552cbabcd..e244b97b5c 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.14.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.14.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://github.com/squid-cache/${BPN}/releases/download/SQUID_${PV_U}
            file://CVE-2026-33526.patch \
            file://CVE-2026-33515.patch \
            file://CVE-2026-32748.patch \
+           file://CVE-2026-47729.patch \
            "
 
 SRC_URI[sha256sum] = "9eafe06f58a199b918e79d33d8aa03afb9ae0c11d18974dca0b44c2669cab6dd"

