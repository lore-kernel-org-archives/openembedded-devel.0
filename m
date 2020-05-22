Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.13038.1590154818387762130
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 06:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33024 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jc7uI-0003Rj-HP; Fri, 22 May 2020 16:40:15 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-ujson: Upgrade 1.35 -> 2.0.3
Date: Fri, 22 May 2020 16:40:05 +0300
Message-Id: <20200522134007.10925-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 2.0.3.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-ujson_1.35.bb => python3-ujson_2.0.3.bb}     | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_1.35.bb => python3-ujson_2.0.3.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_1.35.bb b/meta-python/recipes-devtools/python/python3-ujson_2.0.3.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-ujson_1.35.bb
rename to meta-python/recipes-devtools/python/python3-ujson_2.0.3.bb
index 36abb7ea9..be3dc8e64 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_1.35.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_2.0.3.bb
@@ -2,10 +2,10 @@ SUMMARY  = "Ultra fast JSON encoder and decoder for Python"
 DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pure C with bindings for Python 2.5+ and 3."
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=88df8e78b9edfd744953862179f2d14e"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe"
 
-SRC_URI[md5sum] = "42f77b0cce686dfa4da2e68480b1dd24"
-SRC_URI[sha256sum] = "f66073e5506e91d204ab0c614a148d5aa938bdbf104751be66f8ad7a222f5f86"
+SRC_URI[md5sum] = "80d288c186dd02579e1561494b45aa41"
+SRC_URI[sha256sum] = "bd2deffc983827510e5145fb66e4cc0f577480c62fe0b4882139f8f7d27ae9a3"
 
 inherit pypi ptest setuptools3
 
@@ -13,6 +13,8 @@ SRC_URI += " \
     file://run-ptest \
 "
 
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-numbers \
-- 
2.17.1

