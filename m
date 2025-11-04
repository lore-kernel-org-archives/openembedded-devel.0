Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3946BCCFA13
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 23:14:28 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.489.1762298059341153743
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 15:14:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bx3/4hpZ;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-340c39ee02dso3415674a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 15:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762298058; x=1762902858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yt0JdgQd2A9q10fFUBr3iezLVCm/8Uczeq54DIzFZC0=;
        b=Bx3/4hpZdlGP740QtPCvDUMhGTm7g0LptckI48okQOoSFPjssPcFS8c57/w8xLKtML
         WhDVRuvZ4hRAU2Y9K70QEnY4TIWb5QR2ydIPXyS+0CxYgRuIPfFz/cH6135iJmlmIqz4
         aHE8XaJlnNDXkWnOrOvKKbd4mTyjYCDHo+qV3kwSs4nFSyHoMyRbC6LwPI2nm01nkwGt
         bnBBbkxjoUKz+fyP+ET/ycnbrByQrM7xTdUlykG8ZnjlH9tQTXr396xFdDgXSrvQ+6UT
         o+QHM9rhFyALEwOga1dPta0Cd0K8IJUINOlVTKXuDUcff4thFSVXvCI9A0T9z2Kn+bUw
         go+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762298058; x=1762902858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yt0JdgQd2A9q10fFUBr3iezLVCm/8Uczeq54DIzFZC0=;
        b=LyLNEyMi9sfvfEWz4l6vRvC0+hqf5Q1KdcMD4jCzn4v1hFhq4ScD+y6/8RBX+sP+Nt
         fZYCtGcH4vNFv4/vPXb1Np0LbGo9wHKzBvbqb2DmqxBEZGJoBoK6b6dDNRiCeFrB4Cy1
         UO4N29mlPxZu65fQ0j9x5EjgNwJ6cD3r1BqlALoGH/xYePAjdar/GWS8zsr3l03rLiXk
         xqWiIs4MHXjW7FFdl7fl0kaxe3uEUYEeoXdqaNQm6HSWJXIKnc5NYGCwKVLxA7oy9JhY
         C3V5HV2wsflucyhCsYYoN7DSfMsBcOpONO8cMu1sNBY6VrX/ASOavtQLKlDqrAy00vhA
         w52w==
X-Gm-Message-State: AOJu0YysU2AmFNFRAy3ldLKikWPwnyW9CpfCCHBeewkbc46B++Iaaym5
	NIMrxcRejZRRRugq4LfELrc36sSoSFSnfmVb5NE0WtGb+SFSPGrwy4z78C+Ofk+u
X-Gm-Gg: ASbGncuWBEyYd7qqFLs12mpxv6qjmuzxI0oYc+VTLRx57RScJv1cmy6pn+J/Vz7hbyZ
	HNJi1dFeVsk2B0o/RQky7qMKqYgNWxbFbGJM3sPjptun8NX0EP+PyWnyvAdx1pV1jbvaP/pebUb
	deJSTjX463W9g7iZVydst0Oc0/TlAmxLFXwzVaiEU28wN4uSqm+JZeIQGKNbfjoONFuNHEi2LUv
	rcSqF5mR5V6vtDJIbMZu26g0Qoj5isP/vkvxuv8cFS4w4BreWe7hJ7WDzYr0W2pn/2ifvIoh3B1
	CWJdgpz7ZDcOahQo7zoxnsKNTrhj/nCQZK1b7LLajN0IfhlrAInIe51zBuJre7qfqqGtsmZOWkR
	rpe80jubg+0Uflz4EM91PZH/szC4U4x/z9uXRi58U3MLEfC3qQQMYd6qLcckD4eRMi1ZYam4fBF
	4myW6OKOtn6S17xw==
X-Google-Smtp-Source: AGHT+IG24Z7F0e9d4Z++3fmzIJ9LsKSCNnD7uuUPVgn/Y6zJuXRIKbibgQMtV7SRrn+c6nlNqinD5g==
X-Received: by 2002:a17:90b:37c7:b0:340:bc90:d9a4 with SMTP id 98e67ed59e1d1-341a6c00c4amr1209226a91.5.1762298058426;
        Tue, 04 Nov 2025 15:14:18 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f2a80459sm3503470a12.15.2025.11.04.15.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 15:14:18 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/2] libcdio: upgrade 2.1.0 -> 2.2.0
Date: Wed,  5 Nov 2025 12:14:08 +1300
Message-ID: <20251104231409.2056908-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 23:14:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121313

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

* The project switched to storing their releases on Github
* Dropped patches which are now merged in the upstream
* There is API, ABI change between 2.1.0 and 2.1.1
- API change: Rename some fields in ecma_167.h from integer (prefix i_) to unsigned (prefix u_) to actually match their type
- ABI change: Add u_su_fields to the end of iso_rock_statbuf_t
- ABI change: Add total_size in the middle of iso9660_stat_t

Changelog:
https://github.com/libcdio/libcdio/releases/tag/2.1.1
https://github.com/libcdio/libcdio/releases/tag/2.2.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...-format-security-errors-with-mvprint.patch | 40 -----------------
 ...RCE_PATH-by-dropping-STRIP_FROM_PATH.patch | 43 -------------------
 .../{libcdio_2.1.0.bb => libcdio_2.2.0.bb}    |  9 ++--
 3 files changed, 3 insertions(+), 89 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/libcdio/libcdio/0001-Fix-a-few-Werror-format-security-errors-with-mvprint.patch
 delete mode 100644 meta-oe/recipes-multimedia/libcdio/libcdio/Drop-LIBCDIO_SOURCE_PATH-by-dropping-STRIP_FROM_PATH.patch
 rename meta-oe/recipes-multimedia/libcdio/{libcdio_2.1.0.bb => libcdio_2.2.0.bb} (74%)

diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio/0001-Fix-a-few-Werror-format-security-errors-with-mvprint.patch b/meta-oe/recipes-multimedia/libcdio/libcdio/0001-Fix-a-few-Werror-format-security-errors-with-mvprint.patch
deleted file mode 100644
index 09e7dc3dfb..0000000000
--- a/meta-oe/recipes-multimedia/libcdio/libcdio/0001-Fix-a-few-Werror-format-security-errors-with-mvprint.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From e5e54be286bf6d8336b747503c803750bc674c57 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 30 Oct 2021 01:28:18 -0700
-Subject: [PATCH] Fix a few -Werror=format-security errors with mvprintw()
-
-In all these places a non-constant is used as a format string which
-compiler complains about. Fix by using "%s" as format.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/cdda-player.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/cdda-player.c b/src/cdda-player.c
-index 69eddee..8834d60 100644
---- a/src/cdda-player.c
-+++ b/src/cdda-player.c
-@@ -298,7 +298,7 @@ action(const char *psz_action)
-              psz_action);
-   else
-     snprintf(psz_action_line, sizeof(psz_action_line), "%s", "" );
--  mvprintw(LINE_ACTION, 0, psz_action_line);
-+  mvprintw(LINE_ACTION, 0, "%s", psz_action_line);
-   clrtoeol();
-   refresh();
- }
-@@ -1029,10 +1029,10 @@ display_tracks(void)
-       }
-       if (sub.track == i) {
-         attron(A_STANDOUT);
--        mvprintw(i_line++, 0, line);
-+        mvprintw(i_line++, 0, "%s", line);
-         attroff(A_STANDOUT);
-       } else
--        mvprintw(i_line++, 0, line);
-+        mvprintw(i_line++, 0, "%s", line);
-       clrtoeol();
-     }
-   }
diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio/Drop-LIBCDIO_SOURCE_PATH-by-dropping-STRIP_FROM_PATH.patch b/meta-oe/recipes-multimedia/libcdio/libcdio/Drop-LIBCDIO_SOURCE_PATH-by-dropping-STRIP_FROM_PATH.patch
deleted file mode 100644
index 0b25dff75e..0000000000
--- a/meta-oe/recipes-multimedia/libcdio/libcdio/Drop-LIBCDIO_SOURCE_PATH-by-dropping-STRIP_FROM_PATH.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 08c1768aaeea86c522c0ef1705b9b6d434ebd3ae Mon Sep 17 00:00:00 2001
-From: Chris Lamb <chris@chris-lamb.co.uk>
-Date: Fri, 28 Jul 2017 11:49:13 +0100
-Subject: [PATCH] Drop LIBCDIO_SOURCE_PATH by dropping STRIP_FROM_PATH Doxygen
- setup; it's not used as FULL_PATH_NAMES = no
-
-Source: https://sources.debian.org/data/main/libc/libcdio/2.1.0-4/debian/patches/Drop-LIBCDIO_SOURCE_PATH-by-dropping-STRIP_FROM_PATH.patch
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac            | 5 -----
- doc/doxygen/Doxyfile.in | 2 +-
- 2 files changed, 1 insertion(+), 6 deletions(-)
-
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -557,11 +557,6 @@ AC_SUBST(HAVE_SOLARIS_CDROM)
- AC_SUBST(HAVE_WIN32_CDROM)
- AC_SUBST(HAVE_OS2_CDROM)
- 
--LIBCDIO_SOURCE_PATH="`pwd`"
--AC_DEFINE_UNQUOTED(LIBCDIO_SOURCE_PATH, "$LIBCDIO_SOURCE_PATH",
--	[Full path to libcdio top_sourcedir.])
--AC_SUBST(LIBCDIO_SOURCE_PATH)
--
- AC_CHECK_FUNCS( [chdir drand48 fseeko fseeko64 ftruncate geteuid getgid \
- 		 getuid getpwuid gettimeofday lseek64 lstat memcpy memset mkstemp rand \
- 		 seteuid setegid snprintf setenv strndup unsetenv tzset sleep \
-Index: b/doc/doxygen/Doxyfile.in
-===================================================================
---- a/doc/doxygen/Doxyfile.in
-+++ b/doc/doxygen/Doxyfile.in
-@@ -138,7 +138,7 @@ FULL_PATH_NAMES        = NO
- # If left blank the directory from which doxygen is run is used as the
- # path to strip.
- 
--STRIP_FROM_PATH        = @LIBCDIO_SOURCE_PATH@
-+STRIP_FROM_PATH        =
- 
- # The STRIP_FROM_INC_PATH tag can be used to strip a user-defined part of
- # the path mentioned in the documentation of a class, which tells
diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb b/meta-oe/recipes-multimedia/libcdio/libcdio_2.2.0.bb
similarity index 74%
rename from meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb
rename to meta-oe/recipes-multimedia/libcdio/libcdio_2.2.0.bb
index d986f90d72..c443d9b891 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio_2.2.0.bb
@@ -4,14 +4,11 @@ SECTION = "libs"
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2 \
-           file://0001-Fix-a-few-Werror-format-security-errors-with-mvprint.patch \
-           file://Drop-LIBCDIO_SOURCE_PATH-by-dropping-STRIP_FROM_PATH.patch \
-           "
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.bz2"
 
-SRC_URI[sha256sum] = "8550e9589dbd594bfac93b81ecf129b1dc9d0d51e90f9696f1b2f9b2af32712b"
+SRC_URI[sha256sum] = "6f8fbdf4d189cf63f2a7a1549c516cd720c7b222c7aaadbc924a26e745a48539"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig github-releases
 
 PACKAGECONFIG ??= "cdda-player"
 PACKAGECONFIG[cdda-player] = "--with-cdda-player,--without-cdda-player,ncurses"

