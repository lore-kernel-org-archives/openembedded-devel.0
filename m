Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.13200.1620912243495440117
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 06:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=44224 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lhBJo-0004kU-6I; Thu, 13 May 2021 16:24:02 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/10] python3-pymongo: Upgrade 3.11.3 -> 3.11.4
Date: Thu, 13 May 2021 16:23:32 +0300
Message-Id: <20210513132332.3745-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210513132332.3745-1-leon.anavi@konsulko.com>
References: <20210513132332.3745-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.11.4:

- Bug fix where a MongoClient would mistakenly attempt to create
  minPoolSize connections to arbiter nodes
- Bug fix that prevented PyMongo from retrying writes after a
  writeConcernError on MongoDB 4.4+

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymongo_3.11.3.bb => python3-pymongo_3.11.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.11.3.bb => python3-pymongo_3.11.4.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.11.3.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.11.4.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_3.11.3.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_3.11.4.bb
index 3549adce7c..0c07344cb4 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_3.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_3.11.4.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "db5098587f58fbf8582d9bda2462762b367207246d3e19623782fb449c3c5fcc"
+SRC_URI[sha256sum] = "539d4cb1b16b57026999c53e5aab857fe706e70ae5310cc8c232479923f932e6"
 
 inherit pypi setuptools3
 
-- 
2.17.1

