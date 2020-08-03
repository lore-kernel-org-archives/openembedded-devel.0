Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.12085.1596463544918761038
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 07:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40282 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k2b60-00024S-3q; Mon, 03 Aug 2020 17:05:44 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-lazy-object-proxy: Upgrade 1.5.0 -> 1.5.1
Date: Mon,  3 Aug 2020 17:05:20 +0300
Message-Id: <20200803140520.23250-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200803140520.23250-1-leon.anavi@konsulko.com>
References: <20200803140520.23250-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.5.1:

- Added ARM64 wheels (manylinux2014).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ject-proxy_1.5.0.bb => python3-lazy-object-proxy_1.5.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lazy-object-proxy_1.5.0.bb => python3-lazy-object-proxy_1.5.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.0.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.0.bb
rename to meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.1.bb
index 60d0e169f..4ba947923 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[md5sum] = "ea5c009f1995d86942d024714096624e"
-SRC_URI[sha256sum] = "a0aed261060cd0372abf08d16399b1224dbb5b400312e6b00f2b23eabe1d4e96"
+SRC_URI[md5sum] = "c168cec73acdec25a49f6f467f5b1eaa"
+SRC_URI[sha256sum] = "9723364577b79ad9958a68851fe2acb94da6fd25170c595516a8289e6a129043"
 
 inherit pypi setuptools3
-- 
2.17.1

