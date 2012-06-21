Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ShcmI-0000Ks-MT
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2012 10:30:10 +0200
Received: by mail-we0-f175.google.com with SMTP id g55so210783wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 01:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=NstZ9U+LZ0p6VNkNUOcF78SOM4DFsrLby3ap9S2YwQs=;
	b=EDvNPjb3RnpxttBqil9TKjP6xIS6+VGYRKGxDaA6rIeRS3BZN58Mxn4gTSZD1q7oMX
	cHJhTcRELj+OSNZm56JwtsiX4cq5V/MD16ee0pgJMKFpNxFnRqHWShjOa05srNsvJAUb
	eZDWYhUBmg6LSTkcHXQ15RSFlhvCpLRfr0TJ6TwWyft1+K7KTj14bw3dFQ9sgez5Szqz
	UJEFND16KQBA05aid3H5A+oUS18BXkNLb0nRKl02c3LfqdI/g7oIrCw6tLAQoiZYjiNL
	YnUYQ6abfHps6bjQ2QtC4J3CiJr7nxposuZm5yYmz4oV2T2m6L5LLEvHoI9IXIo7IJm/
	T5wQ==
Received: by 10.180.98.231 with SMTP id el7mr18044949wib.21.1340266766971;
	Thu, 21 Jun 2012 01:19:26 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ei4sm86049746wid.5.2012.06.21.01.19.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 01:19:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jun 2012 10:18:48 +0200
Message-Id: <af1957441017d4d153c21c980734e70b1f5ed8e7.1340266416.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1340266416.git.Martin.Jansa@gmail.com>
References: <cover.1340266416.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1340266416.git.Martin.Jansa@gmail.com>
References: <cover.1340266416.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 4/5] meta-efl: upgrade recipes for new EFL bugfix release cycle 1.2.1
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
X-List-Received-Date: Thu, 21 Jun 2012 08:30:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../efl/{ecore_1.2.0.bb => ecore_1.2.1.bb}         |    4 ++--
 .../efl/{eio_1.0.0.bb => edje_1.2.1.bb}            |    4 ++--
 .../efl/{edje_1.2.0.bb => eet_1.6.1.bb}            |    4 ++--
 .../efl/{eet_1.6.0.bb => eina_1.2.1.bb}            |    4 ++--
 .../efl/{eina_1.2.0.bb => eio_1.0.1.bb}            |    4 ++--
 meta-efl/recipes-efl/efl/elementary_1.0.0.bb       |   10 ----------
 meta-efl/recipes-efl/efl/elementary_1.0.1.bb       |   10 ++++++++++
 meta-efl/recipes-efl/efl/emotion_1.0.0.bb          |   10 ----------
 meta-efl/recipes-efl/efl/emotion_1.0.1.bb          |   10 ++++++++++
 meta-efl/recipes-efl/efl/ethumb_1.0.0.bb           |   10 ----------
 meta-efl/recipes-efl/efl/ethumb_1.0.1.bb           |   10 ++++++++++
 meta-efl/recipes-efl/efl/evas_1.2.0.bb             |   10 ----------
 meta-efl/recipes-efl/efl/evas_1.2.1.bb             |   10 ++++++++++
 13 files changed, 50 insertions(+), 50 deletions(-)
 rename meta-efl/recipes-efl/efl/{ecore_1.2.0.bb => ecore_1.2.1.bb} (50%)
 rename meta-efl/recipes-efl/efl/{eio_1.0.0.bb => edje_1.2.1.bb} (40%)
 rename meta-efl/recipes-efl/efl/{edje_1.2.0.bb => eet_1.6.1.bb} (40%)
 rename meta-efl/recipes-efl/efl/{eet_1.6.0.bb => eina_1.2.1.bb} (40%)
 rename meta-efl/recipes-efl/efl/{eina_1.2.0.bb => eio_1.0.1.bb} (40%)
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.0.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.0.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion_1.0.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion_1.0.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb_1.0.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/ethumb_1.0.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas_1.2.1.bb

diff --git a/meta-efl/recipes-efl/efl/ecore_1.2.0.bb b/meta-efl/recipes-efl/efl/ecore_1.2.1.bb
similarity index 50%
rename from meta-efl/recipes-efl/efl/ecore_1.2.0.bb
rename to meta-efl/recipes-efl/efl/ecore_1.2.1.bb
index 39c58d7..067042d 100644
--- a/meta-efl/recipes-efl/efl/ecore_1.2.0.bb
+++ b/meta-efl/recipes-efl/efl/ecore_1.2.1.bb
@@ -7,5 +7,5 @@ SRC_URI = "\
   file://fix-ecore-fb-initialization.patch \
 "
 
-SRC_URI[md5sum] = "64362b8ab96776a5868db4e6a8919926"
-SRC_URI[sha256sum] = "97c0f07180fcf7dec6ce39893b206ff069109ef4569ea6be2fdbb2e05f029aa9"
+SRC_URI[md5sum] = "557f8411d323b14ed7bf1be368ab302a"
+SRC_URI[sha256sum] = "78d8374e5f901f1dd4c89e99508a5a3470b8a0cb2510ab5b7e45d670e6621ef8"
diff --git a/meta-efl/recipes-efl/efl/eio_1.0.0.bb b/meta-efl/recipes-efl/efl/edje_1.2.1.bb
similarity index 40%
rename from meta-efl/recipes-efl/efl/eio_1.0.0.bb
rename to meta-efl/recipes-efl/efl/edje_1.2.1.bb
index d2a14ac..8f22e50 100644
--- a/meta-efl/recipes-efl/efl/eio_1.0.0.bb
+++ b/meta-efl/recipes-efl/efl/edje_1.2.1.bb
@@ -6,5 +6,5 @@ SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "9ca60516294fcbd9c919c56e3bb19568"
-SRC_URI[sha256sum] = "08967f5414614b062fae21b012680fcd6ce6c456521bb186593309451e2ff913"
+SRC_URI[md5sum] = "b9df053b327cb41d2de2485bd596bb44"
+SRC_URI[sha256sum] = "b793e98e9f65dfe7d007563e9d4cba84807a4473dfa9c94cdaee1ed9752cf6e0"
diff --git a/meta-efl/recipes-efl/efl/edje_1.2.0.bb b/meta-efl/recipes-efl/efl/eet_1.6.1.bb
similarity index 40%
rename from meta-efl/recipes-efl/efl/edje_1.2.0.bb
rename to meta-efl/recipes-efl/efl/eet_1.6.1.bb
index cf6be25..36894ea 100644
--- a/meta-efl/recipes-efl/efl/edje_1.2.0.bb
+++ b/meta-efl/recipes-efl/efl/eet_1.6.1.bb
@@ -6,5 +6,5 @@ SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "a1f848b842e049a789833f9d46ee8a8e"
-SRC_URI[sha256sum] = "0e411679a4d2710f6e3933bff4fda3966fd6140eef89b3d96d663d5f38878290"
+SRC_URI[md5sum] = "eaa6c1088b60d2177b57554690507eb7"
+SRC_URI[sha256sum] = "376056473e2d5d1873381b5782f50f7755ab8d1243f113f02c0e147f36203807"
diff --git a/meta-efl/recipes-efl/efl/eet_1.6.0.bb b/meta-efl/recipes-efl/efl/eina_1.2.1.bb
similarity index 40%
rename from meta-efl/recipes-efl/efl/eet_1.6.0.bb
rename to meta-efl/recipes-efl/efl/eina_1.2.1.bb
index 14ce231..4714db8 100644
--- a/meta-efl/recipes-efl/efl/eet_1.6.0.bb
+++ b/meta-efl/recipes-efl/efl/eina_1.2.1.bb
@@ -6,5 +6,5 @@ SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "4fb2c27bdfe4c2f56f42e5da0c518a2f"
-SRC_URI[sha256sum] = "f14872b26f0857aed18e184d5080da7ac994fa35ddc209e23be447dcc2fdbd50"
+SRC_URI[md5sum] = "5dc2712b71f202d32c07394ad253a071"
+SRC_URI[sha256sum] = "013ee257f4be3acfb94ef3f2e5b06aedd48ed528e66833fb5e3ca71479912bea"
diff --git a/meta-efl/recipes-efl/efl/eina_1.2.0.bb b/meta-efl/recipes-efl/efl/eio_1.0.1.bb
similarity index 40%
rename from meta-efl/recipes-efl/efl/eina_1.2.0.bb
rename to meta-efl/recipes-efl/efl/eio_1.0.1.bb
index fac3b09..54a35a8 100644
--- a/meta-efl/recipes-efl/efl/eina_1.2.0.bb
+++ b/meta-efl/recipes-efl/efl/eio_1.0.1.bb
@@ -6,5 +6,5 @@ SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "4b1c45fdcf0acb9744c55ba2a4f3b139"
-SRC_URI[sha256sum] = "b357415be9bdcdc0dc396821cc2c08aab5bae1e6e67aeaeceb1201e9f7dcae25"
+SRC_URI[md5sum] = "a079913877d79417bc06dfecbf57c949"
+SRC_URI[sha256sum] = "8a7079bf1e980e0d00fa9656e641e4a8a5aabf66986e76dcf06882ccf9623ed0"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.0.0.bb b/meta-efl/recipes-efl/efl/elementary_1.0.0.bb
deleted file mode 100644
index 4f2111e..0000000
--- a/meta-efl/recipes-efl/efl/elementary_1.0.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "c5bd504b03b6de0a4ffe28fa6a6233ae"
-SRC_URI[sha256sum] = "897fff5f6e81e8b01670d5f4b253141b333679d56bab89dc8a7c3f857763f94e"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.0.1.bb b/meta-efl/recipes-efl/efl/elementary_1.0.1.bb
new file mode 100644
index 0000000..d4e3960
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elementary_1.0.1.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "df978462103b1b6a5af374ea22296d80"
+SRC_URI[sha256sum] = "24af1521fee4a18e1039a908e5f9aefa2f767854c5075d06bb5d268cfde1e2be"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.0.0.bb b/meta-efl/recipes-efl/efl/emotion_1.0.0.bb
deleted file mode 100644
index e189480..0000000
--- a/meta-efl/recipes-efl/efl/emotion_1.0.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "dc1e981c05318d2c3373acfd1cb18079"
-SRC_URI[sha256sum] = "faa1fbd30a297fdb06b8545ffb6d0d961de850f012dc1a8b3033d1800fac3a78"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.0.1.bb b/meta-efl/recipes-efl/efl/emotion_1.0.1.bb
new file mode 100644
index 0000000..c142b5b
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/emotion_1.0.1.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "6bed064cc88b060e79e9418c557eac8c"
+SRC_URI[sha256sum] = "e8f95696c87731b26a199990f190476acd94da103c6538f76ade30abd0db850d"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.0.0.bb b/meta-efl/recipes-efl/efl/ethumb_1.0.0.bb
deleted file mode 100644
index 23ac60c..0000000
--- a/meta-efl/recipes-efl/efl/ethumb_1.0.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "485b6f47bffa9e44db4aa9cf60e3bcb5"
-SRC_URI[sha256sum] = "6d162b9b401aa4f7f3387edce7cd488c33e71633091b0cc1e9540471bb400de0"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.0.1.bb b/meta-efl/recipes-efl/efl/ethumb_1.0.1.bb
new file mode 100644
index 0000000..e976238
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/ethumb_1.0.1.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "20bd55bfa05d0c20e985f1031a683677"
+SRC_URI[sha256sum] = "67449d0521d3c806b57e4d8ea121089dcbdf4fbcc2fb451ae881bd05025f6715"
diff --git a/meta-efl/recipes-efl/efl/evas_1.2.0.bb b/meta-efl/recipes-efl/efl/evas_1.2.0.bb
deleted file mode 100644
index c8870d9..0000000
--- a/meta-efl/recipes-efl/efl/evas_1.2.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "bd573ab01d678280d570cbac07ef1053"
-SRC_URI[sha256sum] = "332bdc121677f1f3319beed59513e1e7ee9d0076bed8db53db428251cc52f2c0"
diff --git a/meta-efl/recipes-efl/efl/evas_1.2.1.bb b/meta-efl/recipes-efl/efl/evas_1.2.1.bb
new file mode 100644
index 0000000..ddac920
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas_1.2.1.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "830161bd790c2c5f17aa47e3a1c3abe1"
+SRC_URI[sha256sum] = "a019b410dba86e616163bafb6524d8734ac8c97aab7c41409f5176f23944bae6"
-- 
1.7.8.6



