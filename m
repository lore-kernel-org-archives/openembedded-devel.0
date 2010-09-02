Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OqxZo-0006Lw-EL
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 02:23:22 +0200
Received: by pvg6 with SMTP id 6so3226336pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 17:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=86r4KWvlSGMLyiUWFHysn1BMGDFfczOd/wQ6OT7I2gw=;
	b=aArdrCVpNfdnCUkrHKiHOSiYZDmq+K2dS9e58YSlhiaTqMncck4Q1961IjDsP4938c
	GctPAFSw9ukJFi4hA1qIKSw0H2F+QbscinHF6UAIPyyKhYwVOl4BzuN68vo2zJcW3vgJ
	QyXo68y5aVq7VS0p7jLGcBq8DDaKfiGoS2+0Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=bm98FmB3LyybQKVkLRAhn6gmbHR49ut4XYqhhPLQ5UuDUB0G0FnkKIC0sIM850PvtB
	deY8STUBnAskEpIqNg7uwCVsvZrr4e7PjZU/AZYDoYzPf6zYkIx2j8L2KV3ygFO9qZm+
	qqx3pxaE0JSDUy1c9yrEPnp+w+gJi2mcRWYng=
Received: by 10.114.210.6 with SMTP id i6mr9674539wag.139.1283386911773;
	Wed, 01 Sep 2010 17:21:51 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	33sm19544497wad.18.2010.09.01.17.21.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Sep 2010 17:21:51 -0700 (PDT)
Message-ID: <4C7EEE1A.40103@gmail.com>
Date: Thu, 02 Sep 2010 09:51:46 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100721 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gpe-package: remove some ancient recipes.
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
X-List-Received-Date: Thu, 02 Sep 2010 00:23:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 .../gpe-package/gpe-package-0.2/nostropts.patch    |   15 ------
 .../gpe-package/gpe-package-0.2/use-filesel.patch  |   51 --------------------
 recipes/gpe-package/gpe-package_0.2.bb             |   15 ------
 recipes/gpe-package/gpe-package_0.3.bb             |   26 ----------
 4 files changed, 0 insertions(+), 107 deletions(-)
 delete mode 100644 recipes/gpe-package/gpe-package-0.2/nostropts.patch
 delete mode 100644 recipes/gpe-package/gpe-package-0.2/use-filesel.patch
 delete mode 100644 recipes/gpe-package/gpe-package_0.2.bb
 delete mode 100644 recipes/gpe-package/gpe-package_0.3.bb

diff --git a/recipes/gpe-package/gpe-package-0.2/nostropts.patch b/recipes/gpe-package/gpe-package-0.2/nostropts.patch
deleted file mode 100644
index 907f301..0000000
--- a/recipes/gpe-package/gpe-package-0.2/nostropts.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-
-#
-# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
-#
-
---- gpe-package-0.2/interface.c~nostropts	2004-10-19 18:33:19.000000000 -0400
-+++ gpe-package-0.2/interface.c	2005-01-04 15:14:08.587136384 -0500
-@@ -18,7 +18,6 @@
- #include <unistd.h>
- #include <dirent.h>
- #include <fcntl.h>
--#include <stropts.h>
- #include <poll.h>
- #include <sys/types.h>
- #include <sys/socket.h>
diff --git a/recipes/gpe-package/gpe-package-0.2/use-filesel.patch b/recipes/gpe-package/gpe-package-0.2/use-filesel.patch
deleted file mode 100644
index c25b9b1..0000000
--- a/recipes/gpe-package/gpe-package-0.2/use-filesel.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-diff -urNd ../gpe-package-0.2-r0/gpe-package-0.2/Makefile gpe-package-0.2/Makefile
---- ../gpe-package-0.2-r0/gpe-package-0.2/Makefile	2004-10-20 09:37:58 +01:00
-+++ gpe-package-0.2/Makefile	2004-12-24 20:57:02 +00:00
-@@ -18,7 +18,7 @@
- BUILD = build
- endif
- 
--MEMBERS  = main interface packages filechooser feededit
-+MEMBERS  = main interface packages filesel feededit
- 
- ifeq ($(DEBUG),yes)
- CFLAGS += -g -DDEBUG
-diff -urNd ../gpe-package-0.2-r0/gpe-package-0.2/filesel.c gpe-package-0.2/filesel.c
---- ../gpe-package-0.2-r0/gpe-package-0.2/filesel.c	2003-11-28 23:50:10 +00:00
-+++ gpe-package-0.2/filesel.c	2004-12-24 21:14:38 +00:00
-@@ -81,20 +81,18 @@
- }
- 
- 
--void
-+/*void
- ask_user_a_file (char *path, char *prompt,
- 		 void (*File_Selected) (char *filename, gpointer data),
--		 void (*Cancel) (gpointer data), gpointer data)
-+		 void (*Cancel) (gpointer data), gpointer data)*/
-+int package_choose(GtkWidget *parent, void (*File_Selected) (char *filename, gpointer data))
- {
- 	char buf[1024];
- 	char *ret = getcwd (buf, 1024);
- 	
--	if (path)		// this is a hack, we're all waiting a gtk_file_selection_change_directory().. (TODO)
--		chdir (path);
- 	{
- 		GtkWidget *fileselection1 =
--			gtk_file_selection_new (prompt ? prompt :
--						_("Select File"));
-+			gtk_file_selection_new (_("Choose packages"));
- 		GtkWidget *ok_button1 =
- 			GTK_FILE_SELECTION (fileselection1)->ok_button;
- 		GtkWidget *cancel_button1 =
-@@ -110,8 +108,8 @@
- 			chdir (buf);
- 		s->fs = fileselection1;
- 		s->File_Selected = File_Selected;
--		s->Cancel = Cancel;
--		s->data = data;
-+		s->Cancel = NULL;
-+		s->data = NULL;
- 
- 		GTK_WINDOW (fileselection1)->type = GTK_WINDOW_TOPLEVEL;
- 
diff --git a/recipes/gpe-package/gpe-package_0.2.bb b/recipes/gpe-package/gpe-package_0.2.bb
deleted file mode 100644
index dcf6b14..0000000
--- a/recipes/gpe-package/gpe-package_0.2.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-LICENSE = "GPL"
-PR = "r3"
-inherit gpe pkgconfig
-
-DESCRIPTION = "A package manager GUI for GPE"
-DEPENDS = "ipkg libgpewidget"
-RDEPENDS_${PN} = "gpe-icons"
-SECTION = "gpe"
-PRIORITY = "optional"
-
-SRC_URI += "file://use-filesel.patch \
-	    file://nostropts.patch"
-
-SRC_URI[md5sum] = "764e50856c99140d20842e05ebb95e3e"
-SRC_URI[sha256sum] = "f82ddcf48e582eb1743727c1767a5dc81fa533c1a5ca40f3ac99a50a4479aefd"
diff --git a/recipes/gpe-package/gpe-package_0.3.bb b/recipes/gpe-package/gpe-package_0.3.bb
deleted file mode 100644
index 964a2d6..0000000
--- a/recipes/gpe-package/gpe-package_0.3.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-LICENSE = "GPL"
-PR = "r4"
-inherit gpe pkgconfig
-
-DESCRIPTION = "A package manager GUI for GPE"
-DEPENDS = "ipkg libpcre libgpewidget"
-RDEPENDS_${PN} = "gpe-icons gpe-su"
-SECTION = "gpe"
-PRIORITY = "optional"
-
-SRC_URI += " file://sbin-and-no-suid-install.patch \
-		file://search.patch \
-		file://gpe-package"
-
-FILES_${PN} += " /usr/bin/gpe-package"
-
-CFLAGS += "-DENABLE_PCRE"
-LDFLAGS += "-lpcre"
-
-do_install_append() {
-	install -d ${D}${bindir}
-	install -m 0755 ${WORKDIR}/gpe-package ${D}${bindir}
-}
-
-SRC_URI[md5sum] = "229ba1d7755cc3e77d1e711281ae3554"
-SRC_URI[sha256sum] = "4226c983948521ead98ea0b02939de6b28bacba6f929b9404b9154ffbfb3718e"
-- 
1.7.1



