Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.408.1611588230101851536
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 07:23:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58482 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l43iW-00057d-Bd; Mon, 25 Jan 2021 17:23:49 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-lazy-object-proxy: Upgrade 1.5.1 -> 1.5.2
Date: Mon, 25 Jan 2021 17:23:36 +0200
Message-Id: <20210125152337.20937-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210125152337.20937-1-leon.anavi@konsulko.com>
References: <20210125152337.20937-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.5.2:

- Added Python 3.9 wheels.
- Removed Python 2.7 Windows wheels (not supported on newest
  image with Python 3.9).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...bject-proxy_1.5.1.bb => python3-lazy-object-proxy_1.5.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lazy-object-proxy_1.5.1.bb => python3-lazy-object-proxy_1.5.2.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.1.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.2.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.2.bb
index 4ba947923..3ff7a126e 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.2.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[md5sum] = "c168cec73acdec25a49f6f467f5b1eaa"
-SRC_URI[sha256sum] = "9723364577b79ad9958a68851fe2acb94da6fd25170c595516a8289e6a129043"
+SRC_URI[sha256sum] = "5944a9b95e97de1980c65f03b79b356f30a43de48682b8bdd90aa5089f0ec1f4"
 
 inherit pypi setuptools3
-- 
2.17.1

