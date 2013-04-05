Received: from mail-ea0-f169.google.com ([209.85.215.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UOBlQ-0001Sj-Vj
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Apr 2013 20:53:31 +0200
Received: by mail-ea0-f169.google.com with SMTP id n15so1449170ead.14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2013 11:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=IcXXCbcY4JAZBwYImei+jTbusY2z9qdwe8nweSDbbE0=;
	b=HS/jIMsIjOFbiBYo0gDSa4FCDYjkTRSVs214AYblFpZ7Sm3BCrM5KusdA0DoZ33U3p
	SjPhRDcoELhW83xwKHvJ86vJMWy7pJioiHockSNf/5qJUWrNK3YcVFdaXjM90Cn+Sw2O
	5r0wb4xyJM7Ng4CUfKeejWMlBSRYeog+KKINPKERtkSl7EYHPlxygO/4WOnrysYIvTRG
	PTCmufiHycvwDUfIfteqBjKoHpkOvF5vcDnNwhtN3AvSjSGrt6RZFqC7FoFDfNDhHxA7
	0flDVNWV58CjJk6wB+n1hTKs2gZbQlEeaRWsxIhdUolXvEfBHu7rKm41s3tIJm7TapcE
	XY/Q==
X-Received: by 10.15.43.132 with SMTP id x4mr21953351eev.31.1365186974373;
	Fri, 05 Apr 2013 11:36:14 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id cd3sm7137028eeb.6.2013.04.05.11.36.12
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 11:36:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Apr 2013 20:36:09 +0200
Message-Id: <1365186969-10127-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-efl][PATCH] meta-efl: upgrade efl to 1.7.6, e-wm to 0.17.2, terminology to 0.3.0
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
X-List-Received-Date: Fri, 05 Apr 2013 18:53:31 -0000

* announcements:
  http://www.mail-archive.com/enlightenment-devel@lists.sourceforge.net/msg52198.html
  http://www.mail-archive.com/enlightenment-devel@lists.sourceforge.net/msg51986.html
---
 .../e17/{e-wm_0.17.1.bb => e-wm_0.17.2.bb}         |  4 +--
 meta-efl/recipes-efl/e17/terminology_0.2.0.bb      | 10 ------
 meta-efl/recipes-efl/e17/terminology_0.3.0.bb      | 10 ++++++
 .../efl/{ecore_1.7.5.bb => ecore_1.7.6.bb}         |  4 +--
 meta-efl/recipes-efl/efl/edbus_1.7.5.bb            | 10 ------
 meta-efl/recipes-efl/efl/edbus_1.7.6.bb            | 10 ++++++
 meta-efl/recipes-efl/efl/edje_1.7.5.bb             | 10 ------
 meta-efl/recipes-efl/efl/edje_1.7.6.bb             | 10 ++++++
 meta-efl/recipes-efl/efl/eet_1.7.5.bb              | 10 ------
 meta-efl/recipes-efl/efl/eet_1.7.6.bb              | 10 ++++++
 meta-efl/recipes-efl/efl/eeze_1.7.5.bb             | 10 ------
 meta-efl/recipes-efl/efl/eeze_1.7.6.bb             | 10 ++++++
 meta-efl/recipes-efl/efl/efreet_1.7.5.bb           | 10 ------
 meta-efl/recipes-efl/efl/efreet_1.7.6.bb           | 10 ++++++
 meta-efl/recipes-efl/efl/eina_1.7.5.bb             | 10 ------
 meta-efl/recipes-efl/efl/eina_1.7.6.bb             | 10 ++++++
 meta-efl/recipes-efl/efl/eio_1.7.5.bb              | 10 ------
 meta-efl/recipes-efl/efl/eio_1.7.6.bb              | 10 ++++++
 meta-efl/recipes-efl/efl/elementary_1.7.5.bb       | 10 ------
 meta-efl/recipes-efl/efl/elementary_1.7.6.bb       | 10 ++++++
 meta-efl/recipes-efl/efl/embryo_1.7.5.bb           | 10 ------
 meta-efl/recipes-efl/efl/embryo_1.7.6.bb           | 10 ++++++
 meta-efl/recipes-efl/efl/emotion_1.7.5.bb          | 10 ------
 meta-efl/recipes-efl/efl/emotion_1.7.6.bb          | 10 ++++++
 meta-efl/recipes-efl/efl/ethumb_1.7.5.bb           | 10 ------
 meta-efl/recipes-efl/efl/ethumb_1.7.6.bb           | 10 ++++++
 .../recipes-efl/efl/evas-generic-loaders_1.7.5.bb  | 10 ------
 .../recipes-efl/efl/evas-generic-loaders_1.7.6.bb  | 10 ++++++
 ...evas-common_16-add-missing-FRIBIDI_CFLAGS.patch | 39 ++++++++++++++++++++++
 meta-efl/recipes-efl/efl/evas_1.7.5.bb             | 10 ------
 meta-efl/recipes-efl/efl/evas_1.7.6.bb             | 11 ++++++
 meta-efl/recipes-efl/efl/expedite_1.7.5.bb         | 10 ------
 meta-efl/recipes-efl/efl/expedite_1.7.6.bb         | 10 ++++++
 33 files changed, 194 insertions(+), 154 deletions(-)
 rename meta-efl/recipes-efl/e17/{e-wm_0.17.1.bb => e-wm_0.17.2.bb} (61%)
 delete mode 100644 meta-efl/recipes-efl/e17/terminology_0.2.0.bb
 create mode 100644 meta-efl/recipes-efl/e17/terminology_0.3.0.bb
 rename meta-efl/recipes-efl/efl/{ecore_1.7.5.bb => ecore_1.7.6.bb} (50%)
 delete mode 100644 meta-efl/recipes-efl/efl/edbus_1.7.5.bb
 create mode 100644 meta-efl/recipes-efl/efl/edbus_1.7.6.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edje_1.7.5.bb
 create mode 100644 meta-efl/recipes-efl/efl/edje_1.7.6.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eet_1.7.5.bb
 create mode 100644 meta-efl/recipes-efl/efl/eet_1.7.6.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eeze_1.7.5.bb
 create mode 100644 meta-efl/recipes-efl/efl/eeze_1.7.6.bb
 delete mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.5.bb
 create mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.6.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eina_1.7.5.bb
 create mode 100644 meta-efl/recipes-efl/efl/eina_1.7.6.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eio_1.7.5.bb
 create mode 100644 meta-efl/recipes-efl/efl/eio_1.7.6.bb
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.5.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.6.bb
 delete mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.5.bb
 create mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.6.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.5.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.6.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.5.bb
 create mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.6.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.5.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.6.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas/0001-evas-common_16-add-missing-FRIBIDI_CFLAGS.patch
 delete mode 100644 meta-efl/recipes-efl/efl/evas_1.7.5.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas_1.7.6.bb
 delete mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.5.bb
 create mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.6.bb

diff --git a/meta-efl/recipes-efl/e17/e-wm_0.17.1.bb b/meta-efl/recipes-efl/e17/e-wm_0.17.2.bb
similarity index 61%
rename from meta-efl/recipes-efl/e17/e-wm_0.17.1.bb
rename to meta-efl/recipes-efl/e17/e-wm_0.17.2.bb
index dbf04a5..05e9cac 100644
--- a/meta-efl/recipes-efl/e17/e-wm_0.17.1.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_0.17.2.bb
@@ -12,5 +12,5 @@ SRC_URI = "\
   file://applications.menu \
 "
 
-SRC_URI[md5sum] = "fcd29635328efa2bd207f18fe230e41a"
-SRC_URI[sha256sum] = "2d9327158b1bdf4301d898a1dca7d94d3e480f6e595dee05809dc66969df5dd3"
+SRC_URI[md5sum] = "ab15be89ec0ed06271fcca60b221d83b"
+SRC_URI[sha256sum] = "63882b29164497c71b17312cbc5a5c6911475b0ccf989502e179b1e3fee3e3b9"
diff --git a/meta-efl/recipes-efl/e17/terminology_0.2.0.bb b/meta-efl/recipes-efl/e17/terminology_0.2.0.bb
deleted file mode 100644
index 44370df..0000000
--- a/meta-efl/recipes-efl/e17/terminology_0.2.0.bb
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
-SRC_URI[md5sum] = "61301df6b068b84e1670c85b7696f28d"
-SRC_URI[sha256sum] = "e300dba5f77af7949471c81251c38af765c337b86c8ae9b98ec1dd0d6efbc1c9"
diff --git a/meta-efl/recipes-efl/e17/terminology_0.3.0.bb b/meta-efl/recipes-efl/e17/terminology_0.3.0.bb
new file mode 100644
index 0000000..5bd485b
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/terminology_0.3.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "7cecd058cb4509873412252477f2ce5b"
+SRC_URI[sha256sum] = "77850b1100fab93fc5c3c571d78f80fe10f5b153863dbb8efad83eccb55cc5b6"
diff --git a/meta-efl/recipes-efl/efl/ecore_1.7.5.bb b/meta-efl/recipes-efl/efl/ecore_1.7.6.bb
similarity index 50%
rename from meta-efl/recipes-efl/efl/ecore_1.7.5.bb
rename to meta-efl/recipes-efl/efl/ecore_1.7.6.bb
index 412aad6..4df653e 100644
--- a/meta-efl/recipes-efl/efl/ecore_1.7.5.bb
+++ b/meta-efl/recipes-efl/efl/ecore_1.7.6.bb
@@ -7,5 +7,5 @@ SRC_URI = "\
   file://fix-ecore-fb-initialization.patch \
 "
 
-SRC_URI[md5sum] = "96f85bcb720db2c723bf296b4d5d0bb6"
-SRC_URI[sha256sum] = "71618e58564b19705f9d02cf69d0459400e15d6b2a55baf53784c5dc5ec89c42"
+SRC_URI[md5sum] = "a41828b5b4ca42283d8658c0fe54db07"
+SRC_URI[sha256sum] = "94e08f58acb5021727ecd4d6da0ac7dc3db672542ac5fcd71681835190ad6555"
diff --git a/meta-efl/recipes-efl/efl/edbus_1.7.5.bb b/meta-efl/recipes-efl/efl/edbus_1.7.5.bb
deleted file mode 100644
index f3cbfa5..0000000
--- a/meta-efl/recipes-efl/efl/edbus_1.7.5.bb
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
-SRC_URI[md5sum] = "e523232dee5c88cda21ec2a3495d7f18"
-SRC_URI[sha256sum] = "b5c67b0bcadadd59d5611652260b97af57b6b5a6890ebca1839d953dff22c862"
diff --git a/meta-efl/recipes-efl/efl/edbus_1.7.6.bb b/meta-efl/recipes-efl/efl/edbus_1.7.6.bb
new file mode 100644
index 0000000..196dd37
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/edbus_1.7.6.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "3b4694a1b7c8f635effb225fe4c1f43d"
+SRC_URI[sha256sum] = "9064d4b16882d3657caacf9fe9a93849e71a93c9fdc6bbc20901ff89c9296e06"
diff --git a/meta-efl/recipes-efl/efl/edje_1.7.5.bb b/meta-efl/recipes-efl/efl/edje_1.7.5.bb
deleted file mode 100644
index 00a9b3c..0000000
--- a/meta-efl/recipes-efl/efl/edje_1.7.5.bb
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
-SRC_URI[md5sum] = "66f424e80b11a28e86de4b2b9828591d"
-SRC_URI[sha256sum] = "66c871a877ead4131fea82bab60018ef721b911df3208961eb967d45342bf23a"
diff --git a/meta-efl/recipes-efl/efl/edje_1.7.6.bb b/meta-efl/recipes-efl/efl/edje_1.7.6.bb
new file mode 100644
index 0000000..4708ff6
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/edje_1.7.6.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "2fa9079a1c53efebad47dccf6cb3a62c"
+SRC_URI[sha256sum] = "36663e1db7f615675b188f579454ef881fa7db1a3e8070ccedcb65dfedd0a959"
diff --git a/meta-efl/recipes-efl/efl/eet_1.7.5.bb b/meta-efl/recipes-efl/efl/eet_1.7.5.bb
deleted file mode 100644
index 743dc01..0000000
--- a/meta-efl/recipes-efl/efl/eet_1.7.5.bb
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
-SRC_URI[md5sum] = "c62ba7a771d16df9afe6e5869370e082"
-SRC_URI[sha256sum] = "2012a49b1acea2cd33d0cd8086615ceb4f881f868817bfdef88d3a0a837a1e0b"
diff --git a/meta-efl/recipes-efl/efl/eet_1.7.6.bb b/meta-efl/recipes-efl/efl/eet_1.7.6.bb
new file mode 100644
index 0000000..f014fe3
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eet_1.7.6.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "16a3b3cffbc7d63a5efdd673793e4a7a"
+SRC_URI[sha256sum] = "fbdebf7a07ba5b3c0821bd0941e048c411af2e6da2581ed57b806b3f7abb0748"
diff --git a/meta-efl/recipes-efl/efl/eeze_1.7.5.bb b/meta-efl/recipes-efl/efl/eeze_1.7.5.bb
deleted file mode 100644
index 450c8a3..0000000
--- a/meta-efl/recipes-efl/efl/eeze_1.7.5.bb
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
-SRC_URI[md5sum] = "698c1b09d4f380ac581a6100f5b88548"
-SRC_URI[sha256sum] = "3bd2796f11f33c2b0a2078694b2e4805b44d03f971f1e78c8da99944ae7e7af0"
diff --git a/meta-efl/recipes-efl/efl/eeze_1.7.6.bb b/meta-efl/recipes-efl/efl/eeze_1.7.6.bb
new file mode 100644
index 0000000..76a4c89
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eeze_1.7.6.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "8e23ead15f9f52df5ffd05560153756f"
+SRC_URI[sha256sum] = "4fa401a67dcec4b711e3eb29d827a2453b77e9add91938a4e30de866d36155f4"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.7.5.bb b/meta-efl/recipes-efl/efl/efreet_1.7.5.bb
deleted file mode 100644
index c035ae6..0000000
--- a/meta-efl/recipes-efl/efl/efreet_1.7.5.bb
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
-SRC_URI[md5sum] = "2df171ff22e88fda47bc916665b903ce"
-SRC_URI[sha256sum] = "1aa48f7ae2f367e8c9cd8407d6a55b941b54df78e629163b7a4dab2d423f49bc"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.7.6.bb b/meta-efl/recipes-efl/efl/efreet_1.7.6.bb
new file mode 100644
index 0000000..a72b47c
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/efreet_1.7.6.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "3888d88fcbf50e8977fc9f198facee8e"
+SRC_URI[sha256sum] = "499b9c29016b10efd9b2c6c784b8413986269db8313fa95fb39dd2e042cde5bb"
diff --git a/meta-efl/recipes-efl/efl/eina_1.7.5.bb b/meta-efl/recipes-efl/efl/eina_1.7.5.bb
deleted file mode 100644
index 7ec62a5..0000000
--- a/meta-efl/recipes-efl/efl/eina_1.7.5.bb
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
-SRC_URI[md5sum] = "ca45a53ec219c8a16631a20dc0f782cf"
-SRC_URI[sha256sum] = "294f2ee7c63a03ad84072d7f5b1aa7bc974afbb95e30748387bd812e20dc1952"
diff --git a/meta-efl/recipes-efl/efl/eina_1.7.6.bb b/meta-efl/recipes-efl/efl/eina_1.7.6.bb
new file mode 100644
index 0000000..69fda64
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eina_1.7.6.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "4f0075f404223284dac0f34f676c511e"
+SRC_URI[sha256sum] = "f204c0de00f46c54bf923477797d75e8b48e00f9173143e0e057e98a2dda9427"
diff --git a/meta-efl/recipes-efl/efl/eio_1.7.5.bb b/meta-efl/recipes-efl/efl/eio_1.7.5.bb
deleted file mode 100644
index 8bac44e..0000000
--- a/meta-efl/recipes-efl/efl/eio_1.7.5.bb
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
-SRC_URI[md5sum] = "429c30b99f4011b7b20085f7117a7b93"
-SRC_URI[sha256sum] = "e5b0c72fe9f6ea9db5c3c6966338fe718cf53c4a4b7d9b7a900a20e7341cf05a"
diff --git a/meta-efl/recipes-efl/efl/eio_1.7.6.bb b/meta-efl/recipes-efl/efl/eio_1.7.6.bb
new file mode 100644
index 0000000..7265cf2
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eio_1.7.6.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "c180817c536822153a1853b74a96d01a"
+SRC_URI[sha256sum] = "659db01da170a7c02b9087b0b66c238ac834016973fa04b13575b1bc445d1c00"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.7.5.bb b/meta-efl/recipes-efl/efl/elementary_1.7.5.bb
deleted file mode 100644
index b8de204..0000000
--- a/meta-efl/recipes-efl/efl/elementary_1.7.5.bb
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
-SRC_URI[md5sum] = "8c81926114f07d328aacb0e34c3830a4"
-SRC_URI[sha256sum] = "2798763a125792f4cd28b01a68799c7d7d113d4df12da60a13954e68108c7566"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.7.6.bb b/meta-efl/recipes-efl/efl/elementary_1.7.6.bb
new file mode 100644
index 0000000..f719253
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elementary_1.7.6.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "48f28d887432f9aca434c864de33d5f8"
+SRC_URI[sha256sum] = "eb52844e6bb95df1b83397fbcc3c7e234631cd91c83271781320f285eaf75d44"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.7.5.bb b/meta-efl/recipes-efl/efl/embryo_1.7.5.bb
deleted file mode 100644
index dc3d20b..0000000
--- a/meta-efl/recipes-efl/efl/embryo_1.7.5.bb
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
-SRC_URI[md5sum] = "c5d34d35ee38ad7c68b9f477d036c659"
-SRC_URI[sha256sum] = "e6270573104af01bf377755f3cc292a27171a74be7cbe8de889aa3b5e811c279"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.7.6.bb b/meta-efl/recipes-efl/efl/embryo_1.7.6.bb
new file mode 100644
index 0000000..bb3aa74
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/embryo_1.7.6.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "6302e1845d50074a949d8d822e2c8874"
+SRC_URI[sha256sum] = "0d0d584b031193f86ce0935898bc3dccb263e945f981125bc7804903c8d34a84"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.7.5.bb b/meta-efl/recipes-efl/efl/emotion_1.7.5.bb
deleted file mode 100644
index 76378af..0000000
--- a/meta-efl/recipes-efl/efl/emotion_1.7.5.bb
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
-SRC_URI[md5sum] = "bb6a00053b0f72c0c146a59161e4bb0b"
-SRC_URI[sha256sum] = "7d99fdd5c944a4df5ee635a4f4ca774f5887b02689de62fa4dabdf4bf76ec813"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.7.6.bb b/meta-efl/recipes-efl/efl/emotion_1.7.6.bb
new file mode 100644
index 0000000..9435a9f
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/emotion_1.7.6.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "eb15b6faa1e4a30f80622a1381c670fc"
+SRC_URI[sha256sum] = "7507a2544fb9d59e8a8835628a44141943bf3a7489f093eb557be396c3eff650"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.7.5.bb b/meta-efl/recipes-efl/efl/ethumb_1.7.5.bb
deleted file mode 100644
index acf5fc3..0000000
--- a/meta-efl/recipes-efl/efl/ethumb_1.7.5.bb
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
-SRC_URI[md5sum] = "6c9fde046edfed867de790a8cd3a16f9"
-SRC_URI[sha256sum] = "decb90a98ef94b1f52150c5e55e87c736824e24b01316486e9954760daac4cf5"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.7.6.bb b/meta-efl/recipes-efl/efl/ethumb_1.7.6.bb
new file mode 100644
index 0000000..f66a678
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/ethumb_1.7.6.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "343ef0dfda62295db353b7dca059e4a7"
+SRC_URI[sha256sum] = "c93bdfc9cf10f8759c41c172167cb1b5ebccddd8f499cc7e1bcc5410cae3146a"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.5.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.5.bb
deleted file mode 100644
index a35e393..0000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.5.bb
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
-SRC_URI[md5sum] = "8412b682a0445621edd7f23af0a0347e"
-SRC_URI[sha256sum] = "c50005246219668f2d7f0e00f4632c7e20f5eddb73d2de18c66d1a729dc569af"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.6.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.6.bb
new file mode 100644
index 0000000..d3ea978
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.6.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "f025e08a673ba4f11a3d17fc50e0abb1"
+SRC_URI[sha256sum] = "9cedd062da2305caa17d3ca8589efd640526d4b720cce89a177374c4e0fdf423"
diff --git a/meta-efl/recipes-efl/efl/evas/0001-evas-common_16-add-missing-FRIBIDI_CFLAGS.patch b/meta-efl/recipes-efl/efl/evas/0001-evas-common_16-add-missing-FRIBIDI_CFLAGS.patch
new file mode 100644
index 0000000..36bbf4a
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas/0001-evas-common_16-add-missing-FRIBIDI_CFLAGS.patch
@@ -0,0 +1,39 @@
+From a7ffaed7a67a8cad8bff1134926668f6d01a5ad6 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 5 Apr 2013 11:43:53 +0200
+Subject: [PATCH] evas: common_16: add missing FRIBIDI_CFLAGS
+
+Now with including fribidi.h instead of fribidi/fribidi.h we need
+FRIBIDI_CFLAGS to pass -I/usr/include/fribidi, fixes build issue:
+
+| make[5]: *** [evas_soft16_image_scaled_sampled.lo] Error 1
+| In file included from ../../../../src/lib/include/../engines/common/evas_text_utils.h:15:0,
+|                  from ../../../../src/lib/include/../engines/common/evas_font_ot.h:37,
+|                  from ../../../../src/lib/include/evas_common.h:940,
+|                  from ../../../../src/lib/include/evas_common_soft16.h:4,
+|                  from evas_soft16_rectangle.c:1:
+| ../../../../src/lib/include/../engines/common/language/evas_bidi_utils.h:31:22: fatal error: fribidi.h: No such file or directory
+| compilation terminated.
+| make[5]: *** [evas_soft16_rectangle.lo] Error 1
+| make[5]: Leaving directory `/OE/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/evas/2_1.7.6-r1.0/evas-1.7.6/src/lib/engines/common_16'
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/lib/engines/common_16/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/lib/engines/common_16/Makefile.am b/src/lib/engines/common_16/Makefile.am
+index cfa1347..7f630a9 100644
+--- a/src/lib/engines/common_16/Makefile.am
++++ b/src/lib/engines/common_16/Makefile.am
+@@ -7,6 +7,7 @@ AM_CPPFLAGS = \
+ -I$(top_srcdir)/src/lib/include \
+ @FREETYPE_CFLAGS@ \
+ @PIXMAN_CFLAGS@ \
++@FRIBIDI_CFLAGS@ \
+ @VALGRIND_CFLAGS@ \
+ @EVAS_GENERAL_CFLAGS@ \
+ @EET_CFLAGS@ \
+-- 
+1.8.1.5
+
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.5.bb b/meta-efl/recipes-efl/efl/evas_1.7.5.bb
deleted file mode 100644
index 38579e3..0000000
--- a/meta-efl/recipes-efl/efl/evas_1.7.5.bb
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
-SRC_URI[md5sum] = "77237b48c4167d30b40b7918eb8e274f"
-SRC_URI[sha256sum] = "a5de7921dadc8ed5726a16aca18fba48b43348556fde5b9454ef9b3468a21c6a"
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.6.bb b/meta-efl/recipes-efl/efl/evas_1.7.6.bb
new file mode 100644
index 0000000..d151eb6
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas_1.7.6.bb
@@ -0,0 +1,11 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+  file://0001-evas-common_16-add-missing-FRIBIDI_CFLAGS.patch \
+"
+
+SRC_URI[md5sum] = "4bcd5a4721f565bc7dd974973001ef73"
+SRC_URI[sha256sum] = "793b5bc4795cd26e2c10475e1f1647bbc5e052170f6212936b7eb95b87782608"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.7.5.bb b/meta-efl/recipes-efl/efl/expedite_1.7.5.bb
deleted file mode 100644
index 32c91e2..0000000
--- a/meta-efl/recipes-efl/efl/expedite_1.7.5.bb
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
-SRC_URI[md5sum] = "a4347a00dd765bee8c1562f101f28599"
-SRC_URI[sha256sum] = "6e7d577c2a6589d9d7a8fe10c2d913996be2f3fbc21cc6372880815b1f0e45d6"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.7.6.bb b/meta-efl/recipes-efl/efl/expedite_1.7.6.bb
new file mode 100644
index 0000000..42431aa
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/expedite_1.7.6.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "a4a6f3a84ff85d78c74e56a046bd3419"
+SRC_URI[sha256sum] = "d4f739779c45dcc1ff221fb17100f9928309bbf5ea243b4da6554c08025b2c18"
-- 
1.8.1.5



