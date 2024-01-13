Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D8DC4706C
	for <webhook@archiver.kernel.org>; Sat, 13 Jan 2024 19:45:43 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.26133.1705175133917273666
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jan 2024 11:45:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=PdtoMeYE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202401131945302789dd505be2be6fbe-ef4kr2@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202401131945302789dd505be2be6fbe
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 13 Jan 2024 20:45:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=t8D44WlEbN3z3nCIkwwFQS7WD2C+d28fRYPdThmlv1E=;
 b=PdtoMeYEz7s/VdSfJtRLGlKNrOV/qfqod2Owg/CTIHRivQKFQlWs8XOPvZ1c3IsCGOI8UY
 6X8myAUEChL84Pbw1FzNiQWL+2Vp76HikHSDpH1CbWDqcIALF9yfjRa98cM6OHuD+Se6WK/O
 s786u3inuvyTqtB65WcfKAus9Muhk=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] grpc: correct dependencies
Date: Sat, 13 Jan 2024 20:44:25 +0100
Message-Id: <20240113194425.2479777-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jan 2024 19:45:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108268

From: Peter Marko <peter.marko@siemens.com>

GRPC depends on protobuf, not protobuf-c
Additionally zlib is missing in dependencies

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-devtools/grpc/grpc_1.60.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.60.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.60.0.bb
index 14fca669d3..d41a73eee4 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.60.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.60.0.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0 & BSD-3-Clause & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906"
 
-DEPENDS = "c-ares protobuf protobuf-native protobuf-c protobuf-c-native openssl libnsl2 abseil-cpp re2"
+DEPENDS = "c-ares protobuf protobuf-native openssl libnsl2 abseil-cpp re2 zlib"
 DEPENDS:append:class-target = " googletest grpc-native "
 DEPENDS:append:class-nativesdk = " grpc-native "
 
-- 
2.30.2


