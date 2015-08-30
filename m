Return-Path: <net147@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7146E7422C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 08:41:18 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so106328734pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 01:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=tv0yWys+Rk+3DXg/V1Q/BuTe0lyE7MmW/638kPN/ScA=;
	b=Mwc0GtiaOxq/bqtQxBpshD5jTlB9DkEdZmQByJtYF0K7rpDX9X5a4JWviXf8pansmw
	RRGyn/rUxQq/7GdxlMRgkm8fbQD4b4HZGsnG50ZehLZ8imyufpJ42tetUs1sO6XQf6m/
	vOGP2+C9/HESYEfeCQQcPmmrFa8cR6WQug6I2aJsVkOFgdgcNqsV+a1pw8JiQ0HBy96R
	D+J8bORw1XbLlgYycbI5NwHk84csjJwy4IWtfgvDjduHpC/62qfV6FIV+tPVKGzdTJBL
	2/9JIeqE/R8cQRJg06J+qdoZrV3AHEAQDYwpiOZPkZ53mBVsR12BRSCV0/Tsa/yh/kPH
	yIsw==
X-Received: by 10.66.124.202 with SMTP id mk10mr29228428pab.138.1440924078402; 
	Sun, 30 Aug 2015 01:41:18 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	mv4sm10704520pdb.51.2015.08.30.01.41.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Aug 2015 01:41:17 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Aug 2015 18:41:33 +1000
Message-Id: <1440924093-4975-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-qt5][PATCH] classes: qmake5: move QMAKE_MKSPEC_PATH variables to qmake5_paths
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
X-List-Received-Date: Sun, 30 Aug 2015 08:41:19 -0000

qmake5_paths.bbclass refers to QMAKE_MKSPEC_PATH_TARGET which is not
defined when inheriting qmake5_paths directly instead of qmake5_base.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 classes/qmake5_base.bbclass  | 8 --------
 classes/qmake5_paths.bbclass | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index ffb3103..d371ff3 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -1,11 +1,3 @@
-# This is useful for target recipes to reference native mkspecs
-QMAKE_MKSPEC_PATH_NATIVE = "${STAGING_LIBDIR_NATIVE}/${QT_DIR_NAME}"
-QMAKE_MKSPEC_PATH_TARGET = "${STAGING_LIBDIR}/${QT_DIR_NAME}"
-
-QMAKE_MKSPEC_PATH = "${QMAKE_MKSPEC_PATH_TARGET}"
-QMAKE_MKSPEC_PATH_class-native = "${QMAKE_MKSPEC_PATH_NATIVE}"
-QMAKE_MKSPEC_PATH_class-nativesdk = "${QMAKE_MKSPEC_PATH_NATIVE}"
-
 # hardcode linux, because that's what 0001-Add-linux-oe-g-platform.patch adds
 OE_QMAKE_PLATFORM_NATIVE = "linux-oe-g++"
 OE_QMAKE_PLATFORM = "linux-oe-g++"
diff --git a/classes/qmake5_paths.bbclass b/classes/qmake5_paths.bbclass
index 8f91e93..c031077 100644
--- a/classes/qmake5_paths.bbclass
+++ b/classes/qmake5_paths.bbclass
@@ -4,6 +4,14 @@
 
 QT_DIR_NAME ?= "qt5"
 
+# This is useful for target recipes to reference native mkspecs
+QMAKE_MKSPEC_PATH_NATIVE = "${STAGING_LIBDIR_NATIVE}/${QT_DIR_NAME}"
+QMAKE_MKSPEC_PATH_TARGET = "${STAGING_LIBDIR}/${QT_DIR_NAME}"
+
+QMAKE_MKSPEC_PATH = "${QMAKE_MKSPEC_PATH_TARGET}"
+QMAKE_MKSPEC_PATH_class-native = "${QMAKE_MKSPEC_PATH_NATIVE}"
+QMAKE_MKSPEC_PATH_class-nativesdk = "${QMAKE_MKSPEC_PATH_NATIVE}"
+
 OE_QMAKE_PATH_PREFIX = "${prefix}"
 OE_QMAKE_PATH_HEADERS = "${includedir}/${QT_DIR_NAME}"
 OE_QMAKE_PATH_LIBS = "${libdir}"
-- 
2.5.0


