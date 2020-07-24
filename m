Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.3467.1595586929133372799
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2020 03:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34792 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jyv30-0006km-Eo; Fri, 24 Jul 2020 13:35:28 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-cmd2: Upgrade 1.1.0 -> 1.2.1
Date: Fri, 24 Jul 2020 13:35:10 +0300
Message-Id: <20200724103515.21420-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724103515.21420-1-leon.anavi@konsulko.com>
References: <20200724103515.21420-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.2.1:

- Switched to getting version using importlib.metadata instead
  of using pkg_resources
- Fixed typing module compatibility issue with Python 3.5 prior
  to 3.5.4
- Relax minimum version of importlib-metadata to >= 1.6.0 when
  using Python < 3.8

Update the HOMEPAGE to match the home page link from pypi.org.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_1.1.0.bb => python3-cmd2_1.2.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.1.0.bb => python3-cmd2_1.2.1.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.1.0.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.2.1.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.2.1.bb
index bc74b5ab5..cb52ecfbb 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.2.1.bb
@@ -1,12 +1,12 @@
 SUMMARY = "Extra features for standard library's cmd module"
-HOMEPAGE = "http://packages.python.org/cmd2/"
+HOMEPAGE = "https://github.com/python-cmd2/cmd2"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[md5sum] = "2b4a3b15ac52d239664c40c2d661b0c7"
-SRC_URI[sha256sum] = "d233b5ad4b9ee264a43fb14668f287d25f998f4b443a81b4efdfd292f1a77108"
+SRC_URI[md5sum] = "0ab5f4d8ad6a9099202ed887358102f2"
+SRC_URI[sha256sum] = "5a5d3361fadada16cae0c99b65eba5d49d587fc2e02b3afb058da1872871e7a9"
 
 inherit pypi setuptools3
 
-- 
2.17.1

