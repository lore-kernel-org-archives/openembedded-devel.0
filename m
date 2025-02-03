Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FAAC02193
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 18:23:22 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.95229.1738606999190339235
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Feb 2025 10:23:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Je7oP25X;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250203182316a9df9a44e89bd83c50-zu_agb@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250203182316a9df9a44e89bd83c50
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 03 Feb 2025 19:23:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=4RgprOt6iNvZZUMJi1PuzzrNw1gGfAuUjzLwxwMgmek=;
 b=Je7oP25Xu3KA6zb8zSKV9lSaH3/577unKPDibRONRlbTr5kaB8Frk9oBdjjAgi9Ay6+qz+
 xyvXmTwSFP2hXmUiI/zmItRiXRGy1q9+RDAgb4YcKFdeXRlIGZJ3WS5epff9KvetUxl+SNHi
 AoUDIiTEGPcHuh/KSA26yjOLBu5GLjuWGKlGMk/jD8bilwOVNkS6F5SmeIM+O5uYf3J4YRsK
 RPN9b/s9CaKBdO6V2FD792G3LOgkJC1shc0/0yMzZ3ml3NzDx7j1DeIJvrskrdbh5ESIQBBH
 7j4xugC4SAMj8BymHMKzO3bgbJP4d1jb+1v+N5G2MajS+QgdCZjvgNnw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH v2 4/9] protobuf: use system jsoncpp
Date: Mon,  3 Feb 2025 19:22:05 +0100
Message-Id: <20250203182210.574300-4-peter.marko@siemens.com>
In-Reply-To: <20250203182210.574300-1-peter.marko@siemens.com>
References: <20250202213910.284312-1-peter.marko@siemens.com>
 <20250203182210.574300-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 18:23:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115248

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

