Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.3434.1592471055756850419
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2020 02:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59970 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jlqSw-0004oK-4P; Thu, 18 Jun 2020 12:04:14 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-periphery: Upgrade 2.0.1 -> 2.1.0
Date: Thu, 18 Jun 2020 12:03:58 +0300
Message-Id: <20200618090358.31927-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618090358.31927-1-leon.anavi@konsulko.com>
References: <20200618090358.31927-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 2.1.0. Use LICENSE instead of PKG-INFO in
LIC_FILES_CHKSUM. The new release brings the following changes:

GPIO:
- Add poll_multiple() static method.
- Add line consumer label property.
- Add line bias, line drive, and inverted properties.
- Add additional properties as keyword arguments to constructor
  for character device GPIOs.
- Only unexport GPIO in close() if exported in open for sysfs
  GPIOs.
- Improve wording and fix typos in docstrings.

Serial:
- Fix performance of blocking read in read().
- Raise exception on unexpected empty read in read(), which may
  be caused by a serial port disconnect.
- Add vmin and vtime properties for the corresponding termios
  settings.
- Add support for termios timeout with read().
- Improve wording in docstrings.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-periphery_2.0.1.bb => python3-periphery_2.1.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-periphery_2.0.1.bb => python3-periphery_2.1.0.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb b/meta-python/recipes-devtools/python/python3-periphery_2.1.0.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-periphery_2.1.0.bb
index 1aa48625f..3cd9004df 100644
--- a/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-periphery_2.1.0.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI
 HOMEPAGE = "http://pythonhosted.org/python-periphery/"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1ecf5c2354c22fb5bfd53eefb8f9e65b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fea92e2e010ccb151792c29fadc2db7b"
 
-SRC_URI[md5sum] = "1d958f02575d4a19734ee2dd92336157"
-SRC_URI[sha256sum] = "5da4d5f40ff8974cf6c724587baa674d7e0593f07b6f6ee896104f11c1be18ec"
+SRC_URI[md5sum] = "27cdd7e026438067a238fb04ed5766a3"
+SRC_URI[sha256sum] = "57baa82e6bc59b67747317d16ad0cf9626826e8d43233af13bce924660500bd6"
 
 inherit pypi setuptools3
 
-- 
2.17.1

