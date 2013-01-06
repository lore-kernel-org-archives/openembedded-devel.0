Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Trn1y-0006bW-B6
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 11:00:39 +0100
Received: by mail-ee0-f45.google.com with SMTP id d49so8602097eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=kE2bscykRhvURHiTWY5t32H9x2ZFhygSoOkAPiJaJuk=;
	b=wVkx9BRvna02I9rZImrGtK8mHR3Paa09zK9W1cWN8iKNOTo34+F1GkP1mHciEyjnQa
	xcsKJeFA72WIEwXvs5DYiXdbnteDvOCg55qvLTC/KL8ujl0847Kmi5gjxhdbh7CnTXkW
	2HqAPpazLwsGmRS7zj3A1pinObYQCqcnJDImSz9Ycmp/WW7kyklO9ifDBmP/7qqn5YoT
	Gq0yY4Rvf/Lp4TbgVi5LkHLFpduQKvUjVaMPtvcYll1V9L7+3zoq3MxLgtuiGjFqQa9o
	cxdTU1I29ujyu7nUYGLo5lOhblifWkmpIaYPces3Op0Lxgh+rPzh7Q4d9oR4rT9FQk1C
	fe0A==
X-Received: by 10.14.223.135 with SMTP id v7mr158985358eep.41.1357465530593;
	Sun, 06 Jan 2013 01:45:30 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id
	f49sm123221439eep.12.2013.01.06.01.45.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:45:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 10:45:21 +0100
Message-Id: <1357465521-30490-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH][meta-oe][meta-efl] meta-efl: upgrade efl to 1.7.5
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
X-List-Received-Date: Sun, 06 Jan 2013 10:00:39 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/ecore_1.7.4.bb                | 11 -----------
 meta-efl/recipes-efl/efl/ecore_1.7.5.bb                | 11 +++++++++++
 meta-efl/recipes-efl/efl/edbus_1.7.4.bb                | 10 ----------
 meta-efl/recipes-efl/efl/edbus_1.7.5.bb                | 10 ++++++++++
 meta-efl/recipes-efl/efl/edje_1.7.4.bb                 | 10 ----------
 meta-efl/recipes-efl/efl/edje_1.7.5.bb                 | 10 ++++++++++
 meta-efl/recipes-efl/efl/eet_1.7.4.bb                  | 10 ----------
 meta-efl/recipes-efl/efl/eet_1.7.5.bb                  | 10 ++++++++++
 meta-efl/recipes-efl/efl/eeze_1.7.4.bb                 | 10 ----------
 meta-efl/recipes-efl/efl/eeze_1.7.5.bb                 | 10 ++++++++++
 meta-efl/recipes-efl/efl/efreet_1.7.4.bb               | 10 ----------
 meta-efl/recipes-efl/efl/efreet_1.7.5.bb               | 10 ++++++++++
 meta-efl/recipes-efl/efl/eina_1.7.4.bb                 | 10 ----------
 meta-efl/recipes-efl/efl/eina_1.7.5.bb                 | 10 ++++++++++
 meta-efl/recipes-efl/efl/eio_1.7.4.bb                  | 10 ----------
 meta-efl/recipes-efl/efl/eio_1.7.5.bb                  | 10 ++++++++++
 meta-efl/recipes-efl/efl/elementary_1.7.4.bb           | 10 ----------
 meta-efl/recipes-efl/efl/elementary_1.7.5.bb           | 10 ++++++++++
 meta-efl/recipes-efl/efl/embryo_1.7.4.bb               | 10 ----------
 meta-efl/recipes-efl/efl/embryo_1.7.5.bb               | 10 ++++++++++
 meta-efl/recipes-efl/efl/emotion_1.7.4.bb              | 10 ----------
 meta-efl/recipes-efl/efl/emotion_1.7.5.bb              | 10 ++++++++++
 meta-efl/recipes-efl/efl/ethumb_1.7.4.bb               | 10 ----------
 meta-efl/recipes-efl/efl/ethumb_1.7.5.bb               | 10 ++++++++++
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.4.bb | 10 ----------
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.5.bb | 10 ++++++++++
 meta-efl/recipes-efl/efl/evas_1.7.4.bb                 | 10 ----------
 meta-efl/recipes-efl/efl/evas_1.7.5.bb                 | 10 ++++++++++
 meta-efl/recipes-efl/efl/expedite_1.7.4.bb             | 10 ----------
 meta-efl/recipes-efl/efl/expedite_1.7.5.bb             | 10 ++++++++++
 30 files changed, 151 insertions(+), 151 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/efl/ecore_1.7.4.bb
 create mode 100644 meta-efl/recipes-efl/efl/ecore_1.7.5.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edbus_1.7.4.bb
 create mode 100644 meta-efl/recipes-efl/efl/edbus_1.7.5.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edje_1.7.4.bb
 create mode 100644 meta-efl/recipes-efl/efl/edje_1.7.5.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eet_1.7.4.bb
 create mode 100644 meta-efl/recipes-efl/efl/eet_1.7.5.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eeze_1.7.4.bb
 create mode 100644 meta-efl/recipes-efl/efl/eeze_1.7.5.bb
 delete mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.4.bb
 create mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.5.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eina_1.7.4.bb
 create mode 100644 meta-efl/recipes-efl/efl/eina_1.7.5.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eio_1.7.4.bb
 create mode 100644 meta-efl/recipes-efl/efl/eio_1.7.5.bb
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.4.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.5.bb
 delete mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.4.bb
 create mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.5.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.4.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.5.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.4.bb
 create mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.5.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.4.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.5.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas_1.7.4.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas_1.7.5.bb
 delete mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.4.bb
 create mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.5.bb

diff --git a/meta-efl/recipes-efl/efl/ecore_1.7.4.bb b/meta-efl/recipes-efl/efl/ecore_1.7.4.bb
deleted file mode 100644
index bc59b2b..0000000
--- a/meta-efl/recipes-efl/efl/ecore_1.7.4.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-  file://fix-ecore-fb-initialization.patch \
-"
-
-SRC_URI[md5sum] = "3b1aa01bffb10d4266545fe4a823bb47"
-SRC_URI[sha256sum] = "2fc1d202c688466b0f33e21c3b892c7610ae5f89835475a1ebdb22c72c0d9116"
diff --git a/meta-efl/recipes-efl/efl/ecore_1.7.5.bb b/meta-efl/recipes-efl/efl/ecore_1.7.5.bb
new file mode 100644
index 0000000..412aad6
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/ecore_1.7.5.bb
@@ -0,0 +1,11 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+  file://fix-ecore-fb-initialization.patch \
+"
+
+SRC_URI[md5sum] = "96f85bcb720db2c723bf296b4d5d0bb6"
+SRC_URI[sha256sum] = "71618e58564b19705f9d02cf69d0459400e15d6b2a55baf53784c5dc5ec89c42"
diff --git a/meta-efl/recipes-efl/efl/edbus_1.7.4.bb b/meta-efl/recipes-efl/efl/edbus_1.7.4.bb
deleted file mode 100644
index 6ba64be..0000000
--- a/meta-efl/recipes-efl/efl/edbus_1.7.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "eaae06263de72944c0e818205c555b8b"
-SRC_URI[sha256sum] = "17a63299957f80c2f9d13945dab2b28933f3eda7a7a2c0fff17dcc6cc5dc83a4"
diff --git a/meta-efl/recipes-efl/efl/edbus_1.7.5.bb b/meta-efl/recipes-efl/efl/edbus_1.7.5.bb
new file mode 100644
index 0000000..f3cbfa5
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/edbus_1.7.5.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "e523232dee5c88cda21ec2a3495d7f18"
+SRC_URI[sha256sum] = "b5c67b0bcadadd59d5611652260b97af57b6b5a6890ebca1839d953dff22c862"
diff --git a/meta-efl/recipes-efl/efl/edje_1.7.4.bb b/meta-efl/recipes-efl/efl/edje_1.7.4.bb
deleted file mode 100644
index a6ec0be..0000000
--- a/meta-efl/recipes-efl/efl/edje_1.7.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "fcd3749e41041854503b578e690cc672"
-SRC_URI[sha256sum] = "7b81f512bd7cabfbe787d2bfd2d6c622c9ce151684ee57017c1bb1616f5d0e51"
diff --git a/meta-efl/recipes-efl/efl/edje_1.7.5.bb b/meta-efl/recipes-efl/efl/edje_1.7.5.bb
new file mode 100644
index 0000000..00a9b3c
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/edje_1.7.5.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "66f424e80b11a28e86de4b2b9828591d"
+SRC_URI[sha256sum] = "66c871a877ead4131fea82bab60018ef721b911df3208961eb967d45342bf23a"
diff --git a/meta-efl/recipes-efl/efl/eet_1.7.4.bb b/meta-efl/recipes-efl/efl/eet_1.7.4.bb
deleted file mode 100644
index 2872af7..0000000
--- a/meta-efl/recipes-efl/efl/eet_1.7.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "e7d68ed52d1eafa0998e74fab9c22e97"
-SRC_URI[sha256sum] = "60f0cdc627806256e81c685080b97a10f348a53f9198360ff1c67ca0547ed806"
diff --git a/meta-efl/recipes-efl/efl/eet_1.7.5.bb b/meta-efl/recipes-efl/efl/eet_1.7.5.bb
new file mode 100644
index 0000000..743dc01
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eet_1.7.5.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "c62ba7a771d16df9afe6e5869370e082"
+SRC_URI[sha256sum] = "2012a49b1acea2cd33d0cd8086615ceb4f881f868817bfdef88d3a0a837a1e0b"
diff --git a/meta-efl/recipes-efl/efl/eeze_1.7.4.bb b/meta-efl/recipes-efl/efl/eeze_1.7.4.bb
deleted file mode 100644
index aea04cb..0000000
--- a/meta-efl/recipes-efl/efl/eeze_1.7.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "3728318ac1a90980a608e4a1780d5d98"
-SRC_URI[sha256sum] = "a70d2a3404c08a85a733111a90fae2fa7a3411478907963ade7f0f10216bb51c"
diff --git a/meta-efl/recipes-efl/efl/eeze_1.7.5.bb b/meta-efl/recipes-efl/efl/eeze_1.7.5.bb
new file mode 100644
index 0000000..450c8a3
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eeze_1.7.5.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "698c1b09d4f380ac581a6100f5b88548"
+SRC_URI[sha256sum] = "3bd2796f11f33c2b0a2078694b2e4805b44d03f971f1e78c8da99944ae7e7af0"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.7.4.bb b/meta-efl/recipes-efl/efl/efreet_1.7.4.bb
deleted file mode 100644
index ee6b736..0000000
--- a/meta-efl/recipes-efl/efl/efreet_1.7.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "439cb27888cc1e6bf6ec5bd23512df7e"
-SRC_URI[sha256sum] = "30c757294d662ef618227fb7fb02a0f73a781f0d31bcb393970b6c7a931729e0"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.7.5.bb b/meta-efl/recipes-efl/efl/efreet_1.7.5.bb
new file mode 100644
index 0000000..c035ae6
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/efreet_1.7.5.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "2df171ff22e88fda47bc916665b903ce"
+SRC_URI[sha256sum] = "1aa48f7ae2f367e8c9cd8407d6a55b941b54df78e629163b7a4dab2d423f49bc"
diff --git a/meta-efl/recipes-efl/efl/eina_1.7.4.bb b/meta-efl/recipes-efl/efl/eina_1.7.4.bb
deleted file mode 100644
index f4fb76b..0000000
--- a/meta-efl/recipes-efl/efl/eina_1.7.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "e5f60ff5a227abd6121c6749000aa0f7"
-SRC_URI[sha256sum] = "baff603d614da0b52d505544f18c670e7dfd700e0c1df5ea56284ba3d737c7ee"
diff --git a/meta-efl/recipes-efl/efl/eina_1.7.5.bb b/meta-efl/recipes-efl/efl/eina_1.7.5.bb
new file mode 100644
index 0000000..7ec62a5
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eina_1.7.5.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "ca45a53ec219c8a16631a20dc0f782cf"
+SRC_URI[sha256sum] = "294f2ee7c63a03ad84072d7f5b1aa7bc974afbb95e30748387bd812e20dc1952"
diff --git a/meta-efl/recipes-efl/efl/eio_1.7.4.bb b/meta-efl/recipes-efl/efl/eio_1.7.4.bb
deleted file mode 100644
index 4e36a32..0000000
--- a/meta-efl/recipes-efl/efl/eio_1.7.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "f2e4b4e4c04e83bc9533ef7938b51218"
-SRC_URI[sha256sum] = "5d1233d8bf2ab9d955ab0682b8fa1c15fe5905a543820c3255a16d1c49ec33c1"
diff --git a/meta-efl/recipes-efl/efl/eio_1.7.5.bb b/meta-efl/recipes-efl/efl/eio_1.7.5.bb
new file mode 100644
index 0000000..8bac44e
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eio_1.7.5.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "429c30b99f4011b7b20085f7117a7b93"
+SRC_URI[sha256sum] = "e5b0c72fe9f6ea9db5c3c6966338fe718cf53c4a4b7d9b7a900a20e7341cf05a"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.7.4.bb b/meta-efl/recipes-efl/efl/elementary_1.7.4.bb
deleted file mode 100644
index b81f743..0000000
--- a/meta-efl/recipes-efl/efl/elementary_1.7.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "cf2ca073656ebac36c26df4fa4debdee"
-SRC_URI[sha256sum] = "92ffb1a12883cd7d599e428a28501e4ce411db9839c698bb4095c9a1a470dccb"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.7.5.bb b/meta-efl/recipes-efl/efl/elementary_1.7.5.bb
new file mode 100644
index 0000000..b8de204
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elementary_1.7.5.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "8c81926114f07d328aacb0e34c3830a4"
+SRC_URI[sha256sum] = "2798763a125792f4cd28b01a68799c7d7d113d4df12da60a13954e68108c7566"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.7.4.bb b/meta-efl/recipes-efl/efl/embryo_1.7.4.bb
deleted file mode 100644
index 818ce54..0000000
--- a/meta-efl/recipes-efl/efl/embryo_1.7.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "f4e3350587108bfe9719b496689dccc9"
-SRC_URI[sha256sum] = "300fe9750a2affebc6b3f94356dbc719d01a34054b2c7fc81a49f3e38a7ca975"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.7.5.bb b/meta-efl/recipes-efl/efl/embryo_1.7.5.bb
new file mode 100644
index 0000000..dc3d20b
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/embryo_1.7.5.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "c5d34d35ee38ad7c68b9f477d036c659"
+SRC_URI[sha256sum] = "e6270573104af01bf377755f3cc292a27171a74be7cbe8de889aa3b5e811c279"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.7.4.bb b/meta-efl/recipes-efl/efl/emotion_1.7.4.bb
deleted file mode 100644
index 9e52fa4..0000000
--- a/meta-efl/recipes-efl/efl/emotion_1.7.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "402e1da5f5281607585c860012200b49"
-SRC_URI[sha256sum] = "5af9e0111ff519aa63adba48c91150ae4d6eb5697ec5fd8ad20016a7ed44f1ea"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.7.5.bb b/meta-efl/recipes-efl/efl/emotion_1.7.5.bb
new file mode 100644
index 0000000..76378af
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/emotion_1.7.5.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "bb6a00053b0f72c0c146a59161e4bb0b"
+SRC_URI[sha256sum] = "7d99fdd5c944a4df5ee635a4f4ca774f5887b02689de62fa4dabdf4bf76ec813"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.7.4.bb b/meta-efl/recipes-efl/efl/ethumb_1.7.4.bb
deleted file mode 100644
index 8917e27..0000000
--- a/meta-efl/recipes-efl/efl/ethumb_1.7.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "ca3b3d7263756ab3456e559e36f190a0"
-SRC_URI[sha256sum] = "b3f19f79a3dbcfce25f939eaf4f65b9ab734d32e6af6a008293aee50a16ba53d"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.7.5.bb b/meta-efl/recipes-efl/efl/ethumb_1.7.5.bb
new file mode 100644
index 0000000..acf5fc3
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/ethumb_1.7.5.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "6c9fde046edfed867de790a8cd3a16f9"
+SRC_URI[sha256sum] = "decb90a98ef94b1f52150c5e55e87c736824e24b01316486e9954760daac4cf5"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.4.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.4.bb
deleted file mode 100644
index 7a96210..0000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "2edde882521b30a4cc3ce092a1ef86d0"
-SRC_URI[sha256sum] = "900404a946f7169efe3c21e9960225dd2277e14ac0e75e597160861bd41b632e"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.5.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.5.bb
new file mode 100644
index 0000000..a35e393
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.5.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "8412b682a0445621edd7f23af0a0347e"
+SRC_URI[sha256sum] = "c50005246219668f2d7f0e00f4632c7e20f5eddb73d2de18c66d1a729dc569af"
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.4.bb b/meta-efl/recipes-efl/efl/evas_1.7.4.bb
deleted file mode 100644
index 56faeb3..0000000
--- a/meta-efl/recipes-efl/efl/evas_1.7.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "33a70651fd3d73c3d928b9c5362d5aac"
-SRC_URI[sha256sum] = "a3e19a0bbad3cfafc314c46baa0b5250382809bc04e458bd0c02b5ce68a29da6"
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.5.bb b/meta-efl/recipes-efl/efl/evas_1.7.5.bb
new file mode 100644
index 0000000..38579e3
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas_1.7.5.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "77237b48c4167d30b40b7918eb8e274f"
+SRC_URI[sha256sum] = "a5de7921dadc8ed5726a16aca18fba48b43348556fde5b9454ef9b3468a21c6a"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.7.4.bb b/meta-efl/recipes-efl/efl/expedite_1.7.4.bb
deleted file mode 100644
index 7b2e071..0000000
--- a/meta-efl/recipes-efl/efl/expedite_1.7.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "bf8d20bc35b28ff5696781eac4685681"
-SRC_URI[sha256sum] = "3fdb6d56ac5de4ea40ad00f0d3a2b8dc3018be29f9ddb148ec3cd1ed5006e50a"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.7.5.bb b/meta-efl/recipes-efl/efl/expedite_1.7.5.bb
new file mode 100644
index 0000000..32c91e2
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/expedite_1.7.5.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "a4347a00dd765bee8c1562f101f28599"
+SRC_URI[sha256sum] = "6e7d577c2a6589d9d7a8fe10c2d913996be2f3fbc21cc6372880815b1f0e45d6"
-- 
1.8.0.2



