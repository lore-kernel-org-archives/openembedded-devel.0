Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.28582.1591618472047741352
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 05:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50432 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jiGfe-0005b8-A0; Mon, 08 Jun 2020 15:14:31 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-humanfriendly: Upgrade 4.18 -> 8.2
Date: Mon,  8 Jun 2020 15:14:07 +0300
Message-Id: <20200608121410.5814-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608121410.5814-1-leon.anavi@konsulko.com>
References: <20200608121410.5814-1-leon.anavi@konsulko.com>
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

Upgrade to release 8.2. Consolidate inc and bb files into a
single bb file. The year in file LICENCE has been recently
updated therefore the checksum has been changed but it still
remains a MIT License.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-humanfriendly_4.18.bb | 2 --
 ...hon-humanfriendly.inc => python3-humanfriendly_8.2.bb} | 8 ++++----
 2 files changed, 4 insertions(+), 6 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-humanfriendly_4.18.bb
 rename meta-python/recipes-devtools/python/{python-humanfriendly.inc => python3-humanfriendly_8.2.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-humanfriendly_4.18.bb b/meta-python/recipes-devtools/python/python3-humanfriendly_4.18.bb
deleted file mode 100644
index 2ca5fe36f..000000000
--- a/meta-python/recipes-devtools/python/python3-humanfriendly_4.18.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-humanfriendly.inc
diff --git a/meta-python/recipes-devtools/python/python-humanfriendly.inc b/meta-python/recipes-devtools/python/python3-humanfriendly_8.2.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python-humanfriendly.inc
rename to meta-python/recipes-devtools/python/python3-humanfriendly_8.2.bb
index 94f7f8b81..61c969d76 100644
--- a/meta-python/recipes-devtools/python/python-humanfriendly.inc
+++ b/meta-python/recipes-devtools/python/python3-humanfriendly_8.2.bb
@@ -2,14 +2,14 @@ DESCRIPTION = "Human friendly output for text interfaces using Python"
 HOMEPAGE = "https://humanfriendly.readthedocs.io/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=690da298a43805797a4fa7bbe180b3c6"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=764e737b117a38d773609885e8d04f0b"
 
 PYPI_PACKAGE = "humanfriendly"
 
-SRC_URI[md5sum] = "9573f9f37a5454d8205cfd1b9b8db9d2"
-SRC_URI[sha256sum] = "33ee8ceb63f1db61cce8b5c800c531e1a61023ac5488ccde2ba574a85be00a85"
+SRC_URI[md5sum] = "e6064a6fe099c4231c3e969ca5fea335"
+SRC_URI[sha256sum] = "bf52ec91244819c780341a3438d5d7b09f431d3f113a475147ac9b7b167a3d12"
 
-inherit pypi
+inherit pypi setuptools3
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-datetime \
-- 
2.17.1

