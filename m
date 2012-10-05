Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TK5j5-0001ez-4V
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Oct 2012 13:05:51 +0200
Received: by mail-bk0-f47.google.com with SMTP id jk7so784146bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Oct 2012 03:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=bAAclljVooyg1QyrZZfKKf7/tkyjND7cYDAzyjrRvFs=;
	b=OGZWsE2MOoQO27UMZZVmhb5gcaobPJFRkOgYC22UkXloDtZVQbcm0SelJc5LMTKiGG
	Y4+XET36bNemn7egb/emjvXgvumaSxn1pjGxYqDsFD8xuUzRgZ0nI0/6ETxDcsdcTI+C
	iGMZJcbNRkwzHtaC73sb4OSpl0o8a/CtG2qJpeTIgPrD9OWjrPONNTomG1Y9SHcHz6ym
	z9fD6DOkaajTCjZQ67ECag9RtNYx4H772g5ZzAvlo5eBoib5JqDeZ++uAizkx/eoDq34
	TsA/gvRGXEEcV+r5vxs/KkIQO3/KtW1S3A2e0UUeT0mqMivATJp25wETCsPWtroxt/jT
	7deg==
Received: by 10.204.148.21 with SMTP id n21mr2650369bkv.124.1349434368833;
	Fri, 05 Oct 2012 03:52:48 -0700 (PDT)
Received: from localhost (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id t27sm7366779bkv.10.2012.10.05.03.52.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 03:52:47 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Oct 2012 12:52:43 +0200
Message-Id: <1349434363-14335-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQle8avNdRA/K7/PpGLzJJWq4kTRqyLBwYfxVvHs6RIY2kux68910SBnP+hMpvgCVIQpBM9U
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] v4l-utils: fix build breakage
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
X-List-Received-Date: Fri, 05 Oct 2012 11:05:51 -0000

Update to a newer SRCREV for fixed and get autotools support as a bonus.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../v4l-utils/0001-disable-qv4l2-build.patch       |   39 --------------------
 .../recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb |   27 ++++++--------
 2 files changed, 11 insertions(+), 55 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-disable-qv4l2-build.patch

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-disable-qv4l2-build.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-disable-qv4l2-build.patch
deleted file mode 100644
index 4b11038..0000000
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-disable-qv4l2-build.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 1422d4c562660407919fb753dc5f074293b395e5 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Mon, 16 Jul 2012 12:00:34 +0200
-Subject: [PATCH] disable qv4l2 build
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- utils/Makefile |   15 ---------------
- 1 files changed, 0 insertions(+), 15 deletions(-)
-
-diff --git a/utils/Makefile b/utils/Makefile
-index 014b82d..db74851 100644
---- a/utils/Makefile
-+++ b/utils/Makefile
-@@ -5,21 +5,6 @@ all install:
- 		$(MAKE) -C $$i $@ || exit 1; \
- 	done
- 
--	# Test whether qmake is installed, and whether it is for qt4.
--	@if which qmake-qt4 >/dev/null 2>&1; then \
--		QMAKE=qmake-qt4; \
--	else \
--		QMAKE=qmake; \
--	fi; \
--	if which $$QMAKE >/dev/null 2>&1; then \
--		if $$QMAKE --version 2>&1 | grep '4\.[0-9][0-9]*\.[0-9][0-9]*' >/dev/null; then \
--			if [ ! -f qv4l2/Makefile ]; then \
--				(cd qv4l2 && $$QMAKE) || exit 1; \
--			fi; \
--			$(MAKE) -C qv4l2 -f Makefile.install $@; \
--		fi \
--	fi
--
- sync-with-kernel:
- 	$(MAKE) -C keytable $@
- 	$(MAKE) -C v4l2-dbg $@
--- 
-1.7.7.6
-
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
index e5d1fc2..ce5c5e1 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
@@ -3,39 +3,34 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
                     file://COPYING.LIB;md5=d749e86a105281d7a44c2328acebc4b0"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "jpeg"
 
+inherit autotools gettext
+
 # libv4l was absorbed into this, let OE know that
 PROVIDES = "libv4l"
 
 SRC_URI = "git://linuxtv.org/v4l-utils.git;protocol=git \
-           file://0001-disable-qv4l2-build.patch \
           "
 # 54f16ca8183dd8ae8bf4ccc07949795aff0301f5 -> v0.8.8 tag
-SRCREV = "54f16ca8183dd8ae8bf4ccc07949795aff0301f5"
+SRCREV = "0298efdcd1153b8f719b9164548a3f0546f0cb7c"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE = "PREFIX=${prefix} DESTDIR=${D}"
-
-do_compile() {
-	# fix up some ASNEEDED things
-	for i in $(find ${S} -name "Makefile") ; do
-		sed -i 's:-lrt:-lrt -lpthread:g' $i
-	done
-
-	oe_runmake
-}
+EXTRA_OECONF = "--disable-qv4l2 --enable-shared" 
 
-do_install() {
-	oe_runmake install
+do_configure() {
+	# autotools_do_configure fails with:
+	# | configure.ac:139: error: required file 'build-aux/config.rpath' not found
+	autoreconf -vfi 
+	oe_runconf
 }
 
 PACKAGES =+ "rc-keymaps libv4l libv4l-dbg libv4l-dev"
 
-FILES_rc-keymaps = "${sysconfdir}/rc*"
+FILES_rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
 FILES_${PN} = "${bindir} ${sbindir} ${base_libdir}/udev/rules.d/70-infrared.rules"
 FILES_libv4l += "${libdir}/libv4l/* ${libdir}/*.so.*"
 FILES_libv4l-dbg += "${libdir}/libv4l/.debug"
-- 
1.7.10



