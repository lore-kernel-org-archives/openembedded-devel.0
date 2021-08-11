Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.5266.1628673346059652586
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Aug 2021 02:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50486 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mDkKu-0001XG-2m; Wed, 11 Aug 2021 12:15:44 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-google-api-python-client: Upgrade 2.12.0 -> 2.15.0
Date: Wed, 11 Aug 2021 12:15:28 +0300
Message-Id: <20210811091530.26594-3-leon.anavi@konsulko.com>
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

Upgrade to release 2.15.0:

- alertcenter: update the api
- chat: update the api
- cloudbuild: update the api
- content: update the api
- displayvideo: update the api
- dns: update the api
- eventarc: update the api
- file: update the api
- monitoring: update the api
- people: update the api
- retail: update the api
- securitycenter: update the api
- speech: update the api
- sqladmin: update the api

License-Update: update license to be Apache-2.0 compliant

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...t_2.12.0.bb => python3-google-api-python-client_2.15.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.12.0.bb => python3-google-api-python-client_2.15.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.12.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.15.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.12.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.15.0.bb
index 36345e0166..6172cd28f5 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.15.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "The Google API Client for Python is a client library for accessing th
 Moderator, and many other Google APIs."
 HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "a5d203241a93201a770c966f8eca39de7f88b28194f9d252065b18e83bd99c4b"
+SRC_URI[sha256sum] = "8375489232823f44c601196a960505e03ec58c95ddb6415c6b1d1d76b468f8ba"
 
 inherit pypi setuptools3
 
-- 
2.17.1

