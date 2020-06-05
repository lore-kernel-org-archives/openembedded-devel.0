Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.325.1591378326623534957
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 10:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50784 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jhGCH-0000HW-EI; Fri, 05 Jun 2020 20:32:02 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-jsonpatch: Consolidate in a single file
Date: Fri,  5 Jun 2020 20:31:51 +0300
Message-Id: <20200605173152.2360-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.7
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

Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python-jsonpatch.inc    | 12 ------------
 .../python/python3-jsonpatch_1.25.bb                | 13 +++++++++++--
 2 files changed, 11 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-jsonpatch.inc

diff --git a/meta-python/recipes-devtools/python/python-jsonpatch.inc b/meta-python/recipes-devtools/python/python-jsonpatch.inc
deleted file mode 100644
index e23f96b61..000000000
--- a/meta-python/recipes-devtools/python/python-jsonpatch.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY  = "Appling JSON patches in Python 2.6+ and 3.x"
-HOMEPAGE = "https://github.com/stefankoegl/python-json-patch"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
-
-inherit pypi
-
-SRC_URI[md5sum] = "fcc546892414bef2f7f89f0e2a618a9e"
-SRC_URI[sha256sum] = "ddc0f7628b8bfdd62e3cbfbc24ca6671b0b6265b50d186c2cf3659dc0f78fd6a"
-
-RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-stringold"
-
diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.25.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.25.bb
index 73efceeed..8ec21ff11 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.25.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.25.bb
@@ -1,2 +1,11 @@
-inherit setuptools3
-require python-jsonpatch.inc
+SUMMARY  = "Appling JSON patches in Python 2.6+ and 3.x"
+HOMEPAGE = "https://github.com/stefankoegl/python-json-patch"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "fcc546892414bef2f7f89f0e2a618a9e"
+SRC_URI[sha256sum] = "ddc0f7628b8bfdd62e3cbfbc24ca6671b0b6265b50d186c2cf3659dc0f78fd6a"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-stringold"
-- 
2.17.1

