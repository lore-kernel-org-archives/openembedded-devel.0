Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6391DC83F17
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 09:51:22 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.53994.1752400274232952861
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Jul 2025 02:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=LfeEOk9W;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202507130951120ca42a8d4f7543b7ee-z_evzr@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202507130951120ca42a8d4f7543b7ee
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 13 Jul 2025 11:51:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=OzHTYSYbbmv3Ax90BiiK3tNQbiTPF6ztKI8XLZQW8uo=;
 b=LfeEOk9W+wma5iS56M+gCMLRUXp0x9XkcE1P9S0GcPOUcKNbCr4nvBEKsq09k7NbVZPY0R
 nNfSvmDkKDW01HlXoUic8lrVWbaR897+AcchaO/UKWLknG5Sxcc1Ns7BpzDSKZtkxGcJN/BA
 PLjNOWLlRrR+B0LQ2LTpGHG39/wVITLbxsMphrI8pLB9xUJrGBK8LTUhvE5bsvKgPj8Zm48g
 SwPlePo1DwRxFKGGUEDOfyJjsEJ2fW+dNc6p2z6F8EtWeQjHuaQy3LL1hXIpTuDlQOmMqbgp
 V27oMkXdMIIsP3tfh9XeRiHy60fSuaz8sd6rr06MIP/7U9+Qgp4R5OHQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][walnascar][PATCH] poco: patch CVE-2025-6375
Date: Sun, 13 Jul 2025 11:50:21 +0200
Message-Id: <20250713095021.502242-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 09:51:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118507

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioned in [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-6375

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
Note that in my testing there are 25 failing tests.
However the failures are the same as without this patch.

 .../poco/poco/CVE-2025-6375.patch             | 34 +++++++++++++++++++
 meta-oe/recipes-support/poco/poco_1.13.3.bb   |  1 +
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
diff --git a/meta-oe/recipes-support/poco/poco_1.13.3.bb b/meta-oe/recipes-support/poco/poco_1.13.3.bb
index 662caa27d7..5899db651d 100644
--- a/meta-oe/recipes-support/poco/poco_1.13.3.bb
+++ b/meta-oe/recipes-support/poco/poco_1.13.3.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/pocoproject/poco.git;branch=poco-1.13.3;protocol=htt
            file://run-ptest \
            file://0001-SimpleRowFormatter.h-fix-the-build-on-gcc-15-unsatis.patch \
            file://0002-fix-Foundation-Build-error-with-GCC-15-class-Poco-Pr.patch \
+           file://CVE-2025-6375.patch \
            "
 SRCREV = "7f848d25aa0461d3beeff1189dc61b48ffe8e2f4"
 

