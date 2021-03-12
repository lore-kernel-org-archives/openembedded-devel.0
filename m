Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.381.1615566387030919773
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 08:26:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=36668 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lKkcH-0007yZ-BH; Fri, 12 Mar 2021 18:26:26 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-croniter: Upgrade 1.0.6 -> 1.0.8
Date: Fri, 12 Mar 2021 18:25:59 +0200
Message-Id: <20210312162600.8335-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210312162600.8335-1-leon.anavi@konsulko.com>
References: <20210312162600.8335-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.8:

- Update _expand to lowercase each component of the expression
- Fix _expand to reject int literals with underscores
- Remove a debug statement to make flake8 happy

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-croniter_1.0.6.bb => python3-croniter_1.0.8.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.0.6.bb => python3-croniter_1.0.8.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.0.6.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.8.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.0.6.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.0.8.bb
index d3b6fa1f4..0d0ac75ae 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.8.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "e79bcc9681d2345e71360241aebe19ed6c5475fec40cc59a7998fe1a2ca568d0"
+SRC_URI[sha256sum] = "c8b830d787c9993361b74eaad7d7396090d7f2d9db41ceb4a52cb75da461c3ed"
 
 inherit pypi setuptools3
 
-- 
2.17.1

