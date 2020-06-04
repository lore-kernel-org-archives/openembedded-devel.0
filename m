Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.12643.1591272764960457769
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jun 2020 05:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50342 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jgoji-0002zK-U6; Thu, 04 Jun 2020 15:12:43 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/6] python3-future: Consolidate in a single file
Date: Thu,  4 Jun 2020 15:12:20 +0300
Message-Id: <20200604121223.3818-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200604121223.3818-1-leon.anavi@konsulko.com>
References: <20200604121223.3818-1-leon.anavi@konsulko.com>
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
 .../recipes-devtools/python/python-future.inc     | 13 -------------
 .../python/python3-future_0.18.2.bb               | 15 +++++++++++++--
 2 files changed, 13 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-future.inc

diff --git a/meta-python/recipes-devtools/python/python-future.inc b/meta-python/recipes-devtools/python/python-future.inc
deleted file mode 100644
index c0a2b39ba..000000000
--- a/meta-python/recipes-devtools/python/python-future.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "Clean single-source support for Python 3 and 2"
-HOMEPAGE = "https://python-future.org"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a253924061f8ecc41ad7a2ba1560e8e7"
-
-SRC_URI[md5sum] = "e4579c836b9c025872efe230f6270349"
-SRC_URI[sha256sum] = "b1bead90b70cf6ec3f0710ae53a525360fa360d306a86583adc6bf83a4db537d"
-
-PYPI_PACKAGE_HASH = "99abde815842bc6e97d5a7806ad51236630da14ca2f3b1fce94c0bb94d3d"
-
-inherit pypi
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-future_0.18.2.bb b/meta-python/recipes-devtools/python/python3-future_0.18.2.bb
index f059186bf..90d1661d4 100644
--- a/meta-python/recipes-devtools/python/python3-future_0.18.2.bb
+++ b/meta-python/recipes-devtools/python/python3-future_0.18.2.bb
@@ -1,2 +1,13 @@
-inherit setuptools3
-require python-future.inc
+DESCRIPTION = "Clean single-source support for Python 3 and 2"
+HOMEPAGE = "https://python-future.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a253924061f8ecc41ad7a2ba1560e8e7"
+
+SRC_URI[md5sum] = "e4579c836b9c025872efe230f6270349"
+SRC_URI[sha256sum] = "b1bead90b70cf6ec3f0710ae53a525360fa360d306a86583adc6bf83a4db537d"
+
+PYPI_PACKAGE_HASH = "99abde815842bc6e97d5a7806ad51236630da14ca2f3b1fce94c0bb94d3d"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

