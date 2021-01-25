Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.429.1611588231012851545
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 07:23:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58482 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l43iX-00057d-ND; Mon, 25 Jan 2021 17:23:50 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-custom-inherit: Upgrade 2.3.0 -> 2.3.1
Date: Mon, 25 Jan 2021 17:23:37 +0200
Message-Id: <20210125152337.20937-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210125152337.20937-1-leon.anavi@konsulko.com>
References: <20210125152337.20937-1-leon.anavi@konsulko.com>
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

Uprade to release 2.3.1:

- Methods section is now recognized in NumPy-style docstrings

License-Update: Use file LICENSE.md

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-custom-inherit_2.3.0.bb           | 12 ------------
 .../python/python3-custom-inherit_2.3.1.bb           | 10 ++++++++++
 2 files changed, 10 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-custom-inherit_2.3.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb b/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb
deleted file mode 100644
index 489e71984..000000000
--- a/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "A Python package that provides customized docstring inheritance schemes between derived classes and their parents."
-HOMEPAGE = "https://github.com/rsokl/custom_inherit"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=adc1f231c76ee2f1f36025d56926ba2c"
-
-PYPI_PACKAGE = "custom_inherit"
-PYPI_SRC_URI = "https://files.pythonhosted.org/packages/0e/82/c5bb7ec49a7892a2c583e1017597e3921c59171f10602086ca93c8a83baa/custom_inherit-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "adf2850dc0e488df959821a5d4c16cbd"
-SRC_URI[sha256sum] = "1609d283c2cffce3a58baf7c0c22b655c55f85e1ec39c4717a4423d34610723a"
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.1.bb b/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.1.bb
new file mode 100644
index 000000000..c0e10448e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.1.bb
@@ -0,0 +1,10 @@
+SUMMARY = "A Python package that provides customized docstring inheritance schemes between derived classes and their parents."
+HOMEPAGE = "https://github.com/rsokl/custom_inherit"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=f910a85a4c3da51edf780f17a7608434"
+
+PYPI_PACKAGE = "custom_inherit"
+
+SRC_URI[sha256sum] = "a0d104847b4cc1ae24e00061fc2e11da8766b019bf4c8c753822347366c8c49f"
+
+inherit pypi setuptools3
-- 
2.17.1

