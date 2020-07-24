Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.3466.1595586928904914845
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2020 03:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34792 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jyv2x-0006km-Rm; Fri, 24 Jul 2020 13:35:26 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-pytest-metadata: Upgrade 1.9.0 -> 1.10.0
Date: Fri, 24 Jul 2020 13:35:09 +0300
Message-Id: <20200724103515.21420-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.10.0:

- Compatible with pytest-xdist 1.22.3+, now including 2.0+

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...est-metadata_1.9.0.bb => python3-pytest-metadata_1.10.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-metadata_1.9.0.bb => python3-pytest-metadata_1.10.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.9.0.bb b/meta-python/recipes-devtools/python/python3-pytest-metadata_1.10.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-pytest-metadata_1.9.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-metadata_1.10.0.bb
index 4a77af3cf..70cc98f29 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-metadata_1.10.0.bb
@@ -4,7 +4,8 @@ DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
-SRC_URI[sha256sum] = "168d203abba8cabb65cf1b5fa675b0ba60dccbf1825d147960876a7e6f7c219c"
+SRC_URI[sha256sum] = "b7e6e0a45adacb17a03a97bf7a2ef60cc1f4e172bcce9732ce5e814191932315"
+SRC_URI[md5sum] = "4fcf9764e6210c4555411fce8109e7cd"
 
 PYPI_PACKAGE = "pytest-metadata"
 
-- 
2.17.1

