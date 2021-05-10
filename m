Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.32171.1620655663223489987
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 07:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57184 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lg6ZQ-000657-Ev; Mon, 10 May 2021 17:07:42 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/10] python3-watchdog: Upgrade 2.0.3 -> 2.1.0
Date: Mon, 10 May 2021 17:07:17 +0300
Message-Id: <20210510140722.27201-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210510140722.27201-1-leon.anavi@konsulko.com>
References: <20210510140722.27201-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.1.0:

- [inotify] Simplify libc loading
- [mac] Add support for non-recursive watches in FSEventsEmitter
- [watchmedo] Add support for --debug-force-* arguments to tricks

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-watchdog_2.0.3.bb => python3-watchdog_2.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_2.0.3.bb => python3-watchdog_2.1.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_2.0.3.bb b/meta-python/recipes-devtools/python/python3-watchdog_2.1.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-watchdog_2.0.3.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_2.1.0.bb
index 7486570192..91744d8e3c 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_2.1.0.bb
@@ -4,7 +4,7 @@ DEPENDS = "${PYTHON_PN}-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "4288d3a984324db492e57aa169666238a2578f0af5a081685526608fb9f6bd61"
+SRC_URI[sha256sum] = "55316efab52f659b8b7b59730680bfb27ac003522f24c44f6bcd60c4e3736ccd"
 
 inherit pypi setuptools3
 
-- 
2.17.1

