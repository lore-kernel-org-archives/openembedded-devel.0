Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6E2C47075
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 07:37:08 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.8218.1700033825373726360
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 23:37:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TxWI7BZr;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5bd099e3d3cso4117606a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 23:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700033824; x=1700638624; darn=lists.openembedded.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bs7BpDg+0hfaJVeP2cztN9Qsco/7s6inB2s4kP2PsEw=;
        b=TxWI7BZrl6Vm4UFJg/MX9HI4PY+Biq4pzhbxF91sCvzAXR4OR1A3/cVehObICA/UcE
         nLMOdPnuauoZUtEoJHanNv+5XfSbEC7DpRGdfB0suJ5/XIBsNPnczYE02QG6MH1nu9+A
         y1xukbCSj3CDbLZ2W8YS/GZPsy3LyTTvz1GeJQeA3G0BVLY2PVIsIRvKYQHNPdf7FBo9
         im/nq85kzjQ0wRvM/2MbM71gFwCFr4UE0gWMCKo/mj59G384YBmHGFTqbmEr3snbOJn9
         a9ujcQ+AzGUJpZNuz+hnXEkEG+6/LPot24Sv/05zLZS+brejcgPtpX5xI0h++FLhugQd
         HKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700033824; x=1700638624;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bs7BpDg+0hfaJVeP2cztN9Qsco/7s6inB2s4kP2PsEw=;
        b=k35ppwh9QKV/kH/o6UUfI1u1OjwJ9i3A7x5wqaY/0ogDl6v9n8XY72laMcd2IEIR6y
         VUdwJseB4cI24zErJ7XmOD56DZlZlVpYUnyQJhigFjB7X/U5TfJGLHQ4jjUH5ZZ4+8kk
         MbO/ctGeJWb/LDduIz5WLKyBFmGWu7CCcYFxsl3PTiJuPqnppv52FpnixCIBRYEVj6u1
         BZT1QMdhjTTyOFy6Z+NRRnaVsfNJTBAMCoenQ3HYC6ri4cXQ6+v1uUYoV4w5J/hw/vtf
         RFZyy6L9Yyx0/vo65WElmqgtNlR5pj9flc5gfr0lM/NCF8+Gc5piHh6kZx0hQ767on8A
         nTrw==
X-Gm-Message-State: AOJu0YzJSc9Q+C4pIeWJq+/jB64rBzYsBjxrIaaOfpsErHO3D34JVdr7
	c2o6/K0G1Grejxt7bcSKKw2tiWOHhSZWmQ==
X-Google-Smtp-Source: AGHT+IE30ZWsIoKjOX7pX2pjt3U7RcmPKW5jxrdULsGFtWjqHT2mGBH+Q55SeBGPA4/KiJr8ubvqJQ==
X-Received: by 2002:a05:6a21:6d8b:b0:186:b5d2:5da4 with SMTP id wl11-20020a056a216d8b00b00186b5d25da4mr6621923pzb.36.1700033824094;
        Tue, 14 Nov 2023 23:37:04 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id l23-20020a17090a599700b00274922d4b38sm6312074pji.27.2023.11.14.23.37.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 23:37:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Nov 2023 23:36:53 -0800
Subject: [PATCH 2/3] vte9: Drop recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231114-remove-vte9-v1-2-720f287a1da3@gmail.com>
References: <20231114-remove-vte9-v1-0-720f287a1da3@gmail.com>
In-Reply-To: <20231114-remove-vte9-v1-0-720f287a1da3@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 07:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106747

The version from core layer is good for meta-gnome as well these days
packages needing older version are gone.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb          |   1 -
 .../recipes-gnome/vte9/vte9/cve-2012-2738.patch    | 136 ---------------------
 .../vte9/vte9/obsolete_automake_macros.patch       |  14 ---
 meta-oe/recipes-gnome/vte9/vte9_0.74.1.bb          |  30 -----
 4 files changed, 181 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 0f01356129..1a588eb29c 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -466,7 +466,6 @@ RDEPENDS:packagegroup-meta-oe-gnome ="\
     gtkmm \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data", "libpeas", "", d)} \
     pyxdg \
-    vte9 \
     gnome-theme-adwaita \
 "
 
diff --git a/meta-oe/recipes-gnome/vte9/vte9/cve-2012-2738.patch b/meta-oe/recipes-gnome/vte9/vte9/cve-2012-2738.patch
deleted file mode 100644
index 9b9980397a..0000000000
--- a/meta-oe/recipes-gnome/vte9/vte9/cve-2012-2738.patch
+++ /dev/null
@@ -1,136 +0,0 @@
-Upstream-Status: Backport
-CVE: CVE-2012-2738
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From e524b0b3bd8fad844ffa73927c199545b892cdbd Mon Sep 17 00:00:00 2001
-From: Christian Persch <chpe@gnome.org>
-Date: Sat, 19 May 2012 19:36:09 +0200
-Subject: [PATCH 1/2] emulation: Limit integer arguments to 65535
-
-To guard against malicious sequences containing excessively big numbers,
-limit all parsed numbers to 16 bit range. Doing this here in the parsing
-routine is a catch-all guard; this doesn't preclude enforcing
-more stringent limits in the handlers themselves.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=676090
----
- src/table.c  | 2 +-
- src/vteseq.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/table.c b/src/table.c
-index 140e8c8..85cf631 100644
---- a/src/table.c
-+++ b/src/table.c
-@@ -550,7 +550,7 @@ _vte_table_extract_numbers(GValueArray **array,
- 		if (G_UNLIKELY (*array == NULL)) {
- 			*array = g_value_array_new(1);
- 		}
--		g_value_set_long(&value, total);
-+		g_value_set_long(&value, CLAMP (total, 0, G_MAXUSHORT));
- 		g_value_array_append(*array, &value);
- 	} while (i++ < arginfo->length);
- 	g_value_unset(&value);
-diff --git a/src/vteseq.c b/src/vteseq.c
-index 7ef4c8c..10991db 100644
---- a/src/vteseq.c
-+++ b/src/vteseq.c
-@@ -557,7 +557,7 @@ vte_sequence_handler_multiple(VteTerminal *terminal,
-                               GValueArray *params,
-                               VteTerminalSequenceHandler handler)
- {
--        vte_sequence_handler_multiple_limited(terminal, params, handler, G_MAXLONG);
-+        vte_sequence_handler_multiple_limited(terminal, params, handler, G_MAXUSHORT);
- }
- 
- static void
--- 
-2.4.9 (Apple Git-60)
-
-
-From cf1ad453a8def873c49cf6d88162593402f32bb2 Mon Sep 17 00:00:00 2001
-From: Christian Persch <chpe@gnome.org>
-Date: Sat, 19 May 2012 20:04:12 +0200
-Subject: [PATCH 2/2] emulation: Limit repetitions
-
-Don't allow malicious sequences to cause excessive repetitions.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=676090
----
- src/vteseq.c | 25 ++++++++++++++++++-------
- 1 file changed, 18 insertions(+), 7 deletions(-)
-
-diff --git a/src/vteseq.c b/src/vteseq.c
-index 10991db..209522f 100644
---- a/src/vteseq.c
-+++ b/src/vteseq.c
-@@ -1392,7 +1392,7 @@ vte_sequence_handler_dc (VteTerminal *terminal, GValueArray *params)
- static void
- vte_sequence_handler_DC (VteTerminal *terminal, GValueArray *params)
- {
--	vte_sequence_handler_multiple(terminal, params, vte_sequence_handler_dc);
-+	vte_sequence_handler_multiple_r(terminal, params, vte_sequence_handler_dc);
- }
- 
- /* Delete a line at the current cursor position. */
-@@ -1785,7 +1785,7 @@ vte_sequence_handler_reverse_index (VteTerminal *terminal, GValueArray *params)
- static void
- vte_sequence_handler_RI (VteTerminal *terminal, GValueArray *params)
- {
--	vte_sequence_handler_multiple(terminal, params, vte_sequence_handler_nd);
-+	vte_sequence_handler_multiple_r(terminal, params, vte_sequence_handler_nd);
- }
- 
- /* Save cursor (position). */
-@@ -2777,8 +2777,7 @@ vte_sequence_handler_insert_lines (VteTerminal *terminal, GValueArray *params)
- {
- 	GValue *value;
- 	VteScreen *screen;
--	long param, end, row;
--	int i;
-+	long param, end, row, i, limit;
- 	screen = terminal->pvt->screen;
- 	/* The default is one. */
- 	param = 1;
-@@ -2796,7 +2795,13 @@ vte_sequence_handler_insert_lines (VteTerminal *terminal, GValueArray *params)
- 	} else {
- 		end = screen->insert_delta + terminal->row_count - 1;
- 	}
--	/* Insert the new lines at the cursor. */
-+
-+	/* Only allow to insert as many lines as there are between this row
-+         * and the end of the scrolling region. See bug #676090.
-+         */
-+        limit = end - row + 1;
-+        param = MIN (param, limit);
-+
- 	for (i = 0; i < param; i++) {
- 		/* Clear a line off the end of the region and add one to the
- 		 * top of the region. */
-@@ -2817,8 +2822,7 @@ vte_sequence_handler_delete_lines (VteTerminal *terminal, GValueArray *params)
- {
- 	GValue *value;
- 	VteScreen *screen;
--	long param, end, row;
--	int i;
-+	long param, end, row, i, limit;
- 
- 	screen = terminal->pvt->screen;
- 	/* The default is one. */
-@@ -2837,6 +2841,13 @@ vte_sequence_handler_delete_lines (VteTerminal *terminal, GValueArray *params)
- 	} else {
- 		end = screen->insert_delta + terminal->row_count - 1;
- 	}
-+
-+        /* Only allow to delete as many lines as there are between this row
-+         * and the end of the scrolling region. See bug #676090.
-+         */
-+        limit = end - row + 1;
-+        param = MIN (param, limit);
-+
- 	/* Clear them from below the current cursor. */
- 	for (i = 0; i < param; i++) {
- 		/* Insert a line at the end of the region and remove one from
--- 
-2.4.9 (Apple Git-60)
-
diff --git a/meta-oe/recipes-gnome/vte9/vte9/obsolete_automake_macros.patch b/meta-oe/recipes-gnome/vte9/vte9/obsolete_automake_macros.patch
deleted file mode 100644
index 6763d37540..0000000000
--- a/meta-oe/recipes-gnome/vte9/vte9/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=691545]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd vte-0.28.2/gnome-pty-helper/configure.in vte-0.28.2/gnome-pty-helper/configure.in
---- vte-0.28.2/gnome-pty-helper/configure.in	2010-07-15 20:08:44.000000000 +0300
-+++ vte-0.28.2/gnome-pty-helper/configure.in	2013-01-11 14:50:34.971027440 +0200
-@@ -8,7 +8,6 @@
- AC_ISC_POSIX
- AC_PROG_CC
- AC_STDC_HEADERS
--AM_PROG_CC_STDC
-
- if test -z "$enable_maintainer_mode"; then
-   enable_maintainer_mode=yes
diff --git a/meta-oe/recipes-gnome/vte9/vte9_0.74.1.bb b/meta-oe/recipes-gnome/vte9/vte9_0.74.1.bb
deleted file mode 100644
index a10b917394..0000000000
--- a/meta-oe/recipes-gnome/vte9/vte9_0.74.1.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "Virtual terminal emulator GTK+ widget library"
-BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
-LICENSE = "LGPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING.LGPL3;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
-
-DEPENDS = "glib-2.0-native glib-2.0 gnutls gtk+3 gtk4 intltool-native gnome-common-native ncurses"
-
-# help gnomebase get the SRC_URI correct
-GNOMEBN = "vte"
-S = "${WORKDIR}/vte-${PV}"
-
-SRC_URI[archive.sha256sum] = "2328c3f1c998350a18e0e513348e9fc581d57ea4e7b89aedf11e0e3c65042b4f"
-
-inherit gnomebase gi-docgen gobject-introspection features_check systemd upstream-version-is-even vala
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
-GIR_MESON_OPTION = "gir"
-GIDOCGEN_MESON_OPTION = "docs"
-
-PACKAGECONFIG ?= "gnutls ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
-PACKAGECONFIG[fribidi] = "-Dfribidi=true,-Dfribidi=false,fribidi"
-PACKAGECONFIG[systemd] = "-D_systemd=true,-D_systemd=false,"
-
-CFLAGS += "-D_GNU_SOURCE"
-
-PACKAGES =+ "libvte9 vte9-termcap"
-FILES:libvte9 = "${libdir}/*.so.* ${libexecdir}/gnome-pty-helper ${datadir}/glade ${systemd_user_unitdir}"
-FILES:vte9-termcap = "${datadir}/vte/termcap-0.0"
-
-RDEPENDS:libvte = "vte-termcap"

-- 
2.42.1


