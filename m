Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CA45677041
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Aug 2016 15:39:30 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 08:39:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,581,1464678000"; 
   d="scan'208";a="1540591"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by orsmga005.jf.intel.com with ESMTP; 26 Aug 2016 08:39:29 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Aug 2016 18:37:52 +0300
Message-Id: <20160826153753.11755-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160826153753.11755-1-alexander.kanavin@linux.intel.com>
References: <20160826153753.11755-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/3] gnome-control-center, gthumb: correctly remove a file from the source tree
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
X-List-Received-Date: Fri, 26 Aug 2016 15:39:31 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb   | 2 +-
 meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb                        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
index dfb8133..814d829 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
@@ -16,7 +16,7 @@ LDFLAGS += "-lgthread-2.0 -lxml2"
 
 do_configure_prepend() {
     sed -i s:help::g ${S}/Makefile.am
-    rm -r ${S}/m4/gnome-doc-utils.m4
+    rm -f ${S}/m4/gnome-doc-utils.m4
 }
 do_install_append() {
     rm -rf ${D}${datadir}/mime
diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
index d22d5da..b346c7a 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
@@ -18,7 +18,7 @@ SRC_URI += "file://parallel.patch \
             file://0001-Drop-help-directory-from-build.patch"
 
 do_configure_prepend () {
-    rm -r ${S}/m4/gnome-doc-utils.m4
+    rm -f ${S}/m4/gnome-doc-utils.m4
 }
 
 do_install_append () {
-- 
2.9.3


