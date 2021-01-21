Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.6741.1611235042076364386
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 05:17:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46072 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l2Zpw-0002jH-DN; Thu, 21 Jan 2021 15:17:20 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-croniter: Upgrade 1.0.1 -> 1.0.2
Date: Thu, 21 Jan 2021 15:17:09 +0200
Message-Id: <20210121131709.27097-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210121131709.27097-1-leon.anavi@konsulko.com>
References: <20210121131709.27097-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 1.0.2:

- Fix match when datetime has microseconds

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-croniter_1.0.1.bb => python3-croniter_1.0.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.0.1.bb => python3-croniter_1.0.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.0.1.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.0.2.bb
index 0ffae0c0d..bfe1f1d4c 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "9d9942beaae10c0f9f5de4dcbfab4d85b10638cf407195b82d990bc086d6de0d"
+SRC_URI[sha256sum] = "12f9fd52e7cfb623d0788956d137a3de26e5583a25820fa7710fb6b58d32b213"
 
 inherit pypi setuptools3
 
-- 
2.17.1

