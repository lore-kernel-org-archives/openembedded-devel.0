Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.7627.1612444791438686809
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 05:19:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60428 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l7eY0-00014n-Rg; Thu, 04 Feb 2021 15:19:49 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-pymongo: Upgrade 3.11.2 -> 3.11.3
Date: Thu,  4 Feb 2021 15:19:39 +0200
Message-Id: <20210204131940.22585-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204131940.22585-1-leon.anavi@konsulko.com>
References: <20210204131940.22585-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.11.3:

- Fix benchmark when using Python 3

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymongo_3.11.2.bb => python3-pymongo_3.11.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.11.2.bb => python3-pymongo_3.11.3.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.11.2.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.11.3.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_3.11.2.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_3.11.3.bb
index 5372ac0ff..3549adce7 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_3.11.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_3.11.3.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "c2b67881392a9e85aa108e75f62cdbe372d5a3f17ea5f8d3436dcf4662052f14"
+SRC_URI[sha256sum] = "db5098587f58fbf8582d9bda2462762b367207246d3e19623782fb449c3c5fcc"
 
 inherit pypi setuptools3
 
-- 
2.17.1

