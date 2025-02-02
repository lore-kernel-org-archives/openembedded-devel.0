Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6AF8C0218F
	for <webhook@archiver.kernel.org>; Sun,  2 Feb 2025 21:40:34 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.73899.1738532429730582496
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Feb 2025 13:40:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=hek+YHz7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250202214027b3d7e4d9ff28c9fadb-yryelx@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250202214027b3d7e4d9ff28c9fadb
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 02 Feb 2025 22:40:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=pq6FuyJGIDcob+WeVvzSfIT9s6M8yIPUlw1d3NT9hUE=;
 b=hek+YHz7wHXsQZ/xnY2m8ZWF+aFq9s72KySUbrLFeYhypNoFMcfPatBi3fUZCZU+2y6cvG
 u+UrGA/tLgTDUElhNGRJTV3oZJxQcu/G5my4tjOfeglXXlDLptzbuHA7eWQNAob6KB1WV3bN
 01gNaFtnSjI/Po7GG3a9eJ0FwsUQUsC0NzyEV0zc+Q/4SV+wqTYy2vx06BMmu+pU/BlK1F+G
 ShFbkFvOumBBL9yQ+qTtQjXfyGelDBAjXpk2R1sw9uQidkAsB2B/VUzkzZjQwg6hpcc0wXED
 6WqCHfPoeKYt/XDveervwBVADylaCGJEj0zApI2Hai/s9xRkr78/Z/qw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH 6/8] python3-protobuf: add MIT to license
Date: Sun,  2 Feb 2025 22:39:08 +0100
Message-Id: <20250202213910.284312-6-peter.marko@siemens.com>
In-Reply-To: <20250202213910.284312-1-peter.marko@siemens.com>
References: <20250202213910.284312-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Feb 2025 21:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115225

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

