Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.767.1589349974461770907
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 23:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S29BNS21;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id s8so19222621wrt.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 23:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=an8LNiyTZ8xJFJ3QN7ybYFl5C9ehgZZQkjzA7jc7fKQ=;
        b=S29BNS219Hp67IwiDvBZ6ujSr2apBA4ktgO1S9ISX/vCzpD/fXRPUojUD0/pVOL1Ed
         Q9kOL16uruGzWetNwC1w/3hWsEP5z62qvlhOPwd1QElAkG4ihftE92iZmERJWu9XKc0j
         6gn9VMV369dA0rUen61BwhimicKZToko8sRR7A2n3h0UBF/37E4Wa9zULlsjQX9hwdnP
         99rydxBkiFUJkNC6Gw04gqqBMkwWGydrS6jdmXKwLR0G58U8Inhz6OhOUe1VhXOE76lp
         qwTBMRPYJBLDoXi8k22BRNlkFMsgnDkqkCZFbpfwJWIhgSDGAELAy1Vv2rvBjQWTV5g/
         cLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=an8LNiyTZ8xJFJ3QN7ybYFl5C9ehgZZQkjzA7jc7fKQ=;
        b=JA1t/0TgYYYkp1szEEMNHz9ftkG0RiB5V9l71XXrRvo8fPASBKwV/JjriNfgSZWbLV
         djjcuXEGtWnIlvH2T1+50MIOqbVp4uNUtOBeRFGnGaGfpNETUnwbsdVx0wL6e79R+UH/
         J6NErvRU+SaDTP0UAxzkxy4ZmELP7IHfKY7ScAaZhRxuEPqSw2Yqm8GvrxwrwBUDX/V6
         g7KspbeNRbxLs8dvBriHISFK96daYrv77yjWEgXtbEo7idhXCooKouahfjxb10XMB05A
         MkI9sOQZWqhb8Wi2G9YtqNgGuxFrwVHUT28rkCAOVxzo1uw4O9DWyBxNqcl/gjtcd4Mi
         82cQ==
X-Gm-Message-State: AGi0PuYHKOf926MPmg9aT9H0Axna7K1SsjAlt90tVF3NNZVwY1hvN2ZK
	A16zrh8of/xy65cmkOFesntG4koVGMc=
X-Google-Smtp-Source: APiQypKM5sguryEZcxtSQ+pKWWNof5pY/spru5XKUUgDKGH6apNYbcFTiMvmrWWgGZk4wzF3/ddfOQ==
X-Received: by 2002:a5d:4745:: with SMTP id o5mr28563628wrs.128.1589349972333;
        Tue, 12 May 2020 23:06:12 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from localhost.localdomain (mob-176-243-9-254.net.vodafone.it. [176.243.9.254])
        by smtp.gmail.com with ESMTPSA id j2sm26277385wrp.47.2020.05.12.23.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 23:06:11 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] cpprest: Disable one more test requiring internet connection
Date: Wed, 13 May 2020 08:06:08 +0200
Message-Id: <20200513060608.17268-1-costamagnagianfranco@yahoo.it>
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

