Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.35616.1610378724826446687
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 07:25:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55680 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kyz4M-0006IU-3Y; Mon, 11 Jan 2021 17:25:24 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/10] python3-croniter: Upgrade 0.3.37 -> 1.0.1
Date: Mon, 11 Jan 2021 17:25:04 +0200
Message-Id: <20210111152512.23506-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210111152512.23506-1-leon.anavi@konsulko.com>
References: <20210111152512.23506-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.1:

- no changes, just to make sense with new semver2 (making croniter
  on a stable state)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-croniter_0.3.37.bb => python3-croniter_1.0.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_0.3.37.bb => python3-croniter_1.0.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_0.3.37.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_0.3.37.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.0.1.bb
index 28c4057cd..0ffae0c0d 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_0.3.37.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "12ced475dfc107bf7c6c1440af031f34be14cd97bbbfaf0f62221a9c11e86404"
+SRC_URI[sha256sum] = "9d9942beaae10c0f9f5de4dcbfab4d85b10638cf407195b82d990bc086d6de0d"
 
 inherit pypi setuptools3
 
-- 
2.17.1

