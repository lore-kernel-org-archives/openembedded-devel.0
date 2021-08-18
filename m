Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.52289.1629279668435272938
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Aug 2021 02:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57436 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mGI4E-00018Q-22; Wed, 18 Aug 2021 12:41:07 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-zeroconf: Upgrade 0.34.3 -> 0.36.0
Date: Wed, 18 Aug 2021 12:40:38 +0300
Message-Id: <20210818094038.21474-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818094038.21474-1-leon.anavi@konsulko.com>
References: <20210818094038.21474-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.36.0:

- Fill incomplete IPv6 tuples to avoid WinError on windows

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-zeroconf_0.34.3.bb => python3-zeroconf_0.36.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.34.3.bb => python3-zeroconf_0.36.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.34.3.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.36.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.34.3.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.36.0.bb
index a8b9aeb73b..5f6f0a2987 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.34.3.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.36.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bb705b228ea4a14ea2728215b780d80"
 
-SRC_URI[sha256sum] = "145e67c182d361b350f057fb9240dedec5e79a7c61f465a01138d4a49a4b87b3"
+SRC_URI[sha256sum] = "549f685a318c06d5345ed6533f54f33b206816b564ed7f7876e7b9522e77bf29"
 
 inherit pypi setuptools3
 
-- 
2.17.1

