Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.55755.1622541999057586200
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Jun 2021 03:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=49790 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lo1IC-0002gA-VO; Tue, 01 Jun 2021 13:06:37 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-google-api-python-client: Upgrade 2.4.0 -> 2.6.0
Date: Tue,  1 Jun 2021 13:06:28 +0300
Message-Id: <20210601100631.3277-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210601100631.3277-1-leon.anavi@konsulko.com>
References: <20210601100631.3277-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.6.0:

- adexchangebuyer2: update the api
- cloudasset: update the api
- composer: update the api
- compute: update the api
- dfareporting: update the api
- dialogflow: update the api
- displayvideo: update the api
- gkehub: update the api
- healthcare: update the api
- retail: update the api
- sasportal: update the api
- servicedirectory: update the api
- servicemanagement: update the api
- servicenetworking: update the api
- servicenetworking: update the api
- spanner: update the api

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...lient_2.4.0.bb => python3-google-api-python-client_2.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.4.0.bb => python3-google-api-python-client_2.6.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.4.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.6.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.6.0.bb
index 0fdd33240..c6ae6e847 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.6.0.bb
@@ -4,6 +4,6 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
 
-SRC_URI[sha256sum] = "72f69e67238e38b0da41b5a2e352dc39b4b5891d88f3db082aae7775da8fe58b"
+SRC_URI[sha256sum] = "6a87f324334247bf7ba24406da586424b09e715d04336fb7cf45a402b80d38e8"
 
 inherit pypi setuptools3
-- 
2.17.1

