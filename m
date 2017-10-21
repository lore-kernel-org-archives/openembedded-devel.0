Return-Path: <athoik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id CDA35719E7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Oct 2017 22:16:57 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q132so3596570wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Oct 2017 15:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=opTBoMncK9DwSvOHks/KcKHxy7kHBIhMzwhpJh4g6PU=;
	b=XgDot2JMjI1B+8FRgn5J1rBQUiVx/CHyNyfeC3mmAcuu988jDfbTSRmzTArGT4oPkf
	eisIccO1bVU4wA3G+4ErYQ9UKQe85JzDOPLKA5XYjEv45sJMb+y6pwn790E5tYsA+up6
	rP1lv6p2Ckt5dzXWhvRAYSLPQbDwD0vLNa5uZs14VMuDQ77j18nTkm17YA8HCs6s7kLC
	Y2GI+KJoca1uXWC0T68ywtQhCk/5K8iO33o4jW/ewfcxFqSbh7xyZPeWsdwPffT23EI2
	S3qMu8L9DxB14yxbCCrAOETFp4nPLtLdc+joyp1Ye9+b9/z+mSRwpQXN2dpaEKpC8Hc9
	f0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=opTBoMncK9DwSvOHks/KcKHxy7kHBIhMzwhpJh4g6PU=;
	b=VGpmEyGWF+ZfTRJOyomlHX8qAm6nQrRo/e3+lmNoWeWwxmH98terirv2qDnf3NMqyC
	pCVrOB8Eeq28/rW7iw2p5ELqv8xMJ2PoAAXKmusK0QnsTxNXyiXIjYGdOwPLx1bVKFGT
	k0PKr3OypzR/koNf0My9W1OIwd5PSKdAn9YcmuBkdi7XeQfa7ZWQHV7ZZzeJIiN1cVe7
	Xvc60G/hyt2RJF8mo8+L238tFIAnP1jCvWNNlnplgBWS/V+PdX6J33eTFd7PQoZ7sw51
	se+5rEBjLMwjYeIcFDGUQMhPCUV6U+Zjur21qjenzT/ejlDW41wrqE2aftcw/F0TglbB
	v9mg==
X-Gm-Message-State: AMCzsaVSfKkj4zK6gLsfP8b0hJRIjhUiDqTG7ZnjDP7pFTxo7WYiaidS
	pfKpLFbKEWWgW7ldSf6fjH1i
X-Google-Smtp-Source: ABhQp+T8Qa6r54FYDQqrXX+SZDYZVChBsRIHjzhjhtqwumVQzVilMtjrfYh87kH4nlqfAx7BRgXu9g==
X-Received: by 10.28.29.130 with SMTP id d124mr2275408wmd.73.1508624218354;
	Sat, 21 Oct 2017 15:16:58 -0700 (PDT)
Received: from images.net (ns380618.ip-188-165-252.eu. [188.165.252.42])
	by smtp.gmail.com with ESMTPSA id
	e77sm3764305wmi.16.2017.10.21.15.16.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 Oct 2017 15:16:57 -0700 (PDT)
From: Athanasios Oikonomou <athoik@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Oct 2017 01:16:32 +0300
Message-Id: <1508624192-6257-2-git-send-email-athoik@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1508624192-6257-1-git-send-email-athoik@gmail.com>
References: <1508624192-6257-1-git-send-email-athoik@gmail.com>
MIME-Version: 1.0
Cc: Athanasios Oikonomou <athoik@gmail.com>
Subject: [meta-oe][PATCH v2 2/2] smbnetfs: update update 0.5.3a -> 0.6.0
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
X-List-Received-Date: Sat, 21 Oct 2017 22:16:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It seems that updating smbnetfs to latest revision fixes build issues.
Also remove the blacklist allowing the plugin to build again.
Patches reworked to apply on 0.6.0.

Additionally handle missing libexecinfo (DEPENDS and LDFLAGS)
when building with musl else we are getting the following error:
| ../../git/src/common.c:7:10: fatal error: execinfo.h: No such file or directory
|  #include <execinfo.h>

Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
---
 .../Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch    | 6 +++---
 .../recipes-filesystems/smbnetfs/smbnetfs/configure.patch           | 6 +++---
 meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb       | 5 +++--
 3 files changed, 9 insertions(+), 8 deletions(-)

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
index 6995ad3..0fcfd6a 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
@@ -9,12 +9,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 HOMEPAGE ="http://sourceforge.net/projects/smbnetfs"
 
 DEPENDS = "fuse samba"
+DEPENDS_append_libc-musl = " libexecinfo"
 
 inherit autotools gitpkgv pkgconfig
 
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "ace1c519d45fe488b9b7e6cc77a2bcadb6c83464"
+SRCREV = "21c63ed60202e5540613d4c822a57a0b81764499"
 
 SRC_URI = "git://smbnetfs.git.sourceforge.net/gitroot/smbnetfs/smbnetfs;branch=master \
            file://configure.patch \
@@ -25,4 +26,4 @@ PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring=yes,--with-gnome-keyring=no
 
 S = "${WORKDIR}/git"
 
-PNBLACKLIST[smbnetfs] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132827/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
+LDFLAGS_append_libc-musl = " -lexecinfo"
-- 
2.1.4


