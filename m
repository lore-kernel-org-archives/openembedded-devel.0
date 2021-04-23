Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.6660.1619165019709994277
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Apr 2021 01:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47740 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lZqml-00018D-Ip; Fri, 23 Apr 2021 11:03:37 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-watchdog: Upgrade 2.0.2 -> 2.0.3
Date: Fri, 23 Apr 2021 11:03:24 +0300
Message-Id: <20210423080326.6577-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.0.3:

- [mac] Use logger.debug() instead of logger.info()
- Updated documentation links

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-watchdog_2.0.2.bb => python3-watchdog_2.0.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_2.0.2.bb => python3-watchdog_2.0.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_2.0.2.bb b/meta-python/recipes-devtools/python/python3-watchdog_2.0.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-watchdog_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_2.0.3.bb
index c5387dc356..7486570192 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_2.0.3.bb
@@ -4,7 +4,7 @@ DEPENDS = "${PYTHON_PN}-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "532fedd993e75554671faa36cd04c580ced3fae084254a779afbbd8aaf00566b"
+SRC_URI[sha256sum] = "4288d3a984324db492e57aa169666238a2578f0af5a081685526608fb9f6bd61"
 
 inherit pypi setuptools3
 
-- 
2.17.1

