Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
 by mx.groups.io with SMTP id smtpd.web11.10392.1631102988727551084
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Sep 2021 05:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.28, mailfrom: samuel.dolt.ext@siemens.com)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 188C9jQk001772
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Sep 2021 14:09:46 +0200
Received: from dev.vm7.ccp.siemens.com ([144.145.220.57])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id 188C9j5k031646;
	Wed, 8 Sep 2021 14:09:45 +0200
Received: from dev.vm7.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm7.ccp.siemens.com (Postfix) with ESMTP id A25AF79596A;
	Wed,  8 Sep 2021 14:09:45 +0200 (CEST)
From: "S. Dolt" <samuel.dolt.ext@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Samuel Dolt <samuel.dolt.ext@siemens.com>
Subject: [meta-python][PATCH] python3-portalocker: add recipe
Date: Wed,  8 Sep 2021 14:08:58 +0200
Message-Id: <20210908120858.18016-1-samuel.dolt.ext@siemens.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samuel Dolt <samuel.dolt.ext@siemens.com>

Signed-off-by: Samuel Dolt <samuel.dolt.ext@siemens.com>
---
 .../python3-portalocker/python3-portalocker_2.3.2.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.3.2.bb

diff --git a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.3.2.bb b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.3.2.bb
new file mode 100644
index 000000000..bf9304cdd
--- /dev/null
+++ b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.3.2.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Cross-platform locking library"
+DESCRIPTION = "Portalocker is a library to provide an easy API to file locking"
+LICENSE = "PSF"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f9273424c73af966635d66eb53487e14"
+
+SRC_URI[md5sum] = "bd4908d035464aa440dd7f262ef78345"
+SRC_URI[sha256sum] = "75cfe02f702737f1726d83e04eedfa0bda2cc5b974b1ceafb8d6b42377efbd5f"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1

