Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.3546.1590102836103095705
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2020 16:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50054 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jbuNt-0003wj-1m; Fri, 22 May 2020 02:13:53 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-openpyxl: Upgrade 2.6.3 -> 3.0.3
Date: Fri, 22 May 2020 02:13:25 +0300
Message-Id: <20200521231325.685-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521231325.685-1-leon.anavi@konsulko.com>
References: <20200521231325.685-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.3.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-openpyxl_2.6.3.bb => python3-openpyxl_3.0.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-openpyxl_2.6.3.bb => python3-openpyxl_3.0.3.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_2.6.3.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.3.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-openpyxl_2.6.3.bb
rename to meta-python/recipes-devtools/python/python3-openpyxl_3.0.3.bb
index 87cb46ea9..018c4abe2 100644
--- a/meta-python/recipes-devtools/python/python3-openpyxl_2.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.3.bb
@@ -5,11 +5,11 @@ was initially based on PHPExcel."
 
 HOMEPAGE = "http://www.python-excel.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=3baf26d8abf08632beaf913ea973cb8a"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a6e506457afab4a25ecbaeb4bc3ed623"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "b067750e51f17a1a9cc6bacfdd668218"
-SRC_URI[sha256sum] = "72d1ed243972cad0b3c236230083cac00d9c72804e64a2ae93d7901aec1a8f1c"
+SRC_URI[md5sum] = "9583cea56b9d4441d96eb63a8a5c92a4"
+SRC_URI[sha256sum] = "547a9fc6aafcf44abe358b89ed4438d077e9d92e4f182c87e2dc294186dc4b64"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-jdcal ${PYTHON_PN}-et-xmlfile"
-- 
2.17.1

