Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.4086.1617626984172564773
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Apr 2021 05:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55456 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lTOfk-0005yF-BE; Mon, 05 Apr 2021 15:49:42 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-pysonos: Upgrade 0.0.40 -> 0.0.41
Date: Mon,  5 Apr 2021 15:49:30 +0300
Message-Id: <20210405124933.8920-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210405124933.8920-1-leon.anavi@konsulko.com>
References: <20210405124933.8920-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.0.41:

- Add events_asyncio events module

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pysonos_0.0.40.bb => python3-pysonos_0.0.41.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pysonos_0.0.40.bb => python3-pysonos_0.0.41.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-pysonos_0.0.40.bb b/meta-python/recipes-devtools/python/python3-pysonos_0.0.41.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-pysonos_0.0.40.bb
rename to meta-python/recipes-devtools/python/python3-pysonos_0.0.41.bb
index dbfa0dff5..564d60ee4 100644
--- a/meta-python/recipes-devtools/python/python3-pysonos_0.0.40.bb
+++ b/meta-python/recipes-devtools/python/python3-pysonos_0.0.41.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=07b0e2ca9ac77cd65cd4edf2e13367ea"
 
-SRC_URI[sha256sum] = "3fed94dffbca5807d39d000d1415fe8d7dfc1032ba92a33d0b577eb2e98a81f3"
+SRC_URI[sha256sum] = "08d17fee04cc8209b915e61407673ea843b55792a9301fbe86adb9cc69a67a54"
 
 inherit pypi setuptools3
 
-- 
2.17.1

