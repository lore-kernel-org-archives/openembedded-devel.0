Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.18117.1596201783703119608
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 06:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47376 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k1V01-000741-KK; Fri, 31 Jul 2020 16:23:02 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/15] python3-pychromecast: Upgrade 7.1.2 -> 7.2.0
Date: Fri, 31 Jul 2020 16:22:22 +0300
Message-Id: <20200731132230.20031-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731132230.20031-1-leon.anavi@konsulko.com>
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.2.0:

- Allow passing an already existing zeroconf object to additional
  functions
- Ignore browser updates for *._sub._googlecast._tcp.local.
- Fix return type of get_listed_chromecasts
- Remove host and port from Chromecast object

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-pychromecast_7.1.2.bb => python3-pychromecast_7.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.1.2.bb => python3-pychromecast_7.2.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.1.2.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.2.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.1.2.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.2.0.bb
index 98dbf33b2..257778ba9 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.2.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[md5sum] = "6ca5102b09009c85424a9ab628005992"
-SRC_URI[sha256sum] = "adcf478d7fc539e9decde59b2db7b6a4b1d679c4cf78d515d880adb1c4bc1c30"
+SRC_URI[md5sum] = "20ed7ec024fd4739446d42f8d19813b8"
+SRC_URI[sha256sum] = "c522c5ecb554471ca8e5690c05530b1c237c301349061d3839c506984f8d3c2d"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.17.1

