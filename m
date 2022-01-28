Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 992FDC4332F
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 07:05:28 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.4278.1643353526417417935
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 23:05:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DxICeSsL;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id z131so4423935pgz.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 23:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ICyDl2MS/XNVQC5vrghXf7e8gA/AqrkfJ6cU0Ng3lfw=;
        b=DxICeSsLHArAjWvX9EkpwWSZm4+1uPAZChFEk2haAw4znIFsrHN1oq7Mv62UzQwHzY
         H2qmluO/+bO4JqCFPqHHTq+/HqE9+8/wiQOyy1Runl2uGyzPCqQg/lQwJH4qhlg05CCO
         odjHSDs6q0LYV2GFtbxuBslpU6sfpAIxIPM0SYUwCB5J2zFKjuSp5LeCfPsb5ieepoWj
         Skky+PfXy/97bLmmevS2h9NnSJOwdeRl2LI9UEgQJCP8/ptnDqD6ZUzv2Vmzhvr9/SsQ
         9L6SCaWWMXHmI7SwtClOBHl7MbxVvjYXqUiK4J9O6LGwUQdOnTi/qgfjR0no86rRFNT8
         hN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ICyDl2MS/XNVQC5vrghXf7e8gA/AqrkfJ6cU0Ng3lfw=;
        b=t+ZFhRYJJyHX/Ng6pWDHAh79kJWpge2PfpI5dqR4Hyoj51KPAokFnF+PmyaV8I1G28
         nFqmD7L+DUDXY+4xFBRUm1slURW1XQgqQWZxlIPV3X2mrjpVtfGsMw/gpjIDncrmgQBK
         NyZWgXIpBhmP03nZ5upsNKmAAlKacyuPk02FoHYM8NbxX8vWPieUCWZGxjAeuSZqmI/w
         R/HqfM/H+xb2n2+ofgczvC5Vv2nBEprWeMXZ7eTJ3PdqbLMalOEjKLo9mvYaENFs8bxs
         AaEG8qyIeN6YttAMXHtr52CyjO1f1lR0XfCG7h+Yb9aeI1wFgjKnWqZeQsYmY38Gqizf
         dqdA==
X-Gm-Message-State: AOAM5317sSF6H2zYr8ZWhlR4d1gB/puYE4t2L6M97b9a7gEF+qIsRl83
	jg30+k9F6hbwmn6GIJCdT+Mfjv5wlT4=
X-Google-Smtp-Source: 
 ABdhPJzwsiwm0IgkjYa2zZnuhznkdci4Sr7H54Q5oOzbvE8tCTPK2QlzzQWIwEqsWyDa9ncWx1/42g==
X-Received: by 2002:a62:1dd0:: with SMTP id d199mr6775986pfd.60.1643353525107;
        Thu, 27 Jan 2022 23:05:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 d126sm7655432pfd.136.2022.01.27.23.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 23:05:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] libcec: Fix type mismatch for return value of
 LibCecBootloader()
Date: Thu, 27 Jan 2022 23:05:20 -0800
Message-Id: <20220128070521.582584-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 07:05:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95143

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...return-type-of-function-LibCecBootlo.patch | 41 +++++++++++++++++++
 .../recipes-extended/libcec/libcec_6.0.2.bb   |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libcec/libcec/0001-cecloader-Match-return-type-of-function-LibCecBootlo.patch

diff --git a/meta-oe/recipes-extended/libcec/libcec/0001-cecloader-Match-return-type-of-function-LibCecBootlo.patch b/meta-oe/recipes-extended/libcec/libcec/0001-cecloader-Match-return-type-of-function-LibCecBootlo.patch
new file mode 100644
index 0000000000..ab1ab5b8eb
--- /dev/null
+++ b/meta-oe/recipes-extended/libcec/libcec/0001-cecloader-Match-return-type-of-function-LibCecBootlo.patch
@@ -0,0 +1,41 @@
+From 2241edc8b70c2a54d109ac9c0e821889ac138d40 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 27 Jan 2022 22:49:52 -0800
+Subject: [PATCH] cecloader: Match return type of function LibCecBootloader
+
+Fixes
+include/cecloader.h:175:14: error: cannot initialize return object of type 'bool' with an rvalue of type 'nullptr_t'
+      return NULL;
+             ^~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/cecloader.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/cecloader.h b/include/cecloader.h
+index be76468f..550f598e 100644
+--- a/include/cecloader.h
++++ b/include/cecloader.h
+@@ -172,7 +172,7 @@ bool LibCecBootloader(const char *strLib = NULL)
+     if (!g_libCEC)
+     {
+       std::cout << dlerror() << std::endl;
+-      return NULL;
++      return false;
+     }
+   }
+ 
+@@ -181,7 +181,7 @@ bool LibCecBootloader(const char *strLib = NULL)
+   if (!LibCecBootloader)
+   {
+     std::cout << "cannot find CECStartBootloader" << std::endl;
+-    return NULL;
++    return false;
+   }
+ 
+   bool bReturn = LibCecBootloader();
+-- 
+2.35.0
+
diff --git a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
index eabe1d476a..2036c53eff 100644
--- a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/Pulse-Eight/libcec.git;branch=release;protocol=https
            file://0001-CheckPlatformSupport.cmake-Do-not-hardcode-lib-path.patch \
            file://0001-Enhance-reproducibility.patch \
            file://0001-Remove-buggy-test-confusing-host-and-target.patch \
+           file://0001-cecloader-Match-return-type-of-function-LibCecBootlo.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.35.0


