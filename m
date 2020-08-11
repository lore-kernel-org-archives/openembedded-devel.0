Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.12899.1597146301830540769
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 04:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37052 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k5SiC-0004It-OC; Tue, 11 Aug 2020 14:45:01 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/10] python3-gast: Upgrade 0.3.3 -> 0.4.0
Date: Tue, 11 Aug 2020 14:44:25 +0300
Message-Id: <20200811114430.27916-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811114430.27916-1-leon.anavi@konsulko.com>
References: <20200811114430.27916-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.4.0 to support Python 3.9.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-gast_0.3.3.bb => python3-gast_0.4.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gast_0.3.3.bb => python3-gast_0.4.0.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-gast_0.3.3.bb b/meta-python/recipes-devtools/python/python3-gast_0.4.0.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-gast_0.3.3.bb
rename to meta-python/recipes-devtools/python/python3-gast_0.4.0.bb
index 9d24ddc3e..7ef2eb468 100644
--- a/meta-python/recipes-devtools/python/python3-gast_0.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-gast_0.4.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3ad9b6802e713fc5e307e1230f1ea90"
 
-SRC_URI[md5sum] = "213b1820f576db14ed4fdf57efbfa67f"
-SRC_URI[sha256sum] = "b881ef288a49aa81440d2c5eb8aeefd4c2bb8993d5f50edae7413a85bfdb3b57"
+SRC_URI[md5sum] = "d1f258eb70bb916f8fe5535351d5ff05"
+SRC_URI[sha256sum] = "40feb7b8b8434785585ab224d1568b857edb18297e5a3047f1ba012bc83b42c1"
 
 inherit pypi setuptools3
 
-- 
2.17.1

