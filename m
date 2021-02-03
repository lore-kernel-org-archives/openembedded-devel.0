Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.11060.1612366710633866937
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Feb 2021 07:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46228 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l7KEd-0007tX-81; Wed, 03 Feb 2021 17:38:28 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-javaobj-py3: Upgrade 0.4.1 -> 0.4.2
Date: Wed,  3 Feb 2021 17:38:18 +0200
Message-Id: <20210203153822.25077-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.4.2:

- NumPy is now loaded lately, only if the use of numpy arrays is
  expected. This allows the calling modules to load and configure
  numpy beforehand.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-javaobj-py3_0.4.1.bb => python3-javaobj-py3_0.4.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-javaobj-py3_0.4.1.bb => python3-javaobj-py3_0.4.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.1.bb b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.1.bb
rename to meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.2.bb
index c83140a89..2f2421981 100644
--- a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.2.bb
@@ -7,8 +7,7 @@ HOMEPAGE = "https://github.com/tcalmant/python-javaobj"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
 
-SRC_URI[md5sum] = "47632071c3c3ca14b6c42f2a4e2e1309"
-SRC_URI[sha256sum] = "419ff99543469e68149f875abb0db5251cecd350c03d2bfb4c94a5796f1cbc14"
+SRC_URI[sha256sum] = "ed3b1ffcfd39f165729cb53587cca02ab0bfa4c332c837a92d5ffe6aef5c8010"
 
 inherit pypi setuptools3
 
-- 
2.17.1

