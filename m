Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T91hu-0004XX-HA
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 00:34:54 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so4917933wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2012 15:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=BKBI8J0acJH5SrQIxy8mfkUd5h+d7uq04NTeISISzZo=;
	b=pKx/uVH4SS4UbBRfIIipOc6hsuRFLhj3CFMzTgsbF9dG93GlV48xiQ85BZ7cFQnS/L
	d9jVFrQeipAB6uECps/jGI2nHQykbORQ7nZ1zQp6GUVOP4L5GY9KIqxV+PpjTFEZeel2
	LjMJgbRb05JLUs2gAyEpWHU1SxXslTmiq5It7Wi6DXjDbWXYfN+jWz0cAubJg2X/c6rH
	9o+j9+lx9KzpYEHeaxE0t9qSbZBm+i81eJZJeSLcC02XACagcDUn/AA1Ey6szRSxUSGs
	ONhPWYCp0LOV/ouVHAnA4Gk7aDUz8V1h0ZjRhAYDgbLMpUFNalQrWNvWkMwddS9sG14C
	hfDA==
Received: by 10.216.138.200 with SMTP id a50mr6247427wej.155.1346797354564;
	Tue, 04 Sep 2012 15:22:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k2sm40137153wiz.7.2012.09.04.15.22.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 15:22:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2012 00:22:15 +0200
Message-Id: <d45db4c3ea18f9460b868cdacdcdc8a54a5e9fa4.1346790372.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1346790372.git.Martin.Jansa@gmail.com>
References: <cover.1346790372.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1346790372.git.Martin.Jansa@gmail.com>
References: <cover.1346790372.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 03/10] recipes-efl: upgrade from 1.7.0-beta to 1.7.0
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
X-List-Received-Date: Tue, 04 Sep 2012 22:34:54 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-efl/efl/{ecore_1.6.99-beta.bb => ecore_1.7.0.bb} |  6 ++----
 meta-efl/recipes-efl/efl/edbus_1.6.99-beta.bb                | 12 ------------
 meta-efl/recipes-efl/efl/edbus_1.7.0.bb                      | 10 ++++++++++
 meta-efl/recipes-efl/efl/edje_1.6.99-beta.bb                 | 12 ------------
 meta-efl/recipes-efl/efl/edje_1.7.0.bb                       | 10 ++++++++++
 meta-efl/recipes-efl/efl/eet_1.6.99-beta.bb                  | 12 ------------
 meta-efl/recipes-efl/efl/eet_1.7.0.bb                        | 10 ++++++++++
 meta-efl/recipes-efl/efl/eeze_1.6.99-beta.bb                 | 12 ------------
 meta-efl/recipes-efl/efl/eeze_1.7.0.bb                       | 10 ++++++++++
 meta-efl/recipes-efl/efl/efreet_1.6.99-beta.bb               | 12 ------------
 meta-efl/recipes-efl/efl/efreet_1.7.0.bb                     | 10 ++++++++++
 meta-efl/recipes-efl/efl/eina_1.6.99-beta.bb                 | 12 ------------
 meta-efl/recipes-efl/efl/eina_1.7.0.bb                       | 10 ++++++++++
 meta-efl/recipes-efl/efl/eio_1.6.99-beta.bb                  | 12 ------------
 meta-efl/recipes-efl/efl/eio_1.7.0.bb                        | 10 ++++++++++
 meta-efl/recipes-efl/efl/elementary_1.6.99-beta.bb           | 12 ------------
 meta-efl/recipes-efl/efl/elementary_1.7.0.bb                 | 10 ++++++++++
 meta-efl/recipes-efl/efl/embryo_1.6.99-beta.bb               | 12 ------------
 meta-efl/recipes-efl/efl/embryo_1.7.0.bb                     | 10 ++++++++++
 meta-efl/recipes-efl/efl/emotion_1.6.99-beta.bb              | 12 ------------
 meta-efl/recipes-efl/efl/emotion_1.7.0.bb                    | 10 ++++++++++
 meta-efl/recipes-efl/efl/ethumb_1.6.99-beta.bb               | 12 ------------
 meta-efl/recipes-efl/efl/ethumb_1.7.0.bb                     | 10 ++++++++++
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.6.99-beta.bb | 12 ------------
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.0.bb       | 10 ++++++++++
 meta-efl/recipes-efl/efl/evas_1.6.99-beta.bb                 | 12 ------------
 meta-efl/recipes-efl/efl/evas_1.7.0.bb                       | 10 ++++++++++
 meta-efl/recipes-efl/efl/expedite_1.6.99-beta.bb             | 12 ------------
 meta-efl/recipes-efl/efl/expedite_1.7.0.bb                   | 10 ++++++++++
 29 files changed, 142 insertions(+), 172 deletions(-)
 rename meta-efl/recipes-efl/efl/{ecore_1.6.99-beta.bb => ecore_1.7.0.bb} (46%)
 delete mode 100644 meta-efl/recipes-efl/efl/edbus_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/edbus_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edje_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/edje_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eet_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/eet_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eeze_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/eeze_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/efreet_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eina_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/eina_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eio_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/eio_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/embryo_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas_1.7.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/expedite_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.0.bb

diff --git a/meta-efl/recipes-efl/efl/ecore_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/ecore_1.7.0.bb
similarity index 46%
rename from meta-efl/recipes-efl/efl/ecore_1.6.99-beta.bb
rename to meta-efl/recipes-efl/efl/ecore_1.7.0.bb
index 084b008..173c3c3 100644
--- a/meta-efl/recipes-efl/efl/ecore_1.6.99-beta.bb
+++ b/meta-efl/recipes-efl/efl/ecore_1.7.0.bb
@@ -2,12 +2,10 @@ require ${BPN}.inc
 
 PR = "${INC_PR}.0"
 
-SRCVER = "1.7.0-beta"
-
 SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
   file://fix-ecore-fb-initialization.patch \
 "
 
-SRC_URI[md5sum] = "12360540b2b8d46022cbf228c3bdef07"
-SRC_URI[sha256sum] = "e3683d4b9be01347c564065bed36a77c6f42db56be7ea3cb6029a3b532afa1cb"
+SRC_URI[md5sum] = "cf0b5e980a77dc0d1bdedf2bcc60e862"
+SRC_URI[sha256sum] = "f009e17376b7f3fb6ce6b45648d2a0131a152943b502fa34cc4bd018f67da8bb"
diff --git a/meta-efl/recipes-efl/efl/edbus_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/edbus_1.6.99-beta.bb
deleted file mode 100644
index c070549..0000000
--- a/meta-efl/recipes-efl/efl/edbus_1.6.99-beta.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRCVER = "1.7.0-beta"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "542a8931b85675e497df0c290103ca87"
-SRC_URI[sha256sum] = "e63fe9c67d3ec5b6bed06a4c49f70fbb93e30481f36f35ca2ee9810cbaf85868"
diff --git a/meta-efl/recipes-efl/efl/edbus_1.7.0.bb b/meta-efl/recipes-efl/efl/edbus_1.7.0.bb
new file mode 100644
index 0000000..bc24e2f
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/edbus_1.7.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "3d59bfb00763a61976a976be925e1cbf"
+SRC_URI[sha256sum] = "6ee303bd0e2f91a6be08433df474377494ba6815441e5e6b79a5d284ead2a768"
diff --git a/meta-efl/recipes-efl/efl/edje_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/edje_1.6.99-beta.bb
deleted file mode 100644
index eaccde9..0000000
--- a/meta-efl/recipes-efl/efl/edje_1.6.99-beta.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRCVER = "1.7.0-beta"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "07c1bdb6766391fa972e2f1a4c480413"
-SRC_URI[sha256sum] = "7bbad4db88e82a6e0206942c859d4bbbba261cbaa4530f343664538456eef7c9"
diff --git a/meta-efl/recipes-efl/efl/edje_1.7.0.bb b/meta-efl/recipes-efl/efl/edje_1.7.0.bb
new file mode 100644
index 0000000..8eb59e4
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/edje_1.7.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "37e15c5d6e7c2676728bda75109b2218"
+SRC_URI[sha256sum] = "d6df9a7bf11c4605f55a2e7c209210044f8dc4f3332135f6256676d2f937621b"
diff --git a/meta-efl/recipes-efl/efl/eet_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/eet_1.6.99-beta.bb
deleted file mode 100644
index 7c5a655..0000000
--- a/meta-efl/recipes-efl/efl/eet_1.6.99-beta.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRCVER = "1.7.0-beta"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "1103a2a0e5022c42dcb4ccacc5db8881"
-SRC_URI[sha256sum] = "156aa6ef6880cf45b25c6cb45bf659ebb2e9bb207c11a479f504cd795c030c6b"
diff --git a/meta-efl/recipes-efl/efl/eet_1.7.0.bb b/meta-efl/recipes-efl/efl/eet_1.7.0.bb
new file mode 100644
index 0000000..f617090
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eet_1.7.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "46e989eb4dddd942b4564299e19d9f64"
+SRC_URI[sha256sum] = "9bca5becaaa5abf4b7ac0f80de68d3b9a8f1abce7eca4175e1ad82953783d209"
diff --git a/meta-efl/recipes-efl/efl/eeze_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/eeze_1.6.99-beta.bb
deleted file mode 100644
index 446503e..0000000
--- a/meta-efl/recipes-efl/efl/eeze_1.6.99-beta.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRCVER = "1.7.0-beta"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "b557e2e6c5988abf0695474b5763520b"
-SRC_URI[sha256sum] = "b9c1262bc8e45b83c7b3643f9aefcebc88518953e4d4967ca655f1b325aac6ea"
diff --git a/meta-efl/recipes-efl/efl/eeze_1.7.0.bb b/meta-efl/recipes-efl/efl/eeze_1.7.0.bb
new file mode 100644
index 0000000..e7b7727
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eeze_1.7.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "60a8bb62e3d2cc7dfac14f1cd62343e2"
+SRC_URI[sha256sum] = "7db8709445114d1fe1c3609cf79a06e13a3d584a5a3dfd557642ddc65ac3a202"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/efreet_1.6.99-beta.bb
deleted file mode 100644
index 330de4e..0000000
--- a/meta-efl/recipes-efl/efl/efreet_1.6.99-beta.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRCVER = "1.7.0-beta"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "35f4475b81da6b9bf9b3c022fd0947ab"
-SRC_URI[sha256sum] = "b24ee9d2624804b3828b6458eddaf3e74c3d2deac58e15e33e6b183d60989a75"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.7.0.bb b/meta-efl/recipes-efl/efl/efreet_1.7.0.bb
new file mode 100644
index 0000000..baf8245
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/efreet_1.7.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "f039197e14288ecef94eeab040cbbdb4"
+SRC_URI[sha256sum] = "16a41a03d55febf30f2dd786b51be3e370fc563f3335dd26832e0eaa88516c79"
diff --git a/meta-efl/recipes-efl/efl/eina_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/eina_1.6.99-beta.bb
deleted file mode 100644
index 1a3632c..0000000
--- a/meta-efl/recipes-efl/efl/eina_1.6.99-beta.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRCVER = "1.7.0-beta"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "f5e123fdb6fb905c69f2f1f54bfe6257"
-SRC_URI[sha256sum] = "051ebf7c4534c4d12f1aaaac7aa91cd877a2498e4c22336db8b07433c27f18c4"
diff --git a/meta-efl/recipes-efl/efl/eina_1.7.0.bb b/meta-efl/recipes-efl/efl/eina_1.7.0.bb
new file mode 100644
index 0000000..5313b34
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eina_1.7.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "303b81bbfff684eef0e5be70ba977012"
+SRC_URI[sha256sum] = "6aacededb08aa1090a1beecbf62acf3e2ce0676ac87d21c787c07983f801166f"
diff --git a/meta-efl/recipes-efl/efl/eio_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/eio_1.6.99-beta.bb
deleted file mode 100644
index 0161318..0000000
--- a/meta-efl/recipes-efl/efl/eio_1.6.99-beta.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRCVER = "1.7.0-beta"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "5346403eca950b6f8f1c886451e75ab8"
-SRC_URI[sha256sum] = "2cc78170277654e57cc69b49856da3c8ede425f4c8fdf4df702f46184806ac3f"
diff --git a/meta-efl/recipes-efl/efl/eio_1.7.0.bb b/meta-efl/recipes-efl/efl/eio_1.7.0.bb
new file mode 100644
index 0000000..59fe18a
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eio_1.7.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "02e734ade8de360ef85835c5f5a1f2fa"
+SRC_URI[sha256sum] = "c55ae0a8c303873b85b3b538662e85748154ea0434867291d481ac983c8d962c"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/elementary_1.6.99-beta.bb
deleted file mode 100644
index c0ba6fa..0000000
--- a/meta-efl/recipes-efl/efl/elementary_1.6.99-beta.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRCVER = "1.7.0-beta"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "cd0bbf6e93e521b0416d91e521bf81fd"
-SRC_URI[sha256sum] = "f52ef395c341eaf68f844c038ce25512869ebd22f9abc86c9d32f1cf5e91c1df"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.7.0.bb b/meta-efl/recipes-efl/efl/elementary_1.7.0.bb
new file mode 100644
index 0000000..006590f
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elementary_1.7.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "45263c5d107981a44d28734c82e9fae1"
+SRC_URI[sha256sum] = "7e7deeb4e3a9bbb9c7b7a89c2efbe269a1a6a44ef380bf91c1066d128163e2d3"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/embryo_1.6.99-beta.bb
deleted file mode 100644
index f9391bd..0000000
--- a/meta-efl/recipes-efl/efl/embryo_1.6.99-beta.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRCVER = "1.7.0-beta"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "2236f174981c94c4ad22c8e488d2187e"
-SRC_URI[sha256sum] = "fe5339132ec514070af52243954bcb20408a12adfbe07d67d1c338fa3b1dc154"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.7.0.bb b/meta-efl/recipes-efl/efl/embryo_1.7.0.bb
new file mode 100644
index 0000000..5e95cb1
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/embryo_1.7.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "f46bb8ab1699cd7acb8463e50a3ffb4b"
+SRC_URI[sha256sum] = "290b452e6cb87f64b11b529c7f67c40192f87a73cc4c5be93a95f17b76f65063"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/emotion_1.6.99-beta.bb
deleted file mode 100644
index 4ad0690..0000000
--- a/meta-efl/recipes-efl/efl/emotion_1.6.99-beta.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRCVER = "1.7.0-beta"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "7b8719248d5745683201bbf11b8d510f"
-SRC_URI[sha256sum] = "f802272d9a7a4678aef736ca24ef1818dbd9f8524c963da6c5680abdf71d05e4"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.7.0.bb b/meta-efl/recipes-efl/efl/emotion_1.7.0.bb
new file mode 100644
index 0000000..dc0908b
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/emotion_1.7.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "757f46039cd301d10ba2b9a637e9b2e1"
+SRC_URI[sha256sum] = "6e35baa399135dacd41d5cad21cb23338e6331e926107c3e7bdc33b0da18c22b"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/ethumb_1.6.99-beta.bb
deleted file mode 100644
index 0da0fb7..0000000
--- a/meta-efl/recipes-efl/efl/ethumb_1.6.99-beta.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRCVER = "1.7.0-beta"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "37ec5542731ad088c495e0ee6d7889c8"
-SRC_URI[sha256sum] = "66bf53cee15549c4089307843f27a6a7e0c3bf7e576ab5091950ecc05009644a"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.7.0.bb b/meta-efl/recipes-efl/efl/ethumb_1.7.0.bb
new file mode 100644
index 0000000..34a3485
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/ethumb_1.7.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "992a6ecd1345a218e23943ed9af8e030"
+SRC_URI[sha256sum] = "c9b4348a58d28030bba825498246f533211329ad32a3411c02757a78264306ab"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.6.99-beta.bb
deleted file mode 100644
index 00956a8..0000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.6.99-beta.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRCVER = "1.7.0-beta"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "f4353d2743d255cf30cd7b6f946087e3"
-SRC_URI[sha256sum] = "3dcc04689f89048ce1147698370dd51b854182b70c20704901ee1b3f03d4bd2a"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.0.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.0.bb
new file mode 100644
index 0000000..8305c2e
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "ca0278ccbf753de78d5847f8665ffcc1"
+SRC_URI[sha256sum] = "0356212b4f64ddc2397d6fb67195bd937248cd82f7f80b248e58d1e709289c8d"
diff --git a/meta-efl/recipes-efl/efl/evas_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/evas_1.6.99-beta.bb
deleted file mode 100644
index c761852..0000000
--- a/meta-efl/recipes-efl/efl/evas_1.6.99-beta.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRCVER = "1.7.0-beta"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "0978e24b5ea5a0d0b5eb79a7f6d7d1af"
-SRC_URI[sha256sum] = "5bd52116499a5686023a563ed9102e815292786dff19d617d3cc92829c624caf"
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.0.bb b/meta-efl/recipes-efl/efl/evas_1.7.0.bb
new file mode 100644
index 0000000..9f81d89
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas_1.7.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "3359918f8e60c778b861cf1cde02d3a9"
+SRC_URI[sha256sum] = "2d7a33d02d2da37647e4c0127fedebe00eeea14560d6c1b6ca9b0cccdae0de84"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/expedite_1.6.99-beta.bb
deleted file mode 100644
index ffe6546..0000000
--- a/meta-efl/recipes-efl/efl/expedite_1.6.99-beta.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRCVER = "1.7.0-alpha"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "fdd425395b8380b5c3b39186f9ef7ff3"
-SRC_URI[sha256sum] = "738eed02cefa2c57cb7ac0fc8103d1680b6d3a4a17d620dd5fc503b0128bf1a5"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.7.0.bb b/meta-efl/recipes-efl/efl/expedite_1.7.0.bb
new file mode 100644
index 0000000..0ef71ff
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/expedite_1.7.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "4ccd99ad21e25bd651c8ca7a2d20f7f3"
+SRC_URI[sha256sum] = "b4f7d101e957d69b14d1c9207df8d2c9aafcc4a8a0ddea7883c393ef4389249f"
-- 
1.7.12



