Received: from david.siemens.de (david.siemens.de [192.35.17.14])
 by mx.groups.io with SMTP id smtpd.web11.10155.1631101709776808568
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Sep 2021 04:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.14, mailfrom: samuel.dolt.ext@siemens.com)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 188BmRTG018448
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Sep 2021 13:48:27 +0200
Received: from dev.vm7.ccp.siemens.com ([144.145.220.57])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id 188BmREY024930;
	Wed, 8 Sep 2021 13:48:27 +0200
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm7.ccp.siemens.com (Postfix) with ESMTP id C6AF479596A;
	Wed,  8 Sep 2021 13:48:27 +0200 (CEST)
From: samuel.dolt.ext@siemens.com
To: openembedded-devel@lists.openembedded.org
Cc: Samuel Dolt <samuel.dolt.ext@siemens.com>
Subject: [meta-python][PATCH 1/3] python3-alembic: add native and nativesdk to BBCLASSEXTEND
Date: Wed,  8 Sep 2021 13:48:23 +0200
Message-Id: <20210908114825.15679-1-samuel.dolt.ext@siemens.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samuel Dolt <samuel.dolt.ext@siemens.com>

Signed-off-by: Samuel Dolt <samuel.dolt.ext@siemens.com>
---
 meta-python/recipes-devtools/python/python3-alembic_1.6.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.6.5.bb b/meta-python/recipes-devtools/python/python3-alembic_1.6.5.bb
index 9af21c92f..e1f29cad2 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.6.5.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.6.5.bb
@@ -15,3 +15,5 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlalchemy \
     ${PYTHON_PN}-misc \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1

