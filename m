Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 714487FEB8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 03:23:28 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id az3so1947491plb.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jan 2020 19:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Xog0mpx1C6YVvOMnKzvcGygCr9HoxqkpFlrr3jJ684E=;
	b=gf/XIohyvLtzsY/LKlVf2XhTwBxxy1uYN9ZEp710+TNl62x01071FSCEOjBULhtavM
	goa1ctiBWRUgPQKN6ypFBH8XYoWgIonNH4dEtUFOb8Alwj01J9VZS11Ev3s6OCGEpW8S
	orwU8iCvP+Qx3cc3m7OPF1pGsm+O56N5zuhp1Tw9alblJhnTGb7zz+3ra4t1SV0/mkDq
	5XeS4eWegmFHNOqqIjKSqkr8hTX7shMwrc5dq8B9F2GHLgzuCJxWHjjgsJtbASG4/Hth
	H95xX7rqnDQvanbUWmF+kOzjAfAs3fr9YMMpmBsYLrfFhpyZHEeTUasnrQk/5WH53LIH
	98rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Xog0mpx1C6YVvOMnKzvcGygCr9HoxqkpFlrr3jJ684E=;
	b=Bwm9eIfNz3Qiwlu28CTFjQzgW/zYYA7jXx9Bgpq+ZyuvOdJOPJcz5EPFDD4N12sKmA
	ItcKM1R2uZVpxGTUj14kfYnjz22hbGNqUqCIVZtgIwF2DAlAJugSAKIHQ6RTKAAiZvow
	6VI8V2XQhnpnXDCubQOZ0ewRq9+6rzN9/5Gq+0/fNfVkiztjFD0rJOOhgD1AswMMGmZW
	l2NNIlN1CR028lNjJGkLMXIj4Mv51NaJk0lhBSs9yfQDoK2OldpMd3EnGiA0OJvoUSwW
	rHyJjlcJDTDuUfCltXyePDYotXL5MZCMMfN27CCsqc1IWMz9mh9CNU52kgW4z1cLDEDd
	FFTA==
X-Gm-Message-State: APjAAAW9LYpm60omwYoOF3X8yKZxilBJxiRcG2yH4rS329Gp/sKpp5Tz
	2ib5xc6GhzkUsCklyWD42iNiax0wOwo=
X-Google-Smtp-Source: APXvYqzybbESLOehGZ0/HiVExjoT08HiCTN5BMN3oocz5zYTQ5/J9m71e8FokAR+dzRGFeUZkQtJUQ==
X-Received: by 2002:a17:902:6802:: with SMTP id
	h2mr9212255plk.233.1578540209093; 
	Wed, 08 Jan 2020 19:23:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::9bd6])
	by smtp.gmail.com with ESMTPSA id
	r30sm5657182pfl.162.2020.01.08.19.23.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 19:23:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jan 2020 19:23:18 -0800
Message-Id: <20200109032319.3645429-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109032319.3645429-1-raj.khem@gmail.com>
References: <20200109032319.3645429-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-filesystems][PATCH 4/5] smbnetfs: Update to latest 0.6.2 rev
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
X-List-Received-Date: Thu, 09 Jan 2020 03:23:28 -0000
Content-Transfer-Encoding: 8bit

Brings in fixes to build with latest xattr
Forward port configure.ac patch
Drop using gitpkgv

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../smbnetfs/smbnetfs/configure.patch                    | 8 +++-----
 .../recipes-filesystems/smbnetfs/smbnetfs_git.bb         | 9 ++++-----
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
index 55275669b1..f22b389b1c 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
@@ -1,9 +1,7 @@
-Index: git/configure.in
-===================================================================
---- git.orig/configure.ac	2014-06-18 16:06:16.040721349 +0000
-+++ git/configure.ac	2014-07-18 07:49:17.085552256 +0000
+--- a/configure.ac
++++ b/configure.ac
 @@ -1,5 +1,5 @@
- AC_INIT([SMBNetFS],[0.6.1])
+ AC_INIT([SMBNetFS],[0.6.2])
 -AM_INIT_AUTOMAKE
 +AM_INIT_AUTOMAKE([foreign])
  AC_CONFIG_HEADERS([src/config.h])
diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
index ddb2cc805f..d94603b404 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
@@ -11,15 +11,14 @@ HOMEPAGE ="http://sourceforge.net/projects/smbnetfs"
 DEPENDS = "fuse samba"
 DEPENDS_append_libc-musl = " libexecinfo"
 
+inherit autotools pkgconfig features_check
+
 # samba depends on libpam
-inherit features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
-inherit autotools gitpkgv pkgconfig
-
-PKGV = "${GITPKGVTAG}"
+PV = "0.6.1+git${SRCPV}"
 
-SRCREV = "bc6b94b015fdaf7c4dab56ccb996eecea8bc4373"
+SRCREV = "a117eec8de7ed7249871da73dcc350283ce72069"
 
 SRC_URI = "git://smbnetfs.git.sourceforge.net/gitroot/smbnetfs/smbnetfs;branch=master \
            file://configure.patch \
-- 
2.24.1


