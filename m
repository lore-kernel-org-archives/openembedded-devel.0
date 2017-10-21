Return-Path: <athoik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7BA426B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Oct 2017 22:16:56 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f4so3612303wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Oct 2017 15:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BDZf4tpNhkvs2peJ1y5/5rN+eS430PdCDS//q0eG/7k=;
	b=I9O925cjYOeZluv9XbjlxsxnWlqRiUlqLJKm/RGvpqbDF7rhiJu9FiszLQbVg9mtqB
	19h46V/AGGkiBbgskD7Lpoo49H6GvxluI3Qpcja0jFRCJTJgsKh8URCM8fRIKvgPCfER
	L83IRkY6nUzSnIWJ0AbNHWPRft8swlwys+6oVpfci4B/nbICBHSruIjP6dN2AsvILoFV
	NvVFSZyc9nCsimrqM9F4ALPvji3sakubl7mjyZKeMouM/qLjjYbpTS93aAws7Jy8AY71
	MaF2XzyuwreLbVDaRJ6RDOAOpeAekCk6I+/E7QiAdNe0SF/TzBduLTuYK48tOAqr0+XA
	DGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BDZf4tpNhkvs2peJ1y5/5rN+eS430PdCDS//q0eG/7k=;
	b=my9bZRj1CooPvjl4P0QfTBxWE4ObjCyKJd23NOAslS6NC6CchuC+5IhKHtaYACsFI4
	kfYE7qHToHvL/RWZJg47OOfOZBygmmmPIHtXW5mQUeIqSp3z+Al2IXpZ85fKiyey/FWt
	jUUKY5lyAtBM+9u4QCGphNcHoWSOThhBS+EGQf0K9ZyykuEIxiQqDnIGEAro2CROA5vq
	ksekjls113OOwU8DOxgTt3OsJUt1QJjV05u9yJiNDbph9KxH89BnqAHLmXypSxJD0wws
	8HukfEJShVZuBrW+2hZuTVp8LWMjlcgOrXfASD58M/Kx5ehx7jAKlkfgEilWiSA2nk7R
	okMg==
X-Gm-Message-State: AMCzsaWojNkD0z5dMYMQzMElArh/MxuCX7CobybyjJBT4gbodSYVr6eS
	xGQhnuSEwV0SFZvmLvQAF2or
X-Google-Smtp-Source: ABhQp+QFzznr742VVeiil11HwlxpRKEdY5i4TeSofxWQcWnf+cJr0BU5TzeePdR4PI39PztV5cQrew==
X-Received: by 10.28.245.11 with SMTP id t11mr2060922wmh.113.1508624215985;
	Sat, 21 Oct 2017 15:16:55 -0700 (PDT)
Received: from images.net (ns380618.ip-188-165-252.eu. [188.165.252.42])
	by smtp.gmail.com with ESMTPSA id
	e77sm3764305wmi.16.2017.10.21.15.16.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 Oct 2017 15:16:55 -0700 (PDT)
From: Athanasios Oikonomou <athoik@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Oct 2017 01:16:31 +0300
Message-Id: <1508624192-6257-1-git-send-email-athoik@gmail.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: Athanasios Oikonomou <athoik@gmail.com>
Subject: [meta-oe][PATCH v2 1/2] Revert "smbnetfs: delete blacklisted"
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
X-List-Received-Date: Sat, 21 Oct 2017 22:16:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This reverts commit 8159e7d528d61779b711be8b044a4ef2d1ca0ebe.

Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
---
 ...CK_MODULES-to-found-headers-and-libraries.patch | 42 ++++++++++++++++++++++
 .../smbnetfs/smbnetfs/configure.patch              | 11 ++++++
 .../recipes-filesystems/smbnetfs/smbnetfs_git.bb   | 28 +++++++++++++++
 3 files changed, 81 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch
 create mode 100644 meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
 create mode 100644 meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb

diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch
new file mode 100644
index 0000000..f05f09f
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch
@@ -0,0 +1,42 @@
+From 7a524d49b3d4459280f18942df2980603400ec52 Mon Sep 17 00:00:00 2001
+From: Bian Naimeng <biannm@cn.fujitsu.com>
+Date: Fri, 19 Jun 2015 11:54:44 +0900
+Subject: [PATCH] Using PKG_CHECK_MODULES to found headers and libraries of
+ smbclient
+
+Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
+---
+ configure.in    | 5 +++++
+ src/Makefile.am | 3 +++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/configure.in b/configure.in
+index ce21aef..ecd7119 100644
+--- a/configure.in
++++ b/configure.in
+@@ -125,6 +125,11 @@ AC_CHECK_LIB(smbclient, smbc_setOptionUserData,
+     )]
+ )
+ 
++dnl *****************************************************************
++dnl *** Check libsmbclient by pkgconfig to get cflags and ldflags ***
++dnl *****************************************************************
++PKG_CHECK_MODULES(SMBCLIENT, smbclient)
++
+ dnl ******************
+ dnl *** Final step ***
+ dnl ******************
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 41519d8..9fc97e9 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -16,3 +16,6 @@ smbnetfs_SOURCES = \
+ 	event.c			event.h			\
+ 	reconfigure.c		reconfigure.h		\
+ 	main.c
++
++smbnetfs_CFLAGS=${SMBCLIENT_CFLAGS}
++smbnetfs_LDFLAGS=${SMBCLIENT_LDFLAGS}
+-- 
+1.8.4.2
+
diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
new file mode 100644
index 0000000..c80fed1
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
@@ -0,0 +1,11 @@
+Index: git/configure.in
+===================================================================
+--- git.orig/configure.in	2014-06-18 16:06:16.040721349 +0000
++++ git/configure.in	2014-07-18 07:49:17.085552256 +0000
+@@ -1,5 +1,5 @@
+ AC_INIT([SMBNetFS],[0.5.3а])
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
+ AC_CONFIG_HEADERS([src/config.h])
+ AC_PROG_CC
+ 
diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
new file mode 100644
index 0000000..6995ad3
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
@@ -0,0 +1,28 @@
+SUMMARY = "FUSE module for mounting an entire SMB/NMB network in a single directory"
+DESCRIPTION = "SMBNetFS is a Linux/FreeBSD filesystem that allow you to use \
+               samba/microsoft network in the same manner as the network \
+               neighborhood in Microsoft Windows. Please donate me to help \
+               in SMBNetFS development."
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
+HOMEPAGE ="http://sourceforge.net/projects/smbnetfs"
+
+DEPENDS = "fuse samba"
+
+inherit autotools gitpkgv pkgconfig
+
+PKGV = "${GITPKGVTAG}"
+
+SRCREV = "ace1c519d45fe488b9b7e6cc77a2bcadb6c83464"
+
+SRC_URI = "git://smbnetfs.git.sourceforge.net/gitroot/smbnetfs/smbnetfs;branch=master \
+           file://configure.patch \
+           file://Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring=yes,--with-gnome-keyring=no,libgnome-keyring"
+
+S = "${WORKDIR}/git"
+
+PNBLACKLIST[smbnetfs] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132827/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.1.4


