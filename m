Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.13508.1598362011711580263
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 06:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56752 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kAYyP-0001xr-S9; Tue, 25 Aug 2020 16:26:50 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-openpyxl: Upgrade 3.0.4 -> 3.0.5
Date: Tue, 25 Aug 2020 16:26:29 +0300
Message-Id: <20200825132633.875-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825132633.875-1-leon.anavi@konsulko.com>
References: <20200825132633.875-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.5 with the following bugfixes:

- Incorrectly consider currency format as datetime
- Cannot copy worksheets with merged cells
- Empty worksheets do not return generators when looping
- Hyperlinks duplicated on multiple saves
- Incorrectly literal format as datetime
- Links set to range of cells not preserved
- Exception when opening workbook with chartsheets and tables

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-openpyxl_3.0.4.bb => python3-openpyxl_3.0.5.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-openpyxl_3.0.4.bb => python3-openpyxl_3.0.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.4.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-openpyxl_3.0.4.bb
rename to meta-python/recipes-devtools/python/python3-openpyxl_3.0.5.bb
index d0946e49a..0aa9fb020 100644
--- a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.5.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "8491219f6bd83ca6ad8334bf77435cf5"
-SRC_URI[sha256sum] = "d88dd1480668019684c66cfff3e52a5de4ed41e9df5dd52e008cbf27af0dbf87"
+SRC_URI[md5sum] = "526b7149538575d58e55df1bd37807c1"
+SRC_URI[sha256sum] = "18e11f9a650128a12580a58e3daba14e00a11d9e907c554a17ea016bf1a2c71b"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-jdcal ${PYTHON_PN}-et-xmlfile"
-- 
2.17.1

