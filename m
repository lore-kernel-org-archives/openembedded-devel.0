Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.10022.1618389336025801109
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Apr 2021 01:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59772 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lWazl-00040c-PH; Wed, 14 Apr 2021 11:35:34 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-croniter: Upgrade 1.0.11 -> 1.0.12
Date: Wed, 14 Apr 2021 11:35:25 +0300
Message-Id: <20210414083525.10948-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210414083525.10948-1-leon.anavi@konsulko.com>
References: <20210414083525.10948-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.12:

- Add support for hashed/random/keyword expressions
- Review support support for hashed/random/keyword expression and
  add expanders reactor

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-croniter_1.0.11.bb => python3-croniter_1.0.12.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.0.11.bb => python3-croniter_1.0.12.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.0.11.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.12.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.0.11.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.0.12.bb
index ca9bf71a56..fd70468953 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.0.11.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.12.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "cd89bcbed4d79f56bbf2c9415c2bbbfd09fadc8a59dbae3898fbca5bab34103d"
+SRC_URI[sha256sum] = "3603ef0d60fc6df98ce356c01529de90b06a002379b9f5e9eae981fb9c1fd936"
 
 inherit pypi setuptools3
 
-- 
2.17.1

