Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QhlXA-0004hM-Ae
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jul 2011 18:46:36 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Jul 2011 09:42:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,209,1309762800"; d="scan'208";a="27701928"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.182])
	by azsmga001.ch.intel.com with ESMTP; 15 Jul 2011 09:42:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jul 2011 17:42:06 +0100
Message-Id: <a3a5c28d0cbff69b1149f48a027420542e481922.1310748001.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1310748001.git.paul.eggleton@linux.intel.com>
References: <cover.1310748001.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1310748001.git.paul.eggleton@linux.intel.com>
References: <cover.1310748001.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe] [PATCH 4/5] atk: switch over to a bbappend
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
X-List-Received-Date: Fri, 15 Jul 2011 16:46:36 -0000

Updates meta-oe to atk 1.32.0.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-support/atk/atk.inc             |   10 ----------
 meta-oe/recipes-support/atk/atk_1.30.0.bb       |   19 -------------------
 meta-oe/recipes-support/atk/atk_1.32.0.bbappend |    2 ++
 3 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 meta-oe/recipes-support/atk/atk.inc
 delete mode 100644 meta-oe/recipes-support/atk/atk_1.30.0.bb
 create mode 100644 meta-oe/recipes-support/atk/atk_1.32.0.bbappend

diff --git a/meta-oe/recipes-support/atk/atk.inc b/meta-oe/recipes-support/atk/atk.inc
deleted file mode 100644
index 604e6ca..0000000
--- a/meta-oe/recipes-support/atk/atk.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "An accessibility toolkit for GNOME."
-SECTION = "x11/libs"
-LICENSE = "LGPL"
-
-DEPENDS = "glib-2.0 gtk-doc-native"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--disable-glibtest"
-
diff --git a/meta-oe/recipes-support/atk/atk_1.30.0.bb b/meta-oe/recipes-support/atk/atk_1.30.0.bb
deleted file mode 100644
index 7efb4fe..0000000
--- a/meta-oe/recipes-support/atk/atk_1.30.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "An accessibility toolkit for GNOME."
-SECTION = "x11/libs"
-LICENSE = "LGPLv2 & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://atk/atkutil.c;endline=20;md5=db21b0bdbef9da4dc6eb122debc9f9bc \
-                    file://atk/atk.h;endline=20;md5=c58238d688c24387376d6c69d06248a7
-PR = "r1"
-
-inherit gnome
-
-SRC_URI[archive.md5sum] = "548d413775819fef425410739041cac3"
-SRC_URI[archive.sha256sum] = "92b9b1213cafc68fe9c3806273b968c26423237d7b1f631dd83dc5270b8c268c"
-
-DEPENDS = "glib-2.0 gtk-doc-native"
-
-EXTRA_OECONF += "--disable-glibtest"
-
-BBCLASSEXTEND = "native"
-
diff --git a/meta-oe/recipes-support/atk/atk_1.32.0.bbappend b/meta-oe/recipes-support/atk/atk_1.32.0.bbappend
new file mode 100644
index 0000000..d9172b4
--- /dev/null
+++ b/meta-oe/recipes-support/atk/atk_1.32.0.bbappend
@@ -0,0 +1,2 @@
+BBCLASSEXTEND = "native"
+
-- 
1.7.4.1



