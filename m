Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.196104.1598280617359861133
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 07:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39680 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kADnc-0006gX-Gn; Mon, 24 Aug 2020 17:50:16 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-inflection: Upgrade 0.5.0 -> 0.5.1
Date: Mon, 24 Aug 2020 17:50:01 +0300
Message-Id: <20200824145004.12568-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824145004.12568-1-leon.anavi@konsulko.com>
References: <20200824145004.12568-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.5.1:

- Fix type hints not working

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-inflection_0.5.0.bb => python3-inflection_0.5.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-inflection_0.5.0.bb => python3-inflection_0.5.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-inflection_0.5.0.bb b/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-inflection_0.5.0.bb
rename to meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
index 0a3b7734c..b5cde669f 100644
--- a/meta-python/recipes-devtools/python/python3-inflection_0.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2fb6fa1a6f1792d78de19ad1bb653c31"
 
-SRC_URI[md5sum] = "87b2ab6ffdd6e15aa31d109ce5ff10bb"
-SRC_URI[sha256sum] = "f576e85132d34f5bf7df5183c2c6f94cfb32e528f53065345cf71329ba0b8924"
+SRC_URI[md5sum] = "c3287d4f0e3bdf625a52d655cc514403"
+SRC_URI[sha256sum] = "1a29730d366e996aaacffb2f1f1cb9593dc38e2ddd30c91250c6dde09ea9b417"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

