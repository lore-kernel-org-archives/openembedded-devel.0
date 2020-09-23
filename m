Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.8079.1600847930959969539
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 00:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58518 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kKzfr-0005D6-6P; Wed, 23 Sep 2020 10:58:49 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-importlib-metadata: Upgrade 1.7.0 -> 2.0.0
Date: Wed, 23 Sep 2020 10:58:26 +0300
Message-Id: <20200923075830.30859-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200923075830.30859-1-leon.anavi@konsulko.com>
References: <20200923075830.30859-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.0.0:

- importlib_metadata no longer presents a __version__ attribute.
  Consumers wishing to resolve the version of the package should
  query it directly with
  importlib_metadata.version('importlib-metadata').

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...etadata_1.7.0.bb => python3-importlib-metadata_2.0.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-importlib-metadata_1.7.0.bb => python3-importlib-metadata_2.0.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.7.0.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-importlib-metadata_1.7.0.bb
rename to meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb
index de0fc78368..325a41c22e 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e"
 
 inherit pypi setuptools3
 
-SRC_URI = "https://files.pythonhosted.org/packages/e2/ae/0b037584024c1557e537d25482c306cf6327b5a09b6c4b893579292c1c38/importlib_metadata-1.7.0.tar.gz"
+SRC_URI = "https://files.pythonhosted.org/packages/56/1f/74c3e29389d34feea2d62ba3de1169efea2566eb22e9546d379756860525/importlib_metadata-2.0.0.tar.gz"
 S = "${WORKDIR}/importlib_metadata-${PV}"
-SRC_URI[md5sum] = "4505ea85600cca1e693a4f8f5dd27ba8"
-SRC_URI[sha256sum] = "90bb658cdbbf6d1735b6341ce708fc7024a3e14e99ffdc5783edea9f9b077f83"
+SRC_URI[md5sum] = "3dd91821c930a3c3633e99a7025aa9c2"
+SRC_URI[sha256sum] = "77a540690e24b0305878c37ffd421785a6f7e53c8b5720d211b211de8d0e95da"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 RDEPENDS_${PN} += "${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2"
-- 
2.17.1

