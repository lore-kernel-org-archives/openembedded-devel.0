Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AAEBC433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 04:56:11 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.3796.1634100970410983930
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 21:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JK73Ui+H;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id f5so1112410pgc.12
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 21:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0g6iOBArTuKpH9hl4zxEFcJGDcKe40wVgXBoprCcZDY=;
        b=JK73Ui+HwtbianRlXU0AhbIrCZ1pmuNtR0PGkFHihrjzM/xZdXnaS40G5O1jHrcHny
         TV9IWurb3XKxbgv8pcGkBOf9AYLo3rTgTsMLbHypndSL0HarnSvaVzMfrp10C1zirgEJ
         z6+0yu9uzZTEsOgEE1YUE0pXCdoIo/vcfaQ8RQ9BCuTiSEFrL5fEXKSD27D5Xsh7IhyJ
         nkDsBvpzZHCSyXuUN8fvkvwef6UD2aaL+gaZH9ZGhzKsZCR8qVeD7UlTljyvIWLUd3+U
         ZOaL27Da1Lgl8CZTUUUTduCdFaygdN8WU8BYXG4tyA1Zg+SEwf6EFHpHodb1cig4ynJE
         waTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0g6iOBArTuKpH9hl4zxEFcJGDcKe40wVgXBoprCcZDY=;
        b=qKvRB5Vp63oTg4UOAIXE8vDfl85OKWZ28dAfQF8/uqZftdxVSjAIj67Cyx80uJMqMr
         jcGpPPS3uqGzEsDhrtfQhF9f3PP18MCOyjdoUDh8O6MJT2wt+lektPjejdEW/QSVRNjE
         01mbWZFqt/3W25ZHUeGrgiKm5hiTB/Y/ZH/Jjv4oZpup8XFdKu48iq4QB94S8H5dloM0
         jCrXDo9ORJz7PFcdo8WvMk7kti1QFkLnFSdpufOgKYVH3extxIGgcuR6Kuh35/9kcjDm
         UaltqzGWWBApD8IYAbNWAbQ0aGLzlQf6Io/mBLR04VwlVGe8Lo/bbx1p37cHAb58sjhz
         APJA==
X-Gm-Message-State: AOAM532+07VD6ruSzHJwmpJ63yQPUy6LhXDKFgZC1fAFY6NSs0jAk4O1
	gWfIsmMkde9UXCirbYLG1jjl+SwkJSwM4Q==
X-Google-Smtp-Source: 
 ABdhPJyMh3/AvhH8lblGcCkqDplMmIRWDO91fW0bbRRs1u+cUNJZ6yV20o4dvvRReevzAT+hXOPhSg==
X-Received: by 2002:a63:2a0e:: with SMTP id
 q14mr26418617pgq.217.1634100969533;
        Tue, 12 Oct 2021 21:56:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ba74])
        by smtp.gmail.com with ESMTPSA id
 x30sm8516257pfj.219.2021.10.12.21.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 21:56:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/3] kronosnet: Correct path to poll.h
Date: Tue, 12 Oct 2021 21:56:05 -0700
Message-Id: <20211013045607.399687-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Oct 2021 04:56:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93264

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ests-Correct-include-path-for-poll.h.patch | 29 +++++++++++++++++++
 .../kronosnet/kronosnet_1.22.bb               |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-extended/kronosnet/kronosnet/0001-libknet-tests-Correct-include-path-for-poll.h.patch

diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet/0001-libknet-tests-Correct-include-path-for-poll.h.patch b/meta-networking/recipes-extended/kronosnet/kronosnet/0001-libknet-tests-Correct-include-path-for-poll.h.patch
new file mode 100644
index 0000000000..0d261fd4ef
--- /dev/null
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet/0001-libknet-tests-Correct-include-path-for-poll.h.patch
@@ -0,0 +1,29 @@
+From cae68083fda5d4ca832ff3cc8a533454df2efe23 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 12 Oct 2021 20:35:53 -0700
+Subject: [PATCH] libknet/tests: Correct include path for poll.h
+
+Fixes
+/usr/include/sys/poll.h:1:2: error: redirec
+ting incorrect #include <sys/poll.h> to <poll.h> [-Werror,-W#warnings]
+| #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
+
+Upstream-Status: Submitted [https://github.com/kronosnet/kronosnet/pull/363]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libknet/tests/test-common.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libknet/tests/test-common.c b/libknet/tests/test-common.c
+index 86b76b0..8f8b6ca 100644
+--- a/libknet/tests/test-common.c
++++ b/libknet/tests/test-common.c
+@@ -20,7 +20,7 @@
+ #include <pthread.h>
+ #include <dirent.h>
+ #include <sys/select.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ 
+ #include "libknet.h"
+ #include "test-common.h"
diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.22.bb b/meta-networking/recipes-extended/kronosnet/kronosnet_1.22.bb
index 3d49a2365a..28d740cb41 100644
--- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.22.bb
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.22.bb
@@ -12,7 +12,9 @@ SECTION = "libs"
 DEPENDS = "doxygen-native libqb-native libxml2-native bzip2 libqb libxml2 libnl lksctp-tools lz4 lzo openssl nss xz zlib zstd"
 
 SRCREV = "0123ecebce0ad6aba3cdb320027192e15fd71e23"
-SRC_URI = "git://github.com/kronosnet/kronosnet;protocol=https;branch=stable1"
+SRC_URI = "git://github.com/kronosnet/kronosnet;protocol=https;branch=stable1 \
+           file://0001-libknet-tests-Correct-include-path-for-poll.h.patch \
+           "
 
 UPSTREAM_CHECK_URI = "https://github.com/kronosnet/kronosnet/releases"
 
-- 
2.33.0


