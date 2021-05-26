Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.3858.1622064792251612802
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 14:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46114 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lm19K-0000vH-8V; Thu, 27 May 2021 00:33:10 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-werkzeug: Upgrade 1.0.1 -> 2.0.1
Date: Thu, 27 May 2021 00:32:46 +0300
Message-Id: <20210526213248.10348-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210526213248.10348-1-leon.anavi@konsulko.com>
References: <20210526213248.10348-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.0.1:

- Fix type annotation for send_file max_age callable. Don't pass
  pathlib.Path to max_age.
- Mark top-level names as exported so type checking understands
  imports in user projects.
- Fix some types that weren't available in Python 3.6.0.
- cached_property is generic over its return type, properties
  decorated with it report the correct type.
- Fix multipart parsing bug when boundary contains special regex
  characters.
- Type checking understands that calling headers.get with a string
  default will always return a string.
- If HTTPException.description is not a string, get_description
  will convert it to a string.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-werkzeug_1.0.1.bb => python3-werkzeug_2.0.1.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_1.0.1.bb => python3-werkzeug_2.0.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_2.0.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_2.0.1.bb
index 8af0fef60..1653eeabd 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.0.1.bb
@@ -12,8 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
 PYPI_PACKAGE = "Werkzeug"
 
-SRC_URI[md5sum] = "5d499cfdd30de5d9c946994783772efd"
-SRC_URI[sha256sum] = "6c80b1e5ad3665290ea39320b91e1be1e0d5f60652b964a3070216de83d2e47c"
+SRC_URI[sha256sum] = "1de1db30d010ff1af14a009224ec49ab2329ad2cde454c8a708130642d579c42"
 
 inherit pypi setuptools3
 
-- 
2.17.1

