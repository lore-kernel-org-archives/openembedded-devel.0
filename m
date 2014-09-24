Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id ADB9571683
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 15:24:24 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id n12so4650852wgh.23
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 08:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oupxCvRYsKJAWQnJDAe8t4c8Qfxiab+WBlucm8JFDwg=;
	b=VW96L6I05A1XdZfEjHcbElKq/VaL/e9FGTOIaISjUgn0hul+Db9AYyiW5BgvZRZdbv
	6n7WPsbWwZtY1OFFdKwka51uVSwaON48rWavC95AXelUNsMrdWORpDrbN77G7U2qa2Cz
	zMY0Y2bdFH/WjyKAogVYEhf+Y7h18YwKpnNkrm3XfIBQUnZ69j7OFmhrihZct2FyRhfd
	nti2sWMaqlB9iPNTS6eFQ/GDaxm7dIC7r8NLUcPDKII0zV+X1yguKV51SVX6KqFu7gFl
	8d/BbdctXwiECr1HN6zeEj53CBdWSvPi6aXVZVBBx+lNoXQ6+AFirqNDqJIpKwP9d4gQ
	kZAQ==
X-Received: by 10.194.209.207 with SMTP id mo15mr8688440wjc.6.1411572265289;
	Wed, 24 Sep 2014 08:24:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id td9sm42904wic.15.2014.09.24.08.24.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Sep 2014 08:24:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Sep 2014 17:24:55 +0200
Message-Id: <1411572295-5889-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1411572295-5889-1-git-send-email-Martin.Jansa@gmail.com>
References: <1411572295-5889-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 3/3] efl, elementary, elvas-generic-loaders: upgrade to 1.11.2
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
X-List-Received-Date: Wed, 24 Sep 2014 15:24:25 -0000

* announcement:
  https://phab.enlightenment.org/phame/post/view/85/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/{efl_1.11.0.bb => efl_1.11.2.bb}         | 4 ++--
 .../efl/{elementary_1.11.0.bb => elementary_1.11.2.bb}            | 4 ++--
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.11.0.bb           | 8 --------
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.11.2.bb           | 8 ++++++++
 4 files changed, 12 insertions(+), 12 deletions(-)
 rename meta-efl/recipes-efl/efl/{efl_1.11.0.bb => efl_1.11.2.bb} (92%)
 rename meta-efl/recipes-efl/efl/{elementary_1.11.0.bb => elementary_1.11.2.bb} (79%)
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.11.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.11.2.bb

diff --git a/meta-efl/recipes-efl/efl/efl_1.11.0.bb b/meta-efl/recipes-efl/efl/efl_1.11.2.bb
similarity index 92%
rename from meta-efl/recipes-efl/efl/efl_1.11.0.bb
rename to meta-efl/recipes-efl/efl/efl_1.11.2.bb
index 45ee389..6e9a227 100644
--- a/meta-efl/recipes-efl/efl/efl_1.11.0.bb
+++ b/meta-efl/recipes-efl/efl/efl_1.11.2.bb
@@ -4,8 +4,8 @@ SRC_URI = "\
     ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "83a1e983d7e9d3efcbba9a7a29cad54d"
-SRC_URI[sha256sum] = "0a8ab66e012820cad7dd78de371f8dcbbd79cb316302e1e6c354181de35d727f"
+SRC_URI[md5sum] = "f1b23b9a4e2ae04a4c0f6d2f924093e9"
+SRC_URI[sha256sum] = "f3cc1cd2a77df114a7b76a7e77bc77e88c367ec49462047fca209ee622cb7288"
 
 # Temporary disable until error like the one following are fixed
 # efl-native/2_1.8.4-r0/efl-1.8.4/src/lib/eet/.libs/libeet.so: file not recognized: File truncated
diff --git a/meta-efl/recipes-efl/efl/elementary_1.11.0.bb b/meta-efl/recipes-efl/efl/elementary_1.11.2.bb
similarity index 79%
rename from meta-efl/recipes-efl/efl/elementary_1.11.0.bb
rename to meta-efl/recipes-efl/efl/elementary_1.11.2.bb
index d188c23..60e5468 100644
--- a/meta-efl/recipes-efl/efl/elementary_1.11.0.bb
+++ b/meta-efl/recipes-efl/efl/elementary_1.11.2.bb
@@ -8,8 +8,8 @@ SRC_URI = "\
 # these paths aren't passed in -native build
 SRC_URI_append_class-target = " file://0001-Makefile-Use-elementary_codegen-defined-in-configure.patch"
 
-SRC_URI[md5sum] = "cfcf3b0620cbb6e86021286631274d9a"
-SRC_URI[sha256sum] = "47ee79f7fc4e355557e6809e2001468bc8e40939562e3a96f689969ab67c17b4"
+SRC_URI[md5sum] = "f6939a24ffc50c2e4eac7ed38663f0f3"
+SRC_URI[sha256sum] = "18f7e8fb63fcfd0d5abd213943c0c356b1270a94e20d44b8e6047b1cd0e53010"
 
 # autotools-brokensep - configure updates Elementary.h correctly in ${B}, but then build is using Elementary.h from ${S}
 # which includes #define ELM_EMAP (instead of #undef ELM_EMAP) and building fails
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.11.0.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.11.0.bb
deleted file mode 100644
index 0b98b11..0000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.11.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "b99fd8dc1e79efacd4e212374a4f0668"
-SRC_URI[sha256sum] = "4cf55717d75214d22e6c9955bd5b2e74656cc454f011496bac74ae3df6c924e2"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.11.2.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.11.2.bb
new file mode 100644
index 0000000..3332d08
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.11.2.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "b7c57c082e6b431ffeabe3803c6546b6"
+SRC_URI[sha256sum] = "c6e729270c1ee79a8785388568eef394a6ba2cbe264c5c7d6c747727e8d9e60e"
-- 
2.0.4


