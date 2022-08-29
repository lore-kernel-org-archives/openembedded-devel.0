Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40738C54EE9
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 06:57:04 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web12.67755.1661756216819083456
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g2g6zijQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id t129so7305513pfb.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=/o6i4TGPns0n3gKakh5Bt8lKYxACLwcVUSjxWfZ5ucM=;
        b=g2g6zijQypUCilC5vSxtC/dOJweTtHx+rY+e++A1K7tpSYZDYprX1ltwK2Q8GOftyQ
         3sCsOf0QeJ3gp57K+OMsuvA+L/y5UqK8VJMEivESIWarfoGcJrlLu6KX1AVZes0EShpW
         3QtptOA6MusVtB1vSlea70Qo5SwXEYDFXv6FiINpYtGv3NqBelMy2Wptgbd1n5ZQCPYP
         iIGyHiyWkkHXT3s8hSXKPJZUJam7Af0wuO2ckmm8DRTg7ezERIzqrczuQ9FNrebhiVKu
         XjbxX/oFd6uZhbsrNHfc5j4IfbqloHnZbl47gSg/DAcCRJDybXWIxO4yguTaahsEqvFN
         Bp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=/o6i4TGPns0n3gKakh5Bt8lKYxACLwcVUSjxWfZ5ucM=;
        b=OcelsOmEJix7uMsBkZc0SQQV0VAcSSnMZX1EL+5OKQyPXz4wcY9P8Lv/D3Q54femM+
         byhKnbBXjE9/ZcnrYbZgNugnp/TqfBveWZPPnrn2BoltbgtmrKvtlwaiWWkzLuDa/qcP
         6B7h0YZ+z73zDn3fVwklKdOigW/NCPWaxbTBbAz5Se/Cmk81eqG2n0cU151OjBnVLLvS
         OTzvOH4ePLiHw6WW63hzG10DJq8yRPFmxdy8Z1seDhAzHU6RjCE811ZPcVgwS+qakvdp
         R0yWcZ14EJFeB8ek+4OJVYnZg1bSLJQ315HcXfCS699/UWD6Y2Vc6gWU8Gck+PlEn78B
         YWhg==
X-Gm-Message-State: ACgBeo0TvOqi/fWIdufVYkw5+c2tqRvuVf+WVabSqPsSdLSGqo6G7OE+
	2YCsrhkcMlXAk+jwXG4pmXAuEiJiVVIfiw==
X-Google-Smtp-Source: 
 AA6agR4NodnYC9N5Rabail78THWFF2yR0amvJOOlRLcSyxZtC4GKVpodADj9urbM516dSLRg3GhZTg==
X-Received: by 2002:a63:134d:0:b0:42a:9680:29d7 with SMTP id
 13-20020a63134d000000b0042a968029d7mr12619544pgt.249.1661756216031;
        Sun, 28 Aug 2022 23:56:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 p10-20020a170902e74a00b0016d5b7fb02esm505489plf.60.2022.08.28.23.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 23:56:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/7] mongodb: Fix boost build with clang-15
Date: Sun, 28 Aug 2022 23:56:47 -0700
Message-Id: <20220829065649.808556-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220829065649.808556-1-raj.khem@gmail.com>
References: <20220829065649.808556-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 06:57:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98516

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...y-binary_function-base-classes-are-d.patch | 40 +++++++++++++++++++
 .../recipes-dbs/mongodb/mongodb_git.bb        |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch
new file mode 100644
index 0000000000..4594bec81a
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch
@@ -0,0 +1,40 @@
+From f9b55f5a1fab85bf73c95e6372779d6f50f75e84 Mon Sep 17 00:00:00 2001
+From: jzmaddock <john@johnmaddock.co.uk>
+Date: Mon, 11 Jul 2022 18:26:07 +0100
+Subject: [PATCH] The std lib unary/binary_function base classes are
+ deprecated/removed from libcpp15. Fixes
+ https://github.com/boostorg/container_hash/issues/24.
+
+Upstream-Status: Backport [https://github.com/boostorg/config/pull/440/commits/f0af4a9184457939b89110795ae2d293582c5f66]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/third_party/boost-1.70.0/boost/config/stdlib/libcpp.hpp | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+--- a/src/third_party/boost-1.70.0/boost/config/stdlib/libcpp.hpp
++++ b/src/third_party/boost-1.70.0/boost/config/stdlib/libcpp.hpp
+@@ -140,4 +140,13 @@
+ #  define BOOST_NO_CXX14_HDR_SHARED_MUTEX
+ #endif
+ 
++#if _LIBCPP_VERSION >= 15000
++//
++// Unary function is now deprecated in C++11 and later:
++//
++#if __cplusplus >= 201103L
++#define BOOST_NO_CXX98_FUNCTION_BASE
++#endif
++#endif
++
+ //  --- end ---
+--- a/src/third_party/boost-1.70.0/boost/container_hash/hash.hpp
++++ b/src/third_party/boost-1.70.0/boost/container_hash/hash.hpp
+@@ -118,7 +118,7 @@ namespace boost
+ {
+     namespace hash_detail
+     {
+-#if defined(_HAS_AUTO_PTR_ETC) && !_HAS_AUTO_PTR_ETC
++#if defined(BOOST_NO_CXX98_FUNCTION_BASE)
+         template <typename T>
+         struct hash_base
+         {
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index ff4a16e9f2..d040ab160b 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -32,6 +32,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://PTHREAD_STACK_MIN.patch \
            file://0001-add-explict-static_cast-size_t-to-maxMemoryUsageByte.patch \
            file://0001-server-Adjust-the-cache-alignment-assumptions.patch \
+           file://0001-The-std-lib-unary-binary_function-base-classes-are-d.patch \
            "
 SRC_URI:append:libc-musl ="\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
-- 
2.37.2


