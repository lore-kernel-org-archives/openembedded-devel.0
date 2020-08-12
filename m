Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.293.1597264899157683012
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 13:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AaYYU0hL;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id e4so1713788pjd.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 13:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3GytwY4f7Dus8/6QMwObJm10uv42dnWKDoTbOHspPJQ=;
        b=AaYYU0hLwihipMTtWuvLTXS7a5uqYhGpLK4CC4DzS0Ro4bbfVJ2Ig4OuCAUl0qaHtW
         Z/iqcbM2+PFK1/OlGPXFFOZV5/4cYk6mHi2zw8OHks48AN7ahWn77oA82ZplLKizclLI
         /lc5l5/SIMw+rHP5XKTqIBC8gYm3EikYFkEmhNYZnY8jdPDf+71gVpTMYU0edfCuy3c9
         Pb0JkcI/V22WDl6GVSgG7U+jobpwsRyCxmlBE790Qp6bTKWB7STtjA7nJwXhT/MaLhPJ
         X/UptdwF2PU5PantO2bmRc1e4o0FBv7b2sNs249VirCQ1Hcwe5vVYWG9t/37hzsZFwFi
         bNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3GytwY4f7Dus8/6QMwObJm10uv42dnWKDoTbOHspPJQ=;
        b=O9yXMdgEbj1CB5kV3vSeyOWJn6nyA+LV1np6flOfKSzrWywIYEmSxxevbuYNaWQWUg
         D8XENFwWCiMjglJZ5qb3hOyWxZuHMzXH0Jiy4VKdyfAGGfiz9bbeKUUZwVHVa4MVrCIh
         8u1JEep7TYwwccrV57Y/Uenu6PGyIT/0pEdR488q/NtVXU1n9mfg/Q+3Y8akJE3yhwbS
         9ueNdYQunazR/wcCfnrKLsQ8+8YEwZKpNiGO3K3RYoRW6pcj9ba/Hs1oTQk28Pg2v5gT
         lfUwHtHL4zfBhCDSW8/uZSUYlUSZjyd9S33U0aPpH3d5Jy6oKTywlrKuKpK6gjInRdBW
         urow==
X-Gm-Message-State: AOAM532Bh54Hsfq3hCFeHTvIl4hrPPUy4sfws9MjwsJAej8gboV2ktzi
	e5zPAUNAA3D0f508N+epERLgzwgm9mM=
X-Google-Smtp-Source: ABdhPJyoG46zps2X8EprPfcFvzVGNpq9RWpS/u/k7DARRoSlIV+gbUd+aIcxLiJTK/EfzfebxZJF2Q==
X-Received: by 2002:a17:90a:4709:: with SMTP id h9mr1739904pjg.235.1597264895406;
        Wed, 12 Aug 2020 13:41:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id l22sm2984287pjy.31.2020.08.12.13.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 13:41:34 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][ 04/18] vblade: Upgrade to version 24
Date: Wed, 12 Aug 2020 13:41:16 -0700
Message-Id: <20200812204130.1012160-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812204130.1012160-1-raj.khem@gmail.com>
References: <20200812204130.1012160-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Switch to github for src_uri
Add a patch to fix build with -fno-common

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-daemons/vblade/files/gcc-10.patch | 85 +++++++++++++++++++
 .../vblade/{vblade_22.bb => vblade_24.bb}     |  9 +-
 2 files changed, 90 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/vblade/files/gcc-10.patch
 rename meta-networking/recipes-daemons/vblade/{vblade_22.bb => vblade_24.bb} (86%)

diff --git a/meta-networking/recipes-daemons/vblade/files/gcc-10.patch b/meta-networking/recipes-daemons/vblade/files/gcc-10.patch
new file mode 100644
index 0000000000..9a42aa3699
--- /dev/null
+++ b/meta-networking/recipes-daemons/vblade/files/gcc-10.patch
@@ -0,0 +1,85 @@
+From af17efc862b9acfd63ce2ecb21f75ed890a93a5d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20K=C3=B6lbl?= <koelblandreas@freenet.de>
+Date: Thu, 9 Jul 2020 14:29:18 +0200
+Subject: [PATCH] Fix linkage of global identifiers
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Align the code to the standard and modern compilers.
+
+Upstream-Status: Submitted [https://github.com/OpenAoE/vblade/pull/15]
+Signed-off-by: Andreas Kölbl <koelblandreas@freenet.de>
+---
+ dat.c    | 12 ++++++++++++
+ dat.h    | 19 ++++++++++---------
+ makefile |  7 +++++--
+ 3 files changed, 27 insertions(+), 11 deletions(-)
+ create mode 100644 dat.c
+
+--- /dev/null
++++ b/dat.c
+@@ -0,0 +1,12 @@
++/* dat.c: Global memory for vblade AoE target */
++#include "dat.h"
++
++int	shelf, slot;
++ulong	aoetag;
++uchar	mac[6];
++int	bfd;		// block file descriptor
++int	sfd;		// socket file descriptor
++vlong	size;		// size of vblade
++vlong	offset;
++char	*progname;
++char	serial[Nserial+1];
+--- a/dat.h
++++ b/dat.h
+@@ -1,4 +1,5 @@
+ /* dat.h: include file for vblade AoE target */
++#include <sys/types.h>
+ 
+ #define	nil	((void *)0)
+ /*
+@@ -163,12 +164,12 @@ enum {
+ 	Nserial= 20,
+ };
+ 
+-int	shelf, slot;
+-ulong	aoetag;
+-uchar	mac[6];
+-int	bfd;		// block file descriptor
+-int	sfd;		// socket file descriptor
+-vlong	size;		// size of vblade
+-vlong	offset;
+-char	*progname;
+-char	serial[Nserial+1];
++extern int	shelf, slot;
++extern ulong	aoetag;
++extern uchar	mac[6];
++extern int	bfd;		// block file descriptor
++extern int	sfd;		// socket file descriptor
++extern vlong	size;		// size of vblade
++extern vlong	offset;
++extern char	*progname;
++extern char	serial[Nserial+1];
+--- a/makefile
++++ b/makefile
+@@ -8,7 +8,7 @@ sbindir = ${prefix}/sbin
+ sharedir = ${prefix}/share
+ mandir = ${sharedir}/man
+ 
+-O=aoe.o bpf.o ${PLATFORM}.o ata.o
++O=aoe.o bpf.o ${PLATFORM}.o ata.o dat.o
+ 
+ vblade: $O
+ 	${CC} ${LDFLAGS} -o vblade $O
+@@ -25,6 +25,9 @@ ata.o : ata.c config.h dat.h fns.h makef
+ bpf.o : bpf.c
+ 	${CC} ${CFLAGS} -c $<
+ 
++dat.o : dat.c
++	${CC} ${CFLAGS} -c $<
++
+ config.h : config/config.h.in makefile
+ 	@if ${CC} ${CFLAGS} config/u64.c > /dev/null 2>&1; then \
+ 	  sh -xc "cp config/config.h.in config.h"; \
diff --git a/meta-networking/recipes-daemons/vblade/vblade_22.bb b/meta-networking/recipes-daemons/vblade/vblade_24.bb
similarity index 86%
rename from meta-networking/recipes-daemons/vblade/vblade_22.bb
rename to meta-networking/recipes-daemons/vblade/vblade_24.bb
index a52a1e92b4..09ba8cfd93 100644
--- a/meta-networking/recipes-daemons/vblade/vblade_22.bb
+++ b/meta-networking/recipes-daemons/vblade/vblade_24.bb
@@ -6,19 +6,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/aoetools/files/vblade/"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/aoetools/${BP}.tar.gz \
+SRCREV = "a7f48bda5bf1646f6450601049bf4b74053adbb3"
+SRC_URI = "git://github.com/OpenAoE/vblade \
            file://cross.patch \
            file://makefile-add-ldflags.patch \
+           file://gcc-10.patch \
            file://${BPN}.conf \
            file://${BPN}.init \
            file://${BPN}.service \
            file://volatiles.99_vblade \
           "
 
-SRC_URI[md5sum] = "510d98ba0f231284a5fbe2da11cb2d6e"
-SRC_URI[sha256sum] = "a990378f273f10eb431e42954a871aed52714035bbab28c54cef600c458356bb"
+S = "${WORKDIR}/git"
 
-UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/aoetools/files/vblade/"
+UPSTREAM_CHECK_URI = "https://github.com/OpenAoE/vblade/archive/"
 
 inherit autotools-brokensep update-rc.d systemd
 
-- 
2.28.0

