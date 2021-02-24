Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.5732.1614165925688262498
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 03:25:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56972 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lEsID-000137-GK; Wed, 24 Feb 2021 13:25:24 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-pymisp: Upgrade 2.4.137.3 -> 2.4.138
Date: Wed, 24 Feb 2021 13:25:11 +0200
Message-Id: <20210224112512.31406-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210224112512.31406-1-leon.anavi@konsulko.com>
References: <20210224112512.31406-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.4.138:

- Bump version
- Bump deps

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-pymisp_2.4.137.3.bb => python3-pymisp_2.4.138.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.137.3.bb => python3-pymisp_2.4.138.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.3.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.138.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.137.3.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.138.bb
index e363729fd8..eb7bea8348 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.138.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "f675e2096182532bb5870e4f773476b2d8065986"
+SRCREV = "9316420dc028a1ffc541986fc08793e669f2165e"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
@@ -18,5 +18,5 @@ RDEPENDS_${PN} += " \
 "
 
 # Fixes: python3-pymisp requires /bin/bash, but no
-# providers found in RDEPENDS_python3-pymisp? [file-rdep
+# providers found in RDEPENDS_python3-pymisp? [file-rdep]
 RDEPENDS_${PN} += "bash"
-- 
2.17.1

