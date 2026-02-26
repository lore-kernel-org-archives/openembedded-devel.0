Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27313FD9E14
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 21:28:14 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81280.1772141291787392354
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Feb 2026 13:28:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=E5YiLgpt;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20260226212808f11601c580000207c3-3lkun8@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260226212808f11601c580000207c3
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 26 Feb 2026 22:28:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=aiQaJB6lc0R82UD5TZnouMuxiXZ6mN9y0EB/aRpAYME=;
 b=E5YiLgptzzixEGPQSyctvF+lPe4/0JnZOwff+kdyjYQMMkV5r8ZVfh8VMJOb3PHa2Xc0/d
 DlhNnOwSGxX+iCp9S3Utwb0+AIUuhZ5bonuqZTXK2F6Zu08yQ1I4kZRZIkZygUUuXbBh1/DT
 79Svy6pHY8lbtuxBgZCbSxRK5f9gWGr6zZ7Pnj9c1nGs6RQEPEo67PgwFLqNZzIqLW2Wzf+z
 5/tgp9iVG/kt9HLTDuiFceIE8KLz7KRhDgquqQURT8jqHpCoK11iMgyGEB1Bbp+NsBJcMhTh
 rFmu4zwA/Mp3xnomMtHHjS9vPyqEnPTDxvfe98saoyE/pSQJBdtBnpmg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH] jwt-cpp: Add native class to support
Date: Thu, 26 Feb 2026 22:27:59 +0100
Message-ID: <20260226212759.569792-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 21:28:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124688

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add also native class to support building the library for the host
system to use it e.g. with the newer dynamic SDK.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.2.bb b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.2.bb
index 431c77c695..1c006947e8 100644
--- a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.2.bb
+++ b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.2.bb
@@ -16,4 +16,4 @@ inherit cmake
 
 EXTRA_OECMAKE += "-DJWT_BUILD_EXAMPLES=OFF -DJWT_CMAKE_FILES_INSTALL_DIR=${libdir}/cmake/${BPN}"
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.53.0


