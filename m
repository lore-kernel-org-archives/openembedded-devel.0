Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6EDCA601D
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 16:43:37 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.141.1791564212621854968
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 09:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=PittU4vj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20261009164330f5f126558e000207ee-zxdidi@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20261009164330f5f126558e000207ee
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 09 Oct 2026 18:43:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=zVjarkkLmyQxGgktjb7ONacSnZNqloOXCsOqbM1LywY=;
 b=PittU4vj+iNEHSnPJeE1IgTu9OOmPGrmMd72B1vphyAwTLcu+rS7qdcWng01yF7au/XWVZ
 UyJs/5yQJvUvgD73KqdVADIdto7qI+EXwtXnGuB4tXtf5b/Y7RaUHy59cFPMcCjFK3CXYM10
 0jt41Ad6k5jDd4ofxHpoOnNAadaOM/w4P7nOFFec4spVmd6dSKmLtfj10WDNhq146Z5jlbsK
 frOMkmf1A861xqVf8qfw0obrdl8k5YRr9gx6Mnz5WCqDv65M5YkUvW/HFgGn8pgO1V/eMUv5
 +FbGtO7A2yrhmj3sHyBxZgEM1e29SBCPgeTF45TwkRJvQaTPiFP7sCrA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][scarthgap][PATCH 7/7] squid: patch CVE-2026-104786
Date: Fri,  9 Oct 2026 18:42:03 +0200
Message-ID: <20261009164203.1744134-7-peter.marko@siemens.com>
In-Reply-To: <20261009164203.1744134-1-peter.marko@siemens.com>
References: <20261009164203.1744134-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 16:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130703

From: Peter Marko <peter.marko@siemens.com>

Pick SQUID-2026:7/SQUID-2026:8 patch per [1] and [2].

[1] https://github.com/squid-cache/squid/security/advisories/GHSA-j9pf-q9f6-v44c
[2] https://github.com/squid-cache/squid/security/advisories/GHSA-vh99-xw7j-fx5c

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../squid/files/CVE-2026-104786.patch         | 131 ++++++++++++++++++
 .../recipes-daemons/squid/squid_6.14.bb       |   1 +
 2 files changed, 132 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2026-104786.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2026-104786.patch b/meta-networking/recipes-daemons/squid/files/CVE-2026-104786.patch
new file mode 100644
index 0000000000..41e1fce735
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2026-104786.patch
@@ -0,0 +1,131 @@
+From 8b3c2f2eea22886288edb47d4c30177bf8673650 Mon Sep 17 00:00:00 2001
+From: Francesco Chemolli <5175948+kinkie@users.noreply.github.com>
+Date: Sun, 19 Jul 2026 21:22:29 +0000
+Subject: [PATCH] Protect base64 encoding buffers (#2447)
+
+Check bounds before base64-encoding data into fixed-size buffers.
+
+CVE: CVE-2026-104786
+Upstream-Status: Backport [https://github.com/squid-cache/squid/commit/8b3c2f2eea22886288edb47d4c30177bf8673650]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/sspwin32.cc                  |  1 +
+ src/adaptation/icap/ModXact.cc   | 12 +++++++++---
+ src/http.cc                      | 23 ++++++++++++++++++-----
+ src/peer_proxy_negotiate_auth.cc |  2 ++
+ 4 files changed, 30 insertions(+), 8 deletions(-)
+
+diff --git a/lib/sspwin32.cc b/lib/sspwin32.cc
+index 636731751..a07b5ceb3 100644
+--- a/lib/sspwin32.cc
++++ b/lib/sspwin32.cc
+@@ -492,6 +492,7 @@ const char * WINAPI SSP_MakeChallenge(PVOID PNegotiateBuf, int NegotiateLen)
+         struct base64_encode_ctx ctx;
+         base64_encode_init(&ctx);
+         static char encoded[8192];
++        assert(base64_encode_len(cbOut) < sizeof(encoded));
+         size_t dstLen = base64_encode_update(&ctx, encoded, cbOut, reinterpret_cast<const uint8_t*>(fResult));
+         assert(dstLen < sizeof(encoded));
+         dstLen += base64_encode_final(&ctx, encoded+dstLen);
+diff --git a/src/adaptation/icap/ModXact.cc b/src/adaptation/icap/ModXact.cc
+index 441bfc396..f3a187c19 100644
+--- a/src/adaptation/icap/ModXact.cc
++++ b/src/adaptation/icap/ModXact.cc
+@@ -1402,12 +1402,18 @@ void Adaptation::Icap::ModXact::makeRequestHeaders(MemBuf &buf)
+         String vh=virgin.header->header.getById(Http::HdrType::PROXY_AUTHORIZATION);
+         buf.appendf("Proxy-Authorization: " SQUIDSTRINGPH "\r\n", SQUIDSTRINGPRINT(vh));
+     } else if (request->extacl_user.size() > 0 && request->extacl_passwd.size() > 0) {
++        const auto userLen = request->extacl_user.size();
++        const auto passwdLen = request->extacl_passwd.size();
++        // +1 for the ':' separator between user and passwd
++        const auto plainLen = userLen + 1 + passwdLen;
++        if (plainLen > MAX_LOGIN_SZ)
++            throw TextException("extacl credentials too long for Proxy-Authorization", Here());
++        char base64buf[base64_encode_len(MAX_LOGIN_SZ)];
+         struct base64_encode_ctx ctx;
+         base64_encode_init(&ctx);
+-        char base64buf[base64_encode_len(MAX_LOGIN_SZ)];
+-        size_t resultLen = base64_encode_update(&ctx, base64buf, request->extacl_user.size(), reinterpret_cast<const uint8_t*>(request->extacl_user.rawBuf()));
++        auto resultLen = base64_encode_update(&ctx, base64buf, userLen, reinterpret_cast<const uint8_t*>(request->extacl_user.rawBuf()));
+         resultLen += base64_encode_update(&ctx, base64buf+resultLen, 1, reinterpret_cast<const uint8_t*>(":"));
+-        resultLen += base64_encode_update(&ctx, base64buf+resultLen, request->extacl_passwd.size(), reinterpret_cast<const uint8_t*>(request->extacl_passwd.rawBuf()));
++        resultLen += base64_encode_update(&ctx, base64buf+resultLen, passwdLen, reinterpret_cast<const uint8_t*>(request->extacl_passwd.rawBuf()));
+         resultLen += base64_encode_final(&ctx, base64buf+resultLen);
+         buf.appendf("Proxy-Authorization: Basic %.*s\r\n", (int)resultLen, base64buf);
+     }
+diff --git a/src/http.cc b/src/http.cc
+index df67fbbd2..3cf776ae8 100644
+--- a/src/http.cc
++++ b/src/http.cc
+@@ -1853,8 +1853,12 @@ httpFixupAuthentication(HttpRequest * request, const HttpHeader * hdr_in, HttpHe
+             username = request->auth_user_request->username();
+ #endif
+ 
+-        blen = base64_encode_update(&ctx, loginbuf, strlen(username), reinterpret_cast<const uint8_t*>(username));
+-        blen += base64_encode_update(&ctx, loginbuf+blen, strlen(request->peer_login +1), reinterpret_cast<const uint8_t*>(request->peer_login +1));
++        const auto usernameLen = strlen(username);
++        const auto suffixLen = strlen(request->peer_login + 1);
++        if (usernameLen + suffixLen > MAX_LOGIN_SZ)
++            throw TextException("peer login credentials too long", Here());
++        blen = base64_encode_update(&ctx, loginbuf, usernameLen, reinterpret_cast<const uint8_t*>(username));
++        blen += base64_encode_update(&ctx, loginbuf+blen, suffixLen, reinterpret_cast<const uint8_t*>(request->peer_login +1));
+         blen += base64_encode_final(&ctx, loginbuf+blen);
+         httpHeaderPutStrf(hdr_out, header, "Basic %.*s", (int)blen, loginbuf);
+         return;
+@@ -1865,9 +1869,14 @@ httpFixupAuthentication(HttpRequest * request, const HttpHeader * hdr_in, HttpHe
+             (strcmp(request->peer_login, "PASS") == 0 ||
+              strcmp(request->peer_login, "PROXYPASS") == 0)) {
+ 
+-        blen = base64_encode_update(&ctx, loginbuf, request->extacl_user.size(), reinterpret_cast<const uint8_t*>(request->extacl_user.rawBuf()));
++        const auto userLen = request->extacl_user.size();
++        const auto passwdLen = request->extacl_passwd.size();
++        // +1 for the ':' separator between user and passwd
++        if (userLen + 1 + passwdLen > MAX_LOGIN_SZ)
++            throw TextException("extacl credentials too long for peer login", Here());
++        blen = base64_encode_update(&ctx, loginbuf, userLen, reinterpret_cast<const uint8_t*>(request->extacl_user.rawBuf()));
+         blen += base64_encode_update(&ctx, loginbuf+blen, 1, reinterpret_cast<const uint8_t*>(":"));
+-        blen += base64_encode_update(&ctx, loginbuf+blen, request->extacl_passwd.size(), reinterpret_cast<const uint8_t*>(request->extacl_passwd.rawBuf()));
++        blen += base64_encode_update(&ctx, loginbuf+blen, passwdLen, reinterpret_cast<const uint8_t*>(request->extacl_passwd.rawBuf()));
+         blen += base64_encode_final(&ctx, loginbuf+blen);
+         httpHeaderPutStrf(hdr_out, header, "Basic %.*s", (int)blen, loginbuf);
+         return;
+@@ -1897,7 +1906,10 @@ httpFixupAuthentication(HttpRequest * request, const HttpHeader * hdr_in, HttpHe
+     }
+ #endif /* HAVE_KRB5 && HAVE_GSSAPI */
+ 
+-    blen = base64_encode_update(&ctx, loginbuf, strlen(request->peer_login), reinterpret_cast<const uint8_t*>(request->peer_login));
++    const auto loginLen = strlen(request->peer_login);
++    if (loginLen > MAX_LOGIN_SZ)
++        throw TextException("peer_login too long", Here());
++    blen = base64_encode_update(&ctx, loginbuf, loginLen, reinterpret_cast<const uint8_t*>(request->peer_login));
+     blen += base64_encode_final(&ctx, loginbuf+blen);
+     httpHeaderPutStrf(hdr_out, header, "Basic %.*s", (int)blen, loginbuf);
+     return;
+@@ -2024,6 +2036,7 @@ HttpStateData::httpBuildRequestHeader(HttpRequest * request,
+     /* append Authorization if known in URL, not in header and going direct */
+     if (!hdr_out->has(Http::HdrType::AUTHORIZATION)) {
+         if (flags.toOrigin && !request->url.userInfo().isEmpty()) {
++            Assure(request->url.userInfo().length() < MAX_URL*2);
+             static char result[base64_encode_len(MAX_URL*2)]; // should be big enough for a single URI segment
+             struct base64_encode_ctx ctx;
+             base64_encode_init(&ctx);
+diff --git a/src/peer_proxy_negotiate_auth.cc b/src/peer_proxy_negotiate_auth.cc
+index d0f36477e..2fcad6ebb 100644
+--- a/src/peer_proxy_negotiate_auth.cc
++++ b/src/peer_proxy_negotiate_auth.cc
+@@ -17,6 +17,7 @@
+ #define GSSKRB_APPLE_DEPRECATED(x)
+ #endif
+ 
++#include "base/Assure.h"
+ #include "base64.h"
+ #include "compat/krb5.h"
+ #include "debug/Stream.h"
+@@ -549,6 +550,7 @@ char *peer_proxy_negotiate_auth(char *principal_name, char *proxy, int flags) {
+         static char b64buf[8192]; // XXX: 8KB only because base64_encode_bin() used to.
+         struct base64_encode_ctx ctx;
+         base64_encode_init(&ctx);
++        Assure(base64_encode_len(output_token.length) < sizeof(b64buf));
+         size_t blen = base64_encode_update(&ctx, b64buf, output_token.length, reinterpret_cast<const uint8_t*>(output_token.value));
+         blen += base64_encode_final(&ctx, b64buf+blen);
+         b64buf[blen] = '\0';
diff --git a/meta-networking/recipes-daemons/squid/squid_6.14.bb b/meta-networking/recipes-daemons/squid/squid_6.14.bb
index 0f07b38468..0b0eddb4aa 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.14.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.14.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://github.com/squid-cache/${BPN}/releases/download/SQUID_${PV_U}
            file://CVE-2026-50012-01.patch \
            file://CVE-2026-50012-02.patch \
            file://CVE-2026-61642.patch \
+           file://CVE-2026-104786.patch \
            "
 
 SRC_URI[sha256sum] = "9eafe06f58a199b918e79d33d8aa03afb9ae0c11d18974dca0b44c2669cab6dd"

