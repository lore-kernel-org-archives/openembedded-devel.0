Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.8867.1624976545347653433
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Jun 2021 07:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58062 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lyEd5-0005GQ-EN; Tue, 29 Jun 2021 17:22:23 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-croniter: Upgrade 1.0.13 -> 1.0.15
Date: Tue, 29 Jun 2021 17:22:17 +0300
Message-Id: <20210629142217.28346-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210629142217.28346-1-leon.anavi@konsulko.com>
References: <20210629142217.28346-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.15:

- restore py2

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-croniter_1.0.13.bb => python3-croniter_1.0.15.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.0.13.bb => python3-croniter_1.0.15.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.0.13.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.15.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.0.13.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.0.15.bb
index c520fa715f..1782391a62 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.0.13.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.15.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "57f36df4f5a1c31bbf50bbffa3551612c19f6156ab1e88e2e42342ccbb9f9b9a"
+SRC_URI[sha256sum] = "a70dfc9d52de9fc1a886128b9148c89dd9e76b67d55f46516ca94d2d73d58219"
 
 inherit pypi setuptools3
 
-- 
2.17.1

