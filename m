Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6DAE470613
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 08:57:09 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6I8h9us030346; Fri, 18 Jul 2014 09:43:09 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZR7aV2uyPJ17; Fri, 18 Jul 2014 09:43:09 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6I8gx7C030262
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 18 Jul 2014 09:43:01 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X83kk-0006k3-Ny; Fri, 18 Jul 2014 09:42:54 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 09:42:43 +0100
Message-Id: <1405672966-25729-24-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 24/27] ode: Use "foreign" automake strictness
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jul 2014 08:57:10 -0000

---
 meta-oe/recipes-support/ode/ode/configure.patch | 13 +++++++++++++
 meta-oe/recipes-support/ode/ode_0.13.bb         |  3 ++-
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/ode/ode/configure.patch

diff --git a/meta-oe/recipes-support/ode/ode/configure.patch b/meta-oe/recipes-support/ode/ode/configure.patch
new file mode 100644
index 0000000..246b2e2
--- /dev/null
+++ b/meta-oe/recipes-support/ode/ode/configure.patch
@@ -0,0 +1,13 @@
+Index: ode-0.13/libccd/configure.ac
+===================================================================
+--- ode-0.13.orig/libccd/configure.ac	2013-08-19 17:48:03.000000000 +0000
++++ ode-0.13/libccd/configure.ac	2014-07-17 22:04:16.580595690 +0000
+@@ -5,7 +5,7 @@
+ AC_INIT([libccd], [1.0], [danfis@danfis.cz])
+ AC_CONFIG_SRCDIR([src/ccd.c])
+ AC_CONFIG_HEADERS([src/config.h])
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
+ 
+ # Checks for programs.
+ AC_PROG_CXX
diff --git a/meta-oe/recipes-support/ode/ode_0.13.bb b/meta-oe/recipes-support/ode/ode_0.13.bb
index 8e9eb15..2dc82a8 100644
--- a/meta-oe/recipes-support/ode/ode_0.13.bb
+++ b/meta-oe/recipes-support/ode/ode_0.13.bb
@@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = " \
 # file://LICENSE-BSD.TXT;md5=c74e6304a772117e059458fb9763a928
 
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/opende/ode-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/opende/ode-${PV}.tar.bz2 \
+           file://configure.patch"
 SRC_URI[md5sum] = "04b32c9645c147e18caff7a597a19f84"
 SRC_URI[sha256sum] = "34ce3e236e313bf109a0cb5546d2fca462aed99f29a42e62bc1463b803c31ef9"
 
-- 
2.0.2


