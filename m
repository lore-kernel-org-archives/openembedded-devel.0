Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id A96AC786E1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:34:55 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id 100so17964475wrb.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 00:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=S760MDhJ8VOa6XFDZtR/aO4SFZtG9jU7DTNgXK32iOg=;
	b=Kmj+EHv4CRryGblnoOU8NQkjqWovief6de7J1q3Pdv+kkerEUtff2gsVRDsoKPUcZ3
	JT9XXeG7CfWlwz7cZxMW3QUmjIf9Ai4Akdf1KXd8IHEN5DfhqQXsIABPQ6wowHniIucU
	GPV4jJ94qDlEH+hoF3uybEwTxMhFEbmsSrlogu6r9KOu7T69o75byk7VCvsmL0/dUV6o
	3swld2f+xEFX/FizbM/D2gtpHQMez/iJHISVrSl9ON9RVjjQGhlBQ9pyL/FjjsnJerKk
	EYixq3K5e7/570bnceEl73phukXgyIwFfMd8wurmzINQI8uHSJ2rn3/JP3Oi9c2Emg7W
	dGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=S760MDhJ8VOa6XFDZtR/aO4SFZtG9jU7DTNgXK32iOg=;
	b=nuoFnNSqR67zXyp+Io/t+WeyWkU8JNZ8mI+mv1yQvESmRwOQdd6B7Lb/e6GEomb5Mg
	C7CkZ/j33J8+u8YzUsRoe/atTtD27h6vuoT8qoDV5bKByayZ1czqyo5FHJ/mF4OisAPd
	fX3PX35YtPE0IG14Ly+N9QKNkoGiFSVfJpXoF9Hfw2U1NsFlG4s7BcDdsXQFXbDdIKNB
	VfzaaEhjGg+QBNH6LTG2Q2XeDp51QwfyVRzPO7vAYfuj086KpGsjI29SYbLG3w7nwBIW
	vbz+FYai0cJnfAY8TqvBma1r72LOUEZCABWdlVkcJaTqDUOsXTv3H7EKlsbqcadxRPMM
	d3OQ==
X-Gm-Message-State: AKwxyteQhfSxhSizJlhfc8jpUfGcAUfUZurlQSPEJ+3O1EFxslT7b7jT
	ck0VYzLfJTL7kQVr3ldsGFLCRQ==
X-Google-Smtp-Source: ACJfBouT79abddeqy6f+ExWy3CAhRh5fjnDoXap6nmjQpH86e4ZzVBopr+ZRtsfFle5D8K6N7jHrOw==
X-Received: by 10.223.172.199 with SMTP id o65mr1749731wrc.215.1516178095659; 
	Wed, 17 Jan 2018 00:34:55 -0800 (PST)
Received: from localhost.localdomain
	(ip-88-152-110-191.hsi03.unitymediagroup.de. [88.152.110.191])
	by smtp.gmail.com with ESMTPSA id
	c54sm4230832wrg.68.2018.01.17.00.34.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 00:34:55 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jan 2018 09:34:12 +0100
Message-Id: <20180117083421.30233-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180117083421.30233-1-schnitzeltony@gmail.com>
References: <20180117083421.30233-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/14] pimlico/dates: remove recipe
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
X-List-Received-Date: Wed, 17 Jan 2018 08:34:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* pimlico project is dead for long time
* the only commits seen here were fix build / blacklist / unblacklist - so drop
  this maintenace burden
* it does not build with recent evolution-data-server

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../pimlico/contacts/stock_contact.png             | Bin 2311 -> 0 bytes
 .../pimlico/contacts/stock_person.png              | Bin 2280 -> 0 bytes
 meta-gnome/recipes-gnome/pimlico/dates.inc         |  11 -----
 .../dates/0001-Fix-format-security-warnings.patch  |  54 ---------------------
 .../dates/dso_linking_change_build_fix.patch       |  44 -----------------
 .../uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch      |  37 --------------
 meta-gnome/recipes-gnome/pimlico/dates_git.bb      |  18 -------
 7 files changed, 164 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/contacts/stock_contact.png
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/contacts/stock_person.png
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/dates.inc
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/dates/0001-Fix-format-security-warnings.patch
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/dates/dso_linking_change_build_fix.patch
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/dates_git.bb

diff --git a/meta-gnome/recipes-gnome/pimlico/contacts/stock_contact.png b/meta-gnome/recipes-gnome/pimlico/contacts/stock_contact.png
deleted file mode 100644
index 123b4485acaaaf665eb9dbff5e9f126a02e6e6d4..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 2311
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

diff --git a/meta-gnome/recipes-gnome/pimlico/contacts/stock_person.png b/meta-gnome/recipes-gnome/pimlico/contacts/stock_person.png
deleted file mode 100644
index 2b1328b4e2cc6a131a7ff9df4722c6fa49b0a6f1..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 2280
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
CvpRJE

diff --git a/meta-gnome/recipes-gnome/pimlico/dates.inc b/meta-gnome/recipes-gnome/pimlico/dates.inc
deleted file mode 100644
index 12d2f83f9..000000000
--- a/meta-gnome/recipes-gnome/pimlico/dates.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "Dates is a calendar application."
-HOMEPAGE = "http://pimlico-project.org/dates.html"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "GPLv2 & GPLv2+ & LGPLv2+"
-
-SECTION = "x11"
-DEPENDS = "glib-2.0 gtk+ libglade evolution-data-server intltool-native"
-RDEPENDS_${PN} = "libedata-cal"
-
-inherit autotools gettext pkgconfig gtk-icon-cache
diff --git a/meta-gnome/recipes-gnome/pimlico/dates/0001-Fix-format-security-warnings.patch b/meta-gnome/recipes-gnome/pimlico/dates/0001-Fix-format-security-warnings.patch
deleted file mode 100644
index 4f551a7d8..000000000
--- a/meta-gnome/recipes-gnome/pimlico/dates/0001-Fix-format-security-warnings.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 687881c5fa342686c8724adcdac0f9d555a351c3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 5 Apr 2017 18:10:57 -0700
-Subject: [PATCH] Fix format security warnings
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/dates_callbacks.c | 2 +-
- src/dates_gtk.c       | 2 +-
- src/gconf-bridge.c    | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/dates_callbacks.c b/src/dates_callbacks.c
-index d704c8f..46b8cb1 100644
---- a/src/dates_callbacks.c
-+++ b/src/dates_callbacks.c
-@@ -365,7 +365,7 @@ dates_about_cb (GtkWidget *widget, DatesData *d)
- 
- 	if (!pixb) {
- 		g_assert (error);
--		g_warning (error->message);
-+		g_warning ("%s", error->message);
- 		g_clear_error (&error);
- 	}
- 
-diff --git a/src/dates_gtk.c b/src/dates_gtk.c
-index 403bc25..fd691d2 100644
---- a/src/dates_gtk.c
-+++ b/src/dates_gtk.c
-@@ -1114,7 +1114,7 @@ calendar_do_edit_dialog_response_cb (GtkDialog *dialog, gint response_id, gpoint
- 				GTK_DIALOG_MODAL | GTK_DIALOG_DESTROY_WITH_PARENT,
- 				GTK_MESSAGE_WARNING,
- 				GTK_BUTTONS_NONE,
--				prompt);
-+				"%s", prompt);
- 
- 		g_free (prompt);
- 
-diff --git a/src/gconf-bridge.c b/src/gconf-bridge.c
-index 49754cf..67d3757 100644
---- a/src/gconf-bridge.c
-+++ b/src/gconf-bridge.c
-@@ -1220,7 +1220,7 @@ error_handler (GConfClient *client,
-                 dlg = gtk_message_dialog_new (NULL, 0,
-                                               GTK_MESSAGE_ERROR,
-                                               GTK_BUTTONS_OK,
--                                              message);
-+                                              "%s", message);
-                 g_free (message);
- 
-                 gtk_message_dialog_format_secondary_text
--- 
-2.12.2
-
diff --git a/meta-gnome/recipes-gnome/pimlico/dates/dso_linking_change_build_fix.patch b/meta-gnome/recipes-gnome/pimlico/dates/dso_linking_change_build_fix.patch
deleted file mode 100644
index 649d59d91..000000000
--- a/meta-gnome/recipes-gnome/pimlico/dates/dso_linking_change_build_fix.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-after gcc linking has changed, all the libraries must be explicitely specified 
-This patch avoids these linking errors:
-
-
-| make[2]: Entering directory `/disk0/pokybuild/build1/tmp/work/i586-poky-linux/dates-0.4.11+git0+514185dc1f6588085fda41eb59898b93d0487dd4-r2/git/src'^M
-...
-| /disk0/pokybuild/build1/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.5.1/ld: e: invalid DSO for symbol `pow@@GLIBC_2.0' definition^M
-| /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libm.so: could not read symbols: Bad value^M
-| collect2: ld returned 1 exit status^M
-| make[2]: *** [dates] Error 1
-
-
-
-| /disk0/pokybuild/build1/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.5.1/ld: z: invalid DSO for symbol `pango_layout_get_extents' definition
-| /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpango-1.0.so: could not read symbols: Bad value
-| collect2: ld returned 1 exit status
-| make[2]: *** [dates] Error 1
-
-
-Nitin A Kamble <nitin.a.kamble@intel.com>
-Date: 2011/01/11
-
-Update:
-This is identified as a libtool issue. While creating the libgtkdatesview.la 
-file, libtool should have added these needed libraries in there.
- A bug has been created for this issue: 
-   http://bugzilla.pokylinux.org/show_bug.cgi?id=664
-Nitin A Kamble <nitin.a.kamble@intel.com>
-Date: 2011/01/19
-
-Upstream-Status: Pending
-
-Index: git/src/Makefile.am
-===================================================================
---- git.orig/src/Makefile.am
-+++ git/src/Makefile.am
-@@ -34,6 +34,6 @@ dates_SOURCES = $(platform) 	\
- 	gconf-bridge.h		\
- 	gconf-bridge.c
- 
--dates_LDADD = $(DATES_LIBS) $(OWL_LIBS) libgtkdatesview.la
-+dates_LDADD = $(DATES_LIBS) $(OWL_LIBS) libgtkdatesview.la -lm -lpango-1.0
- 
- MAINTAINERCLEANFILES = config.h.in Makefile.in
diff --git a/meta-gnome/recipes-gnome/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch b/meta-gnome/recipes-gnome/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch
deleted file mode 100644
index 6ade4708f..000000000
--- a/meta-gnome/recipes-gnome/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-uclibc has langinfo.h but it does not define _NL_TIME_FIRST_WEEKDAY
-therefore we introduce a check in configure for the this define
-and then we make sure that we use it when it really exists
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac	2011-07-18 10:34:15.000000000 -0700
-+++ git/configure.ac	2011-07-18 10:54:26.403798188 -0700
-@@ -98,6 +98,8 @@
- 		src/libgtkdatesview.pc
- ])
- 
-+AC_CHECK_DECLS([_NL_TIME_FIRST_WEEKDAY],[],[],[[#include <langinfo.h>]])
-+
- AC_OUTPUT
- 
- echo " "
-Index: git/src/dates_view.c
-===================================================================
---- git.orig/src/dates_view.c	2011-07-18 10:34:15.000000000 -0700
-+++ git/src/dates_view.c	2011-07-18 10:58:46.093798136 -0700
-@@ -1505,7 +1505,11 @@
- 	priv->days = 1;
- 	priv->months = 0;
- 	priv->months_in_row = 4;
-+#if HAVE_DECL__NL_TIME_FIRST_WEEKDAY
- 	priv->week_start = *nl_langinfo (_NL_TIME_FIRST_WEEKDAY) - 1;
-+#else
-+	priv->week_start = 0;
-+#endif
- 	priv->dragbox = TRUE;
- 	priv->single_click = TRUE;
- 	priv->double_click = FALSE;
diff --git a/meta-gnome/recipes-gnome/pimlico/dates_git.bb b/meta-gnome/recipes-gnome/pimlico/dates_git.bb
deleted file mode 100644
index 14965e94f..000000000
--- a/meta-gnome/recipes-gnome/pimlico/dates_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require dates.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
-                    file://src/dates_view.h;endline=22;md5=29f934f356eb970309cdeb6693b3123a \
-                    file://src/dates_hildon.c;endline=19;md5=63938904198b25de429abb65fbdbdb8a \
-                    file://src/gconf-bridge.c;endline=22;md5=ad7626c6daf4aec590474a243f4912fa"
-
-SRCREV = "c8e30fa3211dcdfcda48184f4c57746a552b9c7a"
-PV = "0.4.11+git${SRCPV}"
-PR = "r9"
-
-S = "${WORKDIR}/git"
-
-SRC_URI = "git://git.gnome.org/${BPN} \
-           file://dso_linking_change_build_fix.patch \
-           file://uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch \
-           file://0001-Fix-format-security-warnings.patch \
-           "
-- 
2.14.3


