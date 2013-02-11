Received: from mail-ea0-f169.google.com ([209.85.215.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1U4yoZ-0001oh-Qz
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Feb 2013 20:13:51 +0100
Received: by mail-ea0-f169.google.com with SMTP id d13so2886428eaa.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2013 10:57:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=gUACcWPyoh7Rr32ZPhSsl9aQCHRkdxBaZuqehUwrdcY=;
	b=NRqr/Hl+qMwsoyg62b/eKACZBkmJuKCHJ1cHiBNRuuLqvVbUYEFckQb3QrD8MtJm+C
	DwW4ZLBVtD/5J7v3c76TkFA8TwztbDaw+Ab9Q2/g1Apsm8kJFKdaSDRvQPCDcY+CABGy
	gc76BzUrTiCO6Zk3qX7I9sVfPtbOZnhcsUPMQg5DvrP0RBS6jdURZvEKhIUtMAjBtwCC
	4REVIHlB8vDhAYOfqP6/0wT6xmc8iLn+i1DmEKwBkJXr7cWKkIDl9LjFt3cIaVgCAaCn
	CCCnDzGvHNReurRmwcJuk/XQMcZRQhhEkUEPH0S43MSP2hpM8TwMpcLKb1Kr3QXaB3WX
	zPtQ==
X-Received: by 10.14.225.133 with SMTP id z5mr53240089eep.15.1360609041643;
	Mon, 11 Feb 2013 10:57:21 -0800 (PST)
Received: from localhost.localdomain (5-13-217-124.residential.rdsnet.ro.
	[5.13.217.124])
	by mx.google.com with ESMTPS id q5sm64034955eep.11.2013.02.11.10.57.20
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 10:57:21 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Feb 2013 20:57:07 +0200
Message-Id: <1360609028-8921-3-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1360609028-8921-1-git-send-email-andrei@gherzan.ro>
References: <1360609028-8921-1-git-send-email-andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQkkNRfKKoYXSrOR7G/zNkOt/8rqQ5nX1U2wOMpxet47HsX/LHEgIuunIx4MFPOwXk3qaGLL
Subject: [meta-oe][PATCH 3/4] rtorrent: Integrated version 0.9.3
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
X-List-Received-Date: Mon, 11 Feb 2013 19:13:53 -0000

Add patch to avoid running AC_RUN_IFELSE code while configuring package.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../don-t-run-code-while-configuring-package.patch |   94 ++++++++++++++++++++
 .../rtorrent/rtorrent_0.9.3.bb                     |   16 ++++
 2 files changed, 110 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/rtorrent/rtorrent/don-t-run-code-while-configuring-package.patch
 create mode 100644 meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent/don-t-run-code-while-configuring-package.patch b/meta-oe/recipes-connectivity/rtorrent/rtorrent/don-t-run-code-while-configuring-package.patch
new file mode 100644
index 0000000..79d4f29
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent/don-t-run-code-while-configuring-package.patch
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
diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb
new file mode 100644
index 0000000..b460444
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.9.3.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Torrent client"
+HOMEPAGE = "http://libtorrent.rakshasa.no/"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+DEPENDS = "libsigc++-2.0 curl cppunit libtorrent"
+
+SRC_URI = "http://libtorrent.rakshasa.no/downloads/${PN}-${PV}.tar.gz \
+    file://don-t-run-code-while-configuring-package.patch \
+    "
+
+SRC_URI[md5sum] = "0bf2f262faa8c8c8d3b11ce286ea2bf2"
+SRC_URI[sha256sum] = "9e93ca41beb1afe74ad7ad8013e0d53ae3586c9b0e97263d722f721535cc7310"
+
+inherit autotools
+
-- 
1.7.9.5



