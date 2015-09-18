Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id EA5A060125
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 12:52:47 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so63224758wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 05:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bz3GDiZvkx/Nmg9Uh2VoE5oiwgGjvP0TsOTP1sbWnzc=;
	b=h7RhCp4j4/9QujDoZz7O6th6yYIB/4EgonnYchmJzWkgKahq/RtoYvrrFf07IRewQ1
	rW2X10Kf2mOC12oZLnp4QUCLnWiFzHxQP/04MdyGANL9UKHs5CHsiekE0MWkChaDLz1R
	TktMw/QhmecJqVP0z5//Z7c7JjOACwxSf6PiuaMlQJYEWcJFdEox80wKx8A2oJXRIg9G
	9LFSsXnWwH8XZjo5g+2qobMXk8Pl+ew04r6zIgRpt90LwSrjv01JA6SNZzieBf/G7sQx
	vW+NTahlabdbnlfthb9g+5Jyykq/m1cMCxwiSYKoOGJ3oKAYtAZXOC6TzCka6T8rM8vq
	GCmg==
X-Received: by 10.180.186.98 with SMTP id fj2mr39645228wic.58.1442580767507;
	Fri, 18 Sep 2015 05:52:47 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	mc18sm15371524wic.23.2015.09.18.05.52.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 05:52:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Sep 2015 14:52:35 +0200
Message-Id: <1442580755-27729-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1442580755-27729-1-git-send-email-Martin.Jansa@gmail.com>
References: <1442580755-27729-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-efl 2/2] e-wm: upgrade to 0.19.10
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
X-List-Received-Date: Fri, 18 Sep 2015 12:52:49 -0000

* announcement:
  https://phab.enlightenment.org/phame/live/3/post/e19_10_release/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_0.19.10.bb | 19 +++++++++++++++++++
 meta-efl/recipes-efl/e17/e-wm_0.19.9.bb  | 19 -------------------
 2 files changed, 19 insertions(+), 19 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/e-wm_0.19.10.bb
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm_0.19.9.bb

diff --git a/meta-efl/recipes-efl/e17/e-wm_0.19.10.bb b/meta-efl/recipes-efl/e17/e-wm_0.19.10.bb
new file mode 100644
index 0000000..86ce03d
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/e-wm_0.19.10.bb
@@ -0,0 +1,19 @@
+require ${BPN}.inc
+
+SRCNAME = "enlightenment"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+# couple of modules needed for illume2 (mobile) profile were removed in
+# http://git.enlightenment.org/core/enlightenment.git/commit/src/modules/Makefile.mk?id=1be76d599ca27f820b58b8186c5f73d9844c67ca
+# and replacements aren't included yet, if you want to use e-wm on device with small screen, better stay with 0.18 release
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "\
+    ${E_RELEASES}/apps/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+    file://enlightenment_start.oe \
+    file://applications.menu \
+"
+
+SRC_URI[md5sum] = "9063617760329445ada8635270a4e627"
+SRC_URI[sha256sum] = "484d305bcf403303b18c46a3a498445b93689cd325010ae8d0601551926469d8"
diff --git a/meta-efl/recipes-efl/e17/e-wm_0.19.9.bb b/meta-efl/recipes-efl/e17/e-wm_0.19.9.bb
deleted file mode 100644
index 9563501..0000000
--- a/meta-efl/recipes-efl/e17/e-wm_0.19.9.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require ${BPN}.inc
-
-SRCNAME = "enlightenment"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-# couple of modules needed for illume2 (mobile) profile were removed in
-# http://git.enlightenment.org/core/enlightenment.git/commit/src/modules/Makefile.mk?id=1be76d599ca27f820b58b8186c5f73d9844c67ca
-# and replacements aren't included yet, if you want to use e-wm on device with small screen, better stay with 0.18 release
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "\
-    ${E_RELEASES}/apps/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-    file://enlightenment_start.oe \
-    file://applications.menu \
-"
-
-SRC_URI[md5sum] = "9a5ca3ddf85132ecc43c8d78919eb2f9"
-SRC_URI[sha256sum] = "363b3c4e13f799dcb547dd76c4e4964441886453843948d852911448c6fa8df5"
-- 
2.5.1


