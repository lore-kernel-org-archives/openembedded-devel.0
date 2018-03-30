Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7B907746FD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:13 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id o8so8086693wra.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Ziv5J5oPiOKJtn80xfHrIigjZyKH+A6zKYbiEzc2zQk=;
	b=u/OYQPiUTPtYSWx7YrWL4kD0+ixx7gJWy288ZzX5xSwelcSYENMDv1+bZqNktI2fQj
	lhlc7+b08h6QM6krvQBGdCghpZsIMJcZDf8yslcF6Kkds2uEXWEZT+zwpfdYW9L0Ffuo
	Qr+uGD1bfPltx3xc4ljcwfB2hKCEsIBSiq1dKnnL49WsL2AWp9CmaA9IujLynchPS2Yx
	CNkveZEq+yroNtjzei1ZFKaFkDFw5wLcjXmOr8Z/nFdvYtIbNlRRZ0vGGKE/+YhhDpm/
	jN8RIIkXx/jIykUL3PQcS5qlLu9NkGZsbbImJ0fYozuk7jz8Pea+aEz+KCtFSD1mCbGm
	5Ruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ziv5J5oPiOKJtn80xfHrIigjZyKH+A6zKYbiEzc2zQk=;
	b=B/bEJDFzqfGUNcn2qzo98q6sJaYd71am+lcrrRYaBkBv5Lvwcjr32DfIVDVY5SkRJ8
	EhrxNcSyGwh7wlW3NRdTQ74pmgAtyYe7iG23BIkvtczvYbPmi1uJAFlINPXt4HWflZ1J
	B7wSBgPH6n+2y2Rf0QfYJ2LF9Za1nlYV9sxqLgHCPIpESrTqrAtwq91FxW9c/K5UlNHU
	1QMzqpeAnYYWcN87p5HgAzhqCpnRWUSFrQHgxC4fqbjNKZuQnMKP757P8+4O9aP+zB1r
	Oik8Q6ArLZ6l2g15hznmt5ILeUQCIbM5edxkG1kuhHR9toIVbm6dxICyb6RrgffyBPs1
	mkOQ==
X-Gm-Message-State: AElRT7E69nnbAPd3gzqO64czYTR6Q1SrUUJcMmDrf83+gTpkgV15EiFv
	0GzvbveTe8Nl/FtJubUHSZUfyg==
X-Google-Smtp-Source: AIpwx49OZuCeUilxSZ60ftdqE3bJIkIc7Mc4iOiM99aNFiTgBjUNh1lPlM838t3Aadf3x4R4WU4E/w==
X-Received: by 10.223.182.13 with SMTP id f13mr9323843wre.262.1522416734112;
	Fri, 30 Mar 2018 06:32:14 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:21 +0200
Message-Id: <20180330133151.25882-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/39] exo: refresh patches
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/exo/exo/configure.patch      | 20 +++++++++++++++++---
 .../recipes-xfce/exo/exo/exo-no-tests-0.8.patch     | 21 ++++++++++-----------
 .../exo/exo/reduce-build-to-exo-csource-only.patch  |  3 ++-
 3 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/meta-xfce/recipes-xfce/exo/exo/configure.patch b/meta-xfce/recipes-xfce/exo/exo/configure.patch
index ef27e423b..89cc1f387 100644
--- a/meta-xfce/recipes-xfce/exo/exo/configure.patch
+++ b/meta-xfce/recipes-xfce/exo/exo/configure.patch
@@ -1,6 +1,20 @@
---- a/configure.ac	2007-12-02 10:37:06.000000000 -0200
-+++ b/configure.ac	2008-06-05 17:21:42.000000000 -0300
-@@ -127,22 +127,24 @@
+From 13a74582ffd7f81dbd66a7296fc76007718e9d4d Mon Sep 17 00:00:00 2001
+From: Andreas Mueller <schnitzeltony@gmx.de>
+Date: Mon, 1 Aug 2011 17:16:29 +0200
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+
+---
+ configure.ac | 34 ++++++++++++++++++----------------
+ 1 file changed, 18 insertions(+), 16 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0de5ceb..3f92d1b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -143,22 +143,24 @@ AC_FUNC_MMAP()
  dnl ***************************************
  dnl *** Check for strftime() extensions ***
  dnl ***************************************
diff --git a/meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.8.patch b/meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.8.patch
index ac8bca5f3..348e147cf 100644
--- a/meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.8.patch
+++ b/meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.8.patch
@@ -1,22 +1,24 @@
-From 5f1e19860d89647488bdd32a02fb332f69434405 Mon Sep 17 00:00:00 2001
+From 9231a2d5b9c5406f33aef3ab4de2dbec9b08ed13 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 18 May 2012 21:13:00 +0200
 Subject: [PATCH] Do not run tests at build time
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
-Upstream-Status: Not-Applicable
+
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+
 ---
- Makefile.am |    3 +--
- 1 files changed, 1 insertions(+), 2 deletions(-)
+ Makefile.am | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 0ab3853..3e72391 100644
+index 226e79d..62ad18d 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -8,8 +8,7 @@ SUBDIRS =								\
+@@ -9,8 +9,7 @@ SUBDIRS =								\
  	docs								\
  	icons								\
  	pixmaps								\
@@ -24,8 +26,5 @@ index 0ab3853..3e72391 100644
 -	tests
 +	po
  
- AUTOMAKE_OPTIONS =							\
- 	1.9								\
--- 
-1.7.4.4
-
+ distclean-local:
+ 	rm -rf *.cache *~
diff --git a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch b/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
index f5c5e8dac..076477581 100644
--- a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
+++ b/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
@@ -10,9 +10,10 @@ exo-csource creates c-header files from glade resource output files. When
 building xfce-packages from git instead of tarball this exo-csource-native is
 required.
 
-Upstream-Status: Inappropriate [configuration]
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+
 ---
  Makefile.am  | 10 +---------
  configure.ac | 22 ----------------------
-- 
2.14.3


