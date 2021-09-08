Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
 by mx.groups.io with SMTP id smtpd.web12.10318.1631101711832099234
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Sep 2021 04:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.2, mailfrom: samuel.dolt.ext@siemens.com)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 188BmUne021257
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Sep 2021 13:48:30 +0200
Received: from dev.vm7.ccp.siemens.com ([144.145.220.57])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id 188BmUce025117;
	Wed, 8 Sep 2021 13:48:30 +0200
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm7.ccp.siemens.com (Postfix) with ESMTP id 5ABA479596A;
	Wed,  8 Sep 2021 13:48:30 +0200 (CEST)
From: "S. Dolt" <samuel.dolt.ext@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Samuel Dolt <samuel.dolt.ext@siemens.com>
Subject: [meta-python][PATCH 3/3] python3-sqlalchemy: add native and nativesdk to BBCLASSEXTEND
Date: Wed,  8 Sep 2021 13:48:25 +0200
Message-Id: <20210908114825.15679-3-samuel.dolt.ext@siemens.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210908114825.15679-1-samuel.dolt.ext@siemens.com>
References: <20210908114825.15679-1-samuel.dolt.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samuel Dolt <samuel.dolt.ext@siemens.com>

Signed-off-by: Samuel Dolt <samuel.dolt.ext@siemens.com>
---
 .../recipes-devtools/python/python3-sqlalchemy_1.4.23.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.23.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.23.bb
index 1b8af825a..4bfaf656d 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.23.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.23.bb
@@ -19,3 +19,5 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-compression \
     ${PYTHON_PN}-profile \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1

