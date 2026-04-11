Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44153F45A18
	for <webhook@archiver.kernel.org>; Sat, 11 Apr 2026 01:47:45 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.172615.1775872063195818867
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2026 18:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=clSfKPcm;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2cfd69b564dso3795587eec.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 18:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775872062; x=1776476862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DWvuhHR4e2iZLev7BaePSyQXZ+GkklP9y8xolISBoAA=;
        b=clSfKPcmw5vnYqCVTt8+2QOj+6dfBFthjU3cSlFqeKMn8AAA05trC9FDgZ/zMfCuMS
         sQ26xenQ9KFU5yWEDILjBxdOiahHT16YNMCtV0hig5xAnwm/oiHv7U1g311ta/5noRTI
         cAnnoCh3Yt31yyU4p+50uI/s0W5eDQ23hx/8pvTejBsePMQvXlC/cfXGclzzaHxMRnCJ
         Ty+0H2Lfx9tu9+eK7fZHKAa1ksUETIlNXf6r2aTsXoRHbNGGS7fPTUQfXMRUyiiTEiAh
         ezQwa/MDnW4V4ni5x3taIl+Y1sFLDpsRzvm4CtdXomy0f9yzOxSBRdPkgqtDzGMQekZR
         GkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775872062; x=1776476862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWvuhHR4e2iZLev7BaePSyQXZ+GkklP9y8xolISBoAA=;
        b=soOvJxDrOiODBOE/v0H94RAOffWf4U5ZJdz1+3WYMhNe3eVo0fY6AwDWalDatq9ZZy
         VT5OfT+m0CIqIWhoJ70mzMCS/ZyvfsX7kkOicqfp8HZY7jxlc3Ii7cVZeSvqNZ8hjmjI
         DZ+wqb7GcWh4UIm1+0t6rhkQm2U3/EsafXa/h49k505oKFigvx6k/x4v0DAU+mrQ52GA
         ax5rVqGWXb8nQHpJBbS5NiLVE3EwbqzIzCPcMP9+aJob23RV8HVBodxxZirYmvKfo4v2
         aJa0GlsEIuhqeOlEl2ARiZ4SkhY3fuNTygg/gClGRo0bKqqWIq/xYFdDVa4l4vTYG+Qg
         RiLA==
X-Gm-Message-State: AOJu0YzywU653c40+G+S8+1F8E6YAQvlh+22kZ2zpBex4+XgcaMy8PkP
	fI5KWjBZqTTn0Den857dYZnCxsKX97HJheKb0sA7t4pSe/2Vn5Av9eef2OY+LYsW
X-Gm-Gg: AeBDiesBLOwWhWyg2a3kd+Rg7zx+eaA7He44T5fLieEAJJ/lkAQwP+lZXrGTa0b9O91
	ksq60UgaPrfNCjrU+PgigrrIrT3pt6LzHfZtKn9+uaedjr5K3C2XUjr1Sp65as5P6TUFB/y5fKs
	J1p39gCAKBNOGEPi563rC6JXTvmcwmNSWiQ54ARcR1OWL4YMGJJ1ZoOAiivVhY9KwxAyeVD1EL8
	+Mf3DunteYzFh9fgDwl+r84IaesEjPpD4DjfTRpgl1cMlfP0lCD7fs5hL0B5j42psv6F0Js1DQa
	XRbrw74sYq5EW3l4KWOxyvg4MpGMEYDIVJKDX25FMit3ZPl6E+hb+/qr+oXn5HBXuNECQw4cDXI
	PDcMsuhAPvaHUi8rBFlgqnKAPJCK4NpdJPPenZ45r19mDLxvj0DWWBrhgbF7H2tojWLzaiZCout
	DEB1l2/TmaW8Tn/gMzzwg9Gs9+jSnJGwnCM5RxABshJKnEspVYz5q5oEL5Xa3D4LOmk7P6o8zuf
	iCkiicoRdwvo2nU2ABKaAKNoKFTRqcwX/kFfHAO8JyzcxKdYc2bgF88PmUp
X-Received: by 2002:a05:7301:1296:b0:2c0:da6f:55e0 with SMTP id 5a478bee46e88-2d589174873mr3204072eec.27.1775872062050;
        Fri, 10 Apr 2026 18:47:42 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd2c09sm8606751eec.18.2026.04.10.18.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 18:47:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] libtar: Fix build with clang-22 -std=gnu23
Date: Fri, 10 Apr 2026 18:47:39 -0700
Message-ID: <20260411014739.658509-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Apr 2026 01:47:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126247

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-R-function-definitions-to-ANSI-C-pr.patch | 62 +++++++++++++++++++
 .../recipes-support/libtar/libtar_1.2.20.bb   |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-support/libtar/files/0001-compat-convert-K-R-function-definitions-to-ANSI-C-pr.patch

diff --git a/meta-oe/recipes-support/libtar/files/0001-compat-convert-K-R-function-definitions-to-ANSI-C-pr.patch b/meta-oe/recipes-support/libtar/files/0001-compat-convert-K-R-function-definitions-to-ANSI-C-pr.patch
new file mode 100644
index 0000000000..4585c586b4
--- /dev/null
+++ b/meta-oe/recipes-support/libtar/files/0001-compat-convert-K-R-function-definitions-to-ANSI-C-pr.patch
@@ -0,0 +1,62 @@
+From 5ea04d70221a18cbd711a9d570c81ef0b9be6765 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 10 Apr 2026 18:41:04 -0700
+Subject: [PATCH] compat: convert K&R function definitions to ANSI C prototypes
+
+Replace old-style K&R parameter declarations with modern ANSI C
+function prototypes in basename.c, dirname.c, and strmode.c.
+
+Required for compatibility with clang 22 under -std=gnu23, which
+no longer supports K&R-style function definitions.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ compat/basename.c | 3 +--
+ compat/dirname.c  | 3 +--
+ compat/strmode.c  | 4 +---
+ 3 files changed, 3 insertions(+), 7 deletions(-)
+
+diff --git a/compat/basename.c b/compat/basename.c
+index 2ac1e13..7b0384a 100644
+--- a/compat/basename.c
++++ b/compat/basename.c
+@@ -36,8 +36,7 @@ static char rcsid[] = "$OpenBSD: basename.c,v 1.4 1999/05/30 17:10:30 espie Exp
+ #include <sys/param.h>
+
+ char *
+-openbsd_basename(path)
+-	const char *path;
++openbsd_basename(const char *path)
+ {
+ 	static char bname[MAXPATHLEN];
+ 	register const char *endp, *startp;
+diff --git a/compat/dirname.c b/compat/dirname.c
+index 986db4a..6c1231d 100644
+--- a/compat/dirname.c
++++ b/compat/dirname.c
+@@ -36,8 +36,7 @@ static char rcsid[] = "$OpenBSD: dirname.c,v 1.4 1999/05/30 17:10:30 espie Exp $
+ #include <sys/param.h>
+
+ char *
+-openbsd_dirname(path)
+-	const char *path;
++openbsd_dirname (const char *path)
+ {
+ 	static char bname[MAXPATHLEN];
+ 	register const char *endp;
+diff --git a/compat/strmode.c b/compat/strmode.c
+index 5e7f15e..2ffab61 100644
+--- a/compat/strmode.c
++++ b/compat/strmode.c
+@@ -40,9 +40,7 @@ static char *rcsid = "$OpenBSD: strmode.c,v 1.3 1997/06/13 13:57:20 deraadt Exp
+ #include <string.h>
+
+ void
+-strmode(mode, p)
+-	register mode_t mode;
+-	register char *p;
++strmode (register mode_t mode, register char *p)
+ {
+ 	 /* print type */
+ 	switch (mode & S_IFMT) {
diff --git a/meta-oe/recipes-support/libtar/libtar_1.2.20.bb b/meta-oe/recipes-support/libtar/libtar_1.2.20.bb
index a17509d2e5..39d410064e 100644
--- a/meta-oe/recipes-support/libtar/libtar_1.2.20.bb
+++ b/meta-oe/recipes-support/libtar/libtar_1.2.20.bb
@@ -20,6 +20,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/libt/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://CVE-2021-33643-CVE-2021-33644.patch \
            file://CVE-2021-33640-CVE-2021-33645-CVE-2021-33646.patch \
            file://CVE-2013-4420.patch \
+           file://0001-compat-convert-K-R-function-definitions-to-ANSI-C-pr.patch \
            "

 S = "${UNPACKDIR}/${BPN}"

