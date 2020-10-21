Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.8681.1603268742839798684
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 01:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38626 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kV9R8-0005B2-M3; Wed, 21 Oct 2020 11:25:35 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-pychromecast: Upgrade 7.5.0 -> 7.5.1
Date: Wed, 21 Oct 2020 11:25:28 +0300
Message-Id: <20201021082530.10132-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.5.1:

- Use threading.Thread.is_alive
- Bump flake8 from 3.8.3 to 3.8.4

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-pychromecast_7.5.0.bb => python3-pychromecast_7.5.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.5.0.bb => python3-pychromecast_7.5.1.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.5.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.5.1.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.5.1.bb
index adfdbb17b8..b7796251ec 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.5.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[md5sum] = "d35c610f57cae909348ff6c60e5e9256"
-SRC_URI[sha256sum] = "2f346a88ddc27a19cc68bc2d3e8929d89276298cb1c11871b82a87fbdafb95a8"
+SRC_URI[md5sum] = "9dee7207b7a5c73ebf8fad64be137f27"
+SRC_URI[sha256sum] = "cf2e9fa795ea1e9d0d180adfbdccefd6b4f532eae56f41f15d1a75b323096f51"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.17.1

