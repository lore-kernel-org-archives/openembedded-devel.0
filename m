Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.22651.1611829775088792526
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 02:29:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43042 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l54YL-00080R-SW; Thu, 28 Jan 2021 12:29:34 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-xlrd: Upgrade 1.2.0 -> 2.0.1
Date: Thu, 28 Jan 2021 12:29:03 +0200
Message-Id: <20210128102903.11760-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210128102903.11760-1-leon.anavi@konsulko.com>
References: <20210128102903.11760-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.0.1:

- Use the README as the long description on PyPI.
- Remove support for anything other than .xls files.
- Remove support for psyco.
- Change the default encoding used when no CODEPAGE record can be
  found from ascii to iso-8859-1.
- Add support for iterating over :class:`~xlrd.book.Book` objects.
- Add support for item access from :class:`~xlrd.book.Book`
  objects, where integer indices and string sheet names are
  supported.
- Non-unicode spaces are now stripped from the "last author"
  information.
- Workbook corruption errors can now be ignored using the
  ignore_workbook_corruption option to :class:`~xlrd.open_workbook`.
- Handle WRITEACCESS records with invalid trailing characters.
- Officially support Python 3.8 and 3.9.

Get the source code from the git repository rather than from PyPI
to obtain the tests.

License-Update: Use file LICENSE.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-xlrd_1.2.0.bb => python3-xlrd_2.0.1.bb} | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xlrd_1.2.0.bb => python3-xlrd_2.0.1.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-xlrd_1.2.0.bb b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-xlrd_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
index 571dba6fa..8587ea8f3 100644
--- a/meta-python/recipes-devtools/python/python3-xlrd_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
@@ -4,16 +4,19 @@ DESCRIPTION = "Extract data from Excel spreadsheets (.xls and .xlsx,\
 Strong support for Excel dates. Unicode-aware."
 HOMEPAGE = "http://www.python-excel.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5f4244d51fcc1e7cc2d43e96891b2f80"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=00ea1e843a43c20d9b63a8112239b0d1"
 
-SRC_URI[md5sum] = "e5d5b96924d791b22898b622eb3e918e"
-SRC_URI[sha256sum] = "546eb36cee8db40c3eaa46c351e67ffee6eeb5fa2650b71bc4c758a29a1b29b2"
+SRC_URI[sha256sum] = "f72f148f54442c6b056bf931dbc34f986fd0c3b0b6b5a58d013c9aef274d0c88"
 
-SRC_URI += " \
-    file://run-ptest \
+
+SRC_URI = "git://github.com/python-excel/xlrd.git \
+           file://run-ptest \
 "
+SRCREV = "b8d573e11ec149da695d695c81a156232b89a949"
+
+S = "${WORKDIR}/git"
 
-inherit ptest pypi setuptools3
+inherit ptest setuptools3
 
 RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell"
 
@@ -24,8 +27,6 @@ RDEPENDS_${PN}-ptest += " \
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-    install -d ${D}${PTEST_PATH}/examples
-    cp -rf ${S}/examples/* ${D}${PTEST_PATH}/examples/
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

