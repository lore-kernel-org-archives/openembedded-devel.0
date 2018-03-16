Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id B31286FF0E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2018 20:12:31 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id l8so12778767wrg.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2018 13:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=e36aY+ebPaKzOxNI29VR1+px7ukPzB44byW2b/YY34Y=;
	b=lrLlqA1tdOD0u7gfXQEn5IddlzvBz5tXvHnIQ8eIv/bP0kyB9vLs82V+xOFuc4bok+
	j1lR7PA+omiAZvWac7z6bmmdzl8FTZrEXKLephIZb66exS1GpCI/zsEji9djWXfYn50U
	uCrzUqYjwcF8ydZNxrivFeiGvnvW9yBZc9WIcZgWgd6F80wthUEt6CHu9xXukTLZ+SFY
	oyEGwRixOHWhPoLEtpTo5ZDRtmFXbVqp8MncNUKmk8PuhJdgZj+E2GzjnNP/sbMwz5LH
	GON1v+RyHizO6Z2J4fSFNvpSiGV1GZ9eEYRcSLpk+NMo4lprzmyXFmol/Du4U6FhUmgx
	Om2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=e36aY+ebPaKzOxNI29VR1+px7ukPzB44byW2b/YY34Y=;
	b=rZTvoHdASe9raQ6LrmNQ+3ewlvsf4pQULqvh+sERq8bbCM4ZyPaAMmX0CHwosCqDEw
	aOT+5fvZpjloqHonwAM91v3q5R0j2aK0EPQozIPjhk1FwYUqfFcw69faGAPocC5X+2K7
	zWxWpPjtuiUzM2MCLtkIJK89hrkopEUc73vCAAy1QAGFbzoAbkyR5CQOOr/8VZMa3Ahn
	LnHwFopkzIrbj2oJAqZX243MdNMVf9HHhUTO4ukvwFNS2G5GSMZdJ0ZzQuaedC03wDv5
	D2nD6CzCvqifYSblLjfYNXQjvJ/EiS7dBG39G2wSEkolt6va+gU6ogittxM9Winw2+uN
	yFpg==
X-Gm-Message-State: AElRT7Gq/t6YImIUvNkoMLHjnxcM1td9ZUC5ZI+LbTDDyvz17sN8IBKS
	eyHnmRXjuAwUEilFeLU/HJJrnA==
X-Google-Smtp-Source: AG47ELs1gwT3eFMhd0v1qeYIZWTL+wEOB/wt2LcIADQzSMy4vzb9YsIsswvTlOT6BNGLUuPf+gi0Bg==
X-Received: by 10.223.226.14 with SMTP id j14mr2628618wri.17.1521231152372;
	Fri, 16 Mar 2018 13:12:32 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	f206sm7769193wmf.26.2018.03.16.13.12.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Mar 2018 13:12:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Mar 2018 20:12:32 +0000
Message-Id: <20180316201233.4746-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-oe][PATCH 1/2] glibmm: refresh the patch
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
X-List-Received-Date: Fri, 16 Mar 2018 20:12:32 -0000

WARNING: glibmm-2.54.1-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch remove-examples.patch
patching file Makefile.am
patching file configure.ac
Hunk #1 succeeded at 166 with fuzz 1 (offset 30 lines).

Now at patch remove-examples.patch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../glib-2.0/glibmm/remove-examples.patch          | 29 ++++++++++++++--------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm/remove-examples.patch b/meta-oe/recipes-core/glib-2.0/glibmm/remove-examples.patch
index a5944c2889..d32fe78d32 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm/remove-examples.patch
+++ b/meta-oe/recipes-core/glib-2.0/glibmm/remove-examples.patch
@@ -1,7 +1,16 @@
-Index: glibmm-2.22.1/Makefile.am
-===================================================================
---- glibmm-2.22.1.orig/Makefile.am
-+++ glibmm-2.22.1/Makefile.am
+From f48a69fd11b2eda6c43ff046c202cbc4dcd4e92d Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 12 Jul 2011 11:46:37 +0200
+
+---
+ Makefile.am  | 7 +------
+ configure.ac | 1 -
+ 2 files changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index a0df8af..c3d5e06 100644
+--- a/Makefile.am
++++ b/Makefile.am
 @@ -23,12 +23,7 @@ src_subdirs = glib/src gio/src
  else
  src_subdirs =
@@ -16,15 +25,15 @@ Index: glibmm-2.22.1/Makefile.am
  
  glibmm_includedir = $(includedir)/$(GLIBMM_MODULE_NAME)
  glibmm_include_HEADERS = glib/glibmm.h
-Index: glibmm-2.22.1/configure.ac
-===================================================================
---- glibmm-2.22.1.orig/configure.ac
-+++ glibmm-2.22.1/configure.ac
-@@ -136,7 +136,6 @@ AC_CONFIG_FILES([Makefile
+diff --git a/configure.ac b/configure.ac
+index c20e778..74203be 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -166,7 +166,6 @@ AC_CONFIG_FILES([Makefile
                   gio/src/Makefile
                   gio/giomm/Makefile
                   tests/Makefile
 -                 examples/Makefile
                   docs/Makefile
                   docs/reference/Doxyfile
-                  MSVC_Net2005/glibmm/glibmm.rc
+                  MSVC_Net2013/glibmm/glibmm.rc
-- 
2.15.1


