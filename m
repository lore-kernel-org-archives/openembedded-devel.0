Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B02C4707A
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 23:50:14 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web12.2459.1649801003816575758
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 15:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M4W36NqC;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id s137so15746148pgs.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 15:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JcJHhXPuJWsGq2LPlmmKRfNFTz2mwWeQM9M927ptGl4=;
        b=M4W36NqC4SHnE7Aj+2MdMjvlYQk6pqMHFo7UbpITt1hG+5c+VwvvDWdX4YHDge0DOM
         yprchGK5Her6YkgdR5JH+jzeWx0MewCmlTnYnEvCVyiF8c1E0MvmVibd9JqPRz9UKRfb
         mdZw/FnuMOwftLi9/UIcI0V2jnlex/v1IiHTfh2i8K01g0tcAhuHv0q9WGxn2bWnErn+
         kChnsuuyk1rOGYYvE66hYhRg1vaKMXTo5DZAy7S3tLciGSdoHg6XdoBU0OV+F5+bl3Em
         2VMGGk26Prn85kFGLEfupMZFnBHIh6LM++8o5LGIPCXr2HRaRqD0Bree81LA+JXFTRy1
         tQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JcJHhXPuJWsGq2LPlmmKRfNFTz2mwWeQM9M927ptGl4=;
        b=NouC/zrdyva6jeP7kebCAfDH5hckUtdw2YsjRrlgBgE/5DZUvlAs4PBSkJ90NC20SB
         v4y7QQCyH3edi4upqoueSvUgAzrlculNxLmPW49AKCDdosrRBDrI6m7F1kuExY/R2J9F
         t3ADVok0rZEUu4ngINPT2Jlj3lw3Y2qU8ZRBd3mOU9GOBhbEwnuEINh041lBCh1+g0um
         6sf5F28Zk7orEoH+jbXynLsJoKsHF1cRA3VlpGdoCUJ6t0NBYvV0qb/L7LzNzVHo8iMj
         Oq6V8ooaQa1jc8QFl50WBF3OvwmvjCwefHBRHyOs7HsT0B1X0aOH14s8woKN31YpP4T7
         0Cng==
X-Gm-Message-State: AOAM533fV3ECWxzdj+TUzyFyX6gPcePicQ8E7y0KQE9OmHuGHaxqA4Mh
	1TavAJP8jzup8cE9px1Fu3neXyrN6/SQew==
X-Google-Smtp-Source: 
 ABdhPJyAW1vwSkfsvHcV84k3c7c9QuqB7VDZKh9t+jKgTvd81Cbbyc4uIy5eVn9lljbCJHVguX/53w==
X-Received: by 2002:a63:18f:0:b0:37c:4671:a2ce with SMTP id
 137-20020a63018f000000b0037c4671a2cemr33107802pgb.429.1649801003061;
        Tue, 12 Apr 2022 15:03:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 v8-20020a17090a7c0800b001cb63a477eesm502881pjf.12.2022.04.12.15.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 15:03:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 5/7] memcached: Upgrade to 1.6.15
Date: Tue, 12 Apr 2022 15:03:14 -0700
Message-Id: <20220412220316.3876985-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412220316.3876985-1-raj.khem@gmail.com>
References: <20220412220316.3876985-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 23:50:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96598

Drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...heck-for-NDEBUG-before-using-total_w.patch | 48 -------------------
 ...memcached_1.6.9.bb => memcached_1.6.15.bb} |  3 +-
 2 files changed, 1 insertion(+), 50 deletions(-)
 delete mode 100644 meta-networking/recipes-support/memcached/memcached/0002-stats_prefix.c-Check-for-NDEBUG-before-using-total_w.patch
 rename meta-networking/recipes-support/memcached/{memcached_1.6.9.bb => memcached_1.6.15.bb} (91%)

diff --git a/meta-networking/recipes-support/memcached/memcached/0002-stats_prefix.c-Check-for-NDEBUG-before-using-total_w.patch b/meta-networking/recipes-support/memcached/memcached/0002-stats_prefix.c-Check-for-NDEBUG-before-using-total_w.patch
deleted file mode 100644
index 2979552a34..0000000000
--- a/meta-networking/recipes-support/memcached/memcached/0002-stats_prefix.c-Check-for-NDEBUG-before-using-total_w.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From d6294e9166e4875a0572349aabcc5e51acbd2e3c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 4 Jun 2021 11:33:12 -0700
-Subject: [PATCH] stats_prefix.c: Check for NDEBUG before using total_written
- variable
-
-When using NDEBUG assert macro is ineffective which is caught by latest
-clang and reports that total_written is set but unused. Therefore check
-for NDEBUG to make sure assert is used only when its effective
-
-Fixes
-error: variable 'total_written' set but not used [-Werror,-Wunused-but-set-variable]
-    size_t size = 0, written = 0, total_written = 0;
-                                  ^
-Upstream-Status: Submitted [https://github.com/memcached/memcached/pull/792]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- stats_prefix.c | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/stats_prefix.c b/stats_prefix.c
-index 62f0d04..d72e514 100644
---- a/stats_prefix.c
-+++ b/stats_prefix.c
-@@ -127,8 +127,10 @@ char *stats_prefix_dump(int *length) {
-     PREFIX_STATS *pfs;
-     char *buf;
-     int i, pos;
--    size_t size = 0, written = 0, total_written = 0;
--
-+    size_t size = 0, written = 0;
-+#ifndef NDEBUG
-+    size_t total_written = 0;
-+#endif
-     /*
-      * Figure out how big the buffer needs to be. This is the sum of the
-      * lengths of the prefixes themselves, plus the size of one copy of
-@@ -154,8 +156,10 @@ char *stats_prefix_dump(int *length) {
-                            pfs->prefix, pfs->num_gets, pfs->num_hits,
-                            pfs->num_sets, pfs->num_deletes);
-             pos += written;
-+#ifndef NDEBUG
-             total_written += written;
-             assert(total_written < size);
-+#endif
-         }
-     }
- 
diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.9.bb b/meta-networking/recipes-support/memcached/memcached_1.6.15.bb
similarity index 91%
rename from meta-networking/recipes-support/memcached/memcached_1.6.9.bb
rename to meta-networking/recipes-support/memcached/memcached_1.6.15.bb
index adf3c34e11..b28bfe72b7 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.9.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.15.bb
@@ -21,9 +21,8 @@ RDEPENDS:${PN} += "perl perl-module-posix perl-module-autoloader \
 
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            file://memcached-add-hugetlbfs-check.patch \
-           file://0002-stats_prefix.c-Check-for-NDEBUG-before-using-total_w.patch \
            "
-SRC_URI[sha256sum] = "d5a62ce377314dbffdb37c4467e7763e3abae376a16171e613cbe69956f092d1"
+SRC_URI[sha256sum] = "8d7abe3d649378edbba16f42ef1d66ca3f2ac075f2eb97145ce164388e6ed515"
 
 # set the same COMPATIBLE_HOST as libhugetlbfs
 COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
-- 
2.35.1


