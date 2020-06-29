Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.461.1593451158324407444
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 10:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39772 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jpxR6-0000w7-1C; Mon, 29 Jun 2020 20:19:17 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-pymisp: Upgrade 2.4.122 -> 2.4.128
Date: Mon, 29 Jun 2020 20:18:49 +0300
Message-Id: <20200629171853.18608-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629171853.18608-1-leon.anavi@konsulko.com>
References: <20200629171853.18608-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.4.128:

- Bump version.
- Add a few test cases.
- Bump objects.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymisp_2.4.122.bb => python3-pymisp_2.4.128.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.122.bb => python3-pymisp_2.4.128.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.122.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.128.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.122.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.128.bb
index bf2da0066..e27bf9900 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.122.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.128.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[md5sum] = "ef41185d4c2753dc2c1a9ab937e3614a"
-SRC_URI[sha256sum] = "ecdc362b4bb5dd500a5f0b9e795b35ed75037de64f8dcf39c24d029e7657ad7f"
+SRC_URI[md5sum] = "a90a25def591c6a265bc904f801646f1"
+SRC_URI[sha256sum] = "714b8b5c8debb4b5e0e602a5fe8a599206e89c1313244ed0e69d9e0bc816f1f7"
 
 inherit pypi setuptools3
 
-- 
2.17.1

