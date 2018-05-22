Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 08F2F74886
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 05:11:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="40194084"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 May 2018 13:11:09 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id CA45A4B402E7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 13:11:07 +0800 (CST)
Received: from localhost.localdomain (10.167.226.122) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 22 May 2018 13:11:11 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 May 2018 13:10:29 +0800
Message-ID: <20180522051029.28878-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.226.122]
X-yoursite-MailScanner-ID: CA45A4B402E7.A2789
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: Hong Liu <hongl.fnst@cn.fujitsu.com>
Subject: [PATCH] [meta-oe][PATCH] byacc: 20170201 -> 20180510
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
X-List-Received-Date: Tue, 22 May 2018 05:11:11 -0000
Content-Type: text/plain

  1. Upgrade byacc from 20170201 to 20180510

  2. Update md5 checksum of license, since the copyright's time has been modified.

  3. Modify the SRC_URI

  4. Modify 0001-byacc-do-not-reorder-CC-and-CFLAGS.patch

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-extended/byacc/byacc.inc           |  2 +-
 .../0001-byacc-do-not-reorder-CC-and-CFLAGS.patch  | 70 ++++++++++++++--------
 .../byacc/{byacc_20170201.bb => byacc_20180510.bb} |  6 +-
 3 files changed, 50 insertions(+), 28 deletions(-)
 rename meta-oe/recipes-extended/byacc/{byacc_20170201.bb => byacc_20180510.bb} (58%)

diff --git a/meta-oe/recipes-extended/byacc/byacc.inc b/meta-oe/recipes-extended/byacc/byacc.inc
index 9bdafd2..5214715 100644
--- a/meta-oe/recipes-extended/byacc/byacc.inc
+++ b/meta-oe/recipes-extended/byacc/byacc.inc
@@ -6,7 +6,7 @@ programming language."
 SECTION = "devel"
 LICENSE = "PD"
 
-SRC_URI = "ftp://invisible-island.net/byacc/byacc-${PV}.tgz \
+SRC_URI = "ftp://ftp.invisible-island.net/byacc/byacc-${PV}.tgz \
            file://byacc-open.patch \
            file://0001-byacc-do-not-reorder-CC-and-CFLAGS.patch"
 
diff --git a/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch b/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
index 7cd2510..3bc0db9 100644
--- a/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
+++ b/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
@@ -9,28 +9,29 @@ Delete all these stuff so that we could have all options we need.
 Upstream-Status: Inappropriate [OE Specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  aclocal.m4 |   1 -
- configure  | 119 -------------------------------------------------------------
- 2 files changed, 120 deletions(-)
+ configure  | 140 -------------------------------------------------------------
+ 2 files changed, 141 deletions(-)
 
 diff --git a/aclocal.m4 b/aclocal.m4
-index 917a848..62ef241 100644
+index 0d14f26..0cefa08 100644
 --- a/aclocal.m4
 +++ b/aclocal.m4
-@@ -1021,7 +1021,6 @@ CF_GCC_VERSION
+@@ -1038,7 +1038,6 @@ CF_GCC_VERSION
  CF_ACVERSION_CHECK(2.52,
  	[AC_PROG_CC_STDC],
  	[CF_ANSI_CC_REQD])
 -CF_CC_ENV_FLAGS
  ])dnl
  dnl ---------------------------------------------------------------------------
- dnl CF_PROG_GROFF version: 2 updated: 2015/07/04 11:16:27
+ dnl CF_PROG_GROFF version: 3 updated: 2018/01/07 13:16:19
 diff --git a/configure b/configure
-index 9707e50..4f0497c 100755
+index d27ae31..077c648 100755
 --- a/configure
 +++ b/configure
-@@ -1946,125 +1946,6 @@ esac
+@@ -1946,146 +1946,6 @@ esac
  # This should have been defined by AC_PROG_CC
  : ${CC:=cc}
  
@@ -43,8 +44,9 @@ index 9707e50..4f0497c 100755
 -	{ echo "$as_me:1955: WARNING: your environment misuses the CC variable to hold CFLAGS/CPPFLAGS options" >&5
 -echo "$as_me: WARNING: your environment misuses the CC variable to hold CFLAGS/CPPFLAGS options" >&2;}
 -	# humor him...
--	cf_flags=`echo "$CC" | sed -e 's/^.*[ 	]\(-[^ 	]\)/\1/'`
--	CC=`echo "$CC " | sed -e 's/[ 	]-[^ 	].*$//' -e 's/[ 	]*$//'`
+-	cf_prog=`echo "$CC" | sed -e 's/	/ /g' -e 's/[ ]* / /g' -e 's/[ ]*[ ]-[^ ].*//'`
+-	cf_flags=`echo "$CC" | ${AWK:-awk} -v prog="$cf_prog" '{ printf("%s", substr($0,1+length(prog))); }'`
+-	CC="$cf_prog"
 -	for cf_arg in $cf_flags
 -	do
 -		case "x$cf_arg" in
@@ -55,7 +57,7 @@ index 9707e50..4f0497c 100755
 -cf_new_cppflags=
 -cf_new_extra_cppflags=
 -
--for cf_add_cflags in $cf_flags
+-for cf_add_cflags in $cf_arg
 -do
 -case $cf_fix_cppflags in
 -(no)
@@ -70,10 +72,16 @@ index 9707e50..4f0497c 100755
 -				&& cf_fix_cppflags=yes
 -
 -			if test $cf_fix_cppflags = yes ; then
--				cf_new_extra_cppflags="$cf_new_extra_cppflags $cf_add_cflags"
+-
+-	test -n "$cf_new_extra_cppflags" && cf_new_extra_cppflags="$cf_new_extra_cppflags "
+-	cf_new_extra_cppflags="${cf_new_extra_cppflags}$cf_add_cflags"
+-
 -				continue
 -			elif test "${cf_tst_cflags}" = "\"'" ; then
--				cf_new_extra_cppflags="$cf_new_extra_cppflags $cf_add_cflags"
+-
+-	test -n "$cf_new_extra_cppflags" && cf_new_extra_cppflags="$cf_new_extra_cppflags "
+-	cf_new_extra_cppflags="${cf_new_extra_cppflags}$cf_add_cflags"
+-
 -				continue
 -			fi
 -			;;
@@ -92,17 +100,25 @@ index 9707e50..4f0497c 100755
 -
 -				;;
 -			esac
--			cf_new_cppflags="$cf_new_cppflags $cf_add_cflags"
+-
+-	test -n "$cf_new_cppflags" && cf_new_cppflags="$cf_new_cppflags "
+-	cf_new_cppflags="${cf_new_cppflags}$cf_add_cflags"
+-
 -			;;
 -		esac
 -		;;
 -	(*)
--		cf_new_cflags="$cf_new_cflags $cf_add_cflags"
+-
+-	test -n "$cf_new_cflags" && cf_new_cflags="$cf_new_cflags "
+-	cf_new_cflags="${cf_new_cflags}$cf_add_cflags"
+-
 -		;;
 -	esac
 -	;;
 -(yes)
--	cf_new_extra_cppflags="$cf_new_extra_cppflags $cf_add_cflags"
+-
+-	test -n "$cf_new_extra_cppflags" && cf_new_extra_cppflags="$cf_new_extra_cppflags "
+-	cf_new_extra_cppflags="${cf_new_extra_cppflags}$cf_add_cflags"
 -
 -	cf_tst_cflags=`echo ${cf_add_cflags} |sed -e 's/^[^"]*"'\''//'`
 -
@@ -115,17 +131,23 @@ index 9707e50..4f0497c 100755
 -
 -if test -n "$cf_new_cflags" ; then
 -
--	CFLAGS="$CFLAGS $cf_new_cflags"
+-	test -n "$CFLAGS" && CFLAGS="$CFLAGS "
+-	CFLAGS="${CFLAGS}$cf_new_cflags"
+-
 -fi
 -
 -if test -n "$cf_new_cppflags" ; then
 -
--	CPPFLAGS="$CPPFLAGS $cf_new_cppflags"
+-	test -n "$CPPFLAGS" && CPPFLAGS="$CPPFLAGS "
+-	CPPFLAGS="${CPPFLAGS}$cf_new_cppflags"
+-
 -fi
 -
 -if test -n "$cf_new_extra_cppflags" ; then
 -
--	EXTRA_CPPFLAGS="$cf_new_extra_cppflags $EXTRA_CPPFLAGS"
+-	test -n "$EXTRA_CPPFLAGS" && EXTRA_CPPFLAGS="$EXTRA_CPPFLAGS "
+-	EXTRA_CPPFLAGS="${EXTRA_CPPFLAGS}$cf_new_extra_cppflags"
+-
 -fi
 -
 -			;;
@@ -136,26 +158,26 @@ index 9707e50..4f0497c 100755
 -	done
 -	test -n "$verbose" && echo "	resulting CC: '$CC'" 1>&6
 -
--echo "${as_me:-configure}:2051: testing resulting CC: '$CC' ..." 1>&5
+-echo "${as_me:-configure}:2072: testing resulting CC: '$CC' ..." 1>&5
 -
 -	test -n "$verbose" && echo "	resulting CFLAGS: '$CFLAGS'" 1>&6
 -
--echo "${as_me:-configure}:2055: testing resulting CFLAGS: '$CFLAGS' ..." 1>&5
+-echo "${as_me:-configure}:2076: testing resulting CFLAGS: '$CFLAGS' ..." 1>&5
 -
 -	test -n "$verbose" && echo "	resulting CPPFLAGS: '$CPPFLAGS'" 1>&6
 -
--echo "${as_me:-configure}:2059: testing resulting CPPFLAGS: '$CPPFLAGS' ..." 1>&5
+-echo "${as_me:-configure}:2080: testing resulting CPPFLAGS: '$CPPFLAGS' ..." 1>&5
 -
 -	;;
 -(*)
--	echo "$as_me:2063: result: ok" >&5
+-	echo "$as_me:2084: result: ok" >&5
 -echo "${ECHO_T}ok" >&6
 -	;;
 -esac
 -
- echo "$as_me:2068: checking whether ${MAKE-make} sets \${MAKE}" >&5
+ echo "$as_me:2089: checking whether ${MAKE-make} sets \${MAKE}" >&5
  echo $ECHO_N "checking whether ${MAKE-make} sets \${MAKE}... $ECHO_C" >&6
  set dummy ${MAKE-make}; ac_make=`echo "$2" | sed 'y,./+-,__p_,'`
 -- 
-2.8.3
+2.7.4
 
diff --git a/meta-oe/recipes-extended/byacc/byacc_20170201.bb b/meta-oe/recipes-extended/byacc/byacc_20180510.bb
similarity index 58%
rename from meta-oe/recipes-extended/byacc/byacc_20170201.bb
rename to meta-oe/recipes-extended/byacc/byacc_20180510.bb
index 702c4c9..f30c426 100644
--- a/meta-oe/recipes-extended/byacc/byacc_20170201.bb
+++ b/meta-oe/recipes-extended/byacc/byacc_20180510.bb
@@ -4,9 +4,9 @@
 # Setting to PD as this is what the upstream has it as.
 
 LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=9176bfb16dab43ebcb8e50d9ee9550b6"
+LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=8b2933503c0443e041d3168dc0c65640"
 require byacc.inc
 
-SRC_URI[md5sum] = "4bb274bbd7b648d4251c2b9ca36ed0c9"
-SRC_URI[sha256sum] = "90b768d177f91204e6e7cef226ae1dc7cac831b625774cebd3e233a917754f91"
+SRC_URI[md5sum] = "97fdc0745e0ff0cef5c09d57d0c6752d"
+SRC_URI[sha256sum] = "d0940dbffbc7e9c9dd4985c25349c390beede84ae1d9fe86b71c0aa659a6d693"
 
-- 
2.7.4




