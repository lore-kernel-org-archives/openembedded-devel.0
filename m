Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1AF8E786DC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Feb 2018 05:11:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="36947647"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Feb 2018 13:11:08 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 81C4548AE765
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Feb 2018 13:11:05 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 9 Feb 2018 13:11:05 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Feb 2018 13:11:07 +0800
Message-ID: <1518153067-13324-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 81C4548AE765.A66CA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-xfce][PATCH] imsettings: 1.7.2 -> 1.7.3
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
X-List-Received-Date: Fri, 09 Feb 2018 05:11:09 -0000
Content-Type: text/plain

1.Upgrade imsettings from 1.7.2 to 1.7.3.
2.Delete 0001-Rename-use-of-stdout-and-stderr.patch, gtk-is-required-by-notify.patch, multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch, since it is integrated upstream.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../0001-Rename-use-of-stdout-and-stderr.patch     | 72 ----------------------
 .../imsettings/gtk-is-required-by-notify.patch     | 18 ------
 ...CAL_AMFLAGS-isnot-supported-by-autoreconf.patch | 19 ------
 .../{imsettings_1.7.2.bb => imsettings_1.7.3.bb}   |  7 +--
 4 files changed, 2 insertions(+), 114 deletions(-)
 delete mode 100644 meta-xfce/recipes-extended/imsettings/imsettings/0001-Rename-use-of-stdout-and-stderr.patch
 delete mode 100644 meta-xfce/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch
 delete mode 100644 meta-xfce/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
 rename meta-xfce/recipes-extended/imsettings/{imsettings_1.7.2.bb => imsettings_1.7.3.bb} (73%)

diff --git a/meta-xfce/recipes-extended/imsettings/imsettings/0001-Rename-use-of-stdout-and-stderr.patch b/meta-xfce/recipes-extended/imsettings/imsettings/0001-Rename-use-of-stdout-and-stderr.patch
deleted file mode 100644
index d77ce4d..0000000
--- a/meta-xfce/recipes-extended/imsettings/imsettings/0001-Rename-use-of-stdout-and-stderr.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 7ee62ef0083844ab2fffcd106e3ee2e5f29b2a91 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 12 Jul 2017 18:53:56 -0700
-Subject: [PATCH] Rename use of stdout and stderr
-
-Since it shadow the standard definitions especially
-seen on musl where libc defines these as macros they
-cause all short of compilation errors on musl, using
-a leading underscore makes it unique
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- imsettings-daemon/imsettings-proc.c | 28 ++++++++++++++--------------
- 1 file changed, 14 insertions(+), 14 deletions(-)
-
-diff --git a/imsettings-daemon/imsettings-proc.c b/imsettings-daemon/imsettings-proc.c
-index 915e78b..b78fcff 100644
---- a/imsettings-daemon/imsettings-proc.c
-+++ b/imsettings-daemon/imsettings-proc.c
-@@ -39,8 +39,8 @@
- #define MAXRESTART 3
- 
- typedef struct _IMSettingsProcInfo {
--	GIOChannel     *stdout;
--	GIOChannel     *stderr;
-+	GIOChannel     *_stdout;
-+	GIOChannel     *_stderr;
- 	GPid            pid;
- 	GTimeVal        started_time;
- 	guint           id;
-@@ -368,12 +368,12 @@ _start_process(IMSettingsProc     *proc,
- 					     &ofd, &efd,
- 					     error)) {
- 			pinfo->pid = pid;
--			pinfo->stdout = g_io_channel_unix_new(ofd);
--			pinfo->stderr = g_io_channel_unix_new(efd);
--			g_io_channel_set_close_on_unref(pinfo->stdout, TRUE);
--			g_io_channel_set_close_on_unref(pinfo->stderr, TRUE);
--			pinfo->oid = g_io_add_watch(pinfo->stdout, G_IO_IN, _log_write_cb, proc);
--			pinfo->eid = g_io_add_watch(pinfo->stderr, G_IO_IN, _log_write_cb, proc);
-+			pinfo->_stdout = g_io_channel_unix_new(ofd);
-+			pinfo->_stderr = g_io_channel_unix_new(efd);
-+			g_io_channel_set_close_on_unref(pinfo->_stdout, TRUE);
-+			g_io_channel_set_close_on_unref(pinfo->_stderr, TRUE);
-+			pinfo->oid = g_io_add_watch(pinfo->_stdout, G_IO_IN, _log_write_cb, proc);
-+			pinfo->eid = g_io_add_watch(pinfo->_stderr, G_IO_IN, _log_write_cb, proc);
- 			g_get_current_time(&pinfo->started_time);
- 			pinfo->id = g_child_watch_add(pid, _watch_im_status_cb, proc);
- 
-@@ -521,13 +521,13 @@ imsettings_proc_get_property(GObject    *object,
- static void
- imsettings_proc_info_finalize(IMSettingsProcInfo *pinfo)
- {
--	if (pinfo->stdout) {
--		g_io_channel_unref(pinfo->stdout);
--		pinfo->stdout = NULL;
-+	if (pinfo->_stdout) {
-+		g_io_channel_unref(pinfo->_stdout);
-+		pinfo->_stdout = NULL;
- 	}
--	if (pinfo->stderr) {
--		g_io_channel_unref(pinfo->stderr);
--		pinfo->stderr = NULL;
-+	if (pinfo->_stderr) {
-+		g_io_channel_unref(pinfo->_stderr);
-+		pinfo->_stderr = NULL;
- 	}
- 	if (pinfo->oid > 0) {
- 		g_source_remove(pinfo->oid);
--- 
-2.13.2
-
diff --git a/meta-xfce/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch b/meta-xfce/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch
deleted file mode 100644
index d42358d..0000000
--- a/meta-xfce/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-gtk+ is required by linnotify. So make sure gtk be linked before libnotify
-
-Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
-
-diff -Nurp imsettings-1.6.7.orig/configure.ac imsettings-1.6.7/configure.ac
---- imsettings-1.6.7.orig/configure.ac	2013-11-26 16:09:09.000000000 +0800
-+++ imsettings-1.6.7/configure.ac	2014-12-30 11:27:44.370003209 +0800
-@@ -93,8 +93,8 @@ PKG_CHECK_MODULES(LIBNOTIFY, libnotify,
- 		has_old_libnotify=yes
- 		PKG_CHECK_MODULES(GTK, gtk+-2.0 >= $GTK_REQUIRED)
- 		AC_DEFINE(HAS_OLD_LIBNOTIFY,, [Using older libnotify])
--		IMDAEMON_CFLAGS="$GTK_CFLAGS $LIBNOTIFY_OLD_CFLAGS"
--		IMDAEMON_LIBS="$GTK_LIBS $LIBNOTIFY_OLD_LIBS"],[
-+		IMDAEMON_CFLAGS="$LIBNOTIFY_OLD_CFLAGS $GTK_CFLAGS"
-+		IMDAEMON_LIBS="$LIBNOTIFY_OLD_LIBS $GTK_LIBS"],[
- 		has_old_libnotify=no
- 		IMDAEMON_CFLAGS="$LIBNOTIFY_CFLAGS"
- 		IMDAEMON_LIBS="$LIBNOTIFY_LIBS"])
diff --git a/meta-xfce/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch b/meta-xfce/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
deleted file mode 100644
index d5ac87d..0000000
--- a/meta-xfce/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-multi-line ACLOCAL_AMFLAGS isn't supported by autoreconf.
-It will cause configure error as follow.
-
-  aclocal: error: non-option arguments are not accepted: '\'.
-
-Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
-
-diff -Nurp imsettings-1.7.1.orig/Makefile.am imsettings-1.7.1/Makefile.am
---- imsettings-1.7.1.orig/Makefile.am	2013-02-08 11:33:59.000000000 +0900
-+++ imsettings-1.7.1/Makefile.am	2015-06-24 14:15:32.070000007 +0900
-@@ -1,7 +1,7 @@
- NULL =
- SUBDIRS = data imsettings imsettings-daemon backends utils po tests docs
- 
--ACLOCAL_AMFLAGS = -Im4macros
-+ACLOCAL_AMFLAGS = -I m4macros $(NULL)
- 
- CONFIGURE_DEPENDENCIES =		\
- 	requires			\
diff --git a/meta-xfce/recipes-extended/imsettings/imsettings_1.7.2.bb b/meta-xfce/recipes-extended/imsettings/imsettings_1.7.3.bb
similarity index 73%
rename from meta-xfce/recipes-extended/imsettings/imsettings_1.7.2.bb
rename to meta-xfce/recipes-extended/imsettings/imsettings_1.7.3.bb
index 7a4ce05..c00b193 100644
--- a/meta-xfce/recipes-extended/imsettings/imsettings_1.7.2.bb
+++ b/meta-xfce/recipes-extended/imsettings/imsettings_1.7.3.bb
@@ -10,13 +10,10 @@ SECTION = "Applications/System"
 inherit autotools gtk-doc gobject-introspection
 
 SRC_URI = "https://bitbucket.org/tagoh/imsettings/downloads/${BPN}-${PV}.tar.bz2 \
-           file://gtk-is-required-by-notify.patch \
-           file://multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch \
-           file://0001-Rename-use-of-stdout-and-stderr.patch \
            "
 
-SRC_URI[md5sum] = "8153b0583a9f47d8a62af1f92fb9d3bf"
-SRC_URI[sha256sum] = "41addf0458f760212b6b6100835066e16deb3a8a50eb005a0fc17fbac0a2ae66"
+SRC_URI[md5sum] = "c6c65a2b2654fe9dfe9ab2e8b80c079a"
+SRC_URI[sha256sum] = "196d3a74cef254ff812c32682d1818d740e36a68b976fef9e99748d23a71a71a"
 
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
-- 
2.7.4




