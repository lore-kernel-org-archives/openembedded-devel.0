Return-Path: <martin.jansa@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id D46B060810
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 12:09:10 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id 14so1632349pdj.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 05:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=YE3/pPWRULHN/XUsVJox8W4ckIz4Pf/MDQCc+XsUAkI=;
	b=kyLxcuqC+Sa1SluC0GSgNu8ngIUN1X7gj7o922Atv7tSLhhAabr/sGt33TDFhWx5eu
	J9XcaY2c/Opg4S+2qad8dh9SnzNm5di+GWFCJwTEE2cOqOdO2m7A2ffs+/T10IPfeSwH
	EDhkiUZ2YbWWig2P3+6d9K2kNOYgPDRwEm2SIZIBMWbi6wosdMpphhPkc1aqigRYHY86
	tA6K8KxEvMgK9KD/hDC6g+777rAzmmsktASFYiNG5dGQh2koSrE/5BbsSY7p2yKUGxLm
	/G8X03+EfWS2zY0CBTfhFRbSAtgOLci0SH5PNRgj7aploY2B0tWc9Vwh/SbKCp9N6rfd
	4UMA==
X-Received: by 10.68.225.197 with SMTP id rm5mr7568904pbc.137.1369224551947;
	Wed, 22 May 2013 05:09:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	v7sm6997377pbq.32.2013.05.22.05.09.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 May 2013 05:09:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 May 2013 14:09:02 +0200
Message-Id: <1369224543-4539-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [meta-efl][PATCH 1/2] meta-efl: upgrade efl to 1.7.7, e-wm to 0.17.3
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
X-List-Received-Date: Wed, 22 May 2013 12:09:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb              | 16 ----------------
 meta-efl/recipes-efl/e17/e-wm_0.17.3.bb                | 16 ++++++++++++++++
 meta-efl/recipes-efl/efl/ecore_1.7.6.bb                | 11 -----------
 meta-efl/recipes-efl/efl/ecore_1.7.7.bb                | 11 +++++++++++
 meta-efl/recipes-efl/efl/edbus_1.7.6.bb                | 10 ----------
 meta-efl/recipes-efl/efl/edbus_1.7.7.bb                | 10 ++++++++++
 meta-efl/recipes-efl/efl/edje_1.7.6.bb                 | 10 ----------
 meta-efl/recipes-efl/efl/edje_1.7.7.bb                 | 10 ++++++++++
 meta-efl/recipes-efl/efl/eet_1.7.6.bb                  | 10 ----------
 meta-efl/recipes-efl/efl/eet_1.7.7.bb                  | 10 ++++++++++
 meta-efl/recipes-efl/efl/eeze_1.7.6.bb                 | 10 ----------
 meta-efl/recipes-efl/efl/eeze_1.7.7.bb                 | 10 ++++++++++
 meta-efl/recipes-efl/efl/efreet_1.7.6.bb               | 10 ----------
 meta-efl/recipes-efl/efl/efreet_1.7.7.bb               | 10 ++++++++++
 meta-efl/recipes-efl/efl/eina_1.7.6.bb                 | 10 ----------
 meta-efl/recipes-efl/efl/eina_1.7.7.bb                 | 10 ++++++++++
 meta-efl/recipes-efl/efl/eio_1.7.6.bb                  | 10 ----------
 meta-efl/recipes-efl/efl/eio_1.7.7.bb                  | 10 ++++++++++
 meta-efl/recipes-efl/efl/elementary_1.7.6.bb           | 10 ----------
 meta-efl/recipes-efl/efl/elementary_1.7.7.bb           | 10 ++++++++++
 meta-efl/recipes-efl/efl/embryo_1.7.6.bb               | 10 ----------
 meta-efl/recipes-efl/efl/embryo_1.7.7.bb               | 10 ++++++++++
 meta-efl/recipes-efl/efl/emotion_1.7.6.bb              | 10 ----------
 meta-efl/recipes-efl/efl/emotion_1.7.7.bb              | 10 ++++++++++
 meta-efl/recipes-efl/efl/ethumb_1.7.6.bb               | 10 ----------
 meta-efl/recipes-efl/efl/ethumb_1.7.7.bb               | 10 ++++++++++
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.6.bb | 10 ----------
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.7.bb | 10 ++++++++++
 meta-efl/recipes-efl/efl/evas_1.7.6.1.bb               | 10 ----------
 meta-efl/recipes-efl/efl/evas_1.7.7.bb                 | 10 ++++++++++
 meta-efl/recipes-efl/efl/expedite_1.7.6.bb             | 10 ----------
 meta-efl/recipes-efl/efl/expedite_1.7.7.bb             | 10 ++++++++++
 32 files changed, 167 insertions(+), 167 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb
 create mode 100644 meta-efl/recipes-efl/e17/e-wm_0.17.3.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ecore_1.7.6.bb
 create mode 100644 meta-efl/recipes-efl/efl/ecore_1.7.7.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edbus_1.7.6.bb
 create mode 100644 meta-efl/recipes-efl/efl/edbus_1.7.7.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edje_1.7.6.bb
 create mode 100644 meta-efl/recipes-efl/efl/edje_1.7.7.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eet_1.7.6.bb
 create mode 100644 meta-efl/recipes-efl/efl/eet_1.7.7.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eeze_1.7.6.bb
 create mode 100644 meta-efl/recipes-efl/efl/eeze_1.7.7.bb
 delete mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.6.bb
 create mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.7.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eina_1.7.6.bb
 create mode 100644 meta-efl/recipes-efl/efl/eina_1.7.7.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eio_1.7.6.bb
 create mode 100644 meta-efl/recipes-efl/efl/eio_1.7.7.bb
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.6.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.7.bb
 delete mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.6.bb
 create mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.7.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.6.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.7.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.6.bb
 create mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.7.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.6.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.7.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas_1.7.6.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas_1.7.7.bb
 delete mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.6.bb
 create mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.7.bb

diff --git a/meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb b/meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb
deleted file mode 100644
index 5ff68bb..0000000
--- a/meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRCNAME = "enlightenment"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-    file://enlightenment_start.oe \
-    file://applications.menu \
-"
-
-SRC_URI[md5sum] = "dd6ffbe1ee6a804dbd2a7b2645bf3b4d"
-SRC_URI[sha256sum] = "66d250a865ffb97b12cabe8081ae041ce6924f55ffffaca6c65d468bb9f902f9"
diff --git a/meta-efl/recipes-efl/e17/e-wm_0.17.3.bb b/meta-efl/recipes-efl/e17/e-wm_0.17.3.bb
new file mode 100644
index 0000000..25bde7d
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/e-wm_0.17.3.bb
@@ -0,0 +1,16 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCNAME = "enlightenment"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+    file://enlightenment_start.oe \
+    file://applications.menu \
+"
+
+SRC_URI[md5sum] = "e20f4d75a40f3de0dcd2862ca0483ebc"
+SRC_URI[sha256sum] = "fb4856c705633f8cbac7b576387204d56a1dbd652005b11a0e5bfdf0f1ca389e"
diff --git a/meta-efl/recipes-efl/efl/ecore_1.7.6.bb b/meta-efl/recipes-efl/efl/ecore_1.7.6.bb
deleted file mode 100644
index 0842878..0000000
--- a/meta-efl/recipes-efl/efl/ecore_1.7.6.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-    file://fix-ecore-fb-initialization.patch \
-"
-
-SRC_URI[md5sum] = "a41828b5b4ca42283d8658c0fe54db07"
-SRC_URI[sha256sum] = "94e08f58acb5021727ecd4d6da0ac7dc3db672542ac5fcd71681835190ad6555"
diff --git a/meta-efl/recipes-efl/efl/ecore_1.7.7.bb b/meta-efl/recipes-efl/efl/ecore_1.7.7.bb
new file mode 100644
index 0000000..aad7a27
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/ecore_1.7.7.bb
@@ -0,0 +1,11 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+    file://fix-ecore-fb-initialization.patch \
+"
+
+SRC_URI[md5sum] = "8974d55e80bab1405c24b73f1f43153c"
+SRC_URI[sha256sum] = "1a933394897bba8d255c3e458501be9ed30fa2a02f7552e338350f54e2342fd6"
diff --git a/meta-efl/recipes-efl/efl/edbus_1.7.6.bb b/meta-efl/recipes-efl/efl/edbus_1.7.6.bb
deleted file mode 100644
index 17f7c1b..0000000
--- a/meta-efl/recipes-efl/efl/edbus_1.7.6.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "3b4694a1b7c8f635effb225fe4c1f43d"
-SRC_URI[sha256sum] = "9064d4b16882d3657caacf9fe9a93849e71a93c9fdc6bbc20901ff89c9296e06"
diff --git a/meta-efl/recipes-efl/efl/edbus_1.7.7.bb b/meta-efl/recipes-efl/efl/edbus_1.7.7.bb
new file mode 100644
index 0000000..f8da1fd
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/edbus_1.7.7.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "d9bf302b9b3f6cfd98840e6e8ca8c0ce"
+SRC_URI[sha256sum] = "ad2b545d29920a3c245e7d73cced8be0fbef28cc003028fe4938961810748fef"
diff --git a/meta-efl/recipes-efl/efl/edje_1.7.6.bb b/meta-efl/recipes-efl/efl/edje_1.7.6.bb
deleted file mode 100644
index 0795e8d..0000000
--- a/meta-efl/recipes-efl/efl/edje_1.7.6.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "2fa9079a1c53efebad47dccf6cb3a62c"
-SRC_URI[sha256sum] = "36663e1db7f615675b188f579454ef881fa7db1a3e8070ccedcb65dfedd0a959"
diff --git a/meta-efl/recipes-efl/efl/edje_1.7.7.bb b/meta-efl/recipes-efl/efl/edje_1.7.7.bb
new file mode 100644
index 0000000..f688363
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/edje_1.7.7.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "8aa82193b59aef8fc91577f1226d2daa"
+SRC_URI[sha256sum] = "ad912d56b6f3e27442d069ce1c8f1ba50b635ef5f408a9cc00912c927bed2a1e"
diff --git a/meta-efl/recipes-efl/efl/eet_1.7.6.bb b/meta-efl/recipes-efl/efl/eet_1.7.6.bb
deleted file mode 100644
index 023dab0..0000000
--- a/meta-efl/recipes-efl/efl/eet_1.7.6.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "16a3b3cffbc7d63a5efdd673793e4a7a"
-SRC_URI[sha256sum] = "fbdebf7a07ba5b3c0821bd0941e048c411af2e6da2581ed57b806b3f7abb0748"
diff --git a/meta-efl/recipes-efl/efl/eet_1.7.7.bb b/meta-efl/recipes-efl/efl/eet_1.7.7.bb
new file mode 100644
index 0000000..7c701c5
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eet_1.7.7.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "a4ee8343fdb93ff00359e595f45488cd"
+SRC_URI[sha256sum] = "d3c801995d7ec1f85de0adda440c4577060e2895c4ef21da60077773d5874f1b"
diff --git a/meta-efl/recipes-efl/efl/eeze_1.7.6.bb b/meta-efl/recipes-efl/efl/eeze_1.7.6.bb
deleted file mode 100644
index 85dd6b1..0000000
--- a/meta-efl/recipes-efl/efl/eeze_1.7.6.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "8e23ead15f9f52df5ffd05560153756f"
-SRC_URI[sha256sum] = "4fa401a67dcec4b711e3eb29d827a2453b77e9add91938a4e30de866d36155f4"
diff --git a/meta-efl/recipes-efl/efl/eeze_1.7.7.bb b/meta-efl/recipes-efl/efl/eeze_1.7.7.bb
new file mode 100644
index 0000000..27485d9
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eeze_1.7.7.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "8050f8701e3176a9f880ed50bbfd33a6"
+SRC_URI[sha256sum] = "975461750b6487884bd39dbd1078cd2a1a333451a8b85c8d6bb231d87936caf4"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.7.6.bb b/meta-efl/recipes-efl/efl/efreet_1.7.6.bb
deleted file mode 100644
index af7e44b..0000000
--- a/meta-efl/recipes-efl/efl/efreet_1.7.6.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "3888d88fcbf50e8977fc9f198facee8e"
-SRC_URI[sha256sum] = "499b9c29016b10efd9b2c6c784b8413986269db8313fa95fb39dd2e042cde5bb"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.7.7.bb b/meta-efl/recipes-efl/efl/efreet_1.7.7.bb
new file mode 100644
index 0000000..a7db2fe
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/efreet_1.7.7.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "f470cdfad747f615a25785ba18044ea6"
+SRC_URI[sha256sum] = "674177824a0dd20c29caec20b94355bafa529d15243cc1a06fe6bec1cbe7d88b"
diff --git a/meta-efl/recipes-efl/efl/eina_1.7.6.bb b/meta-efl/recipes-efl/efl/eina_1.7.6.bb
deleted file mode 100644
index b3dafd5..0000000
--- a/meta-efl/recipes-efl/efl/eina_1.7.6.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "4f0075f404223284dac0f34f676c511e"
-SRC_URI[sha256sum] = "f204c0de00f46c54bf923477797d75e8b48e00f9173143e0e057e98a2dda9427"
diff --git a/meta-efl/recipes-efl/efl/eina_1.7.7.bb b/meta-efl/recipes-efl/efl/eina_1.7.7.bb
new file mode 100644
index 0000000..905d8e2
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eina_1.7.7.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "baeb29327fc017e3ced890dc822c74ef"
+SRC_URI[sha256sum] = "9812ea4c98ad4086bb93dedf04f49125c41cf3c72773f7e2a89a2e3ea62cbce4"
diff --git a/meta-efl/recipes-efl/efl/eio_1.7.6.bb b/meta-efl/recipes-efl/efl/eio_1.7.6.bb
deleted file mode 100644
index 5c45c92..0000000
--- a/meta-efl/recipes-efl/efl/eio_1.7.6.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "c180817c536822153a1853b74a96d01a"
-SRC_URI[sha256sum] = "659db01da170a7c02b9087b0b66c238ac834016973fa04b13575b1bc445d1c00"
diff --git a/meta-efl/recipes-efl/efl/eio_1.7.7.bb b/meta-efl/recipes-efl/efl/eio_1.7.7.bb
new file mode 100644
index 0000000..2e59e63
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eio_1.7.7.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "edbbe1cfd6f73de3af74b83c980ba0c8"
+SRC_URI[sha256sum] = "5bf904a6c6e79e2046d0b3f355570f754511436636d41a271aeed6890cb25194"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.7.6.bb b/meta-efl/recipes-efl/efl/elementary_1.7.6.bb
deleted file mode 100644
index 060a854..0000000
--- a/meta-efl/recipes-efl/efl/elementary_1.7.6.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "48f28d887432f9aca434c864de33d5f8"
-SRC_URI[sha256sum] = "eb52844e6bb95df1b83397fbcc3c7e234631cd91c83271781320f285eaf75d44"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.7.7.bb b/meta-efl/recipes-efl/efl/elementary_1.7.7.bb
new file mode 100644
index 0000000..da53e27
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elementary_1.7.7.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "079cce349333b4831d3f56abeefa1d2d"
+SRC_URI[sha256sum] = "b7850d1f1438ba58b780320d37522bf2e9e81339ebc6b660ad9cb3ea81f6c253"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.7.6.bb b/meta-efl/recipes-efl/efl/embryo_1.7.6.bb
deleted file mode 100644
index a288052..0000000
--- a/meta-efl/recipes-efl/efl/embryo_1.7.6.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "6302e1845d50074a949d8d822e2c8874"
-SRC_URI[sha256sum] = "0d0d584b031193f86ce0935898bc3dccb263e945f981125bc7804903c8d34a84"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.7.7.bb b/meta-efl/recipes-efl/efl/embryo_1.7.7.bb
new file mode 100644
index 0000000..933c3c4
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/embryo_1.7.7.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "a4a2aa43a41afa783132a7220c450f6b"
+SRC_URI[sha256sum] = "0b5f0c7f2357f0e31b9cf797e5a606bd491d75c9f3b8e006da15d4a8c17c9225"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.7.6.bb b/meta-efl/recipes-efl/efl/emotion_1.7.6.bb
deleted file mode 100644
index 1a7edb3..0000000
--- a/meta-efl/recipes-efl/efl/emotion_1.7.6.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "eb15b6faa1e4a30f80622a1381c670fc"
-SRC_URI[sha256sum] = "7507a2544fb9d59e8a8835628a44141943bf3a7489f093eb557be396c3eff650"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.7.7.bb b/meta-efl/recipes-efl/efl/emotion_1.7.7.bb
new file mode 100644
index 0000000..c680b89
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/emotion_1.7.7.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "8b53d2d945d6a40b012472f47568879a"
+SRC_URI[sha256sum] = "aab476f80d4ad89056ba3860dfbb681c335c3688825fd587f5cbc6d9728abd41"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.7.6.bb b/meta-efl/recipes-efl/efl/ethumb_1.7.6.bb
deleted file mode 100644
index b8ced29..0000000
--- a/meta-efl/recipes-efl/efl/ethumb_1.7.6.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "343ef0dfda62295db353b7dca059e4a7"
-SRC_URI[sha256sum] = "c93bdfc9cf10f8759c41c172167cb1b5ebccddd8f499cc7e1bcc5410cae3146a"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.7.7.bb b/meta-efl/recipes-efl/efl/ethumb_1.7.7.bb
new file mode 100644
index 0000000..5e700cb
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/ethumb_1.7.7.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "58a1e8476dcc15ecffc8d542be656cb9"
+SRC_URI[sha256sum] = "541d07017f99b567976b2678466dbb5b540a4e93bf4fab987f3d0d612010da20"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.6.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.6.bb
deleted file mode 100644
index eb2e6f9..0000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.6.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "f025e08a673ba4f11a3d17fc50e0abb1"
-SRC_URI[sha256sum] = "9cedd062da2305caa17d3ca8589efd640526d4b720cce89a177374c4e0fdf423"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.7.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.7.bb
new file mode 100644
index 0000000..ea07ae9
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.7.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "0af7e3a5e0bf931bf87294d39eae3623"
+SRC_URI[sha256sum] = "4eef549641d26b921f564169af1f21f7854431f523897cd167d3c3c860e854aa"
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.6.1.bb b/meta-efl/recipes-efl/efl/evas_1.7.6.1.bb
deleted file mode 100644
index f434d1a..0000000
--- a/meta-efl/recipes-efl/efl/evas_1.7.6.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "c1710b7769c6dc8cfb0a21190fbc0c9b"
-SRC_URI[sha256sum] = "ebfd6d178999128855c65b8edeeec5cc1f1b2acbdd1d8aac197a268764bdeacc"
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.7.bb b/meta-efl/recipes-efl/efl/evas_1.7.7.bb
new file mode 100644
index 0000000..fb6394c
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas_1.7.7.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.1"
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "980abd6f645a38aa0a5d74f11a0e07f9"
+SRC_URI[sha256sum] = "ea8403d58cd079a651c515e76d7812deb0f7c2f41bb9807b3040a023b2fba78c"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.7.6.bb b/meta-efl/recipes-efl/efl/expedite_1.7.6.bb
deleted file mode 100644
index c582ad1..0000000
--- a/meta-efl/recipes-efl/efl/expedite_1.7.6.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "a4a6f3a84ff85d78c74e56a046bd3419"
-SRC_URI[sha256sum] = "d4f739779c45dcc1ff221fb17100f9928309bbf5ea243b4da6554c08025b2c18"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.7.7.bb b/meta-efl/recipes-efl/efl/expedite_1.7.7.bb
new file mode 100644
index 0000000..be922b5
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/expedite_1.7.7.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "46c6c6b21910b97caa62da57a0cd4b83"
+SRC_URI[sha256sum] = "62f1caba9715ce9d4047fa9a2c4ed6c756cc37fc0078404b7074d16b9293c333"
-- 
1.8.2.1


