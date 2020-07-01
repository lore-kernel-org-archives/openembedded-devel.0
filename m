Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.22824.1593613393302481078
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2020 07:23:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60354 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jqddn-0002cZ-Sc; Wed, 01 Jul 2020 17:23:12 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-pyhamcrest: Upgrade 1.9.0 -> 2.0.2
Date: Wed,  1 Jul 2020 17:22:43 +0300
Message-Id: <20200701142243.1686-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200701142243.1686-1-leon.anavi@konsulko.com>
References: <20200701142243.1686-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.0.2:

- Various type hint bug fixes.
- Make hamcrest package PEP 561 compatible, i.e. supply type hints
  for external use.
- Drop formal support for 2.x
- Drop formal support for 3.x < 3.5
- Fix raises() grows support for additional matchers on exception
  object.
- Made has_properties() report all mismatches, not just the first.
- Silence warnings.
- Type fixes.
- Remove obsolete dependencies.

The year in LICENSE.txt has been updated and the LIC_FILES_CHKSUM
changed. The license remains the same.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pyhamcrest_1.9.0.bb              | 12 ------------
 .../python/python3-pyhamcrest_2.0.2.bb              | 13 +++++++++++++
 2 files changed, 13 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb b/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
deleted file mode 100644
index ee96a079a..000000000
--- a/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "Hamcrest framework for matcher objects"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f6df1318c6071dd1707f5e3b6c11f24f"
-
-PYPI_PACKAGE = "PyHamcrest"
-
-SRC_URI[md5sum] = "8b833a3fa30197455df79424f30c8c3f"
-SRC_URI[sha256sum] = "8ffaa0a53da57e89de14ced7185ac746227a8894dbd5a3c718bf05ddbd1d56cd"
-
-inherit pypi setuptools3
-
-RDEPENDS_${PN} += "${PYTHON_PN}-six"
diff --git a/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.2.bb b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.2.bb
new file mode 100644
index 000000000..59d9b5e8b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.2.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Hamcrest framework for matcher objects"
+HOMEPAGE = "https://github.com/hamcrest/PyHamcrest"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=79391bf1501c898472d043f36e960612"
+
+PYPI_PACKAGE = "PyHamcrest"
+
+SRC_URI[md5sum] = "7a086f0b067f8d38958ec32f054559b4"
+SRC_URI[sha256sum] = "412e00137858f04bde0729913874a48485665f2d36fe9ee449f26be864af9316"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-six"
-- 
2.17.1

