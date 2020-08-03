Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.7795.1596448703593211934
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 02:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40162 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k2XEb-0003NX-OS; Mon, 03 Aug 2020 12:58:22 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-pyalsaaudio: Consolidate in a single file
Date: Mon,  3 Aug 2020 12:57:56 +0300
Message-Id: <20200803095759.9591-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200803095759.9591-1-leon.anavi@konsulko.com>
References: <20200803095759.9591-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.7
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

Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python-pyalsaaudio.inc  | 11 -----------
 .../python/python3-pyalsaaudio_0.8.4.bb             | 13 ++++++++++++-
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyalsaaudio.inc

diff --git a/meta-python/recipes-devtools/python/python-pyalsaaudio.inc b/meta-python/recipes-devtools/python/python-pyalsaaudio.inc
deleted file mode 100644
index d150409a2..000000000
--- a/meta-python/recipes-devtools/python/python-pyalsaaudio.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "Support for the Linux 2.6.x ALSA Sound System"
-SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d"
-
-SRC_URI[md5sum] = "b46f69561bc85fc52e698b2440ca251e"
-SRC_URI[sha256sum] = "84e8f8da544d7f4bd96479ce4a237600077984d9be1d7f16c1d9a492ecf50085"
-
-DEPENDS += "alsa-lib"
-
-RDEPENDS_${PN} += "libasound"
diff --git a/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb b/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb
index b7da1a43d..987010a14 100644
--- a/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb
@@ -1,2 +1,13 @@
-require python-pyalsaaudio.inc
+SUMMARY = "ALSA bindings"
+SECTION = "devel/python"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d"
+
 inherit pypi setuptools3
+
+SRC_URI[md5sum] = "b46f69561bc85fc52e698b2440ca251e"
+SRC_URI[sha256sum] = "84e8f8da544d7f4bd96479ce4a237600077984d9be1d7f16c1d9a492ecf50085"
+
+DEPENDS += "alsa-lib"
+
+RDEPENDS_${PN} += "libasound"
-- 
2.17.1

