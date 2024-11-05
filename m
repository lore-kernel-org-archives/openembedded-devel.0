Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E6BD2B950
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:00 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.19605.1730817411902630167
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZP2OnOjD;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e38fc62b9fso47421677b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817411; x=1731422211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfuQebN4l4E5iT78q+VobbLARjF1wAXbVzzRYBxh8fM=;
        b=ZP2OnOjDZ9xMpygJEmP5T82p40sjSecteIt09C8MboZU8j1hov/VOIGzldKCQwSVxt
         seL+YxuNlOvff0U+wzK4y1MBANE4nl85qpNCuhI6gaZr0uAMNl0VUsMv+65wX0edyN2B
         OSMVMUkcJPq7Dy43ghMldjQvET+wKzpuzTjRvmEogDq5eKCPETwZ1h5tzsnlADDBm6bP
         9XI6o5ZEbtVdfQwgEqUrS/ur5l9u8jLbP8utmPkjnLKatwLmw3DbaBpPaWoUMJCh0Y5B
         6z/gG+9MFZH9L0WloL4hGz/JsHSQULH18NL24vxQVOCFKa0qqTQH50wdcoOBLqKCZraG
         DSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817411; x=1731422211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfuQebN4l4E5iT78q+VobbLARjF1wAXbVzzRYBxh8fM=;
        b=aOur3BuUr5ow8G1O1pj5zPGRUfA6lcjwIhJZ9x13O209U3vAwam7XMlRUrn8/pffWV
         RWty9Hiqkrm6RmYGW0onOjz5xHjDX6TQANkNXf0vppeU+ABtxUKtbM87p/h3vnV/3evX
         +FMkjQloGZn78gp8yaYGDOTjufLHJPRED4419k26WDQ2ToOdM39EiiHYgQwYNew2GWRQ
         gSn9YGnB/SiR8eMgPT0+jUAAMMwxuvLG0TQkZHp6skAsmGQOGqd72FNFAxPeKsHPhasE
         W6OkjaCCp1sr5u4UFFDvGajZANMqpUXELIcN/yrnjl+tMpPSDSysf1wtYHRbu1Pgxl9Y
         xuXA==
X-Gm-Message-State: AOJu0YyWOtNhsl44B6pazCKB3NGloEooSQceDbYO0biBlRZvPYHJL84g
	1hHuzDsLf9l+g6JJVP0pvOoCmmKrUhQ33cAE/nfMuBkIgrVltOvtcALhQQ==
X-Google-Smtp-Source: AGHT+IHW0lidiYHiJ2APylJ5i+P86ZZ40SUiuNUzZ9RvnbvAma/FKC45gAJoRVfsBdKZNe6DPlsc+Q==
X-Received: by 2002:a05:690c:6001:b0:6e2:7dd:af61 with SMTP id 00721157ae682-6ea64acc9d2mr171179327b3.17.1730817410921;
        Tue, 05 Nov 2024 06:36:50 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 26/90] stunnel: upgrade 5.72 -> 5.73
Date: Tue,  5 Nov 2024 09:34:51 -0500
Message-ID: <20241105143638.2301245-27-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113444

From: Wang Mingyu <wangmy@fujitsu.com>

fix-openssl-no-des.patch
refreshed for 5.73

Changelog:
===========
* Security bugfixes
  - OpenSSL DLLs updated to version 3.3.2.
  - OpenSSL FIPS Provider updated to version 3.0.9.
* Bugfixes
  - Fixed a memory leak while reloading stunnel.conf
    sections with "client=yes" and "delay=no".
  - Fixed TIMEOUTocsp with values greater than 4.
  - Fix the IPv6 test on a non-IPv6 machine.
* Features
  - HELO replaced with EHLO in the post-STARTTLS SMTP
    protocol negotiation (thx to Peter Pentchev).
  - OCSP stapling fetches moved away from server threads.
  - Improved client-side session resumption.
  - Added support for the mimalloc allocator.
  - Check for protocolHost moved to configuration file
    processing for the client-side CONNECT protocol.
  - Clarified some confusing OpenSSL's certificate
    verification error messages.
  - stunnel.nsi updated for Debian 13 and Fedora.
  - Improved NetBSD compatibility.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../stunnel/stunnel/fix-openssl-no-des.patch  | 19 ++++++++-----------
 .../{stunnel_5.72.bb => stunnel_5.73.bb}      |  2 +-
 2 files changed, 9 insertions(+), 12 deletions(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.72.bb => stunnel_5.73.bb} (93%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
index 82d3551019..8c4ca55fbb 100644
--- a/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
+++ b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
@@ -1,4 +1,4 @@
-From 7ff4eba20b5c4fc7365e5ee0dfb775ed29bdd5ce Mon Sep 17 00:00:00 2001
+From c815368a3e41dd3f639eb8fd82d21bc0bab55d1e Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 1 Nov 2017 09:23:41 -0400
 Subject: [PATCH] stunnel: fix compile error when openssl disable des support
@@ -17,10 +17,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  2 files changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/src/common.h b/src/common.h
-index 2b4869f..180d31a 100644
+index f112cf9..8d4be01 100644
 --- a/src/common.h
 +++ b/src/common.h
-@@ -492,7 +492,9 @@ extern char *sys_errlist[];
+@@ -496,7 +496,9 @@ extern char *sys_errlist[];
  #ifndef OPENSSL_NO_MD4
  #include <openssl/md4.h>
  #endif /* !defined(OPENSSL_NO_MD4) */
@@ -31,19 +31,19 @@ index 2b4869f..180d31a 100644
  #include <openssl/dh.h>
  #if OPENSSL_VERSION_NUMBER<0x10100000L
 diff --git a/src/protocol.c b/src/protocol.c
-index cfe6d3b..3936aea 100644
+index c8c65ea..b071b06 100644
 --- a/src/protocol.c
 +++ b/src/protocol.c
-@@ -81,7 +81,7 @@ NOEXPORT void ldap_client_middle(CLI *);
- 
+@@ -82,7 +82,7 @@ NOEXPORT void ldap_client_middle(CLI *);
  NOEXPORT void connect_server_early(CLI *);
+ NOEXPORT const char *connect_client_init(SERVICE_OPTIONS *);
  NOEXPORT void connect_client_middle(CLI *);
 -#ifndef OPENSSL_NO_MD4
 +#if !defined(OPENSSL_NO_MD4) && !defined(OPENSSL_NO_DES)
  NOEXPORT void ntlm(CLI *);
  NOEXPORT char *ntlm1(void);
  NOEXPORT char *ntlm3(char *, char *, char *, char *);
-@@ -1331,7 +1331,7 @@ NOEXPORT void connect_client_middle(CLI *c) {
+@@ -1334,7 +1334,7 @@ NOEXPORT void connect_client_middle(CLI *c) {
      fd_printf(c, c->remote_fd.fd, "Host: %s", c->opt->protocol_host);
      if(c->opt->protocol_username && c->opt->protocol_password) {
          if(!strcasecmp(c->opt->protocol_authentication, "ntlm")) {
@@ -52,7 +52,7 @@ index cfe6d3b..3936aea 100644
              ntlm(c);
  #else
              s_log(LOG_ERR, "NTLM authentication is not available");
-@@ -1374,7 +1374,7 @@ NOEXPORT void connect_client_middle(CLI *c) {
+@@ -1377,7 +1377,7 @@ NOEXPORT void connect_client_middle(CLI *c) {
      str_free(line);
  }
  
@@ -61,6 +61,3 @@ index cfe6d3b..3936aea 100644
  
  /*
   * NTLM code is based on the following documentation:
--- 
-2.34.1
-
diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.72.bb b/meta-networking/recipes-support/stunnel/stunnel_5.73.bb
similarity index 93%
rename from meta-networking/recipes-support/stunnel/stunnel_5.72.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.73.bb
index 6d21027a16..e13b7871ca 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.72.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.73.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://stunnel.org/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[sha256sum] = "3d532941281ae353319735144e4adb9ae489a10b7e309c58a48157f08f42e949"
+SRC_URI[sha256sum] = "bc917c3bcd943a4d632360c067977a31e85e385f5f4845f69749bce88183cb38"
 
 inherit autotools bash-completion pkgconfig
 
-- 
2.43.0


