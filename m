Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F14CA601E
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 16:42:57 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.126.1791564172383685799
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 09:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Qhxujole;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20261009164250c1a3009252000207b7-46of60@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20261009164250c1a3009252000207b7
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 09 Oct 2026 18:42:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=HAgL9xGnLJHSxZ0kNm4mGEm+G/7GVFr32K2OGjLU/iQ=;
 b=QhxujolenNrR4dtdHJ3aO86t6JsOyvaOlMeUaTyMgWHNXXeXMmaKvYI5E0GX44UHhCJpjj
 hkuVk4yLYA+N9eqqMTw4vGfA9DJKtqIutDMXubRujwipsGJv+1J4PLhOcnr6+aKwbEIulT9i
 g6QkbRHeab9PY3nDBRub+RJajNL870EaG5o0WOcSU+ZK11LmOza9365Spv1yo+eUs+LbQ5LM
 q7hLYxkju3DZncrvyoW75uStC+d56H2pa0ARE3vTVli7e7D7+0Cvhvw3dJURLtR8tFJPAhYv
 He9kfA3DHrAjd4OlV1jOJ7pTUJFVB/uKMskzUPqdHdSmA0u23uBoCe6A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][scarthgap][PATCH 3/7] squid: patch CVE-2026-32748
Date: Fri,  9 Oct 2026 18:41:59 +0200
Message-ID: <20261009164203.1744134-3-peter.marko@siemens.com>
In-Reply-To: <20261009164203.1744134-1-peter.marko@siemens.com>
References: <20261009164203.1744134-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 16:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130699

From: Peter Marko <peter.marko@siemens.com>

Pick SQUID-2026:2 patch per [1].

[1] https://github.com/squid-cache/squid/security/advisories/GHSA-f9p7-3jqg-hhvq

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../squid/files/CVE-2026-32748.patch          | 182 ++++++++++++++++++
 .../recipes-daemons/squid/squid_6.14.bb       |   1 +
 2 files changed, 183 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2026-32748.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2026-32748.patch b/meta-networking/recipes-daemons/squid/files/CVE-2026-32748.patch
new file mode 100644
index 0000000000..f492a9f4bb
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2026-32748.patch
@@ -0,0 +1,182 @@
+From 703e07d25ca6fa11f52d20bf0bb879e22ab7481b Mon Sep 17 00:00:00 2001
+From: Alex Rousskov <rousskov@measurement-factory.com>
+Date: Wed, 18 Feb 2026 21:13:26 +0000
+Subject: [PATCH] ICP: Fix HttpRequest lifetime for ICP v3 queries (#2377)
+
+ACLFilledChecklist correctly locks and unlocks HttpRequest. Thus, when
+given an unlocked request object, an on-stack checklist destroys it.
+Upon icpAccessAllowed() return, Squid uses the destroyed request object.
+
+This bug was probably introduced in 2003 commit 8000a965 that started
+automatically unlocking requests in ACLChecklist destructor. However,
+the bug did not affect allowed ICP v3 queries until 2007 commit f72fb56b
+started _using_ the request object for them. 2005 commit 319bf5a7 fixed
+an equivalent ICP v2 bug for denied queries but missed the ICP v3 case.
+
+The scope, age, and effect of this bug imply that Squid v3+ deployments
+receive no ICP v3 queries since 2007 (or earlier). Squid itself does not
+send ICP v3 messages, responding with ICP v2 replies to ICP v3 queries.
+TODO: Consider dropping ICP v3 support.
+
+Also moved icpAccessAllowed() inside icpGetRequest() to deduplicate code
+and reduce the risk of allowing a request without consulting icp_access.
+
+CVE: CVE-2026-32748
+Upstream-Status: Backport [https://github.com/squid-cache/squid/commit/703e07d25ca6fa11f52d20bf0bb879e22ab7481b]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/ICP.h             |  5 +----
+ src/icp_v2.cc         | 33 +++++++++++++++------------------
+ src/icp_v3.cc         | 10 ++--------
+ src/tests/stub_icp.cc |  4 ++--
+ 4 files changed, 20 insertions(+), 32 deletions(-)
+
+diff --git a/src/ICP.h b/src/ICP.h
+index e9ad8d0ce..a042d2d74 100644
+--- a/src/ICP.h
++++ b/src/ICP.h
+@@ -94,10 +94,7 @@ extern Ip::Address theIcpPublicHostID;
+ const char *icpGetUrl(const Ip::Address &from, const char *, const icp_common_t &);
+ 
+ /// \ingroup ServerProtocolICPAPI
+-HttpRequest *icpGetRequest(const char *url, int reqnum, int fd, const Ip::Address &from);
+-
+-/// \ingroup ServerProtocolICPAPI
+-bool icpAccessAllowed(Ip::Address &from, HttpRequest * icp_request);
++HttpRequestPointer icpGetRequest(const char *url, int reqnum, int fd, const Ip::Address &from);
+ 
+ /// \ingroup ServerProtocolICPAPI
+ void icpCreateAndSend(icp_opcode, int flags, char const *url, int reqnum, int pad, int fd, const Ip::Address &from, AccessLogEntryPointer);
+diff --git a/src/icp_v2.cc b/src/icp_v2.cc
+index 312104024..33baf9787 100644
+--- a/src/icp_v2.cc
++++ b/src/icp_v2.cc
+@@ -440,8 +440,9 @@ icpDenyAccess(const Ip::Address &from, const char * const url, const int reqnum,
+     }
+ }
+ 
+-bool
+-icpAccessAllowed(Ip::Address &from, HttpRequest * icp_request)
++/// icpGetRequest() helper that determines whether squid.conf allows the given ICP query
++static bool
++icpAccessAllowed(const Ip::Address &from, HttpRequest * icp_request)
+ {
+     /* absent any explicit rules, we deny all */
+     if (!Config.accessList.icp)
+@@ -486,7 +487,7 @@ icpGetUrl(const Ip::Address &from, const char * const buf, const icp_common_t &h
+     return url;
+ }
+ 
+-HttpRequest *
++HttpRequest::Pointer
+ icpGetRequest(const char * const url, const int reqnum, const int fd, const Ip::Address &from)
+ {
+     if (strpbrk(url, w_space)) {
+@@ -495,12 +496,17 @@ icpGetRequest(const char * const url, const int reqnum, const int fd, const Ip::
+     }
+ 
+     const auto mx = MasterXaction::MakePortless<XactionInitiator::initIcp>();
+-    auto *result = HttpRequest::FromUrlXXX(url, mx);
+-    if (!result)
+-        icpCreateAndSend(ICP_ERR, 0, url, reqnum, 0, fd, from, nullptr);
++    if (const HttpRequest::Pointer request = HttpRequest::FromUrlXXX(url, mx)) {
++        if (!icpAccessAllowed(from, request.getRaw())) {
++            icpDenyAccess(from, url, reqnum, fd);
++            return nullptr;
++        }
+ 
+-    return result;
++        return request;
++    }
+ 
++    icpCreateAndSend(ICP_ERR, 0, url, reqnum, 0, fd, from, nullptr);
++    return nullptr;
+ }
+ 
+ static void
+@@ -516,18 +522,11 @@ doV2Query(const int fd, Ip::Address &from, const char * const buf, icp_common_t
+         return;
+     }
+ 
+-    HttpRequest *icp_request = icpGetRequest(url, header.reqnum, fd, from);
++    const auto icp_request = icpGetRequest(url, header.reqnum, fd, from);
+ 
+     if (!icp_request)
+         return;
+ 
+-    HTTPMSGLOCK(icp_request);
+-
+-    if (!icpAccessAllowed(from, icp_request)) {
+-        icpDenyAccess(from, url, header.reqnum, fd);
+-        HTTPMSGUNLOCK(icp_request);
+-        return;
+-    }
+ #if USE_ICMP
+     if (header.flags & ICP_FLAG_SRC_RTT) {
+         rtt = netdbHostRtt(icp_request->url.host());
+@@ -540,7 +539,7 @@ doV2Query(const int fd, Ip::Address &from, const char * const buf, icp_common_t
+ #endif /* USE_ICMP */
+ 
+     /* The peer is allowed to use this cache */
+-    ICP2State state(header, icp_request);
++    ICP2State state(header, icp_request.getRaw());
+     state.fd = fd;
+     state.from = from;
+     state.url = xstrdup(url);
+@@ -569,8 +568,6 @@ doV2Query(const int fd, Ip::Address &from, const char * const buf, icp_common_t
+     }
+ 
+     icpCreateAndSend(codeToSend, flags, url, header.reqnum, src_rtt, fd, from, state.al);
+-
+-    HTTPMSGUNLOCK(icp_request);
+ }
+ 
+ void
+diff --git a/src/icp_v3.cc b/src/icp_v3.cc
+index 844768aa0..3864b0b74 100644
+--- a/src/icp_v3.cc
++++ b/src/icp_v3.cc
+@@ -40,19 +40,13 @@ doV3Query(int fd, Ip::Address &from, const char * const buf, icp_common_t header
+         return;
+     }
+ 
+-    HttpRequest *icp_request = icpGetRequest(url, header.reqnum, fd, from);
++    const auto icp_request = icpGetRequest(url, header.reqnum, fd, from);
+ 
+     if (!icp_request)
+         return;
+ 
+-    if (!icpAccessAllowed(from, icp_request)) {
+-        icpDenyAccess (from, url, header.reqnum, fd);
+-        delete icp_request;
+-        return;
+-    }
+-
+     /* The peer is allowed to use this cache */
+-    ICP3State state(header, icp_request);
++    ICP3State state(header, icp_request.getRaw());
+     state.fd = fd;
+     state.from = from;
+     state.url = xstrdup(url);
+diff --git a/src/tests/stub_icp.cc b/src/tests/stub_icp.cc
+index d148ab66d..4c9037495 100644
+--- a/src/tests/stub_icp.cc
++++ b/src/tests/stub_icp.cc
+@@ -9,6 +9,7 @@
+ #include "squid.h"
+ #include "AccessLogEntry.h"
+ #include "comm/Connection.h"
++#include "HttpRequest.h"
+ #include "ICP.h"
+ 
+ #define STUB_API "icp_*.cc"
+@@ -30,8 +31,7 @@ Comm::ConnectionPointer icpOutgoingConn;
+ Ip::Address theIcpPublicHostID;
+ 
+ const char *icpGetUrl(const Ip::Address &, const char *, const icp_common_t &) STUB_RETVAL(nullptr)
+-HttpRequest* icpGetRequest(const char *, int, int, const Ip::Address &) STUB_RETVAL(nullptr)
+-bool icpAccessAllowed(Ip::Address &, HttpRequest *) STUB_RETVAL(false)
++HttpRequest::Pointer icpGetRequest(const char *, int, int, const Ip::Address &) STUB_RETVAL(nullptr)
+ void icpCreateAndSend(icp_opcode, int, char const *, int, int, int, const Ip::Address &, AccessLogEntryPointer) STUB
+ icp_opcode icpGetCommonOpcode() STUB_RETVAL(ICP_INVALID)
+ void icpDenyAccess(const Ip::Address &, const char *, int, int) STUB
diff --git a/meta-networking/recipes-daemons/squid/squid_6.14.bb b/meta-networking/recipes-daemons/squid/squid_6.14.bb
index 5c3bd46b29..5552cbabcd 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.14.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.14.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://github.com/squid-cache/${BPN}/releases/download/SQUID_${PV_U}
            file://CVE-2025-62168.patch \
            file://CVE-2026-33526.patch \
            file://CVE-2026-33515.patch \
+           file://CVE-2026-32748.patch \
            "
 
 SRC_URI[sha256sum] = "9eafe06f58a199b918e79d33d8aa03afb9ae0c11d18974dca0b44c2669cab6dd"

