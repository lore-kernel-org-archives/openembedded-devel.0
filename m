Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjHhd-0006w3-8k
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 23:56:29 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so957084eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 14:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ls2zESd2d1gf4zikVP1W6IQZuG7V2OXSiKuPJ21sr1A=;
	b=ikA00N4KEtU/yMSHAo0TTD0bJCH992AusnYinHrsKna1BR+CbKr7arMtmbYwyXiG96
	VwbJMzYY9qxG7eLfuqg7V2wl5GdU5mKwDPlnV10kndk30hh9josR3M6reytn4JjVpymY
	/q6reGyHMFhtqPkJqo8CWcCbCBBDlbA9ax25JJ8DTPpujkoeXRKEEmeUGf15wKnT5U75
	nGtT6hpohPRYSmDx1U+j082pxGXAhz0QShgA8FTzJTKPOsK+kqE0aLsvdclgbYFSJh7d
	gqs794DliM2zaGx+CBUNmQhIvumsgElfRiOfc0HVW5bPGBLdhGaeq7EDQb6CzHbV4mYf
	1xTw==
Received: by 10.14.225.72 with SMTP id y48mr9067097eep.46.1355438513915;
	Thu, 13 Dec 2012 14:41:53 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b2sm5676929eep.9.2012.12.13.14.41.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 14:41:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2012 23:41:44 +0100
Message-Id: <390171a2cf1c479452d58add5b3bf94274c8d72e.1355438402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355438401.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355438401.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 04/11] efl: upgrade to 1.7.3
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
X-List-Received-Date: Thu, 13 Dec 2012 22:56:29 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/{ecore_1.7.2.bb => ecore_1.7.3.bb} |  4 ++--
 meta-efl/recipes-efl/efl/{eeze_1.7.2.bb => edbus_1.7.3.bb}  |  4 ++--
 meta-efl/recipes-efl/efl/{edbus_1.7.2.bb => edje_1.7.3.bb}  |  4 ++--
 meta-efl/recipes-efl/efl/{edje_1.7.2.bb => eet_1.7.3.bb}    |  4 ++--
 meta-efl/recipes-efl/efl/{eet_1.7.2.bb => eeze_1.7.3.bb}    |  4 ++--
 meta-efl/recipes-efl/efl/efreet_1.7.2.bb                    | 10 ----------
 meta-efl/recipes-efl/efl/efreet_1.7.3.bb                    | 10 ++++++++++
 meta-efl/recipes-efl/efl/eina_1.7.2.bb                      | 10 ----------
 meta-efl/recipes-efl/efl/eina_1.7.3.bb                      | 10 ++++++++++
 meta-efl/recipes-efl/efl/eio_1.7.2.bb                       | 10 ----------
 meta-efl/recipes-efl/efl/eio_1.7.3.bb                       | 10 ++++++++++
 meta-efl/recipes-efl/efl/elementary_1.7.2.bb                | 10 ----------
 meta-efl/recipes-efl/efl/elementary_1.7.3.bb                | 10 ++++++++++
 meta-efl/recipes-efl/efl/embryo_1.7.2.bb                    | 10 ----------
 meta-efl/recipes-efl/efl/embryo_1.7.3.bb                    | 10 ++++++++++
 meta-efl/recipes-efl/efl/emotion_1.7.2.bb                   | 10 ----------
 meta-efl/recipes-efl/efl/emotion_1.7.3.bb                   | 10 ++++++++++
 meta-efl/recipes-efl/efl/ethumb_1.7.2.bb                    | 10 ----------
 meta-efl/recipes-efl/efl/ethumb_1.7.3.bb                    | 10 ++++++++++
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.2.bb      | 10 ----------
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.3.bb      | 10 ++++++++++
 meta-efl/recipes-efl/efl/evas_1.7.2.bb                      | 10 ----------
 meta-efl/recipes-efl/efl/evas_1.7.3.bb                      | 10 ++++++++++
 meta-efl/recipes-efl/efl/expedite_1.7.2.bb                  | 10 ----------
 meta-efl/recipes-efl/efl/expedite_1.7.3.bb                  | 10 ++++++++++
 25 files changed, 110 insertions(+), 110 deletions(-)
 rename meta-efl/recipes-efl/efl/{ecore_1.7.2.bb => ecore_1.7.3.bb} (50%)
 rename meta-efl/recipes-efl/efl/{eeze_1.7.2.bb => edbus_1.7.3.bb} (41%)
 rename meta-efl/recipes-efl/efl/{edbus_1.7.2.bb => edje_1.7.3.bb} (41%)
 rename meta-efl/recipes-efl/efl/{edje_1.7.2.bb => eet_1.7.3.bb} (41%)
 rename meta-efl/recipes-efl/efl/{eet_1.7.2.bb => eeze_1.7.3.bb} (41%)
 delete mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.2.bb
 create mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.3.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eina_1.7.2.bb
 create mode 100644 meta-efl/recipes-efl/efl/eina_1.7.3.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eio_1.7.2.bb
 create mode 100644 meta-efl/recipes-efl/efl/eio_1.7.3.bb
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.2.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.3.bb
 delete mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.2.bb
 create mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.3.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.2.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.3.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.2.bb
 create mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.3.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.2.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.3.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas_1.7.2.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas_1.7.3.bb
 delete mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.2.bb
 create mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.3.bb

diff --git a/meta-efl/recipes-efl/efl/ecore_1.7.2.bb b/meta-efl/recipes-efl/efl/ecore_1.7.3.bb
similarity index 50%
rename from meta-efl/recipes-efl/efl/ecore_1.7.2.bb
rename to meta-efl/recipes-efl/efl/ecore_1.7.3.bb
index 3679b71..d65309c 100644
--- a/meta-efl/recipes-efl/efl/ecore_1.7.2.bb
+++ b/meta-efl/recipes-efl/efl/ecore_1.7.3.bb
@@ -7,5 +7,5 @@ SRC_URI = "\
   file://fix-ecore-fb-initialization.patch \
 "
 
-SRC_URI[md5sum] = "f6d086ea8bbe64651dc3b5d2e840d106"
-SRC_URI[sha256sum] = "0b9642a67f0d977c2a13ed83ac02387c99309db92a72bf1031482df65ee4a1c7"
+SRC_URI[md5sum] = "355ae8ec2793c89dc93ced936d853b89"
+SRC_URI[sha256sum] = "0e2facbc89dbf5182b5bf5628bcdb37fa837e7b5978ce3f4bf9839cfe06a8830"
diff --git a/meta-efl/recipes-efl/efl/eeze_1.7.2.bb b/meta-efl/recipes-efl/efl/edbus_1.7.3.bb
similarity index 41%
rename from meta-efl/recipes-efl/efl/eeze_1.7.2.bb
rename to meta-efl/recipes-efl/efl/edbus_1.7.3.bb
index 4412629..d7c87aa 100644
--- a/meta-efl/recipes-efl/efl/eeze_1.7.2.bb
+++ b/meta-efl/recipes-efl/efl/edbus_1.7.3.bb
@@ -6,5 +6,5 @@ SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "4a5d466a00989fe03abd218608cd1d99"
-SRC_URI[sha256sum] = "fbbf42665a2618a2ca7a8080c7a2617cad819b24b3cb3c4f54417aab67ddac97"
+SRC_URI[md5sum] = "c1eaa663812a04dcd5bdf3ea952f19d6"
+SRC_URI[sha256sum] = "f893304271b1b233933cb66ed03810d02bc47794f8c23119f656304632d6b7c9"
diff --git a/meta-efl/recipes-efl/efl/edbus_1.7.2.bb b/meta-efl/recipes-efl/efl/edje_1.7.3.bb
similarity index 41%
rename from meta-efl/recipes-efl/efl/edbus_1.7.2.bb
rename to meta-efl/recipes-efl/efl/edje_1.7.3.bb
index 159517c..6232e72 100644
--- a/meta-efl/recipes-efl/efl/edbus_1.7.2.bb
+++ b/meta-efl/recipes-efl/efl/edje_1.7.3.bb
@@ -6,5 +6,5 @@ SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "c8b4c39efed63bdf503d45c8a94557a6"
-SRC_URI[sha256sum] = "e12146e7b6acca6a9f0fac5849a01ffcfa65004f7b1d5053cfb8c0e37d4dea98"
+SRC_URI[md5sum] = "b1901b4d98d1646b45ff27dfd9ff8b7c"
+SRC_URI[sha256sum] = "752c60f843b649d3bdfa51e78c13696ac1cd46374a8dbfe96c07cc7aba5381fb"
diff --git a/meta-efl/recipes-efl/efl/edje_1.7.2.bb b/meta-efl/recipes-efl/efl/eet_1.7.3.bb
similarity index 41%
rename from meta-efl/recipes-efl/efl/edje_1.7.2.bb
rename to meta-efl/recipes-efl/efl/eet_1.7.3.bb
index 43d9f46..1b1c96e 100644
--- a/meta-efl/recipes-efl/efl/edje_1.7.2.bb
+++ b/meta-efl/recipes-efl/efl/eet_1.7.3.bb
@@ -6,5 +6,5 @@ SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "20de3518260eeeed14f54e8d013e23c9"
-SRC_URI[sha256sum] = "fd512821f581b6d16998bac19e479ecf5a191940ba0e0b0a1250f6b04636d08c"
+SRC_URI[md5sum] = "6befcd8b1c12a44ff2c2c91bbbbe001b"
+SRC_URI[sha256sum] = "24c4f2fa8a186aa5e1a810beb58e03c806e26652f58aded6b1148c4cf44e98b3"
diff --git a/meta-efl/recipes-efl/efl/eet_1.7.2.bb b/meta-efl/recipes-efl/efl/eeze_1.7.3.bb
similarity index 41%
rename from meta-efl/recipes-efl/efl/eet_1.7.2.bb
rename to meta-efl/recipes-efl/efl/eeze_1.7.3.bb
index 27e5178..c80fc5f 100644
--- a/meta-efl/recipes-efl/efl/eet_1.7.2.bb
+++ b/meta-efl/recipes-efl/efl/eeze_1.7.3.bb
@@ -6,5 +6,5 @@ SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "fb3014a5227e466261a49eee5747597b"
-SRC_URI[sha256sum] = "03693c282db583d1a224d0134a61a3a138ad99cfa329f9c220f585bf8a4677f8"
+SRC_URI[md5sum] = "4ccc70135b1221a532206fb53c84e434"
+SRC_URI[sha256sum] = "22a47e477609dda00e8360f05648367c320289a7132cc2f012e830632da92c6b"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.7.2.bb b/meta-efl/recipes-efl/efl/efreet_1.7.2.bb
deleted file mode 100644
index 92499c9..0000000
--- a/meta-efl/recipes-efl/efl/efreet_1.7.2.bb
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
-SRC_URI[md5sum] = "7490ccdb57d298e6226b4f5cb956c5c5"
-SRC_URI[sha256sum] = "ebb8175664f9c486bd112a4915bda794ef0ecc68833bb6726cd76a395e64ab94"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.7.3.bb b/meta-efl/recipes-efl/efl/efreet_1.7.3.bb
new file mode 100644
index 0000000..f5ed47b
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/efreet_1.7.3.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "64a279b4568a769f657b9c9820a0bf74"
+SRC_URI[sha256sum] = "bc337d6c2cf80358d25e885c3c3dd3098cbedf1b5e4ef8d2acab41b4870648df"
diff --git a/meta-efl/recipes-efl/efl/eina_1.7.2.bb b/meta-efl/recipes-efl/efl/eina_1.7.2.bb
deleted file mode 100644
index 4feb9c2..0000000
--- a/meta-efl/recipes-efl/efl/eina_1.7.2.bb
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
-SRC_URI[md5sum] = "5d0453d6e7eb6f2c1b4e40b8c5be6f20"
-SRC_URI[sha256sum] = "caa1be5cdf3ed450472d4fa114983762bf40699adff506e6b493e4e37c842018"
diff --git a/meta-efl/recipes-efl/efl/eina_1.7.3.bb b/meta-efl/recipes-efl/efl/eina_1.7.3.bb
new file mode 100644
index 0000000..71319dd
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eina_1.7.3.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "00669561a82bad4df4a6268f1957ae40"
+SRC_URI[sha256sum] = "94e312367a8d04a7d69627e5a3bb1eb4bd8de9d165c0288400527808ef43f956"
diff --git a/meta-efl/recipes-efl/efl/eio_1.7.2.bb b/meta-efl/recipes-efl/efl/eio_1.7.2.bb
deleted file mode 100644
index cfdfe07..0000000
--- a/meta-efl/recipes-efl/efl/eio_1.7.2.bb
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
-SRC_URI[md5sum] = "b8e3b115a63f423a70ce7459c0b77d58"
-SRC_URI[sha256sum] = "c4af1062c27d2e0fef6d6919df39921c832553ff448628a5d9fe3704186a714b"
diff --git a/meta-efl/recipes-efl/efl/eio_1.7.3.bb b/meta-efl/recipes-efl/efl/eio_1.7.3.bb
new file mode 100644
index 0000000..e90df9c
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eio_1.7.3.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "968f7672eb6ee96e4bdd2bbfe55e5e8a"
+SRC_URI[sha256sum] = "f63c02f04edc6c53e29b41488ca3749a8cae5bed76803d60ad80be4ca117c635"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.7.2.bb b/meta-efl/recipes-efl/efl/elementary_1.7.2.bb
deleted file mode 100644
index dedc67d..0000000
--- a/meta-efl/recipes-efl/efl/elementary_1.7.2.bb
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
-SRC_URI[md5sum] = "589ae692eb8dbe73fa12b1587c8f877d"
-SRC_URI[sha256sum] = "582dd348e7dfcf76d7ec7fcfc3d4f6f8a73b653ffecf6979121a3bce190f98cf"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.7.3.bb b/meta-efl/recipes-efl/efl/elementary_1.7.3.bb
new file mode 100644
index 0000000..d066cb8
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elementary_1.7.3.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "2075fbbe8523027a3659ad08bfcf5a02"
+SRC_URI[sha256sum] = "043375ba63fa8619e053e9014566fc72f22522ef48daedcdfc62dfc1f3eb0a22"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.7.2.bb b/meta-efl/recipes-efl/efl/embryo_1.7.2.bb
deleted file mode 100644
index dcf2155..0000000
--- a/meta-efl/recipes-efl/efl/embryo_1.7.2.bb
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
-SRC_URI[md5sum] = "4dd84e5c7f515b707e4d0fac92b60cc8"
-SRC_URI[sha256sum] = "48e068da62f3bcad7fcf0dad6715f5a0c1cc75ae05529cc39679aeb7560d6803"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.7.3.bb b/meta-efl/recipes-efl/efl/embryo_1.7.3.bb
new file mode 100644
index 0000000..91bec48
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/embryo_1.7.3.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "eacc4e3a3534965469136a2e7cdd076b"
+SRC_URI[sha256sum] = "3a7388225ce97432e4324f5c2da4d4aaa3e711b8a6e92021b4edd47fbed5099a"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.7.2.bb b/meta-efl/recipes-efl/efl/emotion_1.7.2.bb
deleted file mode 100644
index fa681cb..0000000
--- a/meta-efl/recipes-efl/efl/emotion_1.7.2.bb
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
-SRC_URI[md5sum] = "e00a876a607cf6a99c5fc768d2fb69de"
-SRC_URI[sha256sum] = "a280b499a51b531a19c368c1f394b27dda4f6c1f5a0edd8f29036169a9402cef"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.7.3.bb b/meta-efl/recipes-efl/efl/emotion_1.7.3.bb
new file mode 100644
index 0000000..63578f5
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/emotion_1.7.3.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "aa1f96d4166edc154e773210e8ac8d21"
+SRC_URI[sha256sum] = "93f5f00127176701b946d0db941d5209c5ca13659e184a31c0883ac1e145ce5d"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.7.2.bb b/meta-efl/recipes-efl/efl/ethumb_1.7.2.bb
deleted file mode 100644
index d5e1cea..0000000
--- a/meta-efl/recipes-efl/efl/ethumb_1.7.2.bb
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
-SRC_URI[md5sum] = "33f8de3b590269b7dbe6960a0337b30f"
-SRC_URI[sha256sum] = "6dcdf94224903c17ac753a388e6a2d0c23ce525859db93f022c3cd2b8f9afe72"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.7.3.bb b/meta-efl/recipes-efl/efl/ethumb_1.7.3.bb
new file mode 100644
index 0000000..2a5e275
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/ethumb_1.7.3.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "7394c4776a980490aea0bea5e35f05a4"
+SRC_URI[sha256sum] = "25090565d995029a4fb57ac82ded1470b1beb8c23eeadaf713a30ca0cf58bb29"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.2.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.2.bb
deleted file mode 100644
index e37de87..0000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.2.bb
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
-SRC_URI[md5sum] = "991f0ce50e203419f54cb148fb949bb9"
-SRC_URI[sha256sum] = "0ca06936cfe308593c36eb80ac80ad229f2bc3bdc9270b75f96e09595194caae"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.3.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.3.bb
new file mode 100644
index 0000000..3f2e63d
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.3.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "e188843ccf4cdcf31f9645fdd28c9567"
+SRC_URI[sha256sum] = "98bf7896535ca9d454bbc5b84b59c619a4b0ac80fadd067a102d20f1a9ea5db0"
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.2.bb b/meta-efl/recipes-efl/efl/evas_1.7.2.bb
deleted file mode 100644
index e9171f9..0000000
--- a/meta-efl/recipes-efl/efl/evas_1.7.2.bb
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
-SRC_URI[md5sum] = "4e412c79609ae107968c9c45c4b900c0"
-SRC_URI[sha256sum] = "2076608e6a9ac3331b17357c152b640ea0f3eccad24a9c270ad325d5434ab811"
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.3.bb b/meta-efl/recipes-efl/efl/evas_1.7.3.bb
new file mode 100644
index 0000000..8dc4d32
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas_1.7.3.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "2a5bab8f87569d770b4a95fc0a382be4"
+SRC_URI[sha256sum] = "d47cb26a384e6d523aa18df4fd558d0415165322ba714b83d99799e8531c617b"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.7.2.bb b/meta-efl/recipes-efl/efl/expedite_1.7.2.bb
deleted file mode 100644
index e7f5926..0000000
--- a/meta-efl/recipes-efl/efl/expedite_1.7.2.bb
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
-SRC_URI[md5sum] = "f7bbf5dc5bc1212d3116c5452b4a3510"
-SRC_URI[sha256sum] = "f8a4214e3d210396b267325268ba6fcc31a42634fab5bf2efcbc595dbfb2c25f"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.7.3.bb b/meta-efl/recipes-efl/efl/expedite_1.7.3.bb
new file mode 100644
index 0000000..f109a80
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/expedite_1.7.3.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "e13456be6c8c6276baeefa2b91d14e7b"
+SRC_URI[sha256sum] = "4b9ec22d25d5847998cd9a60ba2edd47e5e217183e661e60b8440252c62f916f"
-- 
1.8.0.2



