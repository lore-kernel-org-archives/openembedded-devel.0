Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3N7G-0000Ma-5G
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 10:13:42 +0200
Received: by weyr6 with SMTP id r6so3977656wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 01:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+jJaPq40RWJaLEBL4UwRBmX5BQTiL2SNFLkAps3p3Qg=;
	b=LB5cr59SBLfRKAu4RKPO0TKyl/68lyeKmYAXPoAo34yQ0kkVeKSR58x68Ev8ZnCzLr
	M8X9nbu0rEK6gHDEAnATueJeKQebnPfZ4lsTr9XRipe/htp8lyhkbtCQQ32PC2QuW76e
	/FTTI/pn98Fz9mSKoHrFxtughLkPCKsugI6FXhqaSb8owB/HoMr51dEYpZ/cJfde9pvV
	jQupDA6wPaAlxqIBpwfYkTT/o6AEIeDT6AIDhLcjx0LdViE2YK0Q2P8gjnRNuPxl+wvG
	3nHnw8Jwedw3CbvOlZCqfXw70v2pkPPJDctOV7WBd55CN1l6uPXGlWm2Lauhabkt8nuv
	cDhg==
Received: by 10.180.7.200 with SMTP id l8mr26792796wia.9.1345449700196;
	Mon, 20 Aug 2012 01:01:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w7sm26814285wiz.0.2012.08.20.01.01.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 01:01:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 10:00:55 +0200
Message-Id: <d19953e28e630de55caefba81571c31b6c358102.1345449578.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <7c28fa0c71de1b487d05695b8401333140bc76b5.1345449578.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
	<7c28fa0c71de1b487d05695b8401333140bc76b5.1345449578.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1345449578.git.Martin.Jansa@gmail.com>
References: <cover.1345449578.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 52/52] python-efl: upgrade to 1.6.99-beta
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
X-List-Received-Date: Mon, 20 Aug 2012 08:13:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../python/python-ecore_1.6.99-alpha.bb            |    6 ------
 .../python/python-ecore_1.6.99-beta.bb             |    6 ++++++
 .../python/python-edbus_1.6.99-alpha.bb            |    6 ------
 .../python/python-edbus_1.6.99-beta.bb             |    6 ++++++
 .../python/python-edje_1.6.99-alpha.bb             |    7 -------
 .../python/python-edje_1.6.99-beta.bb              |    7 +++++++
 .../python/python-elementary_1.6.99-alpha.bb       |    6 ------
 .../python/python-elementary_1.6.99-beta.bb        |    6 ++++++
 .../python/python-emotion_1.6.99-alpha.bb          |    6 ------
 .../python/python-emotion_1.6.99-beta.bb           |    6 ++++++
 .../python/python-evas_1.6.99-alpha.bb             |    6 ------
 .../python/python-evas_1.6.99-beta.bb              |    6 ++++++
 12 files changed, 37 insertions(+), 37 deletions(-)
 delete mode 100644 meta-efl/recipes-devtools/python/python-ecore_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-ecore_1.6.99-beta.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-edbus_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-edbus_1.6.99-beta.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-edje_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-edje_1.6.99-beta.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-elementary_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-elementary_1.6.99-beta.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-emotion_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-emotion_1.6.99-beta.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-evas_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-evas_1.6.99-beta.bb

diff --git a/meta-efl/recipes-devtools/python/python-ecore_1.6.99-alpha.bb b/meta-efl/recipes-devtools/python/python-ecore_1.6.99-alpha.bb
deleted file mode 100644
index a76c44f..0000000
--- a/meta-efl/recipes-devtools/python/python-ecore_1.6.99-alpha.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require ${BPN}.inc
-PR = "${INC_PR}.0"
-SRCVER = "1.7.0-alpha"
-
-SRC_URI[md5sum] = "86ba753726881b9bfcaa0fdc0827cd1e"
-SRC_URI[sha256sum] = "b47a155c0bfad6fad68bc0f925c54a8736a61ca72f6a71bd5138ea3298a35c95"
diff --git a/meta-efl/recipes-devtools/python/python-ecore_1.6.99-beta.bb b/meta-efl/recipes-devtools/python/python-ecore_1.6.99-beta.bb
new file mode 100644
index 0000000..f2c7750
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-ecore_1.6.99-beta.bb
@@ -0,0 +1,6 @@
+require ${BPN}.inc
+PR = "${INC_PR}.0"
+SRCVER = "1.7.0-beta"
+
+SRC_URI[md5sum] = "7cd483e817e41017adcd23cea4ce462d"
+SRC_URI[sha256sum] = "09a99f728b946c44955ad91e3ac072643e533ded74110f481e27b8f035877a95"
diff --git a/meta-efl/recipes-devtools/python/python-edbus_1.6.99-alpha.bb b/meta-efl/recipes-devtools/python/python-edbus_1.6.99-alpha.bb
deleted file mode 100644
index c643141..0000000
--- a/meta-efl/recipes-devtools/python/python-edbus_1.6.99-alpha.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require ${BPN}.inc
-PR = "${INC_PR}.0"
-SRCVER = "1.7.0-alpha"
-
-SRC_URI[md5sum] = "bd68e260e1a23fc14313afa48e70bebd"
-SRC_URI[sha256sum] = "63e823c8366f293db1940524ac76d6f91109a7202cf38ad6407d414d15e09aca"
diff --git a/meta-efl/recipes-devtools/python/python-edbus_1.6.99-beta.bb b/meta-efl/recipes-devtools/python/python-edbus_1.6.99-beta.bb
new file mode 100644
index 0000000..b3d0e2e
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-edbus_1.6.99-beta.bb
@@ -0,0 +1,6 @@
+require ${BPN}.inc
+PR = "${INC_PR}.0"
+SRCVER = "1.7.0-beta"
+
+SRC_URI[md5sum] = "d6140208bb2608bd320a70298c0c4234"
+SRC_URI[sha256sum] = "468bc77dc1b64d04c688b2f07ddcbeac406d984121b90e78ba802c92e58e4daf"
diff --git a/meta-efl/recipes-devtools/python/python-edje_1.6.99-alpha.bb b/meta-efl/recipes-devtools/python/python-edje_1.6.99-alpha.bb
deleted file mode 100644
index 1d7bb06..0000000
--- a/meta-efl/recipes-devtools/python/python-edje_1.6.99-alpha.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require ${BPN}.inc
-PR = "${INC_PR}.0"
-SRCVER = "1.7.0-alpha"
-SRC_URI += "file://0001-fix-unicode-conversion.patch"
-
-SRC_URI[md5sum] = "fbe5105abb5b2d3de71302ff3973945a"
-SRC_URI[sha256sum] = "f5004d9b784b0ca37436daacff7f4f21bb3094b9fdfc5abc95f8e57e90ecb242"
diff --git a/meta-efl/recipes-devtools/python/python-edje_1.6.99-beta.bb b/meta-efl/recipes-devtools/python/python-edje_1.6.99-beta.bb
new file mode 100644
index 0000000..3d88425
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-edje_1.6.99-beta.bb
@@ -0,0 +1,7 @@
+require ${BPN}.inc
+PR = "${INC_PR}.0"
+SRCVER = "1.7.0-beta"
+SRC_URI += "file://0001-fix-unicode-conversion.patch"
+
+SRC_URI[md5sum] = "eac613c2f3d88d30ba1adf4acd5090bf"
+SRC_URI[sha256sum] = "6ce7b57a4afaddf8dbf423543380cdc798c954b31ffd9d47e6af9536786abc05"
diff --git a/meta-efl/recipes-devtools/python/python-elementary_1.6.99-alpha.bb b/meta-efl/recipes-devtools/python/python-elementary_1.6.99-alpha.bb
deleted file mode 100644
index 8ed363e..0000000
--- a/meta-efl/recipes-devtools/python/python-elementary_1.6.99-alpha.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require ${BPN}.inc
-PR = "${INC_PR}.0"
-SRCVER = "1.7.0-alpha"
-
-SRC_URI[md5sum] = "bad3bd52e79aeea1ee9ffa0ab8a54855"
-SRC_URI[sha256sum] = "32ded2fb4e66aa543ae9274076d031f8465167a0cc1af3fcd26bcda85b2e7094"
diff --git a/meta-efl/recipes-devtools/python/python-elementary_1.6.99-beta.bb b/meta-efl/recipes-devtools/python/python-elementary_1.6.99-beta.bb
new file mode 100644
index 0000000..be63412
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-elementary_1.6.99-beta.bb
@@ -0,0 +1,6 @@
+require ${BPN}.inc
+PR = "${INC_PR}.0"
+SRCVER = "1.7.0-beta"
+
+SRC_URI[md5sum] = "f2b801aa8fe53914abbcfdf14aa1d325"
+SRC_URI[sha256sum] = "1255bab89b824754c1a0909f2646ff63fd0e12478e0bfbfbdc3cfd48ea9bfa25"
diff --git a/meta-efl/recipes-devtools/python/python-emotion_1.6.99-alpha.bb b/meta-efl/recipes-devtools/python/python-emotion_1.6.99-alpha.bb
deleted file mode 100644
index a2ad303..0000000
--- a/meta-efl/recipes-devtools/python/python-emotion_1.6.99-alpha.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require ${BPN}.inc
-PR = "${INC_PR}.0"
-SRCVER = "1.7.0-alpha"
-
-SRC_URI[md5sum] = "34249ce9ee6602205ede16e311c2712c"
-SRC_URI[sha256sum] = "f121a801c213d5014cde17df49107407bd60be362f98bab3530c14c9c8a54e03"
diff --git a/meta-efl/recipes-devtools/python/python-emotion_1.6.99-beta.bb b/meta-efl/recipes-devtools/python/python-emotion_1.6.99-beta.bb
new file mode 100644
index 0000000..976cf56
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-emotion_1.6.99-beta.bb
@@ -0,0 +1,6 @@
+require ${BPN}.inc
+PR = "${INC_PR}.0"
+SRCVER = "1.7.0-beta"
+
+SRC_URI[md5sum] = "3cfd52e8415f48d77fdb1fe73244c2b2"
+SRC_URI[sha256sum] = "76d673b99e5e894b469bb04f67a14492a6021edc95762ba71da7b24c36fa660a"
diff --git a/meta-efl/recipes-devtools/python/python-evas_1.6.99-alpha.bb b/meta-efl/recipes-devtools/python/python-evas_1.6.99-alpha.bb
deleted file mode 100644
index 8fa82da..0000000
--- a/meta-efl/recipes-devtools/python/python-evas_1.6.99-alpha.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require ${BPN}.inc
-PR = "${INC_PR}.0"
-SRCVER = "1.7.0-alpha"
-
-SRC_URI[md5sum] = "c3e02d8e897508db2d6365dc3b83ae20"
-SRC_URI[sha256sum] = "5af43a770e0edaf01c679c8eaecef38c747c8801980f1d9423d040cf36220d76"
diff --git a/meta-efl/recipes-devtools/python/python-evas_1.6.99-beta.bb b/meta-efl/recipes-devtools/python/python-evas_1.6.99-beta.bb
new file mode 100644
index 0000000..cabc9c8
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-evas_1.6.99-beta.bb
@@ -0,0 +1,6 @@
+require ${BPN}.inc
+PR = "${INC_PR}.0"
+SRCVER = "1.7.0-beta"
+
+SRC_URI[md5sum] = "19262c0baac27f35f136e4aaa3ca0171"
+SRC_URI[sha256sum] = "6784109dc637bd8a50f31eb3a9ff31e0eece0fba04c8a2a527d6bd83c1b02cf8"
-- 
1.7.8.6



