Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.15996.1593011820434131930
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2020 08:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53538 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jo793-00035d-5E; Wed, 24 Jun 2020 18:17:01 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/10] python3-lazy-object-proxy: Upgrade 1.4.3 -> 1.5.0
Date: Wed, 24 Jun 2020 18:16:25 +0300
Message-Id: <20200624151628.547-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624151628.547-1-leon.anavi@konsulko.com>
References: <20200624151628.547-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.5.0:

- Added support for __fspath__.
- Dropped support for Python 3.4.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ject-proxy_1.4.3.bb => python3-lazy-object-proxy_1.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lazy-object-proxy_1.4.3.bb => python3-lazy-object-proxy_1.5.0.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.4.3.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.0.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.4.3.bb
rename to meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.0.bb
index bd197adcb..60d0e169f 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[md5sum] = "5c64c06affcd2a7c6ddc848af4280cca"
-SRC_URI[sha256sum] = "f3900e8a5de27447acbf900b4750b0ddfd7ec1ea7fbaf11dfa911141bc522af0"
+SRC_URI[md5sum] = "ea5c009f1995d86942d024714096624e"
+SRC_URI[sha256sum] = "a0aed261060cd0372abf08d16399b1224dbb5b400312e6b00f2b23eabe1d4e96"
 
 inherit pypi setuptools3
-- 
2.17.1

