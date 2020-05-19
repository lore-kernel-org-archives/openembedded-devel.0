Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web10.12999.1589899426449040922
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 07:43:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P+GWJfaW;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id z26so6515675pfk.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2020 07:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=anwZgMIA+d+HUqx4pMRQmH0Op0HOnc3AXuoAIzOG0gM=;
        b=P+GWJfaWRSEWw+XHz1/0WyFDKXOIRO6LNj99lxssfiw3BhazaaxLi3Tosf4dm23GCi
         5ebA7AROVxZaqy3uTxYDHgx++ke60O2fgjfN7UBntqnAFGmC8Rs37tN4IJwixzgaGg0l
         nihZXlx847izV/YwiQJpIVKBjT2sBkzrOGbkrvRoMT6nhx6mdwZU2TXfQhq+WDUQJK/q
         hxkDtrQIUJN85/ppaF+WTEBx9o1jbHJmWfHoafzH36iszf4HeQ87iK1qwB84uZYTMJg5
         CdekmXQJWEtTlY0OoFVDTC2nigx04OrzNoDDLJMX4PzjgAiV3uzVY3nB1Q67Byxh/q7+
         oguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=anwZgMIA+d+HUqx4pMRQmH0Op0HOnc3AXuoAIzOG0gM=;
        b=YpbMq02EkTUfu6Yd6qGzVpw/27gXu8Zt2G5SuSl0eWV/zq6ZHgJCYelTACCZFSmgT5
         4+4ly46fAI+RBnILEFIa9j7g0rfPEuJMawTDuCZYZpAt+5GzK94VCIY1lZ6dEiNMWFKq
         OgpKVmmZRb+uTTC3/8D3D5F8xWmRnh8DR7FtLMr3ijf9UzEak69w4KYoEslMhhg+19Wn
         xvRVowQ3Q013f73h5MMekrRS+wAG56hLU0u1PhB7bajclSLhMgah0yAffZzKXLVF+fqM
         kpx5CHyFty7m2Zc0GlL2sqRRp8beww8jw9iBFhtMhIuzOodR0T6MYkETdOKJ5KybO8CQ
         RpjQ==
X-Gm-Message-State: AOAM532oz9x5wc7iPhk5ZcFUx7ZQ5+0gXlDmppxJE2WLbLxr+rq5ptwO
	vZSX8bJVilabU1sPaaH+HIUl7WcU
X-Google-Smtp-Source: ABdhPJw+TEIoG29hr9mjBYUD4OVlxl80LOLcS6xYWuvvzO5G2SoFTRWpg+RKn8LvOLaFRUkyosaI6g==
X-Received: by 2002:a63:c80e:: with SMTP id z14mr19666874pgg.170.1589899425783;
        Tue, 19 May 2020 07:43:45 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id h3sm2382099pjk.10.2020.05.19.07.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:43:45 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][PATCH 10/18] cpprest: Disable one more test requiring internet connection
Date: Tue, 19 May 2020 07:43:24 -0700
Message-Id: <20200519144332.12822-10-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519144332.12822-1-akuster808@gmail.com>
References: <20200519144332.12822-1-akuster808@gmail.com>

From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 014c4d224aa186f69cf722a3874231474cf3e4e1)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../cpprest/disable-outside-tests.patch       | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch b/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
index e108e0279d..5f1f8a9f9c 100644
--- a/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
+++ b/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
@@ -105,3 +105,23 @@ Index: cpprest/Release/tests/functional/http/client/connections_and_errors.cpp
  
  } // SUITE(connections_and_errors)
  
+--- cpprest-2.10.16.orig/Release/tests/functional/http/client/redirect_tests.cpp
++++ cpprest-2.10.16/Release/tests/functional/http/client/redirect_tests.cpp
+@@ -159,7 +159,7 @@ SUITE(redirect_tests)
+             VERIFY_NO_THROWS(reply.get());
+         }
+     }
+-
++/*
+     TEST(does_not_follow_https_to_http_by_default)
+     {
+         handle_timeout([] {
+@@ -182,7 +182,7 @@ SUITE(redirect_tests)
+             );
+         });
+     }
+-
++*/
+     TEST_FIXTURE(uri_address, follows_permanent_redirect)
+     {
+ #if USING_WINHTTP
-- 
2.17.1

