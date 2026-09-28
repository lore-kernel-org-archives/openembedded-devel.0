Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DECECA5FA1
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:57:17 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64922.1790618235879803013
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p+JQza72;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so1789298a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 10:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790618235; x=1791223035; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZwRHIWr6x51eCNwZCKOaTXCYr+28COQeONNGZqMKOc=;
        b=p+JQza72maGr4y61pAV3oaqUFWRDzBiA31aoHwST7l5Tqruo4N1JWxR7FNbwlWZm3r
         efse8YvNKGf2kE88L7EKqeXcimdRu1S4Aq0g0CqMpclRe0ol83d2N3uzli0Bg3t38e7H
         KM3XzAu7qHTS7/8Gi9ltchPA8j2mkJHt7TooW4BL10QyxoACMw9ashguVEFUt+celHYH
         0lYlTYqTodFAJV1I3fFRTqXDFjZmNbuqEE3XgbiDAczz0v38CEdyLCAJsX2g3CfeWMko
         3dceQXmHQyIHzPsbC5oOsxgXAeSGYGUW1bXJD3FSZl856U+/nY3S+mJHi5AACVS98ItK
         YOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618235; x=1791223035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AZwRHIWr6x51eCNwZCKOaTXCYr+28COQeONNGZqMKOc=;
        b=K9HlnGXpg0TldtnzUziqhuFe3f5NYlG+DbbtF5qPeudGZwFb/rjiB7umxjfNzds1zX
         tOt0M2Ul+j8S8FHLPCdB8Fos5waE5qxY4nslYAX6aErg7CU1ZsRSp6T4YzXNCVcLK7h0
         lt6hD1jx/hwU08/2oM+QCNFsLH6+BwlJU6ldA3sgT8bCUiOKQbpGp8h6r8wiFM+8IgS7
         I6XN7ch/+KF6gj+YCKdE9qQxtoY9hvkzeoZorw6WxxjvK3O0HW+KSyyZAEMgg3y2f8Al
         nrksSj7DWgewFXJmeDSroF/VB42E+U2fmRPGWrb3y5SSVK3xOB4T8flVW73euQAdYd3x
         aIuQ==
X-Gm-Message-State: AFq9FYLIRYDLk99RKG5gH40gfu6pDLefOaXJfKU6oCjl+2PBIO51eqdS
	Zt5/3UblMSffltVwrL+s8aLglmkn+IQrvyQXNOMXX1yxhsCur4lhzme8n6rDQQ==
X-Gm-Gg: AYBFou01nntCtSlpRGTjS9bnNLz7LT4NVbF3zRg/UsO1qIvkRjEQpcoT25SeajKDkaA
	xfowqVT1x08gFVYQF5cxgb5K+c3Th91tu1IUa/dh1sQ26Z0BX9DjQQ9JnSyr1YfmkBxG3VBAulQ
	ZWEkmdO95g3gRvJZYMzEIMqJG8UlJdI+l8DWCt9Q+eGkD5yoNLlxg9KxlhgFQ4uXMAzolP7k+73
	P3Cb1uXgv8Mj8kXH0Snv5mWTYsC7JQFQLnCwBGAk0pEDm6fX2JE/DT3iIOpo7GvgPKTsR6vZVeg
	arEkk/Fx4wx+WzU9d2WiWGP9025hh12zJvMegV85tDJhIB6EgSSr2AXAWCte5TijVkq2oH0kKPM
	NY9gTRptnSMS8AEOg4Q26knsJ1KXCQXW0z61sitUGjNXhfR2lQ9tik1Yi3gIR2CvXKF7fEhlNtA
	dTEg8lY6upolzHBmyAIhFd1n67id6re6Yl9WV1BVpi+9PxBGJH+O8QvQyxju7FtSl3UyVcRQyGp
	fIS7DCX9eVppcBXQhD1N8s=
X-Received: by 2002:a17:90b:1b06:b0:3a0:8133:69a0 with SMTP id 98e67ed59e1d1-3a098b93cb8mr11674724a91.14.1790618235088;
        Mon, 28 Sep 2026 10:57:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4986a1905sm577182a91.13.2026.09.28.10.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:57:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 6/8] poco: upgrade 1.15.3 -> 1.15.4
Date: Tue, 29 Sep 2026 06:56:54 +1300
Message-ID: <20260928175656.3501512-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928175656.3501512-1-ankur.tyagi85@gmail.com>
References: <20260928175656.3501512-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 17:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130466

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Refreshed patches for the new version.

Behaviour changes:
- client contexts created from the SSLManager configuration verify the host
  name by default
- FTPSClientSession no longer falls back to plaintext when the server
  refuses TLS, unless allowPlaintextFallback() is called
- HTTP requests with duplicate or conflicting framing headers are rejected
- URIStreamOpener and HTTPSStreamFactory follow redirects only to http and
  https.

Changelog:
https://github.com/pocoproject/poco/releases/tag/poco-1.15.4-release

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...pignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch | 10 +++-------
 .../0002-DataTest-disable-testSQLChannel-test.patch    | 10 +++++-----
 .../0003-quill-rdtsc-fallback-for-32-bit-powerpc.patch |  6 ++----
 .../poco/{poco_1.15.3.bb => poco_1.15.4.bb}            |  4 ++--
 4 files changed, 12 insertions(+), 18 deletions(-)
 rename meta-oe/recipes-support/poco/{poco_1.15.3.bb => poco_1.15.4.bb} (97%)

diff --git a/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch b/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch
index f8eadb3ee6..9ac1f6419d 100644
--- a/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch
+++ b/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch
@@ -1,10 +1,7 @@
-From 6b1123b313e439d8bfae3570a3e541b3aa26f3ad Mon Sep 17 00:00:00 2001
+From ca21bd382833ff40d19487bf395b4d33b7e1280a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 16 Sep 2023 19:52:56 -0700
 Subject: [PATCH] cppignore.lnx: Ignore PKCS12 and testLaunch test
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
 
 These tests fail on Linux
 
@@ -15,16 +12,15 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
 
 Updated comment and content after fixing some tests.
 Left only MongoDBTest.testArray on ignore list, untested.
-
 ---
  cppignore.lnx | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/cppignore.lnx b/cppignore.lnx
-index b3288d474..9aad48ca5 100644
+index cf779418c..1d7e2670a 100644
 --- a/cppignore.lnx
 +++ b/cppignore.lnx
-@@ -35,3 +35,4 @@ CppUnit::TestCaller<HTTPSClientSessionTest>.testProxy
+@@ -34,3 +34,4 @@ CppUnit::TestCaller<HTTPSClientSessionTest>.testProxy
  CppUnit::TestCaller<HTTPSStreamFactoryTest>.testProxy
  CppUnit::TestCaller<DNSTest>.testHostByAddress
  CppUnit::TestCaller<DNSTest>.testHostByName
diff --git a/meta-oe/recipes-support/poco/poco/0002-DataTest-disable-testSQLChannel-test.patch b/meta-oe/recipes-support/poco/poco/0002-DataTest-disable-testSQLChannel-test.patch
index 38028c1cf8..303940a95e 100644
--- a/meta-oe/recipes-support/poco/poco/0002-DataTest-disable-testSQLChannel-test.patch
+++ b/meta-oe/recipes-support/poco/poco/0002-DataTest-disable-testSQLChannel-test.patch
@@ -1,4 +1,4 @@
-From 0a8c7e5e074c124c2d5e5713fc3038295324cf96 Mon Sep 17 00:00:00 2001
+From 4ec73803526588522f60320ad87177235c64a19b Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Thu, 4 Sep 2025 22:27:26 +0200
 Subject: [PATCH] DataTest: disable testSQLChannel test
@@ -12,15 +12,15 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Data/testsuite/src/DataTest.cpp b/Data/testsuite/src/DataTest.cpp
-index e18b87edc..60fd266c3 100644
+index e730cbe24..e4d56b2f6 100644
 --- a/Data/testsuite/src/DataTest.cpp
 +++ b/Data/testsuite/src/DataTest.cpp
-@@ -1659,7 +1659,7 @@ CppUnit::Test* DataTest::suite()
+@@ -1778,7 +1778,7 @@ CppUnit::Test* DataTest::suite()
  	CppUnit_addTest(pSuite, DataTest, testExternalBindingAndExtraction);
  	CppUnit_addTest(pSuite, DataTest, testTranscode);
  	CppUnit_addTest(pSuite, DataTest, testSQLParse);
 -	CppUnit_addTest(pSuite, DataTest, testSQLChannel);
 +	//CppUnit_addTest(pSuite, DataTest, testSQLChannel);
  	CppUnit_addTest(pSuite, DataTest, testNullableExtract);
- 
- 	return pSuite;
+ 	CppUnit_addTest(pSuite, DataTest, testTransactionAutoCommit);
+ 	CppUnit_addTest(pSuite, DataTest, testExecuteDirectNotImplemented);
diff --git a/meta-oe/recipes-support/poco/poco/0003-quill-rdtsc-fallback-for-32-bit-powerpc.patch b/meta-oe/recipes-support/poco/poco/0003-quill-rdtsc-fallback-for-32-bit-powerpc.patch
index 293321bfa8..ac9e103bef 100644
--- a/meta-oe/recipes-support/poco/poco/0003-quill-rdtsc-fallback-for-32-bit-powerpc.patch
+++ b/meta-oe/recipes-support/poco/poco/0003-quill-rdtsc-fallback-for-32-bit-powerpc.patch
@@ -1,4 +1,4 @@
-From dce2cc2886a9097971856e69737cc5c05c9239ea Mon Sep 17 00:00:00 2001
+From 5e149e9e9948ecf6dffdb7f48d56b01d262990fd Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Wed, 8 Apr 2026 10:54:25 +0200
 Subject: [PATCH] quill: use soft rdtsc fallback on 32-bit PowerPC
@@ -19,7 +19,7 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dependencies/quill/include/quill/core/Rdtsc.h b/dependencies/quill/include/quill/core/Rdtsc.h
-index 3d0ae9f26..67f26cb89 100644
+index 10394c585..bbf1797ae 100644
 --- a/dependencies/quill/include/quill/core/Rdtsc.h
 +++ b/dependencies/quill/include/quill/core/Rdtsc.h
 @@ -95,7 +95,7 @@ QUILL_NODISCARD QUILL_ATTRIBUTE_HOT inline uint64_t rdtsc() noexcept
@@ -31,5 +31,3 @@ index 3d0ae9f26..67f26cb89 100644
  QUILL_NODISCARD QUILL_ATTRIBUTE_HOT inline uint64_t rdtsc() noexcept
  {
    // soft failover
--- 
-2.47.2
diff --git a/meta-oe/recipes-support/poco/poco_1.15.3.bb b/meta-oe/recipes-support/poco/poco_1.15.4.bb
similarity index 97%
rename from meta-oe/recipes-support/poco/poco_1.15.3.bb
rename to meta-oe/recipes-support/poco/poco_1.15.4.bb
index ed236f7a5c..f4c572d4ae 100644
--- a/meta-oe/recipes-support/poco/poco_1.15.3.bb
+++ b/meta-oe/recipes-support/poco/poco_1.15.4.bb
@@ -8,13 +8,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
 # These dependencies are required by Foundation
 DEPENDS = "libpcre2 utf8proc zlib"
 
-SRC_URI = "git://github.com/pocoproject/poco.git;branch=poco-1.15.3;protocol=https;tag=poco-${PV}-release \
+SRC_URI = "git://github.com/pocoproject/poco.git;branch=poco-${PV};protocol=https;tag=poco-${PV}-release \
            file://0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch \
            file://0002-DataTest-disable-testSQLChannel-test.patch \
            file://0003-quill-rdtsc-fallback-for-32-bit-powerpc.patch \
            file://run-ptest \
            "
-SRCREV = "e8c711ce5a58006272b3950c293eb92c849caea3"
+SRCREV = "6a5667f432e1c5fe5591025ab03a2f8df37116b4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
 

