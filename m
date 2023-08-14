Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF75EC001B0
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 06:33:01 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.101927.1691994774769041261
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Aug 2023 23:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fAdV86u8;
 spf=pass (domain: mvista.com, ip: 209.85.210.170, mailfrom: asharma@mvista.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-686efa1804eso2593013b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Aug 2023 23:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1691994774; x=1692599574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YuU2gcphYVbLW9mGgKaS8PDhqQzpRXM8knYb2iOWHJk=;
        b=fAdV86u8l3uc4gGTvRRW0BR77GWGYLVabIZg7F5QKZffv19uGASLN1nHEl09+AWb7G
         py61LmFZi/bTOKowF6Q1C5D4CQhrniaNXOUb8G4GcM2LHSy7MU30+PeR5U3xxg5MvkqO
         nXmklLWqaXaEwCoRB194KDBYJkuYZ6TcOel6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691994774; x=1692599574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YuU2gcphYVbLW9mGgKaS8PDhqQzpRXM8knYb2iOWHJk=;
        b=Gwcmhgy8pELQVBpn42soLMldNtYnfhd871SIQSAE5XvJmsSuOQuWUGLXzWdgYsxs70
         eSu4i3D4uRvoSELiOlHKZA2yfwUesahzUVlcCC4oAx9b2umZvmzXVbIv7Y/1+uuDlMQ6
         FVPN3gODObMSSgBr0jpTIhQk6ay55yNHsp7SpEdX0NcFBbH8k/3rj+vfUFdJuXWaGPnp
         8HVbIJoJg6F/HL4bxIZh6yT9nQc7j+I3pzKmSG3GlYAxsjys/LMAQJsagtRw3br2deNx
         PTX2DNClcX1amOv3up3J18U82KWBpTklM0WBQzKNp+HiAEG4UcGlYf+fi5GjGBVhHi6L
         hSVQ==
X-Gm-Message-State: AOJu0YwUpG5dXlpqOre57XjxS9kuOZSw+674LS5URg3B3g37znYizwfm
	8XqvPPv1WFcDdaLsK0Jg2Xg6UV6LR/1/NiIk8I8=
X-Google-Smtp-Source: AGHT+IFBqz70LQf9yl5WR4gpQobVoHFhCXPz/OWrnrbT1j6LSPoRFTiB9uwiA1ioPwHXO9jyG8b3fA==
X-Received: by 2002:a05:6a20:baa8:b0:12f:dce2:b385 with SMTP id fb40-20020a056a20baa800b0012fdce2b385mr7321664pzb.10.1691994773846;
        Sun, 13 Aug 2023 23:32:53 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.80.232])
        by smtp.gmail.com with ESMTPSA id t5-20020a170902e84500b001b881a8251bsm1204539plg.106.2023.08.13.23.32.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Aug 2023 23:32:53 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Mon, 14 Aug 2023 12:00:38 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [oe][meta-oe][dunfell][PATCH] php: Backport fix CVE-2023-3247
Date: Mon, 14 Aug 2023 12:00:36 +0530
Message-Id: <20230814063036.15487-1-asharma@mvista.com>
X-Mailer: git-send-email 2.24.4
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Aug 2023 06:33:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104347

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../php/php/CVE-2023-3247-1.patch             | 87 +++++++++++++++++++
 .../php/php/CVE-2023-3247-2.patch             | 29 +++++++
 meta-oe/recipes-devtools/php/php_7.4.33.bb    |  2 +
 3 files changed, 118 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2023-3247-1.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2023-3247-2.patch

diff --git a/meta-oe/recipes-devtools/php/php/CVE-2023-3247-1.patch b/meta-oe/recipes-devtools/php/php/CVE-2023-3247-1.patch
new file mode 100644
index 0000000000..db9e41796c
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2023-3247-1.patch
@@ -0,0 +1,87 @@
+From ac4254ad764c70cb1f05c9270d8d12689fc3aeb6 Mon Sep 17 00:00:00 2001
+From: Niels Dossche <7771979+nielsdos@users.noreply.github.com>
+Date: Sun, 16 Apr 2023 15:05:03 +0200
+Subject: [PATCH] Fix missing randomness check and insufficient random bytes
+ for SOAP HTTP Digest
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If php_random_bytes_throw fails, the nonce will be uninitialized, but
+still sent to the server. The client nonce is intended to protect
+against a malicious server. See section 5.10 and 5.12 of RFC 7616 [1],
+and bullet point 2 below.
+
+Tim pointed out that even though it's the MD5 of the nonce that gets sent,
+enumerating 31 bits is trivial. So we have still a stack information leak
+of 31 bits.
+
+Furthermore, Tim found the following issues:
+* The small size of cnonce might cause the server to erroneously reject
+  a request due to a repeated (cnonce, nc) pair. As per the birthday
+  problem 31 bits of randomness will return a duplication with 50%
+  chance after less than 55000 requests and nc always starts counting at 1.
+* The cnonce is intended to protect the client and password against a
+  malicious server that returns a constant server nonce where the server
+  precomputed a rainbow table between passwords and correct client response.
+  As storage is fairly cheap, a server could precompute the client responses
+  for (a subset of) client nonces and still have a chance of reversing the
+  client response with the same probability as the cnonce duplication.
+
+  Precomputing the rainbow table for all 2^31 cnonces increases the rainbow
+  table size by factor 2 billion, which is infeasible. But precomputing it
+  for 2^14 cnonces only increases the table size by factor 16k and the server
+  would still have a 10% chance of successfully reversing a password with a
+  single client request.
+
+This patch fixes the issues by increasing the nonce size, and checking
+the return value of php_random_bytes_throw(). In the process we also get
+rid of the MD5 hashing of the nonce.
+
+[1] RFC 7616: https://www.rfc-editor.org/rfc/rfc7616
+
+Co-authored-by: Tim Düsterhus <timwolla@php.net>
+
+Upstream-Status: Backport [https://github.com/php/php-src/commit/ac4254ad764c70cb1f05c9270d8d12689fc3aeb6]
+CVE: CVE-2023-3247
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ ext/soap/php_http.c | 21 +++++++++++++--------
+ 1 file changed, 13 insertions(+), 8 deletions(-)
+
+diff --git a/ext/soap/php_http.c b/ext/soap/php_http.c
+index 1da286ad875f..e796dba9619a 100644
+--- a/ext/soap/php_http.c
++++ b/ext/soap/php_http.c
+@@ -664,18 +664,23 @@ int make_http_soap_request(zval        *this_ptr,
+ 			if ((digest = zend_hash_str_find(Z_OBJPROP_P(this_ptr), "_digest", sizeof("_digest")-1)) != NULL) {
+ 				if (Z_TYPE_P(digest) == IS_ARRAY) {
+ 					char          HA1[33], HA2[33], response[33], cnonce[33], nc[9];
+-					zend_long     nonce;
++					unsigned char nonce[16];
+ 					PHP_MD5_CTX   md5ctx;
+ 					unsigned char hash[16];
+ 
+-					php_random_bytes_throw(&nonce, sizeof(nonce));
+-					nonce &= 0x7fffffff;
++					if (UNEXPECTED(php_random_bytes_throw(&nonce, sizeof(nonce)) != SUCCESS)) {
++						ZEND_ASSERT(EG(exception));
++						php_stream_close(stream);
++						convert_to_null(Z_CLIENT_HTTPURL_P(this_ptr));
++						convert_to_null(Z_CLIENT_HTTPSOCKET_P(this_ptr));
++						convert_to_null(Z_CLIENT_USE_PROXY_P(this_ptr));
++						smart_str_free(&soap_headers_z);
++						smart_str_free(&soap_headers);
++						return FALSE;
++					}
+ 
+-					PHP_MD5Init(&md5ctx);
+-					snprintf(cnonce, sizeof(cnonce), ZEND_LONG_FMT, nonce);
+-					PHP_MD5Update(&md5ctx, (unsigned char*)cnonce, strlen(cnonce));
+-					PHP_MD5Final(hash, &md5ctx);
+-					make_digest(cnonce, hash);
++					php_hash_bin2hex(cnonce, nonce, sizeof(nonce));
++					cnonce[32] = 0;
+ 
+ 					if ((tmp = zend_hash_str_find(Z_ARRVAL_P(digest), "nc", sizeof("nc")-1)) != NULL &&
+ 					    Z_TYPE_P(tmp) == IS_LONG) {
diff --git a/meta-oe/recipes-devtools/php/php/CVE-2023-3247-2.patch b/meta-oe/recipes-devtools/php/php/CVE-2023-3247-2.patch
new file mode 100644
index 0000000000..80c1961aa1
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2023-3247-2.patch
@@ -0,0 +1,29 @@
+From 32c7c433ac1983c4497349051681a4f361d3d33e Mon Sep 17 00:00:00 2001
+From: Pierrick Charron <pierrick@php.net>
+Date: Tue, 6 Jun 2023 18:49:32 -0400
+Subject: [PATCH] Fix wrong backporting of previous soap patch
+
+Upstream-Status: Backport [https://github.com/php/php-src/commit/32c7c433ac1983c4497349051681a4f361d3d33e]
+CVE: CVE-2023-3247
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ ext/soap/php_http.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/ext/soap/php_http.c b/ext/soap/php_http.c
+index 77ed21d4f0f4..37250a6bdcd1 100644
+--- a/ext/soap/php_http.c
++++ b/ext/soap/php_http.c
+@@ -672,9 +672,9 @@ int make_http_soap_request(zval        *this_ptr,
+ 					if (UNEXPECTED(php_random_bytes_throw(&nonce, sizeof(nonce)) != SUCCESS)) {
+ 						ZEND_ASSERT(EG(exception));
+ 						php_stream_close(stream);
+-						convert_to_null(Z_CLIENT_HTTPURL_P(this_ptr));
+-						convert_to_null(Z_CLIENT_HTTPSOCKET_P(this_ptr));
+-						convert_to_null(Z_CLIENT_USE_PROXY_P(this_ptr));
++						zend_hash_str_del(Z_OBJPROP_P(this_ptr), "httpurl", sizeof("httpurl")-1);
++						zend_hash_str_del(Z_OBJPROP_P(this_ptr), "httpsocket", sizeof("httpsocket")-1);
++						zend_hash_str_del(Z_OBJPROP_P(this_ptr), "_use_proxy", sizeof("_use_proxy")-1);
+ 						smart_str_free(&soap_headers_z);
+ 						smart_str_free(&soap_headers);
+ 						return FALSE;
diff --git a/meta-oe/recipes-devtools/php/php_7.4.33.bb b/meta-oe/recipes-devtools/php/php_7.4.33.bb
index caaaa23426..cde482079e 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.33.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.33.bb
@@ -30,6 +30,8 @@ SRC_URI_append_class-target = " \
             file://phar-makefile.patch \
             file://0001-opcache-config.m4-enable-opcache.patch \
             file://xfail_two_bug_tests.patch \
+            file://CVE-2023-3247-1.patch \
+            file://CVE-2023-3247-2.patch \
           "
 
 S = "${WORKDIR}/php-${PV}"
-- 
2.24.4


