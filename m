Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web11.625.1630215401306049877
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Aug 2021 22:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=K8JPPNQn;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mKDUj-0005A4-Am; Sun, 29 Aug 2021 07:36:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=w7utBuPZ+nDiLy97/1JaeYbs0iSWwnEr2wcQlJ3qAVk=; b=K8JPPNQnUu+qemdefY7R9Thjsd
	i5qwFV2MwLVXzK89jNWkqPC+n0Tpmi3RtC2KWlK7jpD2yuyeHkYyDbqCGle3RxxS78E3bOfHii0Xx
	IAT//TBZtisPjX+GKWjb4QhDZ+ygnvYtx8ZyhSGeEiZdllUStuE0VMElPzP8gDrlN9eV7KlxguE0P
	y9dx/25wYCSDuqMRmwOACezPKYEPlIz/aMnBu4FFP5ECkjU8D20GbyQt3WpNCzzygtEA+FTyjwqN/
	qRZaxdxTITYj7TF//mkDDxVuDU85eg3dvqhIQGBMoDDJMFj7zucyfIBlv+REhR9iTDE1XOTdUQ0ym
	eKh504vA==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.lan)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mKDUd-0002Gp-Fg; Sun, 29 Aug 2021 07:36:35 +0200
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org
Cc: zboszor@gmail.com
Subject: [meta-gnome][PATCH v2] metacity: Add a patch to create build/src/core before moving generated sources to it
Date: Sun, 29 Aug 2021 07:36:23 +0200
Message-Id: <20210829053623.6991-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <ef6e4f5b-044e-0649-ae59-aa25ecba95dd@pr.hu>
References: <ef6e4f5b-044e-0649-ae59-aa25ecba95dd@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Scan-Signature: 8aa51b574381c52da4c37a712af1dc9c
X-Spam-Tracer: backend.mail.pr.hu -0.8 20210829053635Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zoltán Böszörményi <zboszor@gmail.com>

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...ild-with-disable-dependency-tracking.patch | 65 +++++++++++++++++++
 .../recipes-gnome/metacity/metacity_3.40.0.bb |  5 +-
 2 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/metacity/metacity/0001-fix-build-with-disable-dependency-tracking.patch

diff --git a/meta-gnome/recipes-gnome/metacity/metacity/0001-fix-build-with-disable-dependency-tracking.patch b/meta-gnome/recipes-gnome/metacity/metacity/0001-fix-build-with-disable-dependency-tracking.patch
new file mode 100644
index 000000000..864d0baa2
--- /dev/null
+++ b/meta-gnome/recipes-gnome/metacity/metacity/0001-fix-build-with-disable-dependency-tracking.patch
@@ -0,0 +1,65 @@
+From 632670273cc880917e78a152a3ae39e209b57864 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Sat, 28 Aug 2021 05:58:25 +0200
+Subject: [PATCH] fix build with --disable-dependency-tracking
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+With split build and source directories AND --disable-dependency-tracking
+(like the way Yocto builds are done) there's a reproducible make
+failure on my Fedora 33 build host:
+
+| Making all in src
+| make[2]: Entering directory '.../metacity/1_3.40.0-r0/build/src'
+| .../metacity/1_3.40.0-r0/recipe-sysroot-native/usr/bin/glib-mkenums --template ../../metacity-3.40.0/src/core/meta-enum-types.c.in ../../metacity-3.40.0/src/core/window-private.h ../../metacity-3.40.0/src/include/meta-compositor.h  > \
+| 	meta-enum-types.c.tmp && mv meta-enum-types.c.tmp core/meta-enum-types.c
+| .../metacity/1_3.40.0-r0/recipe-sysroot-native/usr/bin/glib-mkenums --template ../../metacity-3.40.0/src/core/meta-enum-types.h.in ../../metacity-3.40.0/src/core/window-private.h ../../metacity-3.40.0/src/include/meta-compositor.h  > \
+| 	meta-enum-types.h.tmp && mv meta-enum-types.h.tmp core/meta-enum-types.h
+| mv: cannot move 'meta-enum-types.c.tmp' to 'core/meta-enum-types.c'mv: cannot move 'meta-enum-types.h.tmp' to 'core/meta-enum-types.h': No such file or directory
+| : No such file or directory
+| make[2]: *** [Makefile:2240: core/meta-enum-types.c] Error 1
+
+https://gitlab.gnome.org/GNOME/metacity/-/merge_requests/24
+
+Upstream-Status: Pending
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+---
+ configure.ac    | 1 +
+ src/Makefile.am | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index ebb00b85..04aafb94 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -139,6 +139,7 @@ dnl **************************************************************************
+ AC_SUBST(ACLOCAL_AMFLAGS, "\${ACLOCAL_FLAGS}")
+ 
+ AC_PROG_CC
++AC_PROG_MKDIR_P
+ AC_ISC_POSIX
+ AC_HEADER_STDC
+ 
+diff --git a/src/Makefile.am b/src/Makefile.am
+index f86af600..4aa3fdae 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -204,10 +204,12 @@ ENUM_TYPES = \
+ 	$(NULL)
+ 
+ core/meta-enum-types.c: core/meta-enum-types.c.in $(ENUM_TYPES) Makefile.am
++	$(MKDIR_P) core
+ 	$(AM_V_GEN) $(GLIB_MKENUMS) --template $(srcdir)/core/meta-enum-types.c.in $(ENUM_TYPES) > \
+ 		meta-enum-types.c.tmp && mv meta-enum-types.c.tmp core/meta-enum-types.c
+ 
+ core/meta-enum-types.h: core/meta-enum-types.h.in $(ENUM_TYPES) Makefile.am
++	$(MKDIR_P) core
+ 	$(AM_V_GEN) $(GLIB_MKENUMS) --template $(srcdir)/core/meta-enum-types.h.in $(ENUM_TYPES) > \
+ 		meta-enum-types.h.tmp && mv meta-enum-types.h.tmp core/meta-enum-types.h
+ 
+-- 
+2.31.1
+
diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
index a5c704740..e7570ec59 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
@@ -24,7 +24,10 @@ REQUIRED_DISTRO_FEATURES = "x11"
 inherit gnomebase gsettings gettext upstream-version-is-even features_check
 
 SRC_URI[archive.sha256sum] = "224c1f65487eac21f0c1d9856152343768ee726c48b1a8a2835a46a8ad9015b5"
-SRC_URI += "file://0001-drop-zenity-detection.patch"
+SRC_URI += " \
+    file://0001-drop-zenity-detection.patch \
+    file://0001-fix-build-with-disable-dependency-tracking.patch \
+"
 
 PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama"
 # enable as neccessary until new warnings are dealt with
-- 
2.31.1

