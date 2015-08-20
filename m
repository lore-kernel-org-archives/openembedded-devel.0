Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 238B375E7D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 16:29:56 +0000 (UTC)
Received: by padfo6 with SMTP id fo6so25796476pad.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 09:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FepJSWNXP5HNIeBf5qgAeSFsHyfl7NJqmabYTHtXAQM=;
	b=JVwguBBjMhINqR/WUKJvCBONuzf7HyfH0eyMOh1g95me5J0VkQfDyecxFOb0WO5Wju
	c7izaYcMEfknhFwb4768b/424MMbl4cr1d8hWKg7nHQqopOPPs8Tbt/w/AIyucUpKpRv
	6j55sY/FjAozPzqllM47as6oNPL6tGtkOaVhGFIO0WIJBvbaPd77f7oTc2yZkHSXKuw9
	AlTguSmFDOpvzEXPQkWcGOrLwX8ZgBb2fzrY2TCeY1+Bi0LB039rwW11SO/1xl3XOVc5
	c2c6Seg9qujdJ3Q2Ugs59FDCn0U1tTxq7LpVkQNgVZYK3u+4xEW0GOwAr1c9C+BelCvo
	MSYA==
X-Gm-Message-State: ALoCoQnC1zsZljk/94J33iWpYw+ZaRuwGihyICuVEaRhUptsHlB+qkzepy3jtQPL7jEnNdrX3HPL
X-Received: by 10.66.146.132 with SMTP id tc4mr8009918pab.124.1440088196754;
	Thu, 20 Aug 2015 09:29:56 -0700 (PDT)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	zn9sm4908957pac.11.2015.08.20.09.29.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Aug 2015 09:29:56 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Aug 2015 21:59:50 +0530
Message-Id: <1440088190-1178-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-filesystems][PATCH] dmapi: add new recipe
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
X-List-Received-Date: Thu, 20 Aug 2015 16:29:57 -0000

The Data Management API (DMAPI/XDSM) allows implementation
of hierarchical storage management software with no kernel
modifications as well as high-performance dump programs
without requiring "raw" access to the disk and knowledge
of filesystem structures.This interface is implemented by
the libdm library.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../recipes-utils/dmapi/dmapi_2.2.12.bb            |  32 ++++
 .../files/dmapi_aarch64_configure_support.patch    |  37 ++++
 .../dmapi/files/remove-install-as-user.patch       | 205 +++++++++++++++++++++
 3 files changed, 274 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb
 create mode 100644 meta-filesystems/recipes-utils/dmapi/files/dmapi_aarch64_configure_support.patch
 create mode 100644 meta-filesystems/recipes-utils/dmapi/files/remove-install-as-user.patch

diff --git a/meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb b/meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb
new file mode 100644
index 0000000..5eaabb1
--- /dev/null
+++ b/meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Library functions to get attribute bits"
+DESCRIPTION = "The Data Management API (DMAPI/XDSM) allows implementation \
+               of hierarchical storage management software with no kernel \
+               modifications as well as high-performance dump programs \
+               without requiring "raw" access to the disk and knowledge \
+               of filesystem structures.This interface is implemented by \
+               the libdm library."
+
+HOMEPAGE = "http://oss.sgi.com/projects/xfs"
+SECTION = "base"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://doc/COPYING;md5=1678edfe8de9be9564d23761ae2fa794"
+DEPENDS = "xfsprogs"
+
+SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/dmapi-${PV}.tar.gz \
+	   file://remove-install-as-user.patch \
+           file://dmapi_aarch64_configure_support.patch \
+          "
+SRC_URI[md5sum] = "cd825d4e141c16011367e0a0dd98c9c5"
+SRC_URI[sha256sum] = "b18e34f47374f6adf7c164993c26df36986a009b86aa004ef9444102653aea69"
+
+inherit autotools
+B = "${S}"
+
+PARALLEL_MAKE = ""
+EXTRA_OEMAKE += "LIBTOOL="${HOST_SYS}-libtool --tag=CC" V=1"
+
+do_install () {
+    export DIST_ROOT=${D}
+    install -d ${D}${libdir}
+    oe_runmake install install-dev PKG_DEVLIB_DIR=${libdir}
+}
diff --git a/meta-filesystems/recipes-utils/dmapi/files/dmapi_aarch64_configure_support.patch b/meta-filesystems/recipes-utils/dmapi/files/dmapi_aarch64_configure_support.patch
new file mode 100644
index 0000000..98753b7
--- /dev/null
+++ b/meta-filesystems/recipes-utils/dmapi/files/dmapi_aarch64_configure_support.patch
@@ -0,0 +1,37 @@
+Add config support to cross compile dmapi for 
+aarch64 architecture
+
+Upstream-Status: Pending
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+
+--- dmapi-2.2.12_org/config.sub	2012-12-12 23:03:05.000000000 +0530
++++ dmapi-2.2.12/config.sub	2014-03-24 16:49:56.771993523 +0530
+@@ -246,6 +246,7 @@ case $basic_machine in
+ 	| alpha64 | alpha64ev[4-8] | alpha64ev56 | alpha64ev6[78] | alpha64pca5[67] \
+ 	| am33_2.0 \
+ 	| arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] | avr | avr32 \
++	| aarch64 | aarch64be \
+ 	| bfin \
+ 	| c4x | clipper \
+ 	| d10v | d30v | dlx | dsp16xx \
+@@ -326,6 +327,7 @@ case $basic_machine in
+ 	| alpha64-* | alpha64ev[4-8]-* | alpha64ev56-* | alpha64ev6[78]-* \
+ 	| alphapca5[67]-* | alpha64pca5[67]-* | arc-* \
+ 	| arm-*  | armbe-* | armle-* | armeb-* | armv*-* \
++	| aarch64-* | aarch64be-* \
+ 	| avr-* | avr32-* \
+ 	| bfin-* | bs2000-* \
+ 	| c[123]* | c30-* | [cjt]90-* | c4x-* | c54x-* | c55x-* | c6x-* \
+--- dmapi-2.2.12_org/config.guess	2012-12-12 23:03:05.000000000 +0530
++++ dmapi-2.2.12/config.guess	2014-03-24 16:49:56.771993523 +0530
+@@ -864,6 +864,9 @@ EOF
+ 	    echo ${UNAME_MACHINE}-unknown-linux-gnueabi
+ 	fi
+ 	exit ;;
++    aarch64*:Linux:*:*)
++	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	exit;;
+     avr32*:Linux:*:*)
+ 	echo ${UNAME_MACHINE}-unknown-linux-gnu
+ 	exit ;;
diff --git a/meta-filesystems/recipes-utils/dmapi/files/remove-install-as-user.patch b/meta-filesystems/recipes-utils/dmapi/files/remove-install-as-user.patch
new file mode 100644
index 0000000..e761db3
--- /dev/null
+++ b/meta-filesystems/recipes-utils/dmapi/files/remove-install-as-user.patch
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
-- 
1.9.1


