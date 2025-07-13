Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66907C83F20
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 09:49:12 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.53730.1752400151345950183
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Jul 2025 02:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=HeDSefG6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2025071309490912644ea1c04a35c5d1-9w_ji0@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025071309490912644ea1c04a35c5d1
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 13 Jul 2025 11:49:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=s+Rn8r8eKxeo2TzoPDfFJk7C6gKQAra78lGtz9u0qx0=;
 b=HeDSefG6giXOI/CgLDaGRpbIM3h+Y9A3HC3FRqicsv2zaahcPSPsak7kW07R/OzoMz5h6o
 7bsrXmNvim4HssVlmICdZs30cDbCZCMSb2+cIFVl6D8betXXtBDoLuH1btH1g/m7jsnmaZ9j
 zmMFj/GcK/haIY9nzkr53G+B6HToBPrFYKNiHNxaYVLn14rEo9mq0ofFuSDcNAsQv87x+wzK
 YtU8b6eah1CDwlvgjGODjkIorMzMGr6GWzBoa8zu+AzF9FDHQ/VUQvjEu1w1ebfNMj5Pswwr
 19Svp8/S32z3MYnkiwhJ3ffVSgyzj15OXrjBmpXrt0ttfNzVYI91+H4w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH 2/2] poco: patch CVE-2025-6375
Date: Sun, 13 Jul 2025 11:48:12 +0200
Message-Id: <20250713094812.502038-2-peter.marko@siemens.com>
In-Reply-To: <20250713094812.502038-1-peter.marko@siemens.com>
References: <20250713094812.502038-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 09:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118506

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioned in [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-6375

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../poco/poco/CVE-2025-6375.patch             | 34 +++++++++++++++++++
 meta-oe/recipes-support/poco/poco_1.12.5p2.bb |  1 +
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
diff --git a/meta-oe/recipes-support/poco/poco_1.12.5p2.bb b/meta-oe/recipes-support/poco/poco_1.12.5p2.bb
index dc6e65b994..86e0adf522 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.5p2.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.5p2.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/pocoproject/poco.git;branch=poco-1.12.5;protocol=htt
            file://0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch \
            file://run-ptest \
            file://0002-fix-build-Install-cmake-files-with-resolved-ENABLE_J.patch \
+           file://CVE-2025-6375.patch \
            "
 SRCREV = "1d6fb3e1383e559cacbada5e3f861c0dafaf5d30"
 

