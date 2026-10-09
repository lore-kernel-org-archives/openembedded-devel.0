Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97851CA601E
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 16:42:37 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93.1791564147824598224
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 09:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=u/qM+60Z;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2026100916422467e6fdd90a00020788-qkzzfu@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2026100916422467e6fdd90a00020788
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 09 Oct 2026 18:42:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=+pnJfylU2GSAk06Z0vYYADie1beFliYwmGM17mcfc7w=;
 b=u/qM+60ZE/FXXx06HaGF2P/bZiMnnL7JTU4wfYcreHdvtti1u2qdyuC6GvrMxq9CQ5o3ei
 cTA7N1WBFH7IhKlAuiRmtas+GvjErb/nVHZ/lJhUvWOAa/h84DNhEhjBY+DT+JQjQLRFF6uR
 ul+E+dBybzkQqIKRavQ+RJ1mMUdea1byRf1BvHwdroij8vU0KtRR1SlkdLNoxQbvoN6+N4T/
 BffY5goshGU+Q/Y1uu169QTS8Nm9PDWfoFHA/LREbF19rA6AueAslvUQGGEyXJhyv6egwUhH
 q6sGNtWJufOZTdZESNe/r0P6talZGYp7AomVJB35oCluupyVa9I8b9cQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][scarthgap][PATCH 1/7] squid: patch CVE-2026-33526
Date: Fri,  9 Oct 2026 18:41:57 +0200
Message-ID: <20261009164203.1744134-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 16:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130697

From: Peter Marko <peter.marko@siemens.com>

Pick SQUID-2026:1 patch per [1].

[1] https://github.com/squid-cache/squid/security/advisories/GHSA-hpfx-h48q-gvwg

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../squid/files/CVE-2026-33526.patch          | 35 +++++++++++++++++++
 .../recipes-daemons/squid/squid_6.14.bb       |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2026-33526.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2026-33526.patch b/meta-networking/recipes-daemons/squid/files/CVE-2026-33526.patch
new file mode 100644
index 0000000000..beeb07c339
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2026-33526.patch
@@ -0,0 +1,35 @@
+From 8a7d42f9d44befb8fcbbb619505587c8de6a1e91 Mon Sep 17 00:00:00 2001
+From: Joshua Rogers <megamansec@gmail.com>
+Date: Tue, 10 Feb 2026 19:58:49 +0000
+Subject: [PATCH] Do not escape malformed URI twice when sending ICP errors
+ (#2374)
+
+In this context, escaping escaped URI always produces incorrect URI
+because `%` character in the escaped URI gets escaped again. Feeding the
+result of the first rfc1738_escape() call to the second call is also
+dangerously wrong because the result of the first call gets invalidated
+during the second call.
+
+No other cases of such "chained" rfc1738_escape() calls were found.
+
+Broken since 2002 commit e6ccf245.
+
+CVE: CVE-2026-33526
+Upstream-Status: Backport [https://github.com/squid-cache/squid/commit/8a7d42f9d44befb8fcbbb619505587c8de6a1e91]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/icp_v2.cc | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/icp_v2.cc b/src/icp_v2.cc
+index 2a4ced3bf..25f7b71d2 100644
+--- a/src/icp_v2.cc
++++ b/src/icp_v2.cc
+@@ -457,7 +457,6 @@ HttpRequest *
+ icpGetRequest(char *url, int reqnum, int fd, Ip::Address &from)
+ {
+     if (strpbrk(url, w_space)) {
+-        url = rfc1738_escape(url);
+         icpCreateAndSend(ICP_ERR, 0, rfc1738_escape(url), reqnum, 0, fd, from, nullptr);
+         return nullptr;
+     }
diff --git a/meta-networking/recipes-daemons/squid/squid_6.14.bb b/meta-networking/recipes-daemons/squid/squid_6.14.bb
index fc5b827da2..965704920b 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.14.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.14.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://github.com/squid-cache/${BPN}/releases/download/SQUID_${PV_U}
            file://squid.nm \
            file://CVE-2025-59362.patch \
            file://CVE-2025-62168.patch \
+           file://CVE-2026-33526.patch \
            "
 
 SRC_URI[sha256sum] = "9eafe06f58a199b918e79d33d8aa03afb9ae0c11d18974dca0b44c2669cab6dd"

