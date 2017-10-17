Return-Path: <athoik@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id B497278348
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 21:01:43 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id k62so3026389wrc.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 14:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xIPKSGJPUITQY/1LJyH2wAU5nO53UI+3BmR7rT78NTU=;
	b=UaZDjR3tO3WAmuc9moE7B21qd2P3XwOZkGDenbf+V7pjNkWfVbwz0lcaBx/ArGKSKW
	Nup1XonZVRerhyaIYALPgmXF8g92OmsHbYkfNIDTCZEJyZEqoEzl4ZnIzDa3HI+HDEhi
	6VW5/3kpH44ydLGV5wJRDI5n8IPd6vGijg4HUfPDtD35BXBBgN558Q3Ik5Y4Xv9vliIO
	/t2aVuRexgqDfT2eDISLMkcZEmii+waQbCRNG91iUCQgAkPSodrY4hJJknEav3/WhrFs
	wT61S/gJ4Zgso//JG45O5zO4beri/7xXgZg4ctKqa8qNheO/ki1WN4rgG0peGQCZZQIl
	o1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xIPKSGJPUITQY/1LJyH2wAU5nO53UI+3BmR7rT78NTU=;
	b=EKj2nMvY6gGy36yW3Ll6e5cVV/KZSIkL+9eB+8fdRdzmTx5qc6s0vxn1Lt/JKGH6Lk
	sK9XzxdjyTKoN4s2MNT35rz839M3POh1o6sNgI4+rWFcZLzeHUptuOaaFydR5JyoYfCO
	S+4S2roM/SD7rJ7TnlM7yUibYjvZfFOCrlYOCrY6G+vzXYiJ7didEQEcY9HEC6TUQy9n
	DHJjzI1/LaZMq+/pEjuEAGXZGSe+Jb/hp+K5d89epKNCOUPeERDZD4VQAzW/kEfuO8Vh
	xmdcbNHohGeQiBBF94YcHuMj7/ONY44T31MmmfhGk4cfwmfcxBnljNUyt/kpBbKff3+b
	909w==
X-Gm-Message-State: AMCzsaXMReP9pSgtKFU80HWMl6K/+A5jgf6J+Ocga13DLSYlvqZ5dhIZ
	6qw6kXjeUeAm1vJ1reEDxo3L
X-Google-Smtp-Source: ABhQp+TyEDl503u1PpcEWn8O9hARGHkogYhga3QjkjxZVhtnE+TFnt6+Vo2ivMyc5KNGEu72qg1xeg==
X-Received: by 10.223.185.91 with SMTP id b27mr4593507wrg.194.1508274104426;
	Tue, 17 Oct 2017 14:01:44 -0700 (PDT)
Received: from images.net (ns380618.ip-188-165-252.eu. [188.165.252.42])
	by smtp.gmail.com with ESMTPSA id v8sm8228203wrg.80.2017.10.17.14.01.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Oct 2017 14:01:43 -0700 (PDT)
From: Athanasios Oikonomou <athoik@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Oct 2017 00:01:22 +0300
Message-Id: <1508274082-5871-2-git-send-email-athoik@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1508274082-5871-1-git-send-email-athoik@gmail.com>
References: <1508274082-5871-1-git-send-email-athoik@gmail.com>
MIME-Version: 1.0
Cc: Athanasios Oikonomou <athoik@gmail.com>
Subject: [meta-oe][PATCH 2/2] smbnetfs: update update 0.5.3a -> 0.6.0
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
X-List-Received-Date: Tue, 17 Oct 2017 21:01:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It seems that updating smbnetfs to latest revision fixes build issues.
Also remove the blacklist allowing the plugin to build again.
Patches reworked to apply on 0.6.0.

Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
---
 .../Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch    | 6 +++---
 .../recipes-filesystems/smbnetfs/smbnetfs/configure.patch           | 6 +++---
 meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb       | 4 +---
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch
index f05f09f..371ab89 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch
@@ -10,10 +10,10 @@ Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
  src/Makefile.am | 3 +++
  2 files changed, 8 insertions(+)
 
-diff --git a/configure.in b/configure.in
+diff --git a/configure.ac b/configure.ac
 index ce21aef..ecd7119 100644
---- a/configure.in
-+++ b/configure.in
+--- a/configure.ac
++++ b/configure.ac
 @@ -125,6 +125,11 @@ AC_CHECK_LIB(smbclient, smbc_setOptionUserData,
      )]
  )
diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
index c80fed1..152507c 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
@@ -1,9 +1,9 @@
 Index: git/configure.in
 ===================================================================
---- git.orig/configure.in	2014-06-18 16:06:16.040721349 +0000
-+++ git/configure.in	2014-07-18 07:49:17.085552256 +0000
+--- git.orig/configure.ac	2014-06-18 16:06:16.040721349 +0000
++++ git/configure.ac	2014-07-18 07:49:17.085552256 +0000
 @@ -1,5 +1,5 @@
- AC_INIT([SMBNetFS],[0.5.3а])
+ AC_INIT([SMBNetFS],[0.6.0])
 -AM_INIT_AUTOMAKE
 +AM_INIT_AUTOMAKE([foreign])
  AC_CONFIG_HEADERS([src/config.h])
diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
index 6995ad3..03e6b2b 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
@@ -14,7 +14,7 @@ inherit autotools gitpkgv pkgconfig
 
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "ace1c519d45fe488b9b7e6cc77a2bcadb6c83464"
+SRCREV = "21c63ed60202e5540613d4c822a57a0b81764499"
 
 SRC_URI = "git://smbnetfs.git.sourceforge.net/gitroot/smbnetfs/smbnetfs;branch=master \
            file://configure.patch \
@@ -24,5 +24,3 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring=yes,--with-gnome-keyring=no,libgnome-keyring"
 
 S = "${WORKDIR}/git"
-
-PNBLACKLIST[smbnetfs] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132827/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.1.4


