Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SMm9P-0000nM-1O
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Apr 2012 22:15:51 +0200
Received: by vbbfr13 with SMTP id fr13so893647vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Apr 2012 13:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=G1SZ4OxyOcZ3qB2mQT7Ljn/cG8rzdQItyTYRAfXR9lw=;
	b=KgVFcF/nZuYlsg0VR28BWHHfyDjkyoFv9H2Zk+KdgmHqFiDvQnGjrvvSU/F5Ro9xWm
	fA61BfcICGhHvHz4jKw6Aa8k6r2lC58JcWtrNCT0I/93vju1DH1udYHTO4hHmSCw2Q/O
	asZdmo9ZAPjBHuST4Lx+u1WzpCvBKHEFreNrZCRDx6LHe6woHT7KTKO0U44mZbZ9Vq/Y
	Eg7VtKh0vB3OXiU64LU+q7bZTdLgHAM9+7fXnKMUSw8zTbMGZHq8W/iwv+lTaZww4x6Y
	4pJgOAYzlKSnTMZSz+3w3of0mP8KOP1ABU8e8N4Np/qjN9J07F7mfDm5oP/v45ISxQha
	euMQ==
Received: by 10.52.30.9 with SMTP id o9mr10952690vdh.52.1335297975844;
	Tue, 24 Apr 2012 13:06:15 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id i4sm33183810vdk.8.2012.04.24.13.06.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Apr 2012 13:06:15 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Apr 2012 17:06:01 -0300
Message-Id: <bbd5ab02034bce8ab01c8ad03768bfbbb19a9a10.1335297926.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1335297926.git.otavio@ossystems.com.br>
References: <cover.1335297926.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1335297926.git.otavio@ossystems.com.br>
References: <cover.1335297926.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 2/2] xserver-common: drop xinput-calibrator call as it is done by xdg now
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Apr 2012 20:15:51 -0000

The new xinput-calibrator package provides a xdg file that handles
this logic so drop it from session.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...brate_xinput_calibrator-Xsession.d-script.patch |   27 --------------------
 .../xserver-common/xserver-common_1.34.bb          |    1 -
 2 files changed, 0 insertions(+), 28 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0004-add-Ts_Calibrate_xinput_calibrator-Xsession.d-script.patch

diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0004-add-Ts_Calibrate_xinput_calibrator-Xsession.d-script.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0004-add-Ts_Calibrate_xinput_calibrator-Xsession.d-script.patch
deleted file mode 100644
index 135b2a6..0000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0004-add-Ts_Calibrate_xinput_calibrator-Xsession.d-script.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 2877156d5bbc11f8d8e8d6aafd138173d2a4bd3b Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 11 Apr 2012 14:31:34 +0200
-Subject: [PATCH 04/12] add Ts_Calibrate_xinput_calibrator Xsession.d script
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- X11/Xsession.d/89xTs_Calibrate_xinput_calibrator |    7 +++++++
- 1 files changed, 7 insertions(+), 0 deletions(-)
- create mode 100644 X11/Xsession.d/89xTs_Calibrate_xinput_calibrator
-
-diff --git a/X11/Xsession.d/89xTs_Calibrate_xinput_calibrator b/X11/Xsession.d/89xTs_Calibrate_xinput_calibrator
-new file mode 100644
-index 0000000..6ef4d1e
---- /dev/null
-+++ b/X11/Xsession.d/89xTs_Calibrate_xinput_calibrator
-@@ -0,0 +1,7 @@
-+#!/bin/sh
-+
-+if [ -e /usr/bin/xinput_calibrator_once.sh ] ; then
-+  if [ -e /etc/pointercal.xinput ] ; then
-+    /usr/bin/xinput_calibrator_once.sh
-+  fi
-+fi
--- 
-1.7.8.5
-
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
index b0823bf..1147fca 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
@@ -14,7 +14,6 @@ SRC_URI_append = " \
   file://0001-COPYING-add-GPLv2-license-file.patch \
   file://0002-add-setdpi-Xinit.d-script.patch \
   file://0003-add-89xdgautostart-Xsession.d-script.patch \
-  file://0004-add-Ts_Calibrate_xinput_calibrator-Xsession.d-script.patch \
   file://0005-add-XWindowManager-Xsession.d-script.patch \
   file://0006-add-support-for-etc-X11-xserver-system.patch \
   file://0007-use-own-functions-file-instead-etc-init.d-functions.patch \
-- 
1.7.2.5



