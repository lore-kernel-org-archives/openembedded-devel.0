Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4A7357F302
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 07:12:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7G7CphL023294
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 16 Aug 2019 00:12:51 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 16 Aug 2019 00:12:50 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Fri, 16 Aug 2019 03:12:46 -0400
Message-ID: <20190816071246.168087-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch] xfce4-datetime-setter: fix compile error and requires distro feature x11
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
X-List-Received-Date: Fri, 16 Aug 2019 07:12:53 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to compile xfce4-datetime-setter occasionally when system load
is high:

| ../git/xfce/main.c:42:10: fatal error: cc-datetime-resources.h: No such file or directory
|    42 | #include "cc-datetime-resources.h"
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~
| compilation terminated.

Update datetime_panel_dep to make sure cc-datetime-resources.h be
generated before including.

xfce4-datetime-setter depends on libxfce4ui which requires distro
feature 'x11', so make it require 'x11' too.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../files/fix-inner-dependency.patch          | 28 +++++++++++++++++++
 .../xfce4-datetime-setter_3.32.2.bb           |  7 +++--
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/xfce4-datetime-setter/files/fix-inner-dependency.patch

diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/files/fix-inner-dependency.patch b/meta-xfce/recipes-apps/xfce4-datetime-setter/files/fix-inner-dependency.patch
new file mode 100644
index 000000000..9cccb892f
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/files/fix-inner-dependency.patch
@@ -0,0 +1,28 @@
+It fails to compile xfce4-datetime-setter occasionally when system load is high:
+
+| ../git/xfce/main.c:42:10: fatal error: cc-datetime-resources.h: No such file or directory
+|    42 | #include "cc-datetime-resources.h"
+|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~
+| compilation terminated.
+
+Update datetime_panel_dep to make sure cc-datetime-resources.h be generated
+before including.
+
+Upstream-Status: Submitted [https://github.com/schnitzeltony/xfce4-datetime-setter/pull/2]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/panels/datetime/meson.build b/panels/datetime/meson.build
+index c5bf39c..241e177 100644
+--- a/panels/datetime/meson.build
++++ b/panels/datetime/meson.build
+@@ -175,7 +175,8 @@ datetime_panel_lib = static_library(
+ 
+ datetime_panel_dep = declare_dependency(
+   include_directories: [ common_inc, include_directories('.') ],
+-  link_with: datetime_panel_lib
++  link_with: datetime_panel_lib,
++  sources: resources
+ )
+ 
+ subdir('po-timezones')
diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
index d64358537..4d128ac51 100644
--- a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
@@ -6,13 +6,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
 
 DEPENDS = "glib-2.0-native libxfce4ui"
 
-SRC_URI = "git://github.com/schnitzeltony/xfce4-datetime-setter.git;protocol=https"
+SRC_URI = "git://github.com/schnitzeltony/xfce4-datetime-setter.git;protocol=https \
+           file://fix-inner-dependency.patch \
+"
 SRCREV = "5c7a73a3824b03b91719e05e2604b97c7a72d50f"
 
 S = "${WORKDIR}/git"
 
 inherit gettext meson distro_features_check
-REQUIRED_DISTRO_FEATURES = "systemd"
+
+REQUIRED_DISTRO_FEATURES = "systemd x11"
 
 FILES_${PN} += "${datadir}/icons/hicolor"
 
-- 
2.20.0


