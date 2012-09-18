Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDyli-0001n9-JY
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:18 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999601bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=VnqteLbI5+bn/jlkVRMUEDRZ4I8xPn3dBYYsHsn5yIk=;
	b=UIPQTpSD+kx2wpENUIBLBfLqfEq8F+IeGNs518WHodIR4VM2TQasCnJq8SxIsqX1NZ
	FeqddhbgMllkKPxVwE6Bmd1swZ+B4sy6BbPIOgZFu0jVZ2ATSzYrFqevExHa3FZvkDnZ
	affSo2L7yKjOP88HrtypcLDTmFLIsL4QHebiEF21CJThpIOBrehxhosobb7AZQ+HrhEX
	+pv3WoUhXWcIBGKb+qfgN95kFjYTgUvw0Mlaj9Rrw26TiEt6BMszOvXy29qv7FqpcPHq
	s8AVkmx98NgVX4ORzKvrlWvdOFpKFjy4ITsvDZLhRjt/zSHm9PGGR6L15w1G9N/iLPgL
	oh6Q==
Received: by 10.204.128.214 with SMTP id l22mr153015bks.86.1347977680861;
	Tue, 18 Sep 2012 07:14:40 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:12:59 +0200
Message-Id: <1347977601-28665-19-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 18/40] xfdesktop update to 4.10.0
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
X-List-Received-Date: Tue, 18 Sep 2012 14:27:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfdesktop/relative-symlinks-docs.patch         |   31 --------------------
 .../recipes-xfce/xfdesktop/xfdesktop_4.10.0.bb     |   12 +++++++
 .../recipes-xfce/xfdesktop/xfdesktop_4.8.3.bb      |   19 ------------
 3 files changed, 12 insertions(+), 50 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfdesktop/xfdesktop/relative-symlinks-docs.patch
 create mode 100644 meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.0.bb
 delete mode 100644 meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.8.3.bb

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop/relative-symlinks-docs.patch b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop/relative-symlinks-docs.patch
deleted file mode 100644
index 751d7a6..0000000
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop/relative-symlinks-docs.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5039e7834fff94f8393963ea8dbad81fa95ef810 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
-Date: Fri, 16 Sep 2011 21:09:05 +0200
-Subject: [PATCH] docs: On installation create relative paths in symlinks to
- images
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
----
- doc/manual/Makefile.am |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/doc/manual/Makefile.am b/doc/manual/Makefile.am
-index 646821d..cbf79e1 100644
---- a/doc/manual/Makefile.am
-+++ b/doc/manual/Makefile.am
-@@ -20,7 +20,7 @@ install-data-local:
- 			done; \
- 			if test x"$$lang" != x"C" -a ! -d $(srcdir)/images/$$lang; then \
- 				echo "--- Creating symlink to C images for $$lang"; \
--				ln -sf $(docdir)/html/C/images $(DESTDIR)$(docdir)/html/$$lang/images; \
-+				ln -sf ../C/images $(DESTDIR)$(docdir)/html/$$lang/images; \
- 			fi \
- 		fi \
- 	done;
--- 
-1.7.4.4
-
diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.0.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.0.bb
new file mode 100644
index 0000000..c9cd924
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.0.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Xfce4 Desktop Manager"
+SECTION = "x11/base"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "glib-2.0 gtk+ libxfce4util libxfce4ui libwnck xfconf dbus-glib thunar garcon exo"
+
+inherit xfce
+
+SRC_URI[md5sum] = "d5f6fb9fdde3ddff5804b2a251892936"
+SRC_URI[sha256sum] = "897ae6ee435dcc89809ad70c15c5d15347d1cf4fc8033238b17dcc47836c2d7b"
+
+FILES_${PN} += "${datadir}/backgrounds"
diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.8.3.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.8.3.bb
deleted file mode 100644
index 2866280..0000000
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.8.3.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Xfce4 Desktop Manager"
-SECTION = "x11/base"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "gtk+ libxfce4util libxfce4ui libwnck xfconf dbus-glib thunar garcon exo"
-
-PR = "r0"
-
-inherit xfce
-
-# SRC_URI must follow inherited one
-SRC_URI += " \
-    file://relative-symlinks-docs.patch \
-"
-
-FILES_${PN} += "${datadir}/xfce4/backdrops"
-
-SRC_URI[md5sum] = "617c667c469698e8c974e38412cb484c"
-SRC_URI[sha256sum] = "e58460f52ae96c389402f6db62c46db61cd51cdb550a42bd97c0ab2a5b62f424"
-- 
1.7.6.5



