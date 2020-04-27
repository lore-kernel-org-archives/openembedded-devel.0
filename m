Received: from david.siemens.de (david.siemens.de [192.35.17.14])
 by mx.groups.io with SMTP id smtpd.web12.4215.1587988840170130886
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2020 05:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.14, mailfrom: martin.balik@siemens.com)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 03RC0bY5027578
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2020 14:00:38 +0200
Received: from dev.vm7.ccp.siemens.com ([158.226.192.215])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 03RC0aP7030143;
	Mon, 27 Apr 2020 14:00:37 +0200
Received: from dev.vm7.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm7.ccp.siemens.com (Postfix) with ESMTP id E2D3071418D;
	Mon, 27 Apr 2020 14:00:35 +0200 (CEST)
From: "Martin Balik" <martin.balik@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Balik <martin.balik@siemens.com>
Subject: [oe][meta-oe][PATCH v2] libwebsockets: upgrade 3.2.2 -> 4.0.1
Date: Mon, 27 Apr 2020 13:59:32 +0200
Message-Id: <20200427115932.4479-1-martin.balik@siemens.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <a1bd8357-97f7-f3cc-4b97-e63656c01452@gmail.com>
References: <a1bd8357-97f7-f3cc-4b97-e63656c01452@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License changed from "LGPL-2.1" to "MIT"

Signed-off-by: Martin Balik <martin.balik@siemens.com>
---
 .../{libwebsockets_3.2.2.bb => libwebsockets_4.0.1.bb}    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_3.2.2.bb => libwebsockets_4.0.1.bb} (86%)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.2.2.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.1.bb
similarity index 86%
rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.2.2.bb
rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.1.bb
index 32ba51db0..0d1f57ab8 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.2.2.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.1.bb
@@ -1,13 +1,13 @@
 SUMMARY = "Canonical libwebsockets.org websocket library"
 HOMEPAGE = "https://libwebsockets.org/"
-LICENSE = "LGPL-2.1"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4ce87f3facb6f911c142c8bef9bfb380"
+LICENSE = "MIT & Zlib & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8c47b078124308a4e1354e8d59f606b7"
 
 DEPENDS = "zlib"
 
 S = "${WORKDIR}/git"
-SRCREV = "d880fe233020b74e058cbca95b5fb67823bbf258"
-SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v3.2-stable"
+SRCREV = "6eb39388f43f6e2a27f0efcbf8cb2391e38824e9"
+SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.0-stable"
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-- 
2.20.1

