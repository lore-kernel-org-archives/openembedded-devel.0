Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5800F79034
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 21:02:32 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id i26-v6so4077550pfo.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2018 14:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tMvxzMxjsuJ3Cy8rbLzNlCOHtDfN9JGhtnutPD1x7Ww=;
	b=C9sH3athhDF8dkM/m/spEzRRHwnuYhejk1TfsU4EpDVqabHDDcnZMprwT8+blpefgF
	EerERq0lt7p8H/zynay+/oLkOYURrQ5NX20YvFNc3r88zyqDOrogs4bbFwp3c7oJWhAl
	LPPoT0yiRHYxYs3elIrP/vaGmu+FCpRUts3N0LkEXtBe+J+AiOEF/F9devwJoqDLizi4
	j2Q0OWWMZ8rxaGl5QXCiY1RPtbFrJBNHVALZ+BA1HyVp9Q/LEbaZ42+buXLbqF5S/AVL
	69vX/D5/JFdRo2NWHU3DVZcYcoCWIdLyIs+Sx9uU+I7/7CrsP9wGm001VaI8G36wS++7
	EBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tMvxzMxjsuJ3Cy8rbLzNlCOHtDfN9JGhtnutPD1x7Ww=;
	b=U897Ilz8AoK3vQiSA64aNL5syAlLYtcGG9/jxFwlfZH4He3qqvVlzBPs07v/VMu1jS
	PWVlksdXDuFuQ9Ps8euBooFCRwgfzNqTaFR+FMPYfYj05O5e9saPpPSi6LgOZTkeW1If
	i6jJ3QlMK+Kqdnfx3NBoeZsR5UEdvgV+Q2RDOcN4bEnSmQ8wgZu7aEfsaaLPgPcUpehB
	e/iU74xCYDgxlfKs53pM+S61pnsEXK1EbcZqfTHt1jFrb33qwdBWF1cIey5KNzO6Tb4i
	Z70myyl1TuupNLZ7H3cHV+ADtytpFdd8jOswc8RIN3s3HhXRjmbXYAfPQ5+ZjMEMNXxx
	eROg==
X-Gm-Message-State: APzg51DZ8YWxMXDVIBbBu6VEeqjAxlwMLhZCgfm2pyPqWslnFPi6cLUr
	v5Qt5Xyg0ZkXBeQpFlJl8CZD2mcJ
X-Google-Smtp-Source: ANB0Vdbb6UybWCSi3uyFpAhhQUWV4CZjc05nL8mRmOh9bfr4KXYBOOd4B8NnUI72CJULbAHvOOcX+w==
X-Received: by 2002:a63:c544:: with SMTP id
	g4-v6mr18722368pgd.113.1536181352974; 
	Wed, 05 Sep 2018 14:02:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	e26-v6sm3689411pfi.70.2018.09.05.14.02.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 14:02:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2018 14:02:14 -0700
Message-Id: <20180905210224.21225-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180905210224.21225-1-raj.khem@gmail.com>
References: <20180905210224.21225-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 02/12] libtorrent: Upgrade to latest 0.13.7+master
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
X-List-Received-Date: Wed, 05 Sep 2018 21:02:32 -0000

* Fixes build with OpenSSL 1.1.x
* Adjust patches to rebase on top of current master

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-run-code-while-configuring-package.patch | 98 +++----------------
 .../libtorrent/libtorrent_git.bb              |  4 +-
 2 files changed, 18 insertions(+), 84 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/don-t-run-code-while-configuring-package.patch b/meta-oe/recipes-connectivity/libtorrent/libtorrent/don-t-run-code-while-configuring-package.patch
index 79d4f29fab..8d8867aea7 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/don-t-run-code-while-configuring-package.patch
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent/don-t-run-code-while-configuring-package.patch
@@ -4,91 +4,25 @@ cross-compiling. Don't run code while configuring package.
 Upstream-Status: Pending
 Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
 
-Index: libtorrent-0.13.3/scripts/checks.m4
+Index: git/scripts/common.m4
 ===================================================================
---- libtorrent-0.13.3.orig/scripts/checks.m4	2012-05-14 14:17:04.000000000 +0300
-+++ libtorrent-0.13.3/scripts/checks.m4	2013-02-10 15:28:37.414445524 +0200
-@@ -95,40 +95,6 @@
-
- AC_DEFUN([TORRENT_CHECK_KQUEUE_SOCKET_ONLY], [
-   AC_MSG_CHECKING(whether kqueue supports pipes and ptys)
--
--  AC_RUN_IFELSE([AC_LANG_SOURCE([
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
-Index: libtorrent-0.13.3/scripts/common.m4
-===================================================================
---- libtorrent-0.13.3.orig/scripts/common.m4	2012-05-14 14:17:04.000000000 +0300
-+++ libtorrent-0.13.3/scripts/common.m4	2013-02-10 15:27:55.874446741 +0200
-@@ -222,38 +222,10 @@
-
+--- git.orig/scripts/common.m4
++++ git/scripts/common.m4
+@@ -153,7 +153,7 @@ dnl   Need to fix this so that it uses t
  AC_DEFUN([TORRENT_CHECK_EXECINFO], [
    AC_MSG_CHECKING(for execinfo.h)
--
--  AC_RUN_IFELSE([AC_LANG_SOURCE([
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
+ 
+-  AC_COMPILE_IFELSE([AC_LANG_SOURCE([
++  AC_LINK_IFELSE([AC_LANG_SOURCE([
+       #include <execinfo.h>
+       int main() { backtrace((void**)0, 0); backtrace_symbols((char**)0, 0); return 0;}
+       ])],
+@@ -168,7 +168,7 @@ AC_DEFUN([TORRENT_CHECK_EXECINFO], [
  AC_DEFUN([TORRENT_CHECK_ALIGNED], [
    AC_MSG_CHECKING(the byte alignment)
--
+ 
 -  AC_RUN_IFELSE([AC_LANG_SOURCE([
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
++  AC_LINK_IFELSE([AC_LANG_SOURCE([
+       #include <inttypes.h>
+       int main() {
+         char buf@<:@8@:>@ = { 0, 0, 0, 0, 1, 0, 0, 0 };
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
index 92e65289a9..b2dffcdb91 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
@@ -11,9 +11,9 @@ SRC_URI = "git://github.com/rakshasa/libtorrent \
            file://0001-implement-64bit-atomic-for-mips.patch \
            file://0001-Define-64bit-atomic-helpers-for-ppc-32-bit.patch \
            "
-SRCREV = "c167c5a9e0bcf0df23ae5efd91396aae0e37eb87"
+SRCREV = "074f6ec51a2e4bc5c6140b4dad13c9bb56f3f0dc"
 
-PV = "0.13.6+git${SRCPV}"
+PV = "0.13.7+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.18.0


