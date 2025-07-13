Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65CC3C83F1D
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 09:49:12 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.53962.1752400146850008356
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Jul 2025 02:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=VIaP9sbk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202507130949046f1d72e83537fb5a29-_b7pfd@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202507130949046f1d72e83537fb5a29
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 13 Jul 2025 11:49:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=32yTYeiHdDsF3M+adUUVY7F68GwYR5cn+Ao077MKAhk=;
 b=VIaP9sbkOtSJOms3fORs8LMbcvaBrDeBiuNmAQrfFUgQfDWEavuPlYMuK22QnOAZru+qXv
 MXgxtRBRRDgw8A9AmjwinqAqM4poxDtsJNAH8XqyA78E7WYOk7ksk3xRxYM1cObAgzpkjhkI
 kyhnFMlj2/DZ0n0BIuoBGUnIGnIdLCKontHJfPc2mtdx70jAYFHzzU8nlOTLkUhWuF2UJU7X
 V1AOJebTJc3+EVdTzZYLmMi4iwFvJ3jOwJhr6EqBg9lYiJEiJRj/qpi8WM0ixmcN7M8HmIn1
 srUvrHYWa/OAiOYJeGYTwKpH1Z+B1cC8dYFQgGUjnxzs1eNv3iyByzmg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH 1/2] poco: ignore additional failing tests
Date: Sun, 13 Jul 2025 11:48:11 +0200
Message-Id: <20250713094812.502038-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 09:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118505

From: Peter Marko <peter.marko@siemens.com>

These tests are failing and thus preventing verification of new patches.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...nx-Ignore-PKCS12-and-testLaunch-test.patch | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch b/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch
index f70e8bcc74..5e588429fe 100644
--- a/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch
+++ b/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch
@@ -40,18 +40,31 @@ There were 4 failures:
   Not found: POCO_BASE"
   │ │ in "<unknown>", line -1
 
+There was 1 error:
+ 1: CppUnit::TestCaller<CryptoTest>.testEncryptDecryptGCM
+    "Poco::IOException:
+I/O error: error:1C800066:Provider routines::cipher operation failed"
+    in "<unknown>", line -1
+
+There was 1 error:
+ 1: CppUnit::TestCaller<HTTPSClientSessionTest>.testInterop
+    "Poco::Net::DNSException:
+DNS error: Temporary DNS error while resolving: secure.appinf.com"
+    in "<unknown>", line -1
+
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---
- cppignore.lnx | 9 +++++++++
- 1 file changed, 9 insertions(+)
+ cppignore.lnx | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
 
 diff --git a/cppignore.lnx b/cppignore.lnx
 index 2c2376526..65df4af08 100644
 --- a/cppignore.lnx
 +++ b/cppignore.lnx
-@@ -28,3 +28,12 @@ CppUnit::TestCaller<HTTPSClientSessionTest>.testProxy
+@@ -28,3 +28,14 @@ CppUnit::TestCaller<HTTPSClientSessionTest>.testProxy
  CppUnit::TestCaller<HTTPSStreamFactoryTest>.testProxy
  CppUnit::TestCaller<DNSTest>.testHostByAddress
  CppUnit::TestCaller<DNSTest>.testHostByName
@@ -64,3 +77,5 @@ index 2c2376526..65df4af08 100644
 +CppUnit::TestCaller<PKCS12ContainerTest>.testCertsOnlyPKCS12
 +CppUnit::TestCaller<PKCS12ContainerTest>.testPEMReadWrite
 +CppUnit::TestCaller<MongoDBTest>.testArray
++CppUnit::TestCaller<CryptoTest>.testEncryptDecryptGCM
++CppUnit::TestCaller<HTTPSClientSessionTest>.testInterop

