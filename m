Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1STxtr-0000T2-Ii
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:13:32 +0200
Received: by bkcjm2 with SMTP id jm2so4215560bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 09:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=I+8Gjp8ya6doxPj/2ickL3HEg0SgvslVYexxd7GPgu0=;
	b=tBMspAPoBbMSdpngO8zL/Quh6DqFuu12peh5Ey7CakbfjPkP7WuhCXYIJW+BmsWnVq
	iakbCP7JmULer3BAdNlnHWum3OWEaLxU0o2+CwXvXZPOTbhL6KtZx1QDltY1PZ4l1/iI
	kQ6KH6bp3JLU1KfGz1u1E3KAq1kMVtkKLCAFdtf+w4YVr+tooW9FMfu7Z4W/zHT6WUva
	/4OSvs/gAIm9ZK1okEbVVwdIxBdbDE5mMNfDl60W8Y8heCVTbJKX34qMdI3BWpi5wsOV
	ICPqaQeU6fxQCQHbSiOzpWrhIT+ZF0HqGF0bNkZA1FM1CS8iCVW1bd9uYgKwOt6pheJn
	PISQ==
Received: by 10.204.148.79 with SMTP id o15mr2444284bkv.87.1337011412480;
	Mon, 14 May 2012 09:03:32 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id ig1sm35829510bkc.4.2012.05.14.09.03.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 May 2012 09:03:31 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 May 2012 18:03:27 +0200
Message-Id: <1337011407-3889-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe] gvfs: fix build
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
X-List-Received-Date: Mon, 14 May 2012 16:13:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Error message was:
| In file included from gvfsfusedaemon.c:44:0:
| /home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/include/glib-2.0/glib/gurifuncs.h:24:2: error: #error "Only <glib.h> can be included directly."

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../0001-gvfsfusedaemon.c-fix-glib-build.patch     |   31 ++++++++++++++++++++
 meta-gnome/recipes-gnome/gvfs/gvfs.inc             |    3 +-
 2 files changed, 33 insertions(+), 1 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gvfs/files/0001-gvfsfusedaemon.c-fix-glib-build.patch

diff --git a/meta-gnome/recipes-gnome/gvfs/files/0001-gvfsfusedaemon.c-fix-glib-build.patch b/meta-gnome/recipes-gnome/gvfs/files/0001-gvfsfusedaemon.c-fix-glib-build.patch
new file mode 100644
index 0000000..3db44a8
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gvfs/files/0001-gvfsfusedaemon.c-fix-glib-build.patch
@@ -0,0 +1,31 @@
+From c339eaaa514b8edcfe8de5c9610b8f2591ec221a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 14 May 2012 17:36:37 +0200
+Subject: [PATCH] gvfsfusedaemon.c: fix glib build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+Upstream-status: Applied but we can not use it because newer versions depend
+on gnome-disk-utiltity >= V3.02 which depends on gtk+ V3
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ client/gvfsfusedaemon.c |    2 --
+ 1 files changed, 0 insertions(+), 2 deletions(-)
+
+diff --git a/client/gvfsfusedaemon.c b/client/gvfsfusedaemon.c
+index bc3090d..f2e708e 100644
+--- a/client/gvfsfusedaemon.c
++++ b/client/gvfsfusedaemon.c
+@@ -41,8 +41,6 @@
+ #include <glib/gprintf.h>
+ #include <gio/gio.h>
+ 
+-#include <glib/gurifuncs.h>
+-
+ /* stuff from common/ */
+ #include <gdaemonmount.h>
+ #include <gvfsdaemonprotocol.h>
+-- 
+1.7.6.5
+
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs.inc b/meta-gnome/recipes-gnome/gvfs/gvfs.inc
index b6a0526..903a8ba 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs.inc
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs.inc
@@ -4,10 +4,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 inherit gnome
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 SRC_URI[archive.md5sum] = "402f94b187b197b403d25c85caeb9562"
 SRC_URI[archive.sha256sum] = "0895ac8f6d416e1b15433b6b6b68eb119c6e8b04fdb66db665d684355ef89345"
+SRC_URI += "file://0001-gvfsfusedaemon.c-fix-glib-build.patch"
 
 EXTRA_OECONF = "--disable-samba \
                 --with-samba-includes=${STAGING_INCDIR} \
-- 
1.7.6.5



