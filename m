Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.81949.1629448958887042651
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Aug 2021 01:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59332 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mH06d-0004p8-VE; Fri, 20 Aug 2021 11:42:32 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-simplejson: Upgrade 3.17.3 -> 3.17.4
Date: Fri, 20 Aug 2021 11:42:15 +0300
Message-Id: <20210820084216.23017-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210820084216.23017-1-leon.anavi@konsulko.com>
References: <20210820084216.23017-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.17.4:

- Upgrade cibuildwheel

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-simplejson_3.17.3.bb => python3-simplejson_3.17.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-simplejson_3.17.3.bb => python3-simplejson_3.17.4.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.17.3.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.17.4.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-simplejson_3.17.3.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_3.17.4.bb
index 5c40cb85fb..e50aac67a9 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_3.17.3.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_3.17.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[sha256sum] = "da72a452bcf4349fc467a12b54ab0e63e654a571cacc44084826d52bde12b6ee"
+SRC_URI[sha256sum] = "2af85e028714c4b6cb2eb6fc03aa91f39ffd654f2eb2f6f8f860e14aeefa6be1"
 
 inherit pypi setuptools3
 
-- 
2.17.1

