Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D5B8C61DA4
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 01:52:22 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.723.1677894740577431287
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Mar 2023 17:52:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YuYFEwTq;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id me6-20020a17090b17c600b0023816b0c7ceso7986839pjb.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Mar 2023 17:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677894740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oRpXv/gvkjOpMZtw6WxU9bY9x694dxK/1RNPu2V4zBw=;
        b=YuYFEwTqM4j/wAKTV9rOwNHqaYKZpQ5gs38ZRqHKSYs/k8HIJTeihtAKHrf4fo09EO
         EwNldayBIix+Lc1J+RXZu5ieTd1tzr+6/a09xhM3X4lSjFvgCArlYAZsmwP3Tuu+FDUR
         OOFOEoqYB/JgUsb9b+eEjtpsWbsKr+mVrZDtck4ElfV6d6+szrHpXi1zspA0PIG80Nxl
         se1k2YJq4yuI21/iOFlDP4i3k0xgb1UYl+p9eGs/E1IrtTdK9KofIqrDQ4o4p+lcSOT2
         xVeuNqw1tus1Ae+bfZuXoRP2D/HCazHr4IFlhf0K0G+M9MbIZQzcN8dyhWJyTq1PGSGN
         evtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677894740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRpXv/gvkjOpMZtw6WxU9bY9x694dxK/1RNPu2V4zBw=;
        b=Wy/74+vh426bJZZjvLNLpA34Yg3AAOs2LqQA2dHceq6NdKAOh4DijKK6mWtitk8V10
         g/8EhnpYw/eQcmExt76sdaFZENXFsODEPdQWTwNjKxQILaZYQgtYFlepXpaa5xrrYtvb
         nXhYwJ5F+7d4vyloHcc3R4UCCDZqVDkD38ApCmaRN76RNIqCoVTCYVgQdR9jlhpK3n+2
         njFj6Zc9KoUBuWgRmDP17dn52kuAWYvaoRFSGY8s9CQU3awt0R1a/c4pDdmdfZbFeqcm
         Q8dAc18UThztCYzgPhj9SHbMAmIFPs87vjq0IrFMrYtxLRu9TkoZr6LdKKAIjTwtTG/V
         jo1A==
X-Gm-Message-State: AO0yUKV5RpkoU/Q/bb8kw9iYdV4T8OpG+MKmPE2T4i9zIGPn7XKwSg0l
	6qKKafHK8bKEqvCv898QwFjK5kO1RVM=
X-Google-Smtp-Source: AK7set9aJk2rHdK7ARoLYjK1DOPfMNffj8PP46GVLkQCKre8+6ECno5XjmcewLhhUKbLfpwRQ1US4A==
X-Received: by 2002:a17:902:f80f:b0:19c:df17:b724 with SMTP id ix15-20020a170902f80f00b0019cdf17b724mr3332675plb.58.1677894739514;
        Fri, 03 Mar 2023 17:52:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id p3-20020a170902bd0300b0019a96a6543esm2117344pls.184.2023.03.03.17.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 17:52:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] mongodb: Fix build with clang16+32bit hosts
Date: Fri,  3 Mar 2023 17:52:16 -0800
Message-Id: <20230304015217.4089514-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 01:52:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101352

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-Fix-type-mismatch-on-32bit-arches.patch | 38 +++++++++++++++++++
 .../recipes-dbs/mongodb/mongodb_git.bb        |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-type-mismatch-on-32bit-arches.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-type-mismatch-on-32bit-arches.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-type-mismatch-on-32bit-arches.patch
new file mode 100644
index 0000000000..58f975b04c
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-type-mismatch-on-32bit-arches.patch
@@ -0,0 +1,38 @@
+From 81eabea4e4da55cddfe8bcfcbc3759fa90948254 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 3 Mar 2023 14:13:29 -0800
+Subject: [PATCH] Fix type mismatch on 32bit arches
+
+std::set::size returns an unsigned integral type.
+std::max call therefore gets (unsigned int, unsigned long) here.
+Type of both arguments is not same, so its ambigous
+and there is no matching std::max implementation for mismatching
+arguments. std::max expects both input variables to be of
+same type, max(int,int) etc..
+
+Fixes
+src/mongo/util/processinfo_linux.cpp:424:16: error: no matching function for call to 'max'
+        return std::max(socketIds.size(), 1ul);
+
+Upstream-Status: Submitted [https://jira.mongodb.org/browse/SERVER-74633]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/mongo/util/processinfo_linux.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mongo/util/processinfo_linux.cpp b/src/mongo/util/processinfo_linux.cpp
+index 9063f140988..9a2c9fb49dc 100644
+--- a/src/mongo/util/processinfo_linux.cpp
++++ b/src/mongo/util/processinfo_linux.cpp
+@@ -421,7 +421,7 @@ public:
+ 
+         // On ARM64, the "physical id" field is unpopulated, causing there to be 0 sockets found. In
+         // this case, we default to 1.
+-        return std::max(socketIds.size(), 1ul);
++        return std::max(socketIds.size(), 1u);
+     }
+ 
+     /**
+-- 
+2.39.2
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index f35fb630e6..7b85bdddab 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -35,6 +35,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0001-The-std-lib-unary-binary_function-base-classes-are-d.patch \
            file://0001-free_mon-Include-missing-cstdint.patch \
            file://0001-apply-msvc-workaround-for-clang-16.patch \
+           file://0001-Fix-type-mismatch-on-32bit-arches.patch \
            "
 SRC_URI:append:libc-musl ="\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
-- 
2.39.2


