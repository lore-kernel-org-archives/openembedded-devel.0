Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.18955.1617009635969072421
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Mar 2021 02:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43130 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lQo4U-0002Gp-Rb; Mon, 29 Mar 2021 12:20:32 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-astroid: Upgrade 2.5.1 -> 2.5.2
Date: Mon, 29 Mar 2021 12:20:18 +0300
Message-Id: <20210329092024.11922-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.5.2:

- Detects `import numpy` as a valid `numpy` import.
- Iterate over ``Keywords`` when using ``ClassDef.get_children``

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-astroid_2.5.1.bb => python3-astroid_2.5.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.5.1.bb => python3-astroid_2.5.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.5.1.bb b/meta-python/recipes-devtools/python/python3-astroid_2.5.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.5.1.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.5.2.bb
index 84315767d..93027754b 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.5.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI[sha256sum] = "cfc35498ee64017be059ceffab0a25bedf7548ab76f2bea691c5565896e7128d"
+SRC_URI[sha256sum] = "6b0ed1af831570e500e2437625979eaa3b36011f66ddfc4ce930128610258ca9"
 
 inherit pypi setuptools3
 
-- 
2.17.1

