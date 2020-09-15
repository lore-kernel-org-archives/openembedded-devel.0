Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.9155.1600160603303585375
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 02:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43802 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kI6rx-0007I7-43; Tue, 15 Sep 2020 12:03:22 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/10] python3-pychromecast: Upgrade 7.2.1 -> 7.3.0
Date: Tue, 15 Sep 2020 12:03:02 +0300
Message-Id: <20200915090303.14367-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915090303.14367-1-leon.anavi@konsulko.com>
References: <20200915090303.14367-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.3.0:

- add support for QUEUE_INSERT
- Run black and flake8 on examples
- Fix get_chromecasts non blocking mode
- Black 20.8b1

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-pychromecast_7.2.1.bb => python3-pychromecast_7.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.2.1.bb => python3-pychromecast_7.3.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.2.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.3.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.3.0.bb
index 6a3b16c38..b444df05d 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.3.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[md5sum] = "a39b87178f866dda52da494eac0afe07"
-SRC_URI[sha256sum] = "9aad074d0361791af8ccb8fb7ea0f1646db3d89600fed85c5562b64c8b1aa899"
+SRC_URI[md5sum] = "7ab862743ff33dafc93206c1435abc5e"
+SRC_URI[sha256sum] = "f594231efb34b86eeb463611662bca21a6962793885d3ad68195286940f7473d"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.17.1

