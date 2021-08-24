Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.36580.1629793129486617472
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Aug 2021 01:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45220 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mIRdr-0003rk-VU; Tue, 24 Aug 2021 11:18:48 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-watchdog: Upgrade 2.1.3 -> 2.1.5
Date: Tue, 24 Aug 2021 11:18:16 +0300
Message-Id: <20210824081816.1806-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824081816.1806-1-leon.anavi@konsulko.com>
References: <20210824081816.1806-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.1.5:

- Fix regression introduced in 2.1.4 (reverted "Allow overriding
  or adding custom event handlers to event dispatch map.
- Convert regexes of type str to list.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-watchdog_2.1.3.bb => python3-watchdog_2.1.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_2.1.3.bb => python3-watchdog_2.1.5.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_2.1.3.bb b/meta-python/recipes-devtools/python/python3-watchdog_2.1.5.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-watchdog_2.1.3.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_2.1.5.bb
index 97d46b4f18..55b966a90f 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_2.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_2.1.5.bb
@@ -4,7 +4,7 @@ DEPENDS = "${PYTHON_PN}-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "e5236a8e8602ab6db4b873664c2d356c365ab3cac96fbdec4970ad616415dd45"
+SRC_URI[sha256sum] = "5563b005907613430ef3d4aaac9c78600dd5704e84764cb6deda4b3d72807f09"
 
 inherit pypi setuptools3
 
-- 
2.17.1

