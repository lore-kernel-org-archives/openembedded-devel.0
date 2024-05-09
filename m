Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884DCC10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 06:08:08 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.3795.1715234884782665541
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 May 2024 23:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WZbQebKN;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: zboszor@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e3e18c24c1so4914331fa.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 May 2024 23:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715234883; x=1715839683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f2uCF30kv6s82ZNWJzOApl3GFZ6133p2ROLDzZMiMBI=;
        b=WZbQebKNEfYd4Ec3j8sCa1kOSwuRj8I7qcon8FnjProBwnSCdymkccvjBv0ZqFXhl9
         O3Cq1p4fQTNrmVOzilsueqprxzqmLPvwU6lbsEx1YPPQOqJT1FIwjtAJpG8bIEztcfmL
         sKpbwthgyEnUdyffN6aVKsDl/8L/7WpmLjy60x5TXbVB9QhdcuTURPWTeOyM4nL6jias
         Z2YVdK3De4HW18VkOxKER09kzMNXIAhn998IXCk5pijh/SHLZ7J+RNaGd8zDjzkBTmjW
         iv7rl4EZkCzjewZErWVm6ePn/oJCezXUJ9RBFjrNDC9L5Mh3LBUil6scq+tXxwM4W3r5
         wVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715234883; x=1715839683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2uCF30kv6s82ZNWJzOApl3GFZ6133p2ROLDzZMiMBI=;
        b=RHoPIDViHAmU2GaUjy4J0cM03B+EbgeuERe9h115EdNakADGRyRDoT580RNaAWleTC
         k/wMbAcb9Db9mkc/9UB7LdsusWeSgJMvMpgnJIV5GDi0WmwCQ9NCwknPaRzA0EzL9Dzl
         l+nN/athPm+hGFvo3QJyGJvmBrh6B144NC98AwZhz+L/sRDN6D2JmDbiGqXM8Acfvcp6
         Cr5a4YGuSON7Y3/BpUhEYe9gmmnavB26UNWYVH9kUaxoVwT4xc+PXqWmcc5+OVHL6rFz
         yYskhbkugzajtanl0feodJGB/zwQo2Hh7wMt/4PFqq0rJ5vFQsA+8C3psGJHGzbvK5xD
         CA2A==
X-Gm-Message-State: AOJu0YztC+uohXPqvzs8bEWnZja5W2Tv18vNAysY+ub0ANZzQqooFyJw
	NbDZwpAY1bL7SLTyIFk0E9ERSbJDG6QeWDCT3Fxa6SzXRnZEbsR5a4YqiJ2q
X-Google-Smtp-Source: AGHT+IEpU9MHviJZD2zx3sd44ejOBAOG+54aSt104s9R4QmQ71G4ewAQGK/WKYtQx9cJ/GQ3J4p0iQ==
X-Received: by 2002:a05:651c:10cc:b0:2e2:176b:9e98 with SMTP id 38308e7fff4ca-2e4479a316emr27003431fa.45.1715234882291;
        Wed, 08 May 2024 23:08:02 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41facbd295fsm28922845e9.36.2024.05.08.23.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 23:08:02 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH] uw-imap: Add a patch to support newer than TLSv1.0
Date: Thu,  9 May 2024 08:07:55 +0200
Message-ID: <20240509060755.3072961-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 06:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110281

The patch 0001-Support-OpenSSL-1.1.patch enabled building
uw-imap against OpenSSL 1.1.0 or later.

However, TLSv1_client_method() and TLSv1_server_method()
restricts uw-imap to TLSv1.0.

These APIs, along with explicitly versioned APIs like
TLSv1_1_*_method() and TLSv1_2_*_method() are deprecated
in OpenSSL 1.1.0 or later. The replacements are unversioned
API functions: TLS_client_method() and TLS_server_method()
which support TLS version autonegotiation.

This allows the PHP IMAP extension to work with IMAP servers
that enforce TLSv1.2 or higher.

Fixes: https://bugs.php.net/bug.php?id=76928
Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../uw-imap/uw-imap/uw-imap-newer-tls.patch   | 29 +++++++++++++++++++
 .../recipes-devtools/uw-imap/uw-imap_2007f.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-newer-tls.patch

diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-newer-tls.patch b/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-newer-tls.patch
new file mode 100644
index 000000000..958abc90f
--- /dev/null
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-newer-tls.patch
@@ -0,0 +1,29 @@
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+Upstream-Status: Pending
+
+--- imap-2007f/src/osdep/unix/ssl_unix.c.old	2024-05-08 09:41:06.183450584 +0200
++++ imap-2007f/src/osdep/unix/ssl_unix.c	2024-05-08 09:43:38.512931933 +0200
+@@ -220,7 +220,11 @@
+   if (ssl_last_error) fs_give ((void **) &ssl_last_error);
+   ssl_last_host = host;
+   if (!(stream->context = SSL_CTX_new ((flags & NET_TLSCLIENT) ?
++#if OPENSSL_VERSION_NUMBER >= 0x10100000
++				       TLS_client_method () :
++#else
+ 				       TLSv1_client_method () :
++#endif
+ 				       SSLv23_client_method ())))
+     return "SSL context failed";
+   SSL_CTX_set_options (stream->context,0);
+@@ -703,7 +707,11 @@
+   }
+ 				/* create context */
+   if (!(stream->context = SSL_CTX_new (start_tls ?
++#if OPENSSL_VERSION_NUMBER >= 0x10100000
++				       TLS_server_method () :
++#else
+ 				       TLSv1_server_method () :
++#endif
+ 				       SSLv23_server_method ())))
+     syslog (LOG_ALERT,"Unable to create SSL context, host=%.80s",
+ 	    tcp_clienthost ());
diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
index dcb59f4ea..17faa3aa6 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://fossies.org/linux/misc/old/imap-${PV}.tar.gz \
            file://0001-Do-not-build-mtest.patch \
            file://0002-tmail-Include-ctype.h-for-isdigit.patch \
            file://0001-Fix-Wincompatible-function-pointer-types.patch \
+           file://uw-imap-newer-tls.patch \
            "
 
 SRC_URI[md5sum] = "2126fd125ea26b73b20f01fcd5940369"
-- 
2.45.0


