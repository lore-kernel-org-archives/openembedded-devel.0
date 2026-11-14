Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3100.1794685059961104446
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 11:37:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Rhrm0WPq;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso481875eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 11:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794685059; x=1795289859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LW5YhS1TeG1TmoRdTKhmF2G6dWk8IHZ3Me7ZfKIOqs=;
        b=Rhrm0WPqe5I0IjcnDeinU4Dx3L2HYmbU0HY06C7cQ9JBaKqz4DKRfbkA42Qg9RB8B/
         ATNq1j02HAUMD7QZlW3yBp711TZ0GZEVIaKB58d7xT3LiaJkhLBtJkgSSak0oo1ZruxE
         +QO1ZGJ53rrUxS3O50KIDDXAAF+DbXLLn5pvo2lyt3a51IuM8ahd3L/z9OZTYxx+bn9Z
         M+d1tdVO0ELbHgszj7rieBWdn/sIg6xWxu1KMtjceKZnBfiB07aoFhqxvws8YGl8tdlN
         Suou8ADfc91e/h5K/gSITEvCTXR8EInHIZ0dHfWaPORaKmPHzSQ/CdKEnBvZH1Qd8wAO
         8wNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794685059; x=1795289859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LW5YhS1TeG1TmoRdTKhmF2G6dWk8IHZ3Me7ZfKIOqs=;
        b=0hfuPePCBHAxnWfVLmQxEqhMZ9NVw0HL9Ug1PQ9qaex8dKwrIjy0Gm+V++hcf8xDdP
         xQbEaDsuh3kimpZM6lUnmTjjiafsSFMflYoup6dmO0aaYVMWRzKBfzs9LboG7C34YsMI
         UShoV6zxhf3S+Dhzk7C8liV4xQJZeUcRmvlg/kltxLHcqZRiMk2wKRMwHxX6EuyZcd/r
         L/GLcAQekheMeMn6YlniXt99WnH+9djOeRGdclDmFynIoYYwEdFHFXxktiFkSlnpfZLh
         DqdKzkjtl2TFwXY1Az82h8yQRU7JY/xfAMvg3s+93qthrNQCKFsobHaIpkNcCJIFgqo3
         RZJw==
X-Gm-Message-State: APuU4Z8Q1fMP/PyghXIHrTWcSYEOY6Tdi4tYXt79HWaYobM0NwyHmlfN
	fsOuyBfcPkno6Q13E9eVID6ToMcYZ3+VYu1GzsrvA4Mlr4SYWgpuiRAIW3bWrqFy
X-Gm-Gg: AYBFou3r7MTVlVGkNigcIM4eQIVsBFCXFRHIFwPsRtCXNq8hg5Q8ewqYw6HcCQhB1mW
	/ByYSqPwEPtFUdq11swlrXxiFAuWESpAU68Rt9OtLBhA+5xVfKy5Pyb+QVUN8Q4kEsycvyl/Bod
	xGEsYzFhm900kUm1zTagulvr/XjYDTiTP0wtvXHE4Q6S/Sn3my5JBAFGM2UNrAEGy42/DZUvKxD
	67EsFfmvZi2I6Bq5IQ4wUSCarOpWO0mjsYp8bLAaHIuCkxVn6zwWZLel4dk69p9EIMbm2QH+wSU
	wEkKr0TEQN4IQ28uvug/+0m4HcyQY4fO1tUBskbdM1EHeI46GbFcOSv3qbzKx7CjnPvKOUnGTqx
	KJSlXouARNI7n1xQlj5u3SMF+UC7m1Yt2vQUHicWAlA4s/Ngp5A82noYHvB7D5U6zrjcv6zn0Jv
	zEFPmYl/41CttInjPqbTXv+NtgSLtyDApjUk2UIqQe97MduDHkZhEMtJmQ3cvyfig2qYODNsH0k
	8VepjQE+JemJPla2VMvgBYbLSVdI30YCjYFOAxLaapWvnykrAo7P3pYXmHgRdVaXhNQrpeRjNOH
	Mre9qJ7C5lXIrt1wIM56LswCZvPA7kRN8PC42wmpKnWRpP5uQNUXcuX5AKkcFYKqs6eq+PMO5zz
	RMOpY/U/yf5lPnRTaw8V/8HSaxJRdy0l/rrB95I37jYXIGUSNF2iuTLlHmfxtQz0PJa4fb3pJyB
	d0oOTPtknDRzE68eIOKZDPrNE05TCQ61ezHhsQhGFSIcdHQvLzX8Iw8YN5XWLRgrhGNlbEdhbQS
	ZXRbjU8j/KiwlV65Fm3gjFiAWAyO/fsgsrKpaqwagfCCkBUNpGuMR7f4e80+yzocxTWlxQFvZ+c
	/7z6
X-Received: by 2002:a05:693c:41c1:20b0:375:c862:34e with SMTP id 5a478bee46e88-37966193789mr6301826eec.20.1794685059038;
        Sat, 14 Nov 2026 11:37:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm16855164eec.4.2026.11.14.11.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:37:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 02/13] dante: Fix build with lld
Date: Sat, 14 Nov 2026 11:37:22 -0800
Message-ID: <20261114193733.1743149-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
References: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 19:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132259
Content-Type: text/plain; charset="utf-8"

getipnodebyname() and freehostent() are only interposed when the
platform has getipnodebyname(), which glibc and musl do not, but they
are always exported, so lld fails with:

  error: version script assignment of 'global' to symbol 'freehostent' failed: symbol not defined

Only export them when configure finds getipnodebyname().

Do not export rresvport where it does not exist

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...rposed-functions-that-exist-on-the-p.patch | 44 +++++++++++++++++++
 .../recipes-protocols/dante/dante_1.4.4.bb    |  3 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/dante/dante/0001-Only-export-interposed-functions-that-exist-on-the-p.patch

diff --git a/meta-networking/recipes-protocols/dante/dante/0001-Only-export-interposed-functions-that-exist-on-the-p.patch b/meta-networking/recipes-protocols/dante/dante/0001-Only-export-interposed-functions-that-exist-on-the-p.patch
new file mode 100644
index 0000000000..ea7c3e03ff
--- /dev/null
+++ b/meta-networking/recipes-protocols/dante/dante/0001-Only-export-interposed-functions-that-exist-on-the-p.patch
@@ -0,0 +1,44 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 9 Nov 2026 08:37:30 -0800
+Subject: [PATCH] Only export interposed functions that exist on the platform
+
+dlib only interposes getipnodebyname() and freehostent() when the
+platform has getipnodebyname() (Solaris), and rresvport() when it is
+available (not on Android or musl), but they are always listed in the
+exported symbols, so linkers that check the version script, like lld,
+fail with:
+
+  error: version script assignment of 'global' to symbol 'freehostent' failed: symbol not defined
+  error: version script assignment of 'global' to symbol 'rresvport' failed: symbol not defined
+
+Leave them out of the symbol list when configure did not find them.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ mapfile.m4 | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/mapfile.m4 b/mapfile.m4
+index 644a94b..dc964f8 100644
+--- a/mapfile.m4
++++ b/mapfile.m4
+@@ -12,8 +12,16 @@ PLDDIRS="dlib/" #preloading (standard, non-Rfoo functions)
+ if test x"$sol64" = xt; then
+    PLDDIRS="$PLDDIRS dlib64/"
+ fi
++#only export interposed functions that exist on this platform
++PLDEXCLUDE="-e ^$" #skip blank lines
++if test x"$ac_cv_func_getipnodebyname" != xyes; then
++    PLDEXCLUDE="$PLDEXCLUDE -e ^freehostent$ -e ^getipnodebyname$"
++fi
++if test x"$ac_cv_func_rresvport" != xyes; then
++    PLDEXCLUDE="$PLDEXCLUDE -e ^rresvport$"
++fi
+ for symdir in $PLDDIRS; do
+-    cat include/symbols_preload.txt >> $symdir/$MAPFILE
++    grep -v $PLDEXCLUDE include/symbols_preload.txt >> $symdir/$MAPFILE
+
+     #platform dependent symbols
+     case $host in
diff --git a/meta-networking/recipes-protocols/dante/dante_1.4.4.bb b/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
index 6a1eed3edb..e15f7c4d41 100644
--- a/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
+++ b/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
@@ -12,7 +12,8 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b3a8e7dc09bb720460f28c9d3796afa5"

 SRC_URI = "https://www.inet.no/dante/files/dante-${PV}.tar.gz \
-          "
+           file://0001-Only-export-interposed-functions-that-exist-on-the-p.patch \
+           "
 SRC_URI[sha256sum] = "1973c7732f1f9f0a4c0ccf2c1ce462c7c25060b25643ea90f9b98f53a813faec"

 # without --without-gssapi, config.log will contain reference to /usr/lib
