Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id C871A765A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 17:10:32 +0000 (UTC)
Received: by padfo6 with SMTP id fo6so11118791pad.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 10:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zfXodYROsG85Sij7vXhdNo7bq5Q7gE6ENzZupNHeg8s=;
	b=VoVIsTVSSTGTuYic3puw6pTf8swlVtNResFLlbaUiNv3mBYoLCDIuw90kU8C53ry7u
	DEm+3Bmryma5aXfjiAhQLwh08mozPMk5QEYidxK6RASp3wkrTACPCZh6pHG7gNEliazg
	DseG3ssu/IgzQScN++RnZkc1QAXnQIryGSj8WHKeS4Jb9n8DhmUGHhhVN0D6FLCmZGkr
	q3uVCPaEuCGPoHaw4nBYuexlaHaC9REVfTV/3PPOSVB6tqP30blur3IaDVlRUrMAwF4m
	3sLb5LX8aUf2rqiaDCRQ9Qwe5lP3cucmSswyfFqkjVPEuVc8EXOeI6MdNPKk2XPzJSw5
	ar1w==
X-Gm-Message-State: ALoCoQn1ygVPkAqGyPQW8U87KeVLlNOnrfBFYYdvlyeU7xiL9W0DI6/2/Z2s7kTl51TZ7y9rAMEF
X-Received: by 10.68.203.42 with SMTP id kn10mr19283294pbc.43.1440177033014;
	Fri, 21 Aug 2015 10:10:33 -0700 (PDT)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	ft7sm8436144pdb.58.2015.08.21.10.10.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 21 Aug 2015 10:10:32 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Aug 2015 22:38:27 +0530
Message-Id: <1440176907-30839-2-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1440176907-30839-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1440176907-30839-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [meta-filesystems][PATCH v2] xfsdump: add new recipe
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
X-List-Received-Date: Fri, 21 Aug 2015 17:10:32 -0000

The xfsdump package contains xfsdump, xfsrestore and a
number of other utilities for administering XFS filesystems.
xfsdump examines files in a filesystem, determines which
need to be backed up, and copies those files to a
specified disk, tape or other storage medium.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../xfsdump/files/remove-install-as-user.patch     | 205 +++++++++++++++++++++
 .../recipes-utils/xfsdump/xfsdump_3.1.4.bb         |  36 ++++
 2 files changed, 241 insertions(+)
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
index 0000000..e053a6e
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
@@ -0,0 +1,36 @@
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
+inherit autotools-brokensep
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


