Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.5198.1628673351049755751
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Aug 2021 02:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50486 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mDkKu-0001XG-TY; Wed, 11 Aug 2021 12:15:49 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-huey: Upgrade 2.3.2 -> 2.4.0
Date: Wed, 11 Aug 2021 12:15:29 +0300
Message-Id: <20210811091530.26594-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210811091530.26594-1-leon.anavi@konsulko.com>
References: <20210811091530.26594-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.4.0:

- Task expiration
- Add option to make crontab() parsing strict, raising an error if
  an invalid interval specification is given. You probably want to
  enable this.
- Fix bug in the FileStorage dequeue() method, which attempted to
  unlink an open file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-huey_2.3.2.bb => python3-huey_2.4.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_2.3.2.bb => python3-huey_2.4.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.3.2.bb b/meta-python/recipes-devtools/python/python3-huey_2.4.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-huey_2.3.2.bb
rename to meta-python/recipes-devtools/python/python3-huey_2.4.0.bb
index 4ef80c4a85..afdc65b246 100644
--- a/meta-python/recipes-devtools/python/python3-huey_2.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_2.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "7176acb113850824490da5a31f328cc48a2002a59bfb396efbab8ecbd3573910"
+SRC_URI[sha256sum] = "82981fb8f1964e8c9ee8f4ebcd5a2ebad561dd93ce8b454bf4f4ecfb54bd1411"
 
 inherit pypi setuptools3
 
-- 
2.17.1

