Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5EDC46467
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 10:48:50 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.61074.1672742921275537523
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 02:48:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=D6WuXN6Q;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=denrdrLOKYrgC+Mtvxc4Sn4xpzQOneJr/BHhlORWNJo=; b=D6WuXN6QFHbx50AMZLq+5MMzsu
	UBdP1N35Zu6FWnfSTVhUPNzzOAXLB6QBwegA0N/XFwTwpxAfsNAAAvPKFErXgr3Sphum85WhI4uQU
	01eZx3Gd10HYXb1gs8fLKIknhkT+gl7gRZFBvebJRFwQYPLmRSa99K4mysEBuw4K5tDCLYNspXsw+
	YX1zF2IgUjHCv/VEhnrbHnxOkk591jWS7r3wX9F1w+6hf29P6D+vG1Bmr1I1rtBxq9fiIZgxFXCxZ
	S0kcVSwvPxHT2lvRqwnu6Bk3Vw4zUPjd/POAHk1p5lzuZEYD6Z/tH4LC6LqEGh+yloVdzPjKOaz4K
	5DzxpFIg==;
Received: from lan.nucleusys.com ([92.247.61.126]:60722 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1pCer8-0009mZ-LU;
	Tue, 03 Jan 2023 12:48:40 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-croniter: Upgrade 1.3.7 -> 1.3.8
Date: Tue,  3 Jan 2023 12:48:26 +0200
Message-Id: <20230103104827.1211241-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230103104827.1211241-1-leon.anavi@konsulko.com>
References: <20230103104827.1211241-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 10:48:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100362

Upgrade to release 1.3.8:

- Add Python 3.11 support and move docs files to main folder

License-Update: File moved to main directory, no changes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-croniter_1.3.7.bb => python3-croniter_1.3.8.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.3.7.bb => python3-croniter_1.3.8.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.3.7.bb b/meta-python/recipes-devtools/python/python3-croniter_1.3.8.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-croniter_1.3.7.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.3.8.bb
index c84affa85..691c25017 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.3.7.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.3.8.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "croniter provides iteration for datetime object with cron like format"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "72ef78d0f8337eb35393b8893ebfbfbeb340f2d2ae47e0d2d78130e34b0dd8b9"
+SRC_URI[sha256sum] = "32a5ec04e97ec0837bcdf013767abd2e71cceeefd3c2e14c804098ce51ad6cd9"
 
 inherit pypi setuptools3
 
-- 
2.30.2


