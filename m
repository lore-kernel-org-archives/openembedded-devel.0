Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDECC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 18:23:32 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.95525.1738607007304360047
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Feb 2025 10:23:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=QFoFP5F+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202502031823282f4f1689b9e48b279c-ckgfv_@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202502031823282f4f1689b9e48b279c
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 03 Feb 2025 19:23:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=pq6FuyJGIDcob+WeVvzSfIT9s6M8yIPUlw1d3NT9hUE=;
 b=QFoFP5F+mXtafO5UJQJdxDecF4HNeImyWD/pLEzfbmZD8RQ+MCk//BstBWJsXred4muSbf
 1IRZtkD7vuKHrC4DnTyChpcVNIMSDQb+DYG+O40ZDH67kKlkv7XuhsV6Ci8Zcp/0YwcFH3Hj
 Egce8WW43fdxF38U9X7swEvD5z6PNlb8ZZFogifp1Hk0ejCgx6Tj40dHEtHedtTpEnCQB6en
 7NzVFZYbCAH3BjJV3auySK6yUGgIVhlfayGQC5a6pgcVM9cbtcMI9pqpX4IFrknTg2jSeH9F
 N0l/V8anuW00uzWQfXm93T1xGAwTAUVxar6b1HsR4kde22HVt5wFpK1Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH v2 7/9] python3-protobuf: add MIT to license
Date: Mon,  3 Feb 2025 19:22:08 +0100
Message-Id: <20250203182210.574300-7-peter.marko@siemens.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 18:23:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115251

From: Peter Marko <peter.marko@siemens.com>

utf_range is MIT licensed.
Although the LICENSE file is not distributed in python protobuf,
this can be read in c++ protobuf recipe where all files are present.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-devtools/python/python3-protobuf_4.25.3.bb        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
index b92f91b714..fb95340f7b 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "Protocol Buffers"
 HOMEPAGE = "https://developers.google.com/protocol-buffers/"
 SECTION = "devel/python"
-
-LICENSE = "BSD-3-Clause"
+# MIT license is from utf8_range
+LICENSE = "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a9f8f0d527c043d"
 
 inherit pypi setuptools3

