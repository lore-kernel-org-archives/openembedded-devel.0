Received: from david.siemens.de (david.siemens.de [192.35.17.14])
 by mx.groups.io with SMTP id smtpd.web08.7156.1614068827761299807
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 00:27:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.14, mailfrom: andrej.valek@siemens.com)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 11N8R58M015075
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Feb 2021 09:27:05 +0100
Received: from dev.vm6.ccp.siemens.com ([144.145.220.53])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 11N8R4mt027518;
	Tue, 23 Feb 2021 09:27:04 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 4FE659508F2;
	Tue, 23 Feb 2021 09:27:04 +0100 (CET)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>
Subject: [oe][meta-oe][dunfell][PATCH] jsoncpp: Upgrade to 1.9.4
Date: Tue, 23 Feb 2021 09:25:53 +0100
Message-Id: <20210223082553.29759-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0

 - do not install obj files

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../recipes-devtools/jsoncpp/{jsoncpp_1.9.3.bb => jsoncpp_1.9.4.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.3.bb => jsoncpp_1.9.4.bb} (82%)

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.4.bb
similarity index 82%
rename from meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
rename to meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.4.bb
index e41907de4..a02ff4a4d 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.4.bb
@@ -13,13 +13,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fa2a23dd1dc6c139f35105379d76df2b"
 
 PE = "1"
 
-SRCREV = "6aba23f4a8628d599a9ef7fa4811c4ff6e4070e2"
+SRCREV = "9059f5cad030ba11d37818847443a53918c327b1"
 SRC_URI = "git://github.com/open-source-parsers/jsoncpp"
 
 S = "${WORKDIR}/git"
 
 inherit cmake
 
-EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DJSONCPP_WITH_TESTS=OFF"
+EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DBUILD_OBJECT_LIBS=OFF -DJSONCPP_WITH_TESTS=OFF"
 
 BBCLASSEXTEND = "native"
-- 
2.11.0

