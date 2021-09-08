Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
 by mx.groups.io with SMTP id smtpd.web09.10110.1631101710430659316
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Sep 2021 04:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.2, mailfrom: samuel.dolt.ext@siemens.com)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 188BmSxd021234
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Sep 2021 13:48:28 +0200
Received: from dev.vm7.ccp.siemens.com ([144.145.220.57])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id 188BmSq3025011;
	Wed, 8 Sep 2021 13:48:28 +0200
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm7.ccp.siemens.com (Postfix) with ESMTP id E35AB79596A;
	Wed,  8 Sep 2021 13:48:28 +0200 (CEST)
From: "S. Dolt" <samuel.dolt.ext@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Samuel Dolt <samuel.dolt.ext@siemens.com>
Subject: [meta-python][PATCH 2/3] python3-editor: add native and nativesdk to BBCLASSEXTEND
Date: Wed,  8 Sep 2021 13:48:24 +0200
Message-Id: <20210908114825.15679-2-samuel.dolt.ext@siemens.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210908114825.15679-1-samuel.dolt.ext@siemens.com>
References: <20210908114825.15679-1-samuel.dolt.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samuel Dolt <samuel.dolt.ext@siemens.com>

Signed-off-by: Samuel Dolt <samuel.dolt.ext@siemens.com>
---
 meta-python/recipes-devtools/python/python3-editor_1.0.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb b/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
index c7a6cd8f0..dffc36169 100644
--- a/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
@@ -8,3 +8,5 @@ SRC_URI[sha256sum] = "51fda6bcc5ddbbb7063b2af7509e43bd84bfc32a4ff71349ec78477138
 PYPI_PACKAGE = "python-editor"
 
 inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1

