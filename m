Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93976C25B50
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:57 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.2064.1674324094311231906
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fbCDpRLK;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id m3-20020a17090a414300b00229ef93c5b0so7072497pjg.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYIH0P1UsYnlWBWpM4vNunz65KQ/kwfxZ4ZmlmYhsok=;
        b=fbCDpRLKUWiFiUkv5twZavT9YVo8PAcwp9nRMqhhGUNN1FBjmzUP0iYklIeJy7pmJR
         +Wq9VZb3uFEnAFyGY7hM195+14OQ6rDspNG9tHaKbwXtaY+VMbnGyePXTdqaR5bWZfll
         KzjFhSUuJcBbpHimOItOA9MfekeyDvL9PhWY/02BGRK1krbcIIAXjVTPuvkWi0MjMDwT
         O6IKtSWmxu9H+xTtm/75E0rDhvZxEqB0E2Zb8uB98HAvlguVlqSqB/FHmJH+nztE6TsB
         /cXfr/8sAs2G5VnW01IA6UdNy6H86nEnH6tXGZSlpMIpuaBamNGTpKa+qyQtS+aV0MRE
         sw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYIH0P1UsYnlWBWpM4vNunz65KQ/kwfxZ4ZmlmYhsok=;
        b=XecuWLspfSLE8EGewBgJvqcusu5McNkRH8FbX4sWRh6h7lZgf/qCa+kh+0roR0bSQ7
         0xBF3JFBb21rytY8ELBOK98Qqx94pIN3dUW6+p8zVI3RtqvlwJ0fylQRcJZXihnjWYL+
         +qMM05bYAEQ2ngvHGKEb40WLP97bbUkE8hYoWkVEEW6BtrsG/WtZ0Jd7+guAT5gj5IkG
         U3J6NbHJEHD6vEYGxS1WMRxoxzeGZgf/hdY0eUWRww1bAj/4HJ87ZJjBRslzJXXlmkZh
         nBXTukiFUFgPZYqwtzHQUKSturHuopkK/EWs8cskm4CUCLTB2mlbGaM9AWF+TL9KpjRg
         4Iuw==
X-Gm-Message-State: AFqh2koxb7wA8PMO/XgmJX0Ztc4vU8vRLPCLefB4NVTHtXh1z119nTne
	Tx6uJEqzB2RLSVhCapydU0KLopCpQKaHCQ==
X-Google-Smtp-Source: AMrXdXu8RmKdlrCcpMFqJELMWMvNpIF45UUPn7zHpGwGBqeTof2wH+TUUu+UQvN7WkvyE5zBilV8cg==
X-Received: by 2002:a17:90b:1d81:b0:22b:b51a:5652 with SMTP id pf1-20020a17090b1d8100b0022bb51a5652mr5963446pjb.26.1674324107440;
        Sat, 21 Jan 2023 10:01:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 29/30] libcereal: Use -idirafter instead of -isystem
Date: Sat, 21 Jan 2023 10:01:20 -0800
Message-Id: <20230121180121.1229895-29-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100696

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ake-Use-idirafter-instead-of-isystem.patch | 52 +++++++++++++++++++
 .../libcereal/libcereal_1.3.2.bb              |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-support/libcereal/files/0001-cmake-Use-idirafter-instead-of-isystem.patch

diff --git a/meta-oe/recipes-support/libcereal/files/0001-cmake-Use-idirafter-instead-of-isystem.patch b/meta-oe/recipes-support/libcereal/files/0001-cmake-Use-idirafter-instead-of-isystem.patch
new file mode 100644
index 0000000000..fc30f0ad7c
--- /dev/null
+++ b/meta-oe/recipes-support/libcereal/files/0001-cmake-Use-idirafter-instead-of-isystem.patch
@@ -0,0 +1,52 @@
+From ac70933783a70d5387a2bb2849c568e33ba52558 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 21 Jan 2023 01:41:32 -0800
+Subject: [PATCH] cmake: Use -idirafter instead of -isystem
+
+isystem dirs are searched before the regular system dirs
+this exposes an interesting include ordering problem when using
+clang + libc++, when including C++ headers like <cstdlib>
+
+cstdlib includes stdlib.h and in case of libc++, this should be coming
+from libc++ as well, which is then eventually including system stdlib.h
+
+libc++ has added a check for checking this order recently, which means
+if cstlib ends up including system stdlib.h before libc++ provided
+stdlib.h it errors out
+
+| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/libcereal/1.3.2+gitAUTOINC+ebef1e9298-r0/recipe-sysroot/usr/include/c++/v1/cwchar:113:5: error: <cwchar> tried including <wchar.h> but didn't find libc++'s <wcha
+r.h> header.           This usually means that your header search paths are not configured properly.           The header search paths should contain the C++ Standard Library headers before           any C Standard
+ Library, and you are probably using compiler flags that make that           not be the case.                                                                                                                         | #   error <cwchar> tried including <wchar.h> but didn't find libc++'s <wchar.h> header. \
+|     ^
+
+The reason is that include_directories with SYSTEM property adds the
+directory via -system and some of these directories point to sysroot
+e.g. OPENSSL_INCLUDE_DIR which ends up adding -isystem
+<sysroot>/usr/include and causes the system stdlib.h to included before
+libc++ stdlib.h
+
+A fix is to use -idirafter which preserved the effects of system headers
+but instead of prepending, it will append to system headers and the
+issue is addressed
+
+Upstream-Status: Submitted [https://github.com/USCiLab/cereal/pull/777]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ unittests/boost/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/unittests/boost/CMakeLists.txt b/unittests/boost/CMakeLists.txt
+index 1d733bc7..08e6a169 100644
+--- a/unittests/boost/CMakeLists.txt
++++ b/unittests/boost/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ file(GLOB TESTS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.cpp)
+ 
+-include_directories(SYSTEM ${Boost_INCLUDE_DIRS})
++set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${Boost_INCLUDE_DIRS}")
+ 
+ # Build all of the non-special tests
+ foreach(TEST_SOURCE ${TESTS})
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
index a40d2bc2e6..f15927554b 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
@@ -20,6 +20,7 @@ PV .= "+git${SRCPV}"
 SRCREV = "ebef1e929807629befafbb2918ea1a08c7194554"
 SRC_URI = "git://github.com/USCiLab/cereal.git;branch=master;protocol=https \
            file://0001-sandbox-Do-not-use-int8_t-in-std-uniform_int_distrib.patch \
+           file://0001-cmake-Use-idirafter-instead-of-isystem.patch \
            file://run-ptest \
 "
 
-- 
2.39.1


