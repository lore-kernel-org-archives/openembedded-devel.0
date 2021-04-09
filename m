Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.7586.1617967451388505134
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Apr 2021 04:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38022 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lUpFA-0005lE-OJ; Fri, 09 Apr 2021 14:24:09 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-robotframework: Upgrade 4.0 -> 4.0.1
Date: Fri,  9 Apr 2021 14:23:54 +0300
Message-Id: <20210409112355.18857-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210409112355.18857-1-leon.anavi@konsulko.com>
References: <20210409112355.18857-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.0.1. It is the first bug fix release in the
Robot Framework 4.0.x series. It fixes several severe and not so
severe issues reported since Robot Framework 4.0 was released.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-robotframework_4.0.bb => python3-robotframework_4.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_4.0.bb => python3-robotframework_4.0.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_4.0.bb b/meta-python/recipes-devtools/python/python3-robotframework_4.0.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-robotframework_4.0.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_4.0.1.bb
index 6cb8643bd..3e5d67e0a 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_4.0.1.bb
@@ -13,7 +13,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[sha256sum] = "a02a6f4af3b0830e4396058694c333cb63eb47f50acf6723be34f0f7a4d73ad7"
+SRC_URI[sha256sum] = "9fa609ceb78f67b1476edce8a7011b16bf3ab41c0fb8c211de6c99955eaf9fde"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
-- 
2.17.1

