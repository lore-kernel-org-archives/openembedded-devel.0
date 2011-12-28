Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RfmYW-0006I4-2Q
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Dec 2011 07:00:04 +0100
Received: from mail119-ch1-R.bigfish.com (10.43.68.249) by
	CH1EHSOBE002.bigfish.com (10.43.70.52) with Microsoft SMTP Server id
	14.1.225.23; Wed, 28 Dec 2011 05:52:21 +0000
Received: from mail119-ch1 (localhost [127.0.0.1])	by
	mail119-ch1-R.bigfish.com (Postfix) with ESMTP id 85B635800B1	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2011 05:52:37 +0000 (UTC)
X-SpamScore: -13
X-BigFish: VS-13(z98bRz936eKzz1202hzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail119-ch1 (localhost.localdomain [127.0.0.1]) by mail119-ch1
	(MessageSwitch) id 1325051555180313_18463;
	Wed, 28 Dec 2011 05:52:35 +0000 (UTC)
Received: from CH1EHSMHS022.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.249])	by mail119-ch1.bigfish.com (Postfix) with ESMTP id
	1DD4B6C0048	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2011 05:52:35 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS022.bigfish.com
	(10.43.70.22) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 28 Dec 2011 05:52:16 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.355.3; Tue, 27 Dec 2011 23:52:36 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id pBS5qY92013592;
	Tue, 27 Dec 2011 23:52:35 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Dec 2011 13:56:17 +0800
Message-ID: <1325051777-15317-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v5 meta-oe] xfsprogs: add version 3.1.7
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
X-List-Received-Date: Wed, 28 Dec 2011 06:00:04 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    xfsprogs provides XFS filesystem utilities.

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 .../xfsprogs-3.1.7/remove-install-as-user.patch    |  368 ++++++++++++++++++++
 meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb |   46 +++
 2 files changed, 414 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.7/remove-install-as-user.patch
 create mode 100644 meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb

diff --git a/meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.7/remove-install-as-user.patch b/meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.7/remove-install-as-user.patch
new file mode 100644
index 0000000..1263aaf
--- /dev/null
+++ b/meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.7/remove-install-as-user.patch
@@ -0,0 +1,368 @@
+diff -urN a/include/buildmacros b/include/buildmacros
+--- a/include/buildmacros	2011-12-27 23:32:31.554197934 -0600
++++ b/include/buildmacros	2011-12-27 23:33:17.895485348 -0600
+@@ -30,7 +30,7 @@
+ 	  $(LFILES:.l=.o) \
+ 	  $(YFILES:%.y=%.tab.o)
+ 
+-INSTALL	= $(TOPDIR)/install-sh -o $(PKG_USER) -g $(PKG_GROUP)
++INSTALL	= $(TOPDIR)/install-sh
+ 
+ IMAGES_DIR = $(TOPDIR)/all-images
+ DIST_DIR = $(TOPDIR)/dist
+diff -urN a/include/install-sh b/include/install-sh
+--- a/include/install-sh	2011-12-27 23:32:31.556198121 -0600
++++ b/include/install-sh	2011-12-27 23:32:57.012201738 -0600
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
+@@ -38,32 +38,6 @@
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
+@@ -77,9 +51,6 @@
+ Tflag=false
+ DIRMODE=755
+ FILEMODE=644
+-OWNER=`id -u`
+-GROUP=`id -g`
+-REAL_UID=$OWNER
+ 
+ # default is to install and don't append manifest
+ INSTALL=true
+@@ -92,24 +63,16 @@
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
+@@ -144,18 +107,7 @@
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
+@@ -201,7 +153,7 @@
+ 			install_name=$target/$solib
+ 			$CP $solib $install_name
+ 			status=$?
+-			$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$solib ${install_name#$DIST_ROOT}
++			$MANIFEST f $FILEMODE $HERE/$solib ${install_name#$DIST_ROOT}
+ 			break
+ 		fi
+ 	done
+@@ -252,7 +204,7 @@
+ 	install_name=$target/$old_library
+ 	$CP $old_library $install_name
+ 	status=$?
+-	$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$old_library ${install_name#$DIST_ROOT}
++	$MANIFEST f $FILEMODE $HERE/$old_library ${install_name#$DIST_ROOT}
+ 	;;
+     *)
+ 	echo "$prog: -T $lt_install invalid"
+@@ -265,7 +217,6 @@
+ 	if [ $status -eq 0 ]
+ 	then
+ 		$CHMOD $FILEMODE $install_name
+-		$CHOWN $OWNER $GROUP $install_name
+ 	fi
+ 	;;
+     esac
+@@ -290,23 +241,10 @@
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
+@@ -332,14 +270,7 @@
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
+diff -urN a/install-sh b/install-sh
+--- a/install-sh	2011-12-27 23:32:31.565200349 -0600
++++ b/install-sh	2011-12-27 23:32:51.854178224 -0600
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
+@@ -38,32 +38,6 @@
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
+@@ -77,9 +51,6 @@
+ Tflag=false
+ DIRMODE=755
+ FILEMODE=644
+-OWNER=`id -u`
+-GROUP=`id -g`
+-REAL_UID=$OWNER
+ 
+ # default is to install and don't append manifest
+ INSTALL=true
+@@ -92,24 +63,16 @@
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
+@@ -144,18 +107,7 @@
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
+@@ -201,7 +153,7 @@
+ 			install_name=$target/$solib
+ 			$CP $solib $install_name
+ 			status=$?
+-			$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$solib ${install_name#$DIST_ROOT}
++			$MANIFEST f $FILEMODE $HERE/$solib ${install_name#$DIST_ROOT}
+ 			break
+ 		fi
+ 	done
+@@ -252,7 +204,7 @@
+ 	install_name=$target/$old_library
+ 	$CP $old_library $install_name
+ 	status=$?
+-	$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$old_library ${install_name#$DIST_ROOT}
++	$MANIFEST f $FILEMODE $HERE/$old_library ${install_name#$DIST_ROOT}
+ 	;;
+     *)
+ 	echo "$prog: -T $lt_install invalid"
+@@ -265,7 +217,6 @@
+ 	if [ $status -eq 0 ]
+ 	then
+ 		$CHMOD $FILEMODE $install_name
+-		$CHOWN $OWNER $GROUP $install_name
+ 	fi
+ 	;;
+     esac
+@@ -290,23 +241,10 @@
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
+@@ -332,14 +270,7 @@
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
diff --git a/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb b/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb
new file mode 100644
index 0000000..3830887
--- /dev/null
+++ b/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb
@@ -0,0 +1,46 @@
+DESCRIPTION = "XFS Filesystem Utilities"
+HOMEPAGE = "http://oss.sgi.com/projects/xfs"
+SECTION = "base"
+LICENSE = "LGPL2.1"
+
+LIC_FILES_CHKSUM = "file://Makefile;endline=3;md5=def2844770bb44eba37bc9ca8610fad4"
+
+DEPENDS = "util-linux"
+
+SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${P}.tar.gz \
+	file://remove-install-as-user.patch \
+"
+SRC_URI[md5sum] = "049cf9873794ea49d0bb3f12d45748a4"
+SRC_URI[sha256sum] = "e150914210ac5fd29c098ef0fd94bdec51d2fb231cf9faa765c16ec6d75c8eaa"
+
+inherit autotools
+
+FILES_${PN}-dev += "${base_libdir}/libhandle.la \
+                    ${base_libdir}/libhandle.so"
+
+EXTRA_OECONF = "--enable-gettext=no"
+do_configure () {
+	export DEBUG="-DNDEBUG"
+	oe_runconf
+}
+
+LIBTOOL = "${HOST_SYS}-libtool"
+EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
+TARGET_CC_ARCH += "${LDFLAGS}"
+PARALLEL_MAKE = ""
+
+do_install () {
+	export DIST_ROOT=${D}
+	oe_runmake install
+	# needed for xfsdump
+	oe_runmake install-dev
+	# replace extra links to /usr/lib with relative links (otherwise autotools_prepackage_lamangler fails to read nonexistent link)
+	rm -f ${D}/${base_libdir}/libhandle.la
+	rm -f ${D}/${base_libdir}/libhandle.a
+	ln -s ../usr/lib/libhandle.la ${D}/${base_libdir}/libhandle.la
+	ln -s ../usr/lib/libhandle.a ${D}/${base_libdir}/libhandle.a
+
+	# and link from /usr/lib/libhandle.so to /lib/libhandle.so
+	rm -f ${D}/${libdir}/libhandle.so
+	ln -s ../../lib/libhandle.a ${D}/${libdir}/libhandle.so
+}
-- 
1.7.0.4




