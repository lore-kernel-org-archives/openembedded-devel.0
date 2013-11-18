Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5DF296D06A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 22:21:13 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b57so2838221eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 14:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=x3Jy4x+48j85fd/usQ7lYYFsypFiHx1eq9aXH5WEos0=;
	b=jqDiGqjbuC217ORrrjxEIbi2S25b1oGOclIQddvrERRG+YVCf55vsVK6fnF8Hj9vNa
	cWccyTM9+3yrqcJ8Ynub/4DOScp5D67webM0+VXGrXl8VqFr/uHD9MHrgu++F5cE3TdI
	2cjhdAVlWLd2DtMx18HwuGx2bOuyc3lRT4nhBlDgioRsG/cowgCDNf3t1ZcP7gH1RHqC
	VV3N5z76EDuerjQxxfoKloWNvSsmCPfTLYm09Ub3DNOu0EoCn811eL5tijJMRH9yeGUH
	UPdyWoxZICAtKIBTTWW7GZz50M8epwnCUma6X1X3ZiYR5km0IQu0Arp8tnL5NJ4e33pw
	WhJA==
X-Received: by 10.14.32.196 with SMTP id o44mr15824928eea.43.1384813274641;
	Mon, 18 Nov 2013 14:21:14 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a6sm42073086eei.10.2013.11.18.14.21.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2013 14:21:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Nov 2013 23:21:09 +0100
Message-Id: <1384813274-7231-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [meta-oe][PATCH 1/6] meta-efl: upgrade efl to 1.7.9, e-wm to 0.17.5
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
X-List-Received-Date: Mon, 18 Nov 2013 22:21:13 -0000

* announcement:
  http://www.mail-archive.com/enlightenment-devel@lists.sourceforge.net/msg56588.html
* most likely last bump I'll do in meta-efl before upgrading recipes to 1.8

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/{e-wm_0.17.4.bb => e-wm_0.17.5.bb}     | 4 ++--
 meta-efl/recipes-efl/efl/{ecore_1.7.8.bb => ecore_1.7.9.bb}     | 4 ++--
 meta-efl/recipes-efl/efl/edbus_1.7.8.bb                         | 8 --------
 meta-efl/recipes-efl/efl/edbus_1.7.9.bb                         | 8 ++++++++
 meta-efl/recipes-efl/efl/{edje_1.7.8.bb => edje_1.7.9.bb}       | 4 ++--
 meta-efl/recipes-efl/efl/{eet_1.7.8.bb => eet_1.7.9.bb}         | 4 ++--
 meta-efl/recipes-efl/efl/{eeze_1.7.8.bb => eeze_1.7.9.bb}       | 4 ++--
 meta-efl/recipes-efl/efl/{efreet_1.7.8.bb => efreet_1.7.9.bb}   | 4 ++--
 meta-efl/recipes-efl/efl/{eina_1.7.8.bb => eina_1.7.9.bb}       | 4 ++--
 meta-efl/recipes-efl/efl/{eio_1.7.8.bb => eio_1.7.9.bb}         | 4 ++--
 meta-efl/recipes-efl/efl/elementary_1.7.8.bb                    | 8 --------
 meta-efl/recipes-efl/efl/elementary_1.7.9.bb                    | 8 ++++++++
 meta-efl/recipes-efl/efl/{embryo_1.7.8.bb => embryo_1.7.9.bb}   | 4 ++--
 meta-efl/recipes-efl/efl/{emotion_1.7.8.bb => emotion_1.7.9.bb} | 4 ++--
 meta-efl/recipes-efl/efl/{ethumb_1.7.8.bb => ethumb_1.7.9.bb}   | 4 ++--
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.8.bb          | 8 --------
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.9.bb          | 8 ++++++++
 meta-efl/recipes-efl/efl/{evas_1.7.8.bb => evas_1.7.9.bb}       | 4 ++--
 meta-efl/recipes-efl/efl/expedite_1.7.8.bb                      | 8 --------
 meta-efl/recipes-efl/efl/expedite_1.7.9.bb                      | 8 ++++++++
 20 files changed, 56 insertions(+), 56 deletions(-)
 rename meta-efl/recipes-efl/e17/{e-wm_0.17.4.bb => e-wm_0.17.5.bb} (59%)
 rename meta-efl/recipes-efl/efl/{ecore_1.7.8.bb => ecore_1.7.9.bb} (96%)
 delete mode 100644 meta-efl/recipes-efl/efl/edbus_1.7.8.bb
 create mode 100644 meta-efl/recipes-efl/efl/edbus_1.7.9.bb
 rename meta-efl/recipes-efl/efl/{edje_1.7.8.bb => edje_1.7.9.bb} (93%)
 rename meta-efl/recipes-efl/efl/{eet_1.7.8.bb => eet_1.7.9.bb} (79%)
 rename meta-efl/recipes-efl/efl/{eeze_1.7.8.bb => eeze_1.7.9.bb} (77%)
 rename meta-efl/recipes-efl/efl/{efreet_1.7.8.bb => efreet_1.7.9.bb} (81%)
 rename meta-efl/recipes-efl/efl/{eina_1.7.8.bb => eina_1.7.9.bb} (70%)
 rename meta-efl/recipes-efl/efl/{eio_1.7.8.bb => eio_1.7.9.bb} (65%)
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.8.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.9.bb
 rename meta-efl/recipes-efl/efl/{embryo_1.7.8.bb => embryo_1.7.9.bb} (71%)
 rename meta-efl/recipes-efl/efl/{emotion_1.7.8.bb => emotion_1.7.9.bb} (83%)
 rename meta-efl/recipes-efl/efl/{ethumb_1.7.8.bb => ethumb_1.7.9.bb} (80%)
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.8.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.9.bb
 rename meta-efl/recipes-efl/efl/{evas_1.7.8.bb => evas_1.7.9.bb} (97%)
 delete mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.8.bb
 create mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.9.bb

diff --git a/meta-efl/recipes-efl/e17/e-wm_0.17.4.bb b/meta-efl/recipes-efl/e17/e-wm_0.17.5.bb
similarity index 59%
rename from meta-efl/recipes-efl/e17/e-wm_0.17.4.bb
rename to meta-efl/recipes-efl/e17/e-wm_0.17.5.bb
index 6d64620..57eefdb 100644
--- a/meta-efl/recipes-efl/e17/e-wm_0.17.4.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_0.17.5.bb
@@ -10,5 +10,5 @@ SRC_URI = "\
     file://applications.menu \
 "
 
-SRC_URI[md5sum] = "ce3b7c8f05975521bdfe1edb72c8e245"
-SRC_URI[sha256sum] = "090447607c850f98ce8c2089c55e15d77b35a9014eddff9119f38b0e0e49f0b7"
+SRC_URI[md5sum] = "5aefb55df0b1a0a0ae0cf9d0610cf7c7"
+SRC_URI[sha256sum] = "25d4967277cf27d4efb474a9b8eceb1200aa813a51c248b61cc23f69291bff0f"
diff --git a/meta-efl/recipes-efl/efl/ecore_1.7.8.bb b/meta-efl/recipes-efl/efl/ecore_1.7.9.bb
similarity index 96%
rename from meta-efl/recipes-efl/efl/ecore_1.7.8.bb
rename to meta-efl/recipes-efl/efl/ecore_1.7.9.bb
index 0f09160..c34eb27 100644
--- a/meta-efl/recipes-efl/efl/ecore_1.7.8.bb
+++ b/meta-efl/recipes-efl/efl/ecore_1.7.9.bb
@@ -120,5 +120,5 @@ SRC_URI = "\
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[wayland] = "--enable-ecore-wayland,--disable-ecore-wayland,wayland xkbcommon"
 
-SRC_URI[md5sum] = "5a8ca096d8c15647b2493d4664a4b895"
-SRC_URI[sha256sum] = "26cb1dc02213a221fdec32ef4ea4ece608e5239bdbd19c9d62b09cf931863738"
+SRC_URI[md5sum] = "2d5a4fb8f702628f5c7b785309be01ab"
+SRC_URI[sha256sum] = "c145cc00280d3a310c76e5e6a9fb509c81b8b173f04458c97ea4ae6bf563eaf3"
diff --git a/meta-efl/recipes-efl/efl/edbus_1.7.8.bb b/meta-efl/recipes-efl/efl/edbus_1.7.8.bb
deleted file mode 100644
index a9250e9..0000000
--- a/meta-efl/recipes-efl/efl/edbus_1.7.8.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "8711070b57873b2b2a0024b198e50906"
-SRC_URI[sha256sum] = "9e94f1c522ac9faec991cd90c91e4e26b355909dbba21b42585359841937af78"
diff --git a/meta-efl/recipes-efl/efl/edbus_1.7.9.bb b/meta-efl/recipes-efl/efl/edbus_1.7.9.bb
new file mode 100644
index 0000000..64e77e6
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/edbus_1.7.9.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "8f72da14e5664aad8c45eeeca0e3ff5f"
+SRC_URI[sha256sum] = "c328c4cf1424629cb67c83689ccc1f95967abcb4c03dffd437e93b799ff151c1"
diff --git a/meta-efl/recipes-efl/efl/edje_1.7.8.bb b/meta-efl/recipes-efl/efl/edje_1.7.9.bb
similarity index 93%
rename from meta-efl/recipes-efl/efl/edje_1.7.8.bb
rename to meta-efl/recipes-efl/efl/edje_1.7.9.bb
index ed43c32..2e8c566 100644
--- a/meta-efl/recipes-efl/efl/edje_1.7.8.bb
+++ b/meta-efl/recipes-efl/efl/edje_1.7.9.bb
@@ -68,5 +68,5 @@ SRC_URI = "\
     ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "06399e95de312de12342df8f16c7c885"
-SRC_URI[sha256sum] = "924eae1be1fe755997be8074d32af4b6a83ed7e57057edccb2cf46b83c33202d"
+SRC_URI[md5sum] = "49152d8636aefcd028af0f97483391ef"
+SRC_URI[sha256sum] = "dac12e5fd81ab303151bec6742971b63f2de577ef940ed0b6af20419130300ab"
diff --git a/meta-efl/recipes-efl/efl/eet_1.7.8.bb b/meta-efl/recipes-efl/efl/eet_1.7.9.bb
similarity index 79%
rename from meta-efl/recipes-efl/efl/eet_1.7.8.bb
rename to meta-efl/recipes-efl/efl/eet_1.7.9.bb
index 8258973..9521e68 100644
--- a/meta-efl/recipes-efl/efl/eet_1.7.8.bb
+++ b/meta-efl/recipes-efl/efl/eet_1.7.9.bb
@@ -26,5 +26,5 @@ SRC_URI = "\
     ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "2db9527a95412af26df8f79429ffcc95"
-SRC_URI[sha256sum] = "faad73b713c08f8f3c9ed76a0f8e4161f969e5ec8215db1dd5108d3f6eeb3a20"
+SRC_URI[md5sum] = "225eadf514465be321a44a003d687a55"
+SRC_URI[sha256sum] = "3345e0889bbc29536dbe0f6236ed1ae6a9d685b8e39877d5404fa6217bd12ec6"
diff --git a/meta-efl/recipes-efl/efl/eeze_1.7.8.bb b/meta-efl/recipes-efl/efl/eeze_1.7.9.bb
similarity index 77%
rename from meta-efl/recipes-efl/efl/eeze_1.7.8.bb
rename to meta-efl/recipes-efl/efl/eeze_1.7.9.bb
index f081f33..7ae7fbb 100644
--- a/meta-efl/recipes-efl/efl/eeze_1.7.8.bb
+++ b/meta-efl/recipes-efl/efl/eeze_1.7.9.bb
@@ -19,5 +19,5 @@ SRC_URI = "\
     ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "3ee68667f65860a0bdb7126e555155ff"
-SRC_URI[sha256sum] = "9a4df9d086575c54d0116164d46b2c9e29362cc32398ea606c2365cbdf4157dd"
+SRC_URI[md5sum] = "1e6119b4c12f2539ae5d191659652a89"
+SRC_URI[sha256sum] = "1b4b38943bfc564ddd18d4314a6a12af5ce656b551e69154e818ad14231050b8"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.7.8.bb b/meta-efl/recipes-efl/efl/efreet_1.7.9.bb
similarity index 81%
rename from meta-efl/recipes-efl/efl/efreet_1.7.8.bb
rename to meta-efl/recipes-efl/efl/efreet_1.7.9.bb
index e7abdaa..0d87eb7 100644
--- a/meta-efl/recipes-efl/efl/efreet_1.7.8.bb
+++ b/meta-efl/recipes-efl/efl/efreet_1.7.9.bb
@@ -18,5 +18,5 @@ SRC_URI = "\
     ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "42ccb6672be6c3cbd7359c9b71a8e587"
-SRC_URI[sha256sum] = "b462c6d230af00d052674e175dbd269f1a4aa0ea510f704b2118895429127426"
+SRC_URI[md5sum] = "5972833cf78ca93440403b94ed4ed74d"
+SRC_URI[sha256sum] = "d5037c04ac8130879bf87d924e6b83cf479e7dee8235321ed1a49f97083b611b"
diff --git a/meta-efl/recipes-efl/efl/eina_1.7.8.bb b/meta-efl/recipes-efl/efl/eina_1.7.9.bb
similarity index 70%
rename from meta-efl/recipes-efl/efl/eina_1.7.8.bb
rename to meta-efl/recipes-efl/efl/eina_1.7.9.bb
index 68a6667..3638123 100644
--- a/meta-efl/recipes-efl/efl/eina_1.7.8.bb
+++ b/meta-efl/recipes-efl/efl/eina_1.7.9.bb
@@ -15,5 +15,5 @@ SRC_URI = "\
     ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "4c7715b636f71a5e07be4f33e72c6a69"
-SRC_URI[sha256sum] = "e39c5d9cc9d0854521983fe653b8f2efe2946e74066c7c0456ffe62342535d18"
+SRC_URI[md5sum] = "cddf2755e20bfb3f90764fd2b689b888"
+SRC_URI[sha256sum] = "b7fe26d98b80479d0f72be47b2584dfa243e4d18774cb824acc398354a45d520"
diff --git a/meta-efl/recipes-efl/efl/eio_1.7.8.bb b/meta-efl/recipes-efl/efl/eio_1.7.9.bb
similarity index 65%
rename from meta-efl/recipes-efl/efl/eio_1.7.8.bb
rename to meta-efl/recipes-efl/efl/eio_1.7.9.bb
index f5827da..5bf34b2 100644
--- a/meta-efl/recipes-efl/efl/eio_1.7.8.bb
+++ b/meta-efl/recipes-efl/efl/eio_1.7.9.bb
@@ -11,5 +11,5 @@ SRC_URI = "\
     ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "a5e1608a629667de3cfd17289d599b07"
-SRC_URI[sha256sum] = "f18831389f6b735e73c74d7f411602722dc8ce214ac3f4171b59d216d842a3b0"
+SRC_URI[md5sum] = "f4d6cbd216a9ae5983fa8ee8dadf04cb"
+SRC_URI[sha256sum] = "35ce08ecf6afd5faa4fe857764537e15aede2b0d2c37922e55e97e2dff3352de"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.7.8.bb b/meta-efl/recipes-efl/efl/elementary_1.7.8.bb
deleted file mode 100644
index 8dfe880..0000000
--- a/meta-efl/recipes-efl/efl/elementary_1.7.8.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "c9d387243a1ffa9318a491315c7007c8"
-SRC_URI[sha256sum] = "b02bcc17ba9f80a1a9df456ae95584b98747a2ff14f90c9c0471a16869bd35dc"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.7.9.bb b/meta-efl/recipes-efl/efl/elementary_1.7.9.bb
new file mode 100644
index 0000000..712d668
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elementary_1.7.9.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "6a3acb394b640697b1fd2dd61d990d0b"
+SRC_URI[sha256sum] = "3667c6da3d89be5a46363509645be59e3deb1f052bfa14239986ac9499da52fb"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.7.8.bb b/meta-efl/recipes-efl/efl/embryo_1.7.9.bb
similarity index 71%
rename from meta-efl/recipes-efl/efl/embryo_1.7.8.bb
rename to meta-efl/recipes-efl/efl/embryo_1.7.9.bb
index c4dfbca..08d7e49 100644
--- a/meta-efl/recipes-efl/efl/embryo_1.7.8.bb
+++ b/meta-efl/recipes-efl/efl/embryo_1.7.9.bb
@@ -16,5 +16,5 @@ SRC_URI = "\
     ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "8fee23d51be07c72f9a7edf707e1f43f"
-SRC_URI[sha256sum] = "fe8af458b2f3e5e561181c7e86b763e2623397a2a4bbbfe08e58be06ed052306"
+SRC_URI[md5sum] = "98614ec48376ff6d3a39187504b70ed4"
+SRC_URI[sha256sum] = "6b2739a53c3ab2fcf44edfb9c3a4c56d11aba91e27e556a9e70116a161201e34"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.7.8.bb b/meta-efl/recipes-efl/efl/emotion_1.7.9.bb
similarity index 83%
rename from meta-efl/recipes-efl/efl/emotion_1.7.8.bb
rename to meta-efl/recipes-efl/efl/emotion_1.7.9.bb
index c6eae15..b7e1b16 100644
--- a/meta-efl/recipes-efl/efl/emotion_1.7.8.bb
+++ b/meta-efl/recipes-efl/efl/emotion_1.7.9.bb
@@ -18,5 +18,5 @@ SRC_URI = "\
     ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "e04679ac7967e698c8c4013b9fd209a1"
-SRC_URI[sha256sum] = "54c96192cb46f5dce851934adb1633b45e5b007ad3cd05495102eeb255bced31"
+SRC_URI[md5sum] = "171bbc41a5e5d202d0dc57c34e318c14"
+SRC_URI[sha256sum] = "ff72204490e740adaa7980bad1a060dae8113c308c6083e5bcee380a11dad1f4"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.7.8.bb b/meta-efl/recipes-efl/efl/ethumb_1.7.9.bb
similarity index 80%
rename from meta-efl/recipes-efl/efl/ethumb_1.7.8.bb
rename to meta-efl/recipes-efl/efl/ethumb_1.7.9.bb
index 1d36322..d0a5389 100644
--- a/meta-efl/recipes-efl/efl/ethumb_1.7.8.bb
+++ b/meta-efl/recipes-efl/efl/ethumb_1.7.9.bb
@@ -23,5 +23,5 @@ SRC_URI = "\
     ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "9c5936d06ff79aea0dd81c5be0bf511e"
-SRC_URI[sha256sum] = "9047a88122c8713444d66294b3343c07feb15817a1809c7cbc9478ba91587e2d"
+SRC_URI[md5sum] = "d71a6fbcce2c6a8f46ea9b9b9d53cbab"
+SRC_URI[sha256sum] = "a97c39a9184ec7e1b352a7f251d97992b8082e3a0d6735ea1f34e4e40129a12f"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.8.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.8.bb
deleted file mode 100644
index de71858..0000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.8.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "8d6c7f56db854fdf931fc9270d0fda87"
-SRC_URI[sha256sum] = "4f5f2a00eb065049de3e31cd86aee7de3b0593b9aec70aeb851f4f8189233d34"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.9.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.9.bb
new file mode 100644
index 0000000..45eea84
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.7.9.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "01bb7cf2c97014f087bbba4de237b3e8"
+SRC_URI[sha256sum] = "e163a97db7311cbc8489572f201c404929a52099b3156e54a9af2181f8389824"
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.8.bb b/meta-efl/recipes-efl/efl/evas_1.7.9.bb
similarity index 97%
rename from meta-efl/recipes-efl/efl/evas_1.7.8.bb
rename to meta-efl/recipes-efl/efl/evas_1.7.9.bb
index c6486f7..588f74e 100644
--- a/meta-efl/recipes-efl/efl/evas_1.7.8.bb
+++ b/meta-efl/recipes-efl/efl/evas_1.7.9.bb
@@ -173,5 +173,5 @@ SRC_URI = "\
     ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "ca6a5a28f0fc5b0eac36210d4df139fb"
-SRC_URI[sha256sum] = "048f16454c2601851e9b17591579f60e25727c09beadaf3567fa443dfbaed0da"
+SRC_URI[md5sum] = "c96a23ede14cd0adb7e8e549e8acdee1"
+SRC_URI[sha256sum] = "1fd687e43ebe3031be4ac7628043eae1aafca83ce6d1d1f06ff3b59fb4c027f0"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.7.8.bb b/meta-efl/recipes-efl/efl/expedite_1.7.8.bb
deleted file mode 100644
index 8be92c2..0000000
--- a/meta-efl/recipes-efl/efl/expedite_1.7.8.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "378d4abb513fd4ae1d2e2f75a2d970e4"
-SRC_URI[sha256sum] = "ac80d3f13af4f644e048a1fcb71fd5f12fdef7c11c19fe61c868273bf3f4deb9"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.7.9.bb b/meta-efl/recipes-efl/efl/expedite_1.7.9.bb
new file mode 100644
index 0000000..cee2d60
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/expedite_1.7.9.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "954fe8e40fec6a561190ff0fb75b6bdd"
+SRC_URI[sha256sum] = "a05be096c911e0d66d4bdc497ebb935a04ad23696de9084aed9959b5172a593e"
-- 
1.8.4.3


