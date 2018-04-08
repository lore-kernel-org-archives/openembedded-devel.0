Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f53.google.com (mail-pl0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6AF3E75577
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:12 +0000 (UTC)
Received: by mail-pl0-f53.google.com with SMTP id 61-v6so3206449plb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8p0a0K6OSpxPq4m6oagNq1EG3rRYF81xPiYokSSjz8w=;
	b=Mx2Otppuf/x2h9FUtBvCsbUfB4xhK/bnA/K044vDZWDXERXaNIAR5eXcpHB8ahGQrb
	gp49Od980MsCkbwjuvzVpGNsJWg/sCJgqkpJCmHCEDqS4LCI9PwXVGc3WUV953mxaIto
	5fchGlwjNjO2zxaJWpnZ+4xzfTRPt2yzl2JCWHhSveM71IfkevPkKznlW+dHOlWfY4YU
	1nEmYa0CbmVDiOXPN+FsQ637Iq2BLYcGADY3qLZ9H41pknf2M3wUkv4ePwp6Xm4yUc/G
	WngsW3VLvP79qlq68eTzJqfKZmrycID3kI3ohMRxwOe73hsqtheydvhP8cZrOGcBSPm7
	ZTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8p0a0K6OSpxPq4m6oagNq1EG3rRYF81xPiYokSSjz8w=;
	b=Se9dTUYLWYwAW5shjjt55Wa8WL3eNugwRAyVyXKIFnPMMt2NjtaBIJBrjT753Qd3iK
	wFrJ3er/jmF2nHxtmvYMqlbL+KECLHyU2gFwY3vFNNf1a8dHWppUwJ6ZwHnzbxQvSNN9
	OdekaXNBnqrLOXMhe7FNQfl+wk8Agk/FuUtcspo41ogaVqjVaTI7voK9lbiI0NTgnHy3
	1zHKv3m0A98IJH8jI4TTZoSg3cRhOLnMj34tgYKnjZpyu2IEuu1bse7BpuNExmOvm/DV
	b3JSzRYHuTyp/kNr2r+reLZDMCKFcZnpDQS4fb2zl59CckHkH0yOoZS3TEq8uGVs5K7c
	o6JA==
X-Gm-Message-State: AElRT7Hw/DjVh3fdk3lxBrgXq5295WlBZ0STkbcAWFVgvGcfn81B4qM9
	9zijOp+mrE/VwrGNbn51MopUUw==
X-Google-Smtp-Source: AIpwx4+r+MrI7mILBuscr3/b3Y8HsASiiG667BxOZCn9jZObT2dQfEsI0gBMyxyPcJLqcvf72tOO9g==
X-Received: by 2002:a17:902:8212:: with SMTP id
	x18-v6mr34832279pln.372.1523170754143; 
	Sat, 07 Apr 2018 23:59:14 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:34 -0700
Message-Id: <1523170729-26321-22-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 22/37] v4l-utils: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:13 -0000

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
checking file utils/cec-compliance/Makefile.am
checking file utils/cec-ctl/Makefile.am
Hunk #1 succeeded at 6 (offset -1 lines).
checking file utils/cec-follower/Makefile.am
Hunk #1 succeeded at 7 with fuzz 1.
checking file utils/qv4l2/Makefile.am
checking file utils/v4l2-compliance/Makefile.am
checking file utils/v4l2-ctl/Makefile.am

and more

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...dia-ctl-Don-t-install-libmediactl-and-libv4.patch |  6 ++----
 ...ystem-do-not-assume-building-in-source-tree.patch | 20 +++++++++-----------
 ...-ctl-Define-TEMP_FAILURE_RETRY-if-undefined.patch |  8 +++-----
 ...est-Link-mc_nextgen_test-with-libargp-if-ne.patch |  8 +++-----
 .../0003-v4l2-ctl-Do-not-use-getsubopt.patch         |  8 +++-----
 .../v4l2apps/v4l-utils/export-mediactl-headers.patch | 20 ++++++++++++++------
 .../v4l2apps/v4l-utils/mediactl-pkgconfig.patch      | 18 +++++++++++++-----
 7 files changed, 47 insertions(+), 41 deletions(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
index 7413094..eb294b3 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
@@ -1,4 +1,4 @@
-From 2d6bfa75b2e16b4d764f1bf00bb902fb4b5e507b Mon Sep 17 00:00:00 2001
+From 67a6e919b8263d6d2b7150e62f26fb06bbc526ef Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 27 Feb 2015 21:55:36 +0000
 Subject: [PATCH] Revert "media-ctl: Don't install libmediactl and
@@ -10,6 +10,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Conflicts:
 	utils/media-ctl/Makefile.am
+
 ---
  utils/media-ctl/Makefile.am | 10 +++-------
  1 file changed, 3 insertions(+), 7 deletions(-)
@@ -40,6 +41,3 @@ index ee7dcc9..d11fa2e 100644
  mediactl_includedir=$(includedir)/mediactl
  noinst_HEADERS = mediactl.h v4l2subdev.h
  
--- 
-2.9.3
-
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-buildsystem-do-not-assume-building-in-source-tree.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-buildsystem-do-not-assume-building-in-source-tree.patch
index 54161f9..12609d3 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-buildsystem-do-not-assume-building-in-source-tree.patch
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-buildsystem-do-not-assume-building-in-source-tree.patch
@@ -1,7 +1,7 @@
-From 806822f5acb756d5acda0f9063c84b28b38b3ffb Mon Sep 17 00:00:00 2001
+From 75372b8088c20474497b79ec6cf1e99f2d17f56d Mon Sep 17 00:00:00 2001
 From: Ismo Puustinen <ismo.puustinen@intel.com>
 Date: Mon, 3 Apr 2017 13:23:38 +0300
-Subject: [PATCH v4l-utils] buildsystem: do not assume building in source tree.
+Subject: [PATCH] buildsystem: do not assume building in source tree.
 
 Use $(top_srcdir) as reference for include paths and buildtime scripts.
 Otherwise compilation outside of project root directory will fail
@@ -12,6 +12,7 @@ To reproduce: mkdir b; cd b; ../configure; make
 Upstream-status: Accepted [https://git.linuxtv.org//v4l-utils.git/commit/?id=bd98c9a99bffc8d44c54859345e4dfee0ada4275]
 
 Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
+
 ---
  utils/cec-compliance/Makefile.am  | 2 +-
  utils/cec-ctl/Makefile.am         | 2 +-
@@ -22,7 +23,7 @@ Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
  6 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/utils/cec-compliance/Makefile.am b/utils/cec-compliance/Makefile.am
-index ec5de51..8331aa0 100644
+index f05fe6c..f7d1535 100644
 --- a/utils/cec-compliance/Makefile.am
 +++ b/utils/cec-compliance/Makefile.am
 @@ -7,7 +7,7 @@ cec_compliance_LDFLAGS = -lrt
@@ -35,10 +36,10 @@ index ec5de51..8331aa0 100644
  cec-compliance.cpp: version.h
  
 diff --git a/utils/cec-ctl/Makefile.am b/utils/cec-ctl/Makefile.am
-index 0a7ef22..6afb6c9 100644
+index 4a6eae5..570a070 100644
 --- a/utils/cec-ctl/Makefile.am
 +++ b/utils/cec-ctl/Makefile.am
-@@ -7,7 +7,7 @@ cec_ctl_LDFLAGS = -lrt
+@@ -6,7 +6,7 @@ cec_ctl_SOURCES = cec-ctl.cpp
  cec-ctl.cpp: cec-ctl-gen.h
  
  cec-ctl-gen.h: msg2ctl.pl ../../include/linux/cec.h ../../include/linux/cec-funcs.h
@@ -48,7 +49,7 @@ index 0a7ef22..6afb6c9 100644
  clean-local:
  	-rm -vf cec-ctl-gen.h
 diff --git a/utils/cec-follower/Makefile.am b/utils/cec-follower/Makefile.am
-index 538edb2..fdbf3d9 100644
+index d8ad292..e3553eb 100644
 --- a/utils/cec-follower/Makefile.am
 +++ b/utils/cec-follower/Makefile.am
 @@ -7,12 +7,12 @@ cec_follower_LDFLAGS = -lrt
@@ -65,7 +66,7 @@ index 538edb2..fdbf3d9 100644
 +	$(top_srcdir)/utils/cec-ctl/msg2ctl.pl 2 $(top_srcdir)/include/linux/cec.h $(top_srcdir)/include/linux/cec-funcs.h >$@
  
  version.h:
- 	@if git rev-parse HEAD >/dev/null 2>&1; then \
+ 	@if git show-ref -s HEAD >/dev/null 2>&1; then \
 diff --git a/utils/qv4l2/Makefile.am b/utils/qv4l2/Makefile.am
 index fd58486..ccd1a2a 100644
 --- a/utils/qv4l2/Makefile.am
@@ -80,7 +81,7 @@ index fd58486..ccd1a2a 100644
  if WITH_QTGL
  qv4l2_CPPFLAGS += $(QTGL_CFLAGS)
 diff --git a/utils/v4l2-compliance/Makefile.am b/utils/v4l2-compliance/Makefile.am
-index 03db8df..18b9892 100644
+index c2b5919..fb8d12e 100644
 --- a/utils/v4l2-compliance/Makefile.am
 +++ b/utils/v4l2-compliance/Makefile.am
 @@ -5,7 +5,7 @@ DEFS :=
@@ -105,6 +106,3 @@ index 955647d..825e53f 100644
  
  if WITH_V4L2_CTL_LIBV4L
  v4l2_ctl_LDADD = ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la -lrt -lpthread
--- 
-2.9.3
-
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-ir-ctl-Define-TEMP_FAILURE_RETRY-if-undefined.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-ir-ctl-Define-TEMP_FAILURE_RETRY-if-undefined.patch
index f1e11da..82fc3e1 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-ir-ctl-Define-TEMP_FAILURE_RETRY-if-undefined.patch
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-ir-ctl-Define-TEMP_FAILURE_RETRY-if-undefined.patch
@@ -1,7 +1,7 @@
-From e60aea50e41ae8a17672beb5859beecb66e7a305 Mon Sep 17 00:00:00 2001
+From b2efcc20617d6317f74c4acb2a6af5b765f20b34 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 14 Jul 2017 13:11:25 -0700
-Subject: [PATCH 1/3] ir-ctl: Define TEMP_FAILURE_RETRY if undefined
+Subject: [PATCH] ir-ctl: Define TEMP_FAILURE_RETRY if undefined
 
 use strndup() instead of strndupa() which is not
 universally available in C libraries
@@ -9,6 +9,7 @@ universally available in C libraries
 Taken from AlpineLinux
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  utils/ir-ctl/ir-ctl.c | 14 +++++++++++++-
  1 file changed, 13 insertions(+), 1 deletion(-)
@@ -50,6 +51,3 @@ index bc58cee..1a44011 100644
  
  	if (!strtoscancode(p + 1, &scancode)) {
  		fprintf(stderr, _("error: invalid scancode '%s'\n"), p + 1);
--- 
-2.13.3
-
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch
index 2fb4057..a779a30 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch
@@ -1,11 +1,12 @@
-From b3acc4c6407f9553f32582a9aee6a11b5fcd1d8a Mon Sep 17 00:00:00 2001
+From 49f865a17d62db7bbd333a9b83fadeea55686e35 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 14 Jul 2017 13:17:19 -0700
-Subject: [PATCH 2/3] contrib/test: Link mc_nextgen_test with libargp if needed
+Subject: [PATCH] contrib/test: Link mc_nextgen_test with libargp if needed
 
 musl depends on external argp implementation e.g.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  contrib/test/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -23,6 +24,3 @@ index 4641e21..e47b948 100644
  
  
  ioctl_test_SOURCES = ioctl-test.c ioctl-test.h ioctl_32.h ioctl_64.h
--- 
-2.13.3
-
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-v4l2-ctl-Do-not-use-getsubopt.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-v4l2-ctl-Do-not-use-getsubopt.patch
index 0a986ae..5b84af2 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-v4l2-ctl-Do-not-use-getsubopt.patch
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-v4l2-ctl-Do-not-use-getsubopt.patch
@@ -1,7 +1,7 @@
-From d04aa6866cbea57c4a81b033cd60586a9436ac6b Mon Sep 17 00:00:00 2001
+From f7a4b79b3323534460a63b3e6c58ebaf06adf207 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 14 Jul 2017 13:20:05 -0700
-Subject: [PATCH 3/3] v4l2-ctl: Do not use getsubopt
+Subject: [PATCH] v4l2-ctl: Do not use getsubopt
 
 POSIX says that behavior when subopts list is empty is undefined.
 musl libs will set value to NULL which leads to crash.
@@ -9,6 +9,7 @@ musl libs will set value to NULL which leads to crash.
 Taken from AlpineLinux
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  utils/v4l2-ctl/v4l2-ctl-common.cpp | 19 ++++++++++---------
  1 file changed, 10 insertions(+), 9 deletions(-)
@@ -44,6 +45,3 @@ index 3ea6cd3..291fb3e 100644
  }
  
  void common_cmd(int ch, char *optarg)
--- 
-2.13.3
-
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/export-mediactl-headers.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/export-mediactl-headers.patch
index c610e7e..55a5cdc 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/export-mediactl-headers.patch
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/export-mediactl-headers.patch
@@ -1,9 +1,17 @@
-Index: v4l-utils-1.6.2/utils/media-ctl/Makefile.am
-===================================================================
---- v4l-utils-1.6.2.orig/utils/media-ctl/Makefile.am
-+++ v4l-utils-1.6.2/utils/media-ctl/Makefile.am
-@@ -4,8 +4,8 @@ libmediactl_la_CFLAGS = $(LIBUDEV_CFLAGS
- libmediactl_la_LDFLAGS = $(LIBUDEV_LIBS)
+From b82e509c10659a4647961a6da3adf4d285dea2dd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 1 Mar 2015 22:25:07 +0000
+
+---
+ utils/media-ctl/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
+index 7c520a2..748353d 100644
+--- a/utils/media-ctl/Makefile.am
++++ b/utils/media-ctl/Makefile.am
+@@ -17,8 +17,8 @@ CLEANFILES = $(BUILT_SOURCES)
+ nodist_libv4l2subdev_la_SOURCES = $(BUILT_SOURCES)
  libv4l2subdev_la_SOURCES = libv4l2subdev.c
  libv4l2subdev_la_LIBADD = libmediactl.la
 -mediactl_includedir=$(includedir)/mediactl
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/mediactl-pkgconfig.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/mediactl-pkgconfig.patch
index 34fb3cf..9fcf611 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/mediactl-pkgconfig.patch
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/mediactl-pkgconfig.patch
@@ -1,8 +1,16 @@
-Index: v4l-utils-1.6.2/utils/media-ctl/Makefile.am
-===================================================================
---- v4l-utils-1.6.2.orig/utils/media-ctl/Makefile.am
-+++ v4l-utils-1.6.2/utils/media-ctl/Makefile.am
-@@ -7,6 +7,7 @@ libv4l2subdev_la_LIBADD = libmediactl.la
+From 480c04ac6a9d11bfef9d4aca073052fdcee4fdea Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 1 Mar 2015 22:25:07 +0000
+
+---
+ utils/media-ctl/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
+index d11fa2e..7c520a2 100644
+--- a/utils/media-ctl/Makefile.am
++++ b/utils/media-ctl/Makefile.am
+@@ -20,6 +20,7 @@ libv4l2subdev_la_LIBADD = libmediactl.la
  mediactl_includedir=$(includedir)/mediactl
  noinst_HEADERS = mediactl.h v4l2subdev.h
  
-- 
2.7.4


