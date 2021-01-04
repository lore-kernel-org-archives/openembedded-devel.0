Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.1362.1609787965656140769
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 11:19:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39382 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kwVNx-0007Kw-7M; Mon, 04 Jan 2021 21:19:23 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-requests: Upgrade 2.25.0 -> 2.25.1
Date: Mon,  4 Jan 2021 21:19:14 +0200
Message-Id: <20210104191916.7071-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 2.25.1:

- Requests now treats application/json as utf8 by default.
  Resolving inconsistencies between r.text and r.json output.
- Requests now supports chardet v4.x.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-requests_2.25.0.bb => python3-requests_2.25.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-requests_2.25.0.bb => python3-requests_2.25.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-requests_2.25.0.bb b/meta-python/recipes-devtools/python/python3-requests_2.25.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-requests_2.25.0.bb
rename to meta-python/recipes-devtools/python/python3-requests_2.25.1.bb
index 5284f95982..6af836543b 100644
--- a/meta-python/recipes-devtools/python/python3-requests_2.25.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests_2.25.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "7f1a0b932f4a60a1a65caa4263921bb7d9ee911957e0ae4a23a6dd08185ad5f8"
+SRC_URI[sha256sum] = "27973dd4a904a4f13b263a19c866c13b92a39ed1c964655f025f3f8d3d75b804"
 
 inherit pypi setuptools3
 
-- 
2.17.1

