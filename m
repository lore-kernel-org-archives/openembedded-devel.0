Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5E6C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 18:23:12 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.95227.1738606989180142908
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Feb 2025 10:23:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=LpcQYfLd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250203182311146be02a0f5f6985f7-lulm1x@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250203182311146be02a0f5f6985f7
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 03 Feb 2025 19:23:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Qasd7IhXJ05c6juZ+oKOa54ouJ0/57o4kiLwf/32XUE=;
 b=LpcQYfLdcqbHii+BdALEkASrk4mVeTBNOuHIkuFPGyBAC9mDx3REeYjgZrpJhap5vjH0x8
 2D9dJ5o7e6pZbIi7ZnFmjRXXC0ve/hgdZmBAUNFHJdd5ofeqfUCejXvjtDY6SkZJ2yINUr5M
 9Gb9Jq2qraR2t8NUZFKKUfHSP0PYOtsblIIVqZerh3CffO9iUJRrSKs8a0LgcBhqw2pK7ItU
 CXlV+VETohmUQLcwJpuB1EdNmc5J6bJcPNf2Ua9hlULKPo1oNc5aniPGSF28VIxYimt6/chv
 ENlsFeJ6tCM9noobYQ8lmgshvAAF9Rj8O85zvpvT+Q2GmoFj6Add7EWQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH v2 3/9] jsoncpp: enable nativesdk build
Date: Mon,  3 Feb 2025 19:22:04 +0100
Message-Id: <20250203182210.574300-3-peter.marko@siemens.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 18:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115247

From: Peter Marko <peter.marko@siemens.com>

This is necessary for unbundled build of protobuf.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: this is new commit

 meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb
index ade9f35d18..28820baf48 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb
@@ -22,4 +22,4 @@ inherit cmake
 
 EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DBUILD_OBJECT_LIBS=OFF -DJSONCPP_WITH_TESTS=OFF"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"

