Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.7728.1612444791885759556
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 05:19:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60428 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l7eY1-00014n-Mf; Thu, 04 Feb 2021 15:19:50 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-pymisp: Upgrade 2.4.137.1 -> 2.4.137.3
Date: Thu,  4 Feb 2021 15:19:40 +0200
Message-Id: <20210204131940.22585-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204131940.22585-1-leon.anavi@konsulko.com>
References: <20210204131940.22585-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.4.137.3:

- Bump objects
- Fix and improve optional dependencies
- Make brotli optional

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-pymisp_2.4.137.1.bb => python3-pymisp_2.4.137.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.137.1.bb => python3-pymisp_2.4.137.3.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.1.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.3.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.137.1.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.137.3.bb
index 9b2efa2cd..e363729fd 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.3.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "7b64c1c9a4fec8ed37c1522b31ab56f30b83f0e1"
+SRCREV = "f675e2096182532bb5870e4f773476b2d8065986"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
-- 
2.17.1

