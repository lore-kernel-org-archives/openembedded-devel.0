Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T91iZ-00056S-08
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 00:35:35 +0200
Received: by weyr6 with SMTP id r6so4450016wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2012 15:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=C+BxMEU4WI55c79SYeNc0anfuJkFz/ms3n3vvBmGZII=;
	b=WfiMqVuL4YaNjXyZXTiwb4mhDQVlOlr0uajNMx8hJgGiGfoBn9bgIKlnDGLjdLg1fs
	YBZeiqWNL01zbk3N4P838tbZoVC6NSYewnhtn8dvFjYQE4YajA5YFO2ZtuCcPWVg1HpN
	qktxKAfhPfUE1B4uF5xgHzaC5Xva/eH4vWNdEjmhSGOchX1eNKRcn62oGQ3evogmLIAR
	CSSPvYsKw4ZtRMcJEV1dfOBFD7G6misEAlCWVXJlCyq0lJiewR5jxy/acU5E91hkS+yK
	+xcU7G0ai1p27pH0md/ZelnSJic7YAjkmb4vzmlaQiEbaQwgrDJSTYRuXfUSiJ4KbSNX
	uUpA==
Received: by 10.217.1.206 with SMTP id n56mr11782854wes.151.1346797392879;
	Tue, 04 Sep 2012 15:23:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bc2sm40122807wib.0.2012.09.04.15.23.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 15:23:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2012 00:22:19 +0200
Message-Id: <35ef15409c472b94a24b29af538891e53194f382.1346790372.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1346790372.git.Martin.Jansa@gmail.com>
References: <cover.1346790372.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1346790372.git.Martin.Jansa@gmail.com>
References: <cover.1346790372.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 07/10] python-efl: upgrade recipes to 1.7.0
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
X-List-Received-Date: Tue, 04 Sep 2012 22:35:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-devtools/python/python-ecore_1.6.99-beta.bb      | 6 ------
 meta-efl/recipes-devtools/python/python-ecore_1.7.0.bb            | 5 +++++
 meta-efl/recipes-devtools/python/python-edbus_1.6.99-beta.bb      | 6 ------
 meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb            | 5 +++++
 meta-efl/recipes-devtools/python/python-edje_1.6.99-beta.bb       | 7 -------
 meta-efl/recipes-devtools/python/python-edje_1.7.0.bb             | 6 ++++++
 meta-efl/recipes-devtools/python/python-elementary_1.6.99-beta.bb | 6 ------
 meta-efl/recipes-devtools/python/python-elementary_1.7.0.bb       | 5 +++++
 meta-efl/recipes-devtools/python/python-emotion_1.6.99-beta.bb    | 6 ------
 meta-efl/recipes-devtools/python/python-emotion_1.7.0.bb          | 5 +++++
 meta-efl/recipes-devtools/python/python-evas_1.6.99-beta.bb       | 6 ------
 meta-efl/recipes-devtools/python/python-evas_1.7.0.bb             | 5 +++++
 12 files changed, 31 insertions(+), 37 deletions(-)
 delete mode 100644 meta-efl/recipes-devtools/python/python-ecore_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-ecore_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-edbus_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-edje_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-edje_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-elementary_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-elementary_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-emotion_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-emotion_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-evas_1.6.99-beta.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-evas_1.7.0.bb

diff --git a/meta-efl/recipes-devtools/python/python-ecore_1.6.99-beta.bb b/meta-efl/recipes-devtools/python/python-ecore_1.6.99-beta.bb
deleted file mode 100644
index f2c7750..0000000
--- a/meta-efl/recipes-devtools/python/python-ecore_1.6.99-beta.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require ${BPN}.inc
-PR = "${INC_PR}.0"
-SRCVER = "1.7.0-beta"
-
-SRC_URI[md5sum] = "7cd483e817e41017adcd23cea4ce462d"
-SRC_URI[sha256sum] = "09a99f728b946c44955ad91e3ac072643e533ded74110f481e27b8f035877a95"
diff --git a/meta-efl/recipes-devtools/python/python-ecore_1.7.0.bb b/meta-efl/recipes-devtools/python/python-ecore_1.7.0.bb
new file mode 100644
index 0000000..17b7137
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-ecore_1.7.0.bb
@@ -0,0 +1,5 @@
+require ${BPN}.inc
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "15dd908b71d09ef30f7e758739f3b6fd"
+SRC_URI[sha256sum] = "45d374ffab243b561718897e4eac9aadc1e7ce6e34321a3e728a5f6d07d1e9b6"
diff --git a/meta-efl/recipes-devtools/python/python-edbus_1.6.99-beta.bb b/meta-efl/recipes-devtools/python/python-edbus_1.6.99-beta.bb
deleted file mode 100644
index b3d0e2e..0000000
--- a/meta-efl/recipes-devtools/python/python-edbus_1.6.99-beta.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require ${BPN}.inc
-PR = "${INC_PR}.0"
-SRCVER = "1.7.0-beta"
-
-SRC_URI[md5sum] = "d6140208bb2608bd320a70298c0c4234"
-SRC_URI[sha256sum] = "468bc77dc1b64d04c688b2f07ddcbeac406d984121b90e78ba802c92e58e4daf"
diff --git a/meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb b/meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb
new file mode 100644
index 0000000..5628469
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb
@@ -0,0 +1,5 @@
+require ${BPN}.inc
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "40b479444bb06147429a276127981890"
+SRC_URI[sha256sum] = "78e5ca334ee25185748660b4e612f984f4d3bced018f062278701429868f117b"
diff --git a/meta-efl/recipes-devtools/python/python-edje_1.6.99-beta.bb b/meta-efl/recipes-devtools/python/python-edje_1.6.99-beta.bb
deleted file mode 100644
index 3d88425..0000000
--- a/meta-efl/recipes-devtools/python/python-edje_1.6.99-beta.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require ${BPN}.inc
-PR = "${INC_PR}.0"
-SRCVER = "1.7.0-beta"
-SRC_URI += "file://0001-fix-unicode-conversion.patch"
-
-SRC_URI[md5sum] = "eac613c2f3d88d30ba1adf4acd5090bf"
-SRC_URI[sha256sum] = "6ce7b57a4afaddf8dbf423543380cdc798c954b31ffd9d47e6af9536786abc05"
diff --git a/meta-efl/recipes-devtools/python/python-edje_1.7.0.bb b/meta-efl/recipes-devtools/python/python-edje_1.7.0.bb
new file mode 100644
index 0000000..9a30ad4
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-edje_1.7.0.bb
@@ -0,0 +1,6 @@
+require ${BPN}.inc
+PR = "${INC_PR}.0"
+SRC_URI += "file://0001-fix-unicode-conversion.patch"
+
+SRC_URI[md5sum] = "1e0d7a4a4504298caaad0cee476e4edb"
+SRC_URI[sha256sum] = "b1eb7be4dea099752c587baa4747d8100de6cead256ffea22a6cc0e88c4e8786"
diff --git a/meta-efl/recipes-devtools/python/python-elementary_1.6.99-beta.bb b/meta-efl/recipes-devtools/python/python-elementary_1.6.99-beta.bb
deleted file mode 100644
index be63412..0000000
--- a/meta-efl/recipes-devtools/python/python-elementary_1.6.99-beta.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require ${BPN}.inc
-PR = "${INC_PR}.0"
-SRCVER = "1.7.0-beta"
-
-SRC_URI[md5sum] = "f2b801aa8fe53914abbcfdf14aa1d325"
-SRC_URI[sha256sum] = "1255bab89b824754c1a0909f2646ff63fd0e12478e0bfbfbdc3cfd48ea9bfa25"
diff --git a/meta-efl/recipes-devtools/python/python-elementary_1.7.0.bb b/meta-efl/recipes-devtools/python/python-elementary_1.7.0.bb
new file mode 100644
index 0000000..625c09d
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-elementary_1.7.0.bb
@@ -0,0 +1,5 @@
+require ${BPN}.inc
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "38c8b2ac508ab4e1d12f1557a12169c9"
+SRC_URI[sha256sum] = "63052f8428d725599a0a2765fe48a21e695c66599ec1dcce0a909db440d2216b"
diff --git a/meta-efl/recipes-devtools/python/python-emotion_1.6.99-beta.bb b/meta-efl/recipes-devtools/python/python-emotion_1.6.99-beta.bb
deleted file mode 100644
index 976cf56..0000000
--- a/meta-efl/recipes-devtools/python/python-emotion_1.6.99-beta.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require ${BPN}.inc
-PR = "${INC_PR}.0"
-SRCVER = "1.7.0-beta"
-
-SRC_URI[md5sum] = "3cfd52e8415f48d77fdb1fe73244c2b2"
-SRC_URI[sha256sum] = "76d673b99e5e894b469bb04f67a14492a6021edc95762ba71da7b24c36fa660a"
diff --git a/meta-efl/recipes-devtools/python/python-emotion_1.7.0.bb b/meta-efl/recipes-devtools/python/python-emotion_1.7.0.bb
new file mode 100644
index 0000000..01e6751
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-emotion_1.7.0.bb
@@ -0,0 +1,5 @@
+require ${BPN}.inc
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "ac7197ce2617a87fad3dd134a98ad01f"
+SRC_URI[sha256sum] = "ac2910c0e3e861dfc07253b825dc038baa1a3e6ce7d5b362122ad51127e20e91"
diff --git a/meta-efl/recipes-devtools/python/python-evas_1.6.99-beta.bb b/meta-efl/recipes-devtools/python/python-evas_1.6.99-beta.bb
deleted file mode 100644
index cabc9c8..0000000
--- a/meta-efl/recipes-devtools/python/python-evas_1.6.99-beta.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require ${BPN}.inc
-PR = "${INC_PR}.0"
-SRCVER = "1.7.0-beta"
-
-SRC_URI[md5sum] = "19262c0baac27f35f136e4aaa3ca0171"
-SRC_URI[sha256sum] = "6784109dc637bd8a50f31eb3a9ff31e0eece0fba04c8a2a527d6bd83c1b02cf8"
diff --git a/meta-efl/recipes-devtools/python/python-evas_1.7.0.bb b/meta-efl/recipes-devtools/python/python-evas_1.7.0.bb
new file mode 100644
index 0000000..62219d8
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-evas_1.7.0.bb
@@ -0,0 +1,5 @@
+require ${BPN}.inc
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "c3fda2025171f5e3d2bc224e8bae88e5"
+SRC_URI[sha256sum] = "bc00ea23d4d3e9d6448c8a24f918f577cf3c2b25636f36b76b2ed2e3a74d42f5"
-- 
1.7.12



