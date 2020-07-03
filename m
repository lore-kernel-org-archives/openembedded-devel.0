Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.6838.1593768639441517989
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 02:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56428 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jrI1j-0007av-BA; Fri, 03 Jul 2020 12:30:36 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/10] python3-importlib-metadata: Upgrade 1.6.1 -> 1.7.0
Date: Fri,  3 Jul 2020 12:30:11 +0300
Message-Id: <20200703093020.3514-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.7.0:

- PathNotFoundError now has a custom __str__ mentioning
  "package metadata" being missing to help guide users to the cause
   when the package is installed but no metadata is present.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...etadata_1.6.1.bb => python3-importlib-metadata_1.7.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-importlib-metadata_1.6.1.bb => python3-importlib-metadata_1.7.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.6.1.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_1.7.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-importlib-metadata_1.6.1.bb
rename to meta-python/recipes-devtools/python/python3-importlib-metadata_1.7.0.bb
index c46df8fcdc..de0fc78368 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_1.7.0.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e"
 
 inherit pypi setuptools3
 
-SRC_URI = "https://files.pythonhosted.org/packages/aa/9a/8483b77e2decd95963d7e34bc9bc91a26e71fd89b57d8cf978ca24747c7f/importlib_metadata-1.6.1.tar.gz"
+SRC_URI = "https://files.pythonhosted.org/packages/e2/ae/0b037584024c1557e537d25482c306cf6327b5a09b6c4b893579292c1c38/importlib_metadata-1.7.0.tar.gz"
 S = "${WORKDIR}/importlib_metadata-${PV}"
-SRC_URI[md5sum] = "38f795ac13abc923acfd3da06263eb8f"
-SRC_URI[sha256sum] = "0505dd08068cfec00f53a74a0ad927676d7757da81b7436a6eefe4c7cf75c545"
+SRC_URI[md5sum] = "4505ea85600cca1e693a4f8f5dd27ba8"
+SRC_URI[sha256sum] = "90bb658cdbbf6d1735b6341ce708fc7024a3e14e99ffdc5783edea9f9b077f83"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 RDEPENDS_${PN} += "${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2"
-- 
2.17.1

