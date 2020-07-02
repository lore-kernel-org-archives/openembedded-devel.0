Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.3840.1593686913011101287
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jul 2020 03:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35470 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jqwlb-0002lw-Aj; Thu, 02 Jul 2020 13:48:32 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-pybluez: Upgrade 0.22 -> 0.23
Date: Thu,  2 Jul 2020 13:48:17 +0300
Message-Id: <20200702104819.14256-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200702104819.14256-1-leon.anavi@konsulko.com>
References: <20200702104819.14256-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.23:

- Dropped support for Python 2.7. The minimum Python version
  is now 3.5.

Use tar.gz instead of zip. Fix the URL of the HOMEPAGE.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pybluez_0.22.bb => python3-pybluez_0.23.bb}   | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pybluez_0.22.bb => python3-pybluez_0.23.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-pybluez_0.22.bb b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-pybluez_0.22.bb
rename to meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
index 26902e18d..5242059bc 100644
--- a/meta-python/recipes-devtools/python/python3-pybluez_0.22.bb
+++ b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Bluetooth Python extension module"
-HOMEPAGE = "http://karulis.github.io/pybluez/"
+HOMEPAGE = "https://pybluez.github.io/"
 SECTION = "devel/python"
 
 DEPENDS = "bluez5"
@@ -7,11 +7,10 @@ DEPENDS = "bluez5"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8a71d0475d08eee76d8b6d0c6dbec543"
 
-SRC_URI[md5sum] = "49dab9d5a8f0b798c8125c7f649be3cd"
-SRC_URI[sha256sum] = "4ce006716a54d9d18e8186a3f1c8b12a8e6befecffe8fd5828a291fb694ce49d"
+SRC_URI[md5sum] = "afbe8429bb82d2c46a3d0f5f4f898f9d"
+SRC_URI[sha256sum] = "c8f04d2e78951eaa9de486b4d49381704e8943d0a6e6e58f55fcd7b8582e90de"
 
 PYPI_PACKAGE = "PyBluez"
-PYPI_PACKAGE_EXT = "zip"
 inherit pypi setuptools3
 
 RDEPENDS_${PN} += "\
-- 
2.17.1

