Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.13288.1620912230828695161
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 06:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=44224 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lhBJb-0004kU-KE; Thu, 13 May 2021 16:23:50 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/10] python3-google-api-python-client: Upgrade 2.2.0 -> 2.4.0
Date: Thu, 13 May 2021 16:23:27 +0300
Message-Id: <20210513132332.3745-5-leon.anavi@konsulko.com>
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

Upgrade to release 2.4.0:

- alertcenter: update the api
- analyticsadmin: update the api
- androidenterprise: update the api
- androidpublisher: update the api
- artifactregistry: update the api
- bigquery: update the api
- chromepolicy: update the api
- content: update the api
- datacatalog: update the api
- dataproc: update the api
- dialogflow: update the api
- dns: update the api
- documentai: update the api
- file: update the api
- firebasestorage: update the api
- gameservices: update the api
- gkehub: update the api
- lifesciences: update the api
- monitoring: update the api
- mybusinessaccountmanagement: update the api
- networkmanagement: update the api
- oslogin: update the api
- pubsublite: update the api
- recommender: update the api
- retail: update the api
- servicedirectory: update the api
- servicemanagement: update the api
- servicenetworking: update the api
- translate: update the api
- preventing accessing predefined discovery URLs when override is
  provided

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...lient_2.2.0.bb => python3-google-api-python-client_2.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.2.0.bb => python3-google-api-python-client_2.4.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.2.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.4.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.4.0.bb
index da7cae6c3d..0fdd332405 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.4.0.bb
@@ -4,6 +4,6 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
 
-SRC_URI[sha256sum] = "29447c8e95c23ae76fcf9817432f5ed015495513abeac564905640a0ef7d1898"
+SRC_URI[sha256sum] = "72f69e67238e38b0da41b5a2e352dc39b4b5891d88f3db082aae7775da8fe58b"
 
 inherit pypi setuptools3
-- 
2.17.1

