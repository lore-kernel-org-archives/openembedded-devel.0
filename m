Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3697773174
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 08:35:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Jun 2016 01:35:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,515,1459839600"; d="scan'208";a="993491432"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga001.fm.intel.com with ESMTP; 23 Jun 2016 01:35:04 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-devel@lists.openembedded.org,
	mark.asselstine@windriver.com
Date: Thu, 23 Jun 2016 11:34:00 +0300
Message-Id: <1466670841-22706-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH 1/2] vte9: Add old vte into meta-oe
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
X-List-Received-Date: Thu, 23 Jun 2016 08:35:06 -0000

vte versioning is a little confusing:

vte-2.91.pc (version 0.44.1)
    provided by oe-core "vte"
vte-2.90.pc (current version 0.36.3)
    not in openembedded, can be patched to use "vte"
vte.pc (current version 0.28.2):
    provided by meta-oe "vte9" (naming from debian)

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta-oe/recipes-gnome/vte9/vte9.inc                |  19 +++
 .../recipes-gnome/vte9/vte9/cve-2012-2738.patch    | 136 +++++++++++++++++++++
 .../vte9/vte9/obsolete_automake_macros.patch       |  14 +++
 meta-oe/recipes-gnome/vte9/vte9_0.28.2.bb          |  12 ++
 4 files changed, 181 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/vte9/vte9.inc
 create mode 100644 meta-oe/recipes-gnome/vte9/vte9/cve-2012-2738.patch
 create mode 100644 meta-oe/recipes-gnome/vte9/vte9/obsolete_automake_macros.patch
 create mode 100644 meta-oe/recipes-gnome/vte9/vte9_0.28.2.bb

diff --git a/meta-oe/recipes-gnome/vte9/vte9.inc b/meta-oe/recipes-gnome/vte9/vte9.inc
new file mode 100644
index 0000000..6a5c63c
--- /dev/null
+++ b/meta-oe/recipes-gnome/vte9/vte9.inc
@@ -0,0 +1,19 @@
+SUMMARY = "Virtual terminal emulator GTK+ widget library"
+BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
+LICENSE = "LGPLv2.0"
+DEPENDS = " glib-2.0 gtk+ intltool-native ncurses"
+RDEPENDS_libvte = "vte-termcap"
+
+# help gnomebase get the SRC_URI correct
+GNOMEBN = "vte"
+S = "${WORKDIR}/vte-${PV}"
+
+inherit gnome gtk-doc distro_features_check upstream-version-is-even gobject-introspection
+ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
+
+EXTRA_OECONF = "--disable-python"
+
+PACKAGES =+ "libvte9 vte9-termcap"
+FILES_libvte9 = "${libdir}/*.so.* ${libexecdir}/gnome-pty-helper"
+FILES_vte9-termcap = "${datadir}/vte/termcap-0.0"
+
diff --git a/meta-oe/recipes-gnome/vte9/vte9/cve-2012-2738.patch b/meta-oe/recipes-gnome/vte9/vte9/cve-2012-2738.patch
new file mode 100644
index 0000000..9b99803
--- /dev/null
+++ b/meta-oe/recipes-gnome/vte9/vte9/cve-2012-2738.patch
@@ -0,0 +1,136 @@
+Upstream-Status: Backport
+CVE: CVE-2012-2738
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From e524b0b3bd8fad844ffa73927c199545b892cdbd Mon Sep 17 00:00:00 2001
+From: Christian Persch <chpe@gnome.org>
+Date: Sat, 19 May 2012 19:36:09 +0200
+Subject: [PATCH 1/2] emulation: Limit integer arguments to 65535
+
+To guard against malicious sequences containing excessively big numbers,
+limit all parsed numbers to 16 bit range. Doing this here in the parsing
+routine is a catch-all guard; this doesn't preclude enforcing
+more stringent limits in the handlers themselves.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=676090
+---
+ src/table.c  | 2 +-
+ src/vteseq.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/table.c b/src/table.c
+index 140e8c8..85cf631 100644
+--- a/src/table.c
++++ b/src/table.c
+@@ -550,7 +550,7 @@ _vte_table_extract_numbers(GValueArray **array,
+ 		if (G_UNLIKELY (*array == NULL)) {
+ 			*array = g_value_array_new(1);
+ 		}
+-		g_value_set_long(&value, total);
++		g_value_set_long(&value, CLAMP (total, 0, G_MAXUSHORT));
+ 		g_value_array_append(*array, &value);
+ 	} while (i++ < arginfo->length);
+ 	g_value_unset(&value);
+diff --git a/src/vteseq.c b/src/vteseq.c
+index 7ef4c8c..10991db 100644
+--- a/src/vteseq.c
++++ b/src/vteseq.c
+@@ -557,7 +557,7 @@ vte_sequence_handler_multiple(VteTerminal *terminal,
+                               GValueArray *params,
+                               VteTerminalSequenceHandler handler)
+ {
+-        vte_sequence_handler_multiple_limited(terminal, params, handler, G_MAXLONG);
++        vte_sequence_handler_multiple_limited(terminal, params, handler, G_MAXUSHORT);
+ }
+ 
+ static void
+-- 
+2.4.9 (Apple Git-60)
+
+
+From cf1ad453a8def873c49cf6d88162593402f32bb2 Mon Sep 17 00:00:00 2001
+From: Christian Persch <chpe@gnome.org>
+Date: Sat, 19 May 2012 20:04:12 +0200
+Subject: [PATCH 2/2] emulation: Limit repetitions
+
+Don't allow malicious sequences to cause excessive repetitions.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=676090
+---
+ src/vteseq.c | 25 ++++++++++++++++++-------
+ 1 file changed, 18 insertions(+), 7 deletions(-)
+
+diff --git a/src/vteseq.c b/src/vteseq.c
+index 10991db..209522f 100644
+--- a/src/vteseq.c
++++ b/src/vteseq.c
+@@ -1392,7 +1392,7 @@ vte_sequence_handler_dc (VteTerminal *terminal, GValueArray *params)
+ static void
+ vte_sequence_handler_DC (VteTerminal *terminal, GValueArray *params)
+ {
+-	vte_sequence_handler_multiple(terminal, params, vte_sequence_handler_dc);
++	vte_sequence_handler_multiple_r(terminal, params, vte_sequence_handler_dc);
+ }
+ 
+ /* Delete a line at the current cursor position. */
+@@ -1785,7 +1785,7 @@ vte_sequence_handler_reverse_index (VteTerminal *terminal, GValueArray *params)
+ static void
+ vte_sequence_handler_RI (VteTerminal *terminal, GValueArray *params)
+ {
+-	vte_sequence_handler_multiple(terminal, params, vte_sequence_handler_nd);
++	vte_sequence_handler_multiple_r(terminal, params, vte_sequence_handler_nd);
+ }
+ 
+ /* Save cursor (position). */
+@@ -2777,8 +2777,7 @@ vte_sequence_handler_insert_lines (VteTerminal *terminal, GValueArray *params)
+ {
+ 	GValue *value;
+ 	VteScreen *screen;
+-	long param, end, row;
+-	int i;
++	long param, end, row, i, limit;
+ 	screen = terminal->pvt->screen;
+ 	/* The default is one. */
+ 	param = 1;
+@@ -2796,7 +2795,13 @@ vte_sequence_handler_insert_lines (VteTerminal *terminal, GValueArray *params)
+ 	} else {
+ 		end = screen->insert_delta + terminal->row_count - 1;
+ 	}
+-	/* Insert the new lines at the cursor. */
++
++	/* Only allow to insert as many lines as there are between this row
++         * and the end of the scrolling region. See bug #676090.
++         */
++        limit = end - row + 1;
++        param = MIN (param, limit);
++
+ 	for (i = 0; i < param; i++) {
+ 		/* Clear a line off the end of the region and add one to the
+ 		 * top of the region. */
+@@ -2817,8 +2822,7 @@ vte_sequence_handler_delete_lines (VteTerminal *terminal, GValueArray *params)
+ {
+ 	GValue *value;
+ 	VteScreen *screen;
+-	long param, end, row;
+-	int i;
++	long param, end, row, i, limit;
+ 
+ 	screen = terminal->pvt->screen;
+ 	/* The default is one. */
+@@ -2837,6 +2841,13 @@ vte_sequence_handler_delete_lines (VteTerminal *terminal, GValueArray *params)
+ 	} else {
+ 		end = screen->insert_delta + terminal->row_count - 1;
+ 	}
++
++        /* Only allow to delete as many lines as there are between this row
++         * and the end of the scrolling region. See bug #676090.
++         */
++        limit = end - row + 1;
++        param = MIN (param, limit);
++
+ 	/* Clear them from below the current cursor. */
+ 	for (i = 0; i < param; i++) {
+ 		/* Insert a line at the end of the region and remove one from
+-- 
+2.4.9 (Apple Git-60)
+
diff --git a/meta-oe/recipes-gnome/vte9/vte9/obsolete_automake_macros.patch b/meta-oe/recipes-gnome/vte9/vte9/obsolete_automake_macros.patch
new file mode 100644
index 0000000..6763d37
--- /dev/null
+++ b/meta-oe/recipes-gnome/vte9/vte9/obsolete_automake_macros.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=691545]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd vte-0.28.2/gnome-pty-helper/configure.in vte-0.28.2/gnome-pty-helper/configure.in
+--- vte-0.28.2/gnome-pty-helper/configure.in	2010-07-15 20:08:44.000000000 +0300
++++ vte-0.28.2/gnome-pty-helper/configure.in	2013-01-11 14:50:34.971027440 +0200
+@@ -8,7 +8,6 @@
+ AC_ISC_POSIX
+ AC_PROG_CC
+ AC_STDC_HEADERS
+-AM_PROG_CC_STDC
+
+ if test -z "$enable_maintainer_mode"; then
+   enable_maintainer_mode=yes
diff --git a/meta-oe/recipes-gnome/vte9/vte9_0.28.2.bb b/meta-oe/recipes-gnome/vte9/vte9_0.28.2.bb
new file mode 100644
index 0000000..72bc9ec
--- /dev/null
+++ b/meta-oe/recipes-gnome/vte9/vte9_0.28.2.bb
@@ -0,0 +1,12 @@
+require vte9.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
+
+SRC_URI += "file://obsolete_automake_macros.patch \
+            file://cve-2012-2738.patch \
+           "
+
+CFLAGS += "-D_GNU_SOURCE"
+
+SRC_URI[archive.md5sum] = "497f26e457308649e6ece32b3bb142ff"
+SRC_URI[archive.sha256sum] = "86cf0b81aa023fa93ed415653d51c96767f20b2d7334c893caba71e42654b0ae"
-- 
2.1.4


