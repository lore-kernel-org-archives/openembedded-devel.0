Return-Path: <dimitris@siganos.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E7DC54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 19:23:43 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.2098.1748028220324446019
 for <Openembedded-devel@lists.openembedded.org>;
 Fri, 23 May 2025 12:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siganos-org.20230601.gappssmtp.com header.s=20230601 header.b=HbGX6tTT;
 spf=none, err=permanent DNS error (domain: siganos.org, ip: 209.85.128.53, mailfrom: dimitris@siganos.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-44b1ff82597so1057405e9.3
        for <Openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 12:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=siganos-org.20230601.gappssmtp.com; s=20230601; t=1748028218; x=1748633018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0mlnJ9yK/remk4YEgvyOM6A3HSEKodVQMQAWOmogqN4=;
        b=HbGX6tTTLAyVrdtPh2mBiwjwtTG5PKQ7yrwae3XWgOrmamc4QGjj7UlAyDdocx+y6k
         q2+WHGBhdGpiLQluVonTBv7zggPNNTgRXc3AJP8RynvVxI68RlVYdTQEm3P5sexwW8Ol
         DESUmRbw7owTdjsLsANMAii+TsnW3o0gsGrXaAHV4xKvSrXCjtNVZIMEsMcLh0RSuaSG
         X98LSgfHja9gGIUZOQWVcApTgt7ZztuWLQksSI8AUxz8PsMusKGWU/eu5Cy6fDCfNIz0
         KJc+Rznu4g8M9TRzuyih7QK/0up0aPXkZv/WX9aRDlyCQwr4Xq3J6wfUGTrrdMEeW4ao
         kTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748028218; x=1748633018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0mlnJ9yK/remk4YEgvyOM6A3HSEKodVQMQAWOmogqN4=;
        b=QBBy/b6L7w0Rb4vWML0i4l2Szkm6NeqgN/xdWgoyPn7cmp4vg0kCpqQ8o/ZD4iVk8C
         KNv8Hy6nBwFVxBlH5jFs9l2J/U4XCeCcConMed82Zwzl1xFDDSl3ze08doWJjAEumfz1
         L9xFihOYtS5R7GBwPEArvkcMsuKguPpKmH8cDFSIsV6zPi8FFXME8CiABOXLTfWoL3qu
         UAeI6jhMGepNc5/la4c6G9QDTTZawR7lJxs64CIKsq9Q1ciSEMXQaZRnZoh3qLpeZdM3
         TXnenFy+PCE/12ZZsXEwpN6zFc12eO50fluDJz2iYCoJ/USx1GUNX6vks2cL+SkGfMZy
         6vtg==
X-Gm-Message-State: AOJu0Yz/nj2MTqpSsYRSbEwsJO43wl8adnnxzxjtgnBXLkvLkI4PuS4w
	aTkIw7OSGAXA6BIUtCLex6Qjy3Rg+9ZUETkkJnTe9/1PKzRWL2m/LIDiQgTly4TPOSwvkdSZR7L
	td17GIQI=
X-Gm-Gg: ASbGnctjNdnRdiHd1OqEI4RVgTubXlz6GfpfYY5GocOIZxHRSRGN0vXAQWU8TIKCYXy
	IMshz8/khlX6lU6GewlyK7ea81KiYrSVwbEE4WrMBoGlyh/L3aWUyWYsVZqZbQjQYTLKX+J07rm
	wq7BArgur/WA3X1WsafraxyBj7bo8lEMT1tLP6VnwhXTk+zI723QcfLVFIiJSVWEYIDI8mXa0nx
	HhVtAVCguHrOAtHAJaSziQ9HILbQSvlhHDpgovScclJ9Twy8ylRracyLLgdpbkfryd9pX7qibfk
	VrMBwxRlrYc+fnCV/gljbTzf5NLNGmhC+1YJ0XgpjDoRcRef7w==
X-Google-Smtp-Source: AGHT+IG/mo6LzbokqaZR9z4+6a8QVxDwdnwCQDrVO5OzKylIiSFYs+auMFiSiR9/eSPlUSCD4nZFzg==
X-Received: by 2002:a5d:5f8b:0:b0:3a3:63d3:369d with SMTP id ffacd0b85a97d-3a4cafc8330mr536182f8f.0.1748028218089;
        Fri, 23 May 2025 12:23:38 -0700 (PDT)
Received: from tux.home ([2a00:23c5:31e:9001:6ec4:b52e:4857:f27c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a892sm27002371f8f.24.2025.05.23.12.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 12:23:37 -0700 (PDT)
From: Dimitrios Siganos <dimitris@siganos.org>
To: Openembedded-devel@lists.openembedded.org
Cc: Dimitrios Siganos <dimitris@siganos.org>
Subject: [meta-oe][PATCH v3] bvi: add new package
Date: Fri, 23 May 2025 20:23:21 +0100
Message-Id: <20250523192321.333048-1-dimitris@siganos.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 19:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117612

bvi is a visual editor for binary files

Signed-off-by: Dimitrios Siganos <dimitris@siganos.org>
---
 meta-oe/recipes-support/bvi/bvi_1.4.2.bb      | 18 ++++++
 .../bvi/files/0001-gcc-15.patch               | 60 +++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 meta-oe/recipes-support/bvi/bvi_1.4.2.bb
 create mode 100644 meta-oe/recipes-support/bvi/files/0001-gcc-15.patch

diff --git a/meta-oe/recipes-support/bvi/bvi_1.4.2.bb b/meta-oe/recipes-sup=
port/bvi/bvi_1.4.2.bb
new file mode 100644
index 0000000000..a44a7e7078
--- /dev/null
+++ b/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
@@ -0,0 +1,18 @@
+SUMMARY =3D "Binary VI editor"
+DESCRIPTION =3D "bvi is a visual editor for binary files."
+HOMEPAGE =3D "https://sourceforge.net/projects/bvi"
+SECTION =3D "console/utils"
+LICENSE =3D "GPL-3.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da36207309d382da27cd66fdaae922e3=
c"
+
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
+           file://0001-gcc-15.patch \
+          "
+SRC_URI[sha256sum] =3D "4bba16c2b496963a9b939336c0abcc8d488664492080ae43a8=
6da18cf4ce94f2"
+
+DEPENDS +=3D "ncurses"
+
+# The project uses old style C interfaces, disable the warnings
+CFLAGS:append =3D " -Wno-old-style-definition"
+
+inherit pkgconfig autotools-brokensep
diff --git a/meta-oe/recipes-support/bvi/files/0001-gcc-15.patch b/meta-oe/=
recipes-support/bvi/files/0001-gcc-15.patch
new file mode 100644
index 0000000000..d5cb108eb6
--- /dev/null
+++ b/meta-oe/recipes-support/bvi/files/0001-gcc-15.patch
@@ -0,0 +1,60 @@
+This patch fixes the incompatibility problems with C23.=0D
+=0D
+The code uses some function prototypes without argument specifications,=0D
+which makes it incompatible with C23 and this patch fixes them.=0D
+=0D
+The patch was copied from here:=0D
+https://sourceforge.net/p/bvi/bugs/16=0D
+=0D
+Upstream-Status: Submitted [https://sourceforge.net/p/bvi/bugs/16]=0D
+=0D
+--- bvi.orig/re.c=0D
++++ bvi/re.c=0D
+@@ -36,7 +36,11 @@=0D
+ #include	"bvi.h"=0D
+ #include	"set.h"=0D
+ =0D
++#ifdef __STDC__=0D
++static	int sbracket(int, char *, int);=0D
++#else=0D
+ static	int sbracket();=0D
++#endif=0D
+ =0D
+ char	act_pat[MAXCMD];  /* found pattern */=0D
+ char	pattern[MAXCMD + 1];=0D
+--- bvi.orig/bm_unix.c=0D
++++ bvi/bm_unix.c=0D
+@@ -161,7 +161,11 @@=0D
+ {=0D
+ 	int	ret;=0D
+ #ifndef DJGPP=0D
++#ifdef __STDC__=0D
++	char	*getenv(const char *);=0D
++#else=0D
+ 	char	*getenv();=0D
++#endif=0D
+ 	char	*shell;=0D
+ 	char	cline[128];=0D
+ #endif=0D
+--- bvi.orig/bmore.h=0D
++++ bvi/bmore.h=0D
+@@ -136,7 +136,7 @@=0D
+ =0D
+ =0D
+ =0D
+-#ifdef ANSI=0D
++#if defined(ANSI) || defined(__STDC__)=0D
+ 	void	initterm(void), set_tty(void), reset_tty(void);=0D
+ 	void	cleartoeol(void), clearscreen(void), highlight(void);=0D
+ 	void	normal(void), bmbeep(void), home(void), sig(int);=0D
+--- bvi.orig/bvi.h=0D
++++ bvi/bvi.h=0D
+@@ -214,7 +214,7 @@=0D
+ 	void	d_memmove(PTR, PTR, off_t);=0D
+ #endif=0D
+ =0D
+-#ifdef ANSI=0D
++#if defined(ANSI) || defined(__STDC__)=0D
+ 	off_t	alloc_buf(off_t, char **), yd_addr(void);=0D
+ 	off_t	range(int);=0D
+ 	void	do_dot(void), do_exit(void), do_shell(void), do_undo(void);=0D
--=20
2.34.1


