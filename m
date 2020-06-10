Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.7580.1591784365833611190
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 03:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35750 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jixpJ-0002HQ-JX; Wed, 10 Jun 2020 13:19:23 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2] python3-lxml: Upgrade 4.5.0 -> 4.5.1
Date: Wed, 10 Jun 2020 13:19:14 +0300
Message-Id: <20200610101914.14595-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.5.1. With this release we no longer need to
specify --with-xml2-config='pkg-config libxml-2.0' or equivalent
for libxslt. Following the recent modifications of setupinfo.py
to use pkg-config, we just need build without flags.

Suggested-by: Stefan Behnel <stefan_ml@behnel.de>
Suggested-by: Hugh McMaster <hugh.mcmaster@outlook.com>
Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-lxml_4.5.0.bb => python3-lxml_4.5.1.bb} | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.5.0.bb => python3-lxml_4.5.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb b/meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
index e3cfa46d1..a4198b029 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
@@ -18,18 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "f088e452ed45b030b6f84269f1e84d11"
-SRC_URI[sha256sum] = "8620ce80f50d023d414183bf90cc2576c2837b88e00bea3f33ad2630133bbb60"
-
-DISTUTILS_BUILD_ARGS += " \
-                     --with-xslt-config='pkg-config libxslt' \
-                     --with-xml2-config='pkg-config libxml-2.0' \
-"
-
-DISTUTILS_INSTALL_ARGS += " \
-                     --with-xslt-config='pkg-config libxslt' \
-                     --with-xml2-config='pkg-config libxml-2.0' \
-"
+SRC_URI[md5sum] = "4d3cca9c0018dd98f39e0ac54fcc3d14"
+SRC_URI[sha256sum] = "27ee0faf8077c7c1a589573b1450743011117f1aa1a91d5ae776bbc5ca6070f2"
 
 inherit pypi setuptools3
 
-- 
2.17.1

