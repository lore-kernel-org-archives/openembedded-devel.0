Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 86BD87226F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 20:46:01 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id z12so15396430wgg.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Dec 2014 12:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5F7fpA1CtmufvRK8QNEMRlLA5zWiVtFm29g/SSDDa/M=;
	b=K3KKPjbv2zynESVlRQLfa/Z/YQFffr/R71E51mdcOqKNli3OKALs7uAMvbjtBrsTX3
	8yXJjRanK7FrPIVXa+VP8exjs9zvEUwAL3cjzIF/JEuu0u8ApZDBKe4oLc3gJIzrrt3o
	8qtYuQwpZLCbOJ0CVbzzeimZJQrfURGzUFcWY6ALrqCIr/mNlvhcWcqQK2SxfHyFqlsY
	timeYyC1MfljFRntxb8PUgUwO+NtfHu3mlQs3oTc2rNmkZ49t+NyaSx9AzMp3UoY8ef4
	qEmJTT0vyYdDr+Wc14R5kgYD48wz5sPfJS08Hqj9rxNPcN+lKRdkfCj61Co8klC2YqDA
	16bQ==
X-Received: by 10.194.161.202 with SMTP id xu10mr23527633wjb.4.1417466762149; 
	Mon, 01 Dec 2014 12:46:02 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f7sm29923427wiz.13.2014.12.01.12.46.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Dec 2014 12:46:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Dec 2014 21:46:01 +0100
Message-Id: <1417466762-3489-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
Subject: [meta-efl][WIP][PATCH 1/2] efl, elementary, emotion-generic-players, evas-generic-loaders: upgrade to 1.12.*
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
X-List-Received-Date: Mon, 01 Dec 2014 20:46:05 -0000

* announcements:
  https://phab.enlightenment.org/phame/post/view/96/
  https://phab.enlightenment.org/phame/post/view/99/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/{efl_1.11.4.bb => efl_1.12.1.bb}         | 4 ++--
 .../efl/{elementary_1.11.4.bb => elementary_1.12.1.bb}            | 4 ++--
 meta-efl/recipes-efl/efl/emotion-generic-players_1.11.0.bb        | 8 --------
 meta-efl/recipes-efl/efl/emotion-generic-players_1.12.0.bb        | 8 ++++++++
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.11.2.bb           | 8 --------
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.12.0.bb           | 8 ++++++++
 6 files changed, 20 insertions(+), 20 deletions(-)
 rename meta-efl/recipes-efl/efl/{efl_1.11.4.bb => efl_1.12.1.bb} (92%)
 rename meta-efl/recipes-efl/efl/{elementary_1.11.4.bb => elementary_1.12.1.bb} (79%)
 delete mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players_1.11.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players_1.12.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.11.2.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.12.0.bb

diff --git a/meta-efl/recipes-efl/efl/efl_1.11.4.bb b/meta-efl/recipes-efl/efl/efl_1.12.1.bb
similarity index 92%
rename from meta-efl/recipes-efl/efl/efl_1.11.4.bb
rename to meta-efl/recipes-efl/efl/efl_1.12.1.bb
index 9686705..f460ba0 100644
--- a/meta-efl/recipes-efl/efl/efl_1.11.4.bb
+++ b/meta-efl/recipes-efl/efl/efl_1.12.1.bb
@@ -4,8 +4,8 @@ SRC_URI = "\
     ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "eb2bd4a2f6684211dbd5382db024137d"
-SRC_URI[sha256sum] = "3e5aba667b6cdfb2fb89aa637fa8ee92abc2d9950420cf2b4c540809f238fc78"
+SRC_URI[md5sum] = "ac784b11bd1854459c05a78d783aae57"
+SRC_URI[sha256sum] = "c1074c91e98e15fead0e1999bf7bc7dc5e7205a790655cd9b0ba332c38835fce"
 
 # Temporary disable until error like the one following are fixed
 # efl-native/2_1.8.4-r0/efl-1.8.4/src/lib/eet/.libs/libeet.so: file not recognized: File truncated
diff --git a/meta-efl/recipes-efl/efl/elementary_1.11.4.bb b/meta-efl/recipes-efl/efl/elementary_1.12.1.bb
similarity index 79%
rename from meta-efl/recipes-efl/efl/elementary_1.11.4.bb
rename to meta-efl/recipes-efl/efl/elementary_1.12.1.bb
index 94ffd84..dd7a9a9 100644
--- a/meta-efl/recipes-efl/efl/elementary_1.11.4.bb
+++ b/meta-efl/recipes-efl/efl/elementary_1.12.1.bb
@@ -8,8 +8,8 @@ SRC_URI = "\
 # these paths aren't passed in -native build
 SRC_URI_append_class-target = " file://0001-Makefile-Use-elementary_codegen-defined-in-configure.patch"
 
-SRC_URI[md5sum] = "531f5e2a0ccd95235a5d30221ffa7003"
-SRC_URI[sha256sum] = "f3ff9d14ccb8621b93f1fe08522bdf31d54382d7e2ab1bf72359b4e65c9d39e4"
+SRC_URI[md5sum] = "26af05e3c30676cc761566a3cb7e5611"
+SRC_URI[sha256sum] = "65a5274e21355dcdf9182447013c5874391faa2791d46aa96551050d298208dc"
 
 # autotools-brokensep - configure updates Elementary.h correctly in ${B}, but then build is using Elementary.h from ${S}
 # which includes #define ELM_EMAP (instead of #undef ELM_EMAP) and building fails
diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players_1.11.0.bb b/meta-efl/recipes-efl/efl/emotion-generic-players_1.11.0.bb
deleted file mode 100644
index 4cb74f5..0000000
--- a/meta-efl/recipes-efl/efl/emotion-generic-players_1.11.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "432febd580ed1a4d7d7b42984ee4c693"
-SRC_URI[sha256sum] = "5d2e7923a6e4e909df2f9fc3bf7508086ea04b0146e62015dbc93a8bf58bca74"
diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players_1.12.0.bb b/meta-efl/recipes-efl/efl/emotion-generic-players_1.12.0.bb
new file mode 100644
index 0000000..1e1bb8f
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/emotion-generic-players_1.12.0.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "fb67cd4e0c6f13da9cdd864763217a59"
+SRC_URI[sha256sum] = "2f2b3c60b113bb637c6b40b575ceffe4055aa424f4585c64ddef6638dbc2a0da"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.11.2.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.11.2.bb
deleted file mode 100644
index 3332d08..0000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.11.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "b7c57c082e6b431ffeabe3803c6546b6"
-SRC_URI[sha256sum] = "c6e729270c1ee79a8785388568eef394a6ba2cbe264c5c7d6c747727e8d9e60e"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.12.0.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.12.0.bb
new file mode 100644
index 0000000..c172895
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.12.0.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "d60282b9cfad5336e75264767be07179"
+SRC_URI[sha256sum] = "c531c82845b656cb8ea8e2db1e413509d9b4558450be6c5ee27da0cdc781376e"
-- 
2.1.3


