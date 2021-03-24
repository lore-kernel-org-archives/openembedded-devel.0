Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.1079.1616603876850674462
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53316 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lP6W2-0008Nt-PC; Wed, 24 Mar 2021 18:37:56 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-croniter: Upgrade 1.0.8 -> 1.0.9
Date: Wed, 24 Mar 2021 18:37:43 +0200
Message-Id: <20210324163746.19010-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210324163746.19010-1-leon.anavi@konsulko.com>
References: <20210324163746.19010-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.9:

- Remove futures dependency

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-croniter_1.0.8.bb => python3-croniter_1.0.9.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.0.8.bb => python3-croniter_1.0.9.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.0.8.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.9.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.0.8.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.0.9.bb
index 0d0ac75ae..7b3a95011 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.9.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "c8b830d787c9993361b74eaad7d7396090d7f2d9db41ceb4a52cb75da461c3ed"
+SRC_URI[sha256sum] = "708532f70584207e23ef2989ca40f367e6238bfe050133a1aff43e1e0e6f6092"
 
 inherit pypi setuptools3
 
-- 
2.17.1

