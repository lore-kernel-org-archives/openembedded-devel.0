Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.9351.1611925839904384617
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jan 2021 05:10:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56034 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l5TXn-0007LC-HP; Fri, 29 Jan 2021 15:10:37 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-croniter: Upgrade 1.0.2 -> 1.0.4
Date: Fri, 29 Jan 2021 15:10:26 +0200
Message-Id: <20210129131029.2163-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 1.0.4:

- Raise CroniterBadCronError when error syntax
- Fix spelling

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-croniter_1.0.2.bb => python3-croniter_1.0.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.0.2.bb => python3-croniter_1.0.4.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.0.2.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.4.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.0.2.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.0.4.bb
index bfe1f1d4c..8328cf6d3 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "12f9fd52e7cfb623d0788956d137a3de26e5583a25820fa7710fb6b58d32b213"
+SRC_URI[sha256sum] = "7f861f4a896b2b43069ef218d2b999d2c9f760598c2592a6b842cb04bc75562e"
 
 inherit pypi setuptools3
 
-- 
2.17.1

