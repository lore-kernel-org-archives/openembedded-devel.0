Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.13243.1620912223381220431
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 06:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=44224 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lhBJU-0004kU-HQ; Thu, 13 May 2021 16:23:42 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/10] python3-watchdog: Upgrade 2.1.0 -> 2.1.1
Date: Thu, 13 May 2021 16:23:24 +0300
Message-Id: <20210513132332.3745-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210513132332.3745-1-leon.anavi@konsulko.com>
References: <20210513132332.3745-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.1.1:

- [mac] Fix callback exceptions when the watcher is deleted but
  still receiving events

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-watchdog_2.1.0.bb => python3-watchdog_2.1.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_2.1.0.bb => python3-watchdog_2.1.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_2.1.0.bb b/meta-python/recipes-devtools/python/python3-watchdog_2.1.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-watchdog_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_2.1.1.bb
index 91744d8e3c..ecace32e24 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_2.1.1.bb
@@ -4,7 +4,7 @@ DEPENDS = "${PYTHON_PN}-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "55316efab52f659b8b7b59730680bfb27ac003522f24c44f6bcd60c4e3736ccd"
+SRC_URI[sha256sum] = "2894440b4ea95a6ef4c5d152deedbe270cae46092682710b7028a04d6a6980f6"
 
 inherit pypi setuptools3
 
-- 
2.17.1

