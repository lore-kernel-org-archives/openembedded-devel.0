Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEA8C49EA2
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:43 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.25886.1649008869613613721
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Apr 2022 11:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VE9oGpVj;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id w4so11212007wrg.12
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Apr 2022 11:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jLjNg4zTuTpRSkPoxq30AeUz86Op8UMDE6adzho1YXM=;
        b=VE9oGpVjZfsk2V7OXXQboO+QWSQpWImJ36/j4dX0zheTVexj4wEHq9knpdClTXkxOH
         17AOvUsFsH1fLi8HX5CEloLZJJyrO9qG5GVBTJ9BbNPjjCgOxVB4XkG7d7VwbN/bndXr
         3JIq1NIM5GEvtU1aTLJh+IQGbZarf2BngNVkYPxV+n2L3moZ8/8TLPE/VOif3qD7wF0p
         vwxXU02eMLoRCxUKfwV6W2lnZ0YD5/xuvf9HzOA0PKyqVzckisiH8pILVJGsg5yz5jPr
         rbJk7Kv8PNn8aquOYRdExN/CAh0JhrcZ3189Kb0JkhWPxx8nPtU6mYeM8JLX4Qdny1UW
         ju6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jLjNg4zTuTpRSkPoxq30AeUz86Op8UMDE6adzho1YXM=;
        b=wUO6q3x8zQ7R6tZstyeI3BLL0Shqr/LV071YzyNFhmOGuqrKYbL8NgMSmvCd9QVS9f
         DARcH9O9nwiQGvWyUq2AVwZTcxhV8d3DeVUIGx9mUA1HRu9uu6eAGonfqh/Vo8ixM3iX
         TnPH45SM3WQe0YLhlSKXoGTuCTFASxUcTYWzs49nCE5ortQWnhh6TN/dHn3mFuawNRNb
         YJKSF9EwOCWAtpzF4gow+GXJFKZMp7dhEHifKnXn+0uY80wJFl1oQb6wyuldakQNaTmK
         4QCUDvio2eFV5TU9WjgijVsTKhS/i/KFi8jLiN3GnVKAHdtKE+nZTd3O9ZLhw4Xzylvy
         ukSQ==
X-Gm-Message-State: AOAM532FXdfOF6FioKzDMajYNB3YB4Kx+PopDpFTl8iua+XN0WJCkwBG
	1m8dJG+hQBSzYQt1devyNs+zyGWjPZRfww==
X-Google-Smtp-Source: 
 ABdhPJzTemqVbSbNplRYhL/zA2BEvF25c8X1K8L7dNSzqv3wv4TU0RlTp79ozmK2WJqp76KkTJ9BiQ==
X-Received: by 2002:adf:ef11:0:b0:205:b266:68eb with SMTP id
 e17-20020adfef11000000b00205b26668ebmr14875448wro.310.1649008867770;
        Sun, 03 Apr 2022 11:01:07 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 k23-20020a7bc417000000b0038ccada7566sm14492298wmi.11.2022.04.03.11.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 11:01:06 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [meta-oe][PATCH 1/2] srt: 1.4.2 -> 1.4.3
Date: Sun,  3 Apr 2022 19:01:02 +0100
Message-Id: <20220403180103.2147606-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96370

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...001-core-Fix-build-with-GCC-11.-1806.patch | 26 -------------------
 .../srt/{srt_1.4.2.bb => srt_1.4.3.bb}        |  3 +--
 2 files changed, 1 insertion(+), 28 deletions(-)
 delete mode 100644 meta-multimedia/recipes-support/srt/srt/0001-core-Fix-build-with-GCC-11.-1806.patch
 rename meta-multimedia/recipes-support/srt/{srt_1.4.2.bb => srt_1.4.3.bb} (90%)

diff --git a/meta-multimedia/recipes-support/srt/srt/0001-core-Fix-build-with-GCC-11.-1806.patch b/meta-multimedia/recipes-support/srt/srt/0001-core-Fix-build-with-GCC-11.-1806.patch
deleted file mode 100644
index 0cb6943ccb..0000000000
--- a/meta-multimedia/recipes-support/srt/srt/0001-core-Fix-build-with-GCC-11.-1806.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From f1b35cbf5b9b42b031e9b119e4c802b5f744468c Mon Sep 17 00:00:00 2001
-From: Christophe Giboudeaux <krop@users.noreply.github.com>
-Date: Wed, 10 Feb 2021 12:42:45 +0000
-Subject: [PATCH] [core] Fix build with GCC 11. (#1806)
-
-The 'limits' header must be included explicitly.
----
-Upstream-Status: Backport [https://github.com/haivision/srt/commit/f1b35cbf5b9b42b031e9b119e4c802b5f744468c]
- srtcore/sync.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/srtcore/sync.h b/srtcore/sync.h
-index 59c125a7..9f01ca91 100644
---- a/srtcore/sync.h
-+++ b/srtcore/sync.h
-@@ -15,6 +15,7 @@
- //#define ENABLE_CXX17
- 
- #include <cstdlib>
-+#include <limits>
- #ifdef ENABLE_STDCXX_SYNC
- #include <chrono>
- #include <thread>
--- 
-2.30.1
-
diff --git a/meta-multimedia/recipes-support/srt/srt_1.4.2.bb b/meta-multimedia/recipes-support/srt/srt_1.4.3.bb
similarity index 90%
rename from meta-multimedia/recipes-support/srt/srt_1.4.2.bb
rename to meta-multimedia/recipes-support/srt/srt_1.4.3.bb
index 5b5c1f24d9..9dc862c57b 100644
--- a/meta-multimedia/recipes-support/srt/srt_1.4.2.bb
+++ b/meta-multimedia/recipes-support/srt/srt_1.4.3.bb
@@ -6,10 +6,9 @@ HOMEPAGE = "https://github.com/Haivision/srt"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRCREV = "50b7af06f3a0a456c172b4cb3aceafa8a5cc0036"
+SRCREV = "291e010fbf91b13b92e1cde5dcb824a9d7f4e353"
 SRC_URI = "git://github.com/Haivision/srt;protocol=https;branch=master \
            file://0001-don-t-install-srt-ffplay.patch \
-           file://0001-core-Fix-build-with-GCC-11.-1806.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 S = "${WORKDIR}/git"
-- 
2.35.1


