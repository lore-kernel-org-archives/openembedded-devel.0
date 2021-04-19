Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.5860.1618819059210957814
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Apr 2021 00:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37396 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lYOmh-0004td-3U; Mon, 19 Apr 2021 10:57:36 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-docutils: Upgrade 0.17 -> 0.17.1
Date: Mon, 19 Apr 2021 10:57:25 +0300
Message-Id: <20210419075726.2396-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.17.1:

- Bug fixes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-docutils_0.17.bb => python3-docutils_0.17.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-docutils_0.17.bb => python3-docutils_0.17.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-docutils_0.17.bb b/meta-python/recipes-devtools/python/python3-docutils_0.17.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-docutils_0.17.bb
rename to meta-python/recipes-devtools/python/python3-docutils_0.17.1.bb
index 8605e93b52..0364cba8e6 100644
--- a/meta-python/recipes-devtools/python/python3-docutils_0.17.bb
+++ b/meta-python/recipes-devtools/python/python3-docutils_0.17.1.bb
@@ -4,6 +4,6 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & GPL-2.0 & Python-2.0"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=836a1950177996968a49ff477a4a61c4"
 
-SRC_URI[sha256sum] = "e2ffeea817964356ba4470efba7c2f42b6b0de0b04e66378507e3e2504bbff4c"
+SRC_URI[sha256sum] = "686577d2e4c32380bb50cbb22f575ed742d58168cee37e99117a854bcd88f125"
 
 inherit pypi setuptools3
-- 
2.17.1

