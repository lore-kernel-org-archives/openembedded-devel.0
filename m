Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.661.1608328087695159387
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Dec 2020 13:48:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45218 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kqNbX-00048f-1S; Fri, 18 Dec 2020 23:48:05 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-fasteners: Upgrade 0.15 -> 0.16
Date: Fri, 18 Dec 2020 23:47:47 +0200
Message-Id: <20201218214748.14563-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201218214748.14563-1-leon.anavi@konsulko.com>
References: <20201218214748.14563-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.16:

- Move from travis and appveyor to github actions
- Add interprocess reader writer lock
- Improve README
- remove unused eventlet import
- use stdlib monotonic instead of external for python >= 3.4

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-fasteners_0.15.bb => python3-fasteners_0.16.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-fasteners_0.15.bb => python3-fasteners_0.16.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.15.bb b/meta-python/recipes-devtools/python/python3-fasteners_0.16.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-fasteners_0.15.bb
rename to meta-python/recipes-devtools/python/python3-fasteners_0.16.bb
index 8786a14842..eed8d2c957 100644
--- a/meta-python/recipes-devtools/python/python3-fasteners_0.15.bb
+++ b/meta-python/recipes-devtools/python/python3-fasteners_0.16.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "https://github.com/harlowja/fasteners"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4476c4be31402271e101d9a4a3430d52"
 
-SRC_URI[md5sum] = "440f8ab461c8fed941355860d8669556"
-SRC_URI[sha256sum] = "3a176da6b70df9bb88498e1a18a9e4a8579ed5b9141207762368a1017bf8f5ef"
+SRC_URI[sha256sum] = "c995d8c26b017c5d6a6de9ad29a0f9cdd57de61ae1113d28fac26622b06a0933"
 
 inherit pypi setuptools3
-- 
2.17.1

