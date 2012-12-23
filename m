Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tmknh-0000l7-Sv
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:37:06 +0100
Received: by mail-ea0-f182.google.com with SMTP id a14so2500175eaa.27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=Se9BH9pT0kCxJPwIDaIlFYDFlRqxqZ30hwdq/PyjOCc=;
	b=XuJrAX+IEUsiH7Y6CVQIAGPnAQo/PPzhOpc75nSitaOdJcKKSKzxo4emxq87auxQnX
	6R3u9nriI34+Kvfmv3liGr/RUh10XSS+a0GOKY/k8e2idvh5aEoQLz65kDLgo6aG2p5z
	swOzAJFMZClkvHsERElg1AfqhoaIgXseTUz+fD/10+wpnB8Y188yODYMsgX8uTiHfP9+
	0JWq0q4bDWCXN11D/DkLFO4YBGDE0gxJ4WOsxlfL662cyxuI9/tQkPuCKhLgOYq46RfE
	kpxemCuoP0f209m+VThbDh5EVtd2neh/lISkQmiok3Vo+huixl6txv43Wpzqnyt6rvCt
	JY9g==
X-Received: by 10.14.0.133 with SMTP id 5mr47372688eeb.29.1356265337617;
	Sun, 23 Dec 2012 04:22:17 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w3sm34605091eel.17.2012.12.23.04.22.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:22:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:27 +0100
Message-Id: <ded035f8d93524afb3259d4f8c0bbf6d02fd7654.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 02/30] meta-efl: upgrade efl to 1.7.4
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
X-List-Received-Date: Sun, 23 Dec 2012 12:37:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/{ecore_1.7.3.bb => ecore_1.7.4.bb} |  4 ++--
 meta-efl/recipes-efl/efl/{eeze_1.7.3.bb => edbus_1.7.4.bb}  |  4 ++--
 meta-efl/recipes-efl/efl/{edbus_1.7.3.bb => edje_1.7.4.bb}  |  4 ++--
 meta-efl/recipes-efl/efl/{edje_1.7.3.bb => eet_1.7.4.bb}    |  4 ++--
 meta-efl/recipes-efl/efl/{eet_1.7.3.bb => eeze_1.7.4.bb}    |  4 ++--
 meta-efl/recipes-efl/efl/efreet_1.7.3.bb                    | 10 ----------
 meta-efl/recipes-efl/efl/efreet_1.7.4.bb                    | 10 ++++++++++
 meta-efl/recipes-efl/efl/eina_1.7.3.bb                      | 10 ----------
 meta-efl/recipes-efl/efl/eina_1.7.4.bb                      | 10 ++++++++++
 meta-efl/recipes-efl/efl/eio_1.7.3.bb                       | 10 ----------
 meta-efl/recipes-efl/efl/eio_1.7.4.bb                       | 10 ++++++++++
 meta-efl/recipes-efl/efl/elementary_1.7.3.bb                | 10 ----------
 meta-efl/recipes-efl/efl/elementary_1.7.4.bb                | 10 ++++++++++
 meta-efl/recipes-efl/efl/embryo_1.7.3.bb                    | 10 ----------
 meta-efl/recipes-efl/efl/embryo_1.7.4.bb                    | 10 ++++++++++
 meta-efl/recipes-efl/efl/emotion_1.7.3.bb                   | 10 ----------
 meta-efl/recipes-efl/efl/emotion_1.7.4.bb                   | 10 ++++++++++
 meta-efl/recipes-efl/efl/ethumb_1.7.3.bb                    | 10 ----------
 meta-efl/recipes-efl/efl/ethumb_1.7.4.bb                    | 10 ++++++++++
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.3.bb      | 10 ----------
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.4.bb      | 10 ++++++++++
 meta-efl/recipes-efl/efl/evas_1.7.3.bb                      | 10 ----------
 meta-efl/recipes-efl/efl/evas_1.7.4.bb                      | 10 ++++++++++
 meta-efl/recipes-efl/efl/expedite_1.7.3.bb                  | 10 ----------
 meta-efl/recipes-efl/efl/expedite_1.7.4.bb                  | 10 ++++++++++
 25 files changed, 110 insertions(+), 110 deletions(-)
 rename meta-efl/recipes-efl/efl/{ecore_1.7.3.bb => ecore_1.7.4.bb} (50%)
 rename meta-efl/recipes-efl/efl/{eeze_1.7.3.bb => edbus_1.7.4.bb} (41%)
 rename meta-efl/recipes-efl/efl/{edbus_1.7.3.bb => edje_1.7.4.bb} (41%)
 rename meta-efl/recipes-efl/efl/{edje_1.7.3.bb => eet_1.7.4.bb} (41%)
 rename meta-efl/recipes-efl/efl/{eet_1.7.3.bb => eeze_1.7.4.bb} (41%)
 delete mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.3.bb
 create mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.4.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eina_1.7.3.bb
 create mode 100644 meta-efl/recipes-efl/efl/eina_1.7.4.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eio_1.7.3.bb
 create mode 100644 meta-efl/recipes-efl/efl/eio_1.7.4.bb
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.3.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.4.bb
 delete mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.3.bb
 create mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.4.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.3.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.4.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.3.bb
 create mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.4.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.3.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.4.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas_1.7.3.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas_1.7.4.bb
 delete mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.3.bb
 create mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.4.bb

diff --git a/meta-efl/recipes-efl/efl/ecore_1.7.3.bb b/meta-efl/recipes-efl/efl/ecore_1.7.4.bb
similarity index 50%
rename from meta-efl/recipes-efl/efl/ecore_1.7.3.bb
rename to meta-efl/recipes-efl/efl/ecore_1.7.4.bb
index d65309c..bc59b2b 100644
--- a/meta-efl/recipes-efl/efl/ecore_1.7.3.bb
+++ b/meta-efl/recipes-efl/efl/ecore_1.7.4.bb
@@ -7,5 +7,5 @@ SRC_URI = "\
   file://fix-ecore-fb-initialization.patch \
 "
 
-SRC_URI[md5sum] = "355ae8ec2793c89dc93ced936d853b89"
-SRC_URI[sha256sum] = "0e2facbc89dbf5182b5bf5628bcdb37fa837e7b5978ce3f4bf9839cfe06a8830"
+SRC_URI[md5sum] = "3b1aa01bffb10d4266545fe4a823bb47"
+SRC_URI[sha256sum] = "2fc1d202c688466b0f33e21c3b892c7610ae5f89835475a1ebdb22c72c0d9116"
diff --git a/meta-efl/recipes-efl/efl/eeze_1.7.3.bb b/meta-efl/recipes-efl/efl/edbus_1.7.4.bb
similarity index 41%
rename from meta-efl/recipes-efl/efl/eeze_1.7.3.bb
rename to meta-efl/recipes-efl/efl/edbus_1.7.4.bb
index c80fc5f..6ba64be 100644
--- a/meta-efl/recipes-efl/efl/eeze_1.7.3.bb
+++ b/meta-efl/recipes-efl/efl/edbus_1.7.4.bb
@@ -6,5 +6,5 @@ SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "4ccc70135b1221a532206fb53c84e434"
-SRC_URI[sha256sum] = "22a47e477609dda00e8360f05648367c320289a7132cc2f012e830632da92c6b"
+SRC_URI[md5sum] = "eaae06263de72944c0e818205c555b8b"
+SRC_URI[sha256sum] = "17a63299957f80c2f9d13945dab2b28933f3eda7a7a2c0fff17dcc6cc5dc83a4"
diff --git a/meta-efl/recipes-efl/efl/edbus_1.7.3.bb b/meta-efl/recipes-efl/efl/edje_1.7.4.bb
similarity index 41%
rename from meta-efl/recipes-efl/efl/edbus_1.7.3.bb
rename to meta-efl/recipes-efl/efl/edje_1.7.4.bb
index d7c87aa..a6ec0be 100644
--- a/meta-efl/recipes-efl/efl/edbus_1.7.3.bb
+++ b/meta-efl/recipes-efl/efl/edje_1.7.4.bb
@@ -6,5 +6,5 @@ SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "c1eaa663812a04dcd5bdf3ea952f19d6"
-SRC_URI[sha256sum] = "f893304271b1b233933cb66ed03810d02bc47794f8c23119f656304632d6b7c9"
+SRC_URI[md5sum] = "fcd3749e41041854503b578e690cc672"
+SRC_URI[sha256sum] = "7b81f512bd7cabfbe787d2bfd2d6c622c9ce151684ee57017c1bb1616f5d0e51"
diff --git a/meta-efl/recipes-efl/efl/edje_1.7.3.bb b/meta-efl/recipes-efl/efl/eet_1.7.4.bb
similarity index 41%
rename from meta-efl/recipes-efl/efl/edje_1.7.3.bb
rename to meta-efl/recipes-efl/efl/eet_1.7.4.bb
index 6232e72..2872af7 100644
--- a/meta-efl/recipes-efl/efl/edje_1.7.3.bb
+++ b/meta-efl/recipes-efl/efl/eet_1.7.4.bb
@@ -6,5 +6,5 @@ SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "b1901b4d98d1646b45ff27dfd9ff8b7c"
-SRC_URI[sha256sum] = "752c60f843b649d3bdfa51e78c13696ac1cd46374a8dbfe96c07cc7aba5381fb"
+SRC_URI[md5sum] = "e7d68ed52d1eafa0998e74fab9c22e97"
+SRC_URI[sha256sum] = "60f0cdc627806256e81c685080b97a10f348a53f9198360ff1c67ca0547ed806"
diff --git a/meta-efl/recipes-efl/efl/eet_1.7.3.bb b/meta-efl/recipes-efl/efl/eeze_1.7.4.bb
similarity index 41%
rename from meta-efl/recipes-efl/efl/eet_1.7.3.bb
rename to meta-efl/recipes-efl/efl/eeze_1.7.4.bb
index 1b1c96e..aea04cb 100644
--- a/meta-efl/recipes-efl/efl/eet_1.7.3.bb
+++ b/meta-efl/recipes-efl/efl/eeze_1.7.4.bb
@@ -6,5 +6,5 @@ SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "6befcd8b1c12a44ff2c2c91bbbbe001b"
-SRC_URI[sha256sum] = "24c4f2fa8a186aa5e1a810beb58e03c806e26652f58aded6b1148c4cf44e98b3"
+SRC_URI[md5sum] = "3728318ac1a90980a608e4a1780d5d98"
+SRC_URI[sha256sum] = "a70d2a3404c08a85a733111a90fae2fa7a3411478907963ade7f0f10216bb51c"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.7.3.bb b/meta-efl/recipes-efl/efl/efreet_1.7.3.bb
deleted file mode 100644
index f5ed47b..0000000
--- a/meta-efl/recipes-efl/efl/efreet_1.7.3.bb
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
-SRC_URI[md5sum] = "64a279b4568a769f657b9c9820a0bf74"
-SRC_URI[sha256sum] = "bc337d6c2cf80358d25e885c3c3dd3098cbedf1b5e4ef8d2acab41b4870648df"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.7.4.bb b/meta-efl/recipes-efl/efl/efreet_1.7.4.bb
new file mode 100644
index 0000000..ee6b736
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/efreet_1.7.4.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "439cb27888cc1e6bf6ec5bd23512df7e"
+SRC_URI[sha256sum] = "30c757294d662ef618227fb7fb02a0f73a781f0d31bcb393970b6c7a931729e0"
diff --git a/meta-efl/recipes-efl/efl/eina_1.7.3.bb b/meta-efl/recipes-efl/efl/eina_1.7.3.bb
deleted file mode 100644
index 71319dd..0000000
--- a/meta-efl/recipes-efl/efl/eina_1.7.3.bb
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
-SRC_URI[md5sum] = "00669561a82bad4df4a6268f1957ae40"
-SRC_URI[sha256sum] = "94e312367a8d04a7d69627e5a3bb1eb4bd8de9d165c0288400527808ef43f956"
diff --git a/meta-efl/recipes-efl/efl/eina_1.7.4.bb b/meta-efl/recipes-efl/efl/eina_1.7.4.bb
new file mode 100644
index 0000000..f4fb76b
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eina_1.7.4.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "e5f60ff5a227abd6121c6749000aa0f7"
+SRC_URI[sha256sum] = "baff603d614da0b52d505544f18c670e7dfd700e0c1df5ea56284ba3d737c7ee"
diff --git a/meta-efl/recipes-efl/efl/eio_1.7.3.bb b/meta-efl/recipes-efl/efl/eio_1.7.3.bb
deleted file mode 100644
index e90df9c..0000000
--- a/meta-efl/recipes-efl/efl/eio_1.7.3.bb
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
-SRC_URI[md5sum] = "968f7672eb6ee96e4bdd2bbfe55e5e8a"
-SRC_URI[sha256sum] = "f63c02f04edc6c53e29b41488ca3749a8cae5bed76803d60ad80be4ca117c635"
diff --git a/meta-efl/recipes-efl/efl/eio_1.7.4.bb b/meta-efl/recipes-efl/efl/eio_1.7.4.bb
new file mode 100644
index 0000000..4e36a32
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eio_1.7.4.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "f2e4b4e4c04e83bc9533ef7938b51218"
+SRC_URI[sha256sum] = "5d1233d8bf2ab9d955ab0682b8fa1c15fe5905a543820c3255a16d1c49ec33c1"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.7.3.bb b/meta-efl/recipes-efl/efl/elementary_1.7.3.bb
deleted file mode 100644
index d066cb8..0000000
--- a/meta-efl/recipes-efl/efl/elementary_1.7.3.bb
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
-SRC_URI[md5sum] = "2075fbbe8523027a3659ad08bfcf5a02"
-SRC_URI[sha256sum] = "043375ba63fa8619e053e9014566fc72f22522ef48daedcdfc62dfc1f3eb0a22"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.7.4.bb b/meta-efl/recipes-efl/efl/elementary_1.7.4.bb
new file mode 100644
index 0000000..b81f743
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elementary_1.7.4.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "cf2ca073656ebac36c26df4fa4debdee"
+SRC_URI[sha256sum] = "92ffb1a12883cd7d599e428a28501e4ce411db9839c698bb4095c9a1a470dccb"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.7.3.bb b/meta-efl/recipes-efl/efl/embryo_1.7.3.bb
deleted file mode 100644
index 91bec48..0000000
--- a/meta-efl/recipes-efl/efl/embryo_1.7.3.bb
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
-SRC_URI[md5sum] = "eacc4e3a3534965469136a2e7cdd076b"
-SRC_URI[sha256sum] = "3a7388225ce97432e4324f5c2da4d4aaa3e711b8a6e92021b4edd47fbed5099a"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.7.4.bb b/meta-efl/recipes-efl/efl/embryo_1.7.4.bb
new file mode 100644
index 0000000..818ce54
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/embryo_1.7.4.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "f4e3350587108bfe9719b496689dccc9"
+SRC_URI[sha256sum] = "300fe9750a2affebc6b3f94356dbc719d01a34054b2c7fc81a49f3e38a7ca975"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.7.3.bb b/meta-efl/recipes-efl/efl/emotion_1.7.3.bb
deleted file mode 100644
index 63578f5..0000000
--- a/meta-efl/recipes-efl/efl/emotion_1.7.3.bb
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
-SRC_URI[md5sum] = "aa1f96d4166edc154e773210e8ac8d21"
-SRC_URI[sha256sum] = "93f5f00127176701b946d0db941d5209c5ca13659e184a31c0883ac1e145ce5d"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.7.4.bb b/meta-efl/recipes-efl/efl/emotion_1.7.4.bb
new file mode 100644
index 0000000..9e52fa4
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/emotion_1.7.4.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "402e1da5f5281607585c860012200b49"
+SRC_URI[sha256sum] = "5af9e0111ff519aa63adba48c91150ae4d6eb5697ec5fd8ad20016a7ed44f1ea"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.7.3.bb b/meta-efl/recipes-efl/efl/ethumb_1.7.3.bb
deleted file mode 100644
index 2a5e275..0000000
--- a/meta-efl/recipes-efl/efl/ethumb_1.7.3.bb
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
-SRC_URI[md5sum] = "7394c4776a980490aea0bea5e35f05a4"
-SRC_URI[sha256sum] = "25090565d995029a4fb57ac82ded1470b1beb8c23eeadaf713a30ca0cf58bb29"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.7.4.bb b/meta-efl/recipes-efl/efl/ethumb_1.7.4.bb
new file mode 100644
index 0000000..8917e27
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/ethumb_1.7.4.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "ca3b3d7263756ab3456e559e36f190a0"
+SRC_URI[sha256sum] = "b3f19f79a3dbcfce25f939eaf4f65b9ab734d32e6af6a008293aee50a16ba53d"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.3.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.3.bb
deleted file mode 100644
index 3f2e63d..0000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.3.bb
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
-SRC_URI[md5sum] = "e188843ccf4cdcf31f9645fdd28c9567"
-SRC_URI[sha256sum] = "98bf7896535ca9d454bbc5b84b59c619a4b0ac80fadd067a102d20f1a9ea5db0"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.4.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.4.bb
new file mode 100644
index 0000000..7a96210
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.4.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "2edde882521b30a4cc3ce092a1ef86d0"
+SRC_URI[sha256sum] = "900404a946f7169efe3c21e9960225dd2277e14ac0e75e597160861bd41b632e"
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.3.bb b/meta-efl/recipes-efl/efl/evas_1.7.3.bb
deleted file mode 100644
index 8dc4d32..0000000
--- a/meta-efl/recipes-efl/efl/evas_1.7.3.bb
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
-SRC_URI[md5sum] = "2a5bab8f87569d770b4a95fc0a382be4"
-SRC_URI[sha256sum] = "d47cb26a384e6d523aa18df4fd558d0415165322ba714b83d99799e8531c617b"
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.4.bb b/meta-efl/recipes-efl/efl/evas_1.7.4.bb
new file mode 100644
index 0000000..56faeb3
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas_1.7.4.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "33a70651fd3d73c3d928b9c5362d5aac"
+SRC_URI[sha256sum] = "a3e19a0bbad3cfafc314c46baa0b5250382809bc04e458bd0c02b5ce68a29da6"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.7.3.bb b/meta-efl/recipes-efl/efl/expedite_1.7.3.bb
deleted file mode 100644
index f109a80..0000000
--- a/meta-efl/recipes-efl/efl/expedite_1.7.3.bb
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
-SRC_URI[md5sum] = "e13456be6c8c6276baeefa2b91d14e7b"
-SRC_URI[sha256sum] = "4b9ec22d25d5847998cd9a60ba2edd47e5e217183e661e60b8440252c62f916f"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.7.4.bb b/meta-efl/recipes-efl/efl/expedite_1.7.4.bb
new file mode 100644
index 0000000..7b2e071
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/expedite_1.7.4.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "bf8d20bc35b28ff5696781eac4685681"
+SRC_URI[sha256sum] = "3fdb6d56ac5de4ea40ad00f0d3a2b8dc3018be29f9ddb148ec3cd1ed5006e50a"
-- 
1.8.0.2



