Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.2023.1593537123341155016
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 10:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46852 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jqJne-0004sv-LP; Tue, 30 Jun 2020 20:12:03 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-cachetools: Upgrade 4.1.0 -> 4.1.1
Date: Tue, 30 Jun 2020 20:11:15 +0300
Message-Id: <20200630171119.25540-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200630171119.25540-1-leon.anavi@konsulko.com>
References: <20200630171119.25540-1-leon.anavi@konsulko.com>
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

Upgrde to release 4.1.1:

- Improve popitem() exception context handling.
- Replace float('inf') with math.inf.
- Improve "envkey" documentation example.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-cachetools_4.1.0.bb => python3-cachetools_4.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_4.1.0.bb => python3-cachetools_4.1.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_4.1.0.bb b/meta-python/recipes-devtools/python/python3-cachetools_4.1.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-cachetools_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_4.1.1.bb
index 07d86cfc5..d334070cd 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_4.1.1.bb
@@ -23,7 +23,7 @@ do_install_ptest() {
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
-SRC_URI[md5sum] = "4468da43443115a00c02c126cf601ae0"
-SRC_URI[sha256sum] = "1d057645db16ca7fe1f3bd953558897603d6f0b9c51ed9d11eb4d071ec4e2aab"
+SRC_URI[md5sum] = "ae41b69896f49727e1621d279cb72522"
+SRC_URI[sha256sum] = "bbaa39c3dede00175df2dc2b03d0cf18dd2d32a7de7beb68072d13043c9edb20"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

