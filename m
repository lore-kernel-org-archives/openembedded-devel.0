Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533E1F36C2E
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 06:28:05 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13767.1776666479082271252
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Apr 2026 23:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AohQ49qR;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so34263205e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Apr 2026 23:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776666477; x=1777271277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q36sJyRUFm3zAz/bRjdOc+bvd5Yl3OV5aZxJCB6nbmg=;
        b=AohQ49qRkBdr57S+3Nun9TtyP1D+UOBIvdW35b+xikRi48dhq/97NkiFpU+Sphypx7
         VotBYLu4YF9l68cDQ949S+bGunYOnQpnRRXXTkDWDsv9GSK+AWE6TZzyagkn/+FqbNaK
         eN38w0BreOtPdZCjIiVPXOjiY9hDMJB1EuL+7iJq+GT6xnVu9p/nPJomy/Qpf5eRWcNx
         NzFuP2VDrWTFQDSfPcyyk/ezMg0XmepO0K3w9dV53sLP2fejASAnnro7BlUAlX79/8kK
         n/+GGERMPdYN31EAbyNxGmhyTcaEACqy3QZOgYTXoQW3D4scf3rCOoQ3+ToBb376zAUS
         rOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776666477; x=1777271277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q36sJyRUFm3zAz/bRjdOc+bvd5Yl3OV5aZxJCB6nbmg=;
        b=kszbp3il4hi1IVHijhfMfeKBCj21rp2rokFAJs193ZE0JV5fn01K2YU9TTIpKridaU
         8FkOy0E3cZZykdZsfDknv6LI6yvO7qE9lm5n3lnfNwVOyjM0poOehnPQ2egO6P/45Yn1
         uM/n/UGiuXQxtSoBNthdECRW5oybhLIrCOTc+Te0/NsZDbiOT8RWABlzrjdIT/dt7VEd
         2uDtJgxdyt817KUYxpKS5rYkKyRepjEGjWSj7D/DX52JMuqnyK1G5z/AOzSZgbkXkkTe
         FWJkPKxyCV+2ebvim+1PbCmjK2FdF/TyzT2IkmTQSlvr2/u/hGVqLWbP3SpKN/EAXNm8
         RNDw==
X-Gm-Message-State: AOJu0Yy83U6CDKp3DBomImfEZyBAfs6vJAtPNI/SPTh5vrij//dKgMw2
	YBhV2eVQgUCTPXQwUOx8WBph5zozlMtAl/Ly3UDVDX5H7khViHuCZt3wTx2S2w==
X-Gm-Gg: AeBDievfZn0pjy8ob89XuVIqJZUWVA2gc7VkrM+dv5z1zKjFwDS3HsndyqiIZNcGCNm
	7EE5tZ11T/pTakfO+AIZNi3JmvUpAQe7u5+0iwxDhk7NbFTuzez/MSRmTAyri3bSKAD2M/FGFfV
	u5LdpHvc4jDyLKi8Xq/ANGgiXZMHR+xyk4ifKNqWt/CtZqSXm+KSeaxcpp1vcSsGxH6XOgxF9pn
	xvRo7CAHyQCN4rahkGkcNlcI3EaCDgbR0Wx/B7xClHHxt/3cJx/Iz1b5PlkwqpSTy5mK1sa/d7k
	WKpAryY5U+1KGUKStLU2I5JnaDbfuekAchxy/LDukUXMAIEJ/rqWfAVM3Fu8t6eLWsFjPQK56oG
	O9mqfA3vj5Od8KD9dhZSn5u5gpybbv4CNL5bXuqgaYWFfGIPgqkqshRFyGohlVTnHxbDuvwRUVW
	sVvj44WJy2iX0rWNVC0RJpTs48wmfu6+c=
X-Received: by 2002:a05:600c:8483:b0:488:7ff6:1f75 with SMTP id 5b1f17b1804b1-488fb782d91mr171288265e9.21.1776666477248;
        Sun, 19 Apr 2026 23:27:57 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc17f642sm238296665e9.5.2026.04.19.23.27.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:27:56 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 08/17] gphoto2: upgrade 2.5.28 -> 2.5.32
Date: Mon, 20 Apr 2026 08:27:40 +0200
Message-ID: <20260420062750.3795917-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420062750.3795917-1-skandigraun@gmail.com>
References: <20260420062750.3795917-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 06:28:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126472

Drop patches that were merged in this release.

Changelog:
- --get-exif , --get-all-exif added
- --reverse modifier option added for fileoperations commands
- kill -USR2 can now stop --capture-movie
- updated translations

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ototypes-of-callbacks-with-libgphoto.patch | 50 -------------------
 ...figure-Filter-out-buildpaths-from-CC.patch |  8 +--
 ...01-configure.ac-remove-AM_PO_SUBDIRS.patch |  8 +--
 ...thread_t-abstract-type-for-thead-IDs.patch | 39 ---------------
 .../{gphoto2_2.5.28.bb => gphoto2_2.5.32.bb}  |  4 +-
 5 files changed, 9 insertions(+), 100 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/gphoto2/gphoto2/0001-Match-prototypes-of-callbacks-with-libgphoto.patch
 delete mode 100644 meta-oe/recipes-graphics/gphoto2/gphoto2/0001-gphoto2-Use-pthread_t-abstract-type-for-thead-IDs.patch
 rename meta-oe/recipes-graphics/gphoto2/{gphoto2_2.5.28.bb => gphoto2_2.5.32.bb} (70%)

diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-Match-prototypes-of-callbacks-with-libgphoto.patch b/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-Match-prototypes-of-callbacks-with-libgphoto.patch
deleted file mode 100644
index e0c3de469a..0000000000
--- a/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-Match-prototypes-of-callbacks-with-libgphoto.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 366930ccc1a261c3eb883da2bf3c655162ccd75f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 1 Mar 2023 22:58:37 -0800
-Subject: [PATCH] Match prototypes of callbacks with libgphoto
-
-In https://github.com/gphoto/gphoto2/pull/535/commits/ccc4c1f092bd21ebc713f4d7b9be85be49f92f1e
-we tried to fix by using pthread_t but it also needs to make changes in
-libgphoto and these changes can be invasive, therefore lets revert to
-older types and to fix musl problem fix it via type casts
-
-Upstream-Status: Backport [https://github.com/gphoto/gphoto2/pull/569]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gphoto2/main.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/gphoto2/main.c b/gphoto2/main.c
-index 0dac947..cd3c990 100644
---- a/gphoto2/main.c
-+++ b/gphoto2/main.c
-@@ -1198,7 +1198,7 @@ thread_func (void *data)
- 	pthread_cleanup_pop (1);
- }
- 
--static pthread_t
-+static unsigned int
- start_timeout_func (Camera *camera, unsigned int timeout,
- 		    CameraTimeoutFunc func, void __unused__ *data)
- {
-@@ -1215,14 +1215,14 @@ start_timeout_func (Camera *camera, unsigned int timeout,
- 
- 	pthread_create (&tid, NULL, thread_func, td);
- 
--	return (tid);
-+	return (unsigned int)tid;
- }
- 
- static void
--stop_timeout_func (Camera __unused__ *camera, pthread_t id,
-+stop_timeout_func (Camera __unused__ *camera, unsigned int id,
- 		   void __unused__ *data)
- {
--	pthread_t tid = id;
-+	pthread_t tid = (pthread_t)id;
- 
- 	pthread_cancel (tid);
- 	pthread_join (tid, NULL);
--- 
-2.39.2
-
diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-configure-Filter-out-buildpaths-from-CC.patch b/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-configure-Filter-out-buildpaths-from-CC.patch
index 3d54d58e18..bd916e339a 100644
--- a/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-configure-Filter-out-buildpaths-from-CC.patch
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-configure-Filter-out-buildpaths-from-CC.patch
@@ -14,13 +14,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/configure.ac
 +++ b/configure.ac
 @@ -26,7 +26,9 @@ AC_PROG_INSTALL
- AC_SYS_LARGEFILE
+ ])
  
- GP_CONFIG_MSG([Compiler],[${CC}])
--AC_DEFINE_UNQUOTED([HAVE_CC],"$CC",[The C compiler we're using])
+ GP_CONFIG_MSG([Compiler], [${CC}])
+-AC_DEFINE_UNQUOTED([HAVE_CC], ["$CC"], [The C compiler we are using])
 +CC_NO_SYSROOT=`echo $CC | sed -e \
 +	's|--sysroot=.*\b||g'`
-+AC_DEFINE_UNQUOTED([HAVE_CC], ["$CC_NO_SYSROOT"], [The C compiler we're using])
++AC_DEFINE_UNQUOTED([HAVE_CC], ["$CC_NO_SYSROOT"], [The C compiler we are using])
  
  dnl AC_STRUCT_TIMEZONE
  
diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-configure.ac-remove-AM_PO_SUBDIRS.patch b/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-configure.ac-remove-AM_PO_SUBDIRS.patch
index 14976ffb72..358dbbb51a 100644
--- a/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-configure.ac-remove-AM_PO_SUBDIRS.patch
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-configure.ac-remove-AM_PO_SUBDIRS.patch
@@ -14,10 +14,10 @@ Upstream-Status: Pending
 --- a/configure.ac
 +++ b/configure.ac
 @@ -46,7 +46,6 @@ dnl i18n support
- dnl ---------------------------------------------------------------------------
- GP_GETTEXT_HACK([],[Lutz Müller and others],[${MAIL_GPHOTO_TRANSLATION}])
- ALL_LINGUAS="az cs da de en_GB es eu fi fr hu id is it ja nl pa pl pt_BR ro ru rw sk sr sv uk vi zh_CN zh_TW"
+ GP_GETTEXT_SETUP([GETTEXT_PACKAGE_GPHOTO2],
+                  [gphoto2],
+                  [po])
 -AM_PO_SUBDIRS()
- AM_GNU_GETTEXT_VERSION([0.14.1])
+ AM_GNU_GETTEXT_VERSION([0.19.1])
  AM_GNU_GETTEXT([external])
  AM_ICONV()
diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-gphoto2-Use-pthread_t-abstract-type-for-thead-IDs.patch b/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-gphoto2-Use-pthread_t-abstract-type-for-thead-IDs.patch
deleted file mode 100644
index a27c02cefc..0000000000
--- a/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-gphoto2-Use-pthread_t-abstract-type-for-thead-IDs.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 23c67e93e51f700d0aeecfc08277e39f51201fc3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 2 Sep 2022 12:59:46 -0700
-Subject: [PATCH] gphoto2: Use pthread_t abstract type for thead IDs
-
-This is not a plain old datatype in every libc, e.g. with musl this
-would fail in type conversion
-
-Upstream-Status: Submitted [https://github.com/gphoto/gphoto2/pull/535]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gphoto2/main.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gphoto2/main.c b/gphoto2/main.c
-index 2bf5964..9a6b05d 100644
---- a/gphoto2/main.c
-+++ b/gphoto2/main.c
-@@ -1198,7 +1198,7 @@ thread_func (void *data)
- 	pthread_cleanup_pop (1);
- }
- 
--static unsigned int
-+static pthread_t
- start_timeout_func (Camera *camera, unsigned int timeout,
- 		    CameraTimeoutFunc func, void __unused__ *data)
- {
-@@ -1219,7 +1219,7 @@ start_timeout_func (Camera *camera, unsigned int timeout,
- }
- 
- static void
--stop_timeout_func (Camera __unused__ *camera, unsigned int id,
-+stop_timeout_func (Camera __unused__ *camera, pthread_t id,
- 		   void __unused__ *data)
- {
- 	pthread_t tid = id;
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.32.bb
similarity index 70%
rename from meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
rename to meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.32.bb
index 40409ed388..e5e7c6926f 100644
--- a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.32.bb
@@ -8,11 +8,9 @@ RDEPENDS:gphoto2 = "libgphoto2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.bz2;name=gphoto2 \
            file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
-           file://0001-gphoto2-Use-pthread_t-abstract-type-for-thead-IDs.patch \
-           file://0001-Match-prototypes-of-callbacks-with-libgphoto.patch \
            file://0001-configure-Filter-out-buildpaths-from-CC.patch \
 "
-SRC_URI[gphoto2.sha256sum] = "2a648dcdf12da19e208255df4ebed3e7d2a02f905be4165f2443c984cf887375"
+SRC_URI[gphoto2.sha256sum] = "4e379a0f12f72b49ee5ee2283ffd806b5d12d099939d75197a3f4bbc7f27a1a1"
 
 inherit autotools pkgconfig gettext
 

