Return-Path: <net147@gmail.com>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id B3C366A59D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Aug 2013 08:51:37 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id un15so1528384pbc.15
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Aug 2013 01:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=723MtVTOmwlhI1QtHrbxLGrY+x6K5z8yzMewYtXU3Lw=;
	b=dDLgnACtNBaFmhXbsIWfE4V4XXq7Lk0cNGmHcZhIzq8wfqeqP8ahUmzBhCtBDZbX3L
	0ottO01Ffd5IUElPL9vRHxB0GoplMsR4oaxqm9eCDeSUP9/YX3+Df/NyYZjbWCbeWBiD
	qWJWL++T6jCMV9JLNVUEv1eGz5yHdZ+cOxtjbvJUj6MpM9I02vSDdZLiZrBLgSW08jVb
	ByBq+mRpeVSWyF8i0HEslax9XJZDjl7SjTkLrv4gn0uzMu32ev6xBc6aZrsMCZC4d0kN
	4djNeQlzBYZYIcdS2Xaa+guiMu8U7BIh6nmO29IspGtzcMsg5arbcT1Cjg/Ea+3YoTkU
	EJdQ==
X-Received: by 10.66.118.163 with SMTP id kn3mr14690131pab.165.1375519898276; 
	Sat, 03 Aug 2013 01:51:38 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	py4sm13114943pbc.14.2013.08.03.01.51.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 03 Aug 2013 01:51:37 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Aug 2013 18:46:10 +1000
Message-Id: <1375519570-11528-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [meta-qt5][PATCH] qtbase: add upstream QTBUG-32534 patch for QHttpMultiPart corruption
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Aug 2013 08:51:37 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 ...art-fix-data-corruption-in-readData-metho.patch | 41 ++++++++++++++++++++++
 ...art-fix-data-corruption-in-readData-metho.patch | 41 ++++++++++++++++++++++
 ...art-fix-data-corruption-in-readData-metho.patch | 41 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase.inc                          |  1 +
 4 files changed, 124 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase-5.0.2/0025-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch
 create mode 100644 recipes-qt/qt5/qtbase-5.1.0/0025-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch
 create mode 100644 recipes-qt/qt5/qtbase-git/0025-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch

diff --git a/recipes-qt/qt5/qtbase-5.0.2/0025-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch b/recipes-qt/qt5/qtbase-5.0.2/0025-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch
new file mode 100644
index 0000000..33e77ea
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-5.0.2/0025-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch
@@ -0,0 +1,41 @@
+From af96c6fed931564c95037539f07e9c8e33c69529 Mon Sep 17 00:00:00 2001
+From: Peter Hartmann <phartmann@blackberry.com>
+Date: Thu, 25 Jul 2013 12:05:29 -0400
+Subject: [PATCH] QHttpMultiPart: fix data corruption in readData method
+
+When readData() is called repeatedly, we need to keep track which
+part of the multipart message we are currently reading from.
+Hereby we also need to take the boundary size into account, and not
+only the size of the multipart; otherwise we would skip a not
+completely read part. This would then later lead to advancing the
+read pointer by negative indexes and data loss.
+
+Upstream-Status: Backport [https://codereview.qt-project.org/#change,61698]
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+
+Task-number: QTBUG-32534
+Change-Id: Ibb6dff16adaf4ea67181d23d1d0c8459e33a0ed0
+Reviewed-by: Jonathan Liu <net147@gmail.com>
+Reviewed-by: Shane Kearns <shane.kearns@accenture.com>
+---
+ src/network/access/qhttpmultipart.cpp              |  3 +-
+ .../access/qnetworkreply/tst_qnetworkreply.cpp     | 44 ++++++++++++++++++++++
+ 2 files changed, 46 insertions(+), 1 deletion(-)
+
+diff --git a/src/network/access/qhttpmultipart.cpp b/src/network/access/qhttpmultipart.cpp
+index 4397ef8..5985ed9 100644
+--- a/src/network/access/qhttpmultipart.cpp
++++ b/src/network/access/qhttpmultipart.cpp
+@@ -497,7 +497,8 @@ qint64 QHttpMultiPartIODevice::readData(char *data, qint64 maxSize)
+ 
+     // skip the parts we have already read
+     while (index < multiPart->parts.count() &&
+-           readPointer >= partOffsets.at(index) + multiPart->parts.at(index).d->size())
++           readPointer >= partOffsets.at(index) + multiPart->parts.at(index).d->size()
++           + multiPart->boundary.count() + 6) // 6 == 2 boundary dashes, \r\n after boundary, \r\n after multipart
+         index++;
+ 
+     // read the data
+-- 
+1.8.3.4
+
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0025-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch b/recipes-qt/qt5/qtbase-5.1.0/0025-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch
new file mode 100644
index 0000000..6858cea
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-5.1.0/0025-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch
@@ -0,0 +1,41 @@
+From af96c6fed931564c95037539f07e9c8e33c69529 Mon Sep 17 00:00:00 2001
+From: Peter Hartmann <phartmann@blackberry.com>
+Date: Thu, 25 Jul 2013 12:05:29 -0400
+Subject: [PATCH] QHttpMultiPart: fix data corruption in readData method
+
+When readData() is called repeatedly, we need to keep track which
+part of the multipart message we are currently reading from.
+Hereby we also need to take the boundary size into account, and not
+only the size of the multipart; otherwise we would skip a not
+completely read part. This would then later lead to advancing the
+read pointer by negative indexes and data loss.
+
+Upstream-Status: Accepted [https://codereview.qt-project.org/#change,61698]
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+
+Task-number: QTBUG-32534
+Change-Id: Ibb6dff16adaf4ea67181d23d1d0c8459e33a0ed0
+Reviewed-by: Jonathan Liu <net147@gmail.com>
+Reviewed-by: Shane Kearns <shane.kearns@accenture.com>
+---
+ src/network/access/qhttpmultipart.cpp              |  3 +-
+ .../access/qnetworkreply/tst_qnetworkreply.cpp     | 44 ++++++++++++++++++++++
+ 2 files changed, 46 insertions(+), 1 deletion(-)
+
+diff --git a/src/network/access/qhttpmultipart.cpp b/src/network/access/qhttpmultipart.cpp
+index 4397ef8..5985ed9 100644
+--- a/src/network/access/qhttpmultipart.cpp
++++ b/src/network/access/qhttpmultipart.cpp
+@@ -497,7 +497,8 @@ qint64 QHttpMultiPartIODevice::readData(char *data, qint64 maxSize)
+ 
+     // skip the parts we have already read
+     while (index < multiPart->parts.count() &&
+-           readPointer >= partOffsets.at(index) + multiPart->parts.at(index).d->size())
++           readPointer >= partOffsets.at(index) + multiPart->parts.at(index).d->size()
++           + multiPart->boundary.count() + 6) // 6 == 2 boundary dashes, \r\n after boundary, \r\n after multipart
+         index++;
+ 
+     // read the data
+-- 
+1.8.3.4
+
diff --git a/recipes-qt/qt5/qtbase-git/0025-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch b/recipes-qt/qt5/qtbase-git/0025-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch
new file mode 100644
index 0000000..6858cea
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-git/0025-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch
@@ -0,0 +1,41 @@
+From af96c6fed931564c95037539f07e9c8e33c69529 Mon Sep 17 00:00:00 2001
+From: Peter Hartmann <phartmann@blackberry.com>
+Date: Thu, 25 Jul 2013 12:05:29 -0400
+Subject: [PATCH] QHttpMultiPart: fix data corruption in readData method
+
+When readData() is called repeatedly, we need to keep track which
+part of the multipart message we are currently reading from.
+Hereby we also need to take the boundary size into account, and not
+only the size of the multipart; otherwise we would skip a not
+completely read part. This would then later lead to advancing the
+read pointer by negative indexes and data loss.
+
+Upstream-Status: Accepted [https://codereview.qt-project.org/#change,61698]
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+
+Task-number: QTBUG-32534
+Change-Id: Ibb6dff16adaf4ea67181d23d1d0c8459e33a0ed0
+Reviewed-by: Jonathan Liu <net147@gmail.com>
+Reviewed-by: Shane Kearns <shane.kearns@accenture.com>
+---
+ src/network/access/qhttpmultipart.cpp              |  3 +-
+ .../access/qnetworkreply/tst_qnetworkreply.cpp     | 44 ++++++++++++++++++++++
+ 2 files changed, 46 insertions(+), 1 deletion(-)
+
+diff --git a/src/network/access/qhttpmultipart.cpp b/src/network/access/qhttpmultipart.cpp
+index 4397ef8..5985ed9 100644
+--- a/src/network/access/qhttpmultipart.cpp
++++ b/src/network/access/qhttpmultipart.cpp
+@@ -497,7 +497,8 @@ qint64 QHttpMultiPartIODevice::readData(char *data, qint64 maxSize)
+ 
+     // skip the parts we have already read
+     while (index < multiPart->parts.count() &&
+-           readPointer >= partOffsets.at(index) + multiPart->parts.at(index).d->size())
++           readPointer >= partOffsets.at(index) + multiPart->parts.at(index).d->size()
++           + multiPart->boundary.count() + 6) // 6 == 2 boundary dashes, \r\n after boundary, \r\n after multipart
+         index++;
+ 
+     // read the data
+-- 
+1.8.3.4
+
diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 21386dc..47038d0 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -22,6 +22,7 @@ SRC_URI += " \
     file://0022-configure-make-alsa-a-configurable-option.patch \
     file://0023-configure-make-freetype-a-configurable-option.patch \
     file://0024-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch \
+    file://0025-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch \
 "
 
 DEPENDS += "qtbase-native"
-- 
1.8.3.4


