Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.7128.1594201633548011566
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2020 02:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47274 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jt6fW-0007zg-2w; Wed, 08 Jul 2020 12:47:10 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-pychromecast: Upgrade 7.1.0 -> 7.1.1
Date: Wed,  8 Jul 2020 12:46:53 +0300
Message-Id: <20200708094659.27331-1-leon.anavi@konsulko.com>
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

- Add debug prints
- Bump flake8 from 3.7.9 to 3.8.3

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-pychromecast_7.1.0.bb => python3-pychromecast_7.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.1.0.bb => python3-pychromecast_7.1.1.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.1.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.1.1.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.1.1.bb
index 12076adcd..3da979c0f 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.1.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[md5sum] = "10483fca4ffa0381c0c49f3647827179"
-SRC_URI[sha256sum] = "30e18e7d79b6ce2097e630d3cab6e6503f759808ae1ae592bec0a8a7591534f3"
+SRC_URI[md5sum] = "897e7acd6ac2c01f3df2e2d6b2e13c11"
+SRC_URI[sha256sum] = "87fa9ad42425edd21e02a9240669e5763e52d975ee259a948a6fe07e6ab977b9"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.17.1

