Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.4263.1617182295781784564
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 02:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56348 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lRWzN-0002MF-9T; Wed, 31 Mar 2021 12:18:14 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-matplotlib: Upgrade 3.3.4 -> 3.4.1
Date: Wed, 31 Mar 2021 12:18:01 +0300
Message-Id: <20210331091801.17047-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210331091801.17047-1-leon.anavi@konsulko.com>
References: <20210331091801.17047-1-leon.anavi@konsulko.com>
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

Upgrade to relase 3.4.1:

- fix errorbar when specifying fillstyle
- fix Inkscape cleanup at exit on Windows for tests
- fix legends of colour-mapped scatter plots
- fix positioning of annotation fancy arrows
- fix size and color rendering for 3D scatter plots
- fix suptitle manual positioning when using constrained layout
- respect antialiasing settings in cairo backends as well

License-Update: Adjust setup.py line for to check the license.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-matplotlib_3.3.4.bb => python3-matplotlib_3.4.1.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.3.4.bb => python3-matplotlib_3.4.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.4.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.4.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.3.4.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.4.1.bb
index a4df9a6fe..21c29aa2c 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.4.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/matplotlib/matplotlib"
 SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "\
-    file://setup.py;beginline=273;endline=273;md5=e0ef37de7122ce842bcd1fb54482b353 \
+    file://setup.py;beginline=282;endline=282;md5=20e7ab4d2b2b1395a0e4ab800181eb96 \
     file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74 \
 "
 DEPENDS = "\
@@ -19,8 +19,7 @@ DEPENDS = "\
     python3-certifi-native \
 "
 
-SRC_URI[md5sum] = "0b48f34ec623e765a1bda15924ce0b56"
-SRC_URI[sha256sum] = "3e477db76c22929e4c6876c44f88d790aacdf3c3f8f3a90cb1975c0bf37825b0"
+SRC_URI[sha256sum] = "84d4c4f650f356678a5d658a43ca21a41fca13f9b8b00169c0b76e6a6a948908"
 
 inherit pypi setuptools3 pkgconfig
 
-- 
2.17.1

