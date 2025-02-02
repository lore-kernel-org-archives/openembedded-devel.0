Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8F1C0218F
	for <webhook@archiver.kernel.org>; Sun,  2 Feb 2025 21:40:44 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.73952.1738532442638156824
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Feb 2025 13:40:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=clYz9B7q;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250202214040e8d618d9812eb2ee62-qh8wg_@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250202214040e8d618d9812eb2ee62
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 02 Feb 2025 22:40:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=BfxlUz3+Ydw7mSBg4jr5Br3uLuSW5I496IXmnUKTMzE=;
 b=clYz9B7qlUNG7eN6ffcp+gQgRjT0ZjbKLq6u43wVC6Xi5GlFVtZ3VVB26mD1PoTjYHrAD1
 KiJfddUQ+8MAph6QwiICcxwCnAm257DLiK34rpwddyAFleb947T6uBScv037kz0+Vdtj9+IY
 oB1zDx1Jn3c9l7DScuqCgxDh8TegsRukKLPy22lildQNse5Gzwp7yGG1raEWOGnB0tpi0nZA
 7mscvF/HhGOSJOe5wwgKidCmz1pSWx7VhsiRTZdmyH5uKoYEYnPQg6W7bN1CY/MOOzU7FQc0
 DCP4UD5HYRTQvOeSYXgfpYGZ7ke9q6I9T5n1qnQaPeZ6r4cxPlwgdPWQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH 8/8] python3-protobuf: set CVE_PRODUCT
Date: Sun,  2 Feb 2025 22:39:10 +0100
Message-Id: <20250202213910.284312-8-peter.marko@siemens.com>
In-Reply-To: <20250202213910.284312-1-peter.marko@siemens.com>
References: <20250202213910.284312-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Feb 2025 21:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115227

From: Peter Marko <peter.marko@siemens.com>

Similarly to c++ protobuf, add products matching historical entries.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
index fb95340f7b..53b37208af 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 inherit pypi setuptools3
 SRC_URI[sha256sum] = "25b5d0b42fd000320bd7830b349e3b696435f3b329810427a6bcce6a5492cc5c"
 
+CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
+
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
 CLEANBROKEN = "1"

