Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SqjX9-000293-6V
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 13:32:11 +0200
Received: by eaal1 with SMTP id l1so1387575eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 04:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=r3eNPwOTikQW+XmnNxvYpEFdsUatIW/LevzoWwesuU4=;
	b=bGlbyijB3hZPhwboMfNuNqDWCLAYcCVbRqXD2igLz3v8/9X3OMAgjbHGPSf6R65sUv
	JxGX7+Nl/HmAULFRy8WDuu0w2E4aDk9jnP4lst/uDbZMuAU6NkKgCq+2xClfJdTJvgaC
	jwyp4qygU8ZWe8E3YVWziEKYkTmDVIFyQ0e3gLgYsqhyPZkeEEqL5+zfx0vhZPN6Zt+L
	j5V6how9wyXe1ukC6Aur5aOstdHhA4JFZ2dG2JmlZz8wDQUUpXhH0DHMOrdDmF9g65Sm
	zoahfBkfO9l7ImB3g6IQFyUGQaqJ+QW1CyF7BGy2vT6nJ2Uq/vUbXuw6eXcVE+gqP6l+
	4m9A==
Received: by 10.14.225.133 with SMTP id z5mr4732614eep.35.1342437653043;
	Mon, 16 Jul 2012 04:20:53 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id s8sm17872400eeo.8.2012.07.16.04.20.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 04:20:52 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jul 2012 13:20:47 +0200
Message-Id: <1342437647-815-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlq3lMakczN24ELgeN6370yBDJdCUP7mhYy+Ukl3XXVLvDFhf4231rxhoCxauIbmatifwHC
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] v4l-utils 0.8.8: disable qv4l2 build
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
X-List-Received-Date: Mon, 16 Jul 2012 11:32:11 -0000

It picks up host qmake and breaks the build.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../v4l-utils/0001-disable-qv4l2-build.patch       |   39 ++++++++++++++++++++
 .../recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb |    6 ++-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-disable-qv4l2-build.patch

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-disable-qv4l2-build.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-disable-qv4l2-build.patch
new file mode 100644
index 0000000..4b11038
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-disable-qv4l2-build.patch
@@ -0,0 +1,39 @@
+From 1422d4c562660407919fb753dc5f074293b395e5 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 16 Jul 2012 12:00:34 +0200
+Subject: [PATCH] disable qv4l2 build
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ utils/Makefile |   15 ---------------
+ 1 files changed, 0 insertions(+), 15 deletions(-)
+
+diff --git a/utils/Makefile b/utils/Makefile
+index 014b82d..db74851 100644
+--- a/utils/Makefile
++++ b/utils/Makefile
+@@ -5,21 +5,6 @@ all install:
+ 		$(MAKE) -C $$i $@ || exit 1; \
+ 	done
+ 
+-	# Test whether qmake is installed, and whether it is for qt4.
+-	@if which qmake-qt4 >/dev/null 2>&1; then \
+-		QMAKE=qmake-qt4; \
+-	else \
+-		QMAKE=qmake; \
+-	fi; \
+-	if which $$QMAKE >/dev/null 2>&1; then \
+-		if $$QMAKE --version 2>&1 | grep '4\.[0-9][0-9]*\.[0-9][0-9]*' >/dev/null; then \
+-			if [ ! -f qv4l2/Makefile ]; then \
+-				(cd qv4l2 && $$QMAKE) || exit 1; \
+-			fi; \
+-			$(MAKE) -C qv4l2 -f Makefile.install $@; \
+-		fi \
+-	fi
+-
+ sync-with-kernel:
+ 	$(MAKE) -C keytable $@
+ 	$(MAKE) -C v4l2-dbg $@
+-- 
+1.7.7.6
+
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
index 18f361f..e5d1fc2 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
@@ -3,12 +3,16 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
                     file://COPYING.LIB;md5=d749e86a105281d7a44c2328acebc4b0"
 
+PR = "r1"
+
 DEPENDS = "jpeg"
 
 # libv4l was absorbed into this, let OE know that
 PROVIDES = "libv4l"
 
-SRC_URI = "git://linuxtv.org/v4l-utils.git;protocol=git"
+SRC_URI = "git://linuxtv.org/v4l-utils.git;protocol=git \
+           file://0001-disable-qv4l2-build.patch \
+          "
 # 54f16ca8183dd8ae8bf4ccc07949795aff0301f5 -> v0.8.8 tag
 SRCREV = "54f16ca8183dd8ae8bf4ccc07949795aff0301f5"
 
-- 
1.7.10



