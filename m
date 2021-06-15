Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.6765.1623748907142788693
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jun 2021 02:21:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54390 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lt5GR-0006XG-5e; Tue, 15 Jun 2021 12:21:44 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-pychromecast: Upgrade 9.1.2 -> 9.2.0
Date: Tue, 15 Jun 2021 12:21:31 +0300
Message-Id: <20210615092132.6539-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210615092132.6539-1-leon.anavi@konsulko.com>
References: <20210615092132.6539-1-leon.anavi@konsulko.com>
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

Upgrade to release 9.2.0:

- Add support for BBC Sounds and iPlayer apps
- Add known_hosts to additional discovery functions
- Update examples
- get_chromcasts() copy device list before iteration

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...romecast_9.1.2.bb => python3-pychromecast_9.2.0.bb} | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_9.1.2.bb => python3-pychromecast_9.2.0.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_9.1.2.bb b/meta-python/recipes-devtools/python/python3-pychromecast_9.2.0.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python3-pychromecast_9.1.2.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_9.2.0.bb
index c392261ade..ebe11241c9 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_9.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_9.2.0.bb
@@ -3,8 +3,16 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "907656cea46d39d0e93ec815979578ef4fb6f655fd8bf4e88e6421fcd7824e85"
+SRC_URI[sha256sum] = "6d34593575cf77565df47af4c75dd47c6a65831ec18a8c10b5367b2f1c172f0a"
 
 PYPI_PACKAGE = "PyChromecast"
 
 inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-zeroconf \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-requests \
+    ${PYTHON_PN}-protobuf \
+"
-- 
2.17.1

