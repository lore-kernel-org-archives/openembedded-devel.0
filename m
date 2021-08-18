Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.56012.1629300138860581149
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Aug 2021 08:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59570 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mGNOM-0005Z4-Mp; Wed, 18 Aug 2021 18:22:16 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-dbus-next: Upgrade 0.2.2 -> 0.2.3
Date: Wed, 18 Aug 2021 18:22:02 +0300
Message-Id: <20210818152203.2165-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 0.2.3:

- Include py.typed in Manifest.in
- Fix property validation error message
- Don't log errors if call failed after disconnect
- Support PEP563 annotations
- Service: support async properties
- Client: Support coroutines as signal handlers

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-dbus-next_0.2.2.bb => python3-dbus-next_0.2.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-next_0.2.2.bb => python3-dbus-next_0.2.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-next_0.2.2.bb b/meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-dbus-next_0.2.2.bb
rename to meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.bb
index 1970fdec1c..3ee11b9d55 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-next_0.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/acrisci/python-dbus-next"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94e750c96e56788499b56c81de91431c"
 
-SRC_URI[sha256sum] = "f656a3d3450b670f228248ffb1c3a703a69c4a8cb10cce63b108f17c8bd6c3de"
+SRC_URI[sha256sum] = "f4eae26909332ada528c0a3549dda8d4f088f9b365153952a408e28023a626a5"
 
 PYPI_PACKAGE = "dbus_next"
 
-- 
2.17.1

