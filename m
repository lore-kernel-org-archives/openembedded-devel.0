Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.1145.1609970848288792710
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 14:07:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=51612 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kxGxi-0004lA-3M; Thu, 07 Jan 2021 00:07:26 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/10] python3-pytest-metadata: Upgrade 1.10.0 -> 1.11.0
Date: Thu,  7 Jan 2021 00:06:58 +0200
Message-Id: <20210106220702.10483-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210106220702.10483-1-leon.anavi@konsulko.com>
References: <20210106220702.10483-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.11.0:

- Provide a session fixture to include metadata in Junit XMLs
  as property tags

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...st-metadata_1.10.0.bb => python3-pytest-metadata_1.11.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-metadata_1.10.0.bb => python3-pytest-metadata_1.11.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.10.0.bb b/meta-python/recipes-devtools/python/python3-pytest-metadata_1.11.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-pytest-metadata_1.10.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-metadata_1.11.0.bb
index 70cc98f294..a1b62d16e4 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-metadata_1.11.0.bb
@@ -4,8 +4,7 @@ DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
-SRC_URI[sha256sum] = "b7e6e0a45adacb17a03a97bf7a2ef60cc1f4e172bcce9732ce5e814191932315"
-SRC_URI[md5sum] = "4fcf9764e6210c4555411fce8109e7cd"
+SRC_URI[sha256sum] = "71b506d49d34e539cc3cfdb7ce2c5f072bea5c953320002c95968e0238f8ecf1"
 
 PYPI_PACKAGE = "pytest-metadata"
 
-- 
2.17.1

