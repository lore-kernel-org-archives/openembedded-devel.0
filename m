Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2C64C78710
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:35:00 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v71so13901986wmv.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 00:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ZX5GbWhY0U02L9LI9FirgFVRT3qp7ltt8aeMserxQDA=;
	b=FW9kiYvFZOhF4Rs1DugIUGw/MYF80GMws62TiOqaKGooPD1OQk+YFE7jYdue0xSGXx
	yWsDnKFXHE9Ct6/N8K+2aKUdQQMEvEM+ACXi42C/fjICpXJaIoQNT6z+6QfBzVyG740P
	T7fHyVnB78uDy5FVMWFwH6F7CSCiZCNNM7coXDlWiYBQK1ymvJha21QSwQAU9l/t9lPS
	0T7lNsObI8awR9kQiIYxav2Y5u8VVCGjkEWOp9Aas6K8Tv+TAufbYVctv4ftLE04wXQv
	AQAKmfHo5S+rSSNyPK/NnHR3FkbrMRRRB0DMdTnj/sSqqADIyqXSMm0ZCtpR8wJn1Q/g
	UNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZX5GbWhY0U02L9LI9FirgFVRT3qp7ltt8aeMserxQDA=;
	b=LW+1mNm35LtgjRVxJPeWhQlnzT+3kZfXhzWU2YpOg8TUMcu6PK3DDkau0BrXuu5qjG
	geGRUzg7k83lbhPafn7NM9L3KxSZaeHNAshmbiPHUQGgDTzmO46KLNi6jXhW7ZPjzd1/
	GRM4CQJhl2jx4ZYSCC3EG7qsdyjgMYk9EcM/XJ4v8Pd8Rt2PWVD31/ws9FseNjrZiBgO
	46WM3HcnBV1gAs26CzC2BAcqqtAar/GqfA1FUfYkMpsZ2+4tQ4swT0rDOWvQu5QpknAL
	tcxmPByGnMKUD3hw8P1Q/yk3wnqHrUFlqZCJwUOETZpDLDArgz/qfh6G8I64+H7TiZfm
	DAEw==
X-Gm-Message-State: AKwxytfeoMtObMDaBBM9RS5J+eknCqB2IqQdZzaRdUBPQSTfFsiOsmeM
	LK/gsjoSbD5gi7cgtTgUUeLm7A==
X-Google-Smtp-Source: ACJfBouDWKzaas4B/5ypesWsHViSGPZjn7IsTLN4lkmvQbuXJ+pcoSPeLv8FlaKdmDcX5ILdLeKuUg==
X-Received: by 10.28.234.10 with SMTP id i10mr1381876wmh.49.1516178101481;
	Wed, 17 Jan 2018 00:35:01 -0800 (PST)
Received: from localhost.localdomain
	(ip-88-152-110-191.hsi03.unitymediagroup.de. [88.152.110.191])
	by smtp.gmail.com with ESMTPSA id
	c54sm4230832wrg.68.2018.01.17.00.35.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 00:35:00 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jan 2018 09:34:18 +0100
Message-Id: <20180117083421.30233-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180117083421.30233-1-schnitzeltony@gmail.com>
References: <20180117083421.30233-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/14] fluidsynth: update 1.1.8 -> 1.1.9
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jan 2018 08:35:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* 0001-avoid-buffer-overrun-in-fluid_synth_nwrite_float.patch was applied upstream

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-accelaration-for-float-multithreaded-se.patch} |  0
 ...uffer-overrun-in-fluid_synth_nwrite_float.patch | 32 ----------------------
 .../{fluidsynth_1.1.8.bb => fluidsynth_1.1.9.bb}   |  5 ++--
 3 files changed, 2 insertions(+), 35 deletions(-)
 rename meta-multimedia/recipes-multimedia/fluidsynth/files/{0002-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch => 0001-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch} (100%)
 delete mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/files/0001-avoid-buffer-overrun-in-fluid_synth_nwrite_float.patch
 rename meta-multimedia/recipes-multimedia/fluidsynth/{fluidsynth_1.1.8.bb => fluidsynth_1.1.9.bb} (83%)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/files/0002-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch b/meta-multimedia/recipes-multimedia/fluidsynth/files/0001-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch
similarity index 100%
rename from meta-multimedia/recipes-multimedia/fluidsynth/files/0002-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch
rename to meta-multimedia/recipes-multimedia/fluidsynth/files/0001-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/files/0001-avoid-buffer-overrun-in-fluid_synth_nwrite_float.patch b/meta-multimedia/recipes-multimedia/fluidsynth/files/0001-avoid-buffer-overrun-in-fluid_synth_nwrite_float.patch
deleted file mode 100644
index dda76cfee..000000000
--- a/meta-multimedia/recipes-multimedia/fluidsynth/files/0001-avoid-buffer-overrun-in-fluid_synth_nwrite_float.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a13cb63103aa56b5e8bad816c7d13d6e01c0cd9f Mon Sep 17 00:00:00 2001
-From: derselbst <tom.mbrt@googlemail.com>
-Date: Sun, 26 Nov 2017 22:12:12 +0100
-Subject: [PATCH 1/2] avoid buffer overrun in fluid_synth_nwrite_float()
-
-Upstream-Status: Backport [1]
-
-[1] https://github.com/FluidSynth/fluidsynth/commit/a13cb63103aa56b5e8bad816c7d13d6e01c0cd9f
----
- src/synth/fluid_synth.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/synth/fluid_synth.c b/src/synth/fluid_synth.c
-index 266d759..14f6b21 100644
---- a/src/synth/fluid_synth.c
-+++ b/src/synth/fluid_synth.c
-@@ -2752,10 +2752,10 @@ fluid_synth_nwrite_float(fluid_synth_t* synth, int len,
-     {
- #ifdef WITH_FLOAT
-       if(fx_left != NULL)
--        FLUID_MEMCPY(fx_left[i + count], fx_left_in[i], bytes);
-+        FLUID_MEMCPY(fx_left[i] + count, fx_left_in[i], bytes);
-       
-       if(fx_right != NULL)
--        FLUID_MEMCPY(fx_right[i + count], fx_right_in[i], bytes);
-+        FLUID_MEMCPY(fx_right[i] + count, fx_right_in[i], bytes);
- #else //WITH_FLOAT
-       int j;
-       if(fx_left != NULL) {
--- 
-2.9.5
-
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.9.bb
similarity index 83%
rename from meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb
rename to meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.9.bb
index 406bbf768..fffbf0cae 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.9.bb
@@ -8,10 +8,9 @@ DEPENDS = "alsa-lib ncurses glib-2.0"
 
 SRC_URI = " \
     git://github.com/FluidSynth/fluidsynth.git;branch=1.1.x \
-    file://0001-avoid-buffer-overrun-in-fluid_synth_nwrite_float.patch \
-    file://0002-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch \
+    file://0001-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch \
 "
-SRCREV = "12e7afe3a806a6b397f28e0ca4bc6bab9ebe7047"
+SRCREV = "fe37923393d6a76f42ed044aa56dadc66ec909ce"
 S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig lib_package
-- 
2.14.3


