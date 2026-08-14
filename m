Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE3BAC5CFCF
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 14:30:12 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14305.1786717803946365364
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 07:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TN/rLjUX;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so749308f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 07:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786717802; x=1787322602; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tIv9DWygPPo4aQsIEHzKLXyAmHcLQowozBTzKaKa7b4=;
        b=TN/rLjUXnxRmvRYCyVZrdpnparFn5PNhY95lt5dovESTVADCLIn+cAlam4cYS2TwaY
         fUDvmLomqeF6+K/8SlB+GunYlV3H2Re/fu9E96vuj1e81esDqC5qf5AyqMq8Png9WDws
         9uyv739xwhVp0MQzUSW7JHqaiFLEyujaTUUx5yWTkleKAahk+Up1UMKV+z8d3RQaGqpx
         292Iy8tMy1U2oq+SA9oF9OoL8tuSLUiRhjROj/XR9VyJDCkdM7FeMMcFQQiHHJOLwSuB
         XMF4MEXxh5Kv7e4zuCylNL5r/h5VXYnDphykpVETBPjiiwrc083qQZFYm3l9UUwwSPVX
         yHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786717802; x=1787322602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tIv9DWygPPo4aQsIEHzKLXyAmHcLQowozBTzKaKa7b4=;
        b=ftkN7vPONRmyEpDuTqrs2gF+EUQ4yFLedRUNCflY/OSvz/Kmo6j4s90uRwQjlvrlQH
         gjHooQzZWfhCuJz1ALHDu8W3lvm+Pf/SpaPqSUYGrv0EHD8/NUUYQRnNXkHX4HOYLFUV
         +kmTxMvnqIkOPIAFJlmF3rgRPO9wOt3+OUw0/bDYjZhBvVq+C9xsFA7heXwjApzJ2DZ5
         TWfG/pT+HNkzCOD4LQZbR/YIMw+OGQPsfnKX/sqRxE2184/07RqwXURIHHEUtcurVdk0
         g0DSemk1LIQPtqPKuGiJkKVtlTuQuZr3823BU1AGliVMnTIC3ke+4s8+NDQAZOiJDlnG
         5Ngg==
X-Gm-Message-State: AOJu0YyD5pNwZv0HmJP3sgHAgITKznFlw29QDElPAKuJ66wVXlxFPMo+
	4uL3cDFcasBbVqMMQPfoguUa8xU6eB5mYwJR4MbofxNmHtGuGjHdTyUOcRfrpw==
X-Gm-Gg: AR+sD10Nqru8boVOQCFi5fenkhkF26P9twMxgpOrUwaKPRomHdq/FCT/YsfXQBs+ERp
	7tQCPQ1rUWO3Mw50yWRy39UZteDuzkrNtMVHcB3RPMrEwYtRN5ZnRuaHglDnR6uRxOZkmcIcoZK
	x6E0APZzrchpWMVJ5pRgk6Kw7azHO8zUZF81+VKD9VbPfsEpwqrc5FbSjJl1hA54vKEUIvZNUgg
	LtqPy+qQg2Ts+Rc5eJ7nFFyQmBV/PWvdXpR2LfDRzZ2odgqLfpOYekDxZqBEKMkynFkw33Y7gY7
	c1eUbG5EpACZ7d5tsWDuDEdS8yopa9a9032TTxwcMb4ePTBT+yGOMijQoidQeDszWlw20dAKJpR
	AMxoEY9qKUSZDNqXorLiBW7Mj5e1LsLcpPcgEXHDlLr/rxOI8AVNGMr/wxZeemJpq5Pw0POyDn4
	yD/H9c1xEOphyhmoxzy9icT5d3fPHxdHPGwIjy5z3wFaKEV1x+W6ie8AwwS10cqQRnASIoY+zmh
	Bo5fcjRVYWXQyBW7eosTrpYCnjZT+VxzYY/62CZnckPVt1cU6Hl6Jw2rBRVXI2weYM=
X-Received: by 2002:a05:6000:26c4:b0:47f:9283:1fb3 with SMTP id ffacd0b85a97d-481606d2962mr9090117f8f.0.1786717802034;
        Fri, 14 Aug 2026 07:30:02 -0700 (PDT)
Received: from [192.168.5.15] (host81-148-255-151.range81-148.btcentralplus.com. [81.148.255.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f20058fsm9973661f8f.4.2026.08.14.07.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 07:30:01 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 14 Aug 2026 15:29:46 +0100
Subject: [meta-oe][PATCH 2/2] cpufrequtils: fix do_install, drop the
 toolchain patch, add nls PACKAGECONFIG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-cpufrequtils-v1-2-5ac5e77bf5ff@gmail.com>
References: <20260814-cpufrequtils-v1-0-5ac5e77bf5ff@gmail.com>
In-Reply-To: <20260814-cpufrequtils-v1-0-5ac5e77bf5ff@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 14:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129051

do_install ran make with -e, which gives the environment precedence over
the makefile's own assignments. Every CPPFLAGS and CFLAGS use in the
makefile is +=, seeded from the environment, so -e discarded all of the
makefile's additions: the CPPFLAGS += defining PACKAGE, PACKAGE_BUGREPORT
and VERSION, the conditional -DNLS, -pipe and $(WARNINGS). utils/info.c
and utils/set.c then failed to build with "'PACKAGE' undeclared" while
relinking cpufreq-info and cpufreq-set, which install: pulls in via all:.
Dropping -e also makes do_install and do_compile agree on flags, where
the install-time relink previously produced binaries built differently
from the ones do_compile had made.

-e predates 0001-dont-unset-cflags.patch, back when the makefile assigned
CC/LD/AR/STRIP/RANLIB absolutely and -e was the only way to override them.
That patch is dropped here in favour of setting CC on the make command
line, which outranks a makefile assignment without needing a patch at all.
CC is the only one of those variables the makefile ever references: LD, AR
and RANLIB are assigned but never used, and STRIP only feeds STRIPCMD,
which the recipe already overrides. The patch had carried
Upstream-Status: Pending since 2012 against a project whose last commit
was in 2011.

NLS becomes a PACKAGECONFIG rather than an inline USE_NLS expression so it
can be set per-recipe, defaulting from USE_NLS so existing behaviour is
unchanged. gettext-native is named explicitly because gettext.bbclass
substitutes gettext-minimal-native when USE_NLS is no, and that has no
xgettext/msgmerge for the update-gmo target this enables. The gettext
inherit becomes conditional on the same PACKAGECONFIG, deferred because it
reads a value that does not exist yet at that point in the parse.

AI-Generated: Claude Opus 5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../cpufrequtils/0001-dont-unset-cflags.patch      | 32 ----------------------
 .../recipes-bsp/cpufrequtils/cpufrequtils_008.bb   | 17 +++++-------
 2 files changed, 7 insertions(+), 42 deletions(-)

diff --git a/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch b/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
deleted file mode 100644
index 72f480100030..000000000000
--- a/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Pending
-
---- git.old/Makefile	2012-04-17 13:29:46.280435340 +0200
-+++ git/Makefile	2012-04-17 13:31:13.664433470 +0200
-@@ -77,17 +77,7 @@ INSTALL_PROGRAM = ${INSTALL}
- INSTALL_DATA  = ${INSTALL} -m 644
- INSTALL_SCRIPT = ${INSTALL_PROGRAM}
- 
--# If you are running a cross compiler, you may want to set this
--# to something more interesting, like "arm-linux-".  If you want
--# to compile vs uClibc, that can be done here as well.
--CROSS = #/usr/i386-linux-uclibc/usr/bin/i386-uclibc-
--CC = $(CROSS)gcc
--LD = $(CROSS)gcc
--AR = $(CROSS)ar
--STRIP = $(CROSS)strip
--RANLIB = $(CROSS)ranlib
--HOSTCC = gcc
--
-+HOSTCC = $(BUILD_CC)
- 
- # Now we set up the build system
- #
-@@ -95,7 +85,7 @@ HOSTCC = gcc
- # set up PWD so that older versions of make will work with our build.
- PWD = $(shell pwd)
- 
--export CROSS CC AR STRIP RANLIB CFLAGS LDFLAGS LIB_OBJS
-+export CFLAGS LDFLAGS LIB_OBJS
- 
- # check if compiler option is supported
- cc-supports = ${shell if $(CC) ${1} -S -o /dev/null -xc /dev/null > /dev/null 2>&1; then echo "$(1)"; fi;}
diff --git a/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb b/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
index 4df67ca3eaec..0db24a82c3e1 100644
--- a/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
+++ b/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "To make access to the Linux kernel cpufreq subsystem easier for users and cpufreq userspace tools, a cpufrequtils package was created"
 
-inherit gettext
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'nls', 'gettext', '', d)}
 
 DEPENDS = "libtool-cross"
 
@@ -10,27 +10,24 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 SRCREV = "a2f0c39d5f21596bb9f5223e895c0ff210b265d0"
 PV .= "+git"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/cpufreq/cpufrequtils.git;branch=master;protocol=https \
-           file://0001-dont-unset-cflags.patch \
-"
+SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/cpufreq/cpufrequtils.git;branch=master;protocol=https"
 
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS = "1"
 
-EXTRA_OEMAKE:append = " ${@['', 'NLS=false']['${USE_NLS}' == 'no']} "
-
-
-
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-EXTRA_OEMAKE = "V=1 CROSS=${TARGET_PREFIX} STRIPCMD=echo 'CP=cp'"
+PACKAGECONFIG ??= "${@oe.utils.conditional('USE_NLS', 'no', '', 'nls', d)}"
+PACKAGECONFIG[nls] = "NLS=true,NLS=false,gettext-native"
+
+EXTRA_OEMAKE = "V=1 CROSS=${TARGET_PREFIX} CC='${CC}' STRIPCMD=echo 'CP=cp' ${PACKAGECONFIG_CONFARGS}"
 
 do_compile() {
 	oe_runmake
 }
 
 do_install() {
-	oe_runmake -e install DESTDIR=${D}
+	oe_runmake install DESTDIR=${D}
 	rm -f ${D}${libdir}/libcpufreq.so.0 ${D}${libdir}/libcpufreq.so
 	ln -s libcpufreq.so.0.0.0 ${D}${libdir}/libcpufreq.so.0
 	ln -s libcpufreq.so.0.0.0 ${D}${libdir}/libcpufreq.so

-- 
2.43.0


