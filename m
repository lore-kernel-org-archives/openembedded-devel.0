Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.15995.1593011819031136579
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2020 08:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53538 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jo791-00035d-Cj; Wed, 24 Jun 2020 18:17:00 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/10] python3-lazy-object-proxy: Consolidate in a single file
Date: Wed, 24 Jun 2020 18:16:24 +0300
Message-Id: <20200624151628.547-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624151628.547-1-leon.anavi@konsulko.com>
References: <20200624151628.547-1-leon.anavi@konsulko.com>
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
 .../python/python-lazy-object-proxy.inc            | 12 ------------
 .../python/python3-lazy-object-proxy_1.4.3.bb      | 14 ++++++++++++--
 2 files changed, 12 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-lazy-object-proxy.inc

diff --git a/meta-python/recipes-devtools/python/python-lazy-object-proxy.inc b/meta-python/recipes-devtools/python/python-lazy-object-proxy.inc
deleted file mode 100644
index bbbd66ce6..000000000
--- a/meta-python/recipes-devtools/python/python-lazy-object-proxy.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "A fast and thorough lazy object proxy"
-HOMEPAGE = "https://python-lazy-object-proxy.readthedocs.io/"
-LICENSE = "BSD-2-Clause"
-SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf"
-
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-
-SRC_URI[md5sum] = "5c64c06affcd2a7c6ddc848af4280cca"
-SRC_URI[sha256sum] = "f3900e8a5de27447acbf900b4750b0ddfd7ec1ea7fbaf11dfa911141bc522af0"
-
-inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.4.3.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.4.3.bb
index 150e12fd4..bd197adcb 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.4.3.bb
@@ -1,2 +1,12 @@
-inherit setuptools3
-require python-lazy-object-proxy.inc
+SUMMARY = "A fast and thorough lazy object proxy"
+HOMEPAGE = "https://python-lazy-object-proxy.readthedocs.io/"
+LICENSE = "BSD-2-Clause"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
+SRC_URI[md5sum] = "5c64c06affcd2a7c6ddc848af4280cca"
+SRC_URI[sha256sum] = "f3900e8a5de27447acbf900b4750b0ddfd7ec1ea7fbaf11dfa911141bc522af0"
+
+inherit pypi setuptools3
-- 
2.17.1

