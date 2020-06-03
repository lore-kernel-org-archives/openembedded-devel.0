Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.10653.1591178932418374372
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2020 03:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=42106 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jgQKF-0006VY-PF; Wed, 03 Jun 2020 13:08:48 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python-pyaudio: Consolidate in a single file
Date: Wed,  3 Jun 2020 13:08:36 +0300
Message-Id: <20200603100836.18456-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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
 .../recipes-devtools/python/python-pyaudio.inc    | 13 -------------
 .../python/python3-pyaudio_0.2.11.bb              | 15 ++++++++++++++-
 2 files changed, 14 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyaudio.inc

diff --git a/meta-python/recipes-devtools/python/python-pyaudio.inc b/meta-python/recipes-devtools/python/python-pyaudio.inc
deleted file mode 100644
index 0d3ddb1a5..000000000
--- a/meta-python/recipes-devtools/python/python-pyaudio.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "PyAudio provides Python bindings for PortAudio, the cross-platform audio I/O library"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README;md5=288793c2b9b05bd67abbd2a8f5d144f7"
-
-PYPI_PACKAGE = "PyAudio"
-
-SRC_URI[md5sum] = "7e4c88139284033f67b4336c74eda3b8"
-SRC_URI[sha256sum] = "93bfde30e0b64e63a46f2fd77e85c41fd51182a4a3413d9edfaf9ffaa26efb74"
-
-DEPENDS += "portaudio-v19"
-
-RDEPENDS_${PN} += "portaudio-v19"
diff --git a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb
index abb01bf69..b2c890659 100644
--- a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb
+++ b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb
@@ -1,2 +1,15 @@
-require python-pyaudio.inc
+SUMMARY = "PyAudio provides Python bindings for PortAudio, the cross-platform audio I/O library"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://README;md5=288793c2b9b05bd67abbd2a8f5d144f7"
+
+PYPI_PACKAGE = "PyAudio"
+
+SRC_URI[md5sum] = "7e4c88139284033f67b4336c74eda3b8"
+SRC_URI[sha256sum] = "93bfde30e0b64e63a46f2fd77e85c41fd51182a4a3413d9edfaf9ffaa26efb74"
+
 inherit pypi setuptools3
+
+DEPENDS += "portaudio-v19"
+
+RDEPENDS_${PN} += "portaudio-v19"
-- 
2.17.1

