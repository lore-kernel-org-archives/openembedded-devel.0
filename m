Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1U4yoY-0001of-KR
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Feb 2013 20:13:51 +0100
Received: by mail-ee0-f45.google.com with SMTP id b57so3379875eek.18
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2013 10:57:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=w+n9as+acPjp9SDfpX56JbdsYD4R8nTs7nwiTqUxFTQ=;
	b=IP1ciZm2MzTKlOLr+2nCxvquBd3zHhj+d/Fcl2EocmlIGorvvZurvHZJgjYgvs1Fbp
	qU2VQsOkK8rqFAKpATzBtDl+UxpjWAfcr6Dkm2SRkRns64iGD+G2uUsmF3HTY+PSRtxZ
	1Fd0VLSrbaExJ+ot1w752P6/pa1YSnWD9kACNuiy53W8z/bicB0VxqTgwhEv4zFN2AHj
	nXrFUot8RMCdPu5TCFWFgkmID5UOsryXzH/QqNvNLhJeEBUJ0N5ngSKu/TakFii2tpop
	to3jQX6hozrUUsZgJQe+KopH5XmOT1AvkHyHWttBJRAUqmQDcEQ5J5NqmcIXAjDsf582
	zd9A==
X-Received: by 10.14.194.195 with SMTP id m43mr53141946een.44.1360609040173;
	Mon, 11 Feb 2013 10:57:20 -0800 (PST)
Received: from localhost.localdomain (5-13-217-124.residential.rdsnet.ro.
	[5.13.217.124])
	by mx.google.com with ESMTPS id q5sm64034955eep.11.2013.02.11.10.57.18
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 10:57:19 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Feb 2013 20:57:06 +0200
Message-Id: <1360609028-8921-2-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1360609028-8921-1-git-send-email-andrei@gherzan.ro>
References: <1360609028-8921-1-git-send-email-andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQkvUQO94B5WoQ+0+NqaDmmE+G1v/m1W7TCOIJKisapyIyv2cAohbnDL/VbuPtwwFNEzxQkb
Subject: [meta-oe][PATCH 2/4] libtorrent: Integrated version 0.13.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Feb 2013 19:13:53 -0000

Add patch to avoid running AC_RUN_IFELSE code while configuring package.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../don-t-run-code-while-configuring-package.patch |   94 ++++++++++++++++++++
 .../libtorrent/libtorrent_0.13.3.bb                |   17 ++++
 2 files changed, 111 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/don-t-run-code-while-configuring-package.patch
 create mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.3.bb

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/don-t-run-code-while-configuring-package.patch b/meta-oe/recipes-connectivity/libtorrent/libtorrent/don-t-run-code-while-configuring-package.patch
new file mode 100644
index 0000000..79d4f29
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent/don-t-run-code-while-configuring-package.patch
@@ -0,0 +1,94 @@
+Using AC_RUN_IFELSE prevent people from configuring package for
+cross-compiling. Don't run code while configuring package.
+
+Upstream-Status: Pending
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+
+Index: libtorrent-0.13.3/scripts/checks.m4
+===================================================================
+--- libtorrent-0.13.3.orig/scripts/checks.m4	2012-05-14 14:17:04.000000000 +0300
++++ libtorrent-0.13.3/scripts/checks.m4	2013-02-10 15:28:37.414445524 +0200
+@@ -95,40 +95,6 @@
+
+ AC_DEFUN([TORRENT_CHECK_KQUEUE_SOCKET_ONLY], [
+   AC_MSG_CHECKING(whether kqueue supports pipes and ptys)
+-
+-  AC_RUN_IFELSE([AC_LANG_SOURCE([
+-      #include <fcntl.h>
+-      #include <stdlib.h>
+-      #include <unistd.h>
+-      #include <sys/event.h>
+-      #include <sys/time.h>
+-      int main() {
+-        struct kevent ev@<:@2@:>@, ev_out@<:@2@:>@;
+-        struct timespec ts = { 0, 0 };
+-        int pfd@<:@2@:>@, pty@<:@2@:>@, kfd, n;
+-        char buffer@<:@9001@:>@;
+-        if (pipe(pfd) == -1) return 1;
+-        if (fcntl(pfd@<:@1@:>@, F_SETFL, O_NONBLOCK) == -1) return 2;
+-        while ((n = write(pfd@<:@1@:>@, buffer, sizeof(buffer))) == sizeof(buffer));
+-        if ((pty@<:@0@:>@=posix_openpt(O_RDWR | O_NOCTTY)) == -1) return 3;
+-        if ((pty@<:@1@:>@=grantpt(pty@<:@0@:>@)) == -1) return 4;
+-        EV_SET(ev+0, pfd@<:@1@:>@, EVFILT_WRITE, EV_ADD | EV_ENABLE, 0, 0, NULL);
+-        EV_SET(ev+1, pty@<:@1@:>@, EVFILT_READ, EV_ADD | EV_ENABLE, 0, 0, NULL);
+-        if ((kfd = kqueue()) == -1) return 5;
+-        if ((n = kevent(kfd, ev, 2, NULL, 0, NULL)) == -1) return 6;
+-        if (ev_out@<:@0@:>@.flags & EV_ERROR) return 7;
+-        if (ev_out@<:@1@:>@.flags & EV_ERROR) return 8;
+-        read(pfd@<:@0@:>@, buffer, sizeof(buffer));
+-        if ((n = kevent(kfd, NULL, 0, ev_out, 2, &ts)) < 1) return 9;
+-        return 0;
+-      }
+-      ])],
+-    [
+-      AC_MSG_RESULT(yes)
+-    ], [
+-      AC_DEFINE(KQUEUE_SOCKET_ONLY, 1, kqueue only supports sockets.)
+-      AC_MSG_RESULT(no)
+-    ])
+ ])
+
+ AC_DEFUN([TORRENT_WITH_KQUEUE], [
+Index: libtorrent-0.13.3/scripts/common.m4
+===================================================================
+--- libtorrent-0.13.3.orig/scripts/common.m4	2012-05-14 14:17:04.000000000 +0300
++++ libtorrent-0.13.3/scripts/common.m4	2013-02-10 15:27:55.874446741 +0200
+@@ -222,38 +222,10 @@
+
+ AC_DEFUN([TORRENT_CHECK_EXECINFO], [
+   AC_MSG_CHECKING(for execinfo.h)
+-
+-  AC_RUN_IFELSE([AC_LANG_SOURCE([
+-      #include <execinfo.h>
+-      int main() { backtrace((void**)0, 0); backtrace_symbols((char**)0, 0); return 0;}
+-      ])],
+-    [
+-      AC_MSG_RESULT(yes)
+-      AC_DEFINE(USE_EXECINFO, 1, Use execinfo.h)
+-    ], [
+-      AC_MSG_RESULT(no)
+-  ])
+ ])
+
+ AC_DEFUN([TORRENT_CHECK_ALIGNED], [
+   AC_MSG_CHECKING(the byte alignment)
+-
+-  AC_RUN_IFELSE([AC_LANG_SOURCE([
+-      #include <inttypes.h>
+-      int main() {
+-        char buf@<:@8@:>@ = { 0, 0, 0, 0, 1, 0, 0, 0 };
+-	int i;
+-        for (i = 1; i < 4; ++i)
+-	  if (*(uint32_t*)(buf + i) == 0) return -1;
+-	return 0;
+-	}
+-      ])],
+-    [
+-      AC_MSG_RESULT(none needed)
+-    ], [
+-      AC_DEFINE(USE_ALIGNED, 1, Require byte alignment)
+-      AC_MSG_RESULT(required)
+-  ])
+ ])
+
+
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.3.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.3.bb
new file mode 100644
index 0000000..ecc254f
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.13.3.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "libTorrent is a BitTorrent library written in C++ for *nix, \
+with a focus on high performance and good code."
+HOMEPAGE = "http://libtorrent.rakshasa.no/"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
+
+DEPENDS = "libsigc++-2.0 openssl cppunit"
+
+SRC_URI = "http://libtorrent.rakshasa.no/downloads/${PN}-${PV}.tar.gz \
+    file://don-t-run-code-while-configuring-package.patch \
+    "
+
+SRC_URI[md5sum] = "e94f6c590bb02aaf4d58618f738a85f2"
+SRC_URI[sha256sum] = "34317d6783b7f8d0805274c9467475b5432a246c0de8e28fc16e3b0b43f35677"
+
+inherit autotools
+
-- 
1.7.9.5



