Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.10117.1618389335079697726
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Apr 2021 01:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59772 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lWazk-00040c-Tc; Wed, 14 Apr 2021 11:35:33 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-google-api-python-client: Upgrade 2.1.0 -> 2.2.0
Date: Wed, 14 Apr 2021 11:35:24 +0300
Message-Id: <20210414083525.10948-3-leon.anavi@konsulko.com>
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

Upgrade to release 2.2.0:

- Adds support for errors.py to also use 'errors' for error_details

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...lient_2.1.0.bb => python3-google-api-python-client_2.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.1.0.bb => python3-google-api-python-client_2.2.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.1.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.2.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.2.0.bb
index 11b94b3fcd..da7cae6c3d 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.2.0.bb
@@ -4,6 +4,6 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
 
-SRC_URI[sha256sum] = "f9ac377efe69571aea1acc9e15760d4204aca23c4464eb63f963ae4defc95d97"
+SRC_URI[sha256sum] = "29447c8e95c23ae76fcf9817432f5ed015495513abeac564905640a0ef7d1898"
 
 inherit pypi setuptools3
-- 
2.17.1

