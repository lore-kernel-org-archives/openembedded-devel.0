Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B485DC19F2C
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 15:03:48 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.250.1659107025580217477
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 08:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CQ7pWE6Y;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id s206so4234124pgs.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 08:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XCHoJFOctcKZJTRGaztCJU6SLcuIvse6L4KJDprHZu0=;
        b=CQ7pWE6YFi0WSNuJD/WOv7IoV6MR7Qhk0BpJLi1bbZ+QQGLJhwc6egfrSxdHKbuDjB
         4eCLRvXaJ1cS+xZ7tn1TPaa2evB0PbYCL3+42/oq0KNwkPPQAeZA29DrMbMBohStC0TZ
         b1H6ybaQs5IZdFqoErmUZ2g/mFQ/4QKwwDC8/DfYNZ7McoyjGHlmfNWhHYaHWBWw1TL2
         4naKE0Ect8jsc/zq1RhkAJ7kWJ2K5YsL9Tjpq44ca6XGNMMUmAjmalKIl1sqE0wePkbs
         Gp7RL4cCQk5rl6RGAX1fdF+8kRkr6pU4iUnwwCqYBCdwEpm5EsvEaOeballHirbPwi3l
         ReMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XCHoJFOctcKZJTRGaztCJU6SLcuIvse6L4KJDprHZu0=;
        b=bl4MExSCLEm1kQWZbRgPPCGd0CaGua9ALAHbiqFRVqrtunWhFrlrcwaE6y35fC00rF
         4GUBn1iaKDcrHu/NVU1zxk1lU8qsqef4TmJQa6xYrzSgNbIeBAZNzxsDJdLUb31QGwV7
         DQPRYi8Py8vmIla4vJrByyZt7xd+GNBTBW/1uBxpRBoo3TsVU949gXE4RylvERVzFDEO
         FOUd0TR9PD9mieKFcfAVPzFE5ORqNAz5gbjv4wXw8Gd7btaAwlo6hx7D1ihqvu4kjRip
         2QS1S9Nz0NMJJZrk9bJlPQxju5/jm8sj0ajvi+VGM5MNsmj8dc/rbvmjYxMjN17PjIZf
         UeLg==
X-Gm-Message-State: AJIora8JWXdB9DLWX2aVME1JxkC4I3kR1TVq11Bzap9UGHQtUf9nWC4P
	9KVGGmxjsojGi2Mib9+evIsJy+N2mos=
X-Google-Smtp-Source: 
 AA6agR7kyCPXrKC6XKPr0dSt4ujDbNhCTkASZYcU8C1qTxNI8kvjrXG0CehEn+mk4GhXqO+fj8SqPA==
X-Received: by 2002:a05:6a00:114f:b0:528:2c7a:634c with SMTP id
 b15-20020a056a00114f00b005282c7a634cmr4214677pfm.41.1659107024312;
        Fri, 29 Jul 2022 08:03:44 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 x10-20020aa79aca000000b0051be16492basm2957080pfp.195.2022.07.29.08.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 08:03:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: wangmy <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 2/5] stunnel: upgrade 5.64 -> 5.65
Date: Fri, 29 Jul 2022 08:01:37 -0700
Message-Id: <20220729150140.104164-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220729150140.104164-1-akuster808@gmail.com>
References: <20220729150140.104164-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Jul 2022 15:03:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98042

From: wangmy <wangmy@fujitsu.com>

fix-openssl-no-des.patch
refreshed for version 5.65

Changelog:
==========
    Security bugfixes
        OpenSSL DLLs updated to version 3.0.5.
    Bugfixes
        Fixed handling globally enabled FIPS.
        Fixed the default openssl.cnf path in stunnel.exe.
        Fixed a number of MSVC warnings.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 72f84335cb372dbf00d2d07429a595fced0c4f4f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../stunnel/stunnel/fix-openssl-no-des.patch  | 24 +++++++++++++------
 .../{stunnel_5.64.bb => stunnel_5.65.bb}      |  2 +-
 2 files changed, 18 insertions(+), 8 deletions(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.64.bb => stunnel_5.65.bb} (93%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
index aeb0bece97..0840cbbd8b 100644
--- a/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
+++ b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
@@ -1,3 +1,8 @@
+From 7ff4eba20b5c4fc7365e5ee0dfb775ed29bdd5ce Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Wed, 1 Nov 2017 09:23:41 -0400
+Subject: [PATCH] stunnel: fix compile error when openssl disable des support
+
 Upstream-Status: Pending
 
 When openssl disable des support with configure option 'no-des', it doesn't
@@ -6,12 +11,17 @@ failed. Fix it by checking macro OPENSSL_NO_DES to use openssl des related
 library conditionaly.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
 ---
+ src/common.h   | 2 ++
+ src/protocol.c | 6 +++---
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
 diff --git a/src/common.h b/src/common.h
-index f7d38b0..bf485af 100644
+index bc37eb5..03ee3e5 100644
 --- a/src/common.h
 +++ b/src/common.h
-@@ -478,7 +478,9 @@ extern char *sys_errlist[];
+@@ -486,7 +486,9 @@ extern char *sys_errlist[];
  #ifndef OPENSSL_NO_MD4
  #include <openssl/md4.h>
  #endif /* !defined(OPENSSL_NO_MD4) */
@@ -22,19 +32,19 @@ index f7d38b0..bf485af 100644
  #include <openssl/dh.h>
  #if OPENSSL_VERSION_NUMBER<0x10100000L
 diff --git a/src/protocol.c b/src/protocol.c
-index 587df09..8198eb6 100644
+index 804f115..d9b2b50 100644
 --- a/src/protocol.c
 +++ b/src/protocol.c
-@@ -67,7 +67,7 @@ NOEXPORT char *imap_server(CLI *, SERVICE_OPTIONS *, const PHASE);
+@@ -66,7 +66,7 @@ NOEXPORT char *nntp_client(CLI *, SERVICE_OPTIONS *, const PHASE);
  NOEXPORT char *ldap_client(CLI *, SERVICE_OPTIONS *, const PHASE);
  NOEXPORT char *connect_server(CLI *, SERVICE_OPTIONS *, const PHASE);
  NOEXPORT char *connect_client(CLI *, SERVICE_OPTIONS *, const PHASE);
 -#ifndef OPENSSL_NO_MD4
 +#if !defined(OPENSSL_NO_MD4) && !defined(OPENSSL_NO_DES)
  NOEXPORT void ntlm(CLI *, SERVICE_OPTIONS *);
- NOEXPORT char *ntlm1();
+ NOEXPORT char *ntlm1(void);
  NOEXPORT char *ntlm3(char *, char *, char *, char *);
-@@ -1332,7 +1332,7 @@ NOEXPORT char *connect_client(CLI *c, SERVICE_OPTIONS *opt, const PHASE phase) {
+@@ -1351,7 +1351,7 @@ NOEXPORT char *connect_client(CLI *c, SERVICE_OPTIONS *opt, const PHASE phase) {
      fd_printf(c, c->remote_fd.fd, "Host: %s", opt->protocol_host);
      if(opt->protocol_username && opt->protocol_password) {
          if(!strcasecmp(opt->protocol_authentication, "ntlm")) {
@@ -43,7 +53,7 @@ index 587df09..8198eb6 100644
              ntlm(c, opt);
  #else
              s_log(LOG_ERR, "NTLM authentication is not available");
-@@ -1376,7 +1376,7 @@ NOEXPORT char *connect_client(CLI *c, SERVICE_OPTIONS *opt, const PHASE phase) {
+@@ -1395,7 +1395,7 @@ NOEXPORT char *connect_client(CLI *c, SERVICE_OPTIONS *opt, const PHASE phase) {
      return NULL;
  }
  
diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.64.bb b/meta-networking/recipes-support/stunnel/stunnel_5.65.bb
similarity index 93%
rename from meta-networking/recipes-support/stunnel/stunnel_5.64.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.65.bb
index 13ecd5c5bf..ab7ff43223 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.64.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.65.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://stunnel.org/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[sha256sum] = "eebe53ed116ba43b2e786762b0c2b91511e7b74857ad4765824e7199e6faf883"
+SRC_URI[sha256sum] = "60c500063bd1feff2877f5726e38278c086f96c178f03f09d264a2012d6bf7fc"
 
 inherit autotools bash-completion pkgconfig
 
-- 
2.25.1


