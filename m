Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sv5xF-0001xM-QD
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Jul 2012 14:17:09 +0200
Received: by eekb57 with SMTP id b57so734506eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jul 2012 05:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=r3eNPwOTikQW+XmnNxvYpEFdsUatIW/LevzoWwesuU4=;
	b=O7bSfYRdFaMwe3zDUYGArgE9lOsWQAQJS3uZhvWXTjTGcDZfLuowhHJ94JEvgIz2Yr
	DmEo2yIq/XP+SfC/2nDC4XmPjD3nW8V63MPZfAM4OHX+78UJi+HPpeQAFMKuaoTUa2R4
	iCoZxVmFngG56STusyV3EW23vozWtBV3yPQ25L/T1fBnNO+fqAmzHJ/+p9hQaxFds7iD
	aKmw8XZPMEVViYn0yC1tB/DP0w1pLKmgxfiTsE7Jdi8GR55a1DXpsQndthcn/dkzvVTx
	bqroqYuyW8DFu7EmQUgr9UlOl2CDWIAGGeLl6a9+ePB+ek8AqFReAOXkOt+ZwtW1PZAM
	+Jag==
Received: by 10.14.173.71 with SMTP id u47mr5921924eel.22.1343477136637;
	Sat, 28 Jul 2012 05:05:36 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id g42sm13187274eem.14.2012.07.28.05.05.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Jul 2012 05:05:35 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Jul 2012 14:05:18 +0200
Message-Id: <1343477118-12504-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkdg4IZEqnsUM9d5LbM2v5V5//KX/7z1p4tPtZAm1kJ87OcPJDFABzdzKeSjekmQEciwto2
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [for-denzil][meta-oe][PATCH] v4l-utils 0.8.8: disable qv4l2 build
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
X-List-Received-Date: Sat, 28 Jul 2012 12:17:09 -0000

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



