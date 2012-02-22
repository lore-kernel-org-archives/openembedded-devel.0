Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <cheepeero@gmx.net>) id 1Rzzq6-0007BB-Tr
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 01:13:46 +0100
Received: (qmail invoked by alias); 22 Feb 2012 00:05:27 -0000
Received: from unknown (EHLO pink.cheepee.homedns.org) [95.76.68.223]
	by mail.gmx.net (mp037) with SMTP; 22 Feb 2012 01:05:27 +0100
X-Authenticated: #14774724
X-Provags-ID: V01U2FsdGVkX18WnmUvEiMWVgOjt6x8sPfar4RC/7fwBwCbYkVRzx
	ZzU2EgkYdiljf4
From: Ciprian Ciubotariu <cheepeero@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2012 02:05:18 +0200
Message-Id: <1329869118-16435-1-git-send-email-cheepeero@gmx.net>
X-Mailer: git-send-email 1.7.3.4
X-Y-GMX-Trusted: 0
Subject: [meta-oe][PATCH v2] v4l-utils: skip qv4l2 instead of using host toolchain
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
X-List-Received-Date: Wed, 22 Feb 2012 00:13:47 -0000

See #2134

The makefiles in the project attempt to use the host compilers if
qmake is installed.
---
 .../v4l2apps/files/skip-qv4l2-0.8.4.patch          |   37 ++++++++++++++++++++
 .../recipes-multimedia/v4l2apps/v4l-utils_0.8.4.bb |    5 ++-
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/files/skip-qv4l2-0.8.4.patch

diff --git a/meta-oe/recipes-multimedia/v4l2apps/files/skip-qv4l2-0.8.4.patch b/meta-oe/recipes-multimedia/v4l2apps/files/skip-qv4l2-0.8.4.patch
new file mode 100644
index 0000000..c8e8388
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/files/skip-qv4l2-0.8.4.patch
@@ -0,0 +1,37 @@
+diff --git a/utils/Makefile b/utils/Makefile
+index 71a3cb7..1d23c8b 100644
+--- a/utils/Makefile
++++ b/utils/Makefile
+@@ -11,19 +11,19 @@ all install:
+ 	fi
+ 
+ 	# Test whether qmake is installed, and whether it is for qt4.
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
++#	@if which qmake-qt4 >/dev/null 2>&1; then \
++#		QMAKE=qmake-qt4; \
++#	else \
++#		QMAKE=qmake; \
++#	fi; \
++#	if which $$QMAKE >/dev/null 2>&1; then \
++#		if $$QMAKE --version 2>&1 | grep '4\.[0-9][0-9]*\.[0-9][0-9]*' >/dev/null; then \
++#			if [ ! -f qv4l2/Makefile ]; then \
++#				(cd qv4l2 && $$QMAKE) || exit 1; \
++#			fi; \
++#			$(MAKE) -C qv4l2 -f Makefile.install $@; \
++#		fi \
++#	fi
+ 
+ sync-with-kernel:
+ 	$(MAKE) -C keytable $@
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.4.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.4.bb
index 3252ae3..0e361de 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.4.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.4.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "v4l2 and IR applications"
-LICENSE = "GPLv2/LGPLv2.1"
+LICENSE = "GPLv2 | LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
                     file://COPYING.LIB;md5=d749e86a105281d7a44c2328acebc4b0"
 
@@ -8,7 +8,8 @@ DEPENDS = "jpeg"
 # libv4l was absorbed into this, let OE know that
 PROVIDES = "libv4l"
 
-SRC_URI = "git://linuxtv.org/v4l-utils.git;protocol=git"
+SRC_URI = "git://linuxtv.org/v4l-utils.git;protocol=git \
+           file://skip-qv4l2-${PV}.patch"
 SRCREV = "v4l-utils-${PV}"
 
 S = "${WORKDIR}/git"
-- 
1.7.3.4



