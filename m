Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.1906.1610101707988796010
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 02:28:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=44762 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kxp0M-0000kU-AT; Fri, 08 Jan 2021 12:28:26 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-parso: Upgrade 0.8.0 -> 0.8.1
Date: Fri,  8 Jan 2021 12:28:14 +0200
Message-Id: <20210108102814.9560-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210108102814.9560-1-leon.anavi@konsulko.com>
References: <20210108102814.9560-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.8.1:

- Various small bugfixes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-parso_0.8.0.bb => python3-parso_0.8.1.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-parso_0.8.0.bb => python3-parso_0.8.1.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-parso_0.8.0.bb b/meta-python/recipes-devtools/python/python3-parso_0.8.1.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-parso_0.8.0.bb
rename to meta-python/recipes-devtools/python/python3-parso_0.8.1.bb
index 507087909..9e4ede529 100644
--- a/meta-python/recipes-devtools/python/python3-parso_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-parso_0.8.1.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cbaa2675b2424d771451332a7a69503f"
 
 PYPI_PACKAGE = "parso"
 
-SRC_URI[md5sum] = "ee3592994bfc0d0843790544c1b2b702"
-SRC_URI[sha256sum] = "2b6db14759c528d857eeb9eac559c2166b2554548af39f5198bdfb976f72aa64"
+SRC_URI[sha256sum] = "8519430ad07087d4c997fda3a7918f7cfa27cb58972a8c89c2a0295a1c940e9e"
 
 inherit setuptools3 pypi
-- 
2.17.1

