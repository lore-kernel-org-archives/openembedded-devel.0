Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2E8536B076
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 09:31:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,220,1569254400"; d="scan'208";a="77361286"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Oct 2019 17:31:21 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3CC6B4CE1507
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 17:23:27 +0800 (CST)
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 17:31:20 +0800
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 23 Oct 2019 17:31:19 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Oct 2019 17:31:07 +0800
Message-ID: <1571823067-128967-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3CC6B4CE1507.A785D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] byacc: upgrade 20180510 -> 20190617
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
X-List-Received-Date: Wed, 23 Oct 2019 09:31:22 -0000
Content-Type: text/plain

1) Update 0001-byacc-do-not-reorder-CC-and-CFLAGS.patch for new version.

2) Update LIC_FILES_CHKSUM for date has been changed from '2004-2017,2018' to '2004-2018,2019'.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../0001-byacc-do-not-reorder-CC-and-CFLAGS.patch  | 151 +++++++++++++++++++--
 .../byacc/{byacc_20180510.bb => byacc_20190617.bb} |   6 +-
 2 files changed, 139 insertions(+), 18 deletions(-)
 rename meta-oe/recipes-extended/byacc/{byacc_20180510.bb => byacc_20190617.bb} (58%)

diff --git a/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch b/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
index 3bc0db9..24864ea 100644
--- a/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
+++ b/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
@@ -10,16 +10,18 @@ Upstream-Status: Inappropriate [OE Specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 
+Update for 20190617.
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
  aclocal.m4 |   1 -
- configure  | 140 -------------------------------------------------------------
- 2 files changed, 141 deletions(-)
+ configure  | 259 -------------------------------------------------------------
+ 2 files changed, 260 deletions(-)
 
 diff --git a/aclocal.m4 b/aclocal.m4
-index 0d14f26..0cefa08 100644
+index 338465f..3311057 100644
 --- a/aclocal.m4
 +++ b/aclocal.m4
-@@ -1038,7 +1038,6 @@ CF_GCC_VERSION
+@@ -1231,7 +1231,6 @@ CF_GCC_VERSION
  CF_ACVERSION_CHECK(2.52,
  	[AC_PROG_CC_STDC],
  	[CF_ANSI_CC_REQD])
@@ -28,21 +30,140 @@ index 0d14f26..0cefa08 100644
  dnl ---------------------------------------------------------------------------
  dnl CF_PROG_GROFF version: 3 updated: 2018/01/07 13:16:19
 diff --git a/configure b/configure
-index d27ae31..077c648 100755
+index ebb1f0f..a56cb17 100755
 --- a/configure
 +++ b/configure
-@@ -1946,146 +1946,6 @@ esac
+@@ -1957,265 +1957,6 @@ esac
  # This should have been defined by AC_PROG_CC
  : ${CC:=cc}
  
--echo "$as_me:1949: checking \$CC variable" >&5
+-echo "$as_me:1960: checking \$CFLAGS variable" >&5
+-echo $ECHO_N "checking \$CFLAGS variable... $ECHO_C" >&6
+-case "x$CFLAGS" in
+-(*-[IUD]*)
+-	echo "$as_me:1964: result: broken" >&5
+-echo "${ECHO_T}broken" >&6
+-	{ echo "$as_me:1966: WARNING: your environment uses the CFLAGS variable to hold CPPFLAGS options" >&5
+-echo "$as_me: WARNING: your environment uses the CFLAGS variable to hold CPPFLAGS options" >&2;}
+-	cf_flags="$CFLAGS"
+-	CFLAGS=
+-	for cf_arg in $cf_flags
+-	do
+-
+-cf_fix_cppflags=no
+-cf_new_cflags=
+-cf_new_cppflags=
+-cf_new_extra_cppflags=
+-
+-for cf_add_cflags in $cf_arg
+-do
+-case $cf_fix_cppflags in
+-(no)
+-	case $cf_add_cflags in
+-	(-undef|-nostdinc*|-I*|-D*|-U*|-E|-P|-C)
+-		case $cf_add_cflags in
+-		(-D*)
+-			cf_tst_cflags=`echo ${cf_add_cflags} |sed -e 's/^-D[^=]*='\''\"[^"]*//'`
+-
+-			test "x${cf_add_cflags}" != "x${cf_tst_cflags}" \
+-				&& test -z "${cf_tst_cflags}" \
+-				&& cf_fix_cppflags=yes
+-
+-			if test $cf_fix_cppflags = yes ; then
+-
+-	test -n "$cf_new_extra_cppflags" && cf_new_extra_cppflags="$cf_new_extra_cppflags "
+-	cf_new_extra_cppflags="${cf_new_extra_cppflags}$cf_add_cflags"
+-
+-				continue
+-			elif test "${cf_tst_cflags}" = "\"'" ; then
+-
+-	test -n "$cf_new_extra_cppflags" && cf_new_extra_cppflags="$cf_new_extra_cppflags "
+-	cf_new_extra_cppflags="${cf_new_extra_cppflags}$cf_add_cflags"
+-
+-				continue
+-			fi
+-			;;
+-		esac
+-		case "$CPPFLAGS" in
+-		(*$cf_add_cflags)
+-			;;
+-		(*)
+-			case $cf_add_cflags in
+-			(-D*)
+-				cf_tst_cppflags=`echo "x$cf_add_cflags" | sed -e 's/^...//' -e 's/=.*//'`
+-
+-CPPFLAGS=`echo "$CPPFLAGS" | \
+-	sed	-e 's/-[UD]'"$cf_tst_cppflags"'\(=[^ 	]*\)\?[ 	]/ /g' \
+-		-e 's/-[UD]'"$cf_tst_cppflags"'\(=[^ 	]*\)\?$//g'`
+-
+-				;;
+-			esac
+-
+-	test -n "$cf_new_cppflags" && cf_new_cppflags="$cf_new_cppflags "
+-	cf_new_cppflags="${cf_new_cppflags}$cf_add_cflags"
+-
+-			;;
+-		esac
+-		;;
+-	(*)
+-
+-	test -n "$cf_new_cflags" && cf_new_cflags="$cf_new_cflags "
+-	cf_new_cflags="${cf_new_cflags}$cf_add_cflags"
+-
+-		;;
+-	esac
+-	;;
+-(yes)
+-
+-	test -n "$cf_new_extra_cppflags" && cf_new_extra_cppflags="$cf_new_extra_cppflags "
+-	cf_new_extra_cppflags="${cf_new_extra_cppflags}$cf_add_cflags"
+-
+-	cf_tst_cflags=`echo ${cf_add_cflags} |sed -e 's/^[^"]*"'\''//'`
+-
+-	test "x${cf_add_cflags}" != "x${cf_tst_cflags}" \
+-		&& test -z "${cf_tst_cflags}" \
+-		&& cf_fix_cppflags=no
+-	;;
+-esac
+-done
+-
+-if test -n "$cf_new_cflags" ; then
+-
+-	test -n "$CFLAGS" && CFLAGS="$CFLAGS "
+-	CFLAGS="${CFLAGS}$cf_new_cflags"
+-
+-fi
+-
+-if test -n "$cf_new_cppflags" ; then
+-
+-	test -n "$CPPFLAGS" && CPPFLAGS="$CPPFLAGS "
+-	CPPFLAGS="${CPPFLAGS}$cf_new_cppflags"
+-
+-fi
+-
+-if test -n "$cf_new_extra_cppflags" ; then
+-
+-	test -n "$EXTRA_CPPFLAGS" && EXTRA_CPPFLAGS="$EXTRA_CPPFLAGS "
+-	EXTRA_CPPFLAGS="${EXTRA_CPPFLAGS}$cf_new_extra_cppflags"
+-
+-fi
+-
+-	done
+-	;;
+-(*)
+-	echo "$as_me:2074: result: ok" >&5
+-echo "${ECHO_T}ok" >&6
+-	;;
+-esac
+-
+-echo "$as_me:2079: checking \$CC variable" >&5
 -echo $ECHO_N "checking \$CC variable... $ECHO_C" >&6
 -case "$CC" in
 -(*[\ \	]-*)
--	echo "$as_me:1953: result: broken" >&5
+-	echo "$as_me:2083: result: broken" >&5
 -echo "${ECHO_T}broken" >&6
--	{ echo "$as_me:1955: WARNING: your environment misuses the CC variable to hold CFLAGS/CPPFLAGS options" >&5
--echo "$as_me: WARNING: your environment misuses the CC variable to hold CFLAGS/CPPFLAGS options" >&2;}
+-	{ echo "$as_me:2085: WARNING: your environment uses the CC variable to hold CFLAGS/CPPFLAGS options" >&5
+-echo "$as_me: WARNING: your environment uses the CC variable to hold CFLAGS/CPPFLAGS options" >&2;}
 -	# humor him...
 -	cf_prog=`echo "$CC" | sed -e 's/	/ /g' -e 's/[ ]* / /g' -e 's/[ ]*[ ]-[^ ].*//'`
 -	cf_flags=`echo "$CC" | ${AWK:-awk} -v prog="$cf_prog" '{ printf("%s", substr($0,1+length(prog))); }'`
@@ -158,24 +279,24 @@ index d27ae31..077c648 100755
 -	done
 -	test -n "$verbose" && echo "	resulting CC: '$CC'" 1>&6
 -
--echo "${as_me:-configure}:2072: testing resulting CC: '$CC' ..." 1>&5
+-echo "${as_me:-configure}:2202: testing resulting CC: '$CC' ..." 1>&5
 -
 -	test -n "$verbose" && echo "	resulting CFLAGS: '$CFLAGS'" 1>&6
 -
--echo "${as_me:-configure}:2076: testing resulting CFLAGS: '$CFLAGS' ..." 1>&5
+-echo "${as_me:-configure}:2206: testing resulting CFLAGS: '$CFLAGS' ..." 1>&5
 -
 -	test -n "$verbose" && echo "	resulting CPPFLAGS: '$CPPFLAGS'" 1>&6
 -
--echo "${as_me:-configure}:2080: testing resulting CPPFLAGS: '$CPPFLAGS' ..." 1>&5
+-echo "${as_me:-configure}:2210: testing resulting CPPFLAGS: '$CPPFLAGS' ..." 1>&5
 -
 -	;;
 -(*)
--	echo "$as_me:2084: result: ok" >&5
+-	echo "$as_me:2214: result: ok" >&5
 -echo "${ECHO_T}ok" >&6
 -	;;
 -esac
 -
- echo "$as_me:2089: checking whether ${MAKE-make} sets \${MAKE}" >&5
+ echo "$as_me:2219: checking whether ${MAKE-make} sets \${MAKE}" >&5
  echo $ECHO_N "checking whether ${MAKE-make} sets \${MAKE}... $ECHO_C" >&6
  set dummy ${MAKE-make}; ac_make=`echo "$2" | sed 'y,./+-,__p_,'`
 -- 
diff --git a/meta-oe/recipes-extended/byacc/byacc_20180510.bb b/meta-oe/recipes-extended/byacc/byacc_20190617.bb
similarity index 58%
rename from meta-oe/recipes-extended/byacc/byacc_20180510.bb
rename to meta-oe/recipes-extended/byacc/byacc_20190617.bb
index f30c426..2834b7c 100644
--- a/meta-oe/recipes-extended/byacc/byacc_20180510.bb
+++ b/meta-oe/recipes-extended/byacc/byacc_20190617.bb
@@ -4,9 +4,9 @@
 # Setting to PD as this is what the upstream has it as.
 
 LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=8b2933503c0443e041d3168dc0c65640"
+LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=3eb7c635434fafe23ef30fc263e63b2f"
 require byacc.inc
 
-SRC_URI[md5sum] = "97fdc0745e0ff0cef5c09d57d0c6752d"
-SRC_URI[sha256sum] = "d0940dbffbc7e9c9dd4985c25349c390beede84ae1d9fe86b71c0aa659a6d693"
+SRC_URI[md5sum] = "17b3f7e7ed570d785b145064d99df615"
+SRC_URI[sha256sum] = "f87868167b920bf2cb30fc32b62f63ae15671181ef329226d1063100be02518d"
 
-- 
2.7.4




