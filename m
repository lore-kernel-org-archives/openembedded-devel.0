Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id F30A77F35E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2019 18:03:12 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id r22so2858953pgk.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2019 11:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mMT7vpL9G+dnO1/Zw4bjvIDi8O35wFI3GLKd1VE7mpY=;
	b=R8leq3Gpg2TOnXqxGkZ4DKsdtG89fGVigoBkr4onSl5i9/5bn1OsheFLL4uoIfWlg/
	IvVKIr4y9zjhUuZFXcxPFE5h9KwTcaQS8NjHka04ozfTRH6iyxq1KnCw45qman7meAfR
	KWFK91cdnvDxOhW3bPeZ7D5mcogrbEbwXKv+UwwkmmHDMsQAKeRxDPLrgnJbT9GCtk8s
	Hzxbn820RitsKwJpDlcSR7UQElGivTbOWIvY4ip9mAH1fZhVOEi0l2kmtLZDIrTTYe7x
	ejbSjRtWxNLBOaA6468G0Kn0WqAMMa8jvldFf18kDAEqIICcj5IRvJL7Xi8Q4uH8adHR
	RqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mMT7vpL9G+dnO1/Zw4bjvIDi8O35wFI3GLKd1VE7mpY=;
	b=IwDhd1N2jDT3w9gUyK/17zxMG/wE6spwKicvDWCMtLPDdH2Y2uA63MAKHVFUL6onMM
	Xrv/F9G7u9XZM7MG0U3aFvMf7uRADhUJIadP2pwCDKl7I53YJSSDTJQFL55bgwA9Vd92
	Li+fqM82Ho4l6Ujuzc9DeSx7gNOAt54sumIEHClm3JJTVUlogzqimkuAwZUms+xXs0tk
	d7U+0ktlm1VLyYewFaPsGmq8Y3PK28eo7a/KE03Fh41wTL7wk74mZ13CXDjYl3qHTWbB
	cX423grTCLVGIBlWI/DqizSY34sipU+OHHQ12YrFjvDM0X/GwF2AQ9Z2I4Px2zew/1g+
	SNZQ==
X-Gm-Message-State: APjAAAVvsQY4WmSl4yiFnNIiZRxFw1fs8sk+Y1OGpgUm+5U+E/sTQhKk
	i/YHieiXdAsst/IqaqCApQmK59+qtOU=
X-Google-Smtp-Source: APXvYqzrvB95pAoemUj8f8h7LBwLCbYSfdA/Z3yzGb4BmTe8T78GiUK3qQKnrPMrJwVzhvKKVrdmFQ==
X-Received: by 2002:a63:66c5:: with SMTP id
	a188mr109582557pgc.127.1564509792674; 
	Tue, 30 Jul 2019 11:03:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	f12sm59287293pgo.85.2019.07.30.11.03.09
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 30 Jul 2019 11:03:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Jul 2019 11:03:02 -0700
Message-Id: <20190730180302.30195-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] alsa-oss: Drop now not needed patch
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
X-List-Received-Date: Tue, 30 Jul 2019 18:03:13 -0000
Content-Transfer-Encoding: 8bit

Upstream has completely dropped including libio.h which makes it
redundant [1] moreover glibc is no longer shipping this header either

[1] https://github.com/alsa-project/alsa-oss/commit/8564df1c8d114de6ddbc082004c2a74719a46717

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../alsa/alsa-oss/libio.patch                 | 53 -------------------
 .../recipes-multimedia/alsa/alsa-oss_1.1.8.bb | 24 ---------
 2 files changed, 77 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/alsa/alsa-oss/libio.patch

diff --git a/meta-oe/recipes-multimedia/alsa/alsa-oss/libio.patch b/meta-oe/recipes-multimedia/alsa/alsa-oss/libio.patch
deleted file mode 100644
index 835b266014..0000000000
--- a/meta-oe/recipes-multimedia/alsa/alsa-oss/libio.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 54b1c2e27bf81f94c727b4923d4ed592110e2796 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sun, 29 May 2011 21:05:15 +0200
-
----
- alsa/stdioemu.c | 8 +++++++-
- configure.ac    | 6 ++++++
- 2 files changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/alsa/stdioemu.c b/alsa/stdioemu.c
-index f7f9ab5..b673fe3 100644
---- a/alsa/stdioemu.c
-+++ b/alsa/stdioemu.c
-@@ -37,7 +37,9 @@
- #endif
- 
- #include <stdio.h>
--
-+#ifdef HAVE_LIBIO_H
-+#include <libio.h>
-+#endif
- struct fd_cookie {
- 	int fd;
- };
-@@ -98,7 +100,11 @@ static FILE *fake_fopen(const char *path, const char *mode, int flags)
- 
- 	if (open_mode && fdc->fd > 0) {
- 		result = fopencookie (fdc,"w", fns);
-+#ifdef HAVE_FILENO
- 		result->_fileno = fdc->fd;		/* ugly patchy slimy kludgy hack */
-+#else
-+		result->__filedes = fdc->fd;
-+#endif
- 	}
- 	return result;
- }
-diff --git a/configure.ac b/configure.ac
-index 583b95f..60a1025 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -35,6 +35,12 @@ if test "$with_aoss" = "yes"; then
-   LIBS="$OLD_LIBS"
- fi
- 
-+AC_CHECK_HEADERS_ONCE([libio.h])
-+
-+AC_CHECK_MEMBER([struct _IO_FILE._fileno],
-+		[AC_DEFINE([HAVE_FILENO], [1],[Define if _fileno exists.])],
-+		[],[])
-+
- AC_OUTPUT(Makefile alsa/Makefile alsa/aoss alsa/aoss.old \
- 	  oss-redir/Makefile test/Makefile \
-           alsa/testaoss test/testaoss)
diff --git a/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb b/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb
index 46ab503169..67a24cf9d2 100644
--- a/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb
+++ b/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb
@@ -1,26 +1,3 @@
-# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
-# The following is the difference between the old and the new license text.
-# Please update the LICENSE value if needed, and summarize the changes in
-# the commit message via 'License-Update:' tag.
-# (example: 'License-Update: copyright years updated.')
-#
-# The changes:
-#
-# --- COPYING
-# +++ COPYING
-# @@ -2,7 +2,8 @@
-#  		       Version 2, June 1991
-#  
-#   Copyright (C) 1989, 1991 Free Software Foundation, Inc.
-# -                       59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
-# + 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA
-# +
-#   Everyone is permitted to copy and distribute verbatim copies
-#   of this license document, but changing it is not allowed.
-#  
-# 
-#
-
 SUMMARY = "Alsa OSS Compatibility Package"
 SECTION = "libs/multimedia"
 LICENSE = "GPLv2"
@@ -28,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ed055b4eff93da784176a01582e6ec1a"
 DEPENDS = "alsa-lib"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/oss-lib/alsa-oss-${PV}.tar.bz2 \
-    file://libio.patch \
 "
 SRC_URI[md5sum] = "9ec4bb783fdce19032aace086d65d874"
 SRC_URI[sha256sum] = "64adcef5927e848d2e024e64c4bf85b6f395964d9974ec61905ae4cb8d35d68e"
-- 
2.22.0


