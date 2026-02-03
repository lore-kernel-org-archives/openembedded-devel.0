Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6299E87843
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 15:53:46 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19984.1770134026011076634
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Feb 2026 07:53:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WIoMn3JW;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so9280045e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 07:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770134024; x=1770738824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rFFb9lQpNFB4/cjVmxWlFXLC3scV8YhpnagJ0BqNBfs=;
        b=WIoMn3JW5pbwmMtLG/Xsgy3hHOQZ2Y03CKem76Rb8p2/xNgrP7r+AHSrlsm7WogEgm
         VA5G7iiAnI5PM7IyBzdfH6mUG1/7ew8yX4KU8X95WbWqQpthMHwjtzRK9LRLtusyfAO+
         7J/sAGHrpCdSvjPMhCRoqx/DWMMRbelpyaSSfWQXHrNOQzWv30tWsqGvtYEzCPZpkJvj
         v/Cdxw63em4Pa5ZWCo6PgFzEmlWE5HB+g71ZF0mKDmY1G9gRwQVI5sGxuBrorLAZHVub
         rzUf1RU+jvJYevG+pcrhHx1Ar0t8zzEJixzjziyO59vp/W6NOi64Jn+Cpfc0J6SBRz22
         0a1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770134024; x=1770738824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFFb9lQpNFB4/cjVmxWlFXLC3scV8YhpnagJ0BqNBfs=;
        b=WeCGh1U1KcBk2dc3nsx7iyeu9vghVGP3o7+r51Bcr+M0qQEhecoogA5BAhwHxRGTvi
         eCCCOcCcNm5FuNeReeixYBeEZ4evzyld82MmrW1RFXteqXnCzmHXCTpfEJTXebNuDDPI
         k4ih+n6LUY5seoSq0N8FotsvkK+q2okVtrKq7oeyCJ6onR9D9UjnhL00t5VLuC6+U/qk
         OWX0a//nVBHNhXjPWTphg8WFk5kSAkRENw9DbF+RFiqC9bkVYfdwIooWXI2CdzPmmZuY
         iBAiVun0CtXRN0DmYg1MzBxdZKlmCX8BephcXnY30otCqBbBcifcm8nt6+D1jA5R4PVo
         xF1Q==
X-Gm-Message-State: AOJu0YzscYkDgHIK1IV33GgK/ijtrN4eKsFSrJjWpD5w9qOH65MbYDFI
	Nk/gy3/jSJObIMneVLOx2auPAap7hpezKsVEEZfWZ9zaOYGMQxOUFIzFZMFbcA==
X-Gm-Gg: AZuq6aK4FK8KbJ5WIdy2Uz4xEsHawe5f4yUc1v19QtL/CW2NHkHqOSqhRALJX/JcWpt
	yqEPrdBcuNFxlCfVWQQwoRoJCYS7Xb5iQF0zMuGiA7je3oZejN1UDpFyYkfT46kjlWJAGuplGHI
	6YPzQE8rk3nttrCNazki0/CwoEHaLF27yJS4K2GlsXumka9HD0i2zRIOYM9gZsgR6+bF//O79QK
	T1nyRnJplcMJ++OXP0h3NMKc4msrbTgPa3s02ziKrZMMY9+w3asKHIhCDgdAiM9f01E6spF6COX
	N+rqn1DRpHrpeohwoqtnpvmpN3oax9hxDA7MUMd8q+4wfMbRR5Lkc0RCW1TDvCD6FvGHArUhAkb
	mUpxNpWoUhQgU1tfQ0O1AEFU+DE80T0c6FAZCTVS7Zii5KgphBCjQfMv60FlNneTfKkH6EWQ7RQ
	0L406BDmaz
X-Received: by 2002:a05:600c:3484:b0:477:a53c:8ca1 with SMTP id 5b1f17b1804b1-483051718d4mr51385355e9.14.1770134024020;
        Tue, 03 Feb 2026 07:53:44 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483051247ebsm73198625e9.4.2026.02.03.07.53.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 07:53:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][whinlatter][PATCH] gimp: patch libunwind detection
Date: Tue,  3 Feb 2026 16:53:42 +0100
Message-ID: <20260203155342.3393711-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 15:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124100

Gimp 3.0.8's meson file detects the presence of libunwind incorrectly,
making it fail on some platforms, even when libunwind is explicitly disabled:

| <snip>i686-oe-linux-musl-ld: app/core/libappcore.a.p/gimpbacktrace-linux.c.o: in function `gimp_backtrace_get_address_info':
| /usr/src/debug/gimp/3.0.8/../sources/gimp-3.0.8/app/core/gimpbacktrace-linux.c:708:(.text+0xbd7): undefined reference to `_ULx86_init_local'

This backported patch fixes this.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ind-header-detection-on-non-macOS-pl.patch | 51 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb    |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-meson-Fix-libunwind-header-detection-on-non-macOS-pl.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-meson-Fix-libunwind-header-detection-on-non-macOS-pl.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson-Fix-libunwind-header-detection-on-non-macOS-pl.patch
new file mode 100644
index 0000000000..879529b80e
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson-Fix-libunwind-header-detection-on-non-macOS-pl.patch
@@ -0,0 +1,51 @@
+From 8862f36fcec74152afeee2a99c0e04b84b6cf5b3 Mon Sep 17 00:00:00 2001
+From: Bruno Lopes <brunvonlope@outlook.com>
+Date: Sun, 25 Jan 2026 11:11:48 -0300
+Subject: [PATCH] meson: Fix libunwind header detection on non-macOS platforms
+
+Closes: #15750
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/1aa51ca0637db88a4ea958d03fa6692e6ac0289b]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ meson.build | 17 ++++++++++-------
+ 1 file changed, 10 insertions(+), 7 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 2192968..cfa1f71 100644
+--- a/meson.build
++++ b/meson.build
+@@ -731,11 +731,14 @@ conf.set('HAVE_LIBBACKTRACE', libbacktrace.found())
+ ## Check for libunwind
+ # In most platforms, unw_*() functions are in the libunwind library.
+ # In macOS, it is on libSystem (there we only need the SDK header).
+-libunwind = ( get_option('libunwind')
+-  ? dependency('libunwind', version: '>=1.1.0', required: false)
+-  : no_dep
+-)
+-have_unwind = libunwind.found() or cc.has_header('libunwind.h', required: false)
++libunwind = no_dep
++if get_option('libunwind')
++  libunwind = dependency('libunwind', version: '>=1.1.0', required: false)
++  libunwind_h = platform_osx ? cc.has_header('libunwind.h', required: false) : false
++  have_unwind = libunwind.found() or libunwind_h
++else
++  have_unwind = false
++endif
+ conf.set('HAVE_LIBUNWIND', have_unwind ? 1 : false)
+ 
+ ## Check for backtrace() API
+@@ -758,11 +761,11 @@ if platform_windows
+ elif platform_linux
+   if not have_execinfo_h
+     dashboard_backtrace='no (missing: execinfo.h)'
+-  elif not libbacktrace.found() and not libunwind.found()
++  elif not libbacktrace.found() and not have_unwind
+     dashboard_backtrace='rough (missing: libbacktrace and libunwind)'
+   elif not libbacktrace.found()
+     dashboard_backtrace='partially detailed (missing: libbacktrace)'
+-  elif not libunwind.found()
++  elif not have_unwind
+     dashboard_backtrace='partially detailed (missing: libunwind)'
+   else
+     dashboard_backtrace='detailed'
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
index 863d9a1667..860fb5d26b 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
@@ -60,6 +60,7 @@ SRC_URI = "https://download.gimp.org/gimp/v3.0/${BP}.tar.xz \
            file://0002-meson.build-reproducibility-fix.patch \
            file://0001-meson.build-dont-check-for-lgi.patch \
            file://0001-meson.build-require-iso-codes-native.patch \
+           file://0001-meson-Fix-libunwind-header-detection-on-non-macOS-pl.patch \
            "
 SRC_URI[sha256sum] = "feb498acc01b26827cff1ff95aa8fb82cdd6a60d7abf773cfcd19abeafca3386"
 

