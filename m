Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.5786.1619514965809941678
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Apr 2021 02:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56792 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lbJp5-0008Bm-GL; Tue, 27 Apr 2021 12:16:04 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-et-xmlfile: Upgrade 1.0.1 -> 1.1.0
Date: Tue, 27 Apr 2021 12:15:57 +0300
Message-Id: <20210427091557.17899-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210427091557.17899-1-leon.anavi@konsulko.com>
References: <20210427091557.17899-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.1.0:

- Remove bitbucket pipelines config and streamline setup.py
- Update project URL
- Update APIDOC config
- Update tox config
- Update python_requires and add sys.path('.')

License-Update: Use the exact line from PKG-INFO.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-et-xmlfile_1.0.1.bb        | 20 -------------------
 .../python/python3-et-xmlfile_1.1.0.bb        | 17 ++++++++++++++++
 2 files changed, 17 insertions(+), 20 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-et-xmlfile_1.0.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-et-xmlfile_1.0.1.bb b/meta-python/recipes-devtools/python/python3-et-xmlfile_1.0.1.bb
deleted file mode 100644
index cfff150cc7..0000000000
--- a/meta-python/recipes-devtools/python/python3-et-xmlfile_1.0.1.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "et_xmlfile is a low memory library for creating large XML files"
-DESCRIPTION = "It is based upon the xmlfile module from lxml with the aim of allowing code \
-to be developed that will work with both libraries. It was developed initially for \
-the openpyxl project but is now a standalone module."
-
-HOMEPAGE = "https://bitbucket.org/openpyxl/et_xmlfile/src/default/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=b3d89cae66f26c3a0799be8a96f3178b"
-
-SRC_URI[md5sum] = "f47940fd9d556375420b2e276476cfaf"
-SRC_URI[sha256sum] = "614d9722d572f6246302c4491846d2c393c199cfa4edc9af593437691683335b"
-
-RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell"
-
-inherit setuptools3
-PYPI_PACKAGE ?= "et_xmlfile"
-PYPI_SRC_URI ?= "https://files.pythonhosted.org/packages/source/e/et_xmlfile/et_xmlfile-1.0.1.tar.gz"
-SECTION = "devel/python"
-SRC_URI += "${PYPI_SRC_URI}"
-S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
diff --git a/meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb b/meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb
new file mode 100644
index 0000000000..182a81d694
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "et_xmlfile is a low memory library for creating large XML files"
+DESCRIPTION = "It is based upon the xmlfile module from lxml with the aim of allowing code \
+to be developed that will work with both libraries. It was developed initially for \
+the openpyxl project but is now a standalone module."
+
+HOMEPAGE = "https://foss.heptapod.net/openpyxl/et_xmlfile"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
+
+SRC_URI[sha256sum] = "8eb9e2bc2f8c97e37a2dc85a09ecdcdec9d8a396530a6d5a33b30b9a92da0c5c"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell"
+
+inherit setuptools3 pypi
+
+PYPI_PACKAGE = "et_xmlfile"
-- 
2.17.1

