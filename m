Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id CD558784AD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 08:33:58 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u48so5524204wrf.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 01:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+4/Go/LvvV58nfTUDLA8TZBHvwFe0TCYmAXbStUyJOY=;
	b=BB+iLRL1fUIgnSeRqfNVbNVT0F/KWbP4MIa7XPhZBBGxQztAOLTR2UdcDUpbRmXpSx
	LBUdw6IYwN5fvByhmelZsHQtpaiM9RaEQM6jG4sPaa6O/yZbgn62GTmodMyUm/IX2VMz
	kkQZjf/grlmjdmIhBJ7idQ76b8uLcgZgNqrfFXYYhMQm2wH7nzwc0smRmkLVhsJcmivB
	Sj9APj3ulzr9qyUJ4BjY+bO17tB4Cq1+pum2QoYP35VqY9krBjiHQguYva5Pn0IiHVIE
	11XMwLkPsVr57xAxjQvYLevB9Zi7WYI78fPAva4WC8rcxophc8mgVbDj87siM3pc5l7+
	eLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+4/Go/LvvV58nfTUDLA8TZBHvwFe0TCYmAXbStUyJOY=;
	b=ZG8S8qEyLlnaAN80AGWc1SsaDTf0wP6W1WMuA4UVfvEneld5k9m8CvR4TIArr0PTiW
	ytWHjXLuHfzzKCyl7VVD9L/NPI1v5EtQGxwACKKkkg5mICUFag9rwh3ffuMjW2Qi/QoU
	XsxRrk9LR5ucaRl7YhryhY+MR+9aiZi30dr19743Q0YBFZCGUa2+Up6YDnCWIEDitH0X
	sz6jidOO24Kzi90cNDeVo1g+Ysv4VW5OU9mtPfEDJYbq9hk76mbNA74FyUNLceh/hA0f
	pQPUgSbLaFvKnvUiDk2UEZx3LckS74aZnaHjG+dJgXOreO9mHMnOA5zPMSyImqLXiXQI
	VNcA==
X-Gm-Message-State: AHPjjUiVmzNFeEEMEhoVNkoSbqnmqnQo7cCFaUKCbOkH5u5VqRjK7wWG
	dMx+zvs1q+NRup5Q
X-Google-Smtp-Source: ADKCNb4L7QwIQQmCgcajTma1In89T37dYMXs8YtucEuB+qsVquFXCzHzn8fBVFp3FEd1QPLBrdP8qw==
X-Received: by 10.223.170.214 with SMTP id i22mr10477224wrc.271.1505205239002; 
	Tue, 12 Sep 2017 01:33:59 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r14sm12939503wra.97.2017.09.12.01.33.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Sep 2017 01:33:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Sep 2017 10:36:12 +0200
Message-Id: <20170912083614.5300-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] smbnetfs: delete blacklisted
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
X-List-Received-Date: Tue, 12 Sep 2017 08:33:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* there was some work on it recently, but it still doesn't work and no
  reply in 2 weeks:
  http://lists.openembedded.org/pipermail/openembedded-devel/2017-August/114480.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...CK_MODULES-to-found-headers-and-libraries.patch | 42 ----------------------
 .../smbnetfs/smbnetfs/configure.patch              | 11 ------
 .../recipes-filesystems/smbnetfs/smbnetfs_git.bb   | 28 ---------------
 3 files changed, 81 deletions(-)
 delete mode 100644 meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch
 delete mode 100644 meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
 delete mode 100644 meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb

diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch
deleted file mode 100644
index f05f09f61..000000000
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 7a524d49b3d4459280f18942df2980603400ec52 Mon Sep 17 00:00:00 2001
-From: Bian Naimeng <biannm@cn.fujitsu.com>
-Date: Fri, 19 Jun 2015 11:54:44 +0900
-Subject: [PATCH] Using PKG_CHECK_MODULES to found headers and libraries of
- smbclient
-
-Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
----
- configure.in    | 5 +++++
- src/Makefile.am | 3 +++
- 2 files changed, 8 insertions(+)
-
-diff --git a/configure.in b/configure.in
-index ce21aef..ecd7119 100644
---- a/configure.in
-+++ b/configure.in
-@@ -125,6 +125,11 @@ AC_CHECK_LIB(smbclient, smbc_setOptionUserData,
-     )]
- )
- 
-+dnl *****************************************************************
-+dnl *** Check libsmbclient by pkgconfig to get cflags and ldflags ***
-+dnl *****************************************************************
-+PKG_CHECK_MODULES(SMBCLIENT, smbclient)
-+
- dnl ******************
- dnl *** Final step ***
- dnl ******************
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 41519d8..9fc97e9 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -16,3 +16,6 @@ smbnetfs_SOURCES = \
- 	event.c			event.h			\
- 	reconfigure.c		reconfigure.h		\
- 	main.c
-+
-+smbnetfs_CFLAGS=${SMBCLIENT_CFLAGS}
-+smbnetfs_LDFLAGS=${SMBCLIENT_LDFLAGS}
--- 
-1.8.4.2
-
diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
deleted file mode 100644
index c80fed187..000000000
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-Index: git/configure.in
-===================================================================
---- git.orig/configure.in	2014-06-18 16:06:16.040721349 +0000
-+++ git/configure.in	2014-07-18 07:49:17.085552256 +0000
-@@ -1,5 +1,5 @@
- AC_INIT([SMBNetFS],[0.5.3а])
--AM_INIT_AUTOMAKE
-+AM_INIT_AUTOMAKE([foreign])
- AC_CONFIG_HEADERS([src/config.h])
- AC_PROG_CC
- 
diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
deleted file mode 100644
index 6995ad3f5..000000000
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "FUSE module for mounting an entire SMB/NMB network in a single directory"
-DESCRIPTION = "SMBNetFS is a Linux/FreeBSD filesystem that allow you to use \
-               samba/microsoft network in the same manner as the network \
-               neighborhood in Microsoft Windows. Please donate me to help \
-               in SMBNetFS development."
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
-HOMEPAGE ="http://sourceforge.net/projects/smbnetfs"
-
-DEPENDS = "fuse samba"
-
-inherit autotools gitpkgv pkgconfig
-
-PKGV = "${GITPKGVTAG}"
-
-SRCREV = "ace1c519d45fe488b9b7e6cc77a2bcadb6c83464"
-
-SRC_URI = "git://smbnetfs.git.sourceforge.net/gitroot/smbnetfs/smbnetfs;branch=master \
-           file://configure.patch \
-           file://Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring=yes,--with-gnome-keyring=no,libgnome-keyring"
-
-S = "${WORKDIR}/git"
-
-PNBLACKLIST[smbnetfs] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132827/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.14.1


