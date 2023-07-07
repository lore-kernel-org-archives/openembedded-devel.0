Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3433EB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 02:35:56 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.4364.1688697355251826500
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 19:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=otObcgj5;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-262d9e75438so1031167a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Jul 2023 19:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688697354; x=1691289354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QJWID2xjtJtxdTainmysVohXX3DwHvtrC0TqqpYxDvs=;
        b=otObcgj58tWORDNXgfVPXbcKGh1vqIIKgTnjZqhtt09Q/U81tHLLPD4D3m0gn01TJ2
         99yQxeZmoVXRTz3Qcmn+cRFESxMlwuEJYNIKfKzwyVV8/KSJbMiNJsJPpQxR0eBiPzKm
         eg8HCoWck//vI9mKTRMlO5TsuXuftvdYltcM0UWwEtuGN34Qo4GVKpEVYoL1LwUKdN/W
         8MDwWV6uYXe0UEmw76EECktGHNaeZ9BvcuJhl52zsGK3vVdxsH3aUl0pSZGgh/dglxJq
         G5Bf4BaSW5dG0IdZDeKt0ijRMuLMBcwtxTU09YyS0t+XZjDRoOHP6zTeyv09kqxPiZv9
         TAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688697354; x=1691289354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJWID2xjtJtxdTainmysVohXX3DwHvtrC0TqqpYxDvs=;
        b=MP3AP1eA9PiByl9o5UDxKqo2mU/MD1XX9dFKdcJl+affwapU4sGt3gBFBq1PHDemGz
         jm874nZGkz1oEWVhp52T1GO4wzCTRJHXt5VOdl/gqm2rbXbzVh+/oiopmW8cXUNNXohh
         1Hv8xtF3PqhnkwYHd6Uw/dkwWxgyu3Z39VLLcll73DduH6+Ke1Swryz+MX27a9llC2W/
         Z/2RtkiCirLlmyjKvj26Z2lrlmuF9spwN9dAzZ5PrvaHOaiSdnSJL0c8hDovIKAll1+V
         2jFd418JidRcZmXuY1YKKvMNkzz4CTY8gw+YMSGmQHTBQKSTMPC5zRHfwnANtTlQDr8f
         VPCg==
X-Gm-Message-State: ABy/qLZxKn/hq89RhrwR7Cn3P8wKT3H8aDAKZIXReUNFAUdqRIPFcrls
	URZAnyuP6zFhWf395iGc8mEczkTvgKg=
X-Google-Smtp-Source: APBJJlERU7ax+gxhMF1PxnPu0DEDPo8rcJ1r+RAWmVajKzFGc8g3iS/0mCC3dskn1bJvTfC0cvVzaQ==
X-Received: by 2002:a17:90a:201:b0:262:cef9:84f6 with SMTP id c1-20020a17090a020100b00262cef984f6mr3243427pjc.22.1688697354202;
        Thu, 06 Jul 2023 19:35:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::81d4])
        by smtp.gmail.com with ESMTPSA id a6-20020a17090a688600b0025695b06decsm420998pjd.31.2023.07.06.19.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 19:35:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] minifi-cpp: Fix build with clang 17
Date: Thu,  6 Jul 2023 19:35:50 -0700
Message-ID: <20230707023550.1044675-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 02:35:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103686

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...s-issues-around-autovector-iterator_.patch | 63 +++++++++++++++++++
 .../files/0002-Fix-build-with-clang-17.patch  | 37 +++++++++++
 .../minifi-cpp/minifi-cpp_0.7.0.bb            |  2 +
 3 files changed, 102 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-the-constness-issues-around-autovector-iterator_.patch
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-build-with-clang-17.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-the-constness-issues-around-autovector-iterator_.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-the-constness-issues-around-autovector-iterator_.patch
new file mode 100644
index 0000000000..acb96f40d5
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-the-constness-issues-around-autovector-iterator_.patch
@@ -0,0 +1,63 @@
+From 787d5052a6034cc722b073c652cc610ae037f933 Mon Sep 17 00:00:00 2001
+From: Levi Tamasi <ltamasi@fb.com>
+Date: Fri, 22 Nov 2019 18:12:35 -0800
+Subject: [PATCH 1/2] Fix the constness issues around
+ autovector::iterator_impl's dereference operators (#6057)
+
+Summary:
+As described in detail in issue https://github.com/facebook/rocksdb/issues/6048, iterators' dereference operators
+(`*`, `->`, and `[]`) should return `pointer`s/`reference`s (as opposed to
+`const_pointer`s/`const_reference`s) even if the iterator itself is `const`
+to be in sync with the standard's iterator concept.
+Pull Request resolved: https://github.com/facebook/rocksdb/pull/6057
+
+Test Plan: make check
+
+Differential Revision: D18623235
+
+Pulled By: ltamasi
+
+fbshipit-source-id: 04e82d73bc0c67fb0ded018383af8dfc332050cc
+---
+ thirdparty/rocksdb/util/autovector.h | 15 ++++-----------
+ 1 file changed, 4 insertions(+), 11 deletions(-)
+
+diff --git a/thirdparty/rocksdb/util/autovector.h b/thirdparty/rocksdb/util/autovector.h
+index b5c84712..6d337908 100644
+--- a/thirdparty/rocksdb/util/autovector.h
++++ b/thirdparty/rocksdb/util/autovector.h
+@@ -120,27 +120,20 @@ class autovector {
+     }
+ 
+     // -- Reference
+-    reference operator*() {
++    reference operator*() const {
+       assert(vect_->size() >= index_);
+       return (*vect_)[index_];
+     }
+ 
+-    const_reference operator*() const {
+-      assert(vect_->size() >= index_);
+-      return (*vect_)[index_];
+-    }
+-
+-    pointer operator->() {
++    pointer operator->() const {
+       assert(vect_->size() >= index_);
+       return &(*vect_)[index_];
+     }
+ 
+-    const_pointer operator->() const {
+-      assert(vect_->size() >= index_);
+-      return &(*vect_)[index_];
++    reference operator[](difference_type len) const {
++      return *(*this + len);
+     }
+ 
+-
+     // -- Logical Operators
+     bool operator==(const self_type& other) const {
+       assert(vect_ == other.vect_);
+-- 
+2.41.0
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-build-with-clang-17.patch b/meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-build-with-clang-17.patch
new file mode 100644
index 0000000000..7581efc763
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-build-with-clang-17.patch
@@ -0,0 +1,37 @@
+From a784973e500753747992a51dc0fb1caabbbb03be Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 6 Jul 2023 17:52:38 -0700
+Subject: [PATCH 2/2] Fix build with clang 17
+
+Part of https://github.com/jarro2783/cxxopts/commit/513afbc6dcfe2952cb2ffab0dae2415b11bba2d0
+
+Upstream-Status: Backport [https://github.com/jarro2783/cxxopts/commit/513afbc6dcfe2952cb2ffab0dae2415b11bba2d0]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ thirdparty/cxxopts/include/cxxopts.hpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/thirdparty/cxxopts/include/cxxopts.hpp b/thirdparty/cxxopts/include/cxxopts.hpp
+index e87416f1..bd2d81cf 100644
+--- a/thirdparty/cxxopts/include/cxxopts.hpp
++++ b/thirdparty/cxxopts/include/cxxopts.hpp
+@@ -468,14 +468,14 @@ namespace cxxopts
+         {
+           if (negative)
+           {
+-            if (u > static_cast<U>(-std::numeric_limits<T>::min()))
++            if (u > static_cast<U>((std::numeric_limits<T>::min)()))
+             {
+               throw argument_incorrect_type(text);
+             }
+           }
+           else
+           {
+-            if (u > static_cast<U>(std::numeric_limits<T>::max()))
++            if (u > static_cast<U>((std::numeric_limits<T>::max)()))
+             {
+               throw argument_incorrect_type(text);
+             }
+-- 
+2.41.0
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 9ae72d2e99..0986fdec07 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -33,6 +33,8 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;branch=master;protocol=ht
             file://0001-civetweb-Disable-lto.patch \
             file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
             file://0001-Do-not-use-LFS64-functions-on-linux-musl.patch \
+            file://0001-Fix-the-constness-issues-around-autovector-iterator_.patch \
+            file://0002-Fix-build-with-clang-17.patch \
             file://minifi.service \
             file://systemd-volatile.conf \
             file://sysvinit-volatile.conf \
-- 
2.41.0


