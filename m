Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E884E7197A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 06:41:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,424,1500912000"; d="scan'208";a="27557061"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Sep 2017 14:40:54 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 54F1B47CA56C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 14:40:53 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 21 Sep 2017 14:40:52 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Sep 2017 14:41:03 +0800
Message-ID: <1505976064-45756-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 54F1B47CA56C.A86EB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] byacc: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Thu, 21 Sep 2017 06:41:11 -0000
Content-Type: text/plain

copy byacc from meta to meta-oe.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-extended/byacc/byacc.inc           |  23 +++
 .../0001-byacc-do-not-reorder-CC-and-CFLAGS.patch  | 161 +++++++++++++++++++++
 .../recipes-extended/byacc/byacc/byacc-open.patch  |  25 ++++
 meta-oe/recipes-extended/byacc/byacc_20170201.bb   |  12 ++
 4 files changed, 221 insertions(+)
 create mode 100644 meta-oe/recipes-extended/byacc/byacc.inc
 create mode 100644 meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
 create mode 100644 meta-oe/recipes-extended/byacc/byacc/byacc-open.patch
 create mode 100644 meta-oe/recipes-extended/byacc/byacc_20170201.bb

diff --git a/meta-oe/recipes-extended/byacc/byacc.inc b/meta-oe/recipes-extended/byacc/byacc.inc
new file mode 100644
index 0000000..9bdafd2
--- /dev/null
+++ b/meta-oe/recipes-extended/byacc/byacc.inc
@@ -0,0 +1,23 @@
+SUMMARY = "Berkeley LALR Yacc parser generator"
+HOMEPAGE = "http://invisible-island.net/byacc/"
+DESCRIPTION = "A parser generator utility that reads a grammar specification from a file and generates an LR(1) \
+parser for it.  The parsers consist of a set of LALR(1) parsing tables and a driver routine written in the C \
+programming language."
+SECTION = "devel"
+LICENSE = "PD"
+
+SRC_URI = "ftp://invisible-island.net/byacc/byacc-${PV}.tgz \
+           file://byacc-open.patch \
+           file://0001-byacc-do-not-reorder-CC-and-CFLAGS.patch"
+
+EXTRA_OECONF += "--program-transform-name='s,^,b,'"
+
+BBCLASSEXTEND = "native"
+
+inherit autotools
+
+do_configure() {
+	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
+	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
+	oe_runconf
+}
diff --git a/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch b/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
new file mode 100644
index 0000000..7cd2510
--- /dev/null
+++ b/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
@@ -0,0 +1,161 @@
+Subject: byacc: do not reorder $CC and $CFLAGS
+
+byacc tries to process $CC and decide which part should belong to CC and which
+part should below to CFLAGS and then do reordering. It doesn't make much sense
+for OE. And it doesn't do its work correctly. Some options are dropped.
+
+Delete all these stuff so that we could have all options we need.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ aclocal.m4 |   1 -
+ configure  | 119 -------------------------------------------------------------
+ 2 files changed, 120 deletions(-)
+
+diff --git a/aclocal.m4 b/aclocal.m4
+index 917a848..62ef241 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -1021,7 +1021,6 @@ CF_GCC_VERSION
+ CF_ACVERSION_CHECK(2.52,
+ 	[AC_PROG_CC_STDC],
+ 	[CF_ANSI_CC_REQD])
+-CF_CC_ENV_FLAGS
+ ])dnl
+ dnl ---------------------------------------------------------------------------
+ dnl CF_PROG_GROFF version: 2 updated: 2015/07/04 11:16:27
+diff --git a/configure b/configure
+index 9707e50..4f0497c 100755
+--- a/configure
++++ b/configure
+@@ -1946,125 +1946,6 @@ esac
+ # This should have been defined by AC_PROG_CC
+ : ${CC:=cc}
+ 
+-echo "$as_me:1949: checking \$CC variable" >&5
+-echo $ECHO_N "checking \$CC variable... $ECHO_C" >&6
+-case "$CC" in
+-(*[\ \	]-*)
+-	echo "$as_me:1953: result: broken" >&5
+-echo "${ECHO_T}broken" >&6
+-	{ echo "$as_me:1955: WARNING: your environment misuses the CC variable to hold CFLAGS/CPPFLAGS options" >&5
+-echo "$as_me: WARNING: your environment misuses the CC variable to hold CFLAGS/CPPFLAGS options" >&2;}
+-	# humor him...
+-	cf_flags=`echo "$CC" | sed -e 's/^.*[ 	]\(-[^ 	]\)/\1/'`
+-	CC=`echo "$CC " | sed -e 's/[ 	]-[^ 	].*$//' -e 's/[ 	]*$//'`
+-	for cf_arg in $cf_flags
+-	do
+-		case "x$cf_arg" in
+-		(x-[IUDfgOW]*)
+-
+-cf_fix_cppflags=no
+-cf_new_cflags=
+-cf_new_cppflags=
+-cf_new_extra_cppflags=
+-
+-for cf_add_cflags in $cf_flags
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
+-				cf_new_extra_cppflags="$cf_new_extra_cppflags $cf_add_cflags"
+-				continue
+-			elif test "${cf_tst_cflags}" = "\"'" ; then
+-				cf_new_extra_cppflags="$cf_new_extra_cppflags $cf_add_cflags"
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
+-			cf_new_cppflags="$cf_new_cppflags $cf_add_cflags"
+-			;;
+-		esac
+-		;;
+-	(*)
+-		cf_new_cflags="$cf_new_cflags $cf_add_cflags"
+-		;;
+-	esac
+-	;;
+-(yes)
+-	cf_new_extra_cppflags="$cf_new_extra_cppflags $cf_add_cflags"
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
+-	CFLAGS="$CFLAGS $cf_new_cflags"
+-fi
+-
+-if test -n "$cf_new_cppflags" ; then
+-
+-	CPPFLAGS="$CPPFLAGS $cf_new_cppflags"
+-fi
+-
+-if test -n "$cf_new_extra_cppflags" ; then
+-
+-	EXTRA_CPPFLAGS="$cf_new_extra_cppflags $EXTRA_CPPFLAGS"
+-fi
+-
+-			;;
+-		(*)
+-			CC="$CC $cf_arg"
+-			;;
+-		esac
+-	done
+-	test -n "$verbose" && echo "	resulting CC: '$CC'" 1>&6
+-
+-echo "${as_me:-configure}:2051: testing resulting CC: '$CC' ..." 1>&5
+-
+-	test -n "$verbose" && echo "	resulting CFLAGS: '$CFLAGS'" 1>&6
+-
+-echo "${as_me:-configure}:2055: testing resulting CFLAGS: '$CFLAGS' ..." 1>&5
+-
+-	test -n "$verbose" && echo "	resulting CPPFLAGS: '$CPPFLAGS'" 1>&6
+-
+-echo "${as_me:-configure}:2059: testing resulting CPPFLAGS: '$CPPFLAGS' ..." 1>&5
+-
+-	;;
+-(*)
+-	echo "$as_me:2063: result: ok" >&5
+-echo "${ECHO_T}ok" >&6
+-	;;
+-esac
+-
+ echo "$as_me:2068: checking whether ${MAKE-make} sets \${MAKE}" >&5
+ echo $ECHO_N "checking whether ${MAKE-make} sets \${MAKE}... $ECHO_C" >&6
+ set dummy ${MAKE-make}; ac_make=`echo "$2" | sed 'y,./+-,__p_,'`
+-- 
+2.8.3
+
diff --git a/meta-oe/recipes-extended/byacc/byacc/byacc-open.patch b/meta-oe/recipes-extended/byacc/byacc/byacc-open.patch
new file mode 100644
index 0000000..0058311
--- /dev/null
+++ b/meta-oe/recipes-extended/byacc/byacc/byacc-open.patch
@@ -0,0 +1,25 @@
+Ubuntu defaults to passing _FORTIFY_SOURCE=2 which breaks byacc as it doesn't
+pass enough arguments to open():
+
+ inlined from 'open_tmpfile' at byacc-20150711/main.c:588:5:
+ /usr/include/x86_64-linux-gnu/bits/fcntl2.h:50:24: error: call to '__open_missing_mode' declared with attribute error:
+ open with O_CREAT in second argument needs 3 arguments
+
+Add a mode of 0666 to fix this.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/main.c b/main.c
+index 620ce3f..82071a4 100644
+--- a/main.c
++++ b/main.c
+@@ -526,7 +526,7 @@ my_mkstemp(char *temp)
+     }
+     if ((name = tempnam(dname, fname)) != 0)
+     {
+-	fd = open(name, O_CREAT | O_EXCL | O_RDWR);
++      fd = open(name, O_CREAT | O_EXCL | O_RDWR, 0666);
+ 	strcpy(temp, name);
+     }
+     else
diff --git a/meta-oe/recipes-extended/byacc/byacc_20170201.bb b/meta-oe/recipes-extended/byacc/byacc_20170201.bb
new file mode 100644
index 0000000..702c4c9
--- /dev/null
+++ b/meta-oe/recipes-extended/byacc/byacc_20170201.bb
@@ -0,0 +1,12 @@
+# Sigh. This is one of those places where everyone licenses it differently. Someone
+# even apply UCB to it (Free/Net/OpenBSD). The maintainer states that:
+# "I've found no reliable source which states that byacc must bear a UCB copyright."
+# Setting to PD as this is what the upstream has it as.
+
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=9176bfb16dab43ebcb8e50d9ee9550b6"
+require byacc.inc
+
+SRC_URI[md5sum] = "4bb274bbd7b648d4251c2b9ca36ed0c9"
+SRC_URI[sha256sum] = "90b768d177f91204e6e7cef226ae1dc7cac831b625774cebd3e233a917754f91"
+
-- 
2.7.4




