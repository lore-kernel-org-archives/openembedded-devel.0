Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.26301.1611141038338616572
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 03:10:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45624 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l2BNg-0007qB-Bt; Wed, 20 Jan 2021 13:10:35 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-pyyaml: Upgrade 5.3.1 -> 5.4
Date: Wed, 20 Jan 2021 13:10:23 +0200
Message-Id: <20210120111027.12947-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 5.4:

- Build modernization, remove distutils, fix metadata,
  build wheels, CI to GHA
- Fix for CVE-2020-14343, moves arbitrary python tags to
  UnsafeLoader
- Fix memory leak in implicit resolver setup
- Fix py2 copy support for timezone objects
- Fix compatibility with Jython

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pyyaml_5.3.1.bb => python3-pyyaml_5.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyyaml_5.3.1.bb => python3-pyyaml_5.4.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.4.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
rename to meta-python/recipes-devtools/python/python3-pyyaml_5.4.bb
index 8cf909304..e46b608f7 100644
--- a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyyaml_5.4.bb
@@ -2,13 +2,13 @@ SUMMARY = "Python support for YAML"
 DEPENDS += "libyaml ${PYTHON_PN}-cython-native"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7bbd28caa69f81f5cd5f48647236663d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6d8242660a8371add5fe547adf083079"
 
 PYPI_PACKAGE = "PyYAML"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b8eac752c5e14d3eca0e6dd9199cd627518cb5ec06add0de9d32baeee6fe645d"
+SRC_URI[sha256sum] = "3c49e39ac034fd64fd576d63bb4db53cda89b362768a67f07749d55f128ac18a"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
-- 
2.17.1

