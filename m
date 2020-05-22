Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.9380.1590136438430812591
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 01:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53908 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jc37s-0000wd-74; Fri, 22 May 2020 11:33:57 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-zipp: Upgrade 0.6.0 -> 3.1.0
Date: Fri, 22 May 2020 11:33:30 +0300
Message-Id: <20200522083330.6934-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200522083330.6934-1-leon.anavi@konsulko.com>
References: <20200522083330.6934-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.1.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-zipp_0.6.0.bb => python3-zipp_3.1.0.bb}      | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-zipp_0.6.0.bb => python3-zipp_3.1.0.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-zipp_0.6.0.bb b/meta-python/recipes-devtools/python/python3-zipp_3.1.0.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-zipp_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-zipp_3.1.0.bb
index 40db3c071..a29e2981f 100644
--- a/meta-python/recipes-devtools/python/python3-zipp_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zipp_3.1.0.bb
@@ -1,15 +1,17 @@
 DESCRIPTION = "Backport of pathlib-compatible object wrapper for zip files"
 HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a33f38bbf47d48c70fe0d40e5f77498e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[md5sum] = "d4451a749d8a7c3c392a9edd1864a937"
-SRC_URI[sha256sum] = "3718b1cbcd963c7d4c5511a8240812904164b7f381b647143a89d3b98f9bcd8e"
+SRC_URI[md5sum] = "199da7385f080ec45da6c1942e2b5996"
+SRC_URI[sha256sum] = "c599e4d75c98f6798c509911d08a22e6c021d074469042177c8c86fb92eefd96"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
 inherit pypi setuptools3
 
+DEPENDS += "${PYTHON_PN}-toml-native"
+
 RDEPENDS_${PN} += "${PYTHON_PN}-compression \
                    ${PYTHON_PN}-math \
                    ${PYTHON_PN}-more-itertools"
-- 
2.17.1

