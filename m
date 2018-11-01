Return-Path: <ryan.harkin@linaro.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 538E379EA0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Nov 2018 17:16:57 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p2-v6so1932509wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Nov 2018 10:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=9CM0S1asprzCGOvnVZWg3tLiLC3cvWoa8d51min976Q=;
	b=jB4ZqtpoZ2A/nLx6ji4AgDOTSVP4APC7q8rvhhL3d1FXhZzfBMGHqiROuUTS6GBQAJ
	7DS79jIoREs+idvkm4gkYPd5jACip3cvbhXXRA8zCQE1SAAxtUEwpB7fJc2pOjW6KLuI
	Ob9hQx36iv6jfDGSZrcEtpZDL05DjXzw4XJV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9CM0S1asprzCGOvnVZWg3tLiLC3cvWoa8d51min976Q=;
	b=t+yczlenw5ATYf8Sc7LGs7HprCMsf3t1B50eWoHH1dzpwR3V6quNu/qAR2+ngPRP/V
	ehMSTpbSOgGZJO8Mjw+P8aMFu3UBiWlUSL2j7S+hmBFKHhtvL0hwLLKT5TeZTsz8VMLi
	HcQoqrcP9o7bCVyNf6mGXJi37RYSCAvx2SRRynL02RF14WhtYfweIaqaG2KDzK18PjrY
	BYK5M31vwbNCKOfsXFgudj1PavNTQfcsQRDuugcFX5ICAG4LiLsvUXqnEIv2yw16sx7e
	PBp9Fgqrkm4rY+IP5PEKjVRidOc1dIOO7r+5SAF/g/P936Gjj4GFvwPtQvPkpW4kuc07
	bFdQ==
X-Gm-Message-State: AGRZ1gIPr6kDA4eJTUFwK9ugsbCJPA3eaJe4mi16DNN59OfySRnpc2e+
	6SpvqyZ8SjzAWkVB83T3m736fXEE5t8=
X-Google-Smtp-Source: AJdET5doomfaz2wt2QC/8alCQs+LxZZ82hBaGmmlhVi9FY/UIsp6L5tUxmgQM34NweoEf8qFvYkYAQ==
X-Received: by 2002:a1c:7dd7:: with SMTP id
	y206-v6mr6548955wmc.78.1541092617108; 
	Thu, 01 Nov 2018 10:16:57 -0700 (PDT)
Received: from localhost.localdomain (82-69-54-187.dsl.in-addr.zen.co.uk.
	[82.69.54.187]) by smtp.gmail.com with ESMTPSA id
	k66-v6sm13829549wmd.47.2018.11.01.10.16.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 10:16:56 -0700 (PDT)
From: Ryan Harkin <ryan.harkin@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Nov 2018 17:16:54 +0000
Message-Id: <20181101171654.29100-1-ryan.harkin@linaro.org>
X-Mailer: git-send-email 2.17.1
Cc: ismo.puustinen@intel.com
Subject: [meta-oe][PATCH] v4l-utils: update to 1.16.0
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
X-List-Received-Date: Thu, 01 Nov 2018 17:16:57 -0000

Also remove two patches that have been merged upstream into v4l-util
since 1.12.3 and update the diff for patch 0002-contrib-* to prevent a
build warning.

Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
---
 ...o-not-assume-building-in-source-tree.patch | 108 ------------------
 ...fine-TEMP_FAILURE_RETRY-if-undefined.patch |  53 ---------
 ...k-mc_nextgen_test-with-libargp-if-ne.patch |  10 +-
 ...4l-utils_1.12.3.bb => v4l-utils_1.16.0.bb} |   6 +-
 4 files changed, 8 insertions(+), 169 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-buildsystem-do-not-assume-building-in-source-tree.patch
 delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-ir-ctl-Define-TEMP_FAILURE_RETRY-if-undefined.patch
 rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.12.3.bb => v4l-utils_1.16.0.bb} (87%)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-buildsystem-do-not-assume-building-in-source-tree.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-buildsystem-do-not-assume-building-in-source-tree.patch
deleted file mode 100644
index 12609d30e..000000000
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-buildsystem-do-not-assume-building-in-source-tree.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 75372b8088c20474497b79ec6cf1e99f2d17f56d Mon Sep 17 00:00:00 2001
-From: Ismo Puustinen <ismo.puustinen@intel.com>
-Date: Mon, 3 Apr 2017 13:23:38 +0300
-Subject: [PATCH] buildsystem: do not assume building in source tree.
-
-Use $(top_srcdir) as reference for include paths and buildtime scripts.
-Otherwise compilation outside of project root directory will fail
-because header and script paths are wrong.
-
-To reproduce: mkdir b; cd b; ../configure; make
-
-Upstream-status: Accepted [https://git.linuxtv.org//v4l-utils.git/commit/?id=bd98c9a99bffc8d44c54859345e4dfee0ada4275]
-
-Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
-
----
- utils/cec-compliance/Makefile.am  | 2 +-
- utils/cec-ctl/Makefile.am         | 2 +-
- utils/cec-follower/Makefile.am    | 4 ++--
- utils/qv4l2/Makefile.am           | 2 +-
- utils/v4l2-compliance/Makefile.am | 2 +-
- utils/v4l2-ctl/Makefile.am        | 2 +-
- 6 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/utils/cec-compliance/Makefile.am b/utils/cec-compliance/Makefile.am
-index f05fe6c..f7d1535 100644
---- a/utils/cec-compliance/Makefile.am
-+++ b/utils/cec-compliance/Makefile.am
-@@ -7,7 +7,7 @@ cec_compliance_LDFLAGS = -lrt
- cec-compliance.cpp: cec-table.h
- 
- cec-table.h: ../cec-ctl/msg2ctl.pl ../../include/linux/cec.h ../../include/linux/cec-funcs.h
--	../cec-ctl/msg2ctl.pl 2 ../../include/linux/cec.h ../../include/linux/cec-funcs.h >$@
-+	$(top_srcdir)/utils/cec-ctl/msg2ctl.pl 2 $(top_srcdir)/include/linux/cec.h $(top_srcdir)/include/linux/cec-funcs.h >$@
- 
- cec-compliance.cpp: version.h
- 
-diff --git a/utils/cec-ctl/Makefile.am b/utils/cec-ctl/Makefile.am
-index 4a6eae5..570a070 100644
---- a/utils/cec-ctl/Makefile.am
-+++ b/utils/cec-ctl/Makefile.am
-@@ -6,7 +6,7 @@ cec_ctl_SOURCES = cec-ctl.cpp
- cec-ctl.cpp: cec-ctl-gen.h
- 
- cec-ctl-gen.h: msg2ctl.pl ../../include/linux/cec.h ../../include/linux/cec-funcs.h
--	./msg2ctl.pl 0 ../../include/linux/cec.h ../../include/linux/cec-funcs.h >$@
-+	$(top_srcdir)/utils/cec-ctl/msg2ctl.pl 0 $(top_srcdir)/include/linux/cec.h $(top_srcdir)/include/linux/cec-funcs.h >$@
- 
- clean-local:
- 	-rm -vf cec-ctl-gen.h
-diff --git a/utils/cec-follower/Makefile.am b/utils/cec-follower/Makefile.am
-index d8ad292..e3553eb 100644
---- a/utils/cec-follower/Makefile.am
-+++ b/utils/cec-follower/Makefile.am
-@@ -7,12 +7,12 @@ cec_follower_LDFLAGS = -lrt
- cec-log.cpp: cec-log.h
- 
- cec-log.h: ../cec-ctl/msg2ctl.pl ../../include/linux/cec.h ../../include/linux/cec-funcs.h
--	../cec-ctl/msg2ctl.pl 1 ../../include/linux/cec.h ../../include/linux/cec-funcs.h >$@
-+	$(top_srcdir)/utils/cec-ctl/msg2ctl.pl 1 $(top_srcdir)/include/linux/cec.h $(top_srcdir)/include/linux/cec-funcs.h >$@
- 
- cec-follower.cpp: cec-table.h version.h
- 
- cec-table.h: ../cec-ctl/msg2ctl.pl ../../include/linux/cec.h ../../include/linux/cec-funcs.h
--	../cec-ctl/msg2ctl.pl 2 ../../include/linux/cec.h ../../include/linux/cec-funcs.h >$@
-+	$(top_srcdir)/utils/cec-ctl/msg2ctl.pl 2 $(top_srcdir)/include/linux/cec.h $(top_srcdir)/include/linux/cec-funcs.h >$@
- 
- version.h:
- 	@if git show-ref -s HEAD >/dev/null 2>&1; then \
-diff --git a/utils/qv4l2/Makefile.am b/utils/qv4l2/Makefile.am
-index fd58486..ccd1a2a 100644
---- a/utils/qv4l2/Makefile.am
-+++ b/utils/qv4l2/Makefile.am
-@@ -8,7 +8,7 @@ qv4l2_SOURCES = qv4l2.cpp general-tab.cpp ctrl-tab.cpp vbi-tab.cpp capture-win.c
- nodist_qv4l2_SOURCES = moc_qv4l2.cpp moc_general-tab.cpp moc_capture-win.cpp moc_vbi-tab.cpp qrc_qv4l2.cpp
- qv4l2_LDADD = ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la \
-   ../libv4l2util/libv4l2util.la ../libmedia_dev/libmedia_dev.la
--qv4l2_CPPFLAGS = -I../common
-+qv4l2_CPPFLAGS = -I$(top_srcdir)/utils/common
- 
- if WITH_QTGL
- qv4l2_CPPFLAGS += $(QTGL_CFLAGS)
-diff --git a/utils/v4l2-compliance/Makefile.am b/utils/v4l2-compliance/Makefile.am
-index c2b5919..fb8d12e 100644
---- a/utils/v4l2-compliance/Makefile.am
-+++ b/utils/v4l2-compliance/Makefile.am
-@@ -5,7 +5,7 @@ DEFS :=
- v4l2_compliance_SOURCES = v4l2-compliance.cpp v4l2-test-debug.cpp v4l2-test-input-output.cpp \
- 	v4l2-test-controls.cpp v4l2-test-io-config.cpp v4l2-test-formats.cpp v4l2-test-buffers.cpp \
- 	v4l2-test-codecs.cpp v4l2-test-colors.cpp v4l2-compliance.h
--v4l2_compliance_CPPFLAGS = -I../common
-+v4l2_compliance_CPPFLAGS = -I$(top_srcdir)/utils/common
- 
- if WITH_V4L2_COMPLIANCE_LIBV4L
- v4l2_compliance_LDADD = ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la -lrt -lpthread
-diff --git a/utils/v4l2-ctl/Makefile.am b/utils/v4l2-ctl/Makefile.am
-index 955647d..825e53f 100644
---- a/utils/v4l2-ctl/Makefile.am
-+++ b/utils/v4l2-ctl/Makefile.am
-@@ -7,7 +7,7 @@ v4l2_ctl_SOURCES = v4l2-ctl.cpp v4l2-ctl.h v4l2-ctl-common.cpp v4l2-ctl-tuner.cp
- 	v4l2-ctl-overlay.cpp v4l2-ctl-vbi.cpp v4l2-ctl-selection.cpp v4l2-ctl-misc.cpp \
- 	v4l2-ctl-streaming.cpp v4l2-ctl-sdr.cpp v4l2-ctl-edid.cpp v4l2-ctl-modes.cpp \
- 	v4l2-tpg-colors.c v4l2-tpg-core.c v4l-stream.c
--v4l2_ctl_CPPFLAGS = -I../common
-+v4l2_ctl_CPPFLAGS = -I$(top_srcdir)/utils/common
- 
- if WITH_V4L2_CTL_LIBV4L
- v4l2_ctl_LDADD = ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la -lrt -lpthread
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-ir-ctl-Define-TEMP_FAILURE_RETRY-if-undefined.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-ir-ctl-Define-TEMP_FAILURE_RETRY-if-undefined.patch
deleted file mode 100644
index 82fc3e120..000000000
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-ir-ctl-Define-TEMP_FAILURE_RETRY-if-undefined.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From b2efcc20617d6317f74c4acb2a6af5b765f20b34 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 14 Jul 2017 13:11:25 -0700
-Subject: [PATCH] ir-ctl: Define TEMP_FAILURE_RETRY if undefined
-
-use strndup() instead of strndupa() which is not
-universally available in C libraries
-
-Taken from AlpineLinux
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- utils/ir-ctl/ir-ctl.c | 14 +++++++++++++-
- 1 file changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
-index bc58cee..1a44011 100644
---- a/utils/ir-ctl/ir-ctl.c
-+++ b/utils/ir-ctl/ir-ctl.c
-@@ -42,6 +42,16 @@
- # define _(string) string
- #endif
- 
-+/* taken from glibc unistd.h */
-+#ifndef TEMP_FAILURE_RETRY
-+#define TEMP_FAILURE_RETRY(expression) \
-+  (__extension__                                                              \
-+    ({ long int __result;                                                     \
-+       do __result = (long int) (expression);                                 \
-+       while (__result == -1L && errno == EINTR);                             \
-+       __result; }))
-+#endif
-+
- # define N_(string) string
- 
- 
-@@ -344,12 +354,14 @@ static struct file *read_scancode(const char *name)
- 		return NULL;
- 	}
- 
--	pstr = strndupa(name, p - name);
-+	pstr = strndup(name, p - name);
- 
- 	if (!protocol_match(pstr, &proto)) {
- 		fprintf(stderr, _("error: protocol '%s' not found\n"), pstr);
-+		free(pstr);
- 		return NULL;
- 	}
-+	free(pstr);
- 
- 	if (!strtoscancode(p + 1, &scancode)) {
- 		fprintf(stderr, _("error: invalid scancode '%s'\n"), p + 1);
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch
index a779a307d..8033fcacf 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch
@@ -6,17 +6,16 @@ Subject: [PATCH] contrib/test: Link mc_nextgen_test with libargp if needed
 musl depends on external argp implementation e.g.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  contrib/test/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/contrib/test/Makefile.am b/contrib/test/Makefile.am
-index 4641e21..e47b948 100644
+index 0188fe2..dac07f3 100644
 --- a/contrib/test/Makefile.am
 +++ b/contrib/test/Makefile.am
-@@ -32,7 +32,7 @@ v4l2gl_LDFLAGS = $(X11_LIBS) $(GL_LIBS) $(GLU_LIBS) $(ARGP_LIBS)
- v4l2gl_LDADD = ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la
+@@ -40,7 +40,7 @@ sdlcam_CFLAGS = -I../.. $(SDL2_CFLAGS)
+ sdlcam_LDADD = ../../lib/libv4l2/libv4l2.la  ../../lib/libv4lconvert/libv4lconvert.la
  
  mc_nextgen_test_CFLAGS = $(LIBUDEV_CFLAGS)
 -mc_nextgen_test_LDFLAGS = $(LIBUDEV_LIBS)
@@ -24,3 +23,6 @@ index 4641e21..e47b948 100644
  
  
  ioctl_test_SOURCES = ioctl-test.c ioctl-test.h ioctl_32.h ioctl_64.h
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.16.0.bb
similarity index 87%
rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.16.0.bb
index 3bcbed850..bcead00b0 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.16.0.bb
@@ -17,15 +17,13 @@ PACKAGECONFIG[media-ctl] = "--enable-v4l-utils,--disable-v4l-utils,,"
 
 SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2 \
            file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch \
-           file://0001-buildsystem-do-not-assume-building-in-source-tree.patch \
            file://mediactl-pkgconfig.patch \
            file://export-mediactl-headers.patch \
-           file://0001-ir-ctl-Define-TEMP_FAILURE_RETRY-if-undefined.patch \
            file://0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch \
            file://0003-v4l2-ctl-Do-not-use-getsubopt.patch \
            "
-SRC_URI[md5sum] = "89e1ed6c69c94e0489dc0a638c7841aa"
-SRC_URI[sha256sum] = "5a47dd6f0e7dfe902d94605c01d385a4a4e87583ff5856d6f181900ea81cf46e"
+SRC_URI[md5sum] = "21a6ec3605a1c3114c8ccb70a963c871"
+SRC_URI[sha256sum] = "f1b425584284bac378b76331c0671dc890bd7af49c03e8a6cc0c70e57eea0bad"
 
 EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/udev"
 
-- 
2.17.1


