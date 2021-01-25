Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.407.1611588226677564022
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 07:23:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58482 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l43iS-00057d-3H; Mon, 25 Jan 2021 17:23:45 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-natsort: Upgrade 7.1.0 -> 7.1.1
Date: Mon, 25 Jan 2021 17:23:33 +0200
Message-Id: <20210125152337.20937-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.1.1:

- Use GitHub Actions instead of Travis-CI
- No longer pin testing dependencies
- Correct a minor typo

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-natsort_7.1.0.bb => python3-natsort_7.1.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-natsort_7.1.0.bb => python3-natsort_7.1.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-natsort_7.1.0.bb b/meta-python/recipes-devtools/python/python3-natsort_7.1.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-natsort_7.1.0.bb
rename to meta-python/recipes-devtools/python/python3-natsort_7.1.1.bb
index c890ae243..89df3dc38 100644
--- a/meta-python/recipes-devtools/python/python3-natsort_7.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-natsort_7.1.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6a96e5ad780a0eea866ecccec4463517"
 
 PYPI_PACKAGE = "natsort"
-SRC_URI[sha256sum] = "33f3f1003e2af4b4df20908fe62aa029999d136b966463746942efbfc821add3"
+SRC_URI[sha256sum] = "00c603a42365830c4722a2eb7663a25919551217ec09a243d3399fa8dd4ac403"
 
 inherit pypi setuptools3
 
-- 
2.17.1

