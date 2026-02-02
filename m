Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BFF0E7FDD8
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 21:32:50 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2079.1770067961323986396
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 13:32:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=HXzxV3C/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202602022132398f291d0f0800020740-xlwvo7@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202602022132398f291d0f0800020740
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 02 Feb 2026 22:32:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=zBD0/LHYz/UJCJvh8+Y/S6eIShkZc41PXtir0pooFbE=;
 b=HXzxV3C/6SG7CA/vQd3mB5UWL1B2h9Zx8kjLBNv+lGHjLjJiKjMo5VVhD//2KzV/AB5x++
 igPf84jIHlo7GkGG0q8a9tli+lXipcRQMQKZ8ay+FMHACuaeVQKxoxPQj7TAEglSkA1pMzt3
 UrEYNqXpf36j8X3De6cyZsquf6vt3ApXZci37gr7eZ+wjsLHA/OKzVmvt9m7Dgge1LEIX3Vf
 S5FJBrwXCagXrPIiP7B0GbcCQQeOL8ExiCisqvbJ0513L69RI7Tysr+TtvxPTfA/C/S+CfL1
 y2iq2t2eSGqbY39zcWB7UQJIOJkKpXZeiXZUwXEfz39aQzTPkuOPC2QA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][scarthgap][PATCH 2/2] python3-protobuf: added python3-ctypes as RDEPENDS
Date: Mon,  2 Feb 2026 22:32:28 +0100
Message-Id: <20260202213228.2116741-2-peter.marko@siemens.com>
In-Reply-To: <20260202213228.2116741-1-peter.marko@siemens.com>
References: <20260202213228.2116741-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 21:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124091

From: Jan Vermaete <jan.vermaete@gmail.com>

  File "/usr/lib/python3.12/site-packages/google/protobuf/internal/type_checkers.py", line 25, in <module>
    import ctypes
ModuleNotFoundError: No module named 'ctypes'

tested on qemu86-64

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

(From meta-openembedded rev: d1b8ebc2a5ff5993e118048f2ca31a893f13cd38)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-python/recipes-devtools/python/python3-protobuf_4.25.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.25.8.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.25.8.bb
index 6ba24899f6..7c534fe656 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.25.8.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.25.8.bb
@@ -19,6 +19,7 @@ UPSTREAM_CHECK_REGEX = "protobuf/(?P<pver>\d+(\.\d+)+)/"
 DEPENDS += "protobuf"
 
 RDEPENDS:${PN} += " \
+    python3-ctypes \
     python3-datetime \
     python3-json \
     python3-logging \

