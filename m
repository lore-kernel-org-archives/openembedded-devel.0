Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.11131.1621528966322952104
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 May 2021 09:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58812 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1ljlky-0007FW-9A; Thu, 20 May 2021 19:42:44 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-watchdog: Upgrade 2.1.1 -> 2.1.2
Date: Thu, 20 May 2021 19:42:36 +0300
Message-Id: <20210520164237.31557-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210520164237.31557-1-leon.anavi@konsulko.com>
References: <20210520164237.31557-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.1.2:

- [mac] Fix relative path handling for non-recursive watch.
- [windows] On PyPy, events happening right after start() were
  missed. Add a workaround for that.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-watchdog_2.1.1.bb => python3-watchdog_2.1.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_2.1.1.bb => python3-watchdog_2.1.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_2.1.1.bb b/meta-python/recipes-devtools/python/python3-watchdog_2.1.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-watchdog_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_2.1.2.bb
index ecace32e24..c2bf68a2d6 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_2.1.2.bb
@@ -4,7 +4,7 @@ DEPENDS = "${PYTHON_PN}-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "2894440b4ea95a6ef4c5d152deedbe270cae46092682710b7028a04d6a6980f6"
+SRC_URI[sha256sum] = "0237db4d9024859bea27d0efb59fe75eef290833fd988b8ead7a879b0308c2db"
 
 inherit pypi setuptools3
 
-- 
2.17.1

