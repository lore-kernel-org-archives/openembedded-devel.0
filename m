Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.11147.1614093758361232213
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 07:22:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56178 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lEZWG-00022z-RG; Tue, 23 Feb 2021 17:22:37 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/10] python3-watchdog: Upgrade 2.0.0 -> 2.0.2
Date: Tue, 23 Feb 2021 17:22:19 +0200
Message-Id: <20210223152219.32129-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210223152219.32129-1-leon.anavi@konsulko.com>
References: <20210223152219.32129-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.0.2:

- [mac] Add missing exception objects
- Thanks to contributors

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-watchdog_2.0.0.bb => python3-watchdog_2.0.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_2.0.0.bb => python3-watchdog_2.0.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_2.0.0.bb b/meta-python/recipes-devtools/python/python3-watchdog_2.0.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-watchdog_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_2.0.2.bb
index 3dd1f8182f..c5387dc356 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_2.0.2.bb
@@ -4,7 +4,7 @@ DEPENDS = "${PYTHON_PN}-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "fd4b56cfbe0d0d9c4fc431aceca75700a7f12d3737dc2e9cb2ec2ba649680425"
+SRC_URI[sha256sum] = "532fedd993e75554671faa36cd04c580ced3fae084254a779afbbd8aaf00566b"
 
 inherit pypi setuptools3
 
-- 
2.17.1

