Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.16571.1591955295376775613
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 02:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45372 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jjgIH-0001HN-H3; Fri, 12 Jun 2020 12:48:14 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-parse-type: Upgrade 0.4.2 -> 0.5.2
Date: Fri, 12 Jun 2020 12:47:57 +0300
Message-Id: <20200612094757.22146-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200612094757.22146-1-leon.anavi@konsulko.com>
References: <20200612094757.22146-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.5.2. The year in file LICENCE has been
changed therefore the checksum has been changed but it still
remains a BSD License. Add python3-six as a run-time dependency.
The new release brings:

- Update to parse-1.12.0
- Code cleanups
- Bug fixes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-parse-type_0.4.2.bb => python3-parse-type_0.5.2.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-parse-type_0.4.2.bb => python3-parse-type_0.5.2.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.5.2.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb
rename to meta-python/recipes-devtools/python/python3-parse-type_0.5.2.bb
index a9e7a53ee..f61c480bd 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-parse-type_0.5.2.bb
@@ -1,15 +1,15 @@
 SUMMARY = "Simplifies building parse types based on the parse module"
 HOMEPAGE = "https://github.com/jenisys/parse_type"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d07323820cca0f1d192cbbf8a0516f95"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=16374dbaeaca1890153edb3f41371222"
 
-SRC_URI[md5sum] = "b5fa59e45965d1b2896023742df2e707"
-SRC_URI[sha256sum] = "f596bdc75d3dd93036fbfe3d04127da9f6df0c26c36e01e76da85adef4336b3c"
+SRC_URI[md5sum] = "b954062f14ab723a91fe1e2be15e859d"
+SRC_URI[sha256sum] = "7f690b18d35048c15438d6d0571f9045cffbec5907e0b1ccf006f889e3a38c0b"
 
 PYPI_PACKAGE = "parse_type"
 inherit pypi ptest setuptools3
 
-RDEPENDS_${PN} += "${PYTHON_PN}-parse"
+RDEPENDS_${PN} += "${PYTHON_PN}-parse ${PYTHON_PN}-six"
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.17.1

