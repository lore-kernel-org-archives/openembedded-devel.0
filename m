Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.196531.1598280614034342363
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 07:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39680 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kADnW-0006gX-B1; Mon, 24 Aug 2020 17:50:11 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-pychromecast: Upgrade 7.2.0 -> 7.2.1
Date: Mon, 24 Aug 2020 17:49:58 +0300
Message-Id: <20200824145004.12568-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.2.1:

- Ensure data parsed as JSON is a dict
- Add zeroconf debug option to example scripts

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-pychromecast_7.2.0.bb => python3-pychromecast_7.2.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.2.0.bb => python3-pychromecast_7.2.1.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.2.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.2.1.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.2.1.bb
index 257778ba9..6a3b16c38 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.2.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[md5sum] = "20ed7ec024fd4739446d42f8d19813b8"
-SRC_URI[sha256sum] = "c522c5ecb554471ca8e5690c05530b1c237c301349061d3839c506984f8d3c2d"
+SRC_URI[md5sum] = "a39b87178f866dda52da494eac0afe07"
+SRC_URI[sha256sum] = "9aad074d0361791af8ccb8fb7ea0f1646db3d89600fed85c5562b64c8b1aa899"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.17.1

