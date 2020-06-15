Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.14598.1592217038290272211
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2020 03:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45690 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jkmNw-0002ty-S3; Mon, 15 Jun 2020 13:30:37 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-importlib-metadata: Upgrade 1.5.2 -> 1.6.1
Date: Mon, 15 Jun 2020 13:30:16 +0300
Message-Id: <20200615103017.2714-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615103017.2714-1-leon.anavi@konsulko.com>
References: <20200615103017.2714-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.6.1:

- Added Distribution._local() as a provisional demonstration of
  how to load metadata for a local package. Implicitly requires
  that pep517 is installed
- Ensure inputs to FastPath are Unicode
- Tests now rely on importlib.resources.files (and backport)
  instead of the older path function.
- Support any iterable from find_distributions
- Added module and attr attributes to EntryPoint

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...etadata_1.5.2.bb => python3-importlib-metadata_1.6.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-importlib-metadata_1.5.2.bb => python3-importlib-metadata_1.6.1.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.5.2.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_1.6.1.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-importlib-metadata_1.5.2.bb
rename to meta-python/recipes-devtools/python/python3-importlib-metadata_1.6.1.bb
index 5170855c2..c46df8fcd 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_1.6.1.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e"
 
 inherit pypi setuptools3
 
-SRC_URI = "https://files.pythonhosted.org/packages/d7/cd/3b1dffa46b19dac269d586b9d45090588a8bd7a5741602a369d45e1bdf65/importlib_metadata-1.5.2.tar.gz"
+SRC_URI = "https://files.pythonhosted.org/packages/aa/9a/8483b77e2decd95963d7e34bc9bc91a26e71fd89b57d8cf978ca24747c7f/importlib_metadata-1.6.1.tar.gz"
 S = "${WORKDIR}/importlib_metadata-${PV}"
-SRC_URI[md5sum] = "35a85a81c7d86605f4f49397f4e7e39c"
-SRC_URI[sha256sum] = "dfc83688553a91a786c6c91eeb5f3b1d31f24d71877bbd94ecbf5484e57690a2"
+SRC_URI[md5sum] = "38f795ac13abc923acfd3da06263eb8f"
+SRC_URI[sha256sum] = "0505dd08068cfec00f53a74a0ad927676d7757da81b7436a6eefe4c7cf75c545"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 RDEPENDS_${PN} += "${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2"
-- 
2.17.1

