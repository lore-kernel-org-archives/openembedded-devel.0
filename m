Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3FBF01822
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 10:13:46 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66420.1772792022882646715
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 02:13:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jIDHxmHR;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso84173475e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 02:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772792021; x=1773396821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FJ1t00dY8NCUcFnlryt626ob7ViGRUE7YgeC+QewuzI=;
        b=jIDHxmHRSmmzaqoiWVmoYxydRPuroKgcitYWSzlMUPc/y1N/r+Ht9jubhpNHdhwGHI
         kPsklQ4qiRutYVdKppPEdrAhzpIUS2iz1s5QOzCA7VX65XriHoWTmT15A4ZCxvoixm76
         4FQmkR5A0OiddeTizjAy0x0RKjfp8nPLM7y86v+56WDASdiuLfUhHDBQx/RSA/lXndSH
         /WIOReA4l/LmEqShSaxwLZvV2/FRumDs4QuTtDKdJXqH3Z5v8qPVJuIk85Ghg/RPW0lu
         /Z+b9HZyP8LM4pV+egoOhl9sMfVT4WIxVJdGoZ9O/UZ1+uYiI6nafOOSobgzvUnZYexx
         MPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772792021; x=1773396821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJ1t00dY8NCUcFnlryt626ob7ViGRUE7YgeC+QewuzI=;
        b=MpnWW7kve/QN443GvZwGa5L7nCGo8KF22EjVIS4VPEP7KNG23IZdZJXgqp1jTz/5rs
         pjJBdttJ3Ck/RyA+430AyNLTrIeXoRkt5rxdGsKX3BMhN8O9ByLcyCFFoKfaWVdIMegy
         x06TLHQpxsxTMH/DwftcTUPYHGYUxcSIeTXfarsbwUXxyYo/9QryPgTbRPIaj81Xwk0F
         zZSQS25aQp9SInwSffZ3QXOSeb9lCvDnPZ3cRgKnj/uI0V0tixkEAC+tE3Y2rZMGMfh5
         4D78hkYF2Cf/OITDEor8ICDgj/E+fYsevcEOilP1pIwqoT51xOcDn9Gcp2K8f5jTn3NY
         rehg==
X-Gm-Message-State: AOJu0Yw9E+zlgQ/74hl7ul6iUXzULXWyjzv7mRFhiwjijIYgAKqo0AaD
	LO+filaCzG9tPPeJ05ohb4Pqyhmm4ErlZCHAulE9x7oW4G79jpPg0oLEx3wl0Luo
X-Gm-Gg: ATEYQzwAFHAU4UcgtVCYovEOXcbT+S1v3wGVE8s2Py1NZ5XgEz04tp2oDQNrQ9pibpT
	QzK0rY41xZzU5EAE2N6FQqFD1EgcBWAXbjSdg7ORzNQzyfLk1Df4F2xW8ybslEadlod+1NMKC0R
	62+n1n4XKdIyUfhK735AoWjM9BuffgHN5gff7GZYLJMR7oS1B/Wvdq94cxE57/Fu0UHOEG22LN0
	O/f2eWvMBoY32irSy2BuQXkql8fSvG2Yb9o1OCU/7I5TxFQIbYwGSeTQfm8GLcJbGSCUviI7qsO
	CVx1szVVLNSVOPsPJJ9liUwppsBEpaEVPxPdEBM/cL7mCsxKmgo+9eY7cn/9m/dvgXebgWQFyC9
	4KEHSfrEGGpM907DhKkWwDAPLJkgtFTP1ptP2wSAzs4nb3swsjo3tMtyD8XcjujsbiT8/Ivfb3+
	8beMr9ZMIThjeueduPeyDkb2awxA==
X-Received: by 2002:a05:600c:1d1e:b0:483:c35d:3659 with SMTP id 5b1f17b1804b1-48526957d5cmr23892975e9.18.1772792021076;
        Fri, 06 Mar 2026 02:13:41 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852449e73dsm23991035e9.3.2026.03.06.02.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:13:40 -0800 (PST)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] libwebsockets: backport fix for build with glibc-2.43
Date: Fri,  6 Mar 2026 11:13:34 +0100
Message-ID: <20260306101334.1408645-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 10:13:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124902

From: Martin Jansa <martin.jansa@gmail.com>

Fixes:
libwebsockets/4.5.2/sources/libwebsockets-4.5.2/lib/plat/unix/unix-caps.c:54:8: error: initializing 'char *' with an expression of type 'const char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
   54 |         char *colon = strchr(u_colon_g, ':'), u[33];
      |               ^       ~~~~~~~~~~~~~~~~~~~~~~
1 error generated.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...zation-discards-const-qualifier-from.patch | 111 ++++++++++++++++++
 .../libwebsockets/libwebsockets_4.5.2.bb      |   4 +-
 2 files changed, 114 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-c23-fix-initialization-discards-const-qualifier-from.patch

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-c23-fix-initialization-discards-const-qualifier-from.patch b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-c23-fix-initialization-discards-const-qualifier-from.patch
new file mode 100644
index 0000000000..a61131ec2e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-c23-fix-initialization-discards-const-qualifier-from.patch
@@ -0,0 +1,111 @@
+From 8445ebac12f5863282b3a5fa31d6a7a085ec2d97 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Mon, 26 Jan 2026 02:13:40 +0000
+Subject: [PATCH] c23: fix initialization discards const qualifier from pointer
+ target type
+
+Since glibc-2.43:
+
+For ISO C23, the functions bsearch, memchr, strchr, strpbrk, strrchr,
+strstr, wcschr, wcspbrk, wcsrchr, wcsstr and wmemchr that return
+pointers into their input arrays now have definitions as macros that
+return a pointer to a const-qualified type when the input argument is
+a pointer to a const-qualified type.
+
+https://lists.gnu.org/archive/html/info-gnu/2026-01/msg00005.html
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Backport [https://github.com/warmcat/libwebsockets/commit/54e67208976494a4a2235f2e0fc959d46bcb7452]
+---
+
+ lib/core-net/client/client.c   | 11 ++++++-----
+ lib/plat/unix/unix-caps.c      |  3 ++-
+ lib/roles/http/cookie.c        |  3 ++-
+ lib/roles/http/server/server.c |  3 ++-
+ 4 files changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/lib/core-net/client/client.c b/lib/core-net/client/client.c
+index e3bc6d590..2a3b69ec8 100644
+--- a/lib/core-net/client/client.c
++++ b/lib/core-net/client/client.c
+@@ -31,7 +31,7 @@ lws_set_proxy(struct lws_vhost *vhost, const char *proxy)
+ {
+ 	char authstring[96];
+ 	int brackets = 0;
+-	char *p;
++	const char *p;
+ 
+ 	if (!proxy)
+ 		return -1;
+@@ -84,15 +84,17 @@ lws_set_proxy(struct lws_vhost *vhost, const char *proxy)
+ 
+ #if defined(LWS_WITH_IPV6)
+ 	if (brackets) {
++		char *ncp;
++
+ 		/* original is IPv6 format "[::1]:443" */
+ 
+-		p = strchr(vhost->http.http_proxy_address, ']');
+-		if (!p) {
++		ncp = strchr(vhost->http.http_proxy_address, ']');
++		if (!ncp) {
+ 			lwsl_vhost_err(vhost, "malformed proxy '%s'", proxy);
+ 
+ 			return -1;
+ 		}
+-		*p++ = '\0';
++		*ncp++ = '\0';
+ 	}
+ #endif
+ 
+@@ -103,7 +105,6 @@ lws_set_proxy(struct lws_vhost *vhost, const char *proxy)
+ 		return -1;
+ 	}
+ 	if (p) {
+-		*p = '\0';
+ 		vhost->http.http_proxy_port = (unsigned int)atoi(p + 1);
+ 	}
+ 
+diff --git a/lib/plat/unix/unix-caps.c b/lib/plat/unix/unix-caps.c
+index 2f38854d5..0897a5e6d 100644
+--- a/lib/plat/unix/unix-caps.c
++++ b/lib/plat/unix/unix-caps.c
+@@ -51,7 +51,8 @@ _lws_plat_apply_caps(unsigned int mode, const cap_value_t *cv, int count)
+ int
+ lws_plat_user_colon_group_to_ids(const char *u_colon_g, uid_t *puid, gid_t *pgid)
+ {
+-	char *colon = strchr(u_colon_g, ':'), u[33];
++	const char *colon = strchr(u_colon_g, ':');
++	char u[33];
+ 	struct group *g;
+ 	struct passwd *p;
+ 	size_t ulen;
+diff --git a/lib/roles/http/cookie.c b/lib/roles/http/cookie.c
+index 44ad6eb9b..1347f6f38 100644
+--- a/lib/roles/http/cookie.c
++++ b/lib/roles/http/cookie.c
+@@ -286,7 +286,8 @@ lws_cookie_write_nsc(struct lws *wsi, struct lws_cookie *c)
+ 	const char *ads, *path;
+ 	struct lws_cache_ttl_lru *l1;
+ 	struct client_info_stash *stash;
+-	char *cookie_string = NULL, *dl;
++	char *cookie_string = NULL;
++	const char *dl;
+ 	 /* 6 tabs + 20 for max time_t + 2 * TRUE/FALSE + null */
+ 	size_t size = 6 + 20 + 10 + 1;
+ 	time_t expires = 0;
+diff --git a/lib/roles/http/server/server.c b/lib/roles/http/server/server.c
+index 69e13f075..d0e6f44ab 100644
+--- a/lib/roles/http/server/server.c
++++ b/lib/roles/http/server/server.c
+@@ -2378,7 +2378,8 @@ raw_transition:
+ 		if (wsi->a.context->reject_service_keywords) {
+ 			const struct lws_protocol_vhost_options *rej =
+ 					wsi->a.context->reject_service_keywords;
+-			char ua[384], *msg = NULL;
++			char ua[384];
++			const char *msg = NULL;
+ 
+ 			if (lws_hdr_copy(wsi, ua, sizeof(ua) - 1,
+ 					 WSI_TOKEN_HTTP_USER_AGENT) > 0) {
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.2.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.2.bb
index 35545aacee..983c2a4d87 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.2.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.2.bb
@@ -7,7 +7,9 @@ DEPENDS = "zlib"
 DEPENDS:append:class-native = " libcap-native"
 
 SRCREV = "85c6f7959fd40d8aaf7a50be3c9b75f08389a01c"
-SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.5-stable;tag=v${PV}"
+SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.5-stable;tag=v${PV} \
+    file://0001-c23-fix-initialization-discards-const-qualifier-from.patch \
+"
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"

