Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.26251.1611141040067397415
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 03:10:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45624 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l2BNl-0007qB-Rd; Wed, 20 Jan 2021 13:10:38 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-pyusb: Upgrade 1.1.0 -> 1.1.1
Date: Wed, 20 Jan 2021 13:10:26 +0200
Message-Id: <20210120111027.12947-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210120111027.12947-1-leon.anavi@konsulko.com>
References: <20210120111027.12947-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.1.1:

- Patch release that fixes a couple of bugs. Most notably it fixes
  compatibility with Python 3.9.
- As of PyUSB 1.1.1 changes that break under Python 2.7 and 3.5
  (both of which have reached end of life) are no longer considered
  regressions.

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyusb_1.1.0.bb => python3-pyusb_1.1.1.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyusb_1.1.0.bb => python3-pyusb_1.1.1.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pyusb_1.1.1.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pyusb_1.1.1.bb
index 6b48d6a25..a8c7031b6 100644
--- a/meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyusb_1.1.1.bb
@@ -1,11 +1,11 @@
 SUMMARY = "PyUSB provides USB access on the Python language"
 HOMEPAGE = "http://pyusb.sourceforge.net/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c52a96fd9a0cadcb9270904c8eb5416c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e64a29fcd3c3dd356a24e235dfcb3905"
+
 DEPENDS += "libusb1 ${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[md5sum] = "3b2e38e9f697d2f90d86376bd10a9505"
-SRC_URI[sha256sum] = "d69ed64bff0e2102da11b3f49567256867853b861178689671a163d30865c298"
+SRC_URI[sha256sum] = "7d449ad916ce58aff60b89aae0b65ac130f289c24d6a5b7b317742eccffafc38"
 
 inherit pypi setuptools3
 
-- 
2.17.1

