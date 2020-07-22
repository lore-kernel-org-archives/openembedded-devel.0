Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.15994.1595414961472380049
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2020 03:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55352 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jyCJL-0001ZT-LJ; Wed, 22 Jul 2020 13:49:20 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-pychromecast: Upgrade 7.1.1 -> 7.1.2
Date: Wed, 22 Jul 2020 13:49:04 +0300
Message-Id: <20200722104905.15499-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722104905.15499-1-leon.anavi@konsulko.com>
References: <20200722104905.15499-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.1.2:

- Keep previously known Chromecast in service listener
- Remove reboot function
- Create Dependabot config file

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-pychromecast_7.1.1.bb => python3-pychromecast_7.1.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.1.1.bb => python3-pychromecast_7.1.2.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.1.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.1.2.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.1.2.bb
index 3da979c0f..98dbf33b2 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.1.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[md5sum] = "897e7acd6ac2c01f3df2e2d6b2e13c11"
-SRC_URI[sha256sum] = "87fa9ad42425edd21e02a9240669e5763e52d975ee259a948a6fe07e6ab977b9"
+SRC_URI[md5sum] = "6ca5102b09009c85424a9ab628005992"
+SRC_URI[sha256sum] = "adcf478d7fc539e9decde59b2db7b6a4b1d679c4cf78d515d880adb1c4bc1c30"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.17.1

