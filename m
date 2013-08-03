Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0B4356B1A4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Aug 2013 13:08:40 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so781467ead.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Aug 2013 06:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=sPA0ujs36FUTY5PZDX1TByLn67QX73BIojYLAVfi9x8=;
	b=Jv71qdAFsZakdVMxI6GNskpZRDQnJYXjZ37AM5bDliOUbhuDOe+uDYBPcextFD/I8z
	lQKLTrDZfPW6GoeokHj5bOAI67Rgmyd7S0TI0NPeCcpF3Mda3PwaodxKX6Ww3uasCEdU
	m/ID5XoC3WKKn/raZyDYglkg8Em5QkyEh3u+q5+yYlS9WPDRAl9ZDsNvjg9c4oSpmt43
	a6p5ksumBLfUiSqVB4ANEgburcG+7eNF29mcaqcvHnbba8i8U4E84TfxYhQzv+bj/npI
	FgV8o0H4cCAmYpdxpxDr3e4DQ34HDsfggmkQHFXdnnS/veI53spOVBhDS1fNqH0/CJq4
	Bdzg==
X-Received: by 10.15.53.4 with SMTP id q4mr9486145eew.134.1375535321173;
	Sat, 03 Aug 2013 06:08:41 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	t6sm9857514eel.12.2013.08.03.06.08.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 03 Aug 2013 06:08:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Aug 2013 15:09:10 +0200
Message-Id: <1375535352-23015-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1375535352-23015-1-git-send-email-Martin.Jansa@gmail.com>
References: <1375535352-23015-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 2/4] meta-efl: upgrade efl to 1.7.8, e-wm to 0.17.4
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
X-List-Received-Date: Sat, 03 Aug 2013 13:08:42 -0000

* announcement:
  http://www.mail-archive.com/enlightenment-devel@lists.sourceforge.net/msg54004.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../e17/{e-wm_0.17.3.bb => e-wm_0.17.4.bb}         |   4 +-
 meta-efl/recipes-efl/efl/ecore_1.7.7.bb            |  11 --
 meta-efl/recipes-efl/efl/ecore_1.7.8.bb            |   9 ++
 meta-efl/recipes-efl/efl/edbus_1.7.7.bb            |  10 --
 meta-efl/recipes-efl/efl/edbus_1.7.8.bb            |   8 ++
 meta-efl/recipes-efl/efl/edje_1.7.7.bb             |  10 --
 meta-efl/recipes-efl/efl/edje_1.7.8.bb             |   8 ++
 meta-efl/recipes-efl/efl/eet_1.7.7.bb              |  10 --
 meta-efl/recipes-efl/efl/eet_1.7.8.bb              |   8 ++
 meta-efl/recipes-efl/efl/eeze_1.7.7.bb             |  10 --
 meta-efl/recipes-efl/efl/eeze_1.7.8.bb             |   8 ++
 meta-efl/recipes-efl/efl/efreet_1.7.7.bb           |  10 --
 meta-efl/recipes-efl/efl/efreet_1.7.8.bb           |   8 ++
 meta-efl/recipes-efl/efl/eina_1.7.7.bb             |  10 --
 meta-efl/recipes-efl/efl/eina_1.7.8.bb             |   8 ++
 meta-efl/recipes-efl/efl/eio_1.7.7.bb              |  10 --
 meta-efl/recipes-efl/efl/eio_1.7.8.bb              |   8 ++
 meta-efl/recipes-efl/efl/elementary_1.7.7.bb       |  10 --
 meta-efl/recipes-efl/efl/elementary_1.7.8.bb       |   8 ++
 meta-efl/recipes-efl/efl/embryo_1.7.7.bb           |  10 --
 meta-efl/recipes-efl/efl/embryo_1.7.8.bb           |   8 ++
 meta-efl/recipes-efl/efl/emotion_1.7.7.bb          |  10 --
 meta-efl/recipes-efl/efl/emotion_1.7.8.bb          |   8 ++
 meta-efl/recipes-efl/efl/ethumb_1.7.7.bb           |  10 --
 meta-efl/recipes-efl/efl/ethumb_1.7.8.bb           |   8 ++
 .../recipes-efl/efl/evas-generic-loaders_1.7.7.bb  |  10 --
 .../recipes-efl/efl/evas-generic-loaders_1.7.8.bb  |   8 ++
 meta-efl/recipes-efl/efl/evas/revert.r83789.patch  | 146 ---------------------
 meta-efl/recipes-efl/efl/evas_1.7.7.bb             |  11 --
 meta-efl/recipes-efl/efl/evas_1.7.8.bb             |   8 ++
 meta-efl/recipes-efl/efl/expedite_1.7.7.bb         |  10 --
 meta-efl/recipes-efl/efl/expedite_1.7.8.bb         |   8 ++
 32 files changed, 123 insertions(+), 300 deletions(-)
 rename meta-efl/recipes-efl/e17/{e-wm_0.17.3.bb => e-wm_0.17.4.bb} (62%)
 delete mode 100644 meta-efl/recipes-efl/efl/ecore_1.7.7.bb
 create mode 100644 meta-efl/recipes-efl/efl/ecore_1.7.8.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edbus_1.7.7.bb
 create mode 100644 meta-efl/recipes-efl/efl/edbus_1.7.8.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edje_1.7.7.bb
 create mode 100644 meta-efl/recipes-efl/efl/edje_1.7.8.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eet_1.7.7.bb
 create mode 100644 meta-efl/recipes-efl/efl/eet_1.7.8.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eeze_1.7.7.bb
 create mode 100644 meta-efl/recipes-efl/efl/eeze_1.7.8.bb
 delete mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.7.bb
 create mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.8.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eina_1.7.7.bb
 create mode 100644 meta-efl/recipes-efl/efl/eina_1.7.8.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eio_1.7.7.bb
 create mode 100644 meta-efl/recipes-efl/efl/eio_1.7.8.bb
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.7.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.8.bb
 delete mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.7.bb
 create mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.8.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.7.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.8.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.7.bb
 create mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.8.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.7.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.8.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas/revert.r83789.patch
 delete mode 100644 meta-efl/recipes-efl/efl/evas_1.7.7.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas_1.7.8.bb
 delete mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.7.bb
 create mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.8.bb

diff --git a/meta-efl/recipes-efl/e17/e-wm_0.17.3.bb b/meta-efl/recipes-efl/e17/e-wm_0.17.4.bb
similarity index 62%
rename from meta-efl/recipes-efl/e17/e-wm_0.17.3.bb
rename to meta-efl/recipes-efl/e17/e-wm_0.17.4.bb
index 25bde7d..01895bc 100644
--- a/meta-efl/recipes-efl/e17/e-wm_0.17.3.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_0.17.4.bb
@@ -12,5 +12,5 @@ SRC_URI = "\
     file://applications.menu \
 "
 
-SRC_URI[md5sum] = "e20f4d75a40f3de0dcd2862ca0483ebc"
-SRC_URI[sha256sum] = "fb4856c705633f8cbac7b576387204d56a1dbd652005b11a0e5bfdf0f1ca389e"
+SRC_URI[md5sum] = "ce3b7c8f05975521bdfe1edb72c8e245"
+SRC_URI[sha256sum] = "090447607c850f98ce8c2089c55e15d77b35a9014eddff9119f38b0e0e49f0b7"
diff --git a/meta-efl/recipes-efl/efl/ecore_1.7.7.bb b/meta-efl/recipes-efl/efl/ecore_1.7.7.bb
deleted file mode 100644
index aad7a27..0000000
--- a/meta-efl/recipes-efl/efl/ecore_1.7.7.bb
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
-SRC_URI[md5sum] = "8974d55e80bab1405c24b73f1f43153c"
-SRC_URI[sha256sum] = "1a933394897bba8d255c3e458501be9ed30fa2a02f7552e338350f54e2342fd6"
diff --git a/meta-efl/recipes-efl/efl/ecore_1.7.8.bb b/meta-efl/recipes-efl/efl/ecore_1.7.8.bb
new file mode 100644
index 0000000..ccd5d97
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/ecore_1.7.8.bb
@@ -0,0 +1,9 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+    file://fix-ecore-fb-initialization.patch \
+"
+
+SRC_URI[md5sum] = "5a8ca096d8c15647b2493d4664a4b895"
+SRC_URI[sha256sum] = "26cb1dc02213a221fdec32ef4ea4ece608e5239bdbd19c9d62b09cf931863738"
diff --git a/meta-efl/recipes-efl/efl/edbus_1.7.7.bb b/meta-efl/recipes-efl/efl/edbus_1.7.7.bb
deleted file mode 100644
index f8da1fd..0000000
--- a/meta-efl/recipes-efl/efl/edbus_1.7.7.bb
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
-SRC_URI[md5sum] = "d9bf302b9b3f6cfd98840e6e8ca8c0ce"
-SRC_URI[sha256sum] = "ad2b545d29920a3c245e7d73cced8be0fbef28cc003028fe4938961810748fef"
diff --git a/meta-efl/recipes-efl/efl/edbus_1.7.8.bb b/meta-efl/recipes-efl/efl/edbus_1.7.8.bb
new file mode 100644
index 0000000..a9250e9
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/edbus_1.7.8.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "8711070b57873b2b2a0024b198e50906"
+SRC_URI[sha256sum] = "9e94f1c522ac9faec991cd90c91e4e26b355909dbba21b42585359841937af78"
diff --git a/meta-efl/recipes-efl/efl/edje_1.7.7.bb b/meta-efl/recipes-efl/efl/edje_1.7.7.bb
deleted file mode 100644
index f688363..0000000
--- a/meta-efl/recipes-efl/efl/edje_1.7.7.bb
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
-SRC_URI[md5sum] = "8aa82193b59aef8fc91577f1226d2daa"
-SRC_URI[sha256sum] = "ad912d56b6f3e27442d069ce1c8f1ba50b635ef5f408a9cc00912c927bed2a1e"
diff --git a/meta-efl/recipes-efl/efl/edje_1.7.8.bb b/meta-efl/recipes-efl/efl/edje_1.7.8.bb
new file mode 100644
index 0000000..ea3fc74
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/edje_1.7.8.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "06399e95de312de12342df8f16c7c885"
+SRC_URI[sha256sum] = "924eae1be1fe755997be8074d32af4b6a83ed7e57057edccb2cf46b83c33202d"
diff --git a/meta-efl/recipes-efl/efl/eet_1.7.7.bb b/meta-efl/recipes-efl/efl/eet_1.7.7.bb
deleted file mode 100644
index 7c701c5..0000000
--- a/meta-efl/recipes-efl/efl/eet_1.7.7.bb
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
-SRC_URI[md5sum] = "a4ee8343fdb93ff00359e595f45488cd"
-SRC_URI[sha256sum] = "d3c801995d7ec1f85de0adda440c4577060e2895c4ef21da60077773d5874f1b"
diff --git a/meta-efl/recipes-efl/efl/eet_1.7.8.bb b/meta-efl/recipes-efl/efl/eet_1.7.8.bb
new file mode 100644
index 0000000..df4d7c1
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eet_1.7.8.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "2db9527a95412af26df8f79429ffcc95"
+SRC_URI[sha256sum] = "faad73b713c08f8f3c9ed76a0f8e4161f969e5ec8215db1dd5108d3f6eeb3a20"
diff --git a/meta-efl/recipes-efl/efl/eeze_1.7.7.bb b/meta-efl/recipes-efl/efl/eeze_1.7.7.bb
deleted file mode 100644
index 27485d9..0000000
--- a/meta-efl/recipes-efl/efl/eeze_1.7.7.bb
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
-SRC_URI[md5sum] = "8050f8701e3176a9f880ed50bbfd33a6"
-SRC_URI[sha256sum] = "975461750b6487884bd39dbd1078cd2a1a333451a8b85c8d6bb231d87936caf4"
diff --git a/meta-efl/recipes-efl/efl/eeze_1.7.8.bb b/meta-efl/recipes-efl/efl/eeze_1.7.8.bb
new file mode 100644
index 0000000..bcf1c04
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eeze_1.7.8.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "3ee68667f65860a0bdb7126e555155ff"
+SRC_URI[sha256sum] = "9a4df9d086575c54d0116164d46b2c9e29362cc32398ea606c2365cbdf4157dd"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.7.7.bb b/meta-efl/recipes-efl/efl/efreet_1.7.7.bb
deleted file mode 100644
index a7db2fe..0000000
--- a/meta-efl/recipes-efl/efl/efreet_1.7.7.bb
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
-SRC_URI[md5sum] = "f470cdfad747f615a25785ba18044ea6"
-SRC_URI[sha256sum] = "674177824a0dd20c29caec20b94355bafa529d15243cc1a06fe6bec1cbe7d88b"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.7.8.bb b/meta-efl/recipes-efl/efl/efreet_1.7.8.bb
new file mode 100644
index 0000000..d1eadb7
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/efreet_1.7.8.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "42ccb6672be6c3cbd7359c9b71a8e587"
+SRC_URI[sha256sum] = "b462c6d230af00d052674e175dbd269f1a4aa0ea510f704b2118895429127426"
diff --git a/meta-efl/recipes-efl/efl/eina_1.7.7.bb b/meta-efl/recipes-efl/efl/eina_1.7.7.bb
deleted file mode 100644
index 905d8e2..0000000
--- a/meta-efl/recipes-efl/efl/eina_1.7.7.bb
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
-SRC_URI[md5sum] = "baeb29327fc017e3ced890dc822c74ef"
-SRC_URI[sha256sum] = "9812ea4c98ad4086bb93dedf04f49125c41cf3c72773f7e2a89a2e3ea62cbce4"
diff --git a/meta-efl/recipes-efl/efl/eina_1.7.8.bb b/meta-efl/recipes-efl/efl/eina_1.7.8.bb
new file mode 100644
index 0000000..04f16c4
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eina_1.7.8.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "4c7715b636f71a5e07be4f33e72c6a69"
+SRC_URI[sha256sum] = "e39c5d9cc9d0854521983fe653b8f2efe2946e74066c7c0456ffe62342535d18"
diff --git a/meta-efl/recipes-efl/efl/eio_1.7.7.bb b/meta-efl/recipes-efl/efl/eio_1.7.7.bb
deleted file mode 100644
index 2e59e63..0000000
--- a/meta-efl/recipes-efl/efl/eio_1.7.7.bb
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
-SRC_URI[md5sum] = "edbbe1cfd6f73de3af74b83c980ba0c8"
-SRC_URI[sha256sum] = "5bf904a6c6e79e2046d0b3f355570f754511436636d41a271aeed6890cb25194"
diff --git a/meta-efl/recipes-efl/efl/eio_1.7.8.bb b/meta-efl/recipes-efl/efl/eio_1.7.8.bb
new file mode 100644
index 0000000..9634459
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eio_1.7.8.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "a5e1608a629667de3cfd17289d599b07"
+SRC_URI[sha256sum] = "f18831389f6b735e73c74d7f411602722dc8ce214ac3f4171b59d216d842a3b0"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.7.7.bb b/meta-efl/recipes-efl/efl/elementary_1.7.7.bb
deleted file mode 100644
index da53e27..0000000
--- a/meta-efl/recipes-efl/efl/elementary_1.7.7.bb
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
-SRC_URI[md5sum] = "079cce349333b4831d3f56abeefa1d2d"
-SRC_URI[sha256sum] = "b7850d1f1438ba58b780320d37522bf2e9e81339ebc6b660ad9cb3ea81f6c253"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.7.8.bb b/meta-efl/recipes-efl/efl/elementary_1.7.8.bb
new file mode 100644
index 0000000..8dfe880
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elementary_1.7.8.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "c9d387243a1ffa9318a491315c7007c8"
+SRC_URI[sha256sum] = "b02bcc17ba9f80a1a9df456ae95584b98747a2ff14f90c9c0471a16869bd35dc"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.7.7.bb b/meta-efl/recipes-efl/efl/embryo_1.7.7.bb
deleted file mode 100644
index 933c3c4..0000000
--- a/meta-efl/recipes-efl/efl/embryo_1.7.7.bb
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
-SRC_URI[md5sum] = "a4a2aa43a41afa783132a7220c450f6b"
-SRC_URI[sha256sum] = "0b5f0c7f2357f0e31b9cf797e5a606bd491d75c9f3b8e006da15d4a8c17c9225"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.7.8.bb b/meta-efl/recipes-efl/efl/embryo_1.7.8.bb
new file mode 100644
index 0000000..3f1e883
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/embryo_1.7.8.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "8fee23d51be07c72f9a7edf707e1f43f"
+SRC_URI[sha256sum] = "fe8af458b2f3e5e561181c7e86b763e2623397a2a4bbbfe08e58be06ed052306"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.7.7.bb b/meta-efl/recipes-efl/efl/emotion_1.7.7.bb
deleted file mode 100644
index c680b89..0000000
--- a/meta-efl/recipes-efl/efl/emotion_1.7.7.bb
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
-SRC_URI[md5sum] = "8b53d2d945d6a40b012472f47568879a"
-SRC_URI[sha256sum] = "aab476f80d4ad89056ba3860dfbb681c335c3688825fd587f5cbc6d9728abd41"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.7.8.bb b/meta-efl/recipes-efl/efl/emotion_1.7.8.bb
new file mode 100644
index 0000000..b5177d4
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/emotion_1.7.8.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "e04679ac7967e698c8c4013b9fd209a1"
+SRC_URI[sha256sum] = "54c96192cb46f5dce851934adb1633b45e5b007ad3cd05495102eeb255bced31"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.7.7.bb b/meta-efl/recipes-efl/efl/ethumb_1.7.7.bb
deleted file mode 100644
index 5e700cb..0000000
--- a/meta-efl/recipes-efl/efl/ethumb_1.7.7.bb
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
-SRC_URI[md5sum] = "58a1e8476dcc15ecffc8d542be656cb9"
-SRC_URI[sha256sum] = "541d07017f99b567976b2678466dbb5b540a4e93bf4fab987f3d0d612010da20"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.7.8.bb b/meta-efl/recipes-efl/efl/ethumb_1.7.8.bb
new file mode 100644
index 0000000..8d7d8bd
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/ethumb_1.7.8.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "9c5936d06ff79aea0dd81c5be0bf511e"
+SRC_URI[sha256sum] = "9047a88122c8713444d66294b3343c07feb15817a1809c7cbc9478ba91587e2d"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.7.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.7.bb
deleted file mode 100644
index ea07ae9..0000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.7.bb
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
-SRC_URI[md5sum] = "0af7e3a5e0bf931bf87294d39eae3623"
-SRC_URI[sha256sum] = "4eef549641d26b921f564169af1f21f7854431f523897cd167d3c3c860e854aa"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.8.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.8.bb
new file mode 100644
index 0000000..de71858
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.8.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "8d6c7f56db854fdf931fc9270d0fda87"
+SRC_URI[sha256sum] = "4f5f2a00eb065049de3e31cd86aee7de3b0593b9aec70aeb851f4f8189233d34"
diff --git a/meta-efl/recipes-efl/efl/evas/revert.r83789.patch b/meta-efl/recipes-efl/efl/evas/revert.r83789.patch
deleted file mode 100644
index a5b8ce6..0000000
--- a/meta-efl/recipes-efl/efl/evas/revert.r83789.patch
+++ /dev/null
@@ -1,146 +0,0 @@
-From 134e338a40af875d5f7b221a7a8dbeefa7a48f55 Mon Sep 17 00:00:00 2001
-From: Daniel Willmann <d.willmann@samsung.com>
-Date: Tue, 07 May 2013 09:49:53 +0000
-Subject: Revert "Backport rev 83789"
-
-This reverts commit 9a7a28b7582f516c67b23c4bb1a016cfc2ec5b31.
-Was reverted long ago in efl as it doesn't actually work.
-
-Signed-off-by: Daniel Willmann <d.willmann@samsung.com>
----
-diff --git a/ChangeLog b/ChangeLog
-index 54da44a..93d3834 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1294,3 +1294,7 @@
- 
-         * Evas text: Fixed line size calculation when using multiple
-         fonts.
-+
-+2013-05-16	Daniel Wilmann
-+        * x11 backend: Revert "Fix memory usage spike when rotating with the
-+				software_x11 engine". This doesn't actually work.
-diff --git a/NEWS b/NEWS
-index 6188963..c8002db 100644
---- a/NEWS
-+++ b/NEWS
-@@ -13,6 +13,7 @@ Fixes:
-    * Evas: If an object goes to be hidden without replacing the cur/prev state info, the object context can be corrupted at the next show time. Now it replaces the cur/prev in that rare case.
-    * Fix recursive proxy image rendering to just render black
-    * Evas text: Fixed line size calculation when using multiple fonts.
-+   * Revert "Fix memory usage spike when rotating with the software_x11 engine."
- 
- Evas 1.7.6
-     * Fix SIGFPE in evas map update if image is 0.
-diff --git a/src/modules/engines/software_x11/evas_xlib_outbuf.c b/src/modules/engines/software_x11/evas_xlib_outbuf.c
-index 3cb1ea0..e337e99 100644
---- a/src/modules/engines/software_x11/evas_xlib_outbuf.c
-+++ b/src/modules/engines/software_x11/evas_xlib_outbuf.c
-@@ -362,7 +362,7 @@ evas_software_xlib_outbuf_setup_x(int w, int h, int rot, Outbuf_Depth depth,
- RGBA_Image *
- evas_software_xlib_outbuf_new_region_for_update(Outbuf *buf, int x, int y, int w, int h, int *cx, int *cy, int *cw, int *ch)
- {
--   RGBA_Image         *im = NULL;
-+   RGBA_Image         *im;
-    Outbuf_Region      *obr;
-    int                 bpl = 0;
-    int                 use_shm = 1;
-@@ -455,11 +455,6 @@ evas_software_xlib_outbuf_new_region_for_update(Outbuf *buf, int x, int y, int w
- 	  }
- 	else
- 	  {
--            /* FIXME: For the onebuf case we probably need to do the same thing we did below
--             * (try to get an existing image before we allocate a new one). This code path
--             * is not really used at the moment so no way to test (and that's why the change
--             * is not implemented here as well.
--             */
- #ifdef EVAS_CSERVE2
-              if (evas_cserve2_use_get())
-                im = (RGBA_Image *)evas_cache2_image_empty(evas_common_image_cache2_get());
-@@ -613,73 +608,26 @@ evas_software_xlib_outbuf_new_region_for_update(Outbuf *buf, int x, int y, int w
-      }
-    else
-      {
--        obr->xob = _find_xob(buf->priv.x11.xlib.disp,
--                             buf->priv.x11.xlib.vis,
--                             buf->priv.x11.xlib.depth,
--                             w, h,
--                             use_shm,
--                             NULL);
- #ifdef EVAS_CSERVE2
-         if (evas_cserve2_use_get())
--          {
--             if (obr->xob)
--               im = (RGBA_Image *)evas_cache2_image_data(evas_common_image_cache2_get(),
--                                                        w, h,
--                                                        (DATA32 *) evas_software_xlib_x_output_buffer_data(obr->xob, &bpl),
--                                                        alpha, EVAS_COLORSPACE_ARGB8888);
--
--             if (!im)
--               {
--                  if (obr->xob) _unfind_xob(obr->xob, 0);
--                  im = (RGBA_Image *)evas_cache2_image_empty(evas_common_image_cache2_get());
--                  if (!im)
--                    {
--                      free(obr);
--                      return NULL;
--                    }
--                  else
--                    {
--                       im->cache_entry.w = w;
--                       im->cache_entry.h = h;
--                       im->cache_entry.flags.alpha |= alpha ? 1 : 0;
--                       evas_cache2_image_surface_alloc(&im->cache_entry, w, h);
--                    }
--               }
--          }
-+          im = (RGBA_Image *)evas_cache2_image_empty(evas_common_image_cache2_get());
-         else
- #endif
-+          im = (RGBA_Image *)evas_cache_image_empty(evas_common_image_cache_get());
-+        if (!im)
-           {
--             if (obr->xob)
--               im = (RGBA_Image *)evas_cache_image_data(evas_common_image_cache_get(),
--                                                        w, h,
--                                                        (DATA32 *) evas_software_xlib_x_output_buffer_data(obr->xob, &bpl),
--                                                        alpha, EVAS_COLORSPACE_ARGB8888);
--
--             if (!im)
--               {
--                  if (obr->xob) _unfind_xob(obr->xob, 0);
--                  im = (RGBA_Image *)evas_cache_image_empty(evas_common_image_cache_get());
--                  if (!im)
--                    {
--                      free(obr);
--                      return NULL;
--                    }
--                  else
--                    {
--                       im->cache_entry.w = w;
--                       im->cache_entry.h = h;
--                       im->cache_entry.flags.alpha |= alpha ? 1 : 0;
--                       evas_cache_image_surface_alloc(&im->cache_entry, w, h);
--                    }
--               }
-+             free(obr);
-+             return NULL;
-           }
--
--        /* Need to update cache_entry w/h here because the render path expects them to be updated
--         * to the new geometry. */
-         im->cache_entry.w = w;
-         im->cache_entry.h = h;
-         im->cache_entry.flags.alpha |= alpha ? 1 : 0;
--
-+#ifdef EVAS_CSERVE2
-+        if (evas_cserve2_use_get())
-+          evas_cache2_image_surface_alloc(&im->cache_entry, w, h);
-+        else
-+#endif
-+          evas_cache_image_surface_alloc(&im->cache_entry, w, h);
- 	im->extended_info = obr;
- 	if ((buf->rot == 0) || (buf->rot == 180))
-           {
---
-cgit v0.9.1
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.7.bb b/meta-efl/recipes-efl/efl/evas_1.7.7.bb
deleted file mode 100644
index 20355ec..0000000
--- a/meta-efl/recipes-efl/efl/evas_1.7.7.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.2"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-    file://revert.r83789.patch \
-"
-
-SRC_URI[md5sum] = "980abd6f645a38aa0a5d74f11a0e07f9"
-SRC_URI[sha256sum] = "ea8403d58cd079a651c515e76d7812deb0f7c2f41bb9807b3040a023b2fba78c"
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.8.bb b/meta-efl/recipes-efl/efl/evas_1.7.8.bb
new file mode 100644
index 0000000..f9bf8d0
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas_1.7.8.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "ca6a5a28f0fc5b0eac36210d4df139fb"
+SRC_URI[sha256sum] = "048f16454c2601851e9b17591579f60e25727c09beadaf3567fa443dfbaed0da"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.7.7.bb b/meta-efl/recipes-efl/efl/expedite_1.7.7.bb
deleted file mode 100644
index be922b5..0000000
--- a/meta-efl/recipes-efl/efl/expedite_1.7.7.bb
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
-SRC_URI[md5sum] = "46c6c6b21910b97caa62da57a0cd4b83"
-SRC_URI[sha256sum] = "62f1caba9715ce9d4047fa9a2c4ed6c756cc37fc0078404b7074d16b9293c333"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.7.8.bb b/meta-efl/recipes-efl/efl/expedite_1.7.8.bb
new file mode 100644
index 0000000..8be92c2
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/expedite_1.7.8.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "378d4abb513fd4ae1d2e2f75a2d970e4"
+SRC_URI[sha256sum] = "ac80d3f13af4f644e048a1fcb71fd5f12fdef7c11c19fe61c868273bf3f4deb9"
-- 
1.8.3.2


