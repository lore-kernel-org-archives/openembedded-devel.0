Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0F3696B758
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 06:31:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7E6VQfM011133
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2013 23:31:26 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 13 Aug 2013 23:31:23 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 14 Aug 2013 14:31:01 +0800
Message-ID: <68c478e47ea5de1423f7241717ab7d379028cca8.1376461413.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376461413.git.hongxu.jia@windriver.com>
References: <cover.1376461413.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [RFC PATCH 09/13] xfsprogs: move to meta-filesystems and upgrade
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
X-List-Received-Date: Wed, 14 Aug 2013 06:31:24 -0000
Content-Type: text/plain

- Move xfsprogs from meta-oe to meta-filesystems
- Upgrade xfsprogs to 3.1.11

[YOCTO #4178]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../files}/drop-configure-check-for-aio.patch      |  42 ++--
 .../xfsprogs/files}/remove-install-as-user.patch   | 225 +++------------------
 .../recipes-utils/xfsprogs/xfsprogs_3.1.11.bb      |   5 +-
 3 files changed, 51 insertions(+), 221 deletions(-)
 rename {meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8 => meta-filesystems/recipes-utils/xfsprogs/files}/drop-configure-check-for-aio.patch (67%)
 rename {meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8 => meta-filesystems/recipes-utils/xfsprogs/files}/remove-install-as-user.patch (46%)
 rename meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb => meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb (90%)

diff --git a/meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8/drop-configure-check-for-aio.patch b/meta-filesystems/recipes-utils/xfsprogs/files/drop-configure-check-for-aio.patch
similarity index 67%
rename from meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8/drop-configure-check-for-aio.patch
rename to meta-filesystems/recipes-utils/xfsprogs/files/drop-configure-check-for-aio.patch
index a1c6042..7601095 100644
--- a/meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8/drop-configure-check-for-aio.patch
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/drop-configure-check-for-aio.patch
@@ -1,25 +1,20 @@
-Upstream-Status: Pending
-
-From a38bf800a655ea32cbddd6504e15c2f18597fd13 Mon Sep 17 00:00:00 2001
-From: Andreas Oberritter <obi@opendreambox.org>
-Date: Wed, 13 Mar 2013 14:40:13 +0100
-Subject: [PATCH] xfsprogs: drop configure check for aio
+xfsprogs: drop configure check for aio
 
 It's unused and breaks compilation with uclibc.
 
-Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+Upstream-Status: Pending
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- configure.in         |    6 +++---
- m4/Makefile          |    1 -
- m4/package_aiodev.m4 |   37 -------------------------------------
- 3 files changed, 3 insertions(+), 41 deletions(-)
- delete mode 100644 m4/package_aiodev.m4
+ configure.ac         |  6 +++---
+ m4/Makefile          |  1 -
+ m4/package_aiodev.m4 | 36 ------------------------------------
+ 3 files changed, 3 insertions(+), 40 deletions(-)
 
-diff --git a/configure.in b/configure.in
-index 664c0e9..f7d35f1 100644
---- a/configure.in
-+++ b/configure.in
-@@ -46,6 +46,9 @@ AC_ARG_ENABLE(lib64,
+diff --git a/configure.ac b/configure.ac
+index b968977..4e2a263 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -47,6 +47,9 @@ AC_ARG_ENABLE(lib64,
  	enable_lib64=yes)
  AC_SUBST(enable_lib64)
  
@@ -29,7 +24,7 @@ index 664c0e9..f7d35f1 100644
  #
  # If the user specified a libdir ending in lib64 do not append another
  # 64 to the library names.
-@@ -91,9 +94,6 @@ AC_PACKAGE_GLOBALS(xfsprogs)
+@@ -92,9 +95,6 @@ AC_PACKAGE_GLOBALS(xfsprogs)
  AC_PACKAGE_UTILITIES(xfsprogs)
  AC_MULTILIB($enable_lib64)
  
@@ -52,11 +47,10 @@ index 654a4fb..d282f0a 100644
  	package_globals.m4 \
  	package_libcdev.m4 \
 diff --git a/m4/package_aiodev.m4 b/m4/package_aiodev.m4
-deleted file mode 100644
-index 490d9c8..0000000
+index 490d9c8..8b13789 100644
 --- a/m4/package_aiodev.m4
-+++ /dev/null
-@@ -1,37 +0,0 @@
++++ b/m4/package_aiodev.m4
+@@ -1,37 +1 @@
 -#
 -# Check if we have a libaio.h installed
 -#
@@ -93,7 +87,7 @@ index 490d9c8..0000000
 -    fi
 -    AC_SUBST(librt)
 -  ])
--
+ 
 -- 
-1.7.10.4
+1.8.1.2
 
diff --git a/meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8/remove-install-as-user.patch b/meta-filesystems/recipes-utils/xfsprogs/files/remove-install-as-user.patch
similarity index 46%
rename from meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8/remove-install-as-user.patch
rename to meta-filesystems/recipes-utils/xfsprogs/files/remove-install-as-user.patch
index 1263aaf..e761db3 100644
--- a/meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8/remove-install-as-user.patch
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/remove-install-as-user.patch
@@ -1,7 +1,18 @@
-diff -urN a/include/buildmacros b/include/buildmacros
---- a/include/buildmacros	2011-12-27 23:32:31.554197934 -0600
-+++ b/include/buildmacros	2011-12-27 23:33:17.895485348 -0600
-@@ -30,7 +30,7 @@
+remove install as user
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ include/buildmacros |  2 +-
+ include/install-sh  | 95 ++++++++---------------------------------------------
+ 2 files changed, 14 insertions(+), 83 deletions(-)
+
+diff --git a/include/buildmacros b/include/buildmacros
+index 7a01880..0840d55 100644
+--- a/include/buildmacros
++++ b/include/buildmacros
+@@ -30,7 +30,7 @@ OBJECTS = $(ASFILES:.s=.o) \
  	  $(LFILES:.l=.o) \
  	  $(YFILES:%.y=%.tab.o)
  
@@ -10,9 +21,10 @@ diff -urN a/include/buildmacros b/include/buildmacros
  
  IMAGES_DIR = $(TOPDIR)/all-images
  DIST_DIR = $(TOPDIR)/dist
-diff -urN a/include/install-sh b/include/install-sh
---- a/include/install-sh	2011-12-27 23:32:31.556198121 -0600
-+++ b/include/install-sh	2011-12-27 23:32:57.012201738 -0600
+diff --git a/include/install-sh b/include/install-sh
+index c952a71..b9d66f7 100755
+--- a/include/install-sh
++++ b/include/install-sh
 @@ -24,11 +24,11 @@
  #       set           set      |    yes        yes
  #
@@ -29,7 +41,7 @@ diff -urN a/include/install-sh b/include/install-sh
      echo ""
      echo "The \$DIST_MANIFEST and \$DIST_ROOT environment variables affect the"
      echo "behaviour of this command - see comments in the script."
-@@ -38,32 +38,6 @@
+@@ -38,32 +38,6 @@ _usage() {
      exit 1
  }
  
@@ -62,7 +74,7 @@ diff -urN a/include/install-sh b/include/install-sh
  _manifest ()
  { 
      echo $* | sed -e 's/\/\//\//g' >>${DIST_MANIFEST:-/dev/null}
-@@ -77,9 +51,6 @@
+@@ -77,9 +51,6 @@ Sflag=false
  Tflag=false
  DIRMODE=755
  FILEMODE=644
@@ -72,7 +84,7 @@ diff -urN a/include/install-sh b/include/install-sh
  
  # default is to install and don't append manifest
  INSTALL=true
-@@ -92,24 +63,16 @@
+@@ -94,24 +65,16 @@ MANIFEST=:
  
  if $INSTALL
  then
@@ -100,7 +112,7 @@ diff -urN a/include/install-sh b/include/install-sh
     m)
  	DIRMODE=`expr $OPTARG`
  	FILEMODE=$DIRMODE
-@@ -144,18 +107,7 @@
+@@ -146,18 +109,7 @@ then
      # first usage
      #
      $MKDIR -p $dir 
@@ -120,7 +132,7 @@ diff -urN a/include/install-sh b/include/install-sh
  elif $Sflag
  then
      #
-@@ -201,7 +153,7 @@
+@@ -203,7 +155,7 @@ then
  			install_name=$target/$solib
  			$CP $solib $install_name
  			status=$?
@@ -129,7 +141,7 @@ diff -urN a/include/install-sh b/include/install-sh
  			break
  		fi
  	done
-@@ -252,7 +204,7 @@
+@@ -254,7 +206,7 @@ then
  	install_name=$target/$old_library
  	$CP $old_library $install_name
  	status=$?
@@ -138,7 +150,7 @@ diff -urN a/include/install-sh b/include/install-sh
  	;;
      *)
  	echo "$prog: -T $lt_install invalid"
-@@ -265,7 +217,6 @@
+@@ -267,7 +219,6 @@ then
  	if [ $status -eq 0 ]
  	then
  		$CHMOD $FILEMODE $install_name
@@ -146,7 +158,7 @@ diff -urN a/include/install-sh b/include/install-sh
  	fi
  	;;
      esac
-@@ -290,23 +241,10 @@
+@@ -292,23 +243,10 @@ else
  	then 
  	    if [ -f $dir/$f ]
  	    then
@@ -172,185 +184,7 @@ diff -urN a/include/install-sh b/include/install-sh
  	    fi
  	fi
      else
-@@ -332,14 +270,7 @@
- 	    status=$?
- 	    if [ $status -eq 0 ]
- 	    then
--		$CHMOD $FILEMODE $dir/$f
--		status=$?
--		if [ $status -eq 0 ]
--		then
--		    $CHOWN $OWNER $GROUP $dir/$f
--		    status=$?
--		fi
--		$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$f ${dir#$DIST_ROOT}/$f
-+		$MANIFEST f $FILEMODE $HERE/$f ${dir#$DIST_ROOT}/$f
- 	    fi
- 	    [ $status -ne 0 ] && break
- 	done
-diff -urN a/install-sh b/install-sh
---- a/install-sh	2011-12-27 23:32:31.565200349 -0600
-+++ b/install-sh	2011-12-27 23:32:51.854178224 -0600
-@@ -24,11 +24,11 @@
- #       set           set      |    yes        yes
- #
- _usage() {
--    echo "Usage: $prog [-o owner] [-g group] [-m mode] -d directory"
--    echo "or     $prog [-D] [-o owner] [-g group] [-m mode] file directory/file"
--    echo "or     $prog [-o owner] [-g group] [-m mode] file [file ...] directory"
-+    echo "Usage: $prog [-m mode] -d directory"
-+    echo "or     $prog [-m mode] file directory/file"
-+    echo "or     $prog [-m mode] file [file ...] directory"
-     echo "or     $prog -S file target  (creates \"target\" symlink)"
--    echo "or     $prog -T lt_arg [-o owner] [-g group] [-m mode] libtool.lai directory"
-+    echo "or     $prog -T lt_arg [-m mode] libtool.lai directory"
-     echo ""
-     echo "The \$DIST_MANIFEST and \$DIST_ROOT environment variables affect the"
-     echo "behaviour of this command - see comments in the script."
-@@ -38,32 +38,6 @@
-     exit 1
- }
- 
--_chown ()
--{
--    _st=255
--    if [ $# -eq 3 ] ; then
--	chown $1:$2 $3
--	_st=$?
--	if [ $_st -ne 0 ] ; then
--	    if [ $REAL_UID != '0' ] ; then
--		if [ ! -f $DIST_ROOT/.chown.quiet ] ; then
--		    echo '==============================================='
--		    echo Ownership of files under ${DIST_ROOT:-/}
--		    echo cannot be changed
--		    echo '==============================================='
--		    if [ -n "$DIST_ROOT" ] ; then
--			touch $DIST_ROOT/.chown.quiet
--		    fi
--		fi
--	       _st=0
--	    fi     
--	fi
--    fi
--
--    return $_st
--}
--
--
- _manifest ()
- { 
-     echo $* | sed -e 's/\/\//\//g' >>${DIST_MANIFEST:-/dev/null}
-@@ -77,9 +51,6 @@
- Tflag=false
- DIRMODE=755
- FILEMODE=644
--OWNER=`id -u`
--GROUP=`id -g`
--REAL_UID=$OWNER
- 
- # default is to install and don't append manifest
- INSTALL=true
-@@ -92,24 +63,16 @@
- 
- if $INSTALL
- then
--    CP=cp; LN=ln; MKDIR=mkdir; CHMOD=chmod; CHOWN=_chown
-+    CP=cp; LN=ln; MKDIR=mkdir; CHMOD=chmod;
- else
--    CP=true; LN=true; MKDIR=true; CHMOD=true; CHOWN=true
-+    CP=true; LN=true; MKDIR=true; CHMOD=true;
- fi
- 
--[ -n "$DIST_ROOT" -a $REAL_UID -ne 0 ] && CHOWN=true
--
--while getopts "Dcm:d:S:o:g:T:" c $*
-+while getopts "Dcm:d:S:T:" c $*
- do
-    case $c in
-    c)
- 	;;
--   g)
--	GROUP=$OPTARG
--	;;
--   o)
--	OWNER=$OPTARG
--	;;
-    m)
- 	DIRMODE=`expr $OPTARG`
- 	FILEMODE=$DIRMODE
-@@ -144,18 +107,7 @@
-     # first usage
-     #
-     $MKDIR -p $dir 
--    status=$?
--    if [ $status -eq 0 ]
--    then
--	$CHMOD $DIRMODE $dir
--	status=$?
--    fi
--    if [ $status -eq 0 ]
--    then
--	$CHOWN $OWNER $GROUP $dir
--	status=$?
--    fi
--    $MANIFEST d $DIRMODE $OWNER $GROUP ${dir#$DIST_ROOT}
-+    $MANIFEST d $DIRMODE ${dir#$DIST_ROOT}
- elif $Sflag
- then
-     #
-@@ -201,7 +153,7 @@
- 			install_name=$target/$solib
- 			$CP $solib $install_name
- 			status=$?
--			$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$solib ${install_name#$DIST_ROOT}
-+			$MANIFEST f $FILEMODE $HERE/$solib ${install_name#$DIST_ROOT}
- 			break
- 		fi
- 	done
-@@ -252,7 +204,7 @@
- 	install_name=$target/$old_library
- 	$CP $old_library $install_name
- 	status=$?
--	$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$old_library ${install_name#$DIST_ROOT}
-+	$MANIFEST f $FILEMODE $HERE/$old_library ${install_name#$DIST_ROOT}
- 	;;
-     *)
- 	echo "$prog: -T $lt_install invalid"
-@@ -265,7 +217,6 @@
- 	if [ $status -eq 0 ]
- 	then
- 		$CHMOD $FILEMODE $install_name
--		$CHOWN $OWNER $GROUP $install_name
- 	fi
- 	;;
-     esac
-@@ -290,23 +241,10 @@
- 	then 
- 	    if [ -f $dir/$f ]
- 	    then
--		$CHMOD $FILEMODE $dir/$f
--		status=$?
--		if [ $status -eq 0 ]
--		then
--		    $CHOWN $OWNER $GROUP $dir/$f
--		    status=$?
--		fi
--		$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$f ${dir#$DIST_ROOT}/$f
-+		$MANIFEST f $FILEMODE $HERE/$f ${dir#$DIST_ROOT}/$f
- 	    else
- 		$CHMOD $FILEMODE $dir
--		status=$?
--		if [ $status -eq 0 ]
--		then
--		    $CHOWN $OWNER $GROUP $dir
--		    status=$?
--		fi
--		$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$dir ${dir#$DIST_ROOT}
-+		$MANIFEST f $FILEMODE $HERE/$dir ${dir#$DIST_ROOT}
- 	    fi
- 	fi
-     else
-@@ -332,14 +270,7 @@
+@@ -334,14 +272,7 @@ else
  	    status=$?
  	    if [ $status -eq 0 ]
  	    then
@@ -366,3 +200,6 @@ diff -urN a/install-sh b/install-sh
  	    fi
  	    [ $status -ne 0 ] && break
  	done
+-- 
+1.8.1.2
+
diff --git a/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb
similarity index 90%
rename from meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb
index ba3490d..ceb0ddf 100644
--- a/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb
@@ -5,15 +5,14 @@ LICENSE = "GPLv2"
 LICENSE_libhandle = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=dbdb5f4329b7e7145de650e9ecd4ac2a"
 DEPENDS = "util-linux"
-PR = "r1"
 
 SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${P}.tar.gz \
     file://remove-install-as-user.patch \
     file://drop-configure-check-for-aio.patch \
 "
 
-SRC_URI[md5sum] = "f70b2e7200d4c29f0af1cf70e7be1db6"
-SRC_URI[sha256sum] = "74409e2e3748074999df25c00f722621659a0bd3607e677f0bcc4373b8c93eab"
+SRC_URI[md5sum] = "de9f1f45026c2f4e0776058d429ff4b6"
+SRC_URI[sha256sum] = "adf4980177b5c890c1ca86b9c0e3e4d69a3f95bfc01746844280c2393cf4d6be"
 
 inherit autotools
 
-- 
1.8.1.2


