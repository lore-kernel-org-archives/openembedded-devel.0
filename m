Received: from mail-pa0-f41.google.com ([209.85.220.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Tw8fH-0006mW-QW
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jan 2013 10:55:16 +0100
Received: by mail-pa0-f41.google.com with SMTP id bj3so2022826pad.14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2013 01:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=DIHmfwkxu9A/xANpqvdmJUOlVwfL98PZ3B05oOciQd8=;
	b=1ETFovANcaZIqUuL9fSlPoTwG0f2C6GIjT7S2Tfvxq/dnCPeWh0RqPK0VwGJbiu83V
	7jQGntMBa8ifHNdjANw/MuSTyzMe8Bx2Pq/2/EzhOL1JqHB23mnHuO1lb7eLNdAdlvjK
	A6mp8njOPemGBuHpw/yiGcNiM6paZXqJD4qWVHpDcn/yGQMA/C6E2mH0OhUV3OL9cbpd
	0zjWJigm5xYoG1EOr08TgBfhujPGzvrSUqIfR+Yfp8AaNAdFdWONvN7NiuI+qxkovO2v
	Ux2pn/EnOlNaFUyviFiUdcS2JAMtj2SHEYyc4izIcjjb8QnKImIQEdYBMcW1aCf5DBuV
	JfFA==
X-Received: by 10.66.88.6 with SMTP id bc6mr22309425pab.5.1358501986402;
	Fri, 18 Jan 2013 01:39:46 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id oi3sm2801145pbb.1.2013.01.18.01.39.45
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 18 Jan 2013 01:39:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jan 2013 01:39:18 -0800
Message-Id: <1358501958-3585-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-networking][PATCH] netcat_0.7.1.bb: Fix build with new versions of autotools
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
X-List-Received-Date: Fri, 18 Jan 2013 09:55:17 -0000

autoconf and automake got updates which need these changes
see patch header for details

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../netcat/netcat/obsolete_autoconf_macros.patch   |   32 ++++++++++++++++++++
 .../recipes-support/netcat/netcat_0.7.1.bb         |    6 ++--
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/netcat/netcat/obsolete_autoconf_macros.patch

diff --git a/meta-networking/recipes-support/netcat/netcat/obsolete_autoconf_macros.patch b/meta-networking/recipes-support/netcat/netcat/obsolete_autoconf_macros.patch
new file mode 100644
index 0000000..9b0ed58
--- /dev/null
+++ b/meta-networking/recipes-support/netcat/netcat/obsolete_autoconf_macros.patch
@@ -0,0 +1,32 @@
+Replace obsoleted AM_CONFIG_HEADER flagged by autoconf 2.69
+locale.h check was picked from old gettext macros but with new aclocal
+it picks the right 0.18 gettext.m4 and does not get the check
+therefore we explicitly add it to configure.ac
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: netcat-0.7.1/configure.ac
+===================================================================
+--- netcat-0.7.1.orig/configure.ac	2013-01-18 01:30:01.928069739 -0800
++++ netcat-0.7.1/configure.ac	2013-01-18 01:32:50.568073009 -0800
+@@ -26,8 +26,7 @@
+ AC_PREREQ(2.53)
+ 
+ dnl without this order in this file, automake will be confused!
+-AM_CONFIG_HEADER(config.h)
+-
++AC_CONFIG_HEADERS(config.h)
+ dnl check for programs.  first the c compiler.
+ AC_PROG_CC
+ AC_PROG_CPP
+@@ -56,7 +55,7 @@
+ AC_LBL_LIBRARY_NET
+ 
+ dnl Fortunately we have Solaris...
+-AC_CHECK_HEADERS(sys/sockio.h)
++AC_CHECK_HEADERS(sys/sockio.h locale.h)
+ 
+ AC_CHECK_FUNCS(srandom random)
+ if test $ac_cv_func_srandom = no; then
diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
index c4f1f33..8dacdec 100644
--- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
+++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
@@ -4,9 +4,11 @@ HOMEPAGE = "http://netcat.sourceforge.net"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PR = "r1"
+PR = "r2"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2 \
+           file://obsolete_autoconf_macros.patch \
+          "
 
 SRC_URI[md5sum] = "0a29eff1736ddb5effd0b1ec1f6fe0ef"
 SRC_URI[sha256sum] = "b55af0bbdf5acc02d1eb6ab18da2acd77a400bafd074489003f3df09676332bb"
-- 
1.7.9.5



