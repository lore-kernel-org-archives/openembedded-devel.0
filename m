Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.17644.1589560884479154278
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 09:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45910 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jZdOf-0003c8-CO; Fri, 15 May 2020 19:41:21 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] pamela: Upgrade 0.3.0 -> 1.0.0
Date: Fri, 15 May 2020 19:41:09 +0300
Message-Id: <20200515164109.24082-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 1.0.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/pamela_0.3.0.bb       | 15 ---------------
 .../recipes-devtools/python/pamela_1.0.0.bb       | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/pamela_0.3.0.bb
 create mode 100644 meta-python/recipes-devtools/python/pamela_1.0.0.bb

diff --git a/meta-python/recipes-devtools/python/pamela_0.3.0.bb b/meta-python/recipes-devtools/python/pamela_0.3.0.bb
deleted file mode 100644
index b6bee0ca2..000000000
--- a/meta-python/recipes-devtools/python/pamela_0.3.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Pamela: yet another Python wrapper for PAM"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=bfb663f37eb99232bc8ccfa4ea8f1202"
-
-SRC_URI[md5sum] = "de6516118d51eb5fc97017f3b6d5c68b"
-SRC_URI[sha256sum] = "1e198446a6cdd87704aa0def7621d62e7c20b0e6068e2788b9a866a8355e5d6b"
-
-PYPI_PACKAGE = "pamela"
-
-inherit pypi setuptools3
-
-RDEPENDS_${PN} = "libpam"
-
-inherit features_check
-REQUIRED_DISTRO_FEATURES = "pam"
diff --git a/meta-python/recipes-devtools/python/pamela_1.0.0.bb b/meta-python/recipes-devtools/python/pamela_1.0.0.bb
new file mode 100644
index 000000000..8ce95a5d0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/pamela_1.0.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Pamela: yet another Python wrapper for PAM"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=3f9b78307cdde4e6a4976bfd82a0e7f3"
+
+SRC_URI[md5sum] = "5fc14f5275383ed8bdd509007af0323d"
+SRC_URI[sha256sum] = "65c9389bef7d1bb0b168813b6be21964df32016923aac7515bdf05366acbab6c"
+
+PYPI_PACKAGE = "pamela"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} = "libpam"
+
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "pam"
-- 
2.17.1

