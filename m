Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE5EC7EE2F
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 04:22:23 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.15857.1677817339744433859
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Mar 2023 20:22:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mwNzBieW;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id bd34so819624pfb.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 20:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677817339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYE8jdtmVqDfdYvbvaMCWdIQP/hd8OFnUk+f6R9BNdQ=;
        b=mwNzBieWcS/tQn8wHkD8UhIivGhwlebZiJvOpTZvjrtTAPJ+KW0rsiCeipY4gkJj6+
         ALJbrqs7e11/P3VTIfgg4wmSIe7/96QakZJ7PBWVQwJrVvLvuyPePeNYRwtZ5JhNp7dR
         plcJKZT8VbdnF1mdEW9J9huR6k/jfoEsTQC4K1rnuMXR+YB5ByWzTv9vahekg2l51jxz
         JyXhRu8o72Vyy2uADvx0VuXcFEuF/NKWkX9KAU18O/bjic3RB13inFYAVlTfYQFZM98g
         1Lhmr+5xsn6kYPXJJ4z95AG08skLv2D2DvwyN7bIRvNsc7EDWPeRNfxybeG/Rv0FKPDL
         N4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677817339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYE8jdtmVqDfdYvbvaMCWdIQP/hd8OFnUk+f6R9BNdQ=;
        b=D42tFjUOyE7nRNPy2VDwONj1aAlxk01KmZa/AfbxkQ/C12CJpwUFyIXrHkVeAduf14
         8202csPAd+2GLL12oPoh1YaV6fRG09NwBjdSeAyfcUDDQwx/gUxgDFTtGp9lmmLk7fNL
         E513j8/05RQgY+RRjVucc+yQ7JPHKAjCSFuqNUsiQ4gPTC7pGEdhWddU6G8PhJJX9OrY
         1lHPbBJb3YGrjniLXRswfDDhSMHdmmIVj5z485A6rKUItDbGI8RlByHJiPLUJktQJiWH
         532G5YOVpkzuiEHRQR8XuA9mphfUSzcHNIiraFx+7mbU/R+m8dR/REIYyoUSeFMEzzz8
         ZFew==
X-Gm-Message-State: AO0yUKV5Y4CnRiVOYmq5F/guUZ51vzbb61Qc9E5A165oQnBT7lIB70GZ
	TN6DP1IGGCtqUImpF3L8oCDXkGRPr/U=
X-Google-Smtp-Source: AK7set/XA8Tg4OCqKbtLT5Cil9JqTWU9KU346HMSMTm2bT6uPQoHcL5piX2fPEjGLL8knXlBP6BLfg==
X-Received: by 2002:a62:644:0:b0:5a8:515a:eba4 with SMTP id 65-20020a620644000000b005a8515aeba4mr929902pfg.10.1677817338580;
        Thu, 02 Mar 2023 20:22:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id u4-20020aa78484000000b005809d382016sm496016pfn.74.2023.03.02.20.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 20:22:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] mongodb: Upgrade to 4.4.19
Date: Thu,  2 Mar 2023 20:22:15 -0800
Message-Id: <20230303042215.817853-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303042215.817853-1-raj.khem@gmail.com>
References: <20230303042215.817853-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Mar 2023 04:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101344

Add a patch to fix build with clang16 while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-apply-msvc-workaround-for-clang-16.patch | 32 +++++++++++++++++++
 .../recipes-dbs/mongodb/mongodb_git.bb        |  5 +--
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-apply-msvc-workaround-for-clang-16.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-apply-msvc-workaround-for-clang-16.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-apply-msvc-workaround-for-clang-16.patch
new file mode 100644
index 0000000000..096269308d
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-apply-msvc-workaround-for-clang-16.patch
@@ -0,0 +1,32 @@
+From 03047c81b2601362bcf79cae67e06d1fba0a6101 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 2 Mar 2023 20:17:57 -0800
+Subject: [PATCH] apply msvc workaround for clang >= 16
+
+This avoids a new Werror found with clang16
+
+boost-1.70.0/boost/mpl/aux_/integral_wrapper.hpp:73:31: error: integer value -1 is outside the valid range of values [0, 3] for this enumeration type [-Wenum-constexpr-conversion]
+    typedef AUX_WRAPPER_INST( BOOST_MPL_AUX_STATIC_CAST(AUX_WRAPPER_VALUE_TYPE, (value - 1)) ) prior;
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../boost-1.70.0/boost/mpl/aux_/integral_wrapper.hpp            | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/third_party/boost-1.70.0/boost/mpl/aux_/integral_wrapper.hpp b/src/third_party/boost-1.70.0/boost/mpl/aux_/integral_wrapper.hpp
+index 6bc05f7e96e..6bb8d24c9ce 100644
+--- a/src/third_party/boost-1.70.0/boost/mpl/aux_/integral_wrapper.hpp
++++ b/src/third_party/boost-1.70.0/boost/mpl/aux_/integral_wrapper.hpp
+@@ -56,7 +56,7 @@ struct AUX_WRAPPER_NAME
+ // have to #ifdef here: some compilers don't like the 'N + 1' form (MSVC),
+ // while some other don't like 'value + 1' (Borland), and some don't like
+ // either
+-#if BOOST_WORKAROUND(__EDG_VERSION__, <= 243)
++#if BOOST_WORKAROUND(__EDG_VERSION__, <= 243) || __clang_major__ > 15
+  private:
+     BOOST_STATIC_CONSTANT(AUX_WRAPPER_VALUE_TYPE, next_value = BOOST_MPL_AUX_STATIC_CAST(AUX_WRAPPER_VALUE_TYPE, (N + 1)));
+     BOOST_STATIC_CONSTANT(AUX_WRAPPER_VALUE_TYPE, prior_value = BOOST_MPL_AUX_STATIC_CAST(AUX_WRAPPER_VALUE_TYPE, (N - 1)));
+-- 
+2.39.2
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 253187e33c..f35fb630e6 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -11,9 +11,9 @@ DEPENDS = "openssl libpcap zlib boost curl python3 \
 
 inherit scons dos2unix siteinfo python3native systemd useradd
 
-PV = "4.4.18"
+PV = "4.4.19"
 #v4.4.18
-SRCREV = "8ed32b5c2c68ebe7f8ae2ebe8d23f36037a17dea"
+SRCREV = "9a996e0ad993148b9650dc402e6d3b1804ad3b8a"
 SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
            file://0001-Use-long-long-instead-of-int64_t.patch \
@@ -34,6 +34,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0001-server-Adjust-the-cache-alignment-assumptions.patch \
            file://0001-The-std-lib-unary-binary_function-base-classes-are-d.patch \
            file://0001-free_mon-Include-missing-cstdint.patch \
+           file://0001-apply-msvc-workaround-for-clang-16.patch \
            "
 SRC_URI:append:libc-musl ="\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
-- 
2.39.2


