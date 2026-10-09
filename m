Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7406CA601E
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 16:42:47 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.112.1791564162033343734
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 09:42:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=lJYjOpR+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202610091642392cfb1cb60d0002074b-ky9hg_@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202610091642392cfb1cb60d0002074b
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 09 Oct 2026 18:42:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=JaSMxfzpgmZjucyfhMXoWMvBDYXqOZhYJnxuvIosYzw=;
 b=lJYjOpR+APKSzpLYlzsxyXbIfTcHgYTQRzoSI4p29Buea3ceLWn79Tb2F88ZxVi2SHpeYl
 GkaINDwzf6w3QXLcaHY1sThWd1jZCLDfGC3zs6Vv/BKkNpHLEOULVNcKcpu6uMTaQcc74Mvi
 dlJ4OHDvJxzQrQeKplygENBUX4KJRCuDyVoe+CP3SOQyNRs5YKanvKUGgh87d4hvVnv6R64o
 fCRiXCXHcMfdM/KCXhGgfw6tZaohcJCzIfYztvKQgbPAikdn6eRXYDbap3S+5D4AvQw34s7C
 BMQAbZuzIZ7hSqancDov1nEXkmTFrr/qn3gD4/Jk/8dJsdVVa+oa7Gxw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][scarthgap][PATCH 2/7] squid: patch CVE-2026-33515
Date: Fri,  9 Oct 2026 18:41:58 +0200
Message-ID: <20261009164203.1744134-2-peter.marko@siemens.com>
In-Reply-To: <20261009164203.1744134-1-peter.marko@siemens.com>
References: <20261009164203.1744134-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 16:42:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130698

From: Peter Marko <peter.marko@siemens.com>

Pick SQUID-2026:3 patch per [1].

[1] https://github.com/squid-cache/squid/security/advisories/GHSA-84p4-hcx7-jj7c

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../squid/files/CVE-2026-33515.patch          | 199 ++++++++++++++++++
 .../recipes-daemons/squid/squid_6.14.bb       |   1 +
 2 files changed, 200 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2026-33515.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2026-33515.patch b/meta-networking/recipes-daemons/squid/files/CVE-2026-33515.patch
new file mode 100644
index 0000000000..fdf5a7a6e9
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2026-33515.patch
@@ -0,0 +1,199 @@
+From 8138e909d2058d4401e0ad49b583afaec912b165 Mon Sep 17 00:00:00 2001
+From: Joshua Rogers <MegaManSec@users.noreply.github.com>
+Date: Thu, 12 Feb 2026 20:28:43 +0000
+Subject: [PATCH] ICP: Fix validation of packet sizes and URLs (#2220)
+
+Fix handling of malformed ICP queries and replies instead of passing
+invalid URL pointer to consumers, leading to out-of-bounds memory reads
+and other problems. These fixes affect both ICP v2 and ICP v3 traffic.
+
+* Reject packets with URLs that are not NUL-terminated.
+* Reject packets with URLs containing embedded NULs or trailing garbage.
+
+The above two restrictions may backfire if popular ICP agents do send
+such malformed URLs, and we will need to do more to handle them
+correctly, but it is _safe_ to reject them for now.
+
+Also protect icpHandleUdp() from dereferencing a nil icpOutgoingConn
+pointer. It is not clear whether icpHandleUdp() can be exposed to nil
+icpOutgoingConn in current code. More work is needed to polish this.
+
+CVE: CVE-2026-33515
+Upstream-Status: Backport [https://github.com/squid-cache/squid/commit/8138e909d2058d4401e0ad49b583afaec912b165]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/ICP.h             |  8 ++++--
+ src/icp_v2.cc         | 57 +++++++++++++++++++++++++++++++++++++------
+ src/icp_v3.cc         | 10 +++++---
+ src/tests/stub_icp.cc |  5 ++--
+ 4 files changed, 66 insertions(+), 14 deletions(-)
+
+diff --git a/src/ICP.h b/src/ICP.h
+index 10a8e1c67..e9ad8d0ce 100644
+--- a/src/ICP.h
++++ b/src/ICP.h
+@@ -89,8 +89,12 @@ extern Comm::ConnectionPointer icpIncomingConn;
+ extern Comm::ConnectionPointer icpOutgoingConn;
+ extern Ip::Address theIcpPublicHostID;
+ 
++/// A URI extracted from the given raw packet buffer.
++/// On errors, details the problem and returns nil.
++const char *icpGetUrl(const Ip::Address &from, const char *, const icp_common_t &);
++
+ /// \ingroup ServerProtocolICPAPI
+-HttpRequest* icpGetRequest(char *url, int reqnum, int fd, Ip::Address &from);
++HttpRequest *icpGetRequest(const char *url, int reqnum, int fd, const Ip::Address &from);
+ 
+ /// \ingroup ServerProtocolICPAPI
+ bool icpAccessAllowed(Ip::Address &from, HttpRequest * icp_request);
+@@ -102,7 +106,7 @@ void icpCreateAndSend(icp_opcode, int flags, char const *url, int reqnum, int pa
+ icp_opcode icpGetCommonOpcode();
+ 
+ /// \ingroup ServerProtocolICPAPI
+-void icpDenyAccess(Ip::Address &from, char *url, int reqnum, int fd);
++void icpDenyAccess(const Ip::Address &from, const char *url, int reqnum, int fd);
+ 
+ /// \ingroup ServerProtocolICPAPI
+ PF icpHandleUdp;
+diff --git a/src/icp_v2.cc b/src/icp_v2.cc
+index 25f7b71d2..312104024 100644
+--- a/src/icp_v2.cc
++++ b/src/icp_v2.cc
+@@ -425,7 +425,7 @@ icpCreateAndSend(icp_opcode opcode, int flags, char const *url, int reqnum, int
+ }
+ 
+ void
+-icpDenyAccess(Ip::Address &from, char *url, int reqnum, int fd)
++icpDenyAccess(const Ip::Address &from, const char * const url, const int reqnum, const int fd)
+ {
+     debugs(12, 2, "icpDenyAccess: Access Denied for " << from << " by " << AclMatchedName << ".");
+ 
+@@ -453,8 +453,41 @@ icpAccessAllowed(Ip::Address &from, HttpRequest * icp_request)
+     return checklist.fastCheck().allowed();
+ }
+ 
++const char *
++icpGetUrl(const Ip::Address &from, const char * const buf, const icp_common_t &header)
++{
++    const auto receivedPacketSize = static_cast<size_t>(header.length);
++    const auto payloadOffset = sizeof(header);
++
++    // Query payload contains a "Requester Host Address" followed by a URL.
++    // Payload of other ICP packets (with opcode that we recognize) is a URL.
++    const auto urlOffset = payloadOffset + ((header.opcode == ICP_QUERY) ? sizeof(uint32_t) : 0);
++
++    // A URL field cannot be empty because it includes a terminating NUL char.
++    // Ensure that the packet has at least one URL field byte.
++    if (urlOffset >= receivedPacketSize) {
++        debugs(12, 3, "too small packet from " << from << ": " << urlOffset << " >= " << receivedPacketSize);
++        return nullptr;
++    }
++
++    // All ICP packets (with opcode that we recognize) _end_ with a URL field.
++    // RFC 2186 requires all URLs to be "Null-Terminated".
++    if (buf[receivedPacketSize - 1] != '\0') {
++        debugs(12, 3, "unterminated URL or trailing garbage from " << from);
++        return nullptr;
++    }
++
++    const auto url = buf + urlOffset; // a possibly empty c-string
++    if (urlOffset + strlen(url) + 1 != receivedPacketSize) {
++        debugs(12, 3, "URL with an embedded NUL or trailing garbage from " << from);
++        return nullptr;
++    }
++
++    return url;
++}
++
+ HttpRequest *
+-icpGetRequest(char *url, int reqnum, int fd, Ip::Address &from)
++icpGetRequest(const char * const url, const int reqnum, const int fd, const Ip::Address &from)
+ {
+     if (strpbrk(url, w_space)) {
+         icpCreateAndSend(ICP_ERR, 0, rfc1738_escape(url), reqnum, 0, fd, from, nullptr);
+@@ -471,13 +504,18 @@ icpGetRequest(char *url, int reqnum, int fd, Ip::Address &from)
+ }
+ 
+ static void
+-doV2Query(int fd, Ip::Address &from, char *buf, icp_common_t header)
++doV2Query(const int fd, Ip::Address &from, const char * const buf, icp_common_t header)
+ {
+     int rtt = 0;
+     int src_rtt = 0;
+     uint32_t flags = 0;
+-    /* We have a valid packet */
+-    char *url = buf + sizeof(icp_common_t) + sizeof(uint32_t);
++
++    const auto url = icpGetUrl(from, buf, header);
++    if (!url) {
++        icpCreateAndSend(ICP_ERR, 0, "", header.reqnum, 0, fd, from, nullptr);
++        return;
++    }
++
+     HttpRequest *icp_request = icpGetRequest(url, header.reqnum, fd, from);
+ 
+     if (!icp_request)
+@@ -544,7 +582,9 @@ icp_common_t::handleReply(char *buf, Ip::Address &from)
+         neighbors_do_private_keys = 0;
+     }
+ 
+-    char *url = buf + sizeof(icp_common_t);
++    const auto url = icpGetUrl(from, buf, *this);
++    if (!url)
++        return;
+     debugs(12, 3, "icpHandleIcpV2: " << icp_opcode_str[opcode] << " from " << from << " for '" << url << "'");
+ 
+     const cache_key *key = icpGetCacheKey(url, (int) reqnum);
+@@ -679,7 +719,10 @@ icpHandleUdp(int sock, void *)
+ 
+         icp_version = (int) buf[1]; /* cheat! */
+ 
+-        if (icpOutgoingConn->local == from)
++        // XXX: The IP equality comparison below ignores port differences but
++        // should not. It also fails to detect loops when `local` is a wildcard
++        // address (e.g., [::]:3130) because `from` address is never a wildcard.
++        if (icpOutgoingConn && icpOutgoingConn->local == from)
+             // ignore ICP packets which loop back (multicast usually)
+             debugs(12, 4, "icpHandleUdp: Ignoring UDP packet sent by myself");
+         else if (icp_version == ICP_VERSION_2)
+diff --git a/src/icp_v3.cc b/src/icp_v3.cc
+index c912dd4c0..844768aa0 100644
+--- a/src/icp_v3.cc
++++ b/src/icp_v3.cc
+@@ -32,10 +32,14 @@ public:
+ 
+ /// \ingroup ServerProtocolICPInternal3
+ static void
+-doV3Query(int fd, Ip::Address &from, char *buf, icp_common_t header)
++doV3Query(int fd, Ip::Address &from, const char * const buf, icp_common_t header)
+ {
+-    /* We have a valid packet */
+-    char *url = buf + sizeof(icp_common_t) + sizeof(uint32_t);
++    const auto url = icpGetUrl(from, buf, header);
++    if (!url) {
++        icpCreateAndSend(ICP_ERR, 0, "", header.reqnum, 0, fd, from, nullptr);
++        return;
++    }
++
+     HttpRequest *icp_request = icpGetRequest(url, header.reqnum, fd, from);
+ 
+     if (!icp_request)
+diff --git a/src/tests/stub_icp.cc b/src/tests/stub_icp.cc
+index 44091838b..d148ab66d 100644
+--- a/src/tests/stub_icp.cc
++++ b/src/tests/stub_icp.cc
+@@ -29,11 +29,12 @@ Comm::ConnectionPointer icpIncomingConn;
+ Comm::ConnectionPointer icpOutgoingConn;
+ Ip::Address theIcpPublicHostID;
+ 
+-HttpRequest* icpGetRequest(char *, int, int, Ip::Address &) STUB_RETVAL(nullptr)
++const char *icpGetUrl(const Ip::Address &, const char *, const icp_common_t &) STUB_RETVAL(nullptr)
++HttpRequest* icpGetRequest(const char *, int, int, const Ip::Address &) STUB_RETVAL(nullptr)
+ bool icpAccessAllowed(Ip::Address &, HttpRequest *) STUB_RETVAL(false)
+ void icpCreateAndSend(icp_opcode, int, char const *, int, int, int, const Ip::Address &, AccessLogEntryPointer) STUB
+ icp_opcode icpGetCommonOpcode() STUB_RETVAL(ICP_INVALID)
+-void icpDenyAccess(Ip::Address &, char *, int, int) STUB
++void icpDenyAccess(const Ip::Address &, const char *, int, int) STUB
+ void icpHandleIcpV3(int, Ip::Address &, char *, int) STUB
+ void icpConnectionShutdown(void) STUB
+ int icpSetCacheKey(const cache_key *) STUB_RETVAL(0)
diff --git a/meta-networking/recipes-daemons/squid/squid_6.14.bb b/meta-networking/recipes-daemons/squid/squid_6.14.bb
index 965704920b..5c3bd46b29 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.14.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.14.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://github.com/squid-cache/${BPN}/releases/download/SQUID_${PV_U}
            file://CVE-2025-59362.patch \
            file://CVE-2025-62168.patch \
            file://CVE-2026-33526.patch \
+           file://CVE-2026-33515.patch \
            "
 
 SRC_URI[sha256sum] = "9eafe06f58a199b918e79d33d8aa03afb9ae0c11d18974dca0b44c2669cab6dd"

