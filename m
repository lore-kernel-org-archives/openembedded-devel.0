Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.138.1626711887068309956
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jul 2021 09:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34994 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1m5W4T-00080h-AE; Mon, 19 Jul 2021 19:24:46 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-zeroconf: Upgrade 0.31.0 -> 0.33.1
Date: Mon, 19 Jul 2021 19:24:38 +0300
Message-Id: <20210719162438.3504-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210719162438.3504-1-leon.anavi@konsulko.com>
References: <20210719162438.3504-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.33.1:

- Version number change only with less restrictive directory
  permissions
- Let connection_lost close the underlying socket
- Removed duplicate unregister_all_services code

License-Update: License remains LGPL Version 2.1

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-zeroconf_0.31.0.bb => python3-zeroconf_0.33.1.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.31.0.bb => python3-zeroconf_0.33.1.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.31.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.33.1.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.31.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.33.1.bb
index cb4c03329d..a0af8420f4 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.31.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.33.1.bb
@@ -1,12 +1,13 @@
 SUMMARY = "Pure Python Multicast DNS Service Discovery Library (Bonjour/Avahi compatible)"
 HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bb705b228ea4a14ea2728215b780d80"
 
-SRC_URI[sha256sum] = "53a180248471c6f81bd1fffcbce03ed93d7d8eaf10905c9121ac1ea996d19844"
+SRC_URI[sha256sum] = "ac88738639669f924859a4e01d9742f3783e619e710103f4a0d321a47f260fd2"
 
 inherit pypi setuptools3
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-ifaddr \
+    ${PYTHON_PN}-asyncio \
 "
-- 
2.17.1

