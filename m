Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 53EB878CB0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:18:12 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id x17-v6so7348033pfh.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 01:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NRarwSxsCsnrnyacumUTGAocF/u6tpvy0wYMo7VtCAI=;
	b=JbSl3np1RhSCD7qH0dvkfNvDmxTtkcTvs/kZbwDUrHgrtSOJby5iGhBwx5BUK9nUzD
	pdbmdcYh62K4vZ37H6yUqBLuNILWLe7Mw76NJpZJ56ad0UD6Si5UFlS2XVSyBBkGFA+C
	Fl+GQdeIsoFjognERnslRhWdaFZe9FnfG2lx030019coo6cHrscuBEuDZUik3P3/iG0r
	qKDDCBvCdjjwUVl3NbxplCV4eJEsc8uCdzwpBMFVWWw8NZykdJtIupsueTe2CkgbpGFz
	rgwIaw0vw/1g/CMcCcZpq09VKFUP6OiYpmBN/OriTk+SXJPeSUqDxmBtzOmobssgFGuy
	G8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NRarwSxsCsnrnyacumUTGAocF/u6tpvy0wYMo7VtCAI=;
	b=GHgh5K4DhUzgFKoQpzZMcwoDdC8mKeQg31CdaJBUhoLrfyTpfooAcsc1NUtI+8Frrb
	vr2mRWlz/pZifwZlMYsUxzozrzAMtwJHyquG+qfumE5laCtgrDnlXdzWouy0sFSD9xhf
	ELKnZ/9m5jc1Vmoa8K3CrdxqR5KinW4eTiLzHbTcY1FQHYC+HZIwIGY8Jg+qcvajNLM6
	RSZgE65fQ93i9o1+N2IvyYDspIhKbIh2+xHVM0PJYFiBQTN7IgEQPhWKLMmS439NNvpB
	6KHXsaB1FBamVA76/gHxkvaL1QvmFgeVahwprYf6FO1g4hqSHGhr6MXTRoWjtGcJD711
	jI0g==
X-Gm-Message-State: AOUpUlG1/rVCb0rgnlOyq+fsQx/+Wa6VXYCNgPaRvK1OX12cIArHpLQ3
	rjpYnP2+01OkgMFCrs2nNZ78RwqU
X-Google-Smtp-Source: AA+uWPztJJNvY4Kpi1LzH8kYxZO0pW/zqZKCBpqYB9Q+KVYa2fAxLoqtyQvHVTCD2nkYgxqNtsFBgA==
X-Received: by 2002:a62:d544:: with SMTP id
	d65-v6mr17757986pfg.107.1534148293127; 
	Mon, 13 Aug 2018 01:18:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	b64-v6sm23414971pfg.66.2018.08.13.01.18.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 01:18:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 01:17:39 -0700
Message-Id: <20180813081742.6961-18-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813081742.6961-1-raj.khem@gmail.com>
References: <20180813081742.6961-1-raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 18/21] owfs: Upgrade to 3.2p2 and fix build with glibc 2.28+
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
X-List-Received-Date: Mon, 13 Aug 2018 08:18:12 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-include-sys-sysmacros.h-for-major.patch | 46 +++++++++++++++++++
 .../owfs/{owfs_2.9p1.bb => owfs_3.2p2.bb}     | 19 ++++----
 2 files changed, 57 insertions(+), 8 deletions(-)
 create mode 100644 meta-filesystems/recipes-filesystems/owfs/owfs/0001-include-sys-sysmacros.h-for-major.patch
 rename meta-filesystems/recipes-filesystems/owfs/{owfs_2.9p1.bb => owfs_3.2p2.bb} (84%)

diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs/0001-include-sys-sysmacros.h-for-major.patch b/meta-filesystems/recipes-filesystems/owfs/owfs/0001-include-sys-sysmacros.h-for-major.patch
new file mode 100644
index 0000000000..0a990ac686
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/owfs/owfs/0001-include-sys-sysmacros.h-for-major.patch
@@ -0,0 +1,46 @@
+From dd1af7541f18399bcdcb129a8b6618c18ebd9d63 Mon Sep 17 00:00:00 2001
+From: Tomasz Torcz <tomek@pipebreaker.pl>
+Date: Sat, 17 Mar 2018 12:56:04 +0100
+Subject: [PATCH] include <sys/sysmacros.h> for major()
+
+  Linux glibc ceased to include it in sys/types.h:
+https://sourceware.org/ml/libc-alpha/2015-11/msg00253.html
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac                  | 2 +-
+ module/owlib/src/include/ow.h | 6 +++++-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 86751bf7..d625d3f0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -180,7 +180,7 @@ m4_include([src/scripts/m4/acx_pthread.m4])
+ # Checks for header files.
+ AC_HEADER_DIRENT
+ AC_HEADER_STDC
+-AC_CHECK_HEADERS([asm/types.h arpa/inet.h sys/ioctl.h sys/mkdev.h sys/socket.h sys/time.h sys/times.h sys/types.h sys/param.h sys/uio.h feature_tests.h fcntl.h netinet/in.h stdlib.h string.h strings.h sys/file.h syslog.h termios.h unistd.h limits.h stdint.h features.h getopt.h resolv.h semaphore.h])
++AC_CHECK_HEADERS([asm/types.h arpa/inet.h sys/ioctl.h sys/mkdev.h sys/socket.h sys/sysmacros.h sys/time.h sys/times.h sys/types.h sys/param.h sys/uio.h feature_tests.h fcntl.h netinet/in.h stdlib.h string.h strings.h sys/file.h syslog.h termios.h unistd.h limits.h stdint.h features.h getopt.h resolv.h semaphore.h])
+ AC_CHECK_HEADERS([linux/limits.h linux/types.h netdb.h dlfcn.h])
+ AC_CHECK_HEADERS(sys/event.h sys/inotify.h)
+ 
+diff --git a/module/owlib/src/include/ow.h b/module/owlib/src/include/ow.h
+index 9dbec5f3..0a310552 100644
+--- a/module/owlib/src/include/ow.h
++++ b/module/owlib/src/include/ow.h
+@@ -188,8 +188,12 @@
+ #include <netdb.h>				/* for getaddrinfo */
+ #endif							/* HAVE_NETDB_H */
+ 
++#ifdef HAVE_SYS_SYSMACROS_H
++#include <sys/sysmacros.h>			/* for major() */
++#endif							/* HAVE_SYS_SYSMACROS_H */
++
+ #ifdef HAVE_SYS_MKDEV_H
+-#include <sys/mkdev.h>			/* for major() */
++#include <sys/mkdev.h>			/* for major() on Solaris */
+ #endif							/* HAVE_SYS_MKDEV_H */
+ 
+ #include <stddef.h> // for offsetof()
diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs_2.9p1.bb b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p2.bb
similarity index 84%
rename from meta-filesystems/recipes-filesystems/owfs/owfs_2.9p1.bb
rename to meta-filesystems/recipes-filesystems/owfs/owfs_3.2p2.bb
index 21fd7e93e2..50865cccda 100644
--- a/meta-filesystems/recipes-filesystems/owfs/owfs_2.9p1.bb
+++ b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p2.bb
@@ -4,18 +4,21 @@ HOMEPAGE = "http://www.owfs.org/"
 SECTION = "console/network"
 
 LICENSE = "GPLv2 & LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a0bc427f423a41220ab79a0b392218bd \
-                    file://COPYING.LIB;md5=865c4bd642d9e04f43925ad7e929ae87"
+LIC_FILES_CHKSUM = "file://COPYING;md5=12a64df1cc87275e940cab05ee75c37d \
+                    file://COPYING.LIB;md5=16ff3ffebed582e19ea7a4f48ec77b42"
 
 DEPENDS = "fuse virtual/libusb0"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/owfs/owfs-${PV}.tar.gz \
+# v3.2p2
+SRCREV = "93c1f36d9ac481075287da331d5184f590f8c0fa"
+SRC_URI = "git://github.com/owfs/owfs \
            file://owhttpd \
-           file://owserver "
-SRC_URI[md5sum] = "56ba145be208002e58775a7203369851"
-SRC_URI[sha256sum] = "9d22dbff72d235476688c02669f7171b23e21dffadf40bbdd3b8263908218424"
+           file://owserver \
+           file://0001-include-sys-sysmacros.h-for-major.patch \
+           "
+
+S = "${WORKDIR}/git"
 
-inherit autotools-brokensep update-rc.d
+inherit autotools-brokensep update-rc.d pkgconfig
 
 EXTRA_OECONF = " \
                  --with-fuseinclude=${STAGING_INCDIR} \
-- 
2.18.0


