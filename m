Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6B5A06A9EF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 05:37:28 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id j14so5907692eak.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 22:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=b/gRQ7/mT0Mv70Z8FUEhi/XZJ26fgLcLAtqWDj4vbGM=;
	b=C3IHhcGb3mQzKT4lbuIiHPMx5Rc1CJ4j/qBbqTf39ChdzMdpSnHB2K4DjrDUDJuh9/
	xwriSMGemiVPhNl5C/OD/iSgo+lZDBw5+X+ls7xgk7TP3U1Vf2S3B3NSB1hhFCZN2ukC
	z5tZeZIXORacIQBlmoiZ2KtcOD5C2YGigrh+WT8NJYCZIPJTAqcng7zt3btlg5iInjcT
	UhiBQe5xjuLsCyvgLMb+5dIDesZtDWxTnCc6geYMXhc1X75WMJ4XhxZyZMImRP1fzo1W
	SOlR+K8UVAn0TuqO1C2m+PxCvDj973K4ntLr55L3mGkquWRbWxBe8w1h1yRNNje66eMt
	ic+Q==
X-Received: by 10.14.193.199 with SMTP id k47mr14588055een.83.1370929049160;
	Mon, 10 Jun 2013 22:37:29 -0700 (PDT)
Received: from localhost.localdomain (ip-178-202-232-2.unitymediagroup.de.
	[178.202.232.2])
	by mx.google.com with ESMTPSA id y10sm28009517eev.3.2013.06.10.22.37.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 22:37:28 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2013 07:34:31 +0200
Message-Id: <1370928876-14423-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
References: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce 10/15] polkit: update to 0.111
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
X-List-Received-Date: Tue, 11 Jun 2013 05:37:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

note: this version's rules are written in jscript.

The following tests were performed:

* run-tests for gnome- and xfce-based image
* update a package that installs a new rule to check if the restricted access
  rights for /etc/polkit-1/rules.d don't cause trouble

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ession-Set-error-if-we-cannot-find-a-sess.patch |   70 --------------------
 ...ession-Actually-return-TRUE-if-a-session-.patch |   46 -------------
 .../polkit-0.104/obsolete_automake_macros.patch    |   23 -------
 .../{polkit-0.104 => polkit}/polkit-1_pam.patch    |    0
 .../polkit/{polkit_0.104.bb => polkit_0.111.bb}    |   51 ++++++++++-----
 5 files changed, 34 insertions(+), 156 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit-0.104/0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit-0.104/0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit-0.104/obsolete_automake_macros.patch
 rename meta-oe/recipes-extended/polkit/{polkit-0.104 => polkit}/polkit-1_pam.patch (100%)
 rename meta-oe/recipes-extended/polkit/{polkit_0.104.bb => polkit_0.111.bb} (50%)

diff --git a/meta-oe/recipes-extended/polkit/polkit-0.104/0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch b/meta-oe/recipes-extended/polkit/polkit-0.104/0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch
deleted file mode 100644
index c021bfb..0000000
--- a/meta-oe/recipes-extended/polkit/polkit-0.104/0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From c46d2d13eac240d2a609b2dd8fc617ea18a78bfa Mon Sep 17 00:00:00 2001
-From: David Zeuthen <davidz@redhat.com>
-Date: Mon, 6 Feb 2012 11:24:53 -0500
-Subject: [PATCH 1/2] PolkitUnixSession: Set error if we cannot find a session for the given pid
-
-Also, don't treat the integer returned by sd_pid_get_session() as a
-boolean because that's just confusing. Also, don't confuse memory
-supposed to be freed by g_free() and free(3) with each other. See
-
- https://bugzilla.redhat.com/show_bug.cgi?id=787222
-
-for more details.
-
-Signed-off-by: David Zeuthen <davidz@redhat.com>
----
-
-Upstream-Status: Accepted
-
- src/polkit/polkitunixsession-systemd.c |   21 ++++++++++++++++-----
- 1 files changed, 16 insertions(+), 5 deletions(-)
-
-diff --git a/src/polkit/polkitunixsession-systemd.c b/src/polkit/polkitunixsession-systemd.c
-index e7e913f..94a7ee4 100644
---- a/src/polkit/polkitunixsession-systemd.c
-+++ b/src/polkit/polkitunixsession-systemd.c
-@@ -23,6 +23,7 @@
- #  include "config.h"
- #endif
- 
-+#include <stdlib.h>
- #include <string.h>
- #include "polkitunixsession.h"
- #include "polkitsubject.h"
-@@ -450,9 +451,8 @@ polkit_unix_session_initable_init (GInitable     *initable,
-                                    GError       **error)
- {
-   PolkitUnixSession *session = POLKIT_UNIX_SESSION (initable);
--  gboolean ret;
--
--  ret = FALSE;
-+  gboolean ret = FALSE;
-+  char *s;
- 
-   if (session->session_id != NULL)
-     {
-@@ -461,8 +461,19 @@ polkit_unix_session_initable_init (GInitable     *initable,
-       goto out;
-     }
- 
--  if (!sd_pid_get_session (session->pid, &session->session_id))
--    ret = TRUE;
-+  if (sd_pid_get_session (session->pid, &s) == 0)
-+    {
-+      session->session_id = g_strdup (s);
-+      free (s);
-+      ret = TRUE;
-+      goto out;
-+    }
-+
-+  g_set_error (error,
-+               POLKIT_ERROR,
-+               POLKIT_ERROR_FAILED,
-+               "No session for pid %d",
-+               (gint) session->pid);
- 
- out:
-   return ret;
--- 
-1.7.2.5
-
diff --git a/meta-oe/recipes-extended/polkit/polkit-0.104/0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch b/meta-oe/recipes-extended/polkit/polkit-0.104/0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch
deleted file mode 100644
index 49f8ce2..0000000
--- a/meta-oe/recipes-extended/polkit/polkit-0.104/0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 8fb8b406bab50c5ef8c5d4f743e3f13924bd5f73 Mon Sep 17 00:00:00 2001
-From: David Zeuthen <davidz@redhat.com>
-Date: Mon, 6 Feb 2012 11:26:06 -0500
-Subject: [PATCH 2/2] PolkitUnixSession: Actually return TRUE if a session exists
-
-Also, don't treat the integer returned by sd_session_get_uid() as a
-boolean because that's just confusing.
-
-Signed-off-by: David Zeuthen <davidz@redhat.com>
----
-
-Upstream-Status: Accepted
-
- src/polkit/polkitunixsession-systemd.c |   12 +++++-------
- 1 files changed, 5 insertions(+), 7 deletions(-)
-
-diff --git a/src/polkit/polkitunixsession-systemd.c b/src/polkit/polkitunixsession-systemd.c
-index 94a7ee4..8a8bf65 100644
---- a/src/polkit/polkitunixsession-systemd.c
-+++ b/src/polkit/polkitunixsession-systemd.c
-@@ -361,17 +361,15 @@ polkit_unix_session_to_string (PolkitSubject *subject)
- 
- static gboolean
- polkit_unix_session_exists_sync (PolkitSubject   *subject,
--                                    GCancellable    *cancellable,
--                                    GError         **error)
-+                                 GCancellable    *cancellable,
-+                                 GError         **error)
- {
-   PolkitUnixSession *session = POLKIT_UNIX_SESSION (subject);
--  gboolean ret;
-+  gboolean ret = FALSE;
-   uid_t uid;
- 
--  ret = FALSE;
--
--  if (!sd_session_get_uid (session->session_id, &uid))
--    ret = FALSE;
-+  if (sd_session_get_uid (session->session_id, &uid) == 0)
-+    ret = TRUE;
- 
-   return ret;
- }
--- 
-1.7.2.5
-
diff --git a/meta-oe/recipes-extended/polkit/polkit-0.104/obsolete_automake_macros.patch b/meta-oe/recipes-extended/polkit/polkit-0.104/obsolete_automake_macros.patch
deleted file mode 100644
index 5a6046c..0000000
--- a/meta-oe/recipes-extended/polkit/polkit-0.104/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=59091]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd polkit-0.104/configure.ac polkit-0.104/configure.ac
---- polkit-0.104/configure.ac	2012-01-03 18:25:49.000000000 +0200
-+++ polkit-0.104/configure.ac	2013-01-07 03:13:31.862125625 +0200
-@@ -3,7 +3,7 @@
- AC_PREREQ(2.59c)
- AC_INIT(polkit, 0.104, http://lists.freedesktop.org/mailman/listinfo/polkit-devel)
- AM_INIT_AUTOMAKE(polkit, 0.104)
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
- AM_MAINTAINER_MODE
-
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
-@@ -24,7 +24,6 @@
-
- AC_ISC_POSIX
- AC_PROG_CC
--AM_PROG_CC_STDC
- AC_HEADER_STDC
- AM_PROG_LIBTOOL
- AC_PROG_MAKE_SET
diff --git a/meta-oe/recipes-extended/polkit/polkit-0.104/polkit-1_pam.patch b/meta-oe/recipes-extended/polkit/polkit/polkit-1_pam.patch
similarity index 100%
rename from meta-oe/recipes-extended/polkit/polkit-0.104/polkit-1_pam.patch
rename to meta-oe/recipes-extended/polkit/polkit/polkit-1_pam.patch
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.104.bb b/meta-oe/recipes-extended/polkit/polkit_0.111.bb
similarity index 50%
rename from meta-oe/recipes-extended/polkit/polkit_0.104.bb
rename to meta-oe/recipes-extended/polkit/polkit_0.111.bb
index 8a18692..33101cf 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.104.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.111.bb
@@ -5,39 +5,56 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
                     file://src/polkit/polkit.h;beginline=1;endline=20;md5=0a8630b0133176d0504c87a0ded39db4"
 
-DEPENDS = "expat glib-2.0 intltool-native gobject-introspection-stub"
+DEPENDS = "expat glib-2.0 intltool-native gobject-introspection-stub mozjs"
+
+inherit autotools gtk-doc pkgconfig useradd systemd
 
 PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
                  ${@base_contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)}"
 
 PACKAGECONFIG[pam] = "--with-authfw=pam,--with-authfw=shadow,libpam,libpam"
-PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
+PACKAGECONFIG[systemd] = "--enable-libsystemd-login=yes --with-systemdsystemunitdir=${systemd_unitdir}/system/,--enable-libsystemd-login=no --with-systemdsystemunitdir=,systemd"
 # there is no --enable/--disable option for consolekit and it's not picked by shlibs, so add it to RDEPENDS
 PACKAGECONFIG[consolekit] = ",,,consolekit"
 
-PR = "r12"
-
 PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
-           file://0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch \
-           file://0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch \
-           file://obsolete_automake_macros.patch \
 "
 
-SRC_URI[md5sum] = "e380b4c6fb1e7bccf854e92edc0a8ce1"
-SRC_URI[sha256sum] = "6b0a13d8381e4a7b7e37c18a54595191b50757e0fcd186cd9918e9ad0f18c7f9"
+SRC_URI[md5sum] = "81b116edf986d8e13502929a171f4e0d"
+SRC_URI[sha256sum] = "02ae544547211b687818c97bcbf19bf6b8b5be7fda93000525a8765c7bed1ea1"
 
 EXTRA_OECONF = "--with-os-type=moblin --disable-man-pages --disable-introspection"
 
-inherit autotools gtk-doc pkgconfig
-
 do_install_append() {
-    rm -f ${D}${libdir}/${BPN}-1/extensions/*.a
+    # see configure.log for more details
+    chown root:root ${D}${libdir}/${BPN}-1/polkit-agent-helper-1
+    chmod 4755 ${D}${libdir}/${BPN}-1/polkit-agent-helper-1
+
+    chown root:root ${D}${bindir}/pkexec
+    chmod 4755 ${D}${bindir}/pkexec
+
+    chown polkitd:polkitd ${D}${sysconfdir}/${BPN}-1/rules.d
+    chmod 700 ${D}${sysconfdir}/${BPN}-1/rules.d
+
+    chown polkitd:polkitd ${D}${datadir}/${BPN}-1/rules.d
+    chmod 700 ${D}${datadir}/${BPN}-1/rules.d
 }
 
-FILES_${PN} += "${libdir}/${BPN}-1/extensions/*.so \
-                ${datadir}/${BPN}-1/actions/* \
-                ${datadir}/dbus-1/system-services/*"
-FILES_${PN}-dbg += "${libdir}/${BPN}-1/extensions/.debug/*.so"
-FILES_${PN}-dev += "${libdir}/${BPN}-1/extensions/*.la "
+PACKAGES =+ "${PN}-examples"
+
+FILES_${PN} += " \
+    ${libdir}/${BPN}-1 \
+    ${datadir}/dbus-1 \
+    ${datadir}/${BPN}-1 \
+"
+FILES_${PN}-dbg += "${libdir}/${BPN}-1/.debug"
+
+FILES_${PN}-examples = "${bindir}/*example*"
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/${BPN}-1 polkitd"
+
+SYSTEMD_SERVICE_${PN} = "${BPN}.service"
+SYSTEMD_AUTO_ENABLE = "disable"
-- 
1.7.6.5


