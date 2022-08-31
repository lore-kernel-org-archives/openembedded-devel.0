Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AB3C0502A
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 05:41:49 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.22019.1661924506334041682
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 22:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OiXKPil2;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id q9so12613285pgq.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 22:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=hNQ8q+ZZ2ybofM9DjVD5wKw9hMK/uRZMRk3kfCL+eok=;
        b=OiXKPil26PzVB83NyZbdwFbq0oWVBy4n/KBE+Wu5jHTfhL7IYE5Ib/7eDkp+xZB0Tk
         YaIdfJGoufCrQQl8syFOaWMGSMimOjSvpM41oiNkVQqjIbRgD5sw1N9tKvRtXK3jDMH+
         ILQa+wMB5j1O/0yeLVQFn7Vhz3j8CrqOX/WuaFD1YLeERKJXBuDrG30JF80E/S0jqjZQ
         eODb0fk5PA5xZ+zfpYieRmQ8UTpLusohuQURANnVrZyJm2GeQsXG2IjHCslG/JZ46nim
         eyGc0LqfXZAvZDKge0BfTAN/ZQ3KEy89GmcQbFSMuvTCUZdYdIVt4KbawNsGyQSobuQK
         BoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=hNQ8q+ZZ2ybofM9DjVD5wKw9hMK/uRZMRk3kfCL+eok=;
        b=3HaetmHxh+d8mlVCSg/4mYUipzB8dCn0AVSLOhiRFFo7rMRNmXJe8tjgjU/kl5AlOE
         dTbdy9d2t3PyTSml1XNQmD3eJ71DrjaBh5o8lBL18mDKXmv/E5EbHIJUFumm3ED7/WDj
         ZUMKy1fYdtCUbgUUK3adB7sgpH2I8SuO2NJJpqBS5vcCbvsMijl0CAXlIY+RH3vmgr7v
         i9b2g/XSvh2NNW3CQ2VykzvU4h/avzmS6SSARspDspRgxYFc7WLccVQBxHWT0WCzKS0D
         BWRvSM2+qEEefLkb0yalHzkmoVt0bGWpbr4GugLqF1r1OKjYonmxATQ9XzRZWRD+QgyD
         AAXw==
X-Gm-Message-State: ACgBeo17Ei0AjI+XaN5eMTDriIxUmNjnNIRzjEmD1Mg6fhuOkECSHgjl
	HBgzoLXCZi8NhPW6KHwP2sdv4GK4JQTS1A==
X-Google-Smtp-Source: 
 AA6agR4sZJMczkLKdtJb4WV5dEOQHFRF4ipRRl5NKyCi3TiHNxno2JJqIiXuOQTPb2qoE3TWBdtOCw==
X-Received: by 2002:a63:4750:0:b0:42b:609d:538a with SMTP id
 w16-20020a634750000000b0042b609d538amr20944478pgk.217.1661924505491;
        Tue, 30 Aug 2022 22:41:45 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 u4-20020a170902e80400b001733c13cc81sm7275181plg.169.2022.08.30.22.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 22:41:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/5] soci: Fix build with clang 15
Date: Tue, 30 Aug 2022 22:41:37 -0700
Message-Id: <20220831054139.3493726-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220831054139.3493726-1-raj.khem@gmail.com>
References: <20220831054139.3493726-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Aug 2022 05:41:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98572

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Do-not-use-std-shuffle-with-clang-15.patch | 32 +++++++++++++++++++
 meta-oe/recipes-dbs/soci/soci_4.0.3.bb        |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-dbs/soci/soci/0001-Do-not-use-std-shuffle-with-clang-15.patch

diff --git a/meta-oe/recipes-dbs/soci/soci/0001-Do-not-use-std-shuffle-with-clang-15.patch b/meta-oe/recipes-dbs/soci/soci/0001-Do-not-use-std-shuffle-with-clang-15.patch
new file mode 100644
index 0000000000..eb29627c6d
--- /dev/null
+++ b/meta-oe/recipes-dbs/soci/soci/0001-Do-not-use-std-shuffle-with-clang-15.patch
@@ -0,0 +1,32 @@
+From e5f72c656829402c6f70e7416039bc18f0c26485 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 30 Aug 2022 22:17:14 -0700
+Subject: [PATCH] Do not use std::shuffle with clang 15
+
+This fails to compile although its preferred approach for c++11 and
+newer
+
+See
+https://github.com/SOCI/soci/issues/984
+
+Upstream-Status: Inappropriate [Workaround]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cmake/SociConfig.cmake | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cmake/SociConfig.cmake b/cmake/SociConfig.cmake
+index 492e1837..f24fd9a6 100644
+--- a/cmake/SociConfig.cmake
++++ b/cmake/SociConfig.cmake
+@@ -94,6 +94,7 @@ else()
+     set(SOCI_CXX11 ON)
+     set(SOCI_CXX_VERSION_FLAGS "-std=c++11")
+     add_definitions(-DCATCH_CONFIG_CPP11_NO_IS_ENUM)
++    add_definitions(-DCATCH_CONFIG_CPP11_NO_SHUFFLE)
+ 
+     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${SOCI_GCC_CLANG_COMMON_FLAGS} ${SOCI_CXX_VERSION_FLAGS}")
+ 
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-dbs/soci/soci_4.0.3.bb b/meta-oe/recipes-dbs/soci/soci_4.0.3.bb
index ff47e5033e..71ab80c48a 100644
--- a/meta-oe/recipes-dbs/soci/soci_4.0.3.bb
+++ b/meta-oe/recipes-dbs/soci/soci_4.0.3.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 SECTION = "libs"
 DEPENDS = "boost"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BP}/${BP}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BP}/${BP}.tar.gz \
+           file://0001-Do-not-use-std-shuffle-with-clang-15.patch \
+           "
 SRC_URI[sha256sum] = "615e5f7e4b52007f3a3b4050a99aadf6346b56b5098eb08b3a650836083c6a33"
 
 TESTCONFIG = '-DSOCI_TEST_EMPTY_CONNSTR="dummy" -DSOCI_TEST_SQLITE3_CONNSTR="test.db" \
-- 
2.37.3


