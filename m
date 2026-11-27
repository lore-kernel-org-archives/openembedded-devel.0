Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11786.1795762919918348988
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:01:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=uaXLAPqY;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f0458cc9easo61328475ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762919; x=1796367719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sooM7sSAz1pF6f/u9C+WeUayKfd7OM2obj4uyv1jF4c=;
        b=uaXLAPqYU1JBYhKZo6p/8x9MTiPpbG+qvlwebY52VHFQnEfj39DaybCmySVWaT3mZ9
         Z5B/Hq87ICZaNtTFfr0J0TaZQ8jfprFQLgx3y23IOsScf/X8tDg8O1Txf/CZRN04TeUj
         mGRlsKHYHeoZpVhtFqY96TjKCVit5o0TwacLIsiwxMkTAPxP08eK0FwHcg80MzUFKnIu
         /+WIZY8XrbCflghCFqGwAZT1Vbwr1zdzMGMAMGwdy/wG78qlbrCyyRIncCWxpwHJZVY3
         AZCJZ2kbOfj6T4awh9WX+WtZn2t90gKDp2Krxv2F3TYAvEpeKkBg1B6x9BqT7UolYwyA
         xuxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762919; x=1796367719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sooM7sSAz1pF6f/u9C+WeUayKfd7OM2obj4uyv1jF4c=;
        b=tkzj+F51YyrEG+y62soUqtyB/3xjrsgZRNBAexWbBSI4faytHmBO88lUnKV0riMEOx
         bdjznK1OLmtyeGCgNxENqmb2x15WMz7cLjsUH5bJmp6Uo1Ifs/dx0U7GecntX9gxw2Om
         LEbwfPbaCijZZErk4oW+Z8htDSmsWBWzQNhHLFYt4cs+vXcICON+MR+hYfC8tUSIompV
         AiOf4Zkam4PNudX+hrl/byYI+HPBKWRvcjxr//EFQe10Fcea+31CaiCvO7NWRB2q+pCF
         5wQPfoyofr1CjQDH/lO4X+FWp0ToxJMWVEsFab9/7dOXm38gF/nLE5UKfqlUxyrmMHQ9
         8CQg==
X-Gm-Message-State: APuU4Z/3il3NbNAlI/T6fCLK7bazEFQUozUVU106lH81GSmuwJdSJMmz
	h53HoJBXVkU1/ka3L7HWKKvukr9fhViZ+iYpbQKLE9EhYWOuaHirC3LK3wYWctk+
X-Gm-Gg: AZFdTZcbaQJIA8vS14kfO22X8aXpwN4YRtm4FNj4V1qJ3g6f2tOT4oMo7ntneHQVAhe
	TPPHI4HFgztjaHR78xIlbKZ2h3BSgZZhNPBNkm8hLR7p9LEmKrBh406H7tFUmgraHd2/5GYjcZF
	JZiCEUpvky7kt0S5yZol9LWeWVPaystYsFPWHnUBqoL4pqonYiPtE/oIrdnCYdcR7BAnviy5gvo
	tbGb+q6Jr53YRuLyzIHImdESxzpydO1QoKRfdjKQnbFUxQg0s8rHdGigo423Lvk6MamW6Y5iRQy
	+JmG9GVVbwUZ7rNZVaNaZ4Q6+qoZ3UCywtlSxI5s97WGl5CnG2gzPV92LyCfxijvAy6Cd6jA3Ya
	5hlCSfGisKubpISjJ5HF1KdY4q0dpluEtnCt+g2oDWAB57oJT4PwaQ9DKxW5odYBl4Fh3g94oYF
	Tjr41ZlwsTmD4G1E8rpBtgBkesKRKXH6mOioz/sBB+10cDAmLrJ9GYll9nn+9K6NW084fqIDjRw
	CE+IomvGTlZQ7JGioiOGFeSMOKm8YF/Wc4gjRUL3WdoXrtrXdvhjtJVJutbOemEyiy5cafGk6bd
	qBTNuVHgRsjcL3jnCsuD5IuYS4cjiX5EHnDIotrfEE9NvMg7zjkgEmzjJepOhRgUTZZ5AdNiiHh
	LlI7o15H7qXwAjTmGEF9TiOUEY0OuXcRfRwNWx8WNnwRJaLRpDvDWonKwSk5lZhKboGIqnQwGY7
	RLKkg0E4cqqPPNaFhbyn3wmD/GLcGWLpVRqAzEhjkydyc/JiJuJeZAOy8VuBxtFm/Ae0un5wTEB
	upuEuG3IX7lx2UE2OuLKWGCNMULyCa0550WZRV6DNWF71FdZC+6X+F5LEyTMyWueveBXArQMOF/
	sIZb
X-Received: by 2002:a17:90b:2f8c:b0:3b3:af8e:ea8d with SMTP id 98e67ed59e1d1-3b41c92a403mr22845039a91.39.1795762918959;
        Thu, 26 Nov 2026 23:01:58 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4efb59622sm6385312a91.4.2026.11.26.23.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:01:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 6/6] pjproject: Fix build on musl
Date: Thu, 26 Nov 2026 23:01:45 -0800
Message-ID: <20261127070145.2286713-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070145.2286713-1-khem.raj@oss.qualcomm.com>
References: <20261127070145.2286713-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133326
Content-Type: text/plain; charset="utf-8"

The pjsua_stress harness added in 2.18 takes every non-Android Linux
build for glibc and includes <execinfo.h> for crash backtraces:

  pjsua_stress.c:58:12: fatal error: 'execinfo.h' file not found

Add a patch that enables the backtrace and ucontext code only when
__GLIBC__ is defined.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...y-use-backtrace-and-ucontext-with-gl.patch | 51 +++++++++++++++++++
 .../pjproject/pjproject_2.18.bb               |  4 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/0001-pjsua_stress-Only-use-backtrace-and-ucontext-with-gl.patch

diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/0001-pjsua_stress-Only-use-backtrace-and-ucontext-with-gl.patch b/meta-multimedia/recipes-multimedia/pjproject/pjproject/0001-pjsua_stress-Only-use-backtrace-and-ucontext-with-gl.patch
new file mode 100644
index 0000000000..d65209932f
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject/0001-pjsua_stress-Only-use-backtrace-and-ucontext-with-gl.patch
@@ -0,0 +1,51 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 26 Nov 2026 15:30:12 -0800
+Subject: [PATCH] pjsua_stress: Only use backtrace() and ucontext with glibc
+
+PJSUA_STRESS_GLIBC was defined for every non-Android Linux build, so on
+musl the stress harness included <execinfo.h> and failed to build:
+
+  pjsua_stress.c:58:12: fatal error: 'execinfo.h' file not found
+
+Keep defining _GNU_SOURCE for Linux before the first libc include, but
+only enable the backtrace and ucontext code when __GLIBC__ is defined.
+
+Upstream-Status: Pending
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ pjsip/src/test/pjsua_stress.c | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/pjsip/src/test/pjsua_stress.c b/pjsip/src/test/pjsua_stress.c
+index b1d9056..0a887df 100644
+--- a/pjsip/src/test/pjsua_stress.c
++++ b/pjsip/src/test/pjsua_stress.c
+@@ -41,11 +41,7 @@
+  * backtrace() only from API 33 and its ucontext_t has a different shape.
+  * This harness runs on the Linux and macOS CI targets, so keep it off there.
+  */
+-#if defined(__linux__) && !defined(__ANDROID__)
+-#  define PJSUA_STRESS_GLIBC 1
+-#endif
+-
+-#if defined(PJSUA_STRESS_GLIBC) && !defined(_GNU_SOURCE)
++#if defined(__linux__) && !defined(__ANDROID__) && !defined(_GNU_SOURCE)
+ #  define _GNU_SOURCE 1
+ #endif
+ 
+@@ -54,6 +50,13 @@
+ #include <stdlib.h>
+ #include <string.h>
+ 
++/* backtrace() and the ucontext layout used below are glibc specific;
++ * musl and other Linux C libraries have neither <execinfo.h> nor
++ * REG_RIP, so only enable them for glibc (known after a libc include). */
++#if defined(__linux__) && !defined(__ANDROID__) && defined(__GLIBC__)
++#  define PJSUA_STRESS_GLIBC 1
++#endif
++
+ #if defined(PJSUA_STRESS_GLIBC) || defined(__APPLE__)
+ #  include <execinfo.h>
+ #  include <signal.h>
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.18.bb b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.18.bb
index 833d717dda..9bf4b4f2db 100644
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.18.bb
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.18.bb
@@ -12,7 +12,9 @@ SECTION = "libs"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/pjsip/pjproject.git;protocol=https;branch=master;tag=${PV}"
+SRC_URI = "git://github.com/pjsip/pjproject.git;protocol=https;branch=master;tag=${PV} \
+           file://0001-pjsua_stress-Only-use-backtrace-and-ucontext-with-gl.patch \
+           "
 SRCREV = "bd4a7189d83d94237b6f42f3b8274664dbe6ff94"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 
