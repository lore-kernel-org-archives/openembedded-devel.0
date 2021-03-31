Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.4239.1617182294760206154
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 02:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56348 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lRWzM-0002MF-NH; Wed, 31 Mar 2021 12:18:13 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-parso: Upgrade 0.8.1 -> 0.8.2
Date: Wed, 31 Mar 2021 12:18:00 +0300
Message-Id: <20210331091801.17047-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210331091801.17047-1-leon.anavi@konsulko.com>
References: <20210331091801.17047-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.8.2:

- Various small bugfixes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-parso_0.8.1.bb => python3-parso_0.8.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-parso_0.8.1.bb => python3-parso_0.8.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-parso_0.8.1.bb b/meta-python/recipes-devtools/python/python3-parso_0.8.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-parso_0.8.1.bb
rename to meta-python/recipes-devtools/python/python3-parso_0.8.2.bb
index 9e4ede529..afcfabb95 100644
--- a/meta-python/recipes-devtools/python/python3-parso_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-parso_0.8.2.bb
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cbaa2675b2424d771451332a7a69503f"
 
 PYPI_PACKAGE = "parso"
 
-SRC_URI[sha256sum] = "8519430ad07087d4c997fda3a7918f7cfa27cb58972a8c89c2a0295a1c940e9e"
+SRC_URI[sha256sum] = "12b83492c6239ce32ff5eed6d3639d6a536170723c6f3f1506869f1ace413398"
 
 inherit setuptools3 pypi
-- 
2.17.1

