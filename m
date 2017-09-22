Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2E4ED783A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 17:58:05 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id i23so739986pfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 10:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iO4ly2BRfT3y/IQiY2W4CECAYvYGu0XyOFJKGUt+jJA=;
	b=qUieuymrB4j665gU7KDTcqkEGj4bwF23ipFay8v/Q1fQySmBzpv7GakjFsyhBMLO0E
	mI1tyDukWep7p2XlLd6qDTZtK5aDwiG28bJsH93qIUGj9yvYWxlp9WPfzLQiIaPxVaEv
	ucsRuFTEzmSz8lcxdxcyxfq0O5ma2ItT5ge5SVRClh27ZBha+UcOBIBlWB0bPqTRCDcQ
	yDG4CaCJJbLNeAWJVD94iFkS67SOvdHgyKl9r1JilVyW7KgorUC8zmPHWXVJZvwcZHIa
	V1DP1iUu38oUzog3V6cWPYPhBdOimVGT2+5E6S+y7L+1EdvKYmxGGSWiEcMn5sDH4hRb
	LCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iO4ly2BRfT3y/IQiY2W4CECAYvYGu0XyOFJKGUt+jJA=;
	b=ie4xmjCBSNjTI+aFGLbrtkeS9TPOXJp6WWoXmyu8wGR0WbgiEC9UhRt3UNmfLOrC/C
	/mca62StG/jC9QcJsWNJwtp3jDB4TySPXuNQvggcD+D49a9x1CtdLpTTStobbHXuZzk9
	qxrRqpDy0Yb0O6CsWO0DpGGxjzWaXBhBl+O631N8seUl4jGI6OqRShTcZKoR0zCttxik
	YbEcNiXB8ZTK4KUrh2Nwk/vNIq2DPg8udz5qeLcq6eZEA2MMmyb3vNt8+NwjwnEaRrY/
	GyOgDWSDoz0cxaXlTMjKZh4FAcj34u/PoOWqUF2nI/Fm351VSMjHlRGCdnfriV3V+3Eq
	KziA==
X-Gm-Message-State: AHPjjUi5CjxNaRqxyVgMR8ufz0EFgaUb/gyJ4mJLDzD16b+CbK22jRNt
	En3MBn7di91Duz+eT3E9Ww07Mw==
X-Google-Smtp-Source: AOwi7QDj1fmuW6WXfyNz19hzlcVbG0VguK/qLr8CNPhwzRp5GuAMBgorBdyN2Kj+IoTWiBxESC2aWw==
X-Received: by 10.99.95.71 with SMTP id t68mr10052477pgb.432.1506103086482;
	Fri, 22 Sep 2017 10:58:06 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::e57f])
	by smtp.gmail.com with ESMTPSA id s86sm487003pfi.74.2017.09.22.10.58.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 10:58:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Sep 2017 10:57:56 -0700
Message-Id: <20170922175756.34609-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922175756.34609-1-raj.khem@gmail.com>
References: <20170922175756.34609-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] rcmd: Fix build with musl
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
X-List-Received-Date: Fri, 22 Sep 2017 17:58:05 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb |  2 +
 ...ne-__THROW-to-avoid-build-issue-with-musl.patch | 47 ++++++++++++++++++++++
 .../0002-Do-not-use-rcmd-on-build-with-musl.patch  | 31 ++++++++++++++
 3 files changed, 80 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/cdrkit/files/0001-define-__THROW-to-avoid-build-issue-with-musl.patch
 create mode 100644 meta-oe/recipes-multimedia/cdrkit/files/0002-Do-not-use-rcmd-on-build-with-musl.patch

diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
index f0efc51e1..c0f220fa6 100644
--- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b30d3b2750b668133fc17b401e1b98f8"
 SRC_URI = "${DEBIAN_MIRROR}/main/c/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://0001-do-not-create-a-run-test-to-determine-order-of-bitfi.patch \
            file://0001-genisoimage-Fix-fprintf-format-errors.patch \
+           file://0001-define-__THROW-to-avoid-build-issue-with-musl.patch \
+           file://0002-Do-not-use-rcmd-on-build-with-musl.patch \
            "
 SRC_URI[md5sum] = "efe08e2f3ca478486037b053acd512e9"
 SRC_URI[sha256sum] = "d1c030756ecc182defee9fe885638c1785d35a2c2a297b4604c0e0dcc78e47da"
diff --git a/meta-oe/recipes-multimedia/cdrkit/files/0001-define-__THROW-to-avoid-build-issue-with-musl.patch b/meta-oe/recipes-multimedia/cdrkit/files/0001-define-__THROW-to-avoid-build-issue-with-musl.patch
new file mode 100644
index 000000000..b3beb069e
--- /dev/null
+++ b/meta-oe/recipes-multimedia/cdrkit/files/0001-define-__THROW-to-avoid-build-issue-with-musl.patch
@@ -0,0 +1,47 @@
+From 7c3036609494296f7c29413bf3acba829c81f62c Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sat, 8 Aug 2015 22:58:57 +0200
+Subject: [PATCH 1/2] define __THROW to avoid build issue with musl
+
+Fixes:
+http://autobuild.buildroot.net/results/d27/d2781e70b04a207e2e9397d888032294c7285034/build-end.log
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ genisoimage/sha256.h | 4 ++++
+ genisoimage/sha512.h | 4 ++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/genisoimage/sha256.h b/genisoimage/sha256.h
+index e7f4cb9..bcae7ef 100644
+--- a/genisoimage/sha256.h
++++ b/genisoimage/sha256.h
+@@ -29,6 +29,10 @@
+ #include <stdint.h>
+ #include <stdio.h>
+ 
++/* define __THROW to avoid build issue when it's not available from the libc */
++#ifndef __THROW
++# define __THROW
++#endif
+ 
+ /* Structure to save state of computation between the single steps.  */
+ struct sha256_ctx
+diff --git a/genisoimage/sha512.h b/genisoimage/sha512.h
+index 7298355..8cee8b0 100644
+--- a/genisoimage/sha512.h
++++ b/genisoimage/sha512.h
+@@ -29,6 +29,10 @@
+ #include <stdint.h>
+ #include <stdio.h>
+ 
++/* define __THROW to avoid build issue when it's not available from the libc */
++#ifndef __THROW
++# define __THROW
++#endif
+ 
+ /* Structure to save state of computation between the single steps.  */
+ struct sha512_ctx
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-multimedia/cdrkit/files/0002-Do-not-use-rcmd-on-build-with-musl.patch b/meta-oe/recipes-multimedia/cdrkit/files/0002-Do-not-use-rcmd-on-build-with-musl.patch
new file mode 100644
index 000000000..547a21c67
--- /dev/null
+++ b/meta-oe/recipes-multimedia/cdrkit/files/0002-Do-not-use-rcmd-on-build-with-musl.patch
@@ -0,0 +1,31 @@
+From 510838b2c96a9b097b3ee2694cba1c3623b0bac7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 21 Sep 2017 22:38:05 -0700
+Subject: [PATCH 2/2] Do not use rcmd on build with musl
+
+cdrkit unconditionally enables code using rcmd(3), which isn't available
+on musl.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/xconfig.h.in | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/include/xconfig.h.in b/include/xconfig.h.in
+index 476c00b..6b4b298 100644
+--- a/include/xconfig.h.in
++++ b/include/xconfig.h.in
+@@ -186,8 +186,9 @@
+  *	Instead use the tests AC_SMALL_FSEEKO/AC_SMALL/STELLO and make sure
+  *	they are placed before the large file tests.
+  */
+-
++#ifdef __GLIBC__
+ #define HAVE_RCMD 1		/* rcmd() is present in libc/libsocket */
++#endif
+ #define HAVE_SOCKET 1		/* socket() is present in libc/libsocket */
+ #define HAVE_SOCKETPAIR 1		/* socketpair() is present in libc/libsocket */
+ #define HAVE_GETSERVBYNAME 1	/* getservbyname() is present in libc/libsocket */
+-- 
+2.14.1
+
-- 
2.14.1


