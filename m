Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62191C83F1D
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 09:47:22 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.53704.1752400034656541952
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Jul 2025 02:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=CxGDXU0Y;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202507130947069bf6883ef78854356e-k5frtj@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202507130947069bf6883ef78854356e
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 13 Jul 2025 11:47:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=N2+iLImqNJEjX3WuQ4GIZ6ImogUiG8TdQk79dUwEWyk=;
 b=CxGDXU0YKzULRY9RR65AfWzoyKlstDZuN2qzyLdl1O+aF2pgoo+770KamddpAFr1YyWxAX
 B7ufr3YhrfBMFt7RCBNIiYls9gXHvjk869LEL3l61sw2Mr50kkfXQfhYdo8UotH7xhjXTeyM
 ZKJOi2LF31DnbO9mb9J964gFZT4e2CgpOqRQJhrKsgSEzFXOKU1pul27U7gtT/PaMc2ITM/u
 5YONy45t5OSp39AfFHfKqd1FZbp1ycD4Cc8KgxBCq5SIpJCiRjB+fUoPvffwO6bDwG2YhYiG
 lWcC+Blo3wRdntA8Zw9u/XszHWSV2Vk/hv4o4PX0uXFUKTuoy6dZa1hQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][kirkstone][PATCH 1/3] poco: patch CVE-2025-6375
Date: Sun, 13 Jul 2025 11:46:12 +0200
Message-Id: <20250713094614.501804-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 09:47:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118503

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioned in [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-6375

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../poco/poco/CVE-2025-6375.patch             | 34 +++++++++++++++++++
 meta-oe/recipes-support/poco/poco_1.11.2.bb   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-support/poco/poco/CVE-2025-6375.patch

diff --git a/meta-oe/recipes-support/poco/poco/CVE-2025-6375.patch b/meta-oe/recipes-support/poco/poco/CVE-2025-6375.patch
new file mode 100644
index 0000000000..2ec8f819f9
--- /dev/null
+++ b/meta-oe/recipes-support/poco/poco/CVE-2025-6375.patch
@@ -0,0 +1,34 @@
+From 6f2f85913c191ab9ddfb8fae781f5d66afccf3bf Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?G=C3=BCnter=20Obiltschnig?= <guenter.obiltschnig@appinf.com>
+Date: Wed, 16 Apr 2025 09:15:33 +0200
+Subject: [PATCH] fix(Net): A SEGV at Net/src/MultipartReader.cpp:164:1 #4915
+ (move assertion out of ctor)
+
+CVE: CVE-2025-6375
+Upstream-Status: Backport [https://github.com/pocoproject/poco/commit/6f2f85913c191ab9ddfb8fae781f5d66afccf3bf]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ Net/src/MultipartReader.cpp | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Net/src/MultipartReader.cpp b/Net/src/MultipartReader.cpp
+index f3a2f2bba..f4aa27dd8 100644
+--- a/Net/src/MultipartReader.cpp
++++ b/Net/src/MultipartReader.cpp
+@@ -36,7 +36,6 @@ MultipartStreamBuf::MultipartStreamBuf(std::istream& istr, const std::string& bo
+ 	_boundary(boundary),
+ 	_lastPart(false)
+ {
+-	poco_assert (!boundary.empty() && boundary.length() < STREAM_BUFFER_SIZE - 6);
+ }
+ 
+ 
+@@ -47,7 +46,7 @@ MultipartStreamBuf::~MultipartStreamBuf()
+ 
+ int MultipartStreamBuf::readFromDevice(char* buffer, std::streamsize length)
+ {
+-	poco_assert_dbg (length >= _boundary.length() + 6);
++	poco_assert (!_boundary.empty() && _boundary.length() < length - 6);
+ 
+ 	static const int eof = std::char_traits<char>::eof();
+ 	std::streambuf& buf = *_istr.rdbuf();
diff --git a/meta-oe/recipes-support/poco/poco_1.11.2.bb b/meta-oe/recipes-support/poco/poco_1.11.2.bb
index ae8bbf87e4..075eb72a06 100644
--- a/meta-oe/recipes-support/poco/poco_1.11.2.bb
+++ b/meta-oe/recipes-support/poco/poco_1.11.2.bb
@@ -11,6 +11,7 @@ DEPENDS = "libpcre zlib"
 SRC_URI = " \
     git://github.com/pocoproject/poco.git;branch=main;protocol=https \
     file://run-ptest \
+    file://CVE-2025-6375.patch \
    "
 SRCREV = "9d1c428c861f2e5ccf09149bbe8d2149720c5896"
 

