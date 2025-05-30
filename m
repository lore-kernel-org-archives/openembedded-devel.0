Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92970C3ABB2
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 05:59:03 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.583.1748584741389758190
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 May 2025 22:59:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=cYTK8BsM;
 spf=pass (domain: mvista.com, ip: 209.85.210.43, mailfrom: vanusuri@mvista.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-72ecb4d9a10so1753315a34.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 May 2025 22:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1748584740; x=1749189540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aaMJF65cjbLhXjJ8Pfqw8IRobMvA1wQOo48UJJIV+rg=;
        b=cYTK8BsMW/d3JOSwp6f/JW2cZb7y9inyzMDdZmuu5Q2NFegJM1XRxIslC4Np4shYrC
         Gg2KUtfzRtDSJMwT0Tnrs9yXAHq2YFJvTCliaLpY2cH0khhmRWwYKyXneDnHvtXEO7xe
         /L6tsqWTN53sxI9fHb87MrPr+KxKk+fPyAQEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748584740; x=1749189540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaMJF65cjbLhXjJ8Pfqw8IRobMvA1wQOo48UJJIV+rg=;
        b=Sb0AzrajEwnh0V7VZD+ysESHjrOVFcH6NkDgTVfHpgQRvb+Jawm2nvVWNV3Rqw8+Pf
         GyvYbXcGfvYcJEJFw4D6/o8iw37vXCvQe3Ky3yR2DNTPgcbYlC355sgMDycv4WFMDvuc
         3oOG0nkKalMoEE4sA9JaQp85kftpQ2sr5ATNyzXb78TBilgmIoTQbfB8s6vMKaMjTbA1
         7Tv2wjrqzAIKuciwONPOwGbEDKB1h+QoKinnm+CrlhDV9yYVEL82tGUusGlH4QkLc0oH
         GnW2bAwiWSNCIkR3Z7jCjqn7aEB65AXiA5hVIz0XJNosZI9eVYLjaPSWbGwMT7HD8dfz
         CnEg==
X-Gm-Message-State: AOJu0Yy0rr0RGOc3wNqORuj4+VIfEfApMbYDKrs+S4EqOP0u85Nj7qgx
	Kc1u+ODNHLvYZtD6s8B+mFjMIwrbvMPNZ4UwpmnRyOCEI0bffnbjX6dre/0Ikw2wGgNUbf6rLEv
	8BCiIWps=
X-Gm-Gg: ASbGncuKaO77dtYcWk6dEDGGQX4URqgwHCnQxbkxFFjCPCZ8OIZUcEZwbOdnXNgTgg+
	8ioMCfvvODbK+N4lEW4LOOJKnUbBleV2PyPKH7cgYS2iQgeqOkE45SeO/vXmz5wdSp9p0IwIOlT
	gTVvUYPmBstNoNHn0e3JCpe1h3C/61MqDGfsqVY0grUynwCUtMRXOT/i1o2MxBVirh2r/iEd78I
	bUpNdQ05n3fuhd2yyQwqyXenWmcvh1cjtYQO8QQx3dVW8VlliSMSSJeO4HwRKED+TZBXFBvu/pQ
	uURg+LwnRmmrlnCei9SRdcjDFHc/XM73gLQFkOQKvIfuNX1WvL3l0IezgjHcJMk=
X-Google-Smtp-Source: AGHT+IHhvrmZNYFkv9PTX/+E6MXJ9vswt5zQvzSlumEIOcf+bGH0dWQNVTKbk4s9MSzshApmR7KjDA==
X-Received: by 2002:a05:6808:6f94:b0:3fa:8bfd:773f with SMTP id 5614622812f47-406795e7e87mr1418000b6e.2.1748584739926;
        Thu, 29 May 2025 22:58:59 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.228.102])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40678ce8480sm292067b6e.36.2025.05.29.22.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 22:58:58 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH] redis: Fix CVE-2025-21605
Date: Fri, 30 May 2025 11:28:48 +0530
Message-Id: <20250530055848.51354-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 05:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117670

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/redis/redis/commit/42fb340ce426364d64f5dccc9c2549e58f48ac6f

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../redis/redis-7.0.13/CVE-2025-21605.patch   | 62 +++++++++++++++++++
 .../recipes-extended/redis/redis_7.0.13.bb    |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-21605.patch

diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-21605.patch b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-21605.patch
new file mode 100644
index 0000000000..68ea481861
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-21605.patch
@@ -0,0 +1,62 @@
+From 42fb340ce426364d64f5dccc9c2549e58f48ac6f Mon Sep 17 00:00:00 2001
+From: YaacovHazan <yaacov.hazan@redis.com>
+Date: Wed, 23 Apr 2025 08:09:40 +0000
+Subject: [PATCH] Limiting output buffer for unauthenticated client
+ (CVE-2025-21605)
+
+For unauthenticated clients the output buffer is limited to prevent
+them from abusing it by not reading the replies
+
+Upstream-Status: Backport [https://github.com/redis/redis/commit/42fb340ce426364d64f5dccc9c2549e58f48ac6f]
+CVE: CVE-2025-21605
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/networking.c    |  5 +++++
+ tests/unit/auth.tcl | 18 ++++++++++++++++++
+ 2 files changed, 23 insertions(+)
+
+diff --git a/src/networking.c b/src/networking.c
+index 7007141a867..bb1a72b9fb4 100644
+--- a/src/networking.c
++++ b/src/networking.c
+@@ -3858,6 +3858,11 @@ int checkClientOutputBufferLimits(client *c) {
+     int soft = 0, hard = 0, class;
+     unsigned long used_mem = getClientOutputBufferMemoryUsage(c);
+ 
++    /* For unauthenticated clients the output buffer is limited to prevent
++     * them from abusing it by not reading the replies */
++    if (used_mem > 1024 && authRequired(c))
++        return 1;
++
+     class = getClientType(c);
+     /* For the purpose of output buffer limiting, masters are handled
+      * like normal clients. */
+diff --git a/tests/unit/auth.tcl b/tests/unit/auth.tcl
+index 9532e0bd2eb..0d25f5dea2d 100644
+--- a/tests/unit/auth.tcl
++++ b/tests/unit/auth.tcl
+@@ -45,6 +45,24 @@ start_server {tags {"auth external:skip"} overrides {requirepass foobar}} {
+         assert_match {*unauthenticated bulk length*} $e
+         $rr close
+     }
++
++    test {For unauthenticated clients output buffer is limited} {
++        set rr [redis [srv "host"] [srv "port"] 1 $::tls]
++        $rr SET x 5
++        catch {[$rr read]} e
++        assert_match {*NOAUTH Authentication required*} $e
++
++        # Fill the output buffer in a loop without reading it and make
++        # sure the client disconnected.
++        # Considering the socket eat some of the replies, we are testing
++        # that such client can't consume more than few MB's.
++        catch {
++            for {set j 0} {$j < 1000000} {incr j} {
++                    $rr SET x 5
++            }
++        } e
++        assert_match {I/O error reading reply} $e
++    }
+ }
+ 
+ start_server {tags {"auth_binary_password external:skip"}} {
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.13.bb b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
index e7bff9b4ec..f22d65462a 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.13.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://CVE-2024-31449.patch \
            file://CVE-2024-46981.patch \
            file://CVE-2024-51741.patch \
+           file://CVE-2025-21605.patch \
            "
 SRC_URI[sha256sum] = "97065774d5fb8388eb0d8913458decfcb167d356e40d31dd01cd30c1cc391673"
 
-- 
2.25.1


