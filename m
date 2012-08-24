Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4n5C-0003j3-5r
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2012 08:09:26 +0200
Received: by pbcwy7 with SMTP id wy7so2827997pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2012 22:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=7E3RpPtiKFl3esWjpx9XmEJoJ6o/Glu21zH89t4z4WU=;
	b=L6DT6hGx2NDI3jHU0iCfkdQb8Lql813c709ZMkcoVbSq7/aO22ue5+hj7a6TAKPiq9
	bj0abwhPw2ARWIL42M/D58EQv432rxIn7WNW0FIGGywFaXqseiz6kgO9DfKjWvV6Rp55
	E1YheU9YvDBt3W5CEVL18IhtZEmmpz8DRLmSs6dRLB1U5gDCTOGJPeCRRZ8DkQ65+qMw
	PVF7GNHildJKNC3El0+W5CQ31zdYU5UH/dYMIhCpgQuW0PHn9DDLdoGuZjAZERe94ys/
	kcIhE/cj6o0jH/qa8V/sO9ZsZPkh3TUm5ie41gj42DZRuuwmW0zxFcwUedT0L8zITPXv
	Jbow==
Received: by 10.68.225.196 with SMTP id rm4mr10070394pbc.131.1345787838235;
	Thu, 23 Aug 2012 22:57:18 -0700 (PDT)
Received: from leo.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id hr9sm7594293pbc.36.2012.08.23.22.57.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Aug 2012 22:57:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Aug 2012 22:57:01 -0700
Message-Id: <1345787825-9950-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [2011.03-maintenance][PATCH 1/5] libwnck: Fix build without needing introspection-native
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
X-List-Received-Date: Fri, 24 Aug 2012 06:09:26 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/gnome/libwnck/introspection.patch |   13 +++++++++++++
 recipes/gnome/libwnck_2.30.5.bb           |   11 +++++------
 2 files changed, 18 insertions(+), 6 deletions(-)
 create mode 100644 recipes/gnome/libwnck/introspection.patch

diff --git a/recipes/gnome/libwnck/introspection.patch b/recipes/gnome/libwnck/introspection.patch
new file mode 100644
index 0000000..0c0c24f
--- /dev/null
+++ b/recipes/gnome/libwnck/introspection.patch
@@ -0,0 +1,13 @@
+Index: libwnck-2.30.5/configure.ac
+===================================================================
+--- libwnck-2.30.5.orig/configure.ac	2012-07-02 05:17:34.118158298 -0700
++++ libwnck-2.30.5/configure.ac	2012-07-02 05:23:19.071869288 -0700
+@@ -167,7 +167,7 @@
+ ##################################################
+ GTK_DOC_CHECK([1.9])
+ 
+-GOBJECT_INTROSPECTION_CHECK([0.6.14])
++AM_CONDITIONAL([HAVE_INTROSPECTION], [false])
+ 
+ AC_OUTPUT([
+ Makefile
diff --git a/recipes/gnome/libwnck_2.30.5.bb b/recipes/gnome/libwnck_2.30.5.bb
index 6a981a3..fa3c0ce 100644
--- a/recipes/gnome/libwnck_2.30.5.bb
+++ b/recipes/gnome/libwnck_2.30.5.bb
@@ -1,14 +1,13 @@
 DESCRIPTION = "Window navigation construction toolkit"
 LICENSE = "LGPL"
 SECTION = "x11/libs"
-DEPENDS = "gobject-introspection-native gtk+ gtk+-native"
-
+DEPENDS = "gtk+ gtk+-native"
+PR = "r1"
 inherit gnome
+
+SRC_URI += "file://introspection.patch"
+
 SRC_URI[archive.md5sum] = "4162d5b96151e6d24ec02ae3a822203c"
 SRC_URI[archive.sha256sum] = "56b6681e89cd45491bb640165d62276d81369a08974042b26645dc1e0e954cc1"
 
 EXTRA_OECONF += "--enable-introspection=no"
-
-do_configure_prepend() {
-	sed -i '/GOBJECT_INTROSPECTION_CHECK([0.6.14])/d' configure.ac
-}
-- 
1.7.9.5



