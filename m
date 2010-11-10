Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1PGFf0-0004lW-Il
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Nov 2010 19:44:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id D92908EE2D2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Nov 2010 13:35:46 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03465-08 for <openembedded-devel@lists.openembedded.org>; 
	Wed, 10 Nov 2010 13:35:46 -0500 (EST)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 9FC1A8ED526; Wed, 10 Nov 2010 13:35:46 -0500 (EST)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 8B20C8CA466
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Nov 2010 13:35:44 -0500 (EST)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 831B25001F5; Wed, 10 Nov 2010 13:35:44 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Nov 2010 13:35:44 -0500
Message-Id: <1289414144-18181-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1289414144-18181-1-git-send-email-msmith@cbnco.com>
References: <1289414144-18181-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] smpeg: configure with --disable-rpath
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
X-List-Received-Date: Wed, 10 Nov 2010 18:44:43 -0000

Otherwise libtool and ld try to link against ${libdir}/libdl.so.2 on the
host system.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 .../smpeg-0.4.5+svnr387/add-disable-rpath.patch    |   47 ++++++++++++++++++++
 recipes/smpeg/smpeg_svn.bb                         |    6 ++-
 2 files changed, 51 insertions(+), 2 deletions(-)
 create mode 100644 recipes/smpeg/smpeg-0.4.5+svnr387/add-disable-rpath.patch

diff --git a/recipes/smpeg/smpeg-0.4.5+svnr387/add-disable-rpath.patch b/recipes/smpeg/smpeg-0.4.5+svnr387/add-disable-rpath.patch
new file mode 100644
index 0000000..e1de0ea
--- /dev/null
+++ b/recipes/smpeg/smpeg-0.4.5+svnr387/add-disable-rpath.patch
@@ -0,0 +1,47 @@
+Upstream: http://icculus.org/pipermail/smpeg/2010-November/000183.html
+
+Add --disable-rpath to fix build in OE.
+
+--- trunk/configure.in.orig	2010-11-07 09:00:19.000000000 -0500
++++ trunk/configure.in	2010-11-10 13:02:06.000000000 -0500
+@@ -84,19 +84,27 @@
+         ;;
+ esac
+ 
+-# Set runtime shared library paths as needed 
+-
+-case "$target" in
+-    *-*-linux*)
+-	SMPEG_RLD_FLAGS="-Wl,-rpath,\${exec_prefix}/lib"
+-	;;
+-    *-*-freebsd*)
+-	SMPEG_RLD_FLAGS="-Wl,-rpath,\${exec_prefix}/lib"
+-	;;
+-    *-*-solaris*)
+-	SMPEG_RLD_FLAGS="-R\${exec_prefix}/lib"
+-	;;
+-esac
++dnl Set runtime shared library paths as needed 
++AC_ARG_ENABLE(rpath,
++	AC_HELP_STRING([--enable-rpath],
++		[use an rpath when linking SDL [[default=yes]]]),,
++	enable_rpath=yes)
++
++if test "x$enable_rpath" = "xyes"; then
++  case "$target" in
++      *-*-linux*)
++	  SMPEG_RLD_FLAGS="-Wl,-rpath,\${exec_prefix}/lib"
++	  ;;
++      *-*-freebsd*)
++	  SMPEG_RLD_FLAGS="-Wl,-rpath,\${exec_prefix}/lib"
++	  ;;
++      *-*-solaris*)
++	  SMPEG_RLD_FLAGS="-R\${exec_prefix}/lib"
++	  ;;
++  esac
++else
++  SMPEG_RLD_FLAGS=""
++fi
+ 
+ AC_SUBST(SMPEG_RLD_FLAGS)
+ 
diff --git a/recipes/smpeg/smpeg_svn.bb b/recipes/smpeg/smpeg_svn.bb
index 394270d..6fea95d 100644
--- a/recipes/smpeg/smpeg_svn.bb
+++ b/recipes/smpeg/smpeg_svn.bb
@@ -7,15 +7,17 @@ PROVIDES = "smpeg"
 PV = "0.4.5+svnr${SRCPV}"
 PE = "2"
 SRCREV = "387"
+PR = "r1"
 
-SRC_URI = "svn://svn.icculus.org/smpeg/;module=trunk"
+SRC_URI = "svn://svn.icculus.org/smpeg/;module=trunk \
+	file://add-disable-rpath.patch;apply=yes"
 
 S = "${WORKDIR}/trunk"
 
 inherit autotools binconfig
 
 EXTRA_OECONF = "--disable-gtktest --disable-opengl-player --without-x \
-		--without-gtk --disable-gtk-player"
+		--without-gtk --disable-gtk-player --disable-rpath"
 
 do_configure_prepend () {
 	touch NEWS AUTHORS ChangeLog
-- 
1.7.0.4



