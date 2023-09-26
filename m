Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D8AE7D0C4
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 19:43:58 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.696.1695757430770552410
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 12:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T9TOTOsm;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-690d2e13074so7463673b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 12:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695757430; x=1696362230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nRSsLDV3V31xgDCzUYajf6+KMC+V7Afq1wL159cmEzc=;
        b=T9TOTOsmNKgFBReGLCNIg5aePejdIo8oFzlMf3qSCGKfDezDXceclZWvXtdS2ZV7bW
         0khh+Xp6hpSeDdkmQ8jVWrjIU0dB4iw1jrUVMm6LNUyWip8IGGFAsm0ZS3iejeAybbCK
         vPv4OjY8aBIqEgR0fglO5iqE2sWLjJT+keMbvz7jVk7OaThxeS7L++cO7rRcscB9EvjB
         ooi6yTy2salYVpOD0Z5k6ECBd1INS7l1eqbcbr1Q7fwA2HleB8taQYJ79byPEAYQQmvB
         jtFPBMcA64z9I7QYBi+o3OSG8KldDSWR8ykxBIMiBGW7FxVcl9xAj9SUpVw/tI6lgJ7m
         dI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695757430; x=1696362230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nRSsLDV3V31xgDCzUYajf6+KMC+V7Afq1wL159cmEzc=;
        b=popN1r1soT/ScN+O0eyEllXz5BnfjK4hC0zt/4+56dHfZM4PneGwLaGH1S7qlpEv0v
         MWuLtApSyWxK/LPc98Ey6W8er06tJHhZkuE/wrTDxf8ihaRnxgwO6Exq5xpylCFgnynM
         Tj/pXi7L7O3vZ2nfb4bqPkcwP1saTTv6Sw9oIU3P3p5U5IEMbg9Dpx9HJmtmI/kY74LX
         3cTKRC62r/f0sSfeKD+bPNHJhQj9a1cBiZSgx2aJVfPIBHZg46lyWuP8l+Eysm6gz93G
         rE2HfNjagNPAGEJ4RFmhGwRYcwjw7EmiXJyLi+/luHTfm4zcOXfUd4dk+OHam2UdolF5
         J1EQ==
X-Gm-Message-State: AOJu0YxB/24Wbptdt1kFn3U69PJMwMBQ3Kdp3V/+C6wD8IqhUa+gblSs
	aUy8KYB0MGF3LMOx4oJGBz/wfGu5kuGmpw==
X-Google-Smtp-Source: AGHT+IEEvomaeZpwkZdHwXEI8GO26oIXwXrosnqMrnyglCTg3NDTnhCg2SRR9C1jgRQZ3kEDrY7f3w==
X-Received: by 2002:a05:6a20:d41b:b0:133:b3a9:90d with SMTP id il27-20020a056a20d41b00b00133b3a9090dmr7595105pzb.36.1695757429853;
        Tue, 26 Sep 2023 12:43:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id fb12-20020a056a002d8c00b00690c7552098sm8538302pfb.44.2023.09.26.12.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 12:43:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] cpp-netlib: Fix build with boost 1.80+
Date: Tue, 26 Sep 2023 12:43:46 -0700
Message-ID: <20230926194346.4138484-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 19:43:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105148

Update to latest on 0.13.0 release branch
Set PR to 0.13.0
Drop unused SRC_URI checksum

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...123040998744602f190944464af0e159ea19.patch | 30 +++++++++++++++++++
 .../cpp-netlib/cpp-netlib_git.bb              |  7 ++---
 2 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-support/cpp-netlib/cpp-netlib/a53f123040998744602f190944464af0e159ea19.patch

diff --git a/meta-oe/recipes-support/cpp-netlib/cpp-netlib/a53f123040998744602f190944464af0e159ea19.patch b/meta-oe/recipes-support/cpp-netlib/cpp-netlib/a53f123040998744602f190944464af0e159ea19.patch
new file mode 100644
index 0000000000..c93b76619c
--- /dev/null
+++ b/meta-oe/recipes-support/cpp-netlib/cpp-netlib/a53f123040998744602f190944464af0e159ea19.patch
@@ -0,0 +1,30 @@
+From a53f123040998744602f190944464af0e159ea19 Mon Sep 17 00:00:00 2001
+From: jjll <jjll@gmv.com>
+Date: Wed, 6 Sep 2023 20:47:41 +0200
+Subject: [PATCH] Compatibility with boost 1.83
+
+Upstream-Status: Backport [https://github.com/cpp-netlib/cpp-netlib/pull/902]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libs/network/src/server_request_parsers_impl.cpp | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+--- a/boost/network/protocol/http/server/impl/parsers.ipp
++++ b/boost/network/protocol/http/server/impl/parsers.ipp
+@@ -13,6 +13,7 @@
+ #include <tuple>
+ #include <boost/fusion/include/std_tuple.hpp>
+ #include <boost/network/protocol/http/message/header.hpp>
++#include <boost/regex/pending/unicode_iterator.hpp>
+ 
+ #ifdef BOOST_NETWORK_NO_LIB
+ #ifndef BOOST_NETWORK_INLINE
+@@ -32,7 +33,7 @@ typedef std::basic_string<uint32_t> u32_
+ template <>  // <typename Attrib, typename T, typename Enable>
+ struct assign_to_container_from_value<std::string, u32_string, void> {
+   static void call(u32_string const& val, std::string& attr) {
+-    u32_to_u8_iterator<u32_string::const_iterator> begin = val.begin(),
++    boost::u32_to_u8_iterator<u32_string::const_iterator> begin = val.begin(),
+                                                    end = val.end();
+     for (; begin != end; ++begin) attr += *begin;
+   }
diff --git a/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb b/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
index 3c271ae5d1..b2bdb86c0d 100644
--- a/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
+++ b/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
@@ -8,13 +8,13 @@ DESCRIPTION = "Modern C++ network programming libraries."
 SECTION = "libs"
 LICENSE = "BSL-1.0 & MIT & Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
+PV = "0.13.0"
 
+SRCREV = "31d304cdf52b485f465ada433d8905171b61cbff"
 SRC_URI = "\
     git://github.com/cpp-netlib/cpp-netlib.git;protocol=https;branch=0.13-release  \
+    file://a53f123040998744602f190944464af0e159ea19.patch \
 "
-SRC_URI[sha256sum] = "0b9255bb0668d89867a1f367d770f12d7038db4f5b6111774ef032f669cccad4"
-
-SRCREV = "ca95f04d140acf619892ee02a82e930dd91ff7d4"
 
 S = "${WORKDIR}/git"
 
@@ -23,4 +23,3 @@ inherit cmake pkgconfig
 DEPENDS = "zlib boost openssl"
 
 EXTRA_OECMAKE:append = " -DCPP-NETLIB_BUILD_TESTS=OFF -DCPP-NETLIB_BUILD_EXAMPLES=OFF"
-
-- 
2.42.0


