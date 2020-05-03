Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.31425.1588540437590994441
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 May 2020 14:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FS/bOTes;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id z6so6588875wml.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 May 2020 14:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=an8LNiyTZ8xJFJ3QN7ybYFl5C9ehgZZQkjzA7jc7fKQ=;
        b=FS/bOTesQZo9VbFfSWQZRCFiXf/OTzealb24+XS/gLorwI2pF1VN1ucbdpk3Sjvngq
         5ON/0tNCq4hBRZ6Dt5CoaKg494p2Kq92stHUyKj/HSy9y3yJCFHAYKwCOWI2tIF7en/Y
         KHfsRuvT50eeoPUs/o8yVbVjiYw2bnqFGXSfhTZOicXNa69kN3MZ14ISVOYftOwMbIpx
         LMHdBwIvsxdsxkLFM+TQalxSjSuWCum1F/AmdQuPlsw7x6GPMoJ1Ii9mmBCSMzJH6XX+
         kmmJNopCzLA2va52Y3CxPUOkolntRs7tc12o6F11LHJ+bgjaGG7G7/Z0t6Yxm3tmseBb
         YPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=an8LNiyTZ8xJFJ3QN7ybYFl5C9ehgZZQkjzA7jc7fKQ=;
        b=B4pzFSr8YZSqfpH9Fu8cHEVWtQVXUGjAKQiRHkLldznhtJm2B5qbRg+NE7htVHmsa1
         pB/BEt+hV4SK3Qj5ajW2JNWLup57Ikn7Ez8LbGbdO4ya+kED4lMU/X5RXV2+Y8DmiSBk
         SRRcXL86zNlx3jTt+I8K99ndwj2UtUmtSZsMHlaWX3IqBYxD9nOkxo1e/LdyLNay/SPs
         BM9ERrRj0twIKYSsHiv7zymqxhdzlcS8kBJZXPKKD1L8bLbWti3mVMiIstlfrgk236ma
         n1cFNs52NyRml3RkFIpxHIUvKWwdTjum7AH+b97GoC+fSFByXR9RcGrlfxjfQyvvBHCL
         6TGQ==
X-Gm-Message-State: AGi0PuZcp3CmQxO3oYZ/vLA49SoDsMxfM/hNRWLLTKe9cFOyyDPhhX2q
	8fVkCK4iOeM6ymgVYLYdyxa+Pnb6CNM=
X-Google-Smtp-Source: APiQypKX5kgq3DwJt6memCFtJRzcGsSWtp+AaSkReYmCFhp2O/biFvGKfMsCksC2MoDAzOni7HhciQ==
X-Received: by 2002:a1c:48c:: with SMTP id 134mr10291863wme.47.1588540435743;
        Sun, 03 May 2020 14:13:55 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from localhost.localdomain ([5.170.12.105])
        by smtp.gmail.com with ESMTPSA id r15sm3283391wrq.93.2020.05.03.14.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 14:13:55 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] cpprest: Disable one more test requiring internet connection
Date: Sun,  3 May 2020 23:13:52 +0200
Message-Id: <20200503211352.25720-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../cpprest/disable-outside-tests.patch       | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch b/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
index e108e0279..5f1f8a9f9 100644
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

