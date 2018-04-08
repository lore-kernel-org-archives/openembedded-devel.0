Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 291A97554F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:09 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id 91-v6so3212891pld.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=z29/GahGzeOKamE2aTFIBuQuuElOAX9i5gvH4vm9c+M=;
	b=KnRSaKPDnFU0fS1Bay/ZNnqF9FnrOlfsuT/R+A+j4mNOpX33HFIbmnQZzY7Sfks6wM
	lbq3gBrJYe+kamSGM7ZRUlCqz1MCYcSzuppvpzoRUu6AzykgvwV3tXxpdkWnnLNxpvfJ
	Yv2CUtbunO439e6XQJ34tjrVqZODs1bXy/2ii41mLpTSAmpcVevYR/kE2w9Xorv33K5R
	uYbBnFzuZDyVMYd96iEEzmEGlbY5fKGZmlw1siz3XWh3LxIvJXS6wbuEmNrwkD/WKRF+
	vu4tCL0I96OAtJgra5nLTeU+XfeRlWlCwhJmsuHxxXEYa8Fp2U9VzOU/ynU+G636NMog
	oRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=z29/GahGzeOKamE2aTFIBuQuuElOAX9i5gvH4vm9c+M=;
	b=MxKaYU5nligkuI4Tc0PPfgVTmOjjquzrUAF0L6Mt7L91faZqipWNxP9P9cH8zXloSI
	EBLr6JpKYEcaodbw9RyB0YfRbqJ0I7VPVEsWG2uRGn2NEib7OeUz29g5gn3vvLeunlKo
	+obvf3bScpeIMO/x17UV1lgESTaXUiuIl76qQFrkyrRmfLLCsakUA5OG8Srq+YXdxMeb
	w8niaNprjC2vrdi4wG7wrP+LUe2Fnqj01qW031LOV48hupLrwGtOJW5+VQv47w06ass6
	55VqaIRifGWsH3oQQ1BLB+Lb2vg8AFJsIgjQI9MhjJfv185SaTxBj+qZHZnF+X5mZlxx
	AerQ==
X-Gm-Message-State: AElRT7HONfet9DOHo6/VdfL/bK1cyrxCVp0qn6qTP5LYvfqVZZQg5uk4
	stYU3pXWKybDhcRigIZu30c=
X-Google-Smtp-Source: AIpwx48t2YvTYwk0y9dea2pT+8nm9DAQEkDtftzGTJi1JW7/9hQEkLv1t100Z7XtonGXTAhjBgbfnw==
X-Received: by 2002:a17:902:9a86:: with SMTP id
	w6-v6mr33599546plp.168.1523170750508; 
	Sat, 07 Apr 2018 23:59:10 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:30 -0700
Message-Id: <1523170729-26321-18-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 18/37] esound: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:09 -0000

WARNING:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
checking file Makefile.am
Hunk #1 succeeded at 1 with fuzz 2.

amoung others

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../esound/0001-audio_alsa09.c-alsa-drain-fix.patch    |  8 +++-----
 .../esound/0002-Undefine-open64-and-fopen64.patch      |  8 +++-----
 .../esound/esound/0003-Use-I-path-in-configure.patch   |  8 +++-----
 meta-oe/recipes-multimedia/esound/esound/no-docs.patch | 18 +++++++++++++-----
 4 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/meta-oe/recipes-multimedia/esound/esound/0001-audio_alsa09.c-alsa-drain-fix.patch b/meta-oe/recipes-multimedia/esound/esound/0001-audio_alsa09.c-alsa-drain-fix.patch
index 6c7f3bd..130f3c2 100644
--- a/meta-oe/recipes-multimedia/esound/esound/0001-audio_alsa09.c-alsa-drain-fix.patch
+++ b/meta-oe/recipes-multimedia/esound/esound/0001-audio_alsa09.c-alsa-drain-fix.patch
@@ -1,9 +1,10 @@
-From a860fe0796c43e35eac9783140fcb563cab9f55a Mon Sep 17 00:00:00 2001
+From 945df2da87a412758ceab4ac5711abbb269a47c1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 8 Jun 2017 23:09:51 -0700
-Subject: [PATCH 1/3] audio_alsa09.c: alsa drain fix
+Subject: [PATCH] audio_alsa09.c: alsa drain fix
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  audio_alsa09.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -21,6 +22,3 @@ index 534e3db..d9450e6 100644
    
  	if (alsadbg) 
  		print_state();
--- 
-2.13.1
-
diff --git a/meta-oe/recipes-multimedia/esound/esound/0002-Undefine-open64-and-fopen64.patch b/meta-oe/recipes-multimedia/esound/esound/0002-Undefine-open64-and-fopen64.patch
index 337546a..10a6ba0 100644
--- a/meta-oe/recipes-multimedia/esound/esound/0002-Undefine-open64-and-fopen64.patch
+++ b/meta-oe/recipes-multimedia/esound/esound/0002-Undefine-open64-and-fopen64.patch
@@ -1,11 +1,12 @@
-From 1fbee6e96384f340b816e221fe1c2f3ff0b487bf Mon Sep 17 00:00:00 2001
+From e218d5a0a545ebb9623d62da5cfca478f9c90fce Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 8 Jun 2017 23:11:31 -0700
-Subject: [PATCH 2/3] Undefine open64 and fopen64
+Subject: [PATCH] Undefine open64 and fopen64
 
 Since the signatures do not match with libc
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  esddsp.c | 2 ++
  1 file changed, 2 insertions(+)
@@ -30,6 +31,3 @@ index d3c6ea9..17b5949 100644
  FILE *
  fopen64 (const char *path, const char *mode)
  {
--- 
-2.13.1
-
diff --git a/meta-oe/recipes-multimedia/esound/esound/0003-Use-I-path-in-configure.patch b/meta-oe/recipes-multimedia/esound/esound/0003-Use-I-path-in-configure.patch
index 62c880d..83365b4 100644
--- a/meta-oe/recipes-multimedia/esound/esound/0003-Use-I-path-in-configure.patch
+++ b/meta-oe/recipes-multimedia/esound/esound/0003-Use-I-path-in-configure.patch
@@ -1,12 +1,13 @@
-From 979a02d9ec9c28686021cd2b49ca55d2195c9dce Mon Sep 17 00:00:00 2001
+From 89c62db54716d514e639f9e1bfd3c1f7d82641dd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 8 Jun 2017 23:12:36 -0700
-Subject: [PATCH 3/3] Use -I=<path> in configure
+Subject: [PATCH] Use -I=<path> in configure
 
 This helps to use proper sysroot in
 cross build environment
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  configure.ac | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -33,6 +34,3 @@ index 5645dce..d374cda 100644
  	SOUND_LIBS=-lmme
        esac
     fi
--- 
-2.13.1
-
diff --git a/meta-oe/recipes-multimedia/esound/esound/no-docs.patch b/meta-oe/recipes-multimedia/esound/esound/no-docs.patch
index fc69f1a..8a546e6 100644
--- a/meta-oe/recipes-multimedia/esound/esound/no-docs.patch
+++ b/meta-oe/recipes-multimedia/esound/esound/no-docs.patch
@@ -1,11 +1,19 @@
-Index: esound-0.2.36/Makefile.am
-===================================================================
---- esound-0.2.36.orig/Makefile.am
-+++ esound-0.2.36/Makefile.am
+From bfcaa9bdc70440db96f10afc0c2a792870f75acb Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Fri, 3 Jun 2011 19:39:02 +0200
+
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 08c4c94..ede9d26 100644
+--- a/Makefile.am
++++ b/Makefile.am
 @@ -1,5 +1,5 @@
  
 -SUBDIRS = docs
 +SUBDIRS = 
  
- ACLOCAL_FLAGS = -I m4
+ ACLOCAL_AMFLAGS = -I m4
  
-- 
2.7.4


