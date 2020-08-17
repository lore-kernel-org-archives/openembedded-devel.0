Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.41377.1597663770525595633
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2020 04:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34814 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k7dKS-000361-KX; Mon, 17 Aug 2020 14:29:29 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/10] python3-google-api-python-client: Upgrade 1.9.3 -> 1.10.0
Date: Mon, 17 Aug 2020 14:28:59 +0300
Message-Id: <20200817112901.28914-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817112901.28914-1-leon.anavi@konsulko.com>
References: <20200817112901.28914-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.10.0:

- Allow to use 'six.moves.collections_abc.Mapping' in
  'client_options.from_dict()'
- Build universal wheels
- Discovery supports retries
- Consolidating and updating the Contribution Guide

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...nt_1.9.3.bb => python3-google-api-python-client_1.10.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.9.3.bb => python3-google-api-python-client_1.10.0.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.9.3.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.0.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.9.3.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.0.bb
index af4aa5287..37b6fc621 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.9.3.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
 
-SRC_URI[md5sum] = "eb5fa1e3f83b659ff978df1346a55576"
-SRC_URI[sha256sum] = "220349ce189a85229fc46875d467101318495a4a735c0ff2f165b9bdbc7511a0"
+SRC_URI[md5sum] = "a0064953388af9f9c61d8347f1e2ae0c"
+SRC_URI[sha256sum] = "fa24f07f6124ff2e91ee9b7550e240481bcb31b8f77a75e8d481be1c44a6ff07"
 
 inherit pypi setuptools3
-- 
2.17.1

