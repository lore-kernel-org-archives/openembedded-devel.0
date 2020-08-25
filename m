Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
 by mx.groups.io with SMTP id smtpd.web12.13015.1598361015598282677
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 06:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.28, mailfrom: andrej.valek@siemens.com)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 07PDAD4d002791
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2020 15:10:13 +0200
Received: from dev.vm6.ccp.siemens.com ([167.87.244.214])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id 07PDADST026923;
	Tue, 25 Aug 2020 15:10:13 +0200
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id BFA93986D68;
	Tue, 25 Aug 2020 15:10:12 +0200 (CEST)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>
Subject: [oe][meta-networking][PATCH] squid: upgrade 4.12 -> 4.13
Date: Tue, 25 Aug 2020 15:10:07 +0200
Message-Id: <20200825131007.28575-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0

Changes are found at: http://www.squid-cache.org/Versions/v4/changesets

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../recipes-daemons/squid/{squid_4.12.bb => squid_4.13.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/squid/{squid_4.12.bb => squid_4.13.bb} (97%)

diff --git a/meta-networking/recipes-daemons/squid/squid_4.12.bb b/meta-networking/recipes-daemons/squid/squid_4.13.bb
similarity index 97%
rename from meta-networking/recipes-daemons/squid/squid_4.12.bb
rename to meta-networking/recipes-daemons/squid/squid_4.13.bb
index 6e49790fe..873d09344 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.12.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.13.bb
@@ -28,8 +28,8 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
 
 SRC_URI_remove_toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
 
-SRC_URI[md5sum] = "5d058f7f8f1db9fa4ce3db910a008b0e"
-SRC_URI[sha256sum] = "eae0ad993921e472ce36cce34674c47a224fc2868b65ef0c4b41b2f5f18378a0"
+SRC_URI[md5sum] = "31e524a416715d6bfef30e072d2ca076"
+SRC_URI[sha256sum] = "d09d3c31e3a7d158bda75501e763bd1cd3c3a99f5af6781ec1fd30eed2f771ed"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://errors/COPYRIGHT;md5=4c3268f394af77fbbf541875cef96a6c \
-- 
2.11.0

