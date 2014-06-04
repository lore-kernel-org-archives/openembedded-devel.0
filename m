Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6413D6ABDA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 09:18:13 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id q59so8071617wes.38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 02:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3YkH3IuhLanVMpV/1lZmGWPgz7W5Fiom0wwNdGuykvg=;
	b=Q9fIJujJO4XLZq49fzHMTQJfsk5xPLodDvGcYFP0ynmYIWu0zHtFIuNGq6s/82rlrL
	TuGBRXFpTZBIC1Chud1f31PBHaGNyRQA7Kd7dcABj2vwBg/oTAGv2NLTtE00BPOa3RzQ
	1tTID6yUmAuNDZ/wVOVPhdSBGOSaWNRrOm9ftsd3gVcvhjfEl6DCcSnEyWXjWVorz09s
	/Hyf73VT4vJNOXG+dudpMQfQHQcFQeAsV5ytsTTHhOa+jFlqvYm7VQexfpxw6+srbBgc
	JAu0fy5tvB7Nwyf1o2QcxuWyOPnES0qNr0fr5pxTsKF+nHSErHGwsMxu/oalsPpVpTDX
	Vb6A==
X-Received: by 10.194.60.230 with SMTP id k6mr3403061wjr.4.1401873494439;
	Wed, 04 Jun 2014 02:18:14 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	na4sm47163591wic.21.2014.06.04.02.18.13 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jun 2014 02:18:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Jun 2014 11:18:18 +0200
Message-Id: <1401873504-32120-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-oe][PATCH 1/7] terminology: upgrade to 0.5.1
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
X-List-Received-Date: Wed, 04 Jun 2014 09:18:16 -0000

* announcement:
  https://phab.enlightenment.org/phame/post/view/57/
* LIC_FILES_CHKSUM change is just Copyright year update:
  < Copyright (C) 2012-2014 Carsten Haitzler and various contributors (see AUTHORS)
  ---
  > Copyright (C) 2012-2012 Carsten Haitzler and various contributors (see AUTHORS)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/terminology.inc      | 2 +-
 meta-efl/recipes-efl/e17/terminology_0.4.0.bb | 8 --------
 meta-efl/recipes-efl/e17/terminology_0.5.1.bb | 8 ++++++++
 meta-efl/recipes-efl/e17/terminology_svn.bb   | 9 ---------
 4 files changed, 9 insertions(+), 18 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/terminology_0.4.0.bb
 create mode 100644 meta-efl/recipes-efl/e17/terminology_0.5.1.bb
 delete mode 100644 meta-efl/recipes-efl/e17/terminology_svn.bb

diff --git a/meta-efl/recipes-efl/e17/terminology.inc b/meta-efl/recipes-efl/e17/terminology.inc
index 89c9ee5..9dd2264 100644
--- a/meta-efl/recipes-efl/e17/terminology.inc
+++ b/meta-efl/recipes-efl/e17/terminology.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Enlightenment Terminal Emulator"
 LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=03f6c2cf2bef233fadf7d0769f5bfda7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9a8682b561bdfa219d59483a679ed80a"
 DEPENDS = "evas ecore edje elementary eina eet emotion"
 
 inherit e gettext
diff --git a/meta-efl/recipes-efl/e17/terminology_0.4.0.bb b/meta-efl/recipes-efl/e17/terminology_0.4.0.bb
deleted file mode 100644
index 83ceee8..0000000
--- a/meta-efl/recipes-efl/e17/terminology_0.4.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/apps/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "5a2eee4849d4fa44db4caf743b3beb37"
-SRC_URI[sha256sum] = "63f2d1fa584ecda6c4ef61b05b8956415feb955c4bb13c0872c11d98024dcfc6"
diff --git a/meta-efl/recipes-efl/e17/terminology_0.5.1.bb b/meta-efl/recipes-efl/e17/terminology_0.5.1.bb
new file mode 100644
index 0000000..642b658
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/terminology_0.5.1.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/apps/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "d46cda519cf198cb19970146d31a9e8b"
+SRC_URI[sha256sum] = "ceef9e5a73f1dfdb412d074df1ead684fd31f630414c65eac8cd89fea13315ad"
diff --git a/meta-efl/recipes-efl/e17/terminology_svn.bb b/meta-efl/recipes-efl/e17/terminology_svn.bb
deleted file mode 100644
index 2518dba..0000000
--- a/meta-efl/recipes-efl/e17/terminology_svn.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require ${BPN}.inc
-
-DEFAULT_PREFERENCE = "-1"
-PV = "0.2.0+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-SRCREV = "${EFL_SRCREV}"
-
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
-S = "${WORKDIR}/${SRCNAME}"
-- 
2.0.0


