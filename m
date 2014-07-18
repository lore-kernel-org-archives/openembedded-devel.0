Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 429A170693
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 08:57:07 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6I8h3fc030280; Fri, 18 Jul 2014 09:43:03 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id p5Wim72oLB4k; Fri, 18 Jul 2014 09:43:03 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6I8gvGw030241
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 18 Jul 2014 09:42:59 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X83ki-0006iM-Pl; Fri, 18 Jul 2014 09:42:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 09:42:22 +0100
Message-Id: <1405672966-25729-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 03/27] usbpath: Use "foreign" automake strictness
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
X-List-Received-Date: Fri, 18 Jul 2014 08:57:07 -0000

---
 meta-oe/recipes-support/usbpath/usbpath/configure.patch | 11 +++++++++++
 meta-oe/recipes-support/usbpath/usbpath_svn.bb          |  3 ++-
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/usbpath/usbpath/configure.patch

diff --git a/meta-oe/recipes-support/usbpath/usbpath/configure.patch b/meta-oe/recipes-support/usbpath/usbpath/configure.patch
new file mode 100644
index 0000000..271e6a5
--- /dev/null
+++ b/meta-oe/recipes-support/usbpath/usbpath/configure.patch
@@ -0,0 +1,11 @@
+Index: usbpath/configure.ac
+===================================================================
+--- usbpath.orig/configure.ac	2014-07-17 20:40:26.000000000 +0000
++++ usbpath/configure.ac	2014-07-18 07:01:40.933474420 +0000
+@@ -1,5 +1,5 @@
+ AC_INIT([usbpath],[0.1])
+-AM_INIT_AUTOMAKE(AC_PACKAGE_NAME, AC_PACKAGE_VERSION)
++AM_INIT_AUTOMAKE([foreign])
+ 
+ AC_PROG_CC
+ AC_PROG_RANLIB
diff --git a/meta-oe/recipes-support/usbpath/usbpath_svn.bb b/meta-oe/recipes-support/usbpath/usbpath_svn.bb
index 0ec9324..134192b 100644
--- a/meta-oe/recipes-support/usbpath/usbpath_svn.bb
+++ b/meta-oe/recipes-support/usbpath/usbpath_svn.bb
@@ -11,7 +11,8 @@ BBCLASSEXTEND = "native"
 SRCREV = "3172"
 PV = "0.0+svnr${SRCPV}"
 
-SRC_URI = "svn://svn.openmoko.org/trunk/src/host;module=usbpath;protocol=http"
+SRC_URI = "svn://svn.openmoko.org/trunk/src/host;module=usbpath;protocol=http \
+           file://configure.patch"
 
 S = "${WORKDIR}/usbpath"
 
-- 
2.0.2


