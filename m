Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id DF91676AB2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 16:28:51 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so23215011pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 09:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Mexn+jmy7GwwJTAYrnMQirLGx+nBran2FXjbyT7Xvh0=;
	b=mvVZpFOrOg1Iiq14y1cO0uQqh3r/nq7ZMKM0UQ140WiL4iECq9PSzfn5dHRvL+d+tp
	xLFvPN0VWy/hs1CABtEdo4qzeShiWJQD1k/x0zoue1c7VQWHDLo+jHjmh8wjUj6nZ1iq
	Zp5J/Gimle/lnVLlgdCe5qjhSMoN9pWPZBT9SafQL8fvhwzILS/hd/ICRnkNO0xnWG/p
	Wf4/XK8ESFufc/TFOFYixXSVqFRh+1oDyxBbUflT3QI673haC02V7P3HN9xJfQb6a7X4
	QWDqzV66jv5XS8NM9kiqZof6p/MFYD9yGg2zC1cIgMcNGaVqTz7QBfUAlzV+ioMjYjSJ
	VLeA==
X-Gm-Message-State: ALoCoQnqMAkumVhm6NjbXhjMeh4MfeTVLhl7inTGLzvETtdFHWJThNW/emFe8jp9y/jTY3K2tPza
X-Received: by 10.68.200.40 with SMTP id jp8mr8206383pbc.16.1440088131899;
	Thu, 20 Aug 2015 09:28:51 -0700 (PDT)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	jt3sm4877787pbc.43.2015.08.20.09.28.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Aug 2015 09:28:51 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Aug 2015 21:58:45 +0530
Message-Id: <1440088125-1120-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-filesystems][PATCH] xfsdump: add new recipe
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
X-List-Received-Date: Thu, 20 Aug 2015 16:28:53 -0000

The xfsdump package contains xfsdump, xfsrestore and a
number of other utilities for administering XFS filesystems.
xfsdump examines files in a filesystem, determines which
need to be backed up, and copies those files to a
specified disk, tape or other storage medium.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../xfsdump/files/remove-install-as-user.patch     | 205 +++++++++++++++++++++
 .../recipes-utils/xfsdump/xfsdump_3.1.4.bb         |  37 ++++
 2 files changed, 242 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/xfsdump/files/remove-install-as-user.patch
 create mode 100644 meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb

diff --git a/meta-filesystems/recipes-utils/xfsdump/files/remove-install-as-user.patch b/meta-filesystems/recipes-utils/xfsdump/files/remove-install-as-user.patch
new file mode 100644
index 0000000..e761db3
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsdump/files/remove-install-as-user.patch
@@ -0,0 +1,205 @@
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
+ 	  $(LFILES:.l=.o) \
+ 	  $(YFILES:%.y=%.tab.o)
+ 
+-INSTALL	= $(TOPDIR)/install-sh -o $(PKG_USER) -g $(PKG_GROUP)
++INSTALL	= $(TOPDIR)/install-sh
+ 
+ IMAGES_DIR = $(TOPDIR)/all-images
+ DIST_DIR = $(TOPDIR)/dist
+diff --git a/include/install-sh b/include/install-sh
+index c952a71..b9d66f7 100755
+--- a/include/install-sh
++++ b/include/install-sh
+@@ -24,11 +24,11 @@
+ #       set           set      |    yes        yes
+ #
+ _usage() {
+-    echo "Usage: $prog [-o owner] [-g group] [-m mode] -d directory"
+-    echo "or     $prog [-D] [-o owner] [-g group] [-m mode] file directory/file"
+-    echo "or     $prog [-o owner] [-g group] [-m mode] file [file ...] directory"
++    echo "Usage: $prog [-m mode] -d directory"
++    echo "or     $prog [-m mode] file directory/file"
++    echo "or     $prog [-m mode] file [file ...] directory"
+     echo "or     $prog -S file target  (creates \"target\" symlink)"
+-    echo "or     $prog -T lt_arg [-o owner] [-g group] [-m mode] libtool.lai directory"
++    echo "or     $prog -T lt_arg [-m mode] libtool.lai directory"
+     echo ""
+     echo "The \$DIST_MANIFEST and \$DIST_ROOT environment variables affect the"
+     echo "behaviour of this command - see comments in the script."
+@@ -38,32 +38,6 @@ _usage() {
+     exit 1
+ }
+ 
+-_chown ()
+-{
+-    _st=255
+-    if [ $# -eq 3 ] ; then
+-	chown $1:$2 $3
+-	_st=$?
+-	if [ $_st -ne 0 ] ; then
+-	    if [ $REAL_UID != '0' ] ; then
+-		if [ ! -f $DIST_ROOT/.chown.quiet ] ; then
+-		    echo '==============================================='
+-		    echo Ownership of files under ${DIST_ROOT:-/}
+-		    echo cannot be changed
+-		    echo '==============================================='
+-		    if [ -n "$DIST_ROOT" ] ; then
+-			touch $DIST_ROOT/.chown.quiet
+-		    fi
+-		fi
+-	       _st=0
+-	    fi     
+-	fi
+-    fi
+-
+-    return $_st
+-}
+-
+-
+ _manifest ()
+ { 
+     echo $* | sed -e 's/\/\//\//g' >>${DIST_MANIFEST:-/dev/null}
+@@ -77,9 +51,6 @@ Sflag=false
+ Tflag=false
+ DIRMODE=755
+ FILEMODE=644
+-OWNER=`id -u`
+-GROUP=`id -g`
+-REAL_UID=$OWNER
+ 
+ # default is to install and don't append manifest
+ INSTALL=true
+@@ -94,24 +65,16 @@ MANIFEST=:
+ 
+ if $INSTALL
+ then
+-    CP=cp; LN=ln; MKDIR=mkdir; CHMOD=chmod; CHOWN=_chown
++    CP=cp; LN=ln; MKDIR=mkdir; CHMOD=chmod;
+ else
+-    CP=true; LN=true; MKDIR=true; CHMOD=true; CHOWN=true
++    CP=true; LN=true; MKDIR=true; CHMOD=true;
+ fi
+ 
+-[ -n "$DIST_ROOT" -a $REAL_UID -ne 0 ] && CHOWN=true
+-
+-while getopts "Dcm:d:S:o:g:T:" c $*
++while getopts "Dcm:d:S:T:" c $*
+ do
+    case $c in
+    c)
+ 	;;
+-   g)
+-	GROUP=$OPTARG
+-	;;
+-   o)
+-	OWNER=$OPTARG
+-	;;
+    m)
+ 	DIRMODE=`expr $OPTARG`
+ 	FILEMODE=$DIRMODE
+@@ -146,18 +109,7 @@ then
+     # first usage
+     #
+     $MKDIR -p $dir 
+-    status=$?
+-    if [ $status -eq 0 ]
+-    then
+-	$CHMOD $DIRMODE $dir
+-	status=$?
+-    fi
+-    if [ $status -eq 0 ]
+-    then
+-	$CHOWN $OWNER $GROUP $dir
+-	status=$?
+-    fi
+-    $MANIFEST d $DIRMODE $OWNER $GROUP ${dir#$DIST_ROOT}
++    $MANIFEST d $DIRMODE ${dir#$DIST_ROOT}
+ elif $Sflag
+ then
+     #
+@@ -203,7 +155,7 @@ then
+ 			install_name=$target/$solib
+ 			$CP $solib $install_name
+ 			status=$?
+-			$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$solib ${install_name#$DIST_ROOT}
++			$MANIFEST f $FILEMODE $HERE/$solib ${install_name#$DIST_ROOT}
+ 			break
+ 		fi
+ 	done
+@@ -254,7 +206,7 @@ then
+ 	install_name=$target/$old_library
+ 	$CP $old_library $install_name
+ 	status=$?
+-	$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$old_library ${install_name#$DIST_ROOT}
++	$MANIFEST f $FILEMODE $HERE/$old_library ${install_name#$DIST_ROOT}
+ 	;;
+     *)
+ 	echo "$prog: -T $lt_install invalid"
+@@ -267,7 +219,6 @@ then
+ 	if [ $status -eq 0 ]
+ 	then
+ 		$CHMOD $FILEMODE $install_name
+-		$CHOWN $OWNER $GROUP $install_name
+ 	fi
+ 	;;
+     esac
+@@ -292,23 +243,10 @@ else
+ 	then 
+ 	    if [ -f $dir/$f ]
+ 	    then
+-		$CHMOD $FILEMODE $dir/$f
+-		status=$?
+-		if [ $status -eq 0 ]
+-		then
+-		    $CHOWN $OWNER $GROUP $dir/$f
+-		    status=$?
+-		fi
+-		$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$f ${dir#$DIST_ROOT}/$f
++		$MANIFEST f $FILEMODE $HERE/$f ${dir#$DIST_ROOT}/$f
+ 	    else
+ 		$CHMOD $FILEMODE $dir
+-		status=$?
+-		if [ $status -eq 0 ]
+-		then
+-		    $CHOWN $OWNER $GROUP $dir
+-		    status=$?
+-		fi
+-		$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$dir ${dir#$DIST_ROOT}
++		$MANIFEST f $FILEMODE $HERE/$dir ${dir#$DIST_ROOT}
+ 	    fi
+ 	fi
+     else
+@@ -334,14 +272,7 @@ else
+ 	    status=$?
+ 	    if [ $status -eq 0 ]
+ 	    then
+-		$CHMOD $FILEMODE $dir/$f
+-		status=$?
+-		if [ $status -eq 0 ]
+-		then
+-		    $CHOWN $OWNER $GROUP $dir/$f
+-		    status=$?
+-		fi
+-		$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$f ${dir#$DIST_ROOT}/$f
++		$MANIFEST f $FILEMODE $HERE/$f ${dir#$DIST_ROOT}/$f
+ 	    fi
+ 	    [ $status -ne 0 ] && break
+ 	done
+-- 
+1.8.1.2
+
diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
new file mode 100644
index 0000000..4d152b1
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
@@ -0,0 +1,37 @@
+SUMMARY = "XFS Filesystem Dump Utility"
+DESCRIPTION = "The xfsdump package contains xfsdump, xfsrestore and a \
+               number of other utilities for administering XFS filesystems.\
+               xfsdump examines files in a filesystem, determines which \
+               need to be backed up, and copies those files to a \
+               specified disk, tape or other storage medium."
+HOMEPAGE = "http://oss.sgi.com/projects/xfs"
+SECTION = "base"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://doc/COPYING;md5=15c832894d10ddd00dfcf57bee490ecc"
+DEPENDS = "xfsprogs attr"
+
+SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${BPN}-${PV}.tar.gz \
+	   file://remove-install-as-user.patch \
+          "
+SRC_URI[md5sum] = "a8b1761be5feb363131e7b506639ad4c"
+SRC_URI[sha256sum] = "570eafd0721515bdd79cb0e295b701d49cdf81e71a0a0ff0df6d4c5cc1960943"
+
+inherit autotools
+B = "${S}"
+
+PARALLEL_MAKE = ""
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gettext] = "--enable-gettext=yes,--enable-gettext=no,gettext"
+
+EXTRA_OEMAKE += "'LIBTOOL=${HOST_SYS}-libtool' V=1"
+
+do_configure () {
+    export DEBUG="-DNDEBUG"
+    oe_runconf
+}
+
+do_install () {
+    export DIST_ROOT=${D}
+    oe_runmake install 
+    oe_runmake install-dev
+}
-- 
1.9.1


