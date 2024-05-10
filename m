Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A1BC41513
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 00:57:39 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.2226.1715302657847642810
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 17:57:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mVXltQre;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1ec69e3dbcfso12161215ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 17:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715302657; x=1715907457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DS3nBbr1wJ4XndT0Ht5MzUuHxeGfPcbMJNfE+1Ym1o=;
        b=mVXltQreNq7CICk/FurKRI9sq9D9y+yRQrHhKCzHEp3EHKclt7o4PGEMRQIE/IgvvY
         Yd7jRPsEaLDxguGUMSxal9ZCdrqkPUTvyDqSHNzLi0cShRQN3rjXNoLWADrOesF6Tr0o
         aC9giLd+0SFBACXVKPR/zGlJfh1RPBDjoIZO6mjhMsBZ6MKkVH5JV8h7kbyN7slb57jQ
         wXwc60iKzBbSDI/bNObCKUOM91RjVoDzCw9vuwMKOmWFsSN5Rd8ISff9hBqIpUZfrpwX
         pTf3nWzf9lp9NJKSF4TxxsPhgDzwn/OxIpKf8vxW57hutV+rN7k57VZbDGWKUY14Ae4Q
         PsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715302657; x=1715907457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8DS3nBbr1wJ4XndT0Ht5MzUuHxeGfPcbMJNfE+1Ym1o=;
        b=VmT59CfjCa2yhEC9iuV2pirj6oWF8ooKDgZtNsb3eI5QYjyOcBl4c03xRo3pt2jpKO
         A/ZcmxUSYuLpizdnVbAi++L4L50rv843P01bC+ViLhMlmpoJoTuCtubJSDfYmwEa6qJP
         VOeJ3PizBNGyHgigsNmpansO0eZIfXzcfalaE26lp9JAyOchKspipQUdrCbM8S5VV6W3
         xLrAvhTKR12l3/GnpfMspibWNU+IgBTV7ylrymI+FaolZ6f2IaOJ9pBtXVRZHF1nUTvs
         yuk9z7xPYet6RcrQF4a2ZDkCciDg+zMBRBs8Rni81kvJw7UDjuXzRT1msKVeHL/cvXrd
         NgXA==
X-Gm-Message-State: AOJu0Yxxv6MdX9vggix0ihVmj4RmOAGtE584xaXprGEJ5dENCe4lbnKc
	Ho+duSiUMSVGOFa54ZsWbZOMcJdUy2nV+NbofwoMasyehnMAyRooHu0/esDKe4U=
X-Google-Smtp-Source: AGHT+IGLaJEJNZGN7sP1ZMdx7X5lK0hv/Kq5g504p5J2kzhvg8uDPI9jE6EWdyBbigwFTmKXwDStJQ==
X-Received: by 2002:a17:902:a602:b0:1ed:a862:170f with SMTP id d9443c01a7336-1ef43d2e92dmr11691635ad.32.1715302657013;
        Thu, 09 May 2024 17:57:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f4db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13823asm20508605ad.263.2024.05.09.17.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 17:57:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] fluentbit: Upgrade to 1.9.9
Date: Thu,  9 May 2024 17:57:31 -0700
Message-ID: <20240510005731.2074507-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240510005731.2074507-1-raj.khem@gmail.com>
References: <20240510005731.2074507-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 May 2024 00:57:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110303

Disable incompatible-pointer-types warning as error to fix build
with gcc-14

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...xt-Do-not-use-private-makefile-target.patch | 18 ++++++------------
 .../{fluentbit_1.9.7.bb => fluentbit_1.9.9.bb} |  5 ++++-
 2 files changed, 10 insertions(+), 13 deletions(-)
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_1.9.7.bb => fluentbit_1.9.9.bb} (95%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Do-not-use-private-makefile-target.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Do-not-use-private-makefile-target.patch
index f5a1716c07..0cabed9633 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Do-not-use-private-makefile-target.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Do-not-use-private-makefile-target.patch
@@ -15,8 +15,6 @@ Upstream-Status: Pending [https://github.com/fluent/fluent-bit/issues/5492]
  lib/cmetrics/CMakeLists.txt | 7 +------
  3 files changed, 3 insertions(+), 17 deletions(-)
 
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 3dba5a8..d94b988 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -46,11 +46,7 @@ else()
@@ -32,8 +30,6 @@ index 3dba5a8..d94b988 100644
  
  if(${CMAKE_SYSTEM_PROCESSOR} MATCHES "armv7l")
    set(CMAKE_C_LINK_FLAGS "${CMAKE_C_LINK_FLAGS} -latomic")
-diff --git a/lib/chunkio/CMakeLists.txt b/lib/chunkio/CMakeLists.txt
-index bbe1f39..809ea93 100644
 --- a/lib/chunkio/CMakeLists.txt
 +++ b/lib/chunkio/CMakeLists.txt
 @@ -14,12 +14,7 @@ else()
@@ -50,21 +46,19 @@ index bbe1f39..809ea93 100644
  
  include(cmake/macros.cmake)
  
-diff --git a/lib/cmetrics/CMakeLists.txt b/lib/cmetrics/CMakeLists.txt
-index 60e8774..e3d6149 100644
 --- a/lib/cmetrics/CMakeLists.txt
 +++ b/lib/cmetrics/CMakeLists.txt
 @@ -34,12 +34,7 @@ set(CMT_VERSION_MINOR  3)
- set(CMT_VERSION_PATCH  5)
+ set(CMT_VERSION_PATCH  7)
  set(CMT_VERSION_STR "${CMT_VERSION_MAJOR}.${CMT_VERSION_MINOR}.${CMT_VERSION_PATCH}")
  
--# Define __FILENAME__ consistently across Operating Systems
+-# Define __CMT_FILENAME__ consistently across Operating Systems
 -if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
--  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__='\"$(subst ${CMAKE_SOURCE_DIR}/,,$(abspath $<))\"'")
+-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__='\"$(subst ${CMAKE_SOURCE_DIR}/,,$(abspath $<))\"'")
 -else()
--  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
+-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__=__FILE__")
 -endif()
-+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__=__FILE__")
  
  # Configuration options
- option(CMT_DEV             "Enable development mode"                   No)
+ option(CMT_DEV                       "Enable development mode"                   No)
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb
similarity index 95%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb
index fc06095475..ef04111131 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb
@@ -29,7 +29,7 @@ SRC_URI:append:libc-musl = "\
            file://0001-Use-posix-strerror_r-with-musl.patch \
            file://0002-chunkio-Link-with-fts-library-with-musl.patch \
            "
-SRC_URI[sha256sum] = "8ca2ac081d7eee717483c06608adcb5e3d5373e182ad87dba21a23f8278c6540"
+SRC_URI[sha256sum] = "3f6cd4bd1894cda16b465aef6ffec7e920d54c4209b3e2320fcffe7ae345700e"
 S = "${WORKDIR}/fluent-bit-${PV}"
 
 DEPENDS = "zlib bison-native flex-native openssl"
@@ -84,6 +84,9 @@ EXTRA_OECMAKE:append:x86 = " -DCMAKE_C_STANDARD_LIBRARIES=-latomic"
 
 CFLAGS:append:x86 = " -DMBEDTLS_HAVE_SSE2"
 
+# Fixes build with GCC-14
+CFLAGS += "-Wno-error=incompatible-pointer-types"
+
 inherit cmake systemd pkgconfig
 
 SYSTEMD_SERVICE:${PN} = "td-agent-bit.service"
-- 
2.45.0


