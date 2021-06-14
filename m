Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.29650.1623677100258012938
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jun 2021 06:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38640 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lsmaF-0004QX-81; Mon, 14 Jun 2021 16:24:59 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-dill: Upgrade 0.3.3 -> 0.3.4
Date: Mon, 14 Jun 2021 16:24:36 +0300
Message-Id: <20210614132437.20878-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210614132437.20878-1-leon.anavi@konsulko.com>
References: <20210614132437.20878-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.3.4:

- fix typos and formatting
- update legacy links
- rename Examples in README

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-dill_0.3.3.bb  | 11 -----------
 .../recipes-devtools/python/python3-dill_0.3.4.bb  | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-dill_0.3.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-dill_0.3.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.3.bb b/meta-python/recipes-devtools/python/python3-dill_0.3.3.bb
deleted file mode 100644
index bf26ba30b5..0000000000
--- a/meta-python/recipes-devtools/python/python3-dill_0.3.3.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "Serialize all of python"
-HOMEPAGE = "https://pypi.org/project/dill/"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=90fee9f98d11d59df3f8aa813ff9a3de"
-
-SRC_URI[md5sum] = "99c878e2e4e924f3234c0efcbcff6abf"
-SRC_URI[sha256sum] = "efb7f6cb65dba7087c1e111bb5390291ba3616741f96840bfc75792a1a9b5ded"
-
-inherit pypi setuptools3
-
-PYPI_PACKAGE_EXT = "zip"
diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.4.bb b/meta-python/recipes-devtools/python/python3-dill_0.3.4.bb
new file mode 100644
index 0000000000..0634e17f5e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dill_0.3.4.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Serialize all of python"
+HOMEPAGE = "https://pypi.org/project/dill/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=41adceb584fdde8323ddf9ad23c07fe5"
+
+SRC_URI[sha256sum] = "9f9734205146b2b353ab3fec9af0070237b6ddae78452af83d2fca84d739e675"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE_EXT = "zip"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-multiprocessing \
+"
-- 
2.17.1

