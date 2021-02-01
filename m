Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.33281.1612183531819374608
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Feb 2021 04:45:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33634 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l6YaA-0001Fc-5T; Mon, 01 Feb 2021 14:45:30 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-croniter: Upgrade 1.0.4 -> 1.0.5
Date: Mon,  1 Feb 2021 14:45:14 +0200
Message-Id: <20210201124516.30135-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210201124516.30135-1-leon.anavi@konsulko.com>
References: <20210201124516.30135-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.5:

- Security fix: fix overflow when using cron ranges

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-croniter_1.0.4.bb => python3-croniter_1.0.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.0.4.bb => python3-croniter_1.0.5.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.0.4.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.5.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.0.4.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.0.5.bb
index 8328cf6d3..c8af97d7c 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "7f861f4a896b2b43069ef218d2b999d2c9f760598c2592a6b842cb04bc75562e"
+SRC_URI[sha256sum] = "8636e7f0ce842b4192b7f097cab724fc15bf2459265f1a2bc6cf6eacfa44420e"
 
 inherit pypi setuptools3
 
-- 
2.17.1

