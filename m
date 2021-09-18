Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web09.2221.1631936925561584163
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Sep 2021 20:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XcqFIq7A;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631936923; i=@fujitsu.com;
	bh=0/VhYYsCjRbZSbDcliik3buay34BQnmyxR0vwHLq/8E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=XcqFIq7AV9bWrK5H7jC5MpIGfOgEkTOlx11WUc8k8ios6ApVJuK35E1o6rSkL6i/D
	 9FoUGzschjGEKEaeZwpzJHDCum7wY80NcY35GJHZ5+susQsXiCuWX6azjOc6Uf/nAw
	 IsdOSf1n135QPXJHunw+Ud0+plKfVjze3UVu2VijRdfuxosWZduAVSUqr3qsQs15/6
	 d6ngqWmYBMNGzgj3rJnuWVdOdxhJW5TqFgKuBBA/qMGi21Wu5mycrZ9LDe/b40UmZf
	 3kj+wx9xYIHQPMfM7XjbeCPt8f1VxNffnbByTkJ9VGjts5q0YXyn4t07If0R/sxxnh
	 kBrCLW4JL7S8g==
Received: from [100.113.6.157] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id AC/38-09251-A9165416; Sat, 18 Sep 2021 03:48:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRWlGSWpSXmKPExsViZ8MxRXdWomu
  iwZkDHBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bdaW2MBafcKg5PnMrWwPjXpouRi0NIYDaT
  xOHZ/9ggnBOMEhsudbF3MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D1iNsICzxOaLO
  8FqWARUJd5+n8oCYvMKOEmcvTuJDcSWEFCQmPLwPTNEXFDi5MwnLBBzJCQOvnjBDFGjKDH7cj
  MLhF0hMWtWG9MERt5ZSFpmIWlZwMi0itEiqSgzPaMkNzEzR9fQwEDX0NBY10zXwlwvsUo3SS+
  1VDc5Na+kKBEoqZdYXqxXXJmbnJOil5dasokRGGAphWzhOxjPvP6gd4hRkoNJSZS33801UYgv
  KT+lMiOxOCO+qDQntfgQowwHh5IEb2ACUE6wKDU9tSItMwcY7DBpCQ4eJRHe+HigNG9xQWJuc
  WY6ROoUozHHztOLFzFzfFm1ZBGzEEtefl6qlDjvPJBJAiClGaV5cINgUXiJUVZKmJeRgYFBiK
  cgtSg3swRV/hWjOAejkjBvH8hCnsy8Erh9r4BOYQI6JWGLC8gpJYkIKakGJtdEvsveHDXbq7N
  K3yleiNZ6J5W0rLdx4STP8B7TNwm79luKPXq7xtBXbtsHvRP5rn1lt9umz2G4brBMILpRbO38
  ftGS8OPuCgtnWB57l+CSEZInsGTD1AbHTz22gnF/XnAvvRjn1+ww/eVdxrboHYc895wsFFxy6
  nXBGlXVsPiNIid3yF60+BoQveCS3MGaqqpev1saPV0PeyR+R8yvT5lifuA0izvTkbVM5zV36v
  2593yXTSyD+OojyXeK6+dOv9jeflAt7a6fydkEh+4Lr+bXLEx4L+K/vSzaVX6r/fcVakkmSRk
  MXy5pmZUFzImPSJFd9MPo7vRzXP+ueTL17ZmROy364tIFsxtTX6msU2Ipzkg01GIuKk4EAGnR
  MPQ9AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-245.messagelabs.com!1631936921!75015!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18736 invoked from network); 18 Sep 2021 03:48:42 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-16.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Sep 2021 03:48:42 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18I3mZFL017400
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 04:48:41 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Sat, 18 Sep 2021 04:48:34 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] byacc: upgrade 20200910 -> 20210808
Date: Sat, 18 Sep 2021 11:48:20 +0800
Message-ID: <1631936900-46096-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

refresh 0001-byacc-do-not-reorder-CC-and-CFLAGS.patch

-License-Update: Copyright year updated to 2021.

 * reader.c:
   fix memory-leak when replacing $$'s in destructor code (report/testcase
   by Boris Kolpackov).

 * main.c: account for a memory-leak

 * btyaccpar.skel, yaccpar.skel:
   revert change to initialization of yystate, which confuses gcc, making a
   different warning

 * VERSION, package/byacc.spec, package/debian/changelog, package/mingw-byacc.spec, package/pkgsrc/Makefile:
   bump

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...1-byacc-do-not-reorder-CC-and-CFLAGS.patch | 65 ++++++++++---------
 .../{byacc_20200910.bb => byacc_20210808.bb}  |  5 +-
 2 files changed, 36 insertions(+), 34 deletions(-)
 rename meta-oe/recipes-extended/byacc/{byacc_20200910.bb => byacc_20210808.bb} (58%)

diff --git a/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch b/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
index 5dcc6afdfe..8365da0f90 100644
--- a/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
+++ b/meta-oe/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
@@ -18,16 +18,19 @@ Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 
 Update for 20200910.
 Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+
+Update for 20210808.
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
  aclocal.m4 |   1 -
  configure  | 259 -----------------------------------------------------
  2 files changed, 260 deletions(-)
 
 diff --git a/aclocal.m4 b/aclocal.m4
-index 1c6a3ee..2f7e9b5 100644
+index 7a9a8fb..108b6cc 100644
 --- a/aclocal.m4
 +++ b/aclocal.m4
-@@ -1317,7 +1317,6 @@ CF_GCC_VERSION
+@@ -1401,7 +1401,6 @@ CF_GCC_VERSION
  CF_ACVERSION_CHECK(2.52,
  	[AC_PROG_CC_STDC],
  	[CF_ANSI_CC_REQD])
@@ -36,20 +39,20 @@ index 1c6a3ee..2f7e9b5 100644
  dnl ---------------------------------------------------------------------------
  dnl CF_PROG_GROFF version: 3 updated: 2018/01/07 13:16:19
 diff --git a/configure b/configure
-index 378f27d..8f40229 100755
+index 5b98a03..e3a4237 100755
 --- a/configure
 +++ b/configure
-@@ -2066,265 +2066,6 @@ esac
+@@ -2146,265 +2146,6 @@ esac
  # This should have been defined by AC_PROG_CC
- : ${CC:=cc}
+ : "${CC:=cc}"
  
--echo "$as_me:2069: checking \$CFLAGS variable" >&5
+-echo "$as_me:2149: checking \$CFLAGS variable" >&5
 -echo $ECHO_N "checking \$CFLAGS variable... $ECHO_C" >&6
 -case "x$CFLAGS" in
 -(*-[IUD]*)
--	echo "$as_me:2073: result: broken" >&5
+-	echo "$as_me:2153: result: broken" >&5
 -echo "${ECHO_T}broken" >&6
--	{ echo "$as_me:2075: WARNING: your environment uses the CFLAGS variable to hold CPPFLAGS options" >&5
+-	{ echo "$as_me:2155: WARNING: your environment uses the CFLAGS variable to hold CPPFLAGS options" >&5
 -echo "$as_me: WARNING: your environment uses the CFLAGS variable to hold CPPFLAGS options" >&2;}
 -	cf_flags="$CFLAGS"
 -	CFLAGS=
@@ -63,19 +66,19 @@ index 378f27d..8f40229 100755
 -
 -for cf_add_cflags in $cf_arg
 -do
--case $cf_fix_cppflags in
+-case "$cf_fix_cppflags" in
 -(no)
--	case $cf_add_cflags in
+-	case "$cf_add_cflags" in
 -	(-undef|-nostdinc*|-I*|-D*|-U*|-E|-P|-C)
--		case $cf_add_cflags in
+-		case "$cf_add_cflags" in
 -		(-D*)
--			cf_tst_cflags=`echo ${cf_add_cflags} |sed -e 's/^-D[^=]*='\''\"[^"]*//'`
+-			cf_tst_cflags=`echo "${cf_add_cflags}" |sed -e 's/^-D[^=]*='\''\"[^"]*//'`
 -
 -			test "x${cf_add_cflags}" != "x${cf_tst_cflags}" \
 -				&& test -z "${cf_tst_cflags}" \
 -				&& cf_fix_cppflags=yes
 -
--			if test $cf_fix_cppflags = yes ; then
+-			if test "$cf_fix_cppflags" = yes ; then
 -
 -	test -n "$cf_new_extra_cppflags" && cf_new_extra_cppflags="$cf_new_extra_cppflags "
 -	cf_new_extra_cppflags="${cf_new_extra_cppflags}$cf_add_cflags"
@@ -94,7 +97,7 @@ index 378f27d..8f40229 100755
 -		(*$cf_add_cflags)
 -			;;
 -		(*)
--			case $cf_add_cflags in
+-			case "$cf_add_cflags" in
 -			(-D*)
 -				cf_tst_cppflags=`echo "x$cf_add_cflags" | sed -e 's/^...//' -e 's/=.*//'`
 -
@@ -124,7 +127,7 @@ index 378f27d..8f40229 100755
 -	test -n "$cf_new_extra_cppflags" && cf_new_extra_cppflags="$cf_new_extra_cppflags "
 -	cf_new_extra_cppflags="${cf_new_extra_cppflags}$cf_add_cflags"
 -
--	cf_tst_cflags=`echo ${cf_add_cflags} |sed -e 's/^[^"]*"'\''//'`
+-	cf_tst_cflags=`echo "${cf_add_cflags}" |sed -e 's/^[^"]*"'\''//'`
 -
 -	test "x${cf_add_cflags}" != "x${cf_tst_cflags}" \
 -		&& test -z "${cf_tst_cflags}" \
@@ -157,18 +160,18 @@ index 378f27d..8f40229 100755
 -	done
 -	;;
 -(*)
--	echo "$as_me:2183: result: ok" >&5
+-	echo "$as_me:2263: result: ok" >&5
 -echo "${ECHO_T}ok" >&6
 -	;;
 -esac
 -
--echo "$as_me:2188: checking \$CC variable" >&5
+-echo "$as_me:2268: checking \$CC variable" >&5
 -echo $ECHO_N "checking \$CC variable... $ECHO_C" >&6
 -case "$CC" in
 -(*[\ \	]-*)
--	echo "$as_me:2192: result: broken" >&5
+-	echo "$as_me:2272: result: broken" >&5
 -echo "${ECHO_T}broken" >&6
--	{ echo "$as_me:2194: WARNING: your environment uses the CC variable to hold CFLAGS/CPPFLAGS options" >&5
+-	{ echo "$as_me:2274: WARNING: your environment uses the CC variable to hold CFLAGS/CPPFLAGS options" >&5
 -echo "$as_me: WARNING: your environment uses the CC variable to hold CFLAGS/CPPFLAGS options" >&2;}
 -	# humor him...
 -	cf_prog=`echo "$CC" | sed -e 's/	/ /g' -e 's/[ ]* / /g' -e 's/[ ]*[ ]-[^ ].*//'`
@@ -186,19 +189,19 @@ index 378f27d..8f40229 100755
 -
 -for cf_add_cflags in $cf_arg
 -do
--case $cf_fix_cppflags in
+-case "$cf_fix_cppflags" in
 -(no)
--	case $cf_add_cflags in
+-	case "$cf_add_cflags" in
 -	(-undef|-nostdinc*|-I*|-D*|-U*|-E|-P|-C)
--		case $cf_add_cflags in
+-		case "$cf_add_cflags" in
 -		(-D*)
--			cf_tst_cflags=`echo ${cf_add_cflags} |sed -e 's/^-D[^=]*='\''\"[^"]*//'`
+-			cf_tst_cflags=`echo "${cf_add_cflags}" |sed -e 's/^-D[^=]*='\''\"[^"]*//'`
 -
 -			test "x${cf_add_cflags}" != "x${cf_tst_cflags}" \
 -				&& test -z "${cf_tst_cflags}" \
 -				&& cf_fix_cppflags=yes
 -
--			if test $cf_fix_cppflags = yes ; then
+-			if test "$cf_fix_cppflags" = yes ; then
 -
 -	test -n "$cf_new_extra_cppflags" && cf_new_extra_cppflags="$cf_new_extra_cppflags "
 -	cf_new_extra_cppflags="${cf_new_extra_cppflags}$cf_add_cflags"
@@ -217,7 +220,7 @@ index 378f27d..8f40229 100755
 -		(*$cf_add_cflags)
 -			;;
 -		(*)
--			case $cf_add_cflags in
+-			case "$cf_add_cflags" in
 -			(-D*)
 -				cf_tst_cppflags=`echo "x$cf_add_cflags" | sed -e 's/^...//' -e 's/=.*//'`
 -
@@ -247,7 +250,7 @@ index 378f27d..8f40229 100755
 -	test -n "$cf_new_extra_cppflags" && cf_new_extra_cppflags="$cf_new_extra_cppflags "
 -	cf_new_extra_cppflags="${cf_new_extra_cppflags}$cf_add_cflags"
 -
--	cf_tst_cflags=`echo ${cf_add_cflags} |sed -e 's/^[^"]*"'\''//'`
+-	cf_tst_cflags=`echo "${cf_add_cflags}" |sed -e 's/^[^"]*"'\''//'`
 -
 -	test "x${cf_add_cflags}" != "x${cf_tst_cflags}" \
 -		&& test -z "${cf_tst_cflags}" \
@@ -285,24 +288,24 @@ index 378f27d..8f40229 100755
 -	done
 -	test -n "$verbose" && echo "	resulting CC: '$CC'" 1>&6
 -
--echo "${as_me:-configure}:2311: testing resulting CC: '$CC' ..." 1>&5
+-echo "${as_me:-configure}:2391: testing resulting CC: '$CC' ..." 1>&5
 -
 -	test -n "$verbose" && echo "	resulting CFLAGS: '$CFLAGS'" 1>&6
 -
--echo "${as_me:-configure}:2315: testing resulting CFLAGS: '$CFLAGS' ..." 1>&5
+-echo "${as_me:-configure}:2395: testing resulting CFLAGS: '$CFLAGS' ..." 1>&5
 -
 -	test -n "$verbose" && echo "	resulting CPPFLAGS: '$CPPFLAGS'" 1>&6
 -
--echo "${as_me:-configure}:2319: testing resulting CPPFLAGS: '$CPPFLAGS' ..." 1>&5
+-echo "${as_me:-configure}:2399: testing resulting CPPFLAGS: '$CPPFLAGS' ..." 1>&5
 -
 -	;;
 -(*)
--	echo "$as_me:2323: result: ok" >&5
+-	echo "$as_me:2403: result: ok" >&5
 -echo "${ECHO_T}ok" >&6
 -	;;
 -esac
 -
- echo "$as_me:2328: checking whether ${MAKE-make} sets \${MAKE}" >&5
+ echo "$as_me:2408: checking whether ${MAKE-make} sets \${MAKE}" >&5
  echo $ECHO_N "checking whether ${MAKE-make} sets \${MAKE}... $ECHO_C" >&6
  set dummy ${MAKE-make}; ac_make=`echo "$2" | sed 'y,./+-,__p_,'`
 -- 
diff --git a/meta-oe/recipes-extended/byacc/byacc_20200910.bb b/meta-oe/recipes-extended/byacc/byacc_20210808.bb
similarity index 58%
rename from meta-oe/recipes-extended/byacc/byacc_20200910.bb
rename to meta-oe/recipes-extended/byacc/byacc_20210808.bb
index b7640ffca6..eeed39f633 100644
--- a/meta-oe/recipes-extended/byacc/byacc_20200910.bb
+++ b/meta-oe/recipes-extended/byacc/byacc_20210808.bb
@@ -4,8 +4,7 @@
 # Setting to PD as this is what the upstream has it as.
 
 LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=262857ec5923f073fa06a1f1812225ea"
+LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=80ce98c6ab91cc4a93a9d2cfb7c14463"
 require byacc.inc
 
-SRC_URI[md5sum] = "5726a5a655c6fd4e8f950552cceeae29"
-SRC_URI[sha256sum] = "0a5906073aeaf23ddc20aaac0ea61cb5ccc18572870b113375dec4ffe85ecf30"
+SRC_URI[sha256sum] = "f158529be9d0594263c7f11a87616a49ea23e55ac63691252a2304fbbc7d3a83"
-- 
2.25.1

