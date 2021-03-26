Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.12113.1616764362805268088
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Mar 2021 06:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57840 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lPmGW-0004oR-IC; Fri, 26 Mar 2021 15:12:41 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-croniter: Upgrade 1.0.9 -> 1.0.10
Date: Fri, 26 Mar 2021 15:12:31 +0200
Message-Id: <20210326131231.5839-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210326131231.5839-1-leon.anavi@konsulko.com>
References: <20210326131231.5839-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.10:

- Remove external library natsort. Sorting of cron expression
  components now handled with sorted() with a custom key function.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-croniter_1.0.9.bb => python3-croniter_1.0.10.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.0.9.bb => python3-croniter_1.0.10.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.0.9.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.10.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.0.9.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.0.10.bb
index 7b3a95011..6cd87fea9 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.10.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "708532f70584207e23ef2989ca40f367e6238bfe050133a1aff43e1e0e6f6092"
+SRC_URI[sha256sum] = "364c48e393060295c3161588a6556d5c890b5c34299973c393adbe4488ca1ecb"
 
 inherit pypi setuptools3
 
-- 
2.17.1

