Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 657AA77E1C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Apr 2017 17:32:33 +0000 (UTC)
Received: from seahawk.toradex.int
	(75-146-58-181-Washington.hfc.comcastbusiness.net [75.146.58.181])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id D9DB15C1A1C;
	Fri,  7 Apr 2017 19:32:22 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Apr 2017 10:32:22 -0700
Message-Id: <1491586342-32249-1-git-send-email-stefan@agner.ch>
X-Mailer: git-send-email 2.7.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1491586343; bh=cW/AFCzjjb0RwzGEISs8rVyUviITyEUrVQt1IyR4nX8=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=HwzwYB/3RvkopLVRFmazNmt5pOlN+3+KnPb67isih2wOdOIv3g5gayOZuV53GMMbXjsl1rf8XREbxSfdewn1WVl78U5OOxNaCtx+OSPkzKFEB0khUrftCR5HO/LjvhjD+FCJOTioqau0RBPGWhRa9Qwa5jCKEvXFKPWuSbYJ3n4=
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-python][PATCH] python-pyalsaaudio: Extend recipe to support Python 3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Apr 2017 17:32:35 -0000

From: Stefan Agner <stefan.agner@toradex.com>

alsaaudio support Python 3 already, add a Python 3 recipe so we
can build alsaaudio for Python 3.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta-python/recipes-devtools/python/python-pyalsaaudio.inc  | 11 +++++++++++
 .../recipes-devtools/python/python-pyalsaaudio_0.8.4.bb     | 13 +------------
 .../recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb    |  2 ++
 3 files changed, 14 insertions(+), 12 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pyalsaaudio.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb

diff --git a/meta-python/recipes-devtools/python/python-pyalsaaudio.inc b/meta-python/recipes-devtools/python/python-pyalsaaudio.inc
new file mode 100644
index 0000000..d150409
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyalsaaudio.inc
@@ -0,0 +1,11 @@
+SUMMARY = "Support for the Linux 2.6.x ALSA Sound System"
+SECTION = "devel/python"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d"
+
+SRC_URI[md5sum] = "b46f69561bc85fc52e698b2440ca251e"
+SRC_URI[sha256sum] = "84e8f8da544d7f4bd96479ce4a237600077984d9be1d7f16c1d9a492ecf50085"
+
+DEPENDS += "alsa-lib"
+
+RDEPENDS_${PN} += "libasound"
diff --git a/meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb b/meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb
index b443570..e515342 100644
--- a/meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb
+++ b/meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb
@@ -1,13 +1,2 @@
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
+require python-pyalsaaudio.inc
 inherit pypi setuptools
-
-RDEPENDS_${PN} += "libasound"
diff --git a/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb b/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb
new file mode 100644
index 0000000..b7da1a4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb
@@ -0,0 +1,2 @@
+require python-pyalsaaudio.inc
+inherit pypi setuptools3
-- 
2.7.4


