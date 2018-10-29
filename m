Return-Path: <brendank310@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 098A5796E4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:41:45 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id a132so5351756qkg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gXtpvcGTWa2Ggm8oVrIViOSuL7mu7xRC8D2m6h62rIQ=;
	b=AZnHR3H4IJMDAkZvuQyJw1D+TImC4+/Mez+S/paYwFubEaVGhObMvhqWwSzdBtsAwU
	CdYF1DnDmI4+kiHMeZq8Zs1XU2TpFxK1BdRkizNt2ipjJ2aRTOEYqaZyxSFt6nIdrV+N
	bM7cgURD4/eLbAayvXKFduIVq8/CkF9F/d8dSPAh3QjuPl3tAyJmod8sGmul8ctS0pVC
	74SkjARM8aAMOzddUFiNk6ThQ9ao51p/L3U+GQ9Hey+W4Wwn7NGfiMWtBADqiR46nSKI
	lJXo+JsTzf9hmms/SANnDAJtEwqYnVawzyqTtnh1ipaI5CpQqA0RTonl/xoo6Ts/F7u0
	3B8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gXtpvcGTWa2Ggm8oVrIViOSuL7mu7xRC8D2m6h62rIQ=;
	b=AKjZk9V67W80anuJiKYCnH9mQWjGcUZStf3I6QUMAlH5CRqcs9vJaSkxTaYWDVutr9
	WwDckq2Y2M05r+ZhsymMW0i4EVN0/fDEw6sQBkzVEjuqO5CmfEnjB5UDyr2A5VTnMg7j
	ZEdG2IzEslmBvgqfDvm18wuMjKWPSuuwL1oHmRORFArA5nOQZgfuolJE70LyDj0n0jlA
	NdLCcSS457T4Y8NfVy5k4h1xGmaZk267Hh0Sfc/VIXN5/aKcA5wV+oAa8m5UYigb39Wb
	bCTWilk1rwzfM0ObmkYY2RJ9CHTYQ4Ro1dHbyig/ri12H7XcdGRopn6BcGoLGqr79Mtc
	hs2A==
X-Gm-Message-State: AGRZ1gLCmKiQLvMTI0hHOQJJ0mmNIpAyZKFDVMuje8KuHaHaAhs6xdDR
	nHhAA+4zS/88B/7J04CImqrkQAuC
X-Google-Smtp-Source: AJdET5dycc2OFZ5mkEofz2XbkQ8DW0opBL1+dVv3OlTuLzYcE31dIoaw+ze2HPsKf89lkAQzJWjeGg==
X-Received: by 2002:a37:1bd3:: with SMTP id m80mr12538681qkh.259.1540831305614;
	Mon, 29 Oct 2018 09:41:45 -0700 (PDT)
Received: from localhost.localdomain (209-217-208-226.northland.net.
	[209.217.208.226]) by smtp.gmail.com with ESMTPSA id
	i2-v6sm13471476qkf.42.2018.10.29.09.41.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 09:41:44 -0700 (PDT)
From: brendank310 <brendank310@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2018 12:41:01 -0400
Message-Id: <a3ce539915c9a45c2b8032260ea65d6ee5b00f6b.1540830650.git.brendank310@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1540830650.git.brendank310@gmail.com>
References: <cover.1540830650.git.brendank310@gmail.com>
Cc: schnitzeltony@googlemail.com
Subject: [RFC meta-gnome][PATCH 04/16] accountsservice: add recipe for Accounts Service
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
X-List-Received-Date: Mon, 29 Oct 2018 16:41:45 -0000

From: Brendan Kerrigan <kerriganb@ainfosec.com>

Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
---
 .../accountsservice/0001-strip-out-intl.patch | 104 ++++++++++++++++++
 .../gnome3/accountsservice_git.bb             |  24 ++++
 2 files changed, 128 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome3/accountsservice/0001-strip-out-intl.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome3/accountsservice_git.bb

diff --git a/meta-gnome/recipes-gnome/gnome3/accountsservice/0001-strip-out-intl.patch b/meta-gnome/recipes-gnome/gnome3/accountsservice/0001-strip-out-intl.patch
new file mode 100644
index 000000000..622b3335d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/accountsservice/0001-strip-out-intl.patch
@@ -0,0 +1,104 @@
+accountsservice: Remove internationalization
+
+  The i18n internationalization fails within the OE
+  environment.
+
+  Upstream-Status: Inappropriate [disable-feature]
+
+  Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
+
+diff --git a/data/meson.build b/data/meson.build
+index 4987937..6274e5d 100644
+--- a/data/meson.build
++++ b/data/meson.build
+@@ -28,15 +28,6 @@ configure_file(
+ 
+ policy = act_namespace.to_lower() + '.policy'
+ 
+-i18n.merge_file(
+-  policy,
+-  input: policy + '.in',
+-  output: policy,
+-  po_dir: po_dir,
+-  install: true,
+-  install_dir: policy_dir,
+-)
+-
+ if install_systemd_unit_dir
+   service = 'accounts-daemon.service'
+ 
+diff --git a/meson.build b/meson.build
+index 77b6a3f..7da5d5d 100644
+--- a/meson.build
++++ b/meson.build
+@@ -25,8 +25,6 @@ act_pkgincludedir = join_paths(act_includedir, act_api_name)
+ 
+ act_namespace = 'org.freedesktop.Accounts'
+ 
+-act_gettext = 'accounts-service'
+-
+ soversion = 0
+ current = 0
+ revision = 0
+@@ -35,11 +33,9 @@ libversion = '@0@.@1@.@2@'.format(soversion, current, revision)
+ act_buildtype = get_option('buildtype')
+ 
+ gnome = import('gnome')
+-i18n = import('i18n')
+ pkg = import('pkgconfig')
+ 
+ data_dir = join_paths(meson.current_source_dir(), 'data')
+-po_dir = join_paths(meson.current_source_dir(), 'po')
+ 
+ top_inc = include_directories('.')
+ 
+@@ -52,9 +48,6 @@ config_h.set_quoted('VERSION', act_version)
+ config_h.set('_DEFAULT_SOURCE', true)
+ config_h.set('_GNU_SOURCE', true)
+ 
+-# i18n
+-config_h.set_quoted('GETTEXT_PACKAGE', act_gettext)
+-
+ # headers
+ check_headers = [
+   'paths.h',
+@@ -182,7 +175,6 @@ config_h.set('WITH_SYSTEMD', enable_systemd or enable_elogind)
+ 
+ subdir('data')
+ subdir('src')
+-subdir('po')
+ 
+ enable_docbook = get_option('docbook')
+ if enable_docbook
+diff --git a/src/libaccountsservice/act-user-manager.c b/src/libaccountsservice/act-user-manager.c
+index 12be9cb..712db6c 100644
+--- a/src/libaccountsservice/act-user-manager.c
++++ b/src/libaccountsservice/act-user-manager.c
+@@ -35,7 +35,6 @@
+ #endif /* HAVE_PATHS_H */
+ 
+ #include <glib.h>
+-#include <glib/gi18n-lib.h>
+ #include <glib/gstdio.h>
+ #include <glib-object.h>
+ #include <gio/gio.h>
+diff --git a/src/main.c b/src/main.c
+index 9caec7f..acbd422 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -155,7 +155,6 @@ main (int argc, char *argv[])
+         };
+ 
+         setlocale (LC_ALL, "");
+-        bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
+ 
+ #if !GLIB_CHECK_VERSION (2, 35, 3)
+         g_type_init ();
+@@ -167,7 +166,6 @@ main (int argc, char *argv[])
+         }
+ 
+         context = g_option_context_new ("");
+-        g_option_context_set_translation_domain (context, GETTEXT_PACKAGE);
+         g_option_context_set_summary (context, _("Provides D-Bus interfaces for querying and manipulating\nuser account information."));
+         g_option_context_add_main_entries (context, entries, NULL);
+         if (!g_option_context_parse (context, &argc, &argv, &error)) {
diff --git a/meta-gnome/recipes-gnome/gnome3/accountsservice_git.bb b/meta-gnome/recipes-gnome/gnome3/accountsservice_git.bb
new file mode 100644
index 000000000..a019a8c6d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/accountsservice_git.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Accounts Service"
+LICENSE = "GPLv3"
+DEPENDS = " \ 
+            glib-2.0 \
+            gsettings-desktop-schemas \
+            polkit \
+            dbus \
+          "
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "git://anongit.freedesktop.org/accountsservice.git;protocol=git;branch=master \
+           file://0001-strip-out-intl.patch \
+           "
+
+FILES_${PN} += "${systemd_system_unitdir}"
+FILES_${PN} += "${datadir}"
+FILES_${PN} += "${libdir}"
+
+SRCREV="${AUTOREV}"
+S = "${WORKDIR}/git"
+
+inherit pkgconfig meson gobject-introspection 
+
-- 
2.17.1


