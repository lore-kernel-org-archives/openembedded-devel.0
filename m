Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.38435.1599227248113545940
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2020 06:47:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38492 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kEC3q-0000aK-5d; Fri, 04 Sep 2020 16:47:26 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/10] python3-gsocketpool: Consolidate in a single file
Date: Fri,  4 Sep 2020 16:47:10 +0300
Message-Id: <20200904134713.13164-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904134713.13164-1-leon.anavi@konsulko.com>
References: <20200904134713.13164-1-leon.anavi@konsulko.com>
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
 .../python-gsocketpool/python-gsocketpool.inc      | 12 ------------
 .../python3-gsocketpool_0.1.6.bb                   | 14 ++++++++++++--
 2 files changed, 12 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool.inc

diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool.inc b/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool.inc
deleted file mode 100644
index 11971dc4a..000000000
--- a/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "A simple connection pool for gevent"
-DESCRIPTION = "creates a pool of connections that can be used with gevent"
-HOMEPAGE = "https://github.com/studio-ousia/gsocketpool"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
-DEPENDS += "${PYTHON_PN}-gevent"
-RDEPENDS_${PN} += "${PYTHON_PN}-gevent"
-
-SRC_URI[md5sum] = "49f5f292ef1b60944ae92ca426a5e550"
-SRC_URI[sha256sum] = "f2e2749aceadce6b27ca52e2b0a64af99797746a8681e1a2963f72007c14cb14"
-
-inherit pypi
diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
index 883621e21..d3e7d48da 100644
--- a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
+++ b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
@@ -1,2 +1,12 @@
-require python-gsocketpool.inc
-inherit setuptools3
+SUMMARY = "A simple connection pool for gevent"
+DESCRIPTION = "creates a pool of connections that can be used with gevent"
+HOMEPAGE = "https://github.com/studio-ousia/gsocketpool"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
+DEPENDS += "${PYTHON_PN}-gevent"
+RDEPENDS_${PN} += "${PYTHON_PN}-gevent"
+
+SRC_URI[md5sum] = "49f5f292ef1b60944ae92ca426a5e550"
+SRC_URI[sha256sum] = "f2e2749aceadce6b27ca52e2b0a64af99797746a8681e1a2963f72007c14cb14"
+
+inherit pypi setuptools3
-- 
2.17.1

