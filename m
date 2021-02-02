Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.50540.1612265205343324310
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Feb 2021 03:26:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41580 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l6tpT-0007Xh-G8; Tue, 02 Feb 2021 13:26:43 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-croniter: Upgrade 1.0.5 -> 1.0.6
Date: Tue,  2 Feb 2021 13:26:35 +0200
Message-Id: <20210202112636.30651-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210202112636.30651-1-leon.anavi@konsulko.com>
References: <20210202112636.30651-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.6:

- Fix combination of star and invalid expression bugs

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-croniter_1.0.5.bb => python3-croniter_1.0.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.0.5.bb => python3-croniter_1.0.6.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.0.5.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.6.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.0.5.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.0.6.bb
index c8af97d7c..d3b6fa1f4 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "8636e7f0ce842b4192b7f097cab724fc15bf2459265f1a2bc6cf6eacfa44420e"
+SRC_URI[sha256sum] = "e79bcc9681d2345e71360241aebe19ed6c5475fec40cc59a7998fe1a2ca568d0"
 
 inherit pypi setuptools3
 
-- 
2.17.1

