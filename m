Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12756C54EFD
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.2935.1649474396848071244
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 20:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bIwDs4Vy;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id t6so3157531plg.7
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 20:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lvbgVHv5meUv6BD9G9MyxLLhmebhy7EYjrahx+0L9SU=;
        b=bIwDs4VyzjI640fWeZky+5Fyln+nN1aRX2HMRtEMFSce8Zt+QDskA7BAZUdQqMlxAE
         rvX9TCTSwvn6hN/RmU4CIUtklwv5OnfMn+DonqdIIngezfrky6D7S+/b/Num0I0A0OUm
         QOncGAqE4krV970PUJ2YoV93URRMjXM93kQAYQ8BOjO62zxTLyhc+3uF9l8W1Gup2XLr
         FLhqMOdncBqKHOrm/NwtojvAdaKrO4kq5a8ooNibkFzAnQIwg8vTSRTkZfa0mx0KNss7
         GR4jI2Lf5B86eY5/RY5q4kHUKqCkHZj7BAbA1ckEG1Y6PsidtKWwwPsmRlxtZgQqG25e
         NbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lvbgVHv5meUv6BD9G9MyxLLhmebhy7EYjrahx+0L9SU=;
        b=CkwMfU+zES40F25a3a02M3pmppezxBJ4Az1trIo+vB/Es7cwMefuJCvMxOZdCB3zfP
         UjoUjqB814yRsrW+DeIjnSG3MDctBExSkanw5wzappjJ81hs0gzNaC1qh/Dhk0rVzN8U
         /TBbMJHxRIEOxf+8eklq3hGZVO2BU7ZV6RqOI3qUJmQ0xuQMYPwzIbAujhPV2y4FSgaN
         mn20ozAgl0SH0Zc/S1035DOhxi+txhE1nCJB+E2OTHz/C7zAcxFYE4Q5iqjzhbvpr86b
         KzF5Y/goZEse8Mgnr4lRWuRboPJd741TlIzXCI6FwYv6njtWEZj85aI2aBKHlT7MbG1M
         0Ugw==
X-Gm-Message-State: AOAM531+sDNoXnoyO9Drs/9DNZnfeYU1lA3pezSYUpZC926SSpZLFl0o
	L2TyTCJyq6KICUDnPCmt9aWUIkfEDFGjOQ==
X-Google-Smtp-Source: 
 ABdhPJy9CLj8rLNX6tPjXZ9roHQ8PrCU5ad0sa3kpx5Dsd3p4p7tEwo8NeryR9IpInoqS5uRL+1uUg==
X-Received: by 2002:a17:902:e9d3:b0:154:6dd6:2521 with SMTP id
 19-20020a170902e9d300b001546dd62521mr23106055plk.59.1649474396090;
        Fri, 08 Apr 2022 20:19:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 s141-20020a632c93000000b0038134d09219sm23176160pgs.55.2022.04.08.20.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 20:19:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libotr: Include missing sys/socket.h header
Date: Fri,  8 Apr 2022 20:19:53 -0700
Message-Id: <20220409031953.2579556-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96493

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Include-missing-sys-socket.h-header.patch | 31 +++++++++++++++++++
 .../recipes-support/pidgin/libotr_4.1.1.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/pidgin/libotr/0001-tests-Include-missing-sys-socket.h-header.patch

diff --git a/meta-oe/recipes-support/pidgin/libotr/0001-tests-Include-missing-sys-socket.h-header.patch b/meta-oe/recipes-support/pidgin/libotr/0001-tests-Include-missing-sys-socket.h-header.patch
new file mode 100644
index 0000000000..5b2e14b7b9
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/libotr/0001-tests-Include-missing-sys-socket.h-header.patch
@@ -0,0 +1,31 @@
+From aa2362e50d54fce8464d85766f5b230bf453c1f0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Apr 2022 20:15:03 -0700
+Subject: [PATCH] tests: Include missing sys/socket.h header
+
+Helps define
+| ../../../../libotr-4.1.1/tests/regression/client/client.c:979:21: error: use of undeclared identifier 'PF_UNIX'
+| ../../../../libotr-4.1.1/tests/regression/client/client.c:979:30: error: use of undeclared identifier 'SOCK_STREAM'
+| ../../../../libotr-4.1.1/tests/regression/client/client.c:986:20: error: use of undeclared identifier 'AF_UNIX'
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/regression/client/client.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/regression/client/client.c b/tests/regression/client/client.c
+index e72b661..e0b3453 100644
+--- a/tests/regression/client/client.c
++++ b/tests/regression/client/client.c
+@@ -26,6 +26,7 @@
+ #include <stdlib.h>
+ #include <syscall.h>
+ #include <sys/epoll.h>
++#include <sys/socket.h>
+ #include <sys/types.h>
+ #include <sys/un.h>
+ #include <unistd.h>
+-- 
+2.35.1
+
diff --git a/meta-oe/recipes-support/pidgin/libotr_4.1.1.bb b/meta-oe/recipes-support/pidgin/libotr_4.1.1.bb
index d9e0e1caa2..115a6968eb 100644
--- a/meta-oe/recipes-support/pidgin/libotr_4.1.1.bb
+++ b/meta-oe/recipes-support/pidgin/libotr_4.1.1.bb
@@ -7,6 +7,7 @@ DEPENDS = "libgcrypt libgpg-error"
 SRC_URI = "http://www.cypherpunks.ca/otr/${BP}.tar.gz \
            file://fix_qa-issue_include.patch \
            file://sepbuild.patch \
+           file://0001-tests-Include-missing-sys-socket.h-header.patch \
 "
 
 SRC_URI[md5sum] = "dac5a8778a35f674c046ddf5d97e4d81"
-- 
2.35.1


