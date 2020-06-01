Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.36566.1591016745602360647
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 06:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41354 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jfk8N-0005Vi-EB; Mon, 01 Jun 2020 16:05:44 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-gast: Upgrade 0.2.2 -> 0.3.3
Date: Mon,  1 Jun 2020 16:05:30 +0300
Message-Id: <20200601130531.27509-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.3.3.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-gast_0.2.2.bb => python3-gast_0.3.3.bb}      | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gast_0.2.2.bb => python3-gast_0.3.3.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-gast_0.2.2.bb b/meta-python/recipes-devtools/python/python3-gast_0.3.3.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-gast_0.2.2.bb
rename to meta-python/recipes-devtools/python/python3-gast_0.3.3.bb
index 6e08a1994..9d24ddc3e 100644
--- a/meta-python/recipes-devtools/python/python3-gast_0.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gast_0.3.3.bb
@@ -4,11 +4,9 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3ad9b6802e713fc5e307e1230f1ea90"
 
-SRC_URI = "git://github.com/serge-sans-paille/gast.git"
-SRCREV ?= "ed82e2a507505c6b18eb665d3738b6c0602da5e7"
+SRC_URI[md5sum] = "213b1820f576db14ed4fdf57efbfa67f"
+SRC_URI[sha256sum] = "b881ef288a49aa81440d2c5eb8aeefd4c2bb8993d5f50edae7413a85bfdb3b57"
 
-inherit setuptools3
-
-S = "${WORKDIR}/git"
+inherit pypi setuptools3
 
 BBCLASSEXTEND = "native"
-- 
2.17.1

