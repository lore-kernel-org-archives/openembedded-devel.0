Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.12646.1591272770602992378
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jun 2020 05:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50342 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jgojo-0002zK-TD; Thu, 04 Jun 2020 15:12:49 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/6] python3-greenlet: Consolidate in a single file
Date: Thu,  4 Jun 2020 15:12:22 +0300
Message-Id: <20200604121223.3818-5-leon.anavi@konsulko.com>
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
 .../recipes-devtools/python/python-greenlet.inc       |  9 ---------
 .../python/python3-greenlet_0.4.15.bb                 | 11 +++++++++--
 2 files changed, 9 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-greenlet.inc

diff --git a/meta-python/recipes-devtools/python/python-greenlet.inc b/meta-python/recipes-devtools/python/python-greenlet.inc
deleted file mode 100644
index c7c656c84..000000000
--- a/meta-python/recipes-devtools/python/python-greenlet.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "Python lightweight in-process concurrent programming"
-LICENSE = "MIT & PSF"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
-                    file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
-
-SRC_URI[md5sum] = "10fa304f673fc18b28fa6d8c6658cb80"
-SRC_URI[sha256sum] = "9416443e219356e3c31f1f918a91badf2e37acf297e2fa13d24d1cc2380f8fbc"
-
-inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-greenlet_0.4.15.bb b/meta-python/recipes-devtools/python/python3-greenlet_0.4.15.bb
index 1aedf7fa8..f9c862118 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_0.4.15.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_0.4.15.bb
@@ -1,2 +1,9 @@
-inherit distutils3
-require python-greenlet.inc
+SUMMARY = "Python lightweight in-process concurrent programming"
+LICENSE = "MIT & PSF"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
+                    file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
+
+SRC_URI[md5sum] = "10fa304f673fc18b28fa6d8c6658cb80"
+SRC_URI[sha256sum] = "9416443e219356e3c31f1f918a91badf2e37acf297e2fa13d24d1cc2380f8fbc"
+
+inherit pypi distutils3
-- 
2.17.1

