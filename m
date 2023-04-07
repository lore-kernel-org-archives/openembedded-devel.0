Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D92C6FD1D
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 17:14:36 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.15327.1680887670965584785
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Apr 2023 10:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UG5gh/Rq;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id z19so40495246plo.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 10:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680887670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7EyZaKrygRc9tv+lrC+z8t7HNBi8SPjx42Cfpf8pPJk=;
        b=UG5gh/Rq0iTtGwsTaoozrI0e8V8wrOONdATdycpLEAgeyuSjkXAi4pYx2o1Lu+xwAz
         wwM5LQZ0RtRDNE9rN5PBVu7EpbW4nL+PgPGDM6GzlGq1FNUjBFaXHNx6hxG0/n5NvJwA
         JMhzOjj9AEjCjG94tMZPDQ5/8nq4l/8Fm/4riVpcuC0U5Z2vbQtghU7+2Gv0l1CfWTz3
         pUAzRaanx3ca7W9dZqyONWDIb954GKWo29CFIqQKx1Y8jhQZ1K8qIDGJO7Qm365Jeq41
         h5aHgZV/+/1hqP2IfdvrpD6/d0pHK+BO9HKsLb5VEq/0pjCeALoFuxkqH+fJvbvVIZ9n
         ZBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680887670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7EyZaKrygRc9tv+lrC+z8t7HNBi8SPjx42Cfpf8pPJk=;
        b=yvPHty7sqUSzx4X553SoHxC0srV2EEvKk+t55ajHdYQH5D4R4RbUydkc2eeRar2j02
         DZEtTulTxNNBz2wpf+tM/NOTje9keIoN0PjFwq6jPscs/KRKL6Vwo7plqzP9vvX6kCbQ
         /A3IlcK3Xg84Zq2OEcPG5TakbhZQvVUO/5gWV1ry+/oTeideDsGCcueDIFYeapG1sW70
         4UEQXvRNlU5qbaHAhVYGttEEFsqebn0BBZ0M7aFstm3nNK3wRuCtlHmcb37gv9n8iAjT
         pBvD/IPDF1fsgLAoA+mOMGIvKpieOC5tzeGlRAew+kQut91c6LQDOHj9JdDJOMRwrZaC
         XAtg==
X-Gm-Message-State: AAQBX9eSmpbqX6q0/b2xdrAZEQ8HN70BF3DpxhiPJsZTFwbrMAB8EiqA
	HNxmBsqrnmkZ2s7nWsF7QhupA2iRVn4dmQ==
X-Google-Smtp-Source: AKy350ZE8nGBFK/O0JoRUn8Rp7jUPdWneWc2cUG3ujhROOB4zcFhVpGhPwqNC/L+OaUYaTFRZFNGCw==
X-Received: by 2002:a17:90a:7c09:b0:23d:e0e8:f453 with SMTP id v9-20020a17090a7c0900b0023de0e8f453mr3027975pjf.38.1680887669869;
        Fri, 07 Apr 2023 10:14:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::26f8])
        by smtp.gmail.com with ESMTPSA id bx7-20020a17090af48700b002369a14d6b1sm4890568pjb.31.2023.04.07.10.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 10:14:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH] monkey,webmin: Fix upstream patch status
Date: Fri,  7 Apr 2023 10:14:27 -0700
Message-Id: <20230407171427.31181-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 17:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101989

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-configure-Respect-LIBS-variable-from-env.patch   | 2 +-
 meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/monkey/files/0001-configure-Respect-LIBS-variable-from-env.patch b/meta-webserver/recipes-httpd/monkey/files/0001-configure-Respect-LIBS-variable-from-env.patch
index 6669848a06..3eb3067394 100644
--- a/meta-webserver/recipes-httpd/monkey/files/0001-configure-Respect-LIBS-variable-from-env.patch
+++ b/meta-webserver/recipes-httpd/monkey/files/0001-configure-Respect-LIBS-variable-from-env.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] configure: Respect LIBS variable from env
 For musl we need to pass -lexecinfo from env
 this change accomodates that
 
-Upstream-Status: [OE-specific]
+Upstream-Status: Inappropriate [OE-specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  configure | 2 +-
diff --git a/meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch b/meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch
index 027a9d4ad9..489318b4bd 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch
@@ -2,7 +2,7 @@ Hack in support for an "exclude" config option for the init module, so
 we can hide certain system services that shouldn't really be configurable
 via the web interface
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-- 
2.40.0


