Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3N70-0000Bs-O2
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 10:13:26 +0200
Received: by wgbds1 with SMTP id ds1so2911475wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 01:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=aJW1CulSkRqmKODu43jq1zu4QR2ZcY8a69XRJEl+XcE=;
	b=fDedbqyhqXFHX52GztBcd9BLnMyHg2G6UYqOAfc8tdThflOQvIO8u6w+xbOxVonhFh
	R0KeLGL+l/OS1Tkk+JpWXldynIt7A5W0ChAAlfg7rRveIp54baK7yD1jFSizoGFPWvzJ
	tg8FEJVAgPh8ftPigEfLKNAgDfCqRXYmU80sWlN7hrdfaLlnUHlZlZhAd9POFkG7+Kfm
	lv222puxTgY0OzJFgD7DjoPAMD5d6zKaDFVvZ+kwpFCE8Qa+hGqUFz+aYuQklfRUT6Pq
	EpJ7jGonyeR72pCoaLWaIFAhKjByN6LUHqLAIoBD0BvKgKaRQfJO+WG7yjyxT1ciEGK7
	Y/Bw==
Received: by 10.180.78.4 with SMTP id x4mr25690630wiw.19.1345449684780;
	Mon, 20 Aug 2012 01:01:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k2sm39802668wiz.7.2012.08.20.01.01.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 01:01:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 10:00:53 +0200
Message-Id: <7808cc020723c3f7fd715f579d5379224fbdecac.1345449578.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <7c28fa0c71de1b487d05695b8401333140bc76b5.1345449578.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
	<7c28fa0c71de1b487d05695b8401333140bc76b5.1345449578.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1345449578.git.Martin.Jansa@gmail.com>
References: <cover.1345449578.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 50/52] recipes-efl: upgrade to 1.6.99-beta
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
X-List-Received-Date: Mon, 20 Aug 2012 08:13:26 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ite_1.6.99-alpha.bb => expedite_1.6.99-beta.bb} |    0
 ...{ecore_1.6.99-alpha.bb => ecore_1.6.99-beta.bb} |    6 +++---
 meta-efl/recipes-efl/efl/edbus_1.6.99-alpha.bb     |   12 ------------
 meta-efl/recipes-efl/efl/edbus_1.6.99-beta.bb      |   12 ++++++++++++
 meta-efl/recipes-efl/efl/edje_1.6.99-alpha.bb      |   12 ------------
 meta-efl/recipes-efl/efl/edje_1.6.99-beta.bb       |   12 ++++++++++++
 meta-efl/recipes-efl/efl/eet_1.6.99-alpha.bb       |   12 ------------
 meta-efl/recipes-efl/efl/eet_1.6.99-beta.bb        |   12 ++++++++++++
 meta-efl/recipes-efl/efl/eeze_1.6.99-alpha.bb      |   12 ------------
 meta-efl/recipes-efl/efl/eeze_1.6.99-beta.bb       |   12 ++++++++++++
 meta-efl/recipes-efl/efl/efreet_1.6.99-alpha.bb    |   12 ------------
 meta-efl/recipes-efl/efl/efreet_1.6.99-beta.bb     |   12 ++++++++++++
 meta-efl/recipes-efl/efl/eina_1.6.99-alpha.bb      |   12 ------------
 meta-efl/recipes-efl/efl/eina_1.6.99-beta.bb       |   12 ++++++++++++
 meta-efl/recipes-efl/efl/eio_1.6.99-alpha.bb       |   12 ------------
 meta-efl/recipes-efl/efl/eio_1.6.99-beta.bb        |   12 ++++++++++++
 .../recipes-efl/efl/elementary_1.6.99-alpha.bb     |   12 ------------
 meta-efl/recipes-efl/efl/elementary_1.6.99-beta.bb |   12 ++++++++++++
 meta-efl/recipes-efl/efl/embryo_1.6.99-alpha.bb    |   12 ------------
 meta-efl/recipes-efl/efl/embryo_1.6.99-beta.bb     |   12 ++++++++++++
 meta-efl/recipes-efl/efl/emotion_1.6.99-alpha.bb   |   12 ------------
 meta-efl/recipes-efl/efl/emotion_1.6.99-beta.bb    |   12 ++++++++++++
 meta-efl/recipes-efl/efl/ethumb_1.6.99-alpha.bb    |   12 ------------
 meta-efl/recipes-efl/efl/ethumb_1.6.99-beta.bb     |   12 ++++++++++++
 .../efl/evas-generic-loaders_1.6.99-alpha.bb       |   12 ------------
 .../efl/evas-generic-loaders_1.6.99-beta.bb        |   12 ++++++++++++
 meta-efl/recipes-efl/efl/evas_1.6.99-alpha.bb      |   12 ------------
 meta-efl/recipes-efl/efl/evas_1.6.99-beta.bb       |   12 ++++++++++++
 28 files changed, 159 insertions(+), 159 deletions(-)
 rename meta-efl/recipes-efl/e17/{expedite_1.6.99-alpha.bb => expedite_1.6.99-beta.bb} (100%)
 rename meta-efl/recipes-efl/efl/{ecore_1.6.99-alpha.bb => ecore_1.6.99-beta.bb} (47%)
 delete mode 100644 meta-efl/recipes-efl/efl/edbus_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-efl/efl/edbus_1.6.99-beta.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edje_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-efl/efl/edje_1.6.99-beta.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eet_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-efl/efl/eet_1.6.99-beta.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eeze_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-efl/efl/eeze_1.6.99-beta.bb
 delete mode 100644 meta-efl/recipes-efl/efl/efreet_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-efl/efl/efreet_1.6.99-beta.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eina_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-efl/efl/eina_1.6.99-beta.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eio_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-efl/efl/eio_1.6.99-beta.bb
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.6.99-beta.bb
 delete mode 100644 meta-efl/recipes-efl/efl/embryo_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-efl/efl/embryo_1.6.99-beta.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion_1.6.99-beta.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-efl/efl/ethumb_1.6.99-beta.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.6.99-beta.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas_1.6.99-alpha.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas_1.6.99-beta.bb

diff --git a/meta-efl/recipes-efl/e17/expedite_1.6.99-alpha.bb b/meta-efl/recipes-efl/e17/expedite_1.6.99-beta.bb
similarity index 100%
rename from meta-efl/recipes-efl/e17/expedite_1.6.99-alpha.bb
rename to meta-efl/recipes-efl/e17/expedite_1.6.99-beta.bb
diff --git a/meta-efl/recipes-efl/efl/ecore_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/ecore_1.6.99-beta.bb
similarity index 47%
rename from meta-efl/recipes-efl/efl/ecore_1.6.99-alpha.bb
rename to meta-efl/recipes-efl/efl/ecore_1.6.99-beta.bb
index 33e3976..084b008 100644
--- a/meta-efl/recipes-efl/efl/ecore_1.6.99-alpha.bb
+++ b/meta-efl/recipes-efl/efl/ecore_1.6.99-beta.bb
@@ -2,12 +2,12 @@ require ${BPN}.inc
 
 PR = "${INC_PR}.0"
 
-SRCVER = "1.7.0-alpha"
+SRCVER = "1.7.0-beta"
 
 SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
   file://fix-ecore-fb-initialization.patch \
 "
 
-SRC_URI[md5sum] = "c40c25f2638677191bb95a628743209d"
-SRC_URI[sha256sum] = "8742fdcb725ac1494650577f75bbd36d3bf42d8d5c1f8d96a9d541f310a46c44"
+SRC_URI[md5sum] = "12360540b2b8d46022cbf228c3bdef07"
+SRC_URI[sha256sum] = "e3683d4b9be01347c564065bed36a77c6f42db56be7ea3cb6029a3b532afa1cb"
diff --git a/meta-efl/recipes-efl/efl/edbus_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/edbus_1.6.99-alpha.bb
deleted file mode 100644
index 7b56e12..0000000
--- a/meta-efl/recipes-efl/efl/edbus_1.6.99-alpha.bb
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
-SRC_URI[md5sum] = "6833e32681db6630a4a50d98cf5cac88"
-SRC_URI[sha256sum] = "8810a40568df9c068c1606821f24a95fb409e0f99459a45b18ee07077f432cc2"
diff --git a/meta-efl/recipes-efl/efl/edbus_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/edbus_1.6.99-beta.bb
new file mode 100644
index 0000000..c070549
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/edbus_1.6.99-beta.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-beta"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "542a8931b85675e497df0c290103ca87"
+SRC_URI[sha256sum] = "e63fe9c67d3ec5b6bed06a4c49f70fbb93e30481f36f35ca2ee9810cbaf85868"
diff --git a/meta-efl/recipes-efl/efl/edje_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/edje_1.6.99-alpha.bb
deleted file mode 100644
index 1ba83c0..0000000
--- a/meta-efl/recipes-efl/efl/edje_1.6.99-alpha.bb
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
-SRC_URI[md5sum] = "b4c063f673394bda3f24b1a894001224"
-SRC_URI[sha256sum] = "4b8aeb5e59b493e9cfce30c91acf9b55f4774b417349c8291fda6e35265ee311"
diff --git a/meta-efl/recipes-efl/efl/edje_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/edje_1.6.99-beta.bb
new file mode 100644
index 0000000..eaccde9
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/edje_1.6.99-beta.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-beta"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "07c1bdb6766391fa972e2f1a4c480413"
+SRC_URI[sha256sum] = "7bbad4db88e82a6e0206942c859d4bbbba261cbaa4530f343664538456eef7c9"
diff --git a/meta-efl/recipes-efl/efl/eet_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/eet_1.6.99-alpha.bb
deleted file mode 100644
index 39663f9..0000000
--- a/meta-efl/recipes-efl/efl/eet_1.6.99-alpha.bb
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
-SRC_URI[md5sum] = "06a65f37117607ba24e4f4a9d3420f0a"
-SRC_URI[sha256sum] = "29b6717404131b30882ae5f7947f5705da972f07576ad4c6c6c378a7592b5f68"
diff --git a/meta-efl/recipes-efl/efl/eet_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/eet_1.6.99-beta.bb
new file mode 100644
index 0000000..7c5a655
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eet_1.6.99-beta.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-beta"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "1103a2a0e5022c42dcb4ccacc5db8881"
+SRC_URI[sha256sum] = "156aa6ef6880cf45b25c6cb45bf659ebb2e9bb207c11a479f504cd795c030c6b"
diff --git a/meta-efl/recipes-efl/efl/eeze_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/eeze_1.6.99-alpha.bb
deleted file mode 100644
index 4f8ecb4..0000000
--- a/meta-efl/recipes-efl/efl/eeze_1.6.99-alpha.bb
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
-SRC_URI[md5sum] = "25c36ea710d61b2f6a732ec44f9f5dbb"
-SRC_URI[sha256sum] = "3440e11e9edbe234d207a8791a6c6502968ce642bd8d4821da77be71c11bd432"
diff --git a/meta-efl/recipes-efl/efl/eeze_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/eeze_1.6.99-beta.bb
new file mode 100644
index 0000000..446503e
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eeze_1.6.99-beta.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-beta"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "b557e2e6c5988abf0695474b5763520b"
+SRC_URI[sha256sum] = "b9c1262bc8e45b83c7b3643f9aefcebc88518953e4d4967ca655f1b325aac6ea"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/efreet_1.6.99-alpha.bb
deleted file mode 100644
index afe123a..0000000
--- a/meta-efl/recipes-efl/efl/efreet_1.6.99-alpha.bb
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
-SRC_URI[md5sum] = "d18062fb8831334323b00123fe93ac5b"
-SRC_URI[sha256sum] = "28372b8b3c064fc0f6c50964d1199aee28b06102d796c1546de7c7bf8d41b97c"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/efreet_1.6.99-beta.bb
new file mode 100644
index 0000000..330de4e
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/efreet_1.6.99-beta.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-beta"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "35f4475b81da6b9bf9b3c022fd0947ab"
+SRC_URI[sha256sum] = "b24ee9d2624804b3828b6458eddaf3e74c3d2deac58e15e33e6b183d60989a75"
diff --git a/meta-efl/recipes-efl/efl/eina_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/eina_1.6.99-alpha.bb
deleted file mode 100644
index ba7bab3..0000000
--- a/meta-efl/recipes-efl/efl/eina_1.6.99-alpha.bb
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
-SRC_URI[md5sum] = "b4fdbb79b92496829b921d46762344ac"
-SRC_URI[sha256sum] = "51a7799ba61036072be646e1fcaa742d9c5f39bb499155012bc177a9f561f2b5"
diff --git a/meta-efl/recipes-efl/efl/eina_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/eina_1.6.99-beta.bb
new file mode 100644
index 0000000..1a3632c
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eina_1.6.99-beta.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-beta"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "f5e123fdb6fb905c69f2f1f54bfe6257"
+SRC_URI[sha256sum] = "051ebf7c4534c4d12f1aaaac7aa91cd877a2498e4c22336db8b07433c27f18c4"
diff --git a/meta-efl/recipes-efl/efl/eio_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/eio_1.6.99-alpha.bb
deleted file mode 100644
index f4de7af..0000000
--- a/meta-efl/recipes-efl/efl/eio_1.6.99-alpha.bb
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
-SRC_URI[md5sum] = "741d2a2211a66cba0986b1dbcc12118f"
-SRC_URI[sha256sum] = "1d3cbbc48b0970a8b7327d1d74ca44bc0a6f5852e26d348bc9793421675ca23f"
diff --git a/meta-efl/recipes-efl/efl/eio_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/eio_1.6.99-beta.bb
new file mode 100644
index 0000000..0161318
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eio_1.6.99-beta.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-beta"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "5346403eca950b6f8f1c886451e75ab8"
+SRC_URI[sha256sum] = "2cc78170277654e57cc69b49856da3c8ede425f4c8fdf4df702f46184806ac3f"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/elementary_1.6.99-alpha.bb
deleted file mode 100644
index 2351360..0000000
--- a/meta-efl/recipes-efl/efl/elementary_1.6.99-alpha.bb
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
-SRC_URI[md5sum] = "7509fb6bc2d814066deed3d97c2d0118"
-SRC_URI[sha256sum] = "a262b9723f4491e4fbb43b285d7845a6dc8daab53d97e68cd8b0df69737ff69e"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/elementary_1.6.99-beta.bb
new file mode 100644
index 0000000..c0ba6fa
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elementary_1.6.99-beta.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-beta"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "cd0bbf6e93e521b0416d91e521bf81fd"
+SRC_URI[sha256sum] = "f52ef395c341eaf68f844c038ce25512869ebd22f9abc86c9d32f1cf5e91c1df"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/embryo_1.6.99-alpha.bb
deleted file mode 100644
index 8cd4f8c..0000000
--- a/meta-efl/recipes-efl/efl/embryo_1.6.99-alpha.bb
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
-SRC_URI[md5sum] = "1505a60e8e446d55ab1887f3832063f2"
-SRC_URI[sha256sum] = "6b6999e29836c56f079f84617133cc9b8d9bb1ea826577eebdc29f7ebeb6ffe5"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/embryo_1.6.99-beta.bb
new file mode 100644
index 0000000..f9391bd
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/embryo_1.6.99-beta.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-beta"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "2236f174981c94c4ad22c8e488d2187e"
+SRC_URI[sha256sum] = "fe5339132ec514070af52243954bcb20408a12adfbe07d67d1c338fa3b1dc154"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/emotion_1.6.99-alpha.bb
deleted file mode 100644
index d5f9412..0000000
--- a/meta-efl/recipes-efl/efl/emotion_1.6.99-alpha.bb
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
-SRC_URI[md5sum] = "55bea7e3c3e5d503a98f336d829b47bb"
-SRC_URI[sha256sum] = "b54e9ea93c248885b56e5b6dbf8161bf9cd04103dcd06d72eb2579d83a48ad7f"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/emotion_1.6.99-beta.bb
new file mode 100644
index 0000000..4ad0690
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/emotion_1.6.99-beta.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-beta"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "7b8719248d5745683201bbf11b8d510f"
+SRC_URI[sha256sum] = "f802272d9a7a4678aef736ca24ef1818dbd9f8524c963da6c5680abdf71d05e4"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/ethumb_1.6.99-alpha.bb
deleted file mode 100644
index 69f8e33..0000000
--- a/meta-efl/recipes-efl/efl/ethumb_1.6.99-alpha.bb
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
-SRC_URI[md5sum] = "356b996537136c6504daf1358509e5a8"
-SRC_URI[sha256sum] = "1bdeff24945f67c5685bd526a2ba7a951a97fe3aff8aea2f6efc9cf8503c431b"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/ethumb_1.6.99-beta.bb
new file mode 100644
index 0000000..0da0fb7
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/ethumb_1.6.99-beta.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-beta"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "37ec5542731ad088c495e0ee6d7889c8"
+SRC_URI[sha256sum] = "66bf53cee15549c4089307843f27a6a7e0c3bf7e576ab5091950ecc05009644a"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.6.99-alpha.bb
deleted file mode 100644
index 5ac0b94..0000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.6.99-alpha.bb
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
-SRC_URI[md5sum] = "e8444bb1ddebd337a8d0bd8a14d83951"
-SRC_URI[sha256sum] = "84f1d1e3b8a232c849f91ff70e2b5ad2154a5c2e9904469b3b1ec5b41dd700c7"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.6.99-beta.bb
new file mode 100644
index 0000000..00956a8
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.6.99-beta.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-beta"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "f4353d2743d255cf30cd7b6f946087e3"
+SRC_URI[sha256sum] = "3dcc04689f89048ce1147698370dd51b854182b70c20704901ee1b3f03d4bd2a"
diff --git a/meta-efl/recipes-efl/efl/evas_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/evas_1.6.99-alpha.bb
deleted file mode 100644
index df777f5..0000000
--- a/meta-efl/recipes-efl/efl/evas_1.6.99-alpha.bb
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
-SRC_URI[md5sum] = "3f4f1f87fa16dd4db121ce9c2e056131"
-SRC_URI[sha256sum] = "25a905c90650e8d53a2b0cf90ef453dc7410f0143fd2fe1c11f5ccd50e107f70"
diff --git a/meta-efl/recipes-efl/efl/evas_1.6.99-beta.bb b/meta-efl/recipes-efl/efl/evas_1.6.99-beta.bb
new file mode 100644
index 0000000..c761852
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas_1.6.99-beta.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-beta"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "0978e24b5ea5a0d0b5eb79a7f6d7d1af"
+SRC_URI[sha256sum] = "5bd52116499a5686023a563ed9102e815292786dff19d617d3cc92829c624caf"
-- 
1.7.8.6



