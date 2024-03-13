Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADA4C54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 16:40:06 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.520.1710347995631934433
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Mar 2024 09:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=K2G6OzJk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20240313163952333d69226a6d07b23a-vo1lsq@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20240313163952333d69226a6d07b23a
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 13 Mar 2024 17:39:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=BG63nhlMW7q58JqByrBgxvY4fqwzMGfSGJRvyG+gSd0=;
 b=K2G6OzJkQYHiLkjJjd/ab+cMY76nwYR2DWMD5XA8ecmAu1cf1A1Zmj10kFpcGQ+bSHBt0U
 UN/5m3cQEAqQu7UP+yJXn80C1aA2pBCgpjxPKyhTU+J4fTioQ89yvmcO/avPieSAELYLGRG3
 jzzP+boxNHqDPgjKzTLJABZMU7alk=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] jwt-cpp: fix cmake file install path
Date: Wed, 13 Mar 2024 17:39:04 +0100
Message-Id: <20240313163904.2997468-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 16:40:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109292

From: Peter Marko <peter.marko@siemens.com>

jwt-cpp module cannot be found with default find_package options.
Per [1] package name is mandatory on unix build installations.

[1] https://cmake.org/cmake/help/latest/command/find_package.html#search-procedure

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.0.bb b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.0.bb
index 87f7f1a6d..19424337f 100644
--- a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.0.bb
+++ b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.0.bb
@@ -15,6 +15,6 @@ DEPENDS = "openssl"
 
 inherit cmake
 
-EXTRA_OECMAKE += "-DJWT_BUILD_EXAMPLES=OFF -DJWT_CMAKE_FILES_INSTALL_DIR=${libdir}/cmake"
+EXTRA_OECMAKE += "-DJWT_BUILD_EXAMPLES=OFF -DJWT_CMAKE_FILES_INSTALL_DIR=${libdir}/cmake/${BPN}"
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.30.2


