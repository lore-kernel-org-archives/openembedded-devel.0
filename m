Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.24734.1629123169338877931
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Aug 2021 07:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57306 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mFdM3-0005El-G8; Mon, 16 Aug 2021 17:12:48 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-pycurl: Upgrade 7.44.0 -> 7.44.1
Date: Mon, 16 Aug 2021 17:12:31 +0300
Message-Id: <20210816141231.13824-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210816141231.13824-1-leon.anavi@konsulko.com>
References: <20210816141231.13824-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.44.1:

- Repair incorrect Python thread initialization logic which caused
  operations to hang

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pycurl_7.44.0.bb => python3-pycurl_7.44.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycurl_7.44.0.bb => python3-pycurl_7.44.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.44.0.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.44.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pycurl_7.44.0.bb
rename to meta-python/recipes-devtools/python/python3-pycurl_7.44.1.bb
index 72b87dafb2..a80fed62de 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.44.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.44.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING-MIT;md5=75f131c591546fd1277ca49c9a81ab1b \
                     "
 
-SRC_URI[sha256sum] = "2ce9905626d8ceafcbadee666e2f45397e29c7618ddcdc63fc22d85e5046c6d6"
+SRC_URI[sha256sum] = "5bcef4d988b74b99653602101e17d8401338d596b9234d263c728a0c3df003e8"
 
 inherit pypi setuptools3
 
-- 
2.17.1

