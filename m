Received: from mail-wg0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UI0NX-00024E-P4
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Mar 2013 18:31:17 +0100
Received: by mail-wg0-f47.google.com with SMTP id dr13so559664wgb.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Mar 2013 10:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=ToNd7YW8PQsbcZ+tBypyNZujU4cfgNklPcXzEgtLgfw=;
	b=F5OxTeFg0mOtI5FJIoWHtvtonrcdHMQv6fhbSkgfmJ4f4uRKqjhsuNRj8ZM296yCPk
	uKp+nEZhIgwLUh94pmOgtJEYum/UlUk+GNtBAIVqtlYiQZvRA8z+dqDAvI342TzAtfOz
	7Ev6TtfyXfl41U0xUUdn9T54EyFi0A4earLjAEa9eLJaj/LHeWy5w8Aj047hvy5yFaft
	WDo6L6raN1x4U53NvFtVrkpI3G6sJatRxZOjibtEvvszP9QRvDP4rIjZaqwl6z3xDAX2
	9VZ3Iz6cBHD4aj4PE8gDpD8DvV4biiHU60e3/GcZHXPHcy9HQ/+U7/SZgoSbiqNBw9VQ
	aVFA==
X-Received: by 10.180.12.48 with SMTP id v16mr4496287wib.1.1363713266073;
	Tue, 19 Mar 2013 10:14:26 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ej8sm1826515wib.9.2013.03.19.10.14.24
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 19 Mar 2013 10:14:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Mar 2013 17:11:51 +0000
Message-Id: <1363713111-21464-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnv3FcSRo+9Bslx4NX5BlUowxFMzELAjgeft/AQah5PfUsDEyy3c0cRKtJnH2tRP3wyl9qv
Subject: [PATCH] polkit: add (taken from oe-core)
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
X-List-Received-Date: Tue, 19 Mar 2013 17:31:18 -0000

PolKit will be removed from oe-core as it isn't massively applicable in
embedded, isn't used by anything by default anymore, and future upgrades require
the SpiderMonkey JavaScript runtime.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...ession-Set-error-if-we-cannot-find-a-sess.patch |   70 ++++++++++++++++++++
 ...ession-Actually-return-TRUE-if-a-session-.patch |   46 +++++++++++++
 .../polkit-0.104/obsolete_automake_macros.patch    |   23 +++++++
 .../polkit/polkit-0.104/polkit-1_pam.patch         |   23 +++++++
 .../recipes-extended/polkit/polkit-gnome_0.102.bb  |   26 ++++++++
 meta-oe/recipes-extended/polkit/polkit_0.104.bb    |   44 ++++++++++++
 .../recipes-extended/polkit/polkit_0.104.bbappend  |    1 -
 7 files changed, 232 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit-0.104/0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch
 create mode 100644 meta-oe/recipes-extended/polkit/polkit-0.104/0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch
 create mode 100644 meta-oe/recipes-extended/polkit/polkit-0.104/obsolete_automake_macros.patch
 create mode 100644 meta-oe/recipes-extended/polkit/polkit-0.104/polkit-1_pam.patch
 create mode 100644 meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
 create mode 100644 meta-oe/recipes-extended/polkit/polkit_0.104.bb
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit_0.104.bbappend

diff --git a/meta-oe/recipes-extended/polkit/polkit-0.104/0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch b/meta-oe/recipes-extended/polkit/polkit-0.104/0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch
new file mode 100644
index 0000000..c021bfb
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit-0.104/0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch
@@ -0,0 +1,70 @@
+From c46d2d13eac240d2a609b2dd8fc617ea18a78bfa Mon Sep 17 00:00:00 2001
+From: David Zeuthen <davidz@redhat.com>
+Date: Mon, 6 Feb 2012 11:24:53 -0500
+Subject: [PATCH 1/2] PolkitUnixSession: Set error if we cannot find a session for the given pid
+
+Also, don't treat the integer returned by sd_pid_get_session() as a
+boolean because that's just confusing. Also, don't confuse memory
+supposed to be freed by g_free() and free(3) with each other. See
+
+ https://bugzilla.redhat.com/show_bug.cgi?id=787222
+
+for more details.
+
+Signed-off-by: David Zeuthen <davidz@redhat.com>
+---
+
+Upstream-Status: Accepted
+
+ src/polkit/polkitunixsession-systemd.c |   21 ++++++++++++++++-----
+ 1 files changed, 16 insertions(+), 5 deletions(-)
+
+diff --git a/src/polkit/polkitunixsession-systemd.c b/src/polkit/polkitunixsession-systemd.c
+index e7e913f..94a7ee4 100644
+--- a/src/polkit/polkitunixsession-systemd.c
++++ b/src/polkit/polkitunixsession-systemd.c
+@@ -23,6 +23,7 @@
+ #  include "config.h"
+ #endif
+ 
++#include <stdlib.h>
+ #include <string.h>
+ #include "polkitunixsession.h"
+ #include "polkitsubject.h"
+@@ -450,9 +451,8 @@ polkit_unix_session_initable_init (GInitable     *initable,
+                                    GError       **error)
+ {
+   PolkitUnixSession *session = POLKIT_UNIX_SESSION (initable);
+-  gboolean ret;
+-
+-  ret = FALSE;
++  gboolean ret = FALSE;
++  char *s;
+ 
+   if (session->session_id != NULL)
+     {
+@@ -461,8 +461,19 @@ polkit_unix_session_initable_init (GInitable     *initable,
+       goto out;
+     }
+ 
+-  if (!sd_pid_get_session (session->pid, &session->session_id))
+-    ret = TRUE;
++  if (sd_pid_get_session (session->pid, &s) == 0)
++    {
++      session->session_id = g_strdup (s);
++      free (s);
++      ret = TRUE;
++      goto out;
++    }
++
++  g_set_error (error,
++               POLKIT_ERROR,
++               POLKIT_ERROR_FAILED,
++               "No session for pid %d",
++               (gint) session->pid);
+ 
+ out:
+   return ret;
+-- 
+1.7.2.5
+
diff --git a/meta-oe/recipes-extended/polkit/polkit-0.104/0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch b/meta-oe/recipes-extended/polkit/polkit-0.104/0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch
new file mode 100644
index 0000000..49f8ce2
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit-0.104/0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch
@@ -0,0 +1,46 @@
+From 8fb8b406bab50c5ef8c5d4f743e3f13924bd5f73 Mon Sep 17 00:00:00 2001
+From: David Zeuthen <davidz@redhat.com>
+Date: Mon, 6 Feb 2012 11:26:06 -0500
+Subject: [PATCH 2/2] PolkitUnixSession: Actually return TRUE if a session exists
+
+Also, don't treat the integer returned by sd_session_get_uid() as a
+boolean because that's just confusing.
+
+Signed-off-by: David Zeuthen <davidz@redhat.com>
+---
+
+Upstream-Status: Accepted
+
+ src/polkit/polkitunixsession-systemd.c |   12 +++++-------
+ 1 files changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/src/polkit/polkitunixsession-systemd.c b/src/polkit/polkitunixsession-systemd.c
+index 94a7ee4..8a8bf65 100644
+--- a/src/polkit/polkitunixsession-systemd.c
++++ b/src/polkit/polkitunixsession-systemd.c
+@@ -361,17 +361,15 @@ polkit_unix_session_to_string (PolkitSubject *subject)
+ 
+ static gboolean
+ polkit_unix_session_exists_sync (PolkitSubject   *subject,
+-                                    GCancellable    *cancellable,
+-                                    GError         **error)
++                                 GCancellable    *cancellable,
++                                 GError         **error)
+ {
+   PolkitUnixSession *session = POLKIT_UNIX_SESSION (subject);
+-  gboolean ret;
++  gboolean ret = FALSE;
+   uid_t uid;
+ 
+-  ret = FALSE;
+-
+-  if (!sd_session_get_uid (session->session_id, &uid))
+-    ret = FALSE;
++  if (sd_session_get_uid (session->session_id, &uid) == 0)
++    ret = TRUE;
+ 
+   return ret;
+ }
+-- 
+1.7.2.5
+
diff --git a/meta-oe/recipes-extended/polkit/polkit-0.104/obsolete_automake_macros.patch b/meta-oe/recipes-extended/polkit/polkit-0.104/obsolete_automake_macros.patch
new file mode 100644
index 0000000..5a6046c
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit-0.104/obsolete_automake_macros.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=59091]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd polkit-0.104/configure.ac polkit-0.104/configure.ac
+--- polkit-0.104/configure.ac	2012-01-03 18:25:49.000000000 +0200
++++ polkit-0.104/configure.ac	2013-01-07 03:13:31.862125625 +0200
+@@ -3,7 +3,7 @@
+ AC_PREREQ(2.59c)
+ AC_INIT(polkit, 0.104, http://lists.freedesktop.org/mailman/listinfo/polkit-devel)
+ AM_INIT_AUTOMAKE(polkit, 0.104)
+-AM_CONFIG_HEADER(config.h)
++AC_CONFIG_HEADERS(config.h)
+ AM_MAINTAINER_MODE
+
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+@@ -24,7 +24,6 @@
+
+ AC_ISC_POSIX
+ AC_PROG_CC
+-AM_PROG_CC_STDC
+ AC_HEADER_STDC
+ AM_PROG_LIBTOOL
+ AC_PROG_MAKE_SET
diff --git a/meta-oe/recipes-extended/polkit/polkit-0.104/polkit-1_pam.patch b/meta-oe/recipes-extended/polkit/polkit-0.104/polkit-1_pam.patch
new file mode 100644
index 0000000..74647ef
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit-0.104/polkit-1_pam.patch
@@ -0,0 +1,23 @@
+polkit: No system-auth in OE-Core, we can use common-* in place of it.
+
+Upstream-Status:Inappropriate [configuration]
+
+Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
+
+--- a/configure.ac	2011-03-04 02:26:20.000000000 +0800
++++ b/configure.ac.new	2011-07-18 10:14:12.516818852 +0800
+@@ -350,10 +350,10 @@
+     PAM_FILE_INCLUDE_PASSWORD=system
+     PAM_FILE_INCLUDE_SESSION=system
+ else
+-   PAM_FILE_INCLUDE_AUTH=system-auth
+-   PAM_FILE_INCLUDE_ACCOUNT=system-auth
+-   PAM_FILE_INCLUDE_PASSWORD=system-auth
+-   PAM_FILE_INCLUDE_SESSION=system-auth
++   PAM_FILE_INCLUDE_AUTH=common-auth
++   PAM_FILE_INCLUDE_ACCOUNT=common-account
++   PAM_FILE_INCLUDE_PASSWORD=common-password
++   PAM_FILE_INCLUDE_SESSION=common-session
+ fi
+ 
+ AC_SUBST(PAM_FILE_INCLUDE_AUTH)
diff --git a/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb b/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
new file mode 100644
index 0000000..7e9fc2b
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
@@ -0,0 +1,26 @@
+SUMMARY = "GNOME Authentication Agent for PolicyKit"
+DESCRIPTION = "PolicyKit-gnome provides an Authentication Agent for PolicyKit that integrates well with the GNOME desktop environment"
+HOMEPAGE = "http://www.packagekit.org/"
+BUGTRACKER = "http://bugzilla.gnome.org/"
+DEPENDS = "polkit dbus-glib gconf gtk+"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=74579fab173e4c5e12aac0cd83ee98ec \
+                    file://src/main.c;beginline=1;endline=20;md5=aba145d1802f2329ba561e3e48ecb795"
+
+SRC_URI = "http://hal.freedesktop.org/releases/polkit-gnome-${PV}.tar.bz2 \
+          "
+
+PR = "r2"
+
+EXTRA_OECONF = " --disable-scrollkeeper \
+                 --disable-man-pages \
+                 --disable-examples \
+                 --disable-introspection "
+
+inherit autotools gtk-doc pkgconfig
+
+FILES_${PN} += " ${datadir}/dbus-1 \
+                 ${datadir}/PolicyKit \
+               "
+SRC_URI[md5sum] = "f6b485ffd7bd605af815fd2747180481"
+SRC_URI[sha256sum] = "81caa6972e651e90ef4ac31d7ed41bc79543d46b850dbd5b14b40f8ef7107d11"
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.104.bb b/meta-oe/recipes-extended/polkit/polkit_0.104.bb
new file mode 100644
index 0000000..ab2547b
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit_0.104.bb
@@ -0,0 +1,44 @@
+SUMMARY = "PolicyKit Authorization Framework"
+DESCRIPTION = "The polkit package is an application-level toolkit for defining and handling the policy that allows unprivileged processes to speak to privileged processes."
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/polkit"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
+                    file://src/polkit/polkit.h;beginline=1;endline=20;md5=0a8630b0133176d0504c87a0ded39db4"
+
+DEPENDS = "expat glib-2.0 intltool-native gobject-introspection-stub"
+
+PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                 ${@base_contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)}"
+
+PACKAGECONFIG[pam] = "--with-authfw=pam,--with-authfw=shadow,libpam,libpam"
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
+# there is no --enable/--disable option for consolekit and it's not picked by shlibs, so add it to RDEPENDS
+PACKAGECONFIG[consolekit] = ",,,consolekit"
+
+PR = "r9"
+
+PAM_SRC_URI = "file://polkit-1_pam.patch"
+SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
+           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+           file://0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch \
+           file://0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch \
+           file://obsolete_automake_macros.patch \
+          "
+
+SRC_URI[md5sum] = "e380b4c6fb1e7bccf854e92edc0a8ce1"
+SRC_URI[sha256sum] = "6b0a13d8381e4a7b7e37c18a54595191b50757e0fcd186cd9918e9ad0f18c7f9"
+
+EXTRA_OECONF = "--with-os-type=moblin --disable-man-pages --disable-introspection"
+
+inherit autotools gtk-doc pkgconfig
+
+do_install_append() {
+	rm -f ${D}${libdir}/${BPN}-1/extensions/*.a
+}
+
+FILES_${PN} += "${libdir}/${BPN}-1/extensions/*.so \
+                ${datadir}/${BPN}-1/actions/* \
+                ${datadir}/dbus-1/system-services/*"
+FILES_${PN}-dbg += "${libdir}/${BPN}-1/extensions/.debug/*.so"
+FILES_${PN}-dev += "${libdir}/${BPN}-1/extensions/*.la "
+
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
deleted file mode 100644
index ceb2b6b..0000000
--- a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-PRINC := "${@int(PRINC) + 5}"
-- 
1.7.10.4



