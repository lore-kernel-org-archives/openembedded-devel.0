Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1EED060097
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 10:56:39 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id em10so988708wid.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 03:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NevC7XomR9ts12qgPFSSkBvZPcUTmhYVjT20TQBWmkI=;
	b=g8T9bgoidMWEi1lT6dN9ciYewA9VSkuAB5fiiV7Ta4OULACyNJEsmJ5t3uVHaeZl4Y
	Y0CJP9bDk5o7Df7oVGsX0Lb4lEEP+wRroxzeF71Fut6OzfFvCOWhw5JkpugzJuh2B/w7
	tL9l14MnF2/3wycLAfyQGj6va/9voe86k5L+Rue31xbnO16/gcT5dgAUJT07mxwfBySl
	vhKRgwh9IfY1e7GNcr2yylZKYTP9enNnCvbfYslpmISgOdml54hPIAWQBxIfzqlUX03j
	lb0fuikb794cf14p8bwnkYJUrGnZjJoYj6RFx8jnQnrHz8rjRxmyj71I3eKYhAmGv4sj
	wIAg==
X-Received: by 10.180.75.7 with SMTP id y7mr11249407wiv.72.1413975399799;
	Wed, 22 Oct 2014 03:56:39 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id u4sm1507928wiy.9.2014.10.22.03.56.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Oct 2014 03:56:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Oct 2014 12:56:38 +0200
Message-Id: <1413975398-1610-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1413975398-1610-1-git-send-email-Martin.Jansa@gmail.com>
References: <1413975398-1610-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 2/2] efl, elementary, e-wm: upgrade to 1.11.4 and 0.19.1
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
X-List-Received-Date: Wed, 22 Oct 2014 10:56:40 -0000

* announcements:
  https://phab.enlightenment.org/phame/live/3/post/efl_elementary_1_11_3_and_enlightenment_0_19_1_releases/
  https://phab.enlightenment.org/phame/live/3/post/efl_and_elementary_1_11_4_releases/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/{e-wm_0.19.0.bb => e-wm_0.19.1.bb}           | 4 ++--
 meta-efl/recipes-efl/efl/{efl_1.11.2.bb => efl_1.11.4.bb}             | 4 ++--
 .../recipes-efl/efl/{elementary_1.11.2.bb => elementary_1.11.4.bb}    | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-efl/recipes-efl/e17/{e-wm_0.19.0.bb => e-wm_0.19.1.bb} (81%)
 rename meta-efl/recipes-efl/efl/{efl_1.11.2.bb => efl_1.11.4.bb} (92%)
 rename meta-efl/recipes-efl/efl/{elementary_1.11.2.bb => elementary_1.11.4.bb} (79%)

diff --git a/meta-efl/recipes-efl/e17/e-wm_0.19.0.bb b/meta-efl/recipes-efl/e17/e-wm_0.19.1.bb
similarity index 81%
rename from meta-efl/recipes-efl/e17/e-wm_0.19.0.bb
rename to meta-efl/recipes-efl/e17/e-wm_0.19.1.bb
index c1e8deb..4c9830f 100644
--- a/meta-efl/recipes-efl/e17/e-wm_0.19.0.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_0.19.1.bb
@@ -16,5 +16,5 @@ SRC_URI = "\
     file://applications.menu \
 "
 
-SRC_URI[md5sum] = "9571d7e77fdd1ddb877adb063aaf9896"
-SRC_URI[sha256sum] = "30a5633be43a9bb33ce397afe0870511e7b148ea9c1f1a8536818354c20f2e31"
+SRC_URI[md5sum] = "2c5a110496a867253f31cf7ed1a2143a"
+SRC_URI[sha256sum] = "3430d94c3def706de3b421ee48d92f2a475224f2f86111442a5d2d90c2363116"
diff --git a/meta-efl/recipes-efl/efl/efl_1.11.2.bb b/meta-efl/recipes-efl/efl/efl_1.11.4.bb
similarity index 92%
rename from meta-efl/recipes-efl/efl/efl_1.11.2.bb
rename to meta-efl/recipes-efl/efl/efl_1.11.4.bb
index 6e9a227..9686705 100644
--- a/meta-efl/recipes-efl/efl/efl_1.11.2.bb
+++ b/meta-efl/recipes-efl/efl/efl_1.11.4.bb
@@ -4,8 +4,8 @@ SRC_URI = "\
     ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "f1b23b9a4e2ae04a4c0f6d2f924093e9"
-SRC_URI[sha256sum] = "f3cc1cd2a77df114a7b76a7e77bc77e88c367ec49462047fca209ee622cb7288"
+SRC_URI[md5sum] = "eb2bd4a2f6684211dbd5382db024137d"
+SRC_URI[sha256sum] = "3e5aba667b6cdfb2fb89aa637fa8ee92abc2d9950420cf2b4c540809f238fc78"
 
 # Temporary disable until error like the one following are fixed
 # efl-native/2_1.8.4-r0/efl-1.8.4/src/lib/eet/.libs/libeet.so: file not recognized: File truncated
diff --git a/meta-efl/recipes-efl/efl/elementary_1.11.2.bb b/meta-efl/recipes-efl/efl/elementary_1.11.4.bb
similarity index 79%
rename from meta-efl/recipes-efl/efl/elementary_1.11.2.bb
rename to meta-efl/recipes-efl/efl/elementary_1.11.4.bb
index 60e5468..94ffd84 100644
--- a/meta-efl/recipes-efl/efl/elementary_1.11.2.bb
+++ b/meta-efl/recipes-efl/efl/elementary_1.11.4.bb
@@ -8,8 +8,8 @@ SRC_URI = "\
 # these paths aren't passed in -native build
 SRC_URI_append_class-target = " file://0001-Makefile-Use-elementary_codegen-defined-in-configure.patch"
 
-SRC_URI[md5sum] = "f6939a24ffc50c2e4eac7ed38663f0f3"
-SRC_URI[sha256sum] = "18f7e8fb63fcfd0d5abd213943c0c356b1270a94e20d44b8e6047b1cd0e53010"
+SRC_URI[md5sum] = "531f5e2a0ccd95235a5d30221ffa7003"
+SRC_URI[sha256sum] = "f3ff9d14ccb8621b93f1fe08522bdf31d54382d7e2ab1bf72359b4e65c9d39e4"
 
 # autotools-brokensep - configure updates Elementary.h correctly in ${B}, but then build is using Elementary.h from ${S}
 # which includes #define ELM_EMAP (instead of #undef ELM_EMAP) and building fails
-- 
2.1.1


