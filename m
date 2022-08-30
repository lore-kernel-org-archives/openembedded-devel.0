Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B9EECAAA1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 07:14:43 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.8724.1661843673645801317
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NgtFSJbQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id c24so9866866pgg.11
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=nWII2GUb5cs8f9pLWwO2lmDnz6nL8D0YX+xetTU5s6I=;
        b=NgtFSJbQwETwHdk7xkIHdXnErfbZJYnxljGkDkDRi283Dp8CgQQ15Y7XC4cTEUKDAm
         m7DMg7/Gl4raXTgytf2awLbkrIqMf0jGMkN4Z7ODm1oPk4oz120csrHJ5FovYkxTK2Ri
         vZDwcag2y4Mgxqzo+xYxnRhkSDTt1vPmucoAGbIHjUcxaXMRxdOMK9r31sSq5+czKZML
         rGt5293BdVxLE/shnPCwNXOk0b6QQ4/9sVeB+LE0YhVDNnGfZHdRxDyet7jCpdg7qYcm
         chwqkjwahdY6z2BD4bj5+i0/t5Tl+FfazDTfCdnd8gGRzwjEijYWadPkyLyASQVkuiiA
         mP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=nWII2GUb5cs8f9pLWwO2lmDnz6nL8D0YX+xetTU5s6I=;
        b=Y6enF+j2Dj4xRCfohWdSsWGCHHbiKMBD8GoI8j8ZEuF/l/Copt0VfmGLVpfQHjZBSz
         fjOxwHZnygfz0I6KTv9+IhxS/81Q1OqWwy2uE4Ik8kYEBF/X29DiU47vGYOUlp6MzYDY
         N6U5hx4r1mQgR9gzGRC0JnJEYfYQMWFu9lALFJB2oUupJrxzhvH4ZHDNDl1n5tJtKlIw
         mL9cNATQ5EOzFZ3xgxosS9187XGNoHnL7qFsVzvBc20IC9dIlDkkxhNoRHB1xVABPwoN
         JtxYPJ6Oukic8QAAcheuC/XmcCjzkccObn87PmiYhPPSy26dKViSOv1xTdF7btRLcije
         bl4Q==
X-Gm-Message-State: ACgBeo2KrQFqV92vnoDx/Zx2lVx4S/TPf3bwfNu8qMUVjS8OlMFcbYbQ
	lAqfNIMWloxSNzsO3SG0olg4OKS9ykT4Hw==
X-Google-Smtp-Source: 
 AA6agR5LnSqdkLaGuz2WGvR5JJaCy0P5hnH6BxTgBt7r3v1Cu4ugIIlPwN3nWvecxMrDG/QZX4ZvbA==
X-Received: by 2002:a05:6a02:4b:b0:42b:d98a:d85b with SMTP id
 az11-20020a056a02004b00b0042bd98ad85bmr9588831pgb.556.1661843672868;
        Tue, 30 Aug 2022 00:14:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 z24-20020aa79f98000000b00537f9e32b00sm6041616pfr.37.2022.08.30.00.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 00:14:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 19/21] rdma-core: Fix build with musl
Date: Tue, 30 Aug 2022 00:14:11 -0700
Message-Id: <20220830071413.3887189-19-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830071413.3887189-1-raj.khem@gmail.com>
References: <20220830071413.3887189-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 07:14:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98556

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...xamples-Include-alloca.h-for-strdupa.patch | 29 +++++++++++++++++++
 .../rdma-core/rdma-core_42.0.bb               |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0001-examples-Include-alloca.h-for-strdupa.patch

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0001-examples-Include-alloca.h-for-strdupa.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0001-examples-Include-alloca.h-for-strdupa.patch
new file mode 100644
index 0000000000..cb472d9db9
--- /dev/null
+++ b/meta-networking/recipes-support/rdma-core/rdma-core/0001-examples-Include-alloca.h-for-strdupa.patch
@@ -0,0 +1,29 @@
+From a6c547e46bbadd2c08be9944a85308f6625263cb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 29 Aug 2022 23:15:44 -0700
+Subject: [PATCH] examples: Include alloca.h for strdupa
+
+musl defines strdupa via a macro which uses alloca() therefore include
+the header to get the prototype
+
+Upstream-Status: Submitted [https://github.com/linux-rdma/rdma-core/pull/1212]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libibverbs/examples/asyncwatch.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libibverbs/examples/asyncwatch.c b/libibverbs/examples/asyncwatch.c
+index 724796e58..842b94180 100644
+--- a/libibverbs/examples/asyncwatch.c
++++ b/libibverbs/examples/asyncwatch.c
+@@ -36,6 +36,7 @@
+ #include <endian.h>
+ #include <getopt.h>
+ #include <string.h>
++#include <alloca.h>
+ 
+ #include <util/compiler.h>
+ #include <infiniband/verbs.h>
+-- 
+2.37.2
+
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_42.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_42.0.bb
index e1123dcc14..86243a52c5 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_42.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_42.0.bb
@@ -5,7 +5,9 @@ SECTION = "libs"
 DEPENDS = "libnl"
 RDEPENDS:${PN} = "bash perl"
 
-SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https \
+           file://0001-examples-Include-alloca.h-for-strdupa.patch \
+           "
 SRCREV = "196bad56ed060612e22674b668b5ec3d8659ade3"
 S = "${WORKDIR}/git"
 
-- 
2.37.2


