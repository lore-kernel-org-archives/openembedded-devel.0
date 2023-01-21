Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC6BC54EB4
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:37 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.2062.1674324091113259352
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H1AcdaaR;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id y3-20020a17090a390300b00229add7bb36so7760847pjb.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJ74psF7aDUpUuGrmjXD0H4mTPGaLMagGC1d+jCjYdo=;
        b=H1AcdaaRKU8XWVfrAQ+Evn9J58s86GEX4z/604hJHYAqDVgvi03fV3dvc8kUVNJlBO
         Uy10KpbWD9x/Fnp4FYPcUir0ZoC3PFhG9VPeLEjIDWgVQXaJcNXL6ecri2mDxhCkaxTb
         loKM3xz7eXMOVcepg09BNc545c7J64gU/Mk9tOOI5gZxJq2dpmSzq3ZMKkghVYiCumVr
         yjjAVCMadjNS2NQkPIeEgSKsFE/cml40hQmqosCyn7/VvXPC5MOPlnnT2IqRGxmcyco1
         TatNEu7RqF90o1AOWaXovLl7ClHuidrchmEGR0efmrCBb9Vc5kUZd/ZPqa3mDXHuENK5
         KFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJ74psF7aDUpUuGrmjXD0H4mTPGaLMagGC1d+jCjYdo=;
        b=fIic0DGgSgei6EWHRxai5gGKCrmWX40qIpaww/7vuRcz9PA2GXMr42DwFVlPAIPSpu
         0vszvSyYKsB7RIap+Pw+/Ol6h6CdPhQ1ewYv4bVA5TtKyMg3xNi0xr/HTDie4cXL6oM0
         JuMNk/3OpMEhf8D+2EZ2MkHbOHQrWqRHcz1CZpbSPrD+DwHGtMGX5vcpOt7mIrd1ueZp
         JdxYIflRHOA0XWBx64/CmvkgpYpYMfdzNjhBYN+fPErfWYZjUU+qlfmeaBSFx36WvLg2
         kLy2vaaYBBqtOcplMharjWGO3mdTZG/FriN5VTdof1Olk4Eqv7PNRY8pG2ScDyV8IDB9
         DXXw==
X-Gm-Message-State: AFqh2koWNJP1CshPHi5YG0uauKiktQI0FUt+i38v+j/xxzVoGH7air3G
	4LpnZKygR/2RWO2ijALrXhzmfrtEwXd/vg==
X-Google-Smtp-Source: AMrXdXswfo1gsBJpPqtuE/SDuaUK6iy+HbIEbBS+6n/wJLc1ehbyIVY/vVYdFO/Qfm7QYxALpd0a6Q==
X-Received: by 2002:a17:90b:1c0c:b0:22b:b824:827c with SMTP id oc12-20020a17090b1c0c00b0022bb824827cmr5574422pjb.48.1674324088867;
        Sat, 21 Jan 2023 10:01:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 06/30] libtorrent: Update to tip of trunk
Date: Sat, 21 Jan 2023 10:00:57 -0800
Message-Id: <20230121180121.1229895-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100675

Drop cross compile patch as we do not need it anymore since we now
use --enable-aligned

License-Update: Correctly mark the license as GPL-2.0+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-run-code-while-configuring-package.patch | 28 -------------------
 .../libtorrent/libtorrent_git.bb              | 18 +++++-------
 2 files changed, 7 insertions(+), 39 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/don-t-run-code-while-configuring-package.patch

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/don-t-run-code-while-configuring-package.patch b/meta-oe/recipes-connectivity/libtorrent/libtorrent/don-t-run-code-while-configuring-package.patch
deleted file mode 100644
index 8d8867aea7..0000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/don-t-run-code-while-configuring-package.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Using AC_RUN_IFELSE prevent people from configuring package for
-cross-compiling. Don't run code while configuring package.
-
-Upstream-Status: Pending
-Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
-
-Index: git/scripts/common.m4
-===================================================================
---- git.orig/scripts/common.m4
-+++ git/scripts/common.m4
-@@ -153,7 +153,7 @@ dnl   Need to fix this so that it uses t
- AC_DEFUN([TORRENT_CHECK_EXECINFO], [
-   AC_MSG_CHECKING(for execinfo.h)
- 
--  AC_COMPILE_IFELSE([AC_LANG_SOURCE([
-+  AC_LINK_IFELSE([AC_LANG_SOURCE([
-       #include <execinfo.h>
-       int main() { backtrace((void**)0, 0); backtrace_symbols((char**)0, 0); return 0;}
-       ])],
-@@ -168,7 +168,7 @@ AC_DEFUN([TORRENT_CHECK_EXECINFO], [
- AC_DEFUN([TORRENT_CHECK_ALIGNED], [
-   AC_MSG_CHECKING(the byte alignment)
- 
--  AC_RUN_IFELSE([AC_LANG_SOURCE([
-+  AC_LINK_IFELSE([AC_LANG_SOURCE([
-       #include <inttypes.h>
-       int main() {
-         char buf@<:@8@:>@ = { 0, 0, 0, 0, 1, 0, 0, 0 };
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
index 28a3e1e77a..50096cfdbc 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
@@ -1,36 +1,32 @@
 DESCRIPTION = "libTorrent is a BitTorrent library written in C++ for *nix, \
 with a focus on high performance and good code."
 HOMEPAGE = "http://libtorrent.rakshasa.no/"
-LICENSE = "GPL-2.0-only"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "zlib libsigc++-2.0 openssl cppunit"
 
-SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https \
-           file://don-t-run-code-while-configuring-package.patch \
-           "
-SRCREV = "756f70010779927dc0691e1e722ed433d5d295e1"
+SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https"
+SRCREV = "e60f222241319aaae482789517ad00ae9344bd13"
 
 CVE_CHECK_IGNORE += "\
     CVE-2009-1760 \
 "
 
-PV = "0.13.8"
+PV = "0.13.8+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-PACKAGECONFIG ??= "instrumentation"
+
+PACKAGECONFIG ??= "instrumentation aligned"
 
 PACKAGECONFIG:remove:mipsarch = "instrumentation"
 PACKAGECONFIG:remove:powerpc = "instrumentation"
 PACKAGECONFIG:remove:riscv32 = "instrumentation"
 
 PACKAGECONFIG[instrumentation] = "--enable-instrumentation,--disable-instrumentation,"
+PACKAGECONFIG[aligned] = "--enable-aligned,--disable-aligned,"
 
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--with-zlib=${STAGING_EXECPREFIXDIR}"
-
-do_configure:prepend() {
-    (cd ${S}; ./autogen.sh; cd -)
-}
-- 
2.39.1


