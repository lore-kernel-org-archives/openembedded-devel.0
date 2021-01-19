Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.14834.1611077879810031637
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jan 2021 09:38:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59758 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l1ux4-0001eq-K8; Tue, 19 Jan 2021 19:37:59 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/10] python3-openpyxl: Upgrade 3.0.5 -> 3.0.6
Date: Tue, 19 Jan 2021 19:37:43 +0200
Message-Id: <20210119173746.24694-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210119173746.24694-1-leon.anavi@konsulko.com>
References: <20210119173746.24694-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.6:

- Borders in differential styles are incorrect
- Error when opening some pivot tables
- Resave breaks the border format in conditional formatting rules
- Read-only workbook not closed properly if generator interrupted
- Pandas.Multiindex.labels deprecated
- Pandas.Multiinex not expanded correctly
- Cannot read rows with exponents
- numpy.float is deprecated
- Cells without coordinate attributes not always correctly handled
- Improved handling of borders for differential styles
- Support subclasses of datetime objects
- Improved handling of cells without coordinates

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-openpyxl_3.0.5.bb => python3-openpyxl_3.0.6.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-openpyxl_3.0.5.bb => python3-openpyxl_3.0.6.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.5.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.6.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-openpyxl_3.0.5.bb
rename to meta-python/recipes-devtools/python/python3-openpyxl_3.0.6.bb
index 0aa9fb020..d4781eeff 100644
--- a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.6.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "526b7149538575d58e55df1bd37807c1"
-SRC_URI[sha256sum] = "18e11f9a650128a12580a58e3daba14e00a11d9e907c554a17ea016bf1a2c71b"
+SRC_URI[sha256sum] = "b229112b46e158b910a5d1b270b212c42773d39cab24e8db527f775b82afc041"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-jdcal ${PYTHON_PN}-et-xmlfile"
-- 
2.17.1

