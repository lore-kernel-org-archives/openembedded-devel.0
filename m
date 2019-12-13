Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 500F27D537
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2019 21:13:05 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id y14so2094714pfm.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2019 13:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TAQybMzyYwyds3QWoZQmRZUm9LH/+yZIvuCvg07UV9s=;
	b=MBB1FXerizbeln9uuwKSvYyLtlVGLR3rWjtmUAAAyZOOyQXV5GNZHZgOZJlR2fcOgI
	AQDq7ISbflQ0edZR4u8wr7UF8Y9orlXXUq07tn2m76DHSrhegBKuAFVYPyrYoBEruB/G
	xqDr/6mrj7MdHgySXQig84MA7BOFvJuZp/yMV2P60jAM/6xlJc3BYlp1oy3FQDy907kn
	Uy2+RP2nl+bncplWMOgX7yAg43eVcgYC8EFkk7FzVEfB+nr4fBklPScNm+zEQtxdnUhZ
	dGx5aX6j7e2Q/Wzkx4wKT1JntdlyYbEgBBft7sGQgwqL5A9AumAnbOwxqBoLQwdufFLt
	kHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TAQybMzyYwyds3QWoZQmRZUm9LH/+yZIvuCvg07UV9s=;
	b=fwWwjMfZm4tpCLyNIH5NpO4yKWsKjQSB+pS/Yf12okK2SGvJa+LtxYnit+MASqfjRX
	sMZMPrk0Jg76npNZTTTOqgA6LTYBArafMmjAirTvZsKLwqOoKkOqhr0YABsE8LvNC3OC
	2jDmmiMavfb6DOQTHFkWOiNQ+zz+wMt1+8U+cTjHMxmWit9FbfgYCjNCrMKAIZdfVGDJ
	3iBDjIqlo1oUdzAqoPILlR+bzjtLGTPA5qh5hF9gscE7zznlqL4MwUNzgFwxRxcTevD9
	dplHIo949VL0O4Sn+899ME3qVJUBWdzec+0i3XfLj1TAkrjqb+/uZy9hHlmh/11ubuTk
	yA+w==
X-Gm-Message-State: APjAAAUn6UeOK3guUfuESKwjn6AKNYzuSOW1ldMQD0km/kq+qShMb0nH
	OB9UKXUMrb/bo4CuRfVSyNbRKhlwuEo=
X-Google-Smtp-Source: APXvYqzgu/WXELZH/pEuC7Q39FS0JUn1VwMB0qxRhD3bWM73v5lO6gosjwLrg2CNltU8bo40r9KPrQ==
X-Received: by 2002:a65:590f:: with SMTP id f15mr1631534pgu.381.1576271585526; 
	Fri, 13 Dec 2019 13:13:05 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6d2c])
	by smtp.gmail.com with ESMTPSA id
	c184sm12892278pfa.39.2019.12.13.13.13.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Dec 2019 13:13:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Dec 2019 13:12:50 -0800
Message-Id: <20191213211250.3142384-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] xterm: Fix latent issue found with musl
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
X-List-Received-Date: Fri, 13 Dec 2019 21:13:05 -0000
Content-Transfer-Encoding: 8bit

[YOCTO #13691]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Armin Kuster <akuster808@gmail.com>
---
v2: Detect setsid during configure and use __linux__ instead of
    __GLIBC__ check for using openpty

 ...-Add-configure-time-check-for-setsid.patch | 77 +++++++++++++++++++
 .../recipes-graphics/xorg-app/xterm_351.bb    |  4 +-
 2 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xterm/0001-Add-configure-time-check-for-setsid.patch

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm/0001-Add-configure-time-check-for-setsid.patch b/meta-oe/recipes-graphics/xorg-app/xterm/0001-Add-configure-time-check-for-setsid.patch
new file mode 100644
index 0000000000..d3beea8be1
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/xterm/0001-Add-configure-time-check-for-setsid.patch
@@ -0,0 +1,77 @@
+From 3730a38efad969fb6f8227df07eb4461a078f5a3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 13 Dec 2019 12:59:26 -0800
+Subject: [PATCH] Add configure time check for setsid
+
+Do not assume glibc == linux
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure    | 1 +
+ configure.in | 1 +
+ main.c       | 4 ++--
+ xtermcfg.hin | 1 +
+ 5 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 0aafefc..03e8df0 100755
+--- a/configure
++++ b/configure
+@@ -5411,6 +5411,7 @@ for ac_func in \
+ 	unsetenv \
+ 	sched_yield \
+ 	setpgid \
++	setsid \
+ 	strftime \
+ 	tcgetattr \
+ 	waitpid \
+diff --git a/configure.in b/configure.in
+index d2fee88..74d65df 100644
+--- a/configure.in
++++ b/configure.in
+@@ -99,6 +99,7 @@ AC_CHECK_FUNCS( \
+ 	unsetenv \
+ 	sched_yield \
+ 	setpgid \
++	setsid \
+ 	strftime \
+ 	tcgetattr \
+ 	waitpid \
+diff --git a/main.c b/main.c
+index 5e60589..b81d2be 100644
+--- a/main.c
++++ b/main.c
+@@ -2868,7 +2868,7 @@ main(int argc, char *argv[]ENVP_ARG)
+     }
+ }
+ 
+-#if defined(__osf__) || (defined(__GLIBC__) && !defined(USE_USG_PTYS)) || defined(__DragonFly__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__APPLE__)
++#if defined(__osf__) || (defined(__linux__) && !defined(USE_USG_PTYS)) || defined(__DragonFly__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__APPLE__)
+ #define USE_OPENPTY 1
+ static int opened_tty = -1;
+ #endif
+@@ -4040,7 +4040,7 @@ spawnXTerm(XtermWidget xw, unsigned line_speed)
+ 	    /*
+ 	     * now in child process
+ 	     */
+-#if defined(_POSIX_SOURCE) || defined(SVR4) || defined(__convex__) || defined(__SCO__) || defined(__QNX__)
++#if HAVE_SETSID
+ 	    int pgrp = setsid();	/* variable may not be used... */
+ #else
+ 	    int pgrp = getpid();
+diff --git a/xtermcfg.hin b/xtermcfg.hin
+index 1dbc3b8..4f3ff5b 100644
+--- a/xtermcfg.hin
++++ b/xtermcfg.hin
+@@ -96,6 +96,7 @@
+ #undef HAVE_PUTENV		/* AC_CHECK_FUNCS(putenv) */
+ #undef HAVE_SCHED_YIELD		/* AC_CHECK_FUNCS(sched_yield) */
+ #undef HAVE_SETPGID		/* AC_CHECK_FUNCS(setpgid) */
++#undef HAVE_SETSID		/* AC_CHECK_FUNCS(setsid) */
+ #undef HAVE_STDINT_H		/* AC_PROG_CC_STDC */
+ #undef HAVE_STDLIB_H		/* AC_CHECK_HEADERS(stdlib.h) */
+ #undef HAVE_STRFTIME		/* AC_CHECK_FUNCS(strftime) */
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_351.bb b/meta-oe/recipes-graphics/xorg-app/xterm_351.bb
index 394d2cb9de..40ee555db7 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_351.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_351.bb
@@ -4,7 +4,9 @@ DEPENDS = "libxaw xorgproto libxext libxau libxinerama libxpm ncurses"
 
 LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=c7faceb872d90115e7c0ad90e90c390d"
 
-SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
+SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
+           file://0001-Add-configure-time-check-for-setsid.patch \
+          "
 
 SRC_URI[md5sum] = "a07edfbee2e2f4c6a9ddbf834fa4bbec"
 SRC_URI[sha256sum] = "760a8a10221c9c9744afd86db87c7ad95bbf9be4f5f525fecf39125f0d2a6e16"
-- 
2.24.1


