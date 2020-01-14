Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8E83D7F953
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2020 03:47:07 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id p9so4665029plk.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 19:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yzHcTs7+k9Qv+jm+AR+OxlihDzH6oXsdqqKJY+wJUV8=;
	b=Qy8LtsszykSustxpDXXwkSKL3pb6vZavUKauYH4A5d3agAGY/zsv25EL50D+PdKclg
	nk0nv4myTwz2ZLeDFZX3YghtHs0XRVgUmO9PU7X/2HwChpoYtOERYJjMyJ6iGqnX0Ayl
	3dSZBIU6S1t/3O6IFFAbAGE6wMt0kC3ZbicTig0jDsLYFeLjcXDfs/k7uzT8xYamjOfz
	om/ISUR/0uPDgNNFwdNt3KjOdmahjFekojWuuCPoAGfFZJ7calxJ8/SVrYqy9QbYKLda
	hWMLKsc/TlnEcsEXtSOSptzqqzLTgNIsLZtAfe/EFuGpBaboiehNe5AY8tVwpte3M5IS
	bezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yzHcTs7+k9Qv+jm+AR+OxlihDzH6oXsdqqKJY+wJUV8=;
	b=UUTz/kRP3qCRmRKiLImnvvWQJTebjAE9NQ7v4rfCBb3oUtH3KugPt11ZPAcQ/H8Du6
	SV/b6Jel+IkSWJ81cX7EfD6hY1TIDr/OvTBeyPMUXgsdRQ2TF9anBXTzR89EZv6cVgmP
	TB4l/xKK4zQZY2LdSDlY4xnEWrC1P8km/DNM2jcKhMGmk7oTdB7mR1aoHVcMhyxkzHh9
	RwgErTIs3BccA2BYqI2dmyTOuaAlRKl2M3ubM2i1/ttAKlIcHQfEpKbue4GtKk6599jn
	dLUi7MVnXGwBIRg1VSy1NXGwZwtilXV63hlCyVkQEP+V8d0M4rEUsRUr9RClowBQdImi
	npHw==
X-Gm-Message-State: APjAAAXQuxI/z+p3Qg7RTmSsrMwQYh2e/VDNu+39ExLqq56r7lkhrj6R
	vizLZpUM8NbjZLy6Zy7tC01c/0g+F+Y=
X-Google-Smtp-Source: APXvYqwinBDcHajsFoGQvSu/npBC6oxIumKpNZxYrXZ8TpW6RL5GqVkvHCI9KBI9jvvFs4OoisqTFA==
X-Received: by 2002:a17:902:32b:: with SMTP id
	40mr23216931pld.22.1578973628079; 
	Mon, 13 Jan 2020 19:47:08 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id j7sm16577239pgn.0.2020.01.13.19.47.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 19:47:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jan 2020 19:47:06 -0800
Message-Id: <20200114034707.3423104-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
Subject: [meta-multimedia][PATCH 1/2] gstd: Upgrade to 0.8.1
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
X-List-Received-Date: Tue, 14 Jan 2020 03:47:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Install /run and /var/run during runtime
Rewrite absolute symlinks to be relative
Drop upstreamed patch for gtk-doc fix

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...01-Look-for-gtk-doc.make-in-builddir.patch | 32 -------------------
 .../gstd/0001-gstd-yocto-compatibility.patch  | 15 +++------
 .../gstreamer-1.0/gstd_git.bb                 | 20 ++++++++----
 3 files changed, 19 insertions(+), 48 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-Look-for-gtk-doc.make-in-builddir.patch

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-Look-for-gtk-doc.make-in-builddir.patch b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-Look-for-gtk-doc.make-in-builddir.patch
deleted file mode 100644
index 5a2861642d..0000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-Look-for-gtk-doc.make-in-builddir.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a84e9a6e1dca685eda072d58b58556b5b35cb4c8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 10 Sep 2018 21:16:50 -0700
-Subject: [PATCH] Look for gtk-doc.make in builddir
-
-this is evident when S != B because gtkdocize
-generates this file and its actually built into
-build area
-
-Upstream-Status: Submitted [https://github.com/RidgeRun/gstd-1.x/pull/39]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- docs/reference/gstd/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/docs/reference/gstd/Makefile.am b/docs/reference/gstd/Makefile.am
-index f860fa1..62870da 100644
---- a/docs/reference/gstd/Makefile.am
-+++ b/docs/reference/gstd/Makefile.am
-@@ -66,7 +66,7 @@ GTKDOC_LIBS=$(top_builddir)/gstd/libgstd-core.la
- 
- 
- # This includes the standard gtk-doc make rules, copied by gtkdocize.
--include $(top_srcdir)/docs/gtk-doc.make
-+include $(top_builddir)/docs/gtk-doc.make
- 
- # Comment this out if you want 'make check' to test you doc status
- # and run some sanity checks
--- 
-2.18.0
-
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
index ffcc6ea94c..c1c88999a5 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
@@ -7,19 +7,14 @@ Subject: [PATCH] gstd:yocto compatibility
  gstd/Makefile.am                | 2 +-
  3 files changed, 9 insertions(+), 3 deletions(-)
 
-diff --git a/gstd/Makefile.am b/gstd/Makefile.am
-index 13c551d..11fe202 100644
 --- a/gstd/Makefile.am
 +++ b/gstd/Makefile.am
-@@ -49,7 +49,7 @@ bin_PROGRAMS = gstd
+@@ -74,7 +74,7 @@ gstd_CFLAGS = $(GST_CFLAGS)					\
+ 	      -DGSTD_LOG_STATE_DIR=\"$(gstdlogstatedir)\"	\
+ 	      -DGSTD_RUN_STATE_DIR=\"$(gstdrunstatedir)\"
  
- gstd_SOURCES = gstd.c
- gstd_CFLAGS = $(GST_CFLAGS) $(GIO_CFLAGS) $(GJSON_CFLAGS)
--gstd_LDFLAGS = $(GST_LIBS) $(GIO_LIBS) $(GJSON_LIBS) -Wl,-rpath -Wl,$(libdir)
-+gstd_LDFLAGS = $(GST_LIBS) $(GIO_LIBS) $(GJSON_LIBS)
+-gstd_LDFLAGS = $(GST_LIBS) $(GIO_LIBS) $(GIO_UNIX_LIBS) $(GJSON_LIBS) $(LIBD_LIBS) -Wl,-rpath -Wl,$(libdir)
++gstd_LDFLAGS = $(GST_LIBS) $(GIO_LIBS) $(GIO_UNIX_LIBS) $(GJSON_LIBS) $(LIBD_LIBS)
  gstd_LDADD = libgstd-core.la
  
  gstdincludedir = $(includedir)/gstd
--- 
-1.9.1
-
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
index 828caa8833..1834a83661 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
@@ -5,21 +5,29 @@ SECTION = "multimedia"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gstreamer1.0-rtsp-server json-glib libdaemon"
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gstreamer1.0-rtsp-server json-glib libdaemon jansson"
 
 SRCBRANCH ?= "master"
-SRCREV = "3526d0ffdbccc375db7d5fe33a72c68b134657c2"
+SRCREV = "a6621a5778b234651aa2adbbe304d906a3fa64d1"
 SRC_URI = "git://git@github.com/RidgeRun/gstd-1.x.git;protocol=https;branch=${SRCBRANCH} \
            file://0001-gstd-yocto-compatibility.patch \
-           file://0001-Look-for-gtk-doc.make-in-builddir.patch \
            "
 S = "${WORKDIR}/git"
 
 # Remove the +really when upstream version is > 1.0
-PV = "1.0+really0.6.3"
+PV = "1.0+really0.8.0"
 
 inherit autotools pkgconfig gettext gtk-doc
 
-do_configure_prepend() {
-	sed -i -e "s|include \$(top_builddir)/docs/gtk-doc.make||g" ${S}/docs/reference/gstd/Makefile.am
+do_install_append() {
+        rm -fr ${D}${localstatedir}/run ${D}/run ${D}${bindir}/gst-client ${D}${bindir}/gstd-client
+        if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+                install -d ${D}${sysconfdir}/tmpfiles.d
+                echo "d /run/${BPN} - - - -" \
+                > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
+                echo "d /${localstatedir}/log/${BPN} 0755 root root -" \
+                >> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
+        fi
+        ln -sf gst-client-1.0 ${D}${bindir}/gst-client
+        ln -sf gst-client-1.0 ${D}${bindir}/gstd-client
 }
-- 
2.24.1


