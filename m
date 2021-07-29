Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.8115.1627557928773415273
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 04:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41638 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1m94AG-0000JQ-EP; Thu, 29 Jul 2021 14:25:25 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-networkx: Upgrade 2.6.1 -> 2.6.2
Date: Thu, 29 Jul 2021 14:25:16 +0300
Message-Id: <20210729112518.26031-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.6.2:

- Remove default dependencies
- Update release process

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-networkx_2.6.1.bb => python3-networkx_2.6.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-networkx_2.6.1.bb => python3-networkx_2.6.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.6.1.bb b/meta-python/recipes-devtools/python/python3-networkx_2.6.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-networkx_2.6.1.bb
rename to meta-python/recipes-devtools/python/python3-networkx_2.6.2.bb
index 676e1dbdca..38e303ef1b 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_2.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_2.6.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://networkx.github.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5cfa4d8f5881e0d053bb497130b9c73a"
 
-SRC_URI[sha256sum] = "bf4cb807d1bccf1593c7d0742d9127d9e04e021867299082658b0fc3907924e8"
+SRC_URI[sha256sum] = "2306f1950ce772c5a59a57f5486d59bb9cab98497c45fc49cbc45ac0dec119bb"
 
 inherit pypi setuptools3
 
-- 
2.17.1

