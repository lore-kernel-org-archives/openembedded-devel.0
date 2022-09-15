Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87990ECAAA1
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 10:10:51 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.8164.1663236641753833362
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 03:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=REIQRvAo;
 spf=pass (domain: gmail.com, ip: 209.85.216.54,
 mailfrom: badganchipv@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 p1-20020a17090a2d8100b0020040a3f75eso17057677pjd.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 03:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=kPjXVF+VuhMYEY20PVWinMywM/S4WXxJxXn3HUfaBLk=;
        b=REIQRvAoZcjODC3fMmBX9ljHzhvLMlxzO/LWJQ8OVocDvAjPDfoC07095b13no8G/q
         WTPTyPKOk43ysAvLQoetZaUHe8TZ+3k6JVan+Ibsi/byq9ZqW/FPX+mZ8K92sWuAxFd0
         VHRnLXXoZ6HJPwuLDbptvscZed7DsWc7vadw712ATxjosb0YwxbklDh1FNMbPdK21MTR
         rhbDshN+wwQZOEnwo77d8sOrwK0iBic0/djWzg0/2tLVzvaWYJnpJj+8g2AwSD5jDwxq
         ILSaNoUXalBiKpNcUarsZXz7LL3PF/mFziC0ANXhuOquoss2tifLqWa0SVZwuLbmCcMS
         9q2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=kPjXVF+VuhMYEY20PVWinMywM/S4WXxJxXn3HUfaBLk=;
        b=gBVTyvEHiIf6pP6KtOl6otszmW3X1LwsxiskoKeIfg4goFzg7zkIzaEm9kruGxudzu
         6Onu0lNSh2WxbFlYWsR6douW7Lp7Gk3e9fnGIqEImpx8RugEXi/0suC0uz0+8dfcfkBT
         V+RaUiFPD8Q+PlYTLS19UPpmQalajlDw2YYfB4qRRSpIcTJ6gkf31+LnEuRZyb6ryC7Z
         b57zR7Ag3R04rxdd/2QhR9mtfgdVyI1/KqK+7P2JNnZ6QA8IkXEthA/7ioF0CuDSup6x
         0kWgJRbJtlVEXPI3AQSOrBqvsZMQQbDxkjTsIIHL3WtY1wClBSBUEKVHjc5WewClGrxu
         S95Q==
X-Gm-Message-State: ACrzQf31d3unLAwIXfRgnOlropJjaYTWwv+6iO4mIbwqDr6s0j8zfsHe
	GaOu1Hb5Ql9cb+mECUJi65lP+F201Hc=
X-Google-Smtp-Source: 
 AMsMyM7OcvwjBL6jcVJlwjrlc3mcj/JqV2I7gvRdRPhJ8jTxWPXMU0K8DI8+sXogHPdfxFq3SVhfhQ==
X-Received: by 2002:a17:902:d384:b0:178:60a9:8f19 with SMTP id
 e4-20020a170902d38400b0017860a98f19mr3531609pld.141.1663236640609;
        Thu, 15 Sep 2022 03:10:40 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4042:2c09:281b:78f0:c1bf:6673:7d5])
        by smtp.gmail.com with ESMTPSA id
 o19-20020a170903211300b00172e19c2fa9sm10938884ple.9.2022.09.15.03.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 03:10:40 -0700 (PDT)
From: pawan <badganchipv@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [meta-java][dunfell][PATCH] jsch: Whitelist CVE-2016-5725
Date: Thu, 15 Sep 2022 15:40:25 +0530
Message-Id: <20220915101025.16956-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Sep 2022 10:10:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98818

From: Pawan Badganchi <badganchipv@gmail.com>

Whitelist the CVE because it only affects windows platforms
Link: https://ubuntu.com/security/CVE-2016-5725

Signed-off-by: Pawan Badganchi <badganchipv@gmail.com>
---
 .../0001-jsch-Whitelist-CVE-2016-5725.patch   | 29 +++++++++++++++++++
 recipes-core/jcraft/jsch_0.1.40.bb            |  3 ++
 2 files changed, 32 insertions(+)
 create mode 100644 recipes-core/jcraft/0001-jsch-Whitelist-CVE-2016-5725.patch

diff --git a/recipes-core/jcraft/0001-jsch-Whitelist-CVE-2016-5725.patch b/recipes-core/jcraft/0001-jsch-Whitelist-CVE-2016-5725.patch
new file mode 100644
index 0000000..880440c
--- /dev/null
+++ b/recipes-core/jcraft/0001-jsch-Whitelist-CVE-2016-5725.patch
@@ -0,0 +1,29 @@
+From 1ea9958fae5a89b04ed790f45cb4f18075a35d65 Mon Sep 17 00:00:00 2001
+From: Pawan Badganchi <pawan.badganchi@kpit.com>
+Date: Wed, 13 Apr 2022 16:04:32 +0530
+Subject: [PATCH] jsch: Whitelist CVE-2016-5725
+
+Whitelist the CVE because it only affects windows platforms
+Link: https://ubuntu.com/security/CVE-2016-5725
+
+Signed-off-by: Pawan Badganchi<pawan.badganchi@kpit.com>
+---
+ recipes-core/jcraft/jsch_0.1.40.bb | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/recipes-core/jcraft/jsch_0.1.40.bb b/recipes-core/jcraft/jsch_0.1.40.bb
+index a0f70d8..1170095 100644
+--- a/recipes-core/jcraft/jsch_0.1.40.bb
++++ b/recipes-core/jcraft/jsch_0.1.40.bb
+@@ -25,5 +25,8 @@ do_compile() {
+ SRC_URI[md5sum] = "b59cec19a487e95aed68378976b4b566"
+ SRC_URI[sha256sum] = "ca9d2ae08fd7a8983fb00d04f0f0c216a985218a5eb364ff9bee73870f28e097"
+ 
++# Whitelist the CVE because it only affects Windows platforms
++CVE_CHECK_WHITELIST += "CVE-2016-5725"
++
+ BBCLASSEXTEND = "native"
+ 
+-- 
+2.17.1
+
diff --git a/recipes-core/jcraft/jsch_0.1.40.bb b/recipes-core/jcraft/jsch_0.1.40.bb
index a0f70d8..1170095 100644
--- a/recipes-core/jcraft/jsch_0.1.40.bb
+++ b/recipes-core/jcraft/jsch_0.1.40.bb
@@ -25,5 +25,8 @@ do_compile() {
 SRC_URI[md5sum] = "b59cec19a487e95aed68378976b4b566"
 SRC_URI[sha256sum] = "ca9d2ae08fd7a8983fb00d04f0f0c216a985218a5eb364ff9bee73870f28e097"
 
+# Whitelist the CVE because it only affects Windows platforms
+CVE_CHECK_WHITELIST += "CVE-2016-5725"
+
 BBCLASSEXTEND = "native"
 
-- 
2.37.3


