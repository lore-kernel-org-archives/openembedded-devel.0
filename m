Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF71DCCFA02
	for <webhook@archiver.kernel.org>; Sat,  1 Nov 2025 22:24:30 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.142.1762035862173317675
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Nov 2025 15:24:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Bh+QDyB+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20251101222416a5165a439c000207d4-mlkjcm@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20251101222416a5165a439c000207d4
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 01 Nov 2025 23:24:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Ov7FyNyHQ4dUh0FHZ0ph4j3BLVMrXSF9aIF0LbpL0JQ=;
 b=Bh+QDyB+r+G1GOvq+vJQiHoXhchAUVjZVXJxGFlSGgPWjQKYOBCryu2GCjYHcCeARK8fdn
 Vw5x1Lt0MccqgkCfRj1tUxIlzPv6EfzhbXaw9XhD+++cn/4AAFATZcOB/eN62xjgW+aEZ2Yw
 1NuHmoKxYz8NCf6rc/lVP2pcSIGrYpAtgl8k2CMcxnUH+TA4MH3WQiT1mgI+SXxDc5HT52/z
 ja8NHG4mmUgw/vBipDNyQzxFeqYqGVYbK6cz/G1s9G9FoAhAcj9osRkKE6lrMHOsFx6zt3HH
 8HTZHBLlme1bBTvQ2SK6JNL1iRS/jcA4BktgrL3YZCtEC8CO2o2r12eQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][scarthgap][PATCH] squid: patch CVE-2025-62168
Date: Sat,  1 Nov 2025 23:24:10 +0100
Message-Id: <20251101222410.1579968-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Nov 2025 22:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121255

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioned in NVD CVE report.

Conflict in src/errorpage.cc resolved per patch from Debian bookworm.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../squid/files/CVE-2025-62168.patch          | 207 ++++++++++++++++++
 .../recipes-daemons/squid/squid_6.9.bb        |   1 +
 2 files changed, 208 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2025-62168.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2025-62168.patch b/meta-networking/recipes-daemons/squid/files/CVE-2025-62168.patch
new file mode 100644
index 0000000000..cd32aa32a6
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2025-62168.patch
@@ -0,0 +1,207 @@
+From 0951a0681011dfca3d78c84fd7f1e19c78a4443f Mon Sep 17 00:00:00 2001
+From: Amos Jeffries <yadij@users.noreply.github.com>
+Date: Sat, 11 Oct 2025 16:33:02 +1300
+Subject: [PATCH] Bug 3390: Proxy auth data visible to scripts (#2249)
+
+Original changes to redact credentials from error page %R code
+expansion output was incomplete. It missed the parse failure
+case where ErrorState::request_hdrs raw buffer contained
+sensitive information.
+
+Also missed was the %W case where full request message headers
+were generated in a mailto link. This case is especially
+problematic as it may be delivered over insecure SMTP even if
+the error was secured with HTTPS.
+
+After this change:
+* The HttpRequest message packing code for error pages is de-duplicated
+  and elides authentication headers for both %R and %W code outputs.
+* The %R code output includes the CRLF request message terminator.
+* The email_err_data directive causing advanced details to be added to
+  %W mailto links is disabled by default.
+
+Also redact credentials from generated TRACE responses.
+
+---------
+
+Co-authored-by: Alex Rousskov <rousskov@measurement-factory.com>
+---
+ src/HttpRequest.cc            |  6 +++---
+ src/HttpRequest.h             |  2 +-
+ src/cf.data.pre               |  8 +++++++-
+ src/client_side_reply.cc      | 14 +++++++-------
+ src/errorpage.cc              | 17 ++++-------------
+ src/errorpage.h               |  1 -
+ src/tests/stub_HttpRequest.cc |  2 +-
+ 7 files changed, 23 insertions(+), 27 deletions(-)
+
+diff --git a/src/HttpRequest.cc b/src/HttpRequest.cc
+index cd7ee71d4..c6ed5bee4 100644
+--- a/src/HttpRequest.cc
++++ b/src/HttpRequest.cc
+@@ -341,7 +341,7 @@ HttpRequest::swapOut(StoreEntry * e)
+ 
+ /* packs request-line and headers, appends <crlf> terminator */
+ void
+-HttpRequest::pack(Packable * p) const
++HttpRequest::pack(Packable * const p, const bool maskSensitiveInfo) const
+ {
+     assert(p);
+     /* pack request-line */
+@@ -349,8 +349,8 @@ HttpRequest::pack(Packable * p) const
+                SQUIDSBUFPRINT(method.image()), SQUIDSBUFPRINT(url.path()),
+                http_ver.major, http_ver.minor);
+     /* headers */
+-    header.packInto(p);
+-    /* trailer */
++    header.packInto(p, maskSensitiveInfo);
++    /* indicate the end of the header section */
+     p->append("\r\n", 2);
+ }
+ 
+diff --git a/src/HttpRequest.h b/src/HttpRequest.h
+index 6d3690293..28dc4daf9 100644
+--- a/src/HttpRequest.h
++++ b/src/HttpRequest.h
+@@ -206,7 +206,7 @@ public:
+ 
+     void swapOut(StoreEntry * e);
+ 
+-    void pack(Packable * p) const;
++    void pack(Packable * p, bool maskSensitiveInfo = false) const;
+ 
+     static void httpRequestPack(void *obj, Packable *p);
+ 
+diff --git a/src/cf.data.pre b/src/cf.data.pre
+index 0a73020e1..2dce65a4d 100644
+--- a/src/cf.data.pre
++++ b/src/cf.data.pre
+@@ -8915,12 +8915,18 @@ NAME: email_err_data
+ COMMENT: on|off
+ TYPE: onoff
+ LOC: Config.onoff.emailErrData
+-DEFAULT: on
++DEFAULT: off
+ DOC_START
+ 	If enabled, information about the occurred error will be
+ 	included in the mailto links of the ERR pages (if %W is set)
+ 	so that the email body contains the data.
+ 	Syntax is <A HREF="mailto:%w%W">%w</A>
++
++	SECURITY WARNING:
++		Request headers and other included facts may contain
++		sensitive information about transaction history, the
++		Squid instance, and its environment which would be
++		unavailable to error recipients otherwise.
+ DOC_END
+ 
+ NAME: deny_info
+diff --git a/src/client_side_reply.cc b/src/client_side_reply.cc
+index d73bf3f99..fc2feccf8 100644
+--- a/src/client_side_reply.cc
++++ b/src/client_side_reply.cc
+@@ -94,7 +94,7 @@ clientReplyContext::clientReplyContext(ClientHttpRequest *clientContext) :
+ void
+ clientReplyContext::setReplyToError(
+     err_type err, Http::StatusCode status, char const *uri,
+-    const ConnStateData *conn, HttpRequest *failedrequest, const char *unparsedrequest,
++    const ConnStateData *conn, HttpRequest *failedrequest, const char *,
+ #if USE_AUTH
+     Auth::UserRequest::Pointer auth_user_request
+ #else
+@@ -104,9 +104,6 @@ clientReplyContext::setReplyToError(
+ {
+     auto errstate = clientBuildError(err, status, uri, conn, failedrequest, http->al);
+ 
+-    if (unparsedrequest)
+-        errstate->request_hdrs = xstrdup(unparsedrequest);
+-
+ #if USE_AUTH
+     errstate->auth_user_request = auth_user_request;
+ #endif
+@@ -995,11 +992,14 @@ clientReplyContext::traceReply()
+     triggerInitialStoreRead();
+     http->storeEntry()->releaseRequest();
+     http->storeEntry()->buffer();
++    MemBuf content;
++    content.init();
++    http->request->pack(&content, true /* hide authorization data */);
+     const HttpReplyPointer rep(new HttpReply);
+-    rep->setHeaders(Http::scOkay, nullptr, "text/plain", http->request->prefixLen(), 0, squid_curtime);
++    rep->setHeaders(Http::scOkay, nullptr, "message/http", content.contentSize(), 0, squid_curtime);
++    rep->body.set(SBuf(content.buf, content.size));
+     http->storeEntry()->replaceHttpReply(rep);
+-    http->request->swapOut(http->storeEntry());
+-    http->storeEntry()->complete();
++    http->storeEntry()->completeSuccessfully("traceReply() stored the entire response");
+ }
+ 
+ #define SENDING_BODY 0
+diff --git a/src/errorpage.cc b/src/errorpage.cc
+index d7a588d09..06046de9e 100644
+--- a/src/errorpage.cc
++++ b/src/errorpage.cc
+@@ -792,7 +792,6 @@ ErrorState::~ErrorState()
+ {
+     safe_free(redirect_url);
+     safe_free(url);
+-    safe_free(request_hdrs);
+     wordlistDestroy(&ftp.server_msg);
+     safe_free(ftp.request);
+     safe_free(ftp.reply);
+@@ -850,7 +849,7 @@ ErrorState::Dump(MemBuf * mb)
+                     SQUIDSBUFPRINT(request->url.path()),
+                     AnyP::ProtocolType_str[request->http_ver.protocol],
+                     request->http_ver.major, request->http_ver.minor);
+-        request->header.packInto(&str);
++        request->header.packInto(&str, true /* hide authorization data */);
+     }
+ 
+     str.append("\r\n", 2);
+@@ -1112,18 +1111,10 @@ ErrorState::compileLegacyCode(Build &build)
+                 p = "[no request]";
+             break;
+         }
+-        if (request) {
+-            mb.appendf(SQUIDSBUFPH " " SQUIDSBUFPH " %s/%d.%d\n",
+-                       SQUIDSBUFPRINT(request->method.image()),
+-                       SQUIDSBUFPRINT(request->url.path()),
+-                       AnyP::ProtocolType_str[request->http_ver.protocol],
+-                       request->http_ver.major, request->http_ver.minor);
+-            request->header.packInto(&mb, true); //hide authorization data
+-        } else if (request_hdrs) {
+-            p = request_hdrs;
+-        } else {
++        else if (request)
++            request->pack(&mb, true /* hide authorization data */);
++        else
+             p = "[no request]";
+-        }
+         break;
+ 
+     case 's':
+diff --git a/src/errorpage.h b/src/errorpage.h
+index abca4a17d..297b30697 100644
+--- a/src/errorpage.h
++++ b/src/errorpage.h
+@@ -194,7 +194,6 @@ public:
+         MemBuf *listing = nullptr;
+     } ftp;
+ 
+-    char *request_hdrs = nullptr;
+     char *err_msg = nullptr; /* Preformatted error message from the cache */
+ 
+     AccessLogEntryPointer ale; ///< transaction details (or nil)
+diff --git a/src/tests/stub_HttpRequest.cc b/src/tests/stub_HttpRequest.cc
+index 495597d9a..48a0f1ce0 100644
+--- a/src/tests/stub_HttpRequest.cc
++++ b/src/tests/stub_HttpRequest.cc
+@@ -45,7 +45,7 @@ bool HttpRequest::expectingBody(const HttpRequestMethod &, int64_t &) const STUB
+ bool HttpRequest::bodyNibbled() const STUB_RETVAL(false)
+ int HttpRequest::prefixLen() const STUB_RETVAL(0)
+ void HttpRequest::swapOut(StoreEntry *) STUB
+-void HttpRequest::pack(Packable *) const STUB
++void HttpRequest::pack(Packable *, bool) const STUB
+ void HttpRequest::httpRequestPack(void *, Packable *) STUB
+ HttpRequest * HttpRequest::FromUrl(const SBuf &, const MasterXaction::Pointer &, const HttpRequestMethod &) STUB_RETVAL(nullptr)
+ HttpRequest * HttpRequest::FromUrlXXX(const char *, const MasterXaction::Pointer &, const HttpRequestMethod &) STUB_RETVAL(nullptr)
diff --git a/meta-networking/recipes-daemons/squid/squid_6.9.bb b/meta-networking/recipes-daemons/squid/squid_6.9.bb
index 490a5401c3..26460d4619 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.9.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.9.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://squid.nm \
            file://CVE-2024-37894.patch \
            file://CVE-2025-59362.patch \
+           file://CVE-2025-62168.patch \
            "
 
 SRC_URI[sha256sum] = "1ad72d46e1cb556e9561214f0fb181adb87c7c47927ef69bc8acd68a03f61882"

