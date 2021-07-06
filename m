Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.7308.1625582951088256397
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 07:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38392 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1m0mNp-0003Bp-Vp; Tue, 06 Jul 2021 17:49:10 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-humanize: Upgrade 3.9.0 -> 3.10.0
Date: Tue,  6 Jul 2021 17:49:01 +0300
Message-Id: <20210706144901.30020-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210706144901.30020-1-leon.anavi@konsulko.com>
References: <20210706144901.30020-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.10.0:

- Add Swedish translation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-humanize_3.9.0.bb => python3-humanize_3.10.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_3.9.0.bb => python3-humanize_3.10.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.9.0.bb b/meta-python/recipes-devtools/python/python3-humanize_3.10.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_3.9.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_3.10.0.bb
index f3a11745e1..eba13dbc7e 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_3.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_3.10.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "892a5b7b87763c4c6997a58382c2b1f4614048a2e01c23ef1bb0456e6f9d4d5d"
+SRC_URI[sha256sum] = "b2413730ce6684f85e0439a5b80b8f402e09f03e16ab8023d1da758c6ff41148"
 
 inherit pypi setuptools3
 
-- 
2.17.1

