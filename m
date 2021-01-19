Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.14831.1611077878070166549
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jan 2021 09:37:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59758 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l1ux0-0001eq-3i; Tue, 19 Jan 2021 19:37:54 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/10] python3-colorlog: Upgrade 4.6.2 -> 4.7.2
Date: Tue, 19 Jan 2021 19:37:37 +0200
Message-Id: <20210119173746.24694-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.7.2:

- Fix linter errors
- Fix typo

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-colorlog_4.6.2.bb => python3-colorlog_4.7.2.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-colorlog_4.6.2.bb => python3-colorlog_4.7.2.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_4.6.2.bb b/meta-python/recipes-devtools/python/python3-colorlog_4.7.2.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-colorlog_4.6.2.bb
rename to meta-python/recipes-devtools/python/python3-colorlog_4.7.2.bb
index e98d276f0..c9754ed88 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_4.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_4.7.2.bb
@@ -7,5 +7,4 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "colorlog"
 
-SRC_URI[md5sum] = "72441753be8ec437af9e5bb89db344e7"
-SRC_URI[sha256sum] = "54e5f153419c22afc283c130c4201db19a3dbd83221a0f4657d5ee66234a2ea4"
+SRC_URI[sha256sum] = "18d05b616438a75762d7d214b9ec3b05d274466c9f3ddd92807e755840c88251"
-- 
2.17.1

