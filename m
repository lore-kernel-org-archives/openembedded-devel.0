Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id A2DD5731DB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2016 00:59:58 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id e65so2225973pfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 16:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=iQLrLzpoI8x7kXj7LiMKVY+A/P9mK03dM8FGeGCP0eI=;
	b=P5XAObywKYTDO0OMgqQSHLQvgNYhqrpeewwD2A95XwsEpyW8YDhfpbIqq/YHzsQVRt
	kd+EPjQsxJzipTWC0DPSSpE0yx8/AoOUTLZRHOkN3SCCw4FyuE0+4HfSFI9j19PheZne
	/uuNtWtnqUroq3veIRgHOgf9Zn0t9mh5iGcBnLkNKTXuhcLZi4iFT12JCdVnqaeG9Xc7
	UEO8ikX711Spr4QokGaJZprTkUF2rvxE5NE8AakofIzTH1httH99Ablu2eJqrfXPKTRK
	Ikge5RTF4JZX4rXl7CwM9yw464Bc7ztK8m5pa1k2BM1GMaa3Adt4YeXmFBWR5L7OORMq
	YbhA==
X-Received: by 10.98.43.73 with SMTP id r70mr15691436pfr.4.1452387599711;
	Sat, 09 Jan 2016 16:59:59 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	m87sm13753052pfi.47.2016.01.09.16.59.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:59:57 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id A1533FCC83E; Sat,  9 Jan 2016 16:59:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:59:29 -0800
Message-Id: <de11da425e4c7f8e2525e9c8a03c1942fd07a41f.1452386603.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
Subject: [PATCH 06/22] strongswan: add configure patch fix for systemd
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
X-List-Received-Date: Sun, 10 Jan 2016 00:59:58 -0000

From: Chris Patterson <pattersonc@ainfosec.com>

Fixes strongswan configure script for systemd >= 209,
where it merged libsystemd-journal and libsystemd-daemon
into libsystemd.

Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../strongswan/files/support-newer-systemd.patch   | 69 ++++++++++++++++++++++
 .../recipes-support/strongswan/strongswan_5.3.2.bb |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/files/support-newer-systemd.patch

diff --git a/meta-networking/recipes-support/strongswan/files/support-newer-systemd.patch b/meta-networking/recipes-support/strongswan/files/support-newer-systemd.patch
new file mode 100644
index 0000000..550cf67
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/files/support-newer-systemd.patch
@@ -0,0 +1,69 @@
+commit 82498129e0a91dfc3ed2c4ec3b2252f44655b83c
+Author: Chris Patterson <pattersonc@ainfosec.com>
+Date:   Fri Dec 18 08:27:57 2015 -0500
+
+    configure: support systemd >= 209
+    
+    libsystemd-journal and libsystemd-daemon are now just
+    part of libsystemd.
+    
+    Keep original systemd checks as a fallback.
+    
+    Updates charon-systemd/Makefile.am accordingly.
+    
+    Tested on:
+    - debian wheezy (systemd v44)
+    - ubuntu 15.10 (systemd v255).
+    
+    Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
+
+Upstream-Status: Submitted
+https://github.com/strongswan/strongswan/pull/24
+
+diff --git a/configure.ac b/configure.ac
+index 3d71ce0..f6c0426 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -941,13 +941,17 @@ if test x$systemd = xtrue; then
+ 		AC_MSG_ERROR([not found (try --with-systemdsystemunitdir)])
+ 	fi
+ 
+-	PKG_CHECK_MODULES(systemd_daemon, [libsystemd-daemon])
+-	AC_SUBST(systemd_daemon_CFLAGS)
+-	AC_SUBST(systemd_daemon_LIBS)
+-
+-	PKG_CHECK_MODULES(systemd_journal, [libsystemd-journal])
+-	AC_SUBST(systemd_journal_CFLAGS)
+-	AC_SUBST(systemd_journal_LIBS)
++	PKG_CHECK_MODULES(systemd, [libsystemd >= 209],
++		[AC_SUBST(systemd_CFLAGS)
++		AC_SUBST(systemd_LIBS)],
++		[PKG_CHECK_MODULES(systemd_daemon, [libsystemd-daemon])
++		AC_SUBST(systemd_daemon_CFLAGS)
++		AC_SUBST(systemd_daemon_LIBS)
++
++		PKG_CHECK_MODULES(systemd_journal, [libsystemd-journal])
++		AC_SUBST(systemd_journal_CFLAGS)
++		AC_SUBST(systemd_journal_LIBS)
++		])
+ fi
+ 
+ if test x$tss = xtrousers; then
+diff --git a/src/charon-systemd/Makefile.am b/src/charon-systemd/Makefile.am
+index 1b9ac15..ee85d43 100644
+--- a/src/charon-systemd/Makefile.am
++++ b/src/charon-systemd/Makefile.am
+@@ -9,11 +9,11 @@ charon_systemd_CPPFLAGS = \
+ 	-I$(top_srcdir)/src/libstrongswan \
+ 	-I$(top_srcdir)/src/libhydra \
+ 	-I$(top_srcdir)/src/libcharon \
+-	$(systemd_daemon_CFLAGS) $(systemd_journal_CFLAGS) \
++	$(systemd_CFLAGS) $(systemd_daemon_CFLAGS) $(systemd_journal_CFLAGS) \
+ 	-DPLUGINS=\""${charon_plugins}\""
+ 
+ charon_systemd_LDADD = \
+ 	$(top_builddir)/src/libstrongswan/libstrongswan.la \
+ 	$(top_builddir)/src/libhydra/libhydra.la \
+ 	$(top_builddir)/src/libcharon/libcharon.la \
+-	$(systemd_daemon_LIBS) $(systemd_journal_LIBS) -lm $(PTHREADLIB) $(DLLIB)
++	$(systemd_LIBS) $(systemd_daemon_LIBS) $(systemd_journal_LIBS) -lm $(PTHREADLIB) $(DLLIB)
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb b/meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb
index df7b496..aa32383 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb
@@ -9,6 +9,7 @@ DEPENDS = "gmp openssl flex-native flex bison-native"
 
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
         file://fix-funtion-parameter.patch \
+        file://support-newer-systemd.patch \
 "
 
 SRC_URI[md5sum] = "fab014be1477ef4ebf9a765e10f8802c"
-- 
1.9.1


