Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.45436.1624273124366170015
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jun 2021 03:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54610 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lvHdQ-0001ID-EB; Mon, 21 Jun 2021 13:58:33 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-fasteners: Upgrade 0.16.1 -> 0.16.3
Date: Mon, 21 Jun 2021 13:58:22 +0300
Message-Id: <20210621105825.28736-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210621105825.28736-1-leon.anavi@konsulko.com>
References: <20210621105825.28736-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.16.3:

- Return the acquired status to the process lock

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-fasteners_0.16.1.bb => python3-fasteners_0.16.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fasteners_0.16.1.bb => python3-fasteners_0.16.3.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.16.1.bb b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-fasteners_0.16.1.bb
rename to meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
index 4b33a9ec69..6f283a3929 100644
--- a/meta-python/recipes-devtools/python/python3-fasteners_0.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/harlowja/fasteners"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4476c4be31402271e101d9a4a3430d52"
 
-SRC_URI[sha256sum] = "b6f488d0fc9a3591a32d779400a00c3ebfadd41f45eb024d66f15a6c4e1c4a72"
+SRC_URI[sha256sum] = "b1ab4e5adfbc28681ce44b3024421c4f567e705cc3963c732bf1cba3348307de"
 
 inherit pypi setuptools3
 
-- 
2.17.1

