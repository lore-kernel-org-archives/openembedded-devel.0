Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D2DC6FA8C
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:54 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.11375.1662276880309196795
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BAMxlnmP;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id f24so5799811plr.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=j/5RuskJjL6jhcPVoSzYRcLyD8WsShZbxe4NDJTIzsE=;
        b=BAMxlnmPgSLmrupR9XZGBtKuxejIrFHojE1zHkgiqTVVPb7HefDAGKpiwMxBbukf/C
         Y4OkEvgxwhfqAddbMb6M0CjW39PNK/J0Xt+NTl5/sxNG4hjwBMYp1mHp/+eHD5rqk0o6
         s9fPn9gzaN7EgHRfebrV1M9CXfPX5SOjzw8RC7g2RZgvbkT9GjZd/dKgOstr/Ry2cz1C
         AcYv4iZ27jVQIsha4P80Ke1eQCea3pJpipPx/RpCKXSAax/4eDgAepzorlEF6CwqtSJ3
         +1leBGRy1lxV8XpOCxUiQDj1vpTTF6jAk/z1qffimkXX+iA3/yTqRQ5FSTrdXOoMf62A
         KQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=j/5RuskJjL6jhcPVoSzYRcLyD8WsShZbxe4NDJTIzsE=;
        b=V78UseQBkNRiTZH/CWILcO3SxnuCMvD5OoXwUXtm115P1HKNIH0fZoN3VB/4rn6kYq
         NSuU6wUEJyl83JEYISpD8yNrXC9yRvjAup6TC900NlXZRQF8rV6KqsB8iXIFcS5zfCsB
         Qy+xWJB+4GcYvGW8v3tlBWId95DpH3WlwWYHVeyGz3Ww0FAlY4sc/kc6GJ7MxJHKxPZV
         8bYdZFhvbkSLL5a4ZgdKqc1xq4wC9JkGoLSwY8TY8h43J5iVXweV5GRd5s5SQIdH38Ub
         TZ5DPwCoNspqtui/yw6LmDtSyq9xySWaqdzYMVI3yJ/eakEsLtraBFqsqtlYohpRhL8K
         ar/w==
X-Gm-Message-State: ACgBeo1Y2Eynz4GMoBPOtRzHJgbNnfxPlD2PImlBOhemV1+aUWVDova7
	Eeyckywb1peTBSOm/EVEcnzsf0LOEztChg==
X-Google-Smtp-Source: 
 AA6agR5/V6Q8xbzzczpQrwrupfGS1H2Fhdk4osLBs4FB27p6Ys07KAGs66zw5tNMbs2KZCb1/BwpdA==
X-Received: by 2002:a17:902:7d86:b0:170:a752:cbd1 with SMTP id
 a6-20020a1709027d8600b00170a752cbd1mr43375500plm.17.1662276888591;
        Sun, 04 Sep 2022 00:34:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 27/63] libcereal: Do not use
 uniform_int_distribution<char> template
Date: Sun,  4 Sep 2022 00:33:41 -0700
Message-Id: <20220904073417.3251865-27-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98621

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...se-int8_t-in-std-uniform_int_distrib.patch | 54 +++++++++++++++++++
 .../libcereal/libcereal_1.3.2.bb              |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-support/libcereal/files/0001-sandbox-Do-not-use-int8_t-in-std-uniform_int_distrib.patch

diff --git a/meta-oe/recipes-support/libcereal/files/0001-sandbox-Do-not-use-int8_t-in-std-uniform_int_distrib.patch b/meta-oe/recipes-support/libcereal/files/0001-sandbox-Do-not-use-int8_t-in-std-uniform_int_distrib.patch
new file mode 100644
index 0000000000..26a8223d19
--- /dev/null
+++ b/meta-oe/recipes-support/libcereal/files/0001-sandbox-Do-not-use-int8_t-in-std-uniform_int_distrib.patch
@@ -0,0 +1,54 @@
+From 36054278304945c6aef7d44e58788ca882c67d05 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 1 Sep 2022 15:54:13 -0700
+Subject: [PATCH] sandbox: Do not use int8_t in std::uniform_int_distribution
+
+Newer versions of libc++ has dropped supporting this usecase since its
+an UB see.
+
+https://reviews.llvm.org/D114920?id=400571
+
+Fixes
+
+uniform_int_distribution.h:162:5: error: static assertion failed due to requirement '__libcpp_random_is_valid_inttype<char>::value': IntType must be a supported integer type
+    static_assert(__libcpp_random_is_valid_inttype<_IntType>::value, "IntType must be a supported integer type");
+    ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libcereal/1.3.2+gitAUTOINC+ebef1e9298-r0/git/sandbox/performance.cpp:261:9: note: in instantiation of template class 'std::uniform_int_distribution<char>' requested here
+    c = std::uniform_int_distribution<char>(' ', '~')(gen);
+        ^
+/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libcereal/1.3.2+gitAUTOINC+ebef1e9298-r0/git/sandbox/performance.cpp:261:9: error: type 'std::uniform_int_distribution<char>' does not provide a call operator
+    c = std::uniform_int_distribution<char>(' ', '~')(gen);
+        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+2 errors generated.
+
+Upstream-Status: Submitted [https://github.com/USCiLab/cereal/pull/764]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sandbox/performance.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/sandbox/performance.cpp b/sandbox/performance.cpp
+index f9307870..aca8c78c 100644
+--- a/sandbox/performance.cpp
++++ b/sandbox/performance.cpp
+@@ -258,7 +258,7 @@ random_value(std::mt19937 & gen)
+ {
+   std::string s(std::uniform_int_distribution<int>(3, 30)(gen), ' ');
+   for(char & c : s)
+-    c = std::uniform_int_distribution<char>(' ', '~')(gen);
++    c = static_cast<char>( std::uniform_int_distribution<int>(' ', '~')(gen) );
+   return s;
+ }
+ 
+@@ -277,7 +277,7 @@ std::string random_binary_string(std::mt19937 & gen)
+ {
+   std::string s(N, ' ');
+   for(auto & c : s )
+-    c = std::uniform_int_distribution<char>('0', '1')(gen);
++    c = static_cast<char>( std::uniform_int_distribution<int>( '0', '1' )(gen) );
+   return s;
+ }
+ 
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
index 80c962ead4..5248b1e288 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
@@ -19,6 +19,7 @@ PROVIDES += "${PN}-dev"
 PV .= "+git${SRCPV}"
 SRCREV = "ebef1e929807629befafbb2918ea1a08c7194554"
 SRC_URI = "git://github.com/USCiLab/cereal.git;branch=master;protocol=https \
+           file://0001-sandbox-Do-not-use-int8_t-in-std-uniform_int_distrib.patch \
            file://run-ptest \
 "
 
-- 
2.37.3


