Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CA7C0218F
	for <webhook@archiver.kernel.org>; Sun,  2 Feb 2025 21:40:14 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.73885.1738532409920458070
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Feb 2025 13:40:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=TXfNwLyM;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250202214008f682a82ae3fe584bca-jscgku@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250202214008f682a82ae3fe584bca
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 02 Feb 2025 22:40:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=4RgprOt6iNvZZUMJi1PuzzrNw1gGfAuUjzLwxwMgmek=;
 b=TXfNwLyMzSax8hYCglC8fHsRMwx+6vprJbdQZRYhtisStv6xoQa1jAkev6OmdVJ48pg3sr
 vvZZr16/ED2UBeM46t0/ApqRcdIWJmxPrACwUoeOFGe5h0JXMtI+Tvk4mGE4sOhry1OOINTC
 caJUtSy6RODLqeVQe3p1UunqYH9bVzfqd+RFFIP/oW70oe/nA/kB81amUUcZdiAqmW8j6omN
 VcoseE8aawXFPq9EVODf+m7mJTotqAqQqGI2XxR0BMpnIfhL9OGMQ/SSZ+DyGzuBjgKV/pm6
 Vlwlpy3vGPfxTjqi0gmM421Rwni9WThKbxWZ26GiyMWV53VCaJsmncrQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 3/8] protobuf: use system jsoncpp
Date: Sun,  2 Feb 2025 22:39:05 +0100
Message-Id: <20250202213910.284312-3-peter.marko@siemens.com>
In-Reply-To: <20250202213910.284312-1-peter.marko@siemens.com>
References: <20250202213910.284312-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Feb 2025 21:40:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115222

From: Peter Marko <peter.marko@siemens.com>

We should not use additional vendored jsoncpp unless required due to
compatibility issues.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
index c7e9408870..470c368cf3 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
@@ -7,7 +7,7 @@ SECTION = "console/tools"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 
-DEPENDS = "zlib abseil-cpp"
+DEPENDS = "zlib abseil-cpp jsoncpp"
 DEPENDS:append:class-target = " protobuf-native"
 
 SRCREV = "9d0ec0f92b5b5fdeeda11f9dcecc1872ff378014"
@@ -37,6 +37,7 @@ EXTRA_OECMAKE += "\
     -Dprotobuf_BUILD_TESTS=OFF \
     -Dprotobuf_BUILD_EXAMPLES=OFF \
     -Dprotobuf_ABSL_PROVIDER="package" \
+    -Dprotobuf_JSONCPP_PROVIDER="package" \
 "
 
 TEST_SRC_DIR = "examples"

