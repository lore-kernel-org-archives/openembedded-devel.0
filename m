Received: from [209.85.128.190] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1KzAl0-0001p8-BL
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Nov 2008 14:55:14 +0100
Received: by fk-out-0910.google.com with SMTP id 19so2599540fkr.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Nov 2008 05:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=PVd6PPzq6+DKGcdxwNy1nH46C830b/m/vhpcLXNxCxY=;
	b=wZXvIHYY7kvY1nj6nqvJHItlnhnP4hw584WnG73Fbs3zyi8fKAesVgvbsFpERvoVov
	PHDUIQaqQ6rlodp0gHC2rMKTfW/IojwQAhgQczIrA4iPjhocCNgfzqhKp86z9LDkP3M5
	+oDqFpimSFI2AN7a23Sar54JCwO01hv8MI+uw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=f+LapvSfyoOIc9pqCZx4AhY0wPwpiMPkYdgN5VUokCOP4EIybHtd30F6XgIl+KXUuS
	pmiJt0pJf0xtQiKvB4Fz94e5Kl6J/TFupq7vr7i8SDa6j9uakI4Gqn38bFLEBZrGN3WR
	Hfno743KWVrDMRUuUBF+Gr8lwr8CLRkVGQxUw=
Received: by 10.181.54.10 with SMTP id g10mr1734693bkk.29.1226237366278;
	Sun, 09 Nov 2008 05:29:26 -0800 (PST)
Received: from localhost.localdomain (ppp89-110-5-254.pppoe.avangarddsl.ru
	[89.110.5.254])
	by mx.google.com with ESMTPS id l12sm8088339fgb.6.2008.11.09.05.29.24
	(version=SSLv3 cipher=RC4-MD5); Sun, 09 Nov 2008 05:29:25 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Nov 2008 16:28:16 +0300
Message-Id: <1226237296-11012-16-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1226237296-11012-15-git-send-email-dbaryshkov@gmail.com>
References: <1226237296-11012-1-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-2-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-3-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-4-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-5-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-6-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-7-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-8-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-9-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-10-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-11-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-12-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-13-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-14-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-15-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH] libgemwidget-1.0: fix build error
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
X-List-Received-Date: Sun, 09 Nov 2008 13:55:14 -0000

Update libgemwidget-1.0 to reflect current Gtk/GIO/GnomeVFS api.

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 .../gpephone/libgemwidget/libgemwidget-fixup.diff  |   43 ++++++++++++++++++++
 packages/gpephone/libgemwidget_1.0.bb              |    2 +-
 2 files changed, 44 insertions(+), 1 deletions(-)
 create mode 100644 packages/gpephone/libgemwidget/libgemwidget-fixup.diff

diff --git a/packages/gpephone/libgemwidget/libgemwidget-fixup.diff b/packages/gpephone/libgemwidget/libgemwidget-fixup.diff
new file mode 100644
index 0000000..9a219f1
--- /dev/null
+++ b/packages/gpephone/libgemwidget/libgemwidget-fixup.diff
@@ -0,0 +1,43 @@
+Index: libgemwidget-1.0/src/gemfilechooser.c
+===================================================================
+--- libgemwidget-1.0.orig/src/gemfilechooser.c	2008-11-04 14:04:26.428221184 +0300
++++ libgemwidget-1.0/src/gemfilechooser.c	2008-11-04 14:41:58.755239494 +0300
+@@ -46,6 +46,7 @@
+ #include <gtk/gtk.h>
+ #include <gdk/gdkkeysyms.h>
+ #include <libgnomevfs/gnome-vfs.h>
++#include <libgnomevfs/gnome-vfs-mime-handlers.h>
+ #include "gemfilechooser.h"
+ #include "gemresource.h"
+ #include "gemenv.h"
+@@ -304,7 +305,7 @@ gem_file_chooser_finalize (GObject *obje
+ }
+
+ static void
+-gem_file_chooser_file_info_print (GtkFileInfo		*info)
++gem_file_chooser_file_info_print (GFileInfo		*info)
+ {
+	struct tm loacl_time;
+	time_t time;
+@@ -331,10 +332,10 @@ gem_file_chooser_file_info_print (GtkFil
+					(gtk_file_info_get_is_folder(info) ? "TRUE" : "FALSE"));
+	g_print("%s():|- Hidden        : %s\n",
+					__FUNCTION__,
+-					(gtk_file_info_get_is_hidden(info) ? "TRUE" : "FALSE"));
++					(g_file_info_get_is_hidden(info) ? "TRUE" : "FALSE"));
+	g_print("%s():|- MIME Type     : %s\n",
+					__FUNCTION__,
+-					gtk_file_info_get_mime_type(info));
++					g_file_info_get_mime_type(info));
+	g_print("%s():|- Modified Time : %04d/%02d/%02d %02d:%02d:%02d\n",
+					__FUNCTION__,
+					loacl_time.tm_year + 1900,
+@@ -345,7 +346,7 @@ gem_file_chooser_file_info_print (GtkFil
+					loacl_time.tm_sec);
+	g_print("%s():`- Size          : %lld\n",
+					__FUNCTION__,
+-					gtk_file_info_get_size(info));
++					g_file_info_get_size(info));
+
+	g_print("\n");
+	return;
diff --git a/packages/gpephone/libgemwidget_1.0.bb b/packages/gpephone/libgemwidget_1.0.bb
index 80e4e4f..a9f02cd 100644
--- a/packages/gpephone/libgemwidget_1.0.bb
+++ b/packages/gpephone/libgemwidget_1.0.bb
@@ -8,7 +8,7 @@ PR          = "r0"
 GPE_TARBALL_SUFFIX = "bz2"
 inherit gpephone pkgconfig autotools
 
-SRC_URI += " file://disable-tests.patch;patch=1"
+SRC_URI += " file://disable-tests.patch;patch=1 file://libgemwidget-fixup.diff;patch=1"
 
 FILES_${PN} += "${datadir}/gem"
 
-- 
1.5.6.5



