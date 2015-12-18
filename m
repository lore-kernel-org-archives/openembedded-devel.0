Return-Path: <cjp256@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6DF856FF77
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 20:49:47 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id v36so42461079qgd.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JrI+h/Q3M1Cgpm6fcdEhX1L3b8OW2rVaWngrKuMhL8M=;
	b=P0LQVdRBSpHRtGhWSHmMQbjj7uBpTtmhUodjg0YyGkWU1XdpRH6wVlvnnviOjfSoiF
	uNkMZ6zUuVq+VfoxaBPthz//ENA+ouH2mlO2trhdEsZM2ZMpgMwKFLb2iOiBK0jidehl
	wxxm21IPvJ/21O0qV9PPEk/dZ9JOJQTG4P925Mui8Vd+pKHlsmkTlJAUvRlXlITh/D1Q
	svaPpG0sqg7CqhwS6+Hhl8FnDMdta+Q2yM67tk57gkOyucGHk4ix7b4vIMCrCHVfdb/v
	Va2CcRW9QpoOiaCBSH2NoQjBi1D3U56ROuEj/NP+CiPVtWpvtts8YCLwuCskCjd/UBVQ
	3HlA==
X-Received: by 10.140.19.46 with SMTP id 43mr7963930qgg.103.1450471788104;
	Fri, 18 Dec 2015 12:49:48 -0800 (PST)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	p101sm3032415qkp.36.2015.12.18.12.49.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Dec 2015 12:49:47 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Dec 2015 15:49:41 -0500
Message-Id: <1450471782-25731-2-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1450471782-25731-1-git-send-email-cjp256@gmail.com>
References: <1450471782-25731-1-git-send-email-cjp256@gmail.com>
Cc: Chris Patterson <pattersonc@ainfosec.com>
Subject: [meta-networking][PATCH 2/3] strongswan: add configure patch fix for systemd
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
X-List-Received-Date: Fri, 18 Dec 2015 20:49:49 -0000

From: Chris Patterson <pattersonc@ainfosec.com>

Fixes strongswan configure script for systemd >= 209,
where it merged libsystemd-journal and libsystemd-daemon
into libsystemd.

Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
---
 .../strongswan/files/support-newer-systemd.patch   |   69 ++++++++++++++++++++
 .../recipes-support/strongswan/strongswan_5.3.2.bb |    1 +
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
1.7.10.4


