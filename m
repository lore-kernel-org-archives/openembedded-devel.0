Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C27C43219
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 19:40:49 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.506.1649785240435485970
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 10:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AzN4yGQ9;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id p8so18122362pfh.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 10:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gDRHA4xX3Evwt/1LaKTzyev1Rx1I9OjT2gdqbmU1KPs=;
        b=AzN4yGQ9uafWHA6zuRxWxJFgl0UCxDbEHHJPCC025HkyGArcLbhwaCvlW/5KQl1gw3
         C3kqi/YNJX5NBn70aCfC4FX6TBjuhiXri/aMVenBm92RByaTveVc1Tr6HxPv1f7I6EN+
         Dvx0FDNG0D2PRVIB0AqAeNEbLJX+yWdSgsOkB+QQmODN9RursVBVGnsS1fw5617tX150
         gUpQ2hOJH9DP8rG4h5rXbuyxpLYhQvU6YXWE66qpvvUlmZGcfptWN1T2tpQvYtmkec1R
         oerl0q373EqPBrsNcjCkhZ8bygunJZi0fhVOySTqveYeaMed6GZ4/wHBW9iPbFkVC+jG
         Dc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gDRHA4xX3Evwt/1LaKTzyev1Rx1I9OjT2gdqbmU1KPs=;
        b=bsvl0T75hvCwtazVR3W//2+ksKwxOCE3xjtbE5OMhycvgRGX0GI1eFv3hzwyMbUwQA
         EDTBhINFmckivff3+tRVr72EJGt8chdRJAOOoPmp6+mQpgmDCsGrQJNpAis2le+KQz9A
         IsRnqX7DhspPMKU2TdqHUs2EyPArcEqCiCM0NyKdAn3DPcy6kZjH23igvKhxWADQN1mW
         zhNnz0FVk0pfn90HqGtFNQzBqWvyRYBG4YapCewtNjoCet2oiUEluW9BFRSdECdXkgzR
         Me7IN6aHDEIy+j0M4QbY2q+BAtDbs9tUyBqoz/6qfReYqJ5U7HeJ7ruU2f3eCmbO8jym
         ckzg==
X-Gm-Message-State: AOAM531sCWXDi+nogA/te5o3r/UozmkxwTak5MNbc5D55iAO1c6NlKkA
	U0aoPyhT0mlgkohNItVaHjsoLaOwYBcaCA==
X-Google-Smtp-Source: 
 ABdhPJyfj7K2r9QCJHPh4Jxv9FMp/0/U/fuNK0HYnvw1q5cNl/kn8XOPdagd2h+ah2k3psnq4zYyRg==
X-Received: by 2002:aa7:92c8:0:b0:4fd:c1aa:3e11 with SMTP id
 k8-20020aa792c8000000b004fdc1aa3e11mr39502066pfa.29.1649785239505;
        Tue, 12 Apr 2022 10:40:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 u18-20020a056a00125200b004fb112ee9b7sm36093293pfi.75.2022.04.12.10.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 10:40:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mongodb: Update to 4.4.13
Date: Tue, 12 Apr 2022 10:40:36 -0700
Message-Id: <20220412174036.3487182-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 19:40:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96592

Drop upstreamed patches which are present in this release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mongodb/0001-Do-not-use-MINSIGSTKSZ.patch | 34 ------------------
 ...0001-Use-explicit-typecast-to-size_t.patch | 35 -------------------
 .../recipes-dbs/mongodb/mongodb_git.bb        |  8 ++---
 3 files changed, 3 insertions(+), 74 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Do-not-use-MINSIGSTKSZ.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-explicit-typecast-to-size_t.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Do-not-use-MINSIGSTKSZ.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Do-not-use-MINSIGSTKSZ.patch
deleted file mode 100644
index 0ee64e9c6c..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Do-not-use-MINSIGSTKSZ.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 027044a692b588ef586d495f65eb58b07cc711a3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 11 May 2021 10:15:51 -0700
-Subject: [PATCH] Do not use MINSIGSTKSZ
-
-Since glibc 2.34+ MINSIGSTKSZ is no more a constant.  So,
-let's hardwire this for now until better fix is found.
-64Kb should be good anyway
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/mongo/stdx/thread.h | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/src/mongo/stdx/thread.h b/src/mongo/stdx/thread.h
-index f8058279e3..f31f309959 100644
---- a/src/mongo/stdx/thread.h
-+++ b/src/mongo/stdx/thread.h
-@@ -104,10 +104,7 @@ private:
-     //   .                     N   Y :      4,344 |  13,048 |     7,352
-     //   .                     Y   Y :      4,424 |  13,672 |     8,392
-     //   ( https://jira.mongodb.org/secure/attachment/233569/233569_stacktrace-writeup.txt )
--    static constexpr std::size_t kMongoMinSignalStackSize = std::size_t{64} << 10;
--
--    static constexpr std::size_t kStackSize =
--        std::max(kMongoMinSignalStackSize, std::size_t{MINSIGSTKSZ});
-+    static constexpr std::size_t kStackSize = std::size_t{64} << 10;
-     std::unique_ptr<std::byte[]> _stackStorage = std::make_unique<std::byte[]>(kStackSize);
- 
- #else   // !MONGO_HAS_SIGALTSTACK
--- 
-2.31.1
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-explicit-typecast-to-size_t.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-explicit-typecast-to-size_t.patch
deleted file mode 100644
index 5b724ff8aa..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-explicit-typecast-to-size_t.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 6fdb2d304e05a17e57b2efd7f8252794a8722dbe Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 1 Jun 2021 08:25:36 -0700
-Subject: [PATCH] Use explicit typecast to size_t
-
-maxMemoryUsageBytes is size_t type which may not match long long value
-internalDocumentSourceGroupMaxMemoryBytes.load() returns, so typecast it
-to avoid narrowing warning from clang
-
-document_source_group.cpp:378:22: error: non-constant-expression cannot be narrowed from type 'long long' to 'size_t' (aka 'unsigned int') in initializer list [-Wc++11-narrowing]
-                     maxMemoryUsageBytes ? *maxMemoryUsageBytes
-                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/mongodb/mongo/pull/1405]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/mongo/db/pipeline/document_source_group.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/mongo/db/pipeline/document_source_group.cpp b/src/mongo/db/pipeline/document_source_group.cpp
-index c7bf44e72e..a52906a940 100644
---- a/src/mongo/db/pipeline/document_source_group.cpp
-+++ b/src/mongo/db/pipeline/document_source_group.cpp
-@@ -376,7 +376,7 @@ DocumentSourceGroup::DocumentSourceGroup(const intrusive_ptr<ExpressionContext>&
-       _doingMerge(false),
-       _memoryTracker{pExpCtx->allowDiskUse && !pExpCtx->inMongos,
-                      maxMemoryUsageBytes ? *maxMemoryUsageBytes
--                                         : internalDocumentSourceGroupMaxMemoryBytes.load()},
-+                                         : (size_t)internalDocumentSourceGroupMaxMemoryBytes.load()},
-       _initialized(false),
-       _groups(pExpCtx->getValueComparator().makeUnorderedValueMap<Accumulators>()),
-       _spilled(false) {
--- 
-2.31.1
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 1215344d97..6db7070a43 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -11,9 +11,9 @@ DEPENDS = "openssl libpcap zlib boost curl python3 \
 
 inherit scons dos2unix siteinfo python3native systemd useradd
 
-PV = "4.4.7"
-#v4.4.7
-SRCREV = "abb6b9c2bf675e9e2aeaecba05f0f8359d99e203"
+PV = "4.4.13"
+#v4.4.13
+SRCREV = "df25c71b8674a78e17468f48bcda5285decb9246"
 SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
            file://0001-Use-long-long-instead-of-int64_t.patch \
@@ -29,8 +29,6 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0001-include-needed-c-header.patch \
            file://disable_runtime_check.patch \
            file://ppc64_ARCH_BITS.patch \
-           file://0001-Do-not-use-MINSIGSTKSZ.patch \
-           file://0001-Use-explicit-typecast-to-size_t.patch \
            file://PTHREAD_STACK_MIN.patch \
            "
 SRC_URI:append:libc-musl ="\
-- 
2.35.1


