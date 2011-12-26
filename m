Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Rezz9-0000wG-Be
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Dec 2011 03:08:20 +0100
Received: (qmail invoked by alias); 26 Dec 2011 02:01:00 -0000
Received: from p4FDF1C30.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.28.48]
	by mail.gmx.net (mp072) with SMTP; 26 Dec 2011 03:01:00 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/ZTgg765HZqnkp4yqPaekzKc5Rxk3eOU7sIqifZ+
	Tg65n747XVYv/S
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Dec 2011 03:01:58 +0100
Message-Id: <1324864919-17138-2-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1324864919-17138-1-git-send-email-schnitzeltony@gmx.de>
References: <1324864919-17138-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 2/3] xfwm4: update to 4.8.1
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
X-List-Received-Date: Mon, 26 Dec 2011 02:08:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* build tested incremental & from empty build dir
* run tested on overo

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../xfwm4/xfwm4/relative-symlinks-docs.patch       |   33 --------------------
 .../xfwm4/{xfwm4_4.8.2.bb => xfwm4_4.8.3.bb}       |    8 +---
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfwm4/xfwm4/relative-symlinks-docs.patch
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.8.2.bb => xfwm4_4.8.3.bb} (79%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4/relative-symlinks-docs.patch b/meta-xfce/recipes-xfce/xfwm4/xfwm4/relative-symlinks-docs.patch
deleted file mode 100644
index 67433ee..0000000
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4/relative-symlinks-docs.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 09d0d36450e25554785bf7f730e4ba0e31982be6 Mon Sep 17 00:00:00 2001
-From: Andreas Mueller <schnitzeltony@gmx.de>
-Date: Thu, 21 Jul 2011 19:52:28 +0200
-Subject: [PATCH] docs: On installation create relative paths in symlinks to
- images
-
-
-Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
----
-
-Upstream-Status: accepted
-
-http://git.xfce.org/xfce/xfwm4/commit/?h=xfce-4.8&id=08b6d60056d7ca9884a46d6b92e77c9fc68ce8c5
-
- doc/manual/Makefile.am |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/doc/manual/Makefile.am b/doc/manual/Makefile.am
-index b21962f..88e234b 100644
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
diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.2.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.3.bb
similarity index 79%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.2.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.3.bb
index c1ad221..e2dc4ab 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.2.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.3.bb
@@ -6,12 +6,8 @@ DEPENDS = "virtual/libx11 libxpm gtk+ libxfce4util libxfce4ui xfconf libwnck dbu
 
 inherit xfce update-alternatives
 
-# SRC_URI must follow inherited one
-SRC_URI += " \
-    file://relative-symlinks-docs.patch \
-"
-SRC_URI[md5sum] = "41b730d5abf39a69fc3b221728ddaa75"
-SRC_URI[sha256sum] = "6db2a6148d63d45699dbf6403fb227f8cbd529dcec7ee0827342940c442b0747"
+SRC_URI[md5sum] = "66cb65797cea8a62563f69b833c7888b"
+SRC_URI[sha256sum] = "0b0e8bea0b257958ad416ab5678cf0cdd7e909943d4d5ab32afc35295a78227e"
 
 EXTRA_OECONF += " --enable-startup-notification"
 
-- 
1.7.4.4



