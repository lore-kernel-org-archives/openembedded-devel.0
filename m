Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 90B076BC8E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2013 10:44:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Aug 2013 03:41:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,975,1367996400"; d="scan'208";a="394649034"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.7])
	by orsmga002.jf.intel.com with ESMTP; 28 Aug 2013 03:44:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Aug 2013 11:43:24 +0100
Message-Id: <336b403ae9a423bd3c87f1dc725373ee0e2f7b1e.1377686481.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377686481.git.paul.eggleton@linux.intel.com>
References: <cover.1377686481.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1377686481.git.paul.eggleton@linux.intel.com>
References: <cover.1377686481.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe,meta-gnome][PATCH 2/6] vala: remove
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Aug 2013 10:44:46 -0000

This is now in OE-Core as of 649b48557d8702daaf4f28482848ab0b07abed83.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 ...-gen-don-t-append-dirty-if-we-re-not-in-g.patch | 53 ----------------------
 meta-oe/recipes-devtools/vala/vala.inc             | 20 --------
 meta-oe/recipes-devtools/vala/vala_0.16.0.bb       |  8 ----
 3 files changed, 81 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/vala/vala-0.16.0/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
 delete mode 100644 meta-oe/recipes-devtools/vala/vala.inc
 delete mode 100644 meta-oe/recipes-devtools/vala/vala_0.16.0.bb

diff --git a/meta-oe/recipes-devtools/vala/vala-0.16.0/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch b/meta-oe/recipes-devtools/vala/vala-0.16.0/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
deleted file mode 100644
index e6c7941..0000000
--- a/meta-oe/recipes-devtools/vala/vala-0.16.0/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 2460d7b79f7e90dcfeebde5e9c53d9b6798a1f3c Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 21 Feb 2012 17:12:50 +0100
-Subject: [PATCH] git-version-gen: don't append -dirty if we're not in git
- repo
-
-* for example if we have some dirty directory and we unpack clean vala tarball in it, then it will append -dirty
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- build-aux/git-version-gen |   25 ++++++++++++++-----------
- 1 files changed, 14 insertions(+), 11 deletions(-)
-
-diff --git a/build-aux/git-version-gen b/build-aux/git-version-gen
-index 0fa6faa..1d1f9d2 100755
---- a/build-aux/git-version-gen
-+++ b/build-aux/git-version-gen
-@@ -126,18 +126,21 @@ fi
- 
- v=`echo "$v" |sed 's/^v//'`
- 
--# Don't declare a version "dirty" merely because a time stamp has changed.
--git status > /dev/null 2>&1
-+if test -d .git
-+then
-+	# Don't declare a version "dirty" merely because a time stamp has changed.
-+	git status > /dev/null 2>&1
- 
--dirty=`sh -c 'git diff-index --name-only HEAD' 2>/dev/null` || dirty=
--case "$dirty" in
--    '') ;;
--    *) # Append the suffix only if there isn't one already.
--	case $v in
--	  *-dirty) ;;
--	  *) v="$v-dirty" ;;
--	esac ;;
--esac
-+	dirty=`sh -c 'git diff-index --name-only HEAD' 2>/dev/null` || dirty=
-+	case "$dirty" in
-+	    '') ;;
-+	    *) # Append the suffix only if there isn't one already.
-+		case $v in
-+		  *-dirty) ;;
-+		  *) v="$v-dirty" ;;
-+		esac ;;
-+	esac
-+fi
- 
- # Omit the trailing newline, so that m4_esyscmd can use the result directly.
- echo "$v" | tr -d '\012'
--- 
-1.7.8.4
-
diff --git a/meta-oe/recipes-devtools/vala/vala.inc b/meta-oe/recipes-devtools/vala/vala.inc
deleted file mode 100644
index 6cdc605..0000000
--- a/meta-oe/recipes-devtools/vala/vala.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Vala is a C#-like language dedicated to ease GObject programming. \
-Vala compiles to plain C and has no runtime environment nor penalities whatsoever."
-SECTION = "devel"
-DEPENDS = "glib-2.0 dbus gtk+"
-BBCLASSEXTEND = "native"
-DEPENDS_virtclass-native = "glib-2.0-native dbus-native"
-HOMEPAGE = "http://vala-project.org"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-INC_PR = "r1"
-
-SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
-
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz"
-inherit autotools
-
-EXTRA_OECONF = "--disable-vapigen"
-
-FILES_${PN}-doc += "${datadir}/devhelp"
-FILES_${PN} += "${datadir}/${BPN}-${SHRT_VER}/vapi"
diff --git a/meta-oe/recipes-devtools/vala/vala_0.16.0.bb b/meta-oe/recipes-devtools/vala/vala_0.16.0.bb
deleted file mode 100644
index 92120b4..0000000
--- a/meta-oe/recipes-devtools/vala/vala_0.16.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch"
-
-SRC_URI[md5sum] = "84b742e9cca4c90fde3026c3793c03c1"
-SRC_URI[sha256sum] = "3adb37aa2b35e2e2daed47552e85dbcbf752c0f7768b269d856993620073a657"
-- 
1.8.1.2


