Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.2573.1605178599480781963
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 02:56:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39606 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kdAHN-0006p6-Cc; Thu, 12 Nov 2020 12:56:38 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-dill: Upgrade 0.3.2 -> 0.3.3
Date: Thu, 12 Nov 2020 12:56:15 +0200
Message-Id: <20201112105618.23773-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201112105618.23773-1-leon.anavi@konsulko.com>
References: <20201112105618.23773-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.3.3:

- Treat extension modules as built-in
- Fix typo in README.md

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-dill_0.3.2.bb     |  9 ---------
 .../recipes-devtools/python/python3-dill_0.3.3.bb     | 11 +++++++++++
 2 files changed, 11 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-dill_0.3.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-dill_0.3.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.2.bb b/meta-python/recipes-devtools/python/python3-dill_0.3.2.bb
deleted file mode 100644
index b03e032669..0000000000
--- a/meta-python/recipes-devtools/python/python3-dill_0.3.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-inherit pypi setuptools3
-
-SUMMARY = "Serialize all of python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=90fee9f98d11d59df3f8aa813ff9a3de"
-
-SRC_URI = "https://files.pythonhosted.org/packages/e2/96/518a8ea959a734b70d2e95fef98bcbfdc7adad1c1e5f5dd9148c835205a5/dill-${PV}.zip"
-SRC_URI[md5sum] = "543607e0a419f154dca65265e87e4812"
-SRC_URI[sha256sum] = "6e12da0d8e49c220e8d6e97ee8882002e624f1160289ce85ec2cc0a5246b3a2e"
diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.3.bb b/meta-python/recipes-devtools/python/python3-dill_0.3.3.bb
new file mode 100644
index 0000000000..bf26ba30b5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dill_0.3.3.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Serialize all of python"
+HOMEPAGE = "https://pypi.org/project/dill/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=90fee9f98d11d59df3f8aa813ff9a3de"
+
+SRC_URI[md5sum] = "99c878e2e4e924f3234c0efcbcff6abf"
+SRC_URI[sha256sum] = "efb7f6cb65dba7087c1e111bb5390291ba3616741f96840bfc75792a1a9b5ded"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE_EXT = "zip"
-- 
2.17.1

