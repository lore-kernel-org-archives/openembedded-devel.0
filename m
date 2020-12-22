Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.5541.1608599711711507833
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Dec 2020 17:15:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46704 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1krWGZ-0002Fg-KS; Tue, 22 Dec 2020 03:15:08 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-watchdog: Upgrade 0.10.3 -> 1.0.2
Date: Tue, 22 Dec 2020 03:14:59 +0200
Message-Id: <20201222011459.14452-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201222011459.14452-1-leon.anavi@konsulko.com>
References: <20201222011459.14452-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.2:

- Versioning is now following the semver
- Drop support for Python 2.7, 3.4 and 3.5
- Use pathlib from the standard library, instead of pathtools
- Allow file paths on Unix that don't follow the file system
  encoding
- Removed the long-time deprecated events.LoggingFileSystemEventHandler
  class, use LoggingEventHandler instead
- Wheels are published for GNU/Linux, macOS and Windows
- Uniformize event for deletion of watched dir

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-watchdog_0.10.3.bb => python3-watchdog_1.0.2.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_0.10.3.bb => python3-watchdog_1.0.2.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_0.10.3.bb b/meta-python/recipes-devtools/python/python3-watchdog_1.0.2.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-watchdog_0.10.3.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_1.0.2.bb
index 2108cbb93b..698dfe7704 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_0.10.3.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_1.0.2.bb
@@ -4,8 +4,7 @@ DEPENDS = "${PYTHON_PN}-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "9a5c9134e943b534b9f8b51d78338cf8"
-SRC_URI[sha256sum] = "4214e1379d128b0588021880ccaf40317ee156d4603ac388b9adcf29165e0c04"
+SRC_URI[sha256sum] = "376cbc2a35c0392b0fe7ff16fbc1b303fd99d4dd9911ab5581ee9d69adc88982"
 
 inherit pypi setuptools3
 
-- 
2.17.1

