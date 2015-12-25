Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CCCC973182
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Dec 2015 07:56:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBP7ubae014097
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 23:56:37 -0800
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 24 Dec 2015 23:56:37 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Dec 2015 15:56:30 +0800
Message-ID: <9cce21ab8fbbcfc6b6e51d9d5dc9b3eb9b90f54e.1451029460.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1451029460.git.jackie.huang@windriver.com>
References: <cover.1451029460.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 10/15] icedtea7-native compile failure undefined reference to `main'
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
X-List-Received-Date: Fri, 25 Dec 2015 07:56:37 -0000
Content-Type: text/plain

From: Amy Fong <amy.fong@windriver.com>

On hosts without /usr/include/X11/extensions, icedtea7-native compile
results in a build failure while trying to create an object file:

+/data/home/.../git/csu/../sysdeps/x86_64/start.S:118: undefined reference to `main'
[2015-03-31 15:22:53.115930161+00:00] | collect2: error: ld returned 1 exit status

The compile line shows: (-c gets eaten)
  ... -I -c -o

The makefile tries to do the following which results in a faulty build
line if /usr/include/X11/extensions doesn't exist:

  CPPFLAGS += -I$(firstword $(wildcard $(OPENWIN_HOME)/include/X11/extensions) \
                     $(wildcard /usr/include/X11/extensions))

This looks like a missed line from the following patch which removes
the need for X11/extensions:

  icedtea-ecj-disable-compilation.patch

Signed-off-by: Amy Fong <amy.fong@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../icedtea-x11_extension_cleanup.patch            | 42 ++++++++++++++++++++++
 recipes-core/icedtea/openjdk-7-release-03b147.inc  |  2 ++
 2 files changed, 44 insertions(+)
 create mode 100644 recipes-core/icedtea/openjdk-7-03b147/icedtea-x11_extension_cleanup.patch

diff --git a/recipes-core/icedtea/openjdk-7-03b147/icedtea-x11_extension_cleanup.patch b/recipes-core/icedtea/openjdk-7-03b147/icedtea-x11_extension_cleanup.patch
new file mode 100644
index 0000000..1b92c9a
--- /dev/null
+++ b/recipes-core/icedtea/openjdk-7-03b147/icedtea-x11_extension_cleanup.patch
@@ -0,0 +1,42 @@
+icedtea7-native compile failure undefined reference to `main'
+
+On hosts without /usr/include/X11/extensions, icedtea7-native compile
+results in a build failure while trying to create an object file:
+
++/data/home/.../git/csu/../sysdeps/x86_64/start.S:118: undefined reference to `main'
+[2015-03-31 15:22:53.115930161+00:00] | collect2: error: ld returned 1 exit status
+
+The compile line shows: (-c gets eaten)
+... -I -c -o
+
+The makefile tries to do the following which results in a faulty build
+line if /usr/include/X11/extensions doesn't exist:
+
+   CPPFLAGS += -I$(firstword $(wildcard $(OPENWIN_HOME)/include/X11/extensions) \
+                         $(wildcard /usr/include/X11/extensions))
+
+This looks like a missed line from the following patch which removes the need for X11/extensions:
+  icedtea-ecj-disable-compilation.patch
+
+Upstream-Status: Pending
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+---
+ openjdk/jdk/make/sun/awt/mawt.gmk |    6 ------
+ 1 file changed, 6 deletions(-)
+
+--- openjdk/jdk/make/sun/awt/mawt.gmk
++++ openjdk/jdk/make/sun/awt/mawt.gmk
+@@ -258,12 +258,6 @@
+         -I$(PLATFORM_SRC)/native/$(PKGDIR) \
+         $(EVENT_MODEL)
+ 
+-ifeq ($(PLATFORM), linux)
+-  # Checking for the X11/extensions headers at the additional location
+-  CPPFLAGS += -I$(firstword $(wildcard $(OPENWIN_HOME)/include/X11/extensions) \
+-                        $(wildcard /usr/include/X11/extensions))
+-endif
+-
+ ifeq ($(PLATFORM), solaris)
+   CPPFLAGS += -I$(OPENWIN_HOME)/include/X11/extensions
+ endif
diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc b/recipes-core/icedtea/openjdk-7-release-03b147.inc
index b1cf6e9..dbdc045 100644
--- a/recipes-core/icedtea/openjdk-7-release-03b147.inc
+++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc
@@ -85,6 +85,7 @@ OPENJDK_PATCHES = " \
 	file://icedtea-disable-x11-in-headless.patch;apply=no \
 	file://icedtea-disable-sun.applet-for-tools-in-headless.patch;apply=no \
 	file://icedtea-hotspot-fix-undefined-behaviour.patch;apply=no \
+	file://icedtea-x11_extension_cleanup.patch;apply=no \
         "
 
 OPENJDK_HEADLESS_PATCHES = " \
@@ -104,5 +105,6 @@ export DISTRIBUTION_PATCHES = " \
 	patches/icedtea-openjdk-remove-currency-data-generation-expi.patch \
 	patches/icedtea-change-to-gdb-debug-format.patch \
 	patches/icedtea-hotspot-fix-undefined-behaviour.patch \
+	patches/icedtea-x11_extension_cleanup.patch \
 	${CLEAN_X11_DISTRIBUTION_PATCH} \
         "
-- 
1.9.1


