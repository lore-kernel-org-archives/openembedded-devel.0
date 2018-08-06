Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0BA7474FD0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 08:29:20 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id j5-v6so11490738wrr.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Aug 2018 01:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kFyvE3ADc1aOiC+NDxSlYWhRwDb19cwP/LEhtvZbvSo=;
	b=cdCogRYTTDqlMdXRg2FfUtZqAOSUfNSxEJCLJ9EoET5nokqmTU2oFUlqwhPrEt1Oid
	PYMcplClpGCMQSIQAYLXOmOCLXvXkwPTsNYuovRHeJDyMN4YSI65K2nAKSdbAENxaxf4
	7mM4ibjjN4UT3NG6SqTzDCDvEgBh4cj4yQdBmC2c9KOQnLDf7YMbm4lfLDNjnK9CegL7
	SQ3NeMDX1KP1GQkJgfQs2e1/iH66WWnhWUFFTjacbGj5SJl9nvO8twyRMdQNjFFO6P08
	pVbHjiH4Nfp8gL069VdV2YaDNLXTRTy2omKEvLY8/l+uQ51zuQs+3i+nBqvqriA8tBj7
	+AEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kFyvE3ADc1aOiC+NDxSlYWhRwDb19cwP/LEhtvZbvSo=;
	b=KwpjGoP/SV/WCiCAhUmzNlgQdrP5Nfsx+w9qtGAHWfEctj9EcTJGk3DeRaeow7MIda
	F/BfXotqtzhty6dAB6KwGcp4Sz1BTVJ53O97ZiWz1LpNLV109s6bVz3jMwOFw+7Y1jVd
	KpXec/mhYh0Y2n7zD3f2VuszaFDWnBSGHPqWpYcxChvRBzc9UJX+cxjeoJSqmrVLXMnZ
	UVkgEUGbtXe2lFOX0pPChDekZ2El6E8Kc1XzfFy5ICMKlICqHhdaCr0S9AXbx9CzDPdM
	68+oSUYo3Mukbs3hCkvp0/+WDL0AUhKn6kyBeZRtjsVJ0KHLVZyvcb/Twy8H59xCX8up
	dm7g==
X-Gm-Message-State: AOUpUlF7gajVcf7hq05jsFa7KXc5ZGNSkBHKM6zUCP6QuQahWT2Uelqg
	ezvrT8uSyExydqas1MClFVOASyUA
X-Google-Smtp-Source: AAOMgpeOhJkbigN3CS9rAxSqufUBRE/GNq4f2hzlfkT7IKQDqxqwTqdZr52jn79CamgTG3nBty29sA==
X-Received: by 2002:adf:fe42:: with SMTP id
	m2-v6mr8470835wrs.171.1533544161286; 
	Mon, 06 Aug 2018 01:29:21 -0700 (PDT)
Received: from localhost.localdomain ([37.176.59.94])
	by smtp.gmail.com with ESMTPSA id
	w204-v6sm7832640wmw.5.2018.08.06.01.29.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Aug 2018 01:29:20 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2018 10:29:17 +0200
Message-Id: <20180806082917.8211-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] cpprest: update to new 2.10.3 release, simplify recipe now that it has a cmake file in the root location
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Aug 2018 08:29:21 -0000

---
 .../cpprest/cpprest-2.10.2/787.patch          | 32 -------------------
 .../cpprest/cpprest-2.10.2/boost-fix.patch    | 14 --------
 .../732.patch                                 |  0
 .../747.patch                                 |  0
 .../disable-float-tests.patch                 |  0
 .../disable-outside-tests.patch               |  0
 .../disable-test-timeouts.patch               |  0
 .../fix-cmake-install.patch                   |  2 +-
 .../recipes-support/cpprest/cpprest_2.10.2.bb | 23 -------------
 .../recipes-support/cpprest/cpprest_2.10.3.bb | 22 +++++++++++++
 10 files changed, 23 insertions(+), 70 deletions(-)
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.2/787.patch
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.2/boost-fix.patch
 rename meta-oe/recipes-support/cpprest/{cpprest-2.10.2 => cpprest-2.10.3}/732.patch (100%)
 rename meta-oe/recipes-support/cpprest/{cpprest-2.10.2 => cpprest-2.10.3}/747.patch (100%)
 rename meta-oe/recipes-support/cpprest/{cpprest-2.10.2 => cpprest-2.10.3}/disable-float-tests.patch (100%)
 rename meta-oe/recipes-support/cpprest/{cpprest-2.10.2 => cpprest-2.10.3}/disable-outside-tests.patch (100%)
 rename meta-oe/recipes-support/cpprest/{cpprest-2.10.2 => cpprest-2.10.3}/disable-test-timeouts.patch (100%)
 rename meta-oe/recipes-support/cpprest/{cpprest-2.10.2 => cpprest-2.10.3}/fix-cmake-install.patch (98%)
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest_2.10.3.bb

diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/787.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/787.patch
deleted file mode 100644
index 359a3ba52..000000000
--- a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/787.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 212536f9d66400bef4400c55efd05dd01303c035 Mon Sep 17 00:00:00 2001
-From: Andreas Stieger <astieger@suse.com>
-Date: Sun, 17 Jun 2018 13:00:05 +0200
-Subject: [PATCH] Fix gcc8 error/warning -Werror=format-truncation=
-
-utilities::datetime::to_string(): datetime_str and buf were oversized
-for fitting into output without possible trunctation
----
- Release/src/utilities/asyncrt_utils.cpp | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/Release/src/utilities/asyncrt_utils.cpp b/Release/src/utilities/asyncrt_utils.cpp
-index 0e62bdee..be38907c 100644
---- a/Release/src/utilities/asyncrt_utils.cpp
-+++ b/Release/src/utilities/asyncrt_utils.cpp
-@@ -691,12 +691,13 @@ utility::string_t datetime::to_string(date_format format) const
-     {
-         // Append fractional second, which is a 7-digit value with no trailing zeros
-         // This way, '1200' becomes '00012'
--        char buf[9] = { 0 };
-+        const int max_frac_length = 8;
-+        char buf[max_frac_length+1] = { 0 };
-         snprintf(buf, sizeof(buf), ".%07ld", (long int)frac_sec);
-         // trim trailing zeros
--        for (int i = 7; buf[i] == '0'; i--) buf[i] = '\0';
-+        for (int i = max_frac_length-1; buf[i] == '0'; i--) buf[i] = '\0';
-         // format the datetime into a separate buffer
--        char datetime_str[max_dt_length+1] = {0};
-+        char datetime_str[max_dt_length-max_frac_length-1+1] = {0};
-         strftime(datetime_str, sizeof(datetime_str), "%Y-%m-%dT%H:%M:%S", &datetime);
-         // now print this buffer into the output buffer
-         snprintf(output, sizeof(output), "%s%sZ", datetime_str, buf);
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/boost-fix.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/boost-fix.patch
deleted file mode 100644
index 5318a6a10..000000000
--- a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/boost-fix.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Origin: https://github.com/Microsoft/cpprestsdk/issues/813
-Last-Update: 2018-07-23
-
---- cpprest-2.10.2.orig/Release/libs/websocketpp/websocketpp/transport/asio/security/tls.hpp
-+++ cpprest-2.10.2/Release/libs/websocketpp/websocketpp/transport/asio/security/tls.hpp
-@@ -312,7 +312,7 @@ protected:
-                 return make_error_code(transport::error::tls_short_read);
- #else
-             if (ERR_GET_REASON(ec.value()) == boost::asio::ssl::error::stream_truncated) {
--                return make_error_code(boost::asio::ssl::error::stream_truncated);
-+                return make_error_code(static_cast<std::errc>(boost::asio::ssl::error::stream_truncated));
- #endif
-             } else {
-                 // We know it is a TLS related error, but otherwise don't know
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/732.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.3/732.patch
similarity index 100%
rename from meta-oe/recipes-support/cpprest/cpprest-2.10.2/732.patch
rename to meta-oe/recipes-support/cpprest/cpprest-2.10.3/732.patch
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/747.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.3/747.patch
similarity index 100%
rename from meta-oe/recipes-support/cpprest/cpprest-2.10.2/747.patch
rename to meta-oe/recipes-support/cpprest/cpprest-2.10.3/747.patch
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/disable-float-tests.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.3/disable-float-tests.patch
similarity index 100%
rename from meta-oe/recipes-support/cpprest/cpprest-2.10.2/disable-float-tests.patch
rename to meta-oe/recipes-support/cpprest/cpprest-2.10.3/disable-float-tests.patch
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/disable-outside-tests.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.3/disable-outside-tests.patch
similarity index 100%
rename from meta-oe/recipes-support/cpprest/cpprest-2.10.2/disable-outside-tests.patch
rename to meta-oe/recipes-support/cpprest/cpprest-2.10.3/disable-outside-tests.patch
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/disable-test-timeouts.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.3/disable-test-timeouts.patch
similarity index 100%
rename from meta-oe/recipes-support/cpprest/cpprest-2.10.2/disable-test-timeouts.patch
rename to meta-oe/recipes-support/cpprest/cpprest-2.10.3/disable-test-timeouts.patch
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.3/fix-cmake-install.patch
similarity index 98%
rename from meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
rename to meta-oe/recipes-support/cpprest/cpprest-2.10.3/fix-cmake-install.patch
index ab9227680..4d03e6d28 100644
--- a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
+++ b/meta-oe/recipes-support/cpprest/cpprest-2.10.3/fix-cmake-install.patch
@@ -30,7 +30,7 @@ Index: cpprest/Release/src/CMakeLists.txt
 ===================================================================
 --- cpprest.orig/Release/src/CMakeLists.txt
 +++ cpprest/Release/src/CMakeLists.txt
-@@ -250,21 +250,21 @@
+@@ -253,21 +253,21 @@
    install(
      TARGETS ${CPPREST_TARGETS}
      EXPORT cpprestsdk-targets
diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
deleted file mode 100644
index 47183c576..000000000
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Microsoft project for cloud-based client-server communication in native code using a modern asynchronous C++ API design."
-SECTION = "libs/network"
-HOMEPAGE = "https://github.com/Microsoft/cpprestsdk/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${S}/../license.txt;md5=a2e15b954769218ff912468eecd6a02f"
-DEPENDS = "openssl websocketpp zlib boost"
-
-SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master \
-           file://disable-outside-tests.patch;patchdir=.. \
-           file://disable-test-timeouts.patch;patchdir=.. \
-           file://disable-float-tests.patch;patchdir=.. \
-           file://fix-cmake-install.patch;patchdir=.. \
-           file://747.patch;patchdir=.. \
-           file://732.patch;patchdir=.. \
-           file://787.patch;patchdir=.. \
-           "
-
-# tag 2.10.2
-SRCREV= "fea848e2a77563cf2a6f28f8eab396fd6e787fbf"
-
-S = "${WORKDIR}/git/Release"
-
-inherit cmake
diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.3.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.3.bb
new file mode 100644
index 000000000..addacbbd2
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.3.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Microsoft project for cloud-based client-server communication in native code using a modern asynchronous C++ API design."
+SECTION = "libs/network"
+HOMEPAGE = "https://github.com/Microsoft/cpprestsdk/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${S}/license.txt;md5=a2e15b954769218ff912468eecd6a02f"
+DEPENDS = "openssl websocketpp zlib boost"
+
+SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master \
+           file://disable-outside-tests.patch \
+           file://disable-test-timeouts.patch \
+           file://disable-float-tests.patch \
+           file://fix-cmake-install.patch \
+           file://747.patch \
+           file://732.patch \
+           "
+
+# tag 2.10.3
+SRCREV= "e388a2e523f4d0b6aee2bb923637d82d8b969556"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
-- 
2.17.1


