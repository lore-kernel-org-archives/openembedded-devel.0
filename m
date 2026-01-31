Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C27E7C6FA
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 22:24:00 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18999.1769898235590535074
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Jan 2026 14:23:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Ix1bQ7Oj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202601312223525c57ebf001000207ce-5am7kl@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202601312223525c57ebf001000207ce
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 31 Jan 2026 23:23:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=EF17thIRdzWuWaynM7Zm5s/uY0ZWFsL+vOwGfgTJT3Q=;
 b=Ix1bQ7Ojl0+etz6WwnbMGb++fnT5b7gmbAZ0aPGBRmLe7y17uq6xSwLcJM1ftIBiVHmyyE
 3eCQTmfNwMO9LnVLK6LAIXZoO7a1T0P6DXv/VpW+sZGotXF4meoyHZD7U+CQ8/m//RGrVE8F
 lIaA/X3JVTmOCmSSrJrAaWbvEW+arEN4C8LDk44AjDvVs0tj7hmoiqoREqXFG39KZBbSpjMp
 8HAFzm48zbZrcvSbRCm0YfohlOHBFMAzUJO2f7fwaWlu2ivqLGhUwPy9TW/scUoXgYi1DD2h
 yBREasvORsy7Uk23qOHOLxas9v6e2cQnomDqw4LdpbYSqfrFnhfw3qmw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH v2 1/2] python3-protobuf: upgrade 6.33.2 -> 6.33.5
Date: Sat, 31 Jan 2026 23:23:45 +0100
Message-Id: <20260131222346.307600-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Jan 2026 22:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124029

Solves CVE-2026-0994.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: fixed "from version in commit message

 .../{python3-protobuf_6.33.2.bb => python3-protobuf_6.33.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_6.33.2.bb => python3-protobuf_6.33.5.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_6.33.2.bb b/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-protobuf_6.33.2.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
index d0ef7753b0..af30165f81 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_6.33.2.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "56dc370c91fbb8ac85bc13582c9e373569668a290aa2e66a590c2a0d35ddb9e4"
+SRC_URI[sha256sum] = "6ddcac2a081f8b7b9642c09406bc6a4290128fce5f471cddd165960bb9119e5c"
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
 

