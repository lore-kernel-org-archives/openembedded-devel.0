Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62042C25B50
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:47 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.2059.1674324087091825361
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n+OiIIR9;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id b10so8403465pjo.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msJRGgUQAOTVe5/aDUmfmhAepzeIs/VzdVmXe5J1u5g=;
        b=n+OiIIR9q0eLzoQ7SUYE/wak+b54YbDHXot2ynFU0r4KdhIW/l0hUgSHH6OjF3ZTk5
         LR8siHNpGEqQOg93cZlBp60t969rL3R/524mC06PXqX5rUlGNjDfSsaR950oG2ZE7ELu
         oVL1r4ynzpLNI5wdTIHZQY8l31iAatuOaOltKw3Am7Ta9Gb9UOqwBgPx9lLDgYec6dDf
         T6Uk6QVtwO55Ua+KZ1YI7hNSHeciDGCPH5d+49PiAVEvNDELoIa1oYWCcnkEMz1PzVe8
         K0C1dGzLVN2q8gkJd3xJOCs2rJTjawPNDAwP2dLeVoIR7Rk2e6TkiJby3OEbAh7IpUJU
         b62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msJRGgUQAOTVe5/aDUmfmhAepzeIs/VzdVmXe5J1u5g=;
        b=M8UgqUsxfSplLF2QupbGB636aXqK2SMCPOMySbH6iAAoRpHlMJKHgMb14fkBOoIKk1
         cHCJLmrlIE+/sZWxhzwuhjhDjhr7flh3J4SwI3NnaTPqSy9yreNO5vzGz+rkIv0u5e3c
         SpXQBsGa9dZH9bBihpbr/nFiQmGbJP2gZ7O5Gpvt7YdXXQvoq/GV4qe6nb27/Zz91NVC
         okJ5rUYB90y4eI1Punhq5ZbnQemNgWVB9Foi8O9MXtd13REeFEyNU1Lzc3yhSNQAJjEP
         r2CqgC0bIqkN074Bwjp0/cP1fiVE+AofyuUJ6fmEFgwhzlHwhIUSlRhPVyO0VS+zyqW4
         Cygw==
X-Gm-Message-State: AFqh2krMJZL1krEesWB59Wb4xb7eJSa+rzKly7ucxMp4mT7p64MO1+8S
	3Uzvd7CbCPMdh7+cxI5rh2IonpDTlebbmg==
X-Google-Smtp-Source: AMrXdXs9aCH0xECmRq8Vf90M9nKQjOlJbMVyye5IL08/e/osVT3JjPLRxL96onQGWmx7CGoS9FnQSQ==
X-Received: by 2002:a17:90a:4291:b0:229:f363:4a71 with SMTP id p17-20020a17090a429100b00229f3634a71mr9901930pjg.0.1674324096890;
        Sat, 21 Jan 2023 10:01:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 16/30] rtorrent: Update to latest tip of trunk
Date: Sat, 21 Jan 2023 10:01:07 -0800
Message-Id: <20230121180121.1229895-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100683

This is needed to get it working with latest compilers
always --enable-aligned so it does not have to perform runtime test
Drop the patch for removing AC_RUN_IFELSE as this macro is no longer
excercised in OE builds

Pin to c++14 for now, since std::binary_function is in use which is gone
in c++17 ( default with clang 16+ )

License-Update: Use GPL-2.0 or later identifier correctly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-run-code-while-configuring-package.patch | 104 ------------------
 .../rtorrent/rtorrent_git.bb                  |  19 ++--
 2 files changed, 8 insertions(+), 115 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/rtorrent/rtorrent/don-t-run-code-while-configuring-package.patch

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent/don-t-run-code-while-configuring-package.patch b/meta-oe/recipes-connectivity/rtorrent/rtorrent/don-t-run-code-while-configuring-package.patch
deleted file mode 100644
index 7d09f4382f..0000000000
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent/don-t-run-code-while-configuring-package.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-Using AC_RUN_IFELSE prevent people from configuring package
- for cross-compiling. Don't run code while configuring package.
-
-Upstream-Status: Pending
-Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
-
-Update for 0.9.8.
-Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
----
- scripts/checks.m4 | 34 ----------------------------------
- scripts/common.m4 | 28 ----------------------------
- 2 files changed, 62 deletions(-)
-
-diff --git a/scripts/checks.m4 b/scripts/checks.m4
-index 83be846..1af80f5 100644
---- a/scripts/checks.m4
-+++ b/scripts/checks.m4
-@@ -95,40 +95,6 @@ AC_DEFUN([TORRENT_CHECK_KQUEUE], [
- 
- AC_DEFUN([TORRENT_CHECK_KQUEUE_SOCKET_ONLY], [
-   AC_MSG_CHECKING(whether kqueue supports pipes and ptys)
--
--  AC_LINK_IFELSE([AC_LANG_SOURCE([
--      #include <fcntl.h>
--      #include <stdlib.h>
--      #include <unistd.h>
--      #include <sys/event.h>
--      #include <sys/time.h>
--      int main() {
--        struct kevent ev@<:@2@:>@, ev_out@<:@2@:>@;
--        struct timespec ts = { 0, 0 };
--        int pfd@<:@2@:>@, pty@<:@2@:>@, kfd, n;
--        char buffer@<:@9001@:>@;
--        if (pipe(pfd) == -1) return 1;
--        if (fcntl(pfd@<:@1@:>@, F_SETFL, O_NONBLOCK) == -1) return 2;
--        while ((n = write(pfd@<:@1@:>@, buffer, sizeof(buffer))) == sizeof(buffer));
--        if ((pty@<:@0@:>@=posix_openpt(O_RDWR | O_NOCTTY)) == -1) return 3;
--        if ((pty@<:@1@:>@=grantpt(pty@<:@0@:>@)) == -1) return 4;
--        EV_SET(ev+0, pfd@<:@1@:>@, EVFILT_WRITE, EV_ADD | EV_ENABLE, 0, 0, NULL);
--        EV_SET(ev+1, pty@<:@1@:>@, EVFILT_READ, EV_ADD | EV_ENABLE, 0, 0, NULL);
--        if ((kfd = kqueue()) == -1) return 5;
--        if ((n = kevent(kfd, ev, 2, NULL, 0, NULL)) == -1) return 6;
--        if (ev_out@<:@0@:>@.flags & EV_ERROR) return 7;
--        if (ev_out@<:@1@:>@.flags & EV_ERROR) return 8;
--        read(pfd@<:@0@:>@, buffer, sizeof(buffer));
--        if ((n = kevent(kfd, NULL, 0, ev_out, 2, &ts)) < 1) return 9;
--        return 0;
--      }
--      ])],
--    [
--      AC_MSG_RESULT(yes)
--    ], [
--      AC_DEFINE(KQUEUE_SOCKET_ONLY, 1, kqueue only supports sockets.)
--      AC_MSG_RESULT(no)
--    ])
- ])
- 
- AC_DEFUN([TORRENT_WITH_KQUEUE], [
-diff --git a/scripts/common.m4 b/scripts/common.m4
-index aaf005e..42fb016 100644
---- a/scripts/common.m4
-+++ b/scripts/common.m4
-@@ -152,38 +152,10 @@ dnl   Need to fix this so that it uses the stuff defined by the system.
- 
- AC_DEFUN([TORRENT_CHECK_EXECINFO], [
-   AC_MSG_CHECKING(for execinfo.h)
--
--  AC_COMPILE_IFELSE([AC_LANG_SOURCE([
--      #include <execinfo.h>
--      int main() { backtrace((void**)0, 0); backtrace_symbols((char**)0, 0); return 0;}
--      ])],
--    [
--      AC_MSG_RESULT(yes)
--      AC_DEFINE(USE_EXECINFO, 1, Use execinfo.h)
--    ], [
--      AC_MSG_RESULT(no)
--  ])
- ])
- 
- AC_DEFUN([TORRENT_CHECK_ALIGNED], [
-   AC_MSG_CHECKING(the byte alignment)
--
--  AC_LINK_IFELSE([AC_LANG_SOURCE([
--      #include <inttypes.h>
--      int main() {
--        char buf@<:@8@:>@ = { 0, 0, 0, 0, 1, 0, 0, 0 };
--	int i;
--        for (i = 1; i < 4; ++i)
--	  if (*(uint32_t*)(buf + i) == 0) return -1;
--	return 0;
--	}
--      ])],
--    [
--      AC_MSG_RESULT(none needed)
--    ], [
--      AC_DEFINE(USE_ALIGNED, 1, Require byte alignment)
--      AC_MSG_RESULT(required)
--  ])
- ])
- 
- 
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
index 7879324cc6..b4fe10cb1c 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
@@ -1,17 +1,14 @@
 SUMMARY = "Torrent client"
 HOMEPAGE = "http://libtorrent.rakshasa.no/"
-LICENSE = "GPL-2.0-only"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "libsigc++-2.0 curl cppunit libtorrent ncurses"
+DEPENDS = "libsigc++-2.0 curl cppunit libtool libtorrent ncurses"
 
-SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https \
-    file://don-t-run-code-while-configuring-package.patch \
-"
-# v0.9.8
-SRCREV = "6154d1698756e0c4842b1c13a0e56db93f1aa947"
+SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https"
+SRCREV = "d067bd802e44f0e6a747aabcc311ada2175fd550"
 
-PV = "0.9.8"
+PV = "0.9.8+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
@@ -21,6 +18,6 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 inherit autotools pkgconfig
 
-do_configure:prepend() {
-    (cd ${S}; ./autogen.sh; cd -)
-}
+EXTRA_AUTORECONF += "--exclude=aclocal"
+
+CXXFLAGS += "-std=gnu++14"
-- 
2.39.1


