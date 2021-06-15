Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.6812.1623748906379748032
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jun 2021 02:21:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54390 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lt5GQ-0006XG-BW; Tue, 15 Jun 2021 12:21:43 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-zeroconf: Add recipe
Date: Tue, 15 Jun 2021 12:21:30 +0300
Message-Id: <20210615092132.6539-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-1.0
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

This is a pure Python multicast DNS service discovery library.
Compatible with Bonjour/Avahi.

Version 0.31.0 brings:

- Separated cache loading from I/O in ServiceInfo and fixed cache
  lookup

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-zeroconf_0.31.0.bb                | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-zeroconf_0.31.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.31.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.31.0.bb
new file mode 100644
index 0000000000..cb4c03329d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.31.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Pure Python Multicast DNS Service Discovery Library (Bonjour/Avahi compatible)"
+HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
+
+SRC_URI[sha256sum] = "53a180248471c6f81bd1fffcbce03ed93d7d8eaf10905c9121ac1ea996d19844"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-ifaddr \
+"
-- 
2.17.1

