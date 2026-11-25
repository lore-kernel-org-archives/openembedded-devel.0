Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37926.1795594066750028598
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:07:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=fOW/7nMl;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38190551625so10923869eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594066; x=1796198866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uZyuzdYUJ4WxmBTbLpRT5E43CJ1FtJ94WgzjYja9v2A=;
        b=fOW/7nMlhMXFpO6Ww7oPAmzxhvaR18ftbPFcuFV1guhlgCjTsrL964cYjZsy104W8h
         Zxvt6oyUiILgvMvIXRRBl1JPmbRc8k1qTx6zitfVtfM2L+dqbKE+ZiiIdGA32NbQd9EG
         60oDeY0J26gHI//TzE6bH5PK3MuxDjU0kjDb0TaYHCd+63jzvoEJIe/AbNSRGokKtf4d
         Yqgu1FTLEdG7CPenJZvCyVSVG5BrCK5wFqLZAQj1H0ADRziz6p2uYGNd1IIosGkEL6ve
         Ehq1NcJOXbQE5PrXp76pHJPx6vNhmcXjNvDMp6y2KRnsYcUti9ep20Pe9JqYoJ4A5ecL
         V3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594066; x=1796198866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uZyuzdYUJ4WxmBTbLpRT5E43CJ1FtJ94WgzjYja9v2A=;
        b=vo5qVcvJEGbVSLt4LpFETJCJ0neU8ntXsVl49i8GoEiHEZ2hhMHRzlYQLyJCTcjfVd
         8aMnCHmzsIwlwIMfDiEKsMxKkqTLya0GN2q8V2KjAad6ZboCisCa34DGvk6PcaMKFSef
         HZaQ84wGORWrW9h47WaBODhUG0i1rJtn75P3l0JGWrla37PQE/BhKbBmjcqrPzgoHrSG
         i+E2SA9H2p4YiDd9vK1TQ7KB+YaXqIbjbfQDVhQJk/KN9RaCNxMiHdnODAweKN0mKdPM
         NUd6Epq6STQSVrJjne+4kPaU+N/iZtUibOq9mNHv0uKqH571wumy7otf6LRYuXrfLJXV
         AHgw==
X-Gm-Message-State: APuU4Z/J7GxPeFJIutHQo166isYshHxxBcIDIJNTWsxmwv0Un9Qw1pEq
	sfyiDL/E9NAynlPigVWeOHpVMJpP/m4zXR6FTb5CAFOU/5XNb0TypNivNCQRWdJA
X-Gm-Gg: AZFdTZcAzceG/fItq108dR+wqFBDpgHBCDOnOAxl87ksDDvxi7vT95X1Jj63yhT25Ax
	ofqCAlXE9BqwT/UshZs96MvO/MQGYSIfQD48B6zWzBExUiPR6f15zFuX3WhfiNAmGziXcrj/lpj
	4spTlusJBF77ceaJ7TTQlz6FJIJNTdnwFqwiXqOTOSu6utk6PN31vAWgE9BdMPi/5mDgnF/r8Ri
	GI7ysb6ToxO7qURIfeeZY4Huo21JKWuzCR6pKqm83QekGDPF04E44zQcBxxLVWbwo3hLqqXQWTs
	+Ibx/hSwUzexE9CNjyVQH2YSjhTt+cnb5kXGESAYYEoCkj79QgEzN17AsyfN9fU8mhzJkMZcn5g
	sCS42jfIKFg0j01dUFiwT3PlLMrYSIaJIZAiQgkFtFN1jprLXTanjJXFfJ1rBQf2faqUFNvGns1
	DCYi2urojecNNPwnWj5Roguq0lwuixusc5G3Mogrt47080Td5cyOksY3TvJaick/PZiyMqiJJ/F
	ZKk6E0sk0mfZ/G7WjSG9t1Dzz2pUiEvVsnCZbTCyvs04HwhFg5ts6CESvnWFUDEppAu5/Sqp4q7
	XE2ZGxy3eGisg36uAeWgPUExeEU2VMAc7Y8sEoFH/qVUb1ImpwmRfypx2NDxEdLxZywQiVa0+YT
	R5SIODwkYs7o0dD2bxKWV2I86BKyQfXYBfF9UauybJVWBpHzYES4Vyg6U+qmsPEllp22JgTr3Jh
	uBjIH0IMRD3e7cFD47QRFXBeyUJD7FehM6mnGEhjJYM6EacIx5g1p9xTYfloEkNEgJ9+A6A1lQ9
	NGOolfR/VK1q4bc7wWgExRHQln8BmxppAAFh3UwBY5UYpXGHi5v9GOtB+ukL+3jBviVRRHaT5Oe
	lt9P9A==
X-Received: by 2002:a05:693c:8850:b0:386:b351:d5eb with SMTP id 5a478bee46e88-386b351dcddmr7526839eec.7.1795594065986;
        Wed, 25 Nov 2026 00:07:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:07:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 01/55] sdbus-c++: Fix flaky integration tests on slow machines
Date: Wed, 25 Nov 2026 00:06:17 -0800
Message-ID: <20261125080732.2419614-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133004
Content-Type: text/plain; charset="utf-8"

sdbus-c++-integration-tests fails intermittently in the ptest image on
qemuarm64 (qemu TCG, no KVM) when the build host is busy running other
testimage tasks:

- CallsMethodWithLargeArgument sends ~30 MB in one method call with the
  default 25 second D-Bus timeout. That takes 13-16 s on an idle qemu
  and 40-50 s under load, so it fails with
  org.freedesktop.DBus.Error.Timeout. Use a 120 second timeout.

- ThrowsTimeoutErrorWhen{Method,ClientSideAsyncMethod}TimesOut require
  the timeout error within 50 ms; under load it took up to 57 ms.
  Allow 500 ms, still well below the 1 s operation the tests time out.

With both patches, 10 repeats of the integration tests under heavy
host and guest CPU contention pass; without them 4 of 10 failed.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...er-timeout-for-the-large-argument-me.patch | 40 ++++++++++++++
 ...measured-timeout-bound-in-timeout-te.patch | 52 +++++++++++++++++++
 .../recipes-core/sdbus-c++/sdbus-c++_2.3.1.bb |  2 +
 3 files changed, 94 insertions(+)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++/0002-tests-Use-a-longer-timeout-for-the-large-argument-me.patch
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++/0003-tests-Relax-the-measured-timeout-bound-in-timeout-te.patch

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++/0002-tests-Use-a-longer-timeout-for-the-large-argument-me.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++/0002-tests-Use-a-longer-timeout-for-the-large-argument-me.patch
new file mode 100644
index 0000000000..5737a4a88b
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++/0002-tests-Use-a-longer-timeout-for-the-large-argument-me.patch
@@ -0,0 +1,40 @@
+From 1c000e89c9a1ebe914ef8a581de7a2fbab629fd9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 31 Oct 2026 10:45:54 -0700
+Subject: [PATCH 1/2] tests: Use a longer timeout for the large argument method
+ call
+
+CallsMethodWithLargeArgument sends a map of 400000 strings (about 30 MB)
+in one synchronous method call with the default 25 second D-Bus method
+call timeout. Marshalling, transferring and unmarshalling that much data
+takes 13-16 seconds on an idle emulated (qemu TCG) aarch64 machine and
+more than 40 seconds when the host is busy, so the test fails with
+org.freedesktop.DBus.Error.Timeout.
+
+Call the method with an explicit 120 second timeout instead.
+
+Upstream-Status: Submitted [https://github.com/Kistler-Group/sdbus-cpp/pull/564]
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/integrationtests/DBusMethodsTests.cpp | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/tests/integrationtests/DBusMethodsTests.cpp b/tests/integrationtests/DBusMethodsTests.cpp
+index 345cf4e..3066317 100644
+--- a/tests/integrationtests/DBusMethodsTests.cpp
++++ b/tests/integrationtests/DBusMethodsTests.cpp
+@@ -309,7 +309,12 @@ TYPED_TEST(SdbusTestObject, CallsMethodWithLargeArgument)
+         //totalSize += sizeof(int) + collection[i].size();
+     }
+     //printf("Sending large message with collection of size %zu bytes\n", totalSize);
+-    this->m_proxy->sendLargeMessage(collection);
++    // Marshalling and transferring ~30 MB takes long on slow (e.g. emulated) machines,
++    // so don't let the call run into the default 25s method call timeout
++    this->m_proxy->getProxy().callMethod("sendLargeMessage")
++                             .onInterface("org.sdbuscpp.integrationtests")
++                             .withTimeout(120s)
++                             .withArguments(collection);
+ }
+ 
+ TYPED_TEST(SdbusTestObject, CanSendCallsAndReceiveRepliesWithLargeData)
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++/0003-tests-Relax-the-measured-timeout-bound-in-timeout-te.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++/0003-tests-Relax-the-measured-timeout-bound-in-timeout-te.patch
new file mode 100644
index 0000000000..5a31c197d8
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++/0003-tests-Relax-the-measured-timeout-bound-in-timeout-te.patch
@@ -0,0 +1,52 @@
+From 623714493ba8144b38be6157f55e32acb0e51021 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 31 Oct 2026 11:37:50 -0700
+Subject: [PATCH 2/2] tests: Relax the measured timeout bound in timeout tests
+
+ThrowsTimeoutErrorWhenMethodTimesOut and
+ThrowsTimeoutErrorWhenClientSideAsyncMethodTimesOut call a method that
+takes 1 second with a 1 microsecond timeout, and then assert that the
+timeout error arrived within 50 ms. On an emulated (qemu TCG) aarch64
+machine with a busy host this takes longer, e.g.
+
+  Value of: measuredTimeout
+  Expected: is <= 0.05s
+    Actual: 0.0567641s
+
+Allow 500 ms instead. That is still well below the 1 second the operation
+takes, so the tests still check that the client side timeout fired.
+
+Upstream-Status: Submitted [https://github.com/Kistler-Group/sdbus-cpp/pull/564]
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/integrationtests/DBusAsyncMethodsTests.cpp | 2 +-
+ tests/integrationtests/DBusMethodsTests.cpp      | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/integrationtests/DBusAsyncMethodsTests.cpp b/tests/integrationtests/DBusAsyncMethodsTests.cpp
+index 14942ba..ea05c3e 100644
+--- a/tests/integrationtests/DBusAsyncMethodsTests.cpp
++++ b/tests/integrationtests/DBusAsyncMethodsTests.cpp
+@@ -82,7 +82,7 @@ TYPED_TEST(AsyncSdbusTestObject, ThrowsTimeoutErrorWhenClientSideAsyncMethodTime
+         ASSERT_THAT(e.getName(), AnyOf("org.freedesktop.DBus.Error.Timeout", "org.freedesktop.DBus.Error.NoReply"));
+         ASSERT_THAT(e.getMessage(), AnyOf("Connection timed out", "Method call timed out"));
+         auto measuredTimeout = std::chrono::steady_clock::now() - start;
+-        ASSERT_THAT(measuredTimeout, Le(50ms));
++        ASSERT_THAT(measuredTimeout, Le(500ms)); // Well below the 1s operation time, with headroom for slow (e.g. emulated) machines
+     }
+     catch(...)
+     {
+diff --git a/tests/integrationtests/DBusMethodsTests.cpp b/tests/integrationtests/DBusMethodsTests.cpp
+index 3066317..695d797 100644
+--- a/tests/integrationtests/DBusMethodsTests.cpp
++++ b/tests/integrationtests/DBusMethodsTests.cpp
+@@ -197,7 +197,7 @@ TYPED_TEST(SdbusTestObject, ThrowsTimeoutErrorWhenMethodTimesOut)
+         ASSERT_THAT(e.getName(), AnyOf("org.freedesktop.DBus.Error.Timeout", "org.freedesktop.DBus.Error.NoReply"));
+         ASSERT_THAT(e.getMessage(), AnyOf("Connection timed out", "Operation timed out", "Method call timed out"));
+         auto measuredTimeout = std::chrono::steady_clock::now() - start;
+-        ASSERT_THAT(measuredTimeout, Le(50ms));
++        ASSERT_THAT(measuredTimeout, Le(500ms)); // Well below the 1s operation time, with headroom for slow (e.g. emulated) machines
+     }
+     catch(...)
+     {
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.3.1.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.3.1.bb
index b752025dd4..276132273d 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.3.1.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.3.1.bb
@@ -19,6 +19,8 @@ DEPENDS += "expat"
 SRCREV = "ca073434d2c03c2b619f7e23f285cebbf32c7e46"
 SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master;tag=v${PV} \
            file://0001-test-Fix-error-factory-test-for-musl-libc-compatibil.patch \
+           file://0002-tests-Use-a-longer-timeout-for-the-large-argument-me.patch \
+           file://0003-tests-Relax-the-measured-timeout-bound-in-timeout-te.patch \
            file://run-ptest"
 
 EXTRA_OECMAKE = "-DSDBUSCPP_BUILD_CODEGEN=OFF \
